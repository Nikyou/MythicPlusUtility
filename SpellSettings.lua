local L = LibStub("AceLocale-3.0"):GetLocale("MythicPlusUtility")
local LibDeflate = LibStub("LibDeflate")
local Variables = MythicPlusUtility.Variables
local containers = Variables.spellContainers

local SpellSettings = {}
MythicPlusUtility.SpellSettings = SpellSettings

local NOTICE_MAX_LINES = 12
local LOGO_SIZE = 50
local LOGO_X_OFFSET = 0
local LOGO_Y_OFFSET = 2

local recordFields = {
    overrides = {
        active = "boolean",
        enabled = "boolean",
        changeTags = "boolean",
        baseline = "boolean",
        fingerprint = "string",
        override = "spellId",
        alternatives = "spellList",
        tags = "tags",
    },
    custom = {
        enabled = "boolean",
        baseline = "boolean",
        pet = "boolean",
        acknowledged = "boolean",
        override = "spellId",
        alternatives = "spellList",
        tags = "tags",
    },
}

local function IsSpellId(value) return type(value) == "number" and value > 0 and value == math.floor(value) end

-- Defaults
function MythicPlusUtility:GetDefaultAbilities(container)
    if container == containers.racial then return self.utilityAbilitiesRacials end
    if container == containers.profession then return self.utilityAbilitiesProfessions end
    return self.utilityAbilities[container]
end

function MythicPlusUtility:GetSpecClass(specId)
    for class, specs in pairs(self.classSpecialisations) do if specs[specId] then return class end end
end

function MythicPlusUtility:IsValidSpellContainer(container, isCustom)
    if self.classSpecialisations[container] then return true end
    if type(container) == "number" then return self:GetSpecClass(container) ~= nil end
    if isCustom then return container == containers.allClasses end
    return container == containers.racial or container == containers.profession
end

function MythicPlusUtility:ClassHasDefaultSpell(class, spellId, specId)
    if self.utilityAbilities[class][spellId] then return true end
    for classSpecId, _ in pairs(self.classSpecialisations[class]) do
        local abilities = self.utilityAbilities[classSpecId]
        if (not specId or specId == classSpecId) and abilities and abilities[spellId] then return true end
    end
    return false
end

function MythicPlusUtility:IsDefaultSpell(container, spellId)
    if self.utilityAbilitiesRacials[spellId] or self.utilityAbilitiesProfessions[spellId] then return true end

    if container == containers.allClasses then
        for class, _ in pairs(self.classSpecialisations) do if self:ClassHasDefaultSpell(class, spellId) then return true end end
        return false
    end

    local class = self:GetSpecClass(container)
    if class then return self:ClassHasDefaultSpell(class, spellId, container) end
    return self:ClassHasDefaultSpell(container, spellId)
end

function MythicPlusUtility:GetSpellFingerprint(data)
    local tags = {}
    for tag, _ in pairs(self:ParseTags(data.tags)) do table.insert(tags, tag) end
    table.sort(tags)

    return format("%s|%s|%s|%s", table.concat(tags, ","), data.override or "", table.concat(data.alternatives or {}, ","),
                  data.baseline and 1 or 0)
end

-- Effective Abilities
function MythicPlusUtility:CreateEffectiveEntry(spellId, data, record)
    local entry = {
        spellId = spellId,
        tagsTable = self:ParseTags(data.tags),
        override = data.override,
        alternatives = data.alternatives,
        baseline = data.baseline,
        pet = data.pet,
        racial = data.racial,
        profession = data.profession,
    }

    if record and record.active then
        if record.changeTags and record.tags then
            for tag, value in pairs(record.tags) do entry.tagsTable[tag] = value or nil end
        end
        entry.override = record.override or entry.override
        entry.alternatives = record.alternatives or entry.alternatives
        if record.baseline ~= nil then entry.baseline = record.baseline end
    end

    return entry
end

function MythicPlusUtility:CreateCustomEntry(spellId, record)
    local entry = {
        spellId = spellId,
        tagsTable = {},
        override = record.override,
        alternatives = record.alternatives,
        baseline = record.baseline,
        pet = record.pet,
        custom = true,
    }
    if record.tags then for tag, value in pairs(record.tags) do entry.tagsTable[tag] = value or nil end end

    return entry
end

function MythicPlusUtility:BuildEffectiveAbilities()
    local class = self.db.char.class
    local spellSettings = self.db.profile.spellSettings
    local effectiveAbilities = {}

    local function addDefaults(container)
        local abilities = {}
        local overrides = spellSettings.overrides[container] or {}

        for spellId, data in pairs(self:GetDefaultAbilities(container) or {}) do
            local record = overrides[spellId]
            if not (record and record.active and record.enabled == false) then
                abilities[spellId] = self:CreateEffectiveEntry(spellId, data, record)
            end
        end
        effectiveAbilities[container] = abilities
    end

    local function addCustom(container, target)
        local defaults = self:GetDefaultAbilities(target)
        for spellId, record in pairs(spellSettings.custom[container] or {}) do
            if record.enabled ~= false and not defaults[spellId] and not effectiveAbilities[target][spellId] then
                effectiveAbilities[target][spellId] = self:CreateCustomEntry(spellId, record)
            end
        end
    end

    addDefaults(class)
    for specId, _ in pairs(self.classSpecialisations[class]) do addDefaults(specId) end
    addDefaults(containers.racial)
    addDefaults(containers.profession)

    addCustom(class, class)
    for specId, _ in pairs(self.classSpecialisations[class]) do addCustom(specId, specId) end
    addCustom(containers.allClasses, class)

    self.effectiveAbilities = effectiveAbilities
    self:ExtractSpellsFromDB()
end

function MythicPlusUtility:UpdateSpellSettings()
    self:BuildEffectiveAbilities()
    if self.currentAbilitiesList then self:CreateCurrentAbilitiesList() end
    if self.Frame then
        self.Frame:ChangeInstance()
    else
        self.TalentFrameHighlight:Refresh()
    end
end

-- Overrides
function MythicPlusUtility:GetSpellOverride(container, spellId, create)
    local overrides = self.db.profile.spellSettings.overrides

    if create then
        overrides[container] = overrides[container] or {}
        overrides[container][spellId] = overrides[container][spellId] or {}
    end
    return overrides[container] and overrides[container][spellId]
end

function MythicPlusUtility:CleanSpellOverride(container, spellId)
    local overrides = self.db.profile.spellSettings.overrides
    local record = overrides[container] and overrides[container][spellId]
    if not record then return end

    if record.tags and not next(record.tags) then record.tags = nil end

    local hasValues = false
    for key, _ in pairs(record) do
        if key ~= "fingerprint" then
            hasValues = true
            break
        end
    end
    if not hasValues then overrides[container][spellId] = nil end
    if not next(overrides[container]) then overrides[container] = nil end
end

function MythicPlusUtility:SetSpellOverrideValue(container, spellId, key, value)
    local record = self:GetSpellOverride(container, spellId, true)
    record[key] = value
    record.fingerprint = self:GetSpellFingerprint(self:GetDefaultAbilities(container)[spellId])

    self:CleanSpellOverride(container, spellId)
    self:UpdateSpellSettings()
end

function MythicPlusUtility:SetSpellOverrideTag(container, spellId, tag, value)
    local record = self:GetSpellOverride(container, spellId, true)
    record.tags = record.tags or {}
    record.tags[tag] = value
    record.fingerprint = self:GetSpellFingerprint(self:GetDefaultAbilities(container)[spellId])

    self:CleanSpellOverride(container, spellId)
    self:UpdateSpellSettings()
end

function MythicPlusUtility:ResetSpellOverride(container, spellId)
    local record = self:GetSpellOverride(container, spellId)
    if not record then return end

    local active = record.active
    wipe(record)
    record.active = active
    record.fingerprint = self:GetSpellFingerprint(self:GetDefaultAbilities(container)[spellId])

    self:CleanSpellOverride(container, spellId)
    self:UpdateSpellSettings()
end

function MythicPlusUtility:ResetSpellOverrides(containerList)
    local overrides = self.db.profile.spellSettings.overrides
    for _, container in ipairs(containerList) do overrides[container] = nil end
    self:UpdateSpellSettings()
end

-- Custom Abilities
function MythicPlusUtility:GetCustomAbility(container, spellId)
    local custom = self.db.profile.spellSettings.custom
    return custom[container] and custom[container][spellId]
end

function MythicPlusUtility:AddCustomAbility(container, spellId)
    local custom = self.db.profile.spellSettings.custom
    custom[container] = custom[container] or {}
    custom[container][spellId] = {tags = {}, acknowledged = self:IsDefaultSpell(container, spellId) or nil}

    self:GetSpellNameById(spellId)
    self:GetSpellIconById(spellId)
    self:UpdateSpellSettings()
end

function MythicPlusUtility:DeleteCustomAbility(container, spellId)
    local custom = self.db.profile.spellSettings.custom
    if not custom[container] then return end

    custom[container][spellId] = nil
    if not next(custom[container]) then custom[container] = nil end
    self:UpdateSpellSettings()
end

function MythicPlusUtility:SetCustomAbilityValue(container, spellId, key, value)
    local record = self:GetCustomAbility(container, spellId)
    if not record then return end

    record[key] = value
    self:UpdateSpellSettings()
end

function MythicPlusUtility:SetCustomAbilityTag(container, spellId, tag, value)
    local record = self:GetCustomAbility(container, spellId)
    if not record then return end

    record.tags = record.tags or {}
    record.tags[tag] = value
    self:UpdateSpellSettings()
end

function MythicPlusUtility:ResetCustomAbilities(containerList)
    local custom = self.db.profile.spellSettings.custom
    for _, container in ipairs(containerList) do custom[container] = nil end
    self:UpdateSpellSettings()
end

-- Validation
local function SanitizeValue(valueType, value)
    if valueType == "boolean" or valueType == "string" then
        if type(value) == valueType then return value, 0 end
        return nil, 1
    elseif valueType == "spellId" then
        if IsSpellId(value) then return value, 0 end
        return nil, 1
    elseif valueType == "spellList" then
        if type(value) ~= "table" then return nil, 1 end
        local list, dropped = {}, 0
        for _, spellId in pairs(value) do
            if IsSpellId(spellId) then
                table.insert(list, spellId)
            else
                dropped = dropped + 1
            end
        end
        return #list > 0 and list or nil, dropped
    elseif valueType == "tags" then
        if type(value) ~= "table" then return nil, 1 end
        local tags, dropped = {}, 0
        for tag, state in pairs(value) do
            if Variables.supportedTags[tag] and type(state) == "boolean" then
                tags[tag] = state
            else
                dropped = dropped + 1
            end
        end
        return tags, dropped
    end
    return nil, 1
end

local function SanitizeRecord(record, fields)
    if type(record) ~= "table" then return nil, 1 end

    local clean, dropped = {}, 0
    for key, value in pairs(record) do
        if fields[key] then
            local cleanValue, droppedValues = SanitizeValue(fields[key], value)
            clean[key] = cleanValue
            dropped = dropped + droppedValues
        else
            dropped = dropped + 1
        end
    end

    return clean, dropped
end

function MythicPlusUtility:SanitizeSpellSettings(data)
    local spellSettings = {overrides = {}, custom = {}}
    local dropped = 0
    if type(data) ~= "table" then return spellSettings, 0 end

    for _, kind in ipairs({"overrides", "custom"}) do
        local isCustom = kind == "custom"

        if data[kind] ~= nil and type(data[kind]) ~= "table" then
            dropped = dropped + 1
        else
            for container, records in pairs(data[kind] or {}) do
                if not self:IsValidSpellContainer(container, isCustom) or type(records) ~= "table" then
                    dropped = dropped + 1
                else
                    local defaults = self:GetDefaultAbilities(container)
                    local cleanRecords = {}

                    for spellId, record in pairs(records) do
                        if not IsSpellId(spellId) or (not isCustom and not (defaults and defaults[spellId])) then
                            dropped = dropped + 1
                        else
                            local clean, droppedValues = SanitizeRecord(record, recordFields[kind])
                            dropped = dropped + droppedValues
                            if clean then
                                if not isCustom and not clean.fingerprint then
                                    clean.fingerprint = self:GetSpellFingerprint(defaults[spellId])
                                end
                                cleanRecords[spellId] = clean
                            end
                        end
                    end

                    if next(cleanRecords) then spellSettings[kind][container] = cleanRecords end
                end
            end
        end
    end

    return spellSettings, dropped
end

local function CountRecords(spellSettings, kind)
    local count = 0
    for _, records in pairs(spellSettings[kind]) do for _, _ in pairs(records) do count = count + 1 end end
    return count
end

-- Import / Export
SpellSettings.exportString = ""
SpellSettings.messageText = ""

function SpellSettings:GenerateExport()
    local exportData = {
        spellSettings = MythicPlusUtility.db.profile.spellSettings,
        meta = {addon = "MythicPlusUtility", type = "spellSettings", version = 1},
    }
    local serialized = MythicPlusUtility:Serialize(exportData)
    local compressed = LibDeflate:CompressDeflate(serialized, {level = 9})

    self.exportString = LibDeflate:EncodeForPrint(compressed)
end

function SpellSettings:ParseImport(importString)
    self.pendingImport = nil
    self.messageText = ""

    local decoded = LibDeflate:DecodeForPrint(importString)
    if not decoded then
        self.messageText = L["|cffff4040Invalid encoded string.|r"]
        return
    end

    local decompressed = LibDeflate:DecompressDeflate(decoded)
    if not decompressed then
        self.messageText = L["|cffff4040Decompression failed.|r"]
        return
    end

    local success, data = MythicPlusUtility:Deserialize(decompressed)
    if not success or type(data) ~= "table" then
        self.messageText = L["|cffff4040Invalid serialised data.|r"]
        return
    end

    local meta = data.meta
    if type(meta) ~= "table" or meta.addon ~= "MythicPlusUtility" or meta.type ~= "spellSettings" then
        self.messageText = L["|cffff4040Not an Ability Settings string.|r"]
        return
    end

    if type(data.spellSettings) ~= "table" then
        self.messageText = L["|cffff4040Missing ability settings data.|r"]
        return
    end

    local spellSettings, dropped = MythicPlusUtility:SanitizeSpellSettings(data.spellSettings)
    self.pendingImport = {spellSettings = spellSettings, dropped = dropped}
    self.messageText = self:GetImportSummary(L["Ready to import %d customised abilities and %d custom abilities."])
end

function SpellSettings:GetImportSummary(text)
    local pending = self.pendingImport
    local summary = format(text, CountRecords(pending.spellSettings, "overrides"), CountRecords(pending.spellSettings, "custom"))
    if pending.dropped > 0 then summary = summary .. "\n" .. format(L["%d invalid entries were dropped."], pending.dropped) end
    return summary
end

function SpellSettings:ApplyImport(replace)
    local pending = self.pendingImport
    if not pending then return end

    local spellSettings = MythicPlusUtility.db.profile.spellSettings
    if replace then
        spellSettings.overrides = pending.spellSettings.overrides
        spellSettings.custom = pending.spellSettings.custom
    else
        for _, kind in ipairs({"overrides", "custom"}) do
            for container, records in pairs(pending.spellSettings[kind]) do
                spellSettings[kind][container] = spellSettings[kind][container] or {}
                for spellId, record in pairs(records) do spellSettings[kind][container][spellId] = record end
            end
        end
    end

    local summary = self:GetImportSummary(L["Imported %d customised abilities and %d custom abilities."])
    self.messageText = "|cff40ff40" .. summary .. "|r"
    self.pendingImport = nil

    MythicPlusUtility:UpdateSpellSettings()
    self:RefreshOptions()
end

-- Change Notifications
function MythicPlusUtility:GetSpellSettingsChanges()
    local changes = {}
    local spellSettings = self.db.profile.spellSettings

    for container, records in pairs(spellSettings.overrides) do
        local defaults = self:GetDefaultAbilities(container)
        for spellId, record in pairs(records) do
            local data = defaults and defaults[spellId]
            if record.active and data and record.fingerprint ~= self:GetSpellFingerprint(data) then
                table.insert(changes, {container = container, spellId = spellId, record = record})
            end
        end
    end

    for container, records in pairs(spellSettings.custom) do
        for spellId, record in pairs(records) do
            if not record.acknowledged and self:IsDefaultSpell(container, spellId) then
                table.insert(changes, {container = container, spellId = spellId, record = record, isCustom = true})
            end
        end
    end

    return changes
end

function SpellSettings:CheckDefaultChanges()
    if self.noticeChecked then return end
    self.noticeChecked = true

    local changes = MythicPlusUtility:GetSpellSettingsChanges()
    if #changes == 0 then return end

    self.changes = changes
    self:ShowNotice()
end

function SpellSettings:DismissNotice()
    for _, change in ipairs(self.changes or {}) do
        if change.isCustom then
            change.record.acknowledged = true
        else
            local data = MythicPlusUtility:GetDefaultAbilities(change.container)[change.spellId]
            change.record.fingerprint = MythicPlusUtility:GetSpellFingerprint(data)
        end
    end

    self.changes = nil
    if self.noticeFrame then
        self.noticeFrame:UnregisterAllEvents()
        self.noticeFrame:Hide()
    end
end

function SpellSettings:SetPortraitLogo(frame)
    local portrait = frame:GetPortrait()
    portrait:SetColorTexture(0, 0, 0)

    local logo = frame.PortraitContainer:CreateTexture(nil, "OVERLAY", nil, 1)
    logo:SetTexture("Interface/AddOns/MythicPlusUtility/logo")
    logo:SetSize(LOGO_SIZE, LOGO_SIZE)
    logo:SetPoint("CENTER", portrait, "CENTER", LOGO_X_OFFSET, LOGO_Y_OFFSET)
end

function SpellSettings:CreateNoticeFrame()
    local frame = CreateFrame("Frame", "MythicPlusUtility_SpellSettingsNotice", UIParent, "PortraitFrameTemplate")
    frame:SetWidth(420)
    frame:SetPoint("TOP", 0, -120)
    frame:SetFrameStrata("DIALOG")
    frame:SetToplevel(true)
    frame:EnableMouse(true)
    frame:SetMovable(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", frame.StartMoving)
    frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
    self:SetPortraitLogo(frame)
    frame:SetTitle("Mythic Plus Utility")
    frame.onCloseCallback = function()
        SpellSettings:DismissNotice()
        return false
    end

    frame:SetScript("OnEvent", function(self, event)
        if event == "PLAYER_REGEN_DISABLED" then
            self:Hide()
        elseif SpellSettings.changes then
            self:Show()
        end
    end)

    local header = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    header:SetPoint("TOPLEFT", 70, -32)
    header:SetPoint("RIGHT", -16, 0)
    header:SetJustifyH("LEFT")
    header:SetText(L["Some of your ability settings need your attention:"])
    frame.header = header
    frame.lines = {}

    local button = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    button:SetSize(180, 22)
    button:SetPoint("BOTTOM", 0, 14)
    button:SetText(L["Open Ability Settings"])
    button:SetScript("OnClick", function()
        SpellSettings:DismissNotice()
        MythicPlusUtility:OpenSettings(InCombatLockdown(), MythicPlusUtility.spellSettingsFrame)
    end)

    self.noticeFrame = frame
    return frame
end

function SpellSettings:GetNoticeLine(frame, index)
    if frame.lines[index] then return frame.lines[index] end

    local line = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    line:SetJustifyH("LEFT")
    line.icon = frame:CreateTexture(nil, "OVERLAY")
    line.icon:SetSize(18, 18)
    line.icon:SetPoint("RIGHT", line, "LEFT", -6, 0)
    frame.lines[index] = line
    return line
end

function SpellSettings:ShowNotice()
    local frame = self.noticeFrame or self:CreateNoticeFrame()
    local count = math.min(#self.changes, NOTICE_MAX_LINES + 1)
    local height = 70

    for i = 1, count do
        local line = self:GetNoticeLine(frame, i)
        local change = self.changes[i]

        line:ClearAllPoints()
        line:SetPoint("TOPLEFT", 40, -height)
        line:SetPoint("RIGHT", -16, 0)
        if i > NOTICE_MAX_LINES then
            line:SetText(format(L["...and %d more"], #self.changes - NOTICE_MAX_LINES))
            line.icon:Hide()
        else
            local reason = change.isCustom and L["custom ability is now a default ability, customise the default ability instead"]
                             or L["default settings were updated"]
            line:SetText(format("%s (%s): %s", MythicPlusUtility:GetSpellNameById(change.spellId),
                                self:GetContainerName(change.container), reason))
            line.icon:SetTexture(MythicPlusUtility:GetSpellIconById(change.spellId))
            line.icon:Show()
        end
        line:Show()
        height = height + math.max(line:GetStringHeight(), 18) + 6
    end
    for i = count + 1, #frame.lines do
        frame.lines[i]:Hide()
        frame.lines[i].icon:Hide()
    end

    frame:SetHeight(height + 50)
    frame:RegisterEvent("PLAYER_REGEN_DISABLED")
    frame:RegisterEvent("PLAYER_REGEN_ENABLED")
    frame:SetShown(not InCombatLockdown())
end
