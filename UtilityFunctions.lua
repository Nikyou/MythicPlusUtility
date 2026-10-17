local Variables = MythicPlusUtility.Variables

function MythicPlusUtility:GetbuttonsIndices()
    if self.db.profile.buttonCosmetic.unlearnAbility.enabled then
        return self.buttonsIndicesWithEmpty
    else
        return self.buttonsIndices
    end
end

function MythicPlusUtility:InitializeFrames() self.Frame = self:UtilityAbilitiesFrame() end

function MythicPlusUtility:IsSpellKnownHandler(spellId, isPet)
    if isPet then return C_SpellBook.IsSpellInSpellBook(spellId, Enum.SpellBookSpellBank.Pet) end
    return C_SpellBook.IsSpellKnown(spellId)
end

function MythicPlusUtility:UpdateKnownState(entry)
    entry.isKnown = false
    entry.altSpellId = nil

    if entry.alternatives then
        for _, subSpellId in ipairs(entry.alternatives) do
            if self:IsSpellKnownHandler(subSpellId, entry.pet) then
                entry.isKnown = true
                entry.altSpellId = subSpellId
                break
            end
        end
    end
    if not entry.isKnown then entry.isKnown = self:IsSpellKnownHandler(entry.spellId, entry.pet) end

    entry.spellName = self:GetSpellNameById(entry.altSpellId or entry.spellId)
end

function MythicPlusUtility:ParseTags(tags, withImportance)
    local tagsTable = {}

    for tag in string.gmatch(tags or "", "%[([^%[%]]+)%]") do
        if Variables.supportedTags[tag] then
            tagsTable[tag] = true
        elseif withImportance and tag == "important" then
            tagsTable.important = true
        elseif withImportance and tag == "super_important" then
            tagsTable.super_important = true
            tagsTable.important = true
        end
    end

    return tagsTable
end

function MythicPlusUtility:GetSpellNameById(spellId)
    local db = self.db.locale
    if db.spellIdToName[spellId] and db.spellIdToName[spellId] ~= "" then
        return db.spellIdToName[spellId]
    else
        local spellInfo = C_Spell.GetSpellInfo(spellId)
        if spellInfo and spellInfo.name then
            db.spellIdToName[spellId] = spellInfo.name
            return spellInfo.name
        end
    end
    return ""
end

function MythicPlusUtility:GetSpellIconById(spellId)
    local db = self.db.locale
    if db.spellIdToIconId[spellId] and db.spellIdToIconId[spellId] ~= "" then
        return db.spellIdToIconId[spellId]
    else
        local spellInfo = C_Spell.GetSpellInfo(spellId)
        if spellInfo and spellInfo.originalIconID then
            db.spellIdToIconId[spellId] = spellInfo.originalIconID
            return spellInfo.originalIconID
        end
    end
    return ""
end

function MythicPlusUtility:GetSpellHyperlinkById(spellId)
    local db = self.db.locale
    if (db.spellIdToHyperlink[spellId]) and (not string.find(db.spellIdToHyperlink[spellId], ":0|h%[%]|h")) then
        return db.spellIdToHyperlink[spellId]
    else
        local spellName = self:GetSpellNameById(spellId)
        if spellName and spellName ~= "" then
            db.spellIdToHyperlink[spellId] = format("|cff71d5ff|Hspell:%s:0|h[%s]|h|r", spellId, spellName)
            return db.spellIdToHyperlink[spellId]
        end
    end
    return ""
end

function MythicPlusUtility:IconToChatIcon(iconId) return format("|T%s:0:0:0:0|t", iconId) end

function MythicPlusUtility:GetNpcNameById(npcId)
    local db = self.db.locale
    local name = db.npcIdToName[npcId]
    if name and (issecretvalue(name) or name ~= "") then
        return name
    elseif Variables.npcIdToEncounterSectionId[npcId] then
        name = ""
        local info = C_EncounterJournal.GetSectionInfo(Variables.npcIdToEncounterSectionId[npcId])
        if info and info.title then name = info.title end
        db.npcIdToName[npcId] = name

        return name
    else
        local guid = format("Creature-0-0-0-0-%s-0", npcId)
        local tooltipData = C_TooltipInfo.GetHyperlink(format("unit:%s", guid))
        if tooltipData then
            name = ""
            for _, line in pairs(tooltipData.lines) do
                if line.type == Enum.TooltipDataLineType.UnitName then
                    name = line.leftText;
                    break
                end
            end
            if issecretvalue(name) then return "" end
            db.npcIdToName[npcId] = name
            return name
        end
    end
    return ""
end

function MythicPlusUtility:GetZoneNameByInstanceId(instanceID)
    local db = self.db.locale
    if db.instanceIDToZoneName[instanceID] and db.instanceIDToZoneName[instanceID] ~= "" then
        return db.instanceIDToZoneName[instanceID]
    else
        local zoneName = GetRealZoneText(instanceID)
        if zoneName then
            db.instanceIDToZoneName[instanceID] = zoneName
            return zoneName
        end
    end
    return ""
end

function MythicPlusUtility:GetNpcHyperlinkById(npcId)
    local db = self.db.locale
    local hyperlink = db.npcIdToHyperlink[npcId]
    if hyperlink and not issecretvalue(hyperlink) and not string.find(hyperlink, "|h%[%]|h|r") then
        return hyperlink
    else
        local npcName = self:GetNpcNameById(npcId)
        if npcName and not issecretvalue(npcName) then
            db.npcIdToHyperlink[npcId] = format("|cffffd100|Hunit:Creature-0-0-0-0-%s-0:%s|h[%s]|h|r", npcId, npcName, npcName)
            return db.npcIdToHyperlink[npcId]
        end
    end
    return ""
end

local function ExtractIds(text, idType)
    local ids = {}
    for id in string.gmatch(text, "{" .. idType .. ":(%d+)}") do ids[tonumber(id)] = true end
    return ids
end

function MythicPlusUtility:ForEachInstanceEntry(instanceID, func)
    if not instanceID then
        for _, instance in pairs(self.instancesData) do for _, entry in pairs(instance) do func(entry) end end
    else
        for _, entry in pairs(self.instancesData[instanceID]) do func(entry) end
    end
end

function MythicPlusUtility:ExtractInstanceData(instanceID)
    self:ForEachInstanceEntry(instanceID, function(entry)
        entry.spellIds = ExtractIds(entry.text, "spell")
        entry.npcIds = ExtractIds(entry.text, "npc")
        entry.tagsTable = self:ParseTags(entry.tags, true)

        for spellId, _ in pairs(entry.spellIds) do
            self:GetSpellNameById(spellId)
            self:GetSpellIconById(spellId)
        end
        for npcId, _ in pairs(entry.npcIds) do self:GetNpcNameById(npcId) end
    end)
end

function MythicPlusUtility:FormatInstanceDataString(instanceID)
    self:ForEachInstanceEntry(instanceID, function(entry)
        entry.formattedText = entry.text

        for spellId, _ in pairs(entry.spellIds) do
            entry.formattedText = string.gsub(entry.formattedText, "{spell:" .. spellId .. "}", self:IconToChatIcon(
                                                self:GetSpellIconById(spellId)) .. self:GetSpellHyperlinkById(spellId))
        end
        for npcId, _ in pairs(entry.npcIds) do
            entry.formattedText = string.gsub(entry.formattedText, "{npc:" .. npcId .. "}", self:GetNpcHyperlinkById(npcId))
        end
        if not entry.tagsTable.important then
            entry.formattedText = CreateAtlasMarkup("map-icon-ignored-bluequestion") .. entry.formattedText
        end

        if entry.tagsTable.super_important then
            entry.formattedText = CreateAtlasMarkup("QuestNormal") .. entry.formattedText
        end
    end)
end

function MythicPlusUtility:FormatInstanceData(instanceID)
    self:ExtractInstanceData(instanceID)

    local myTimer = C_Timer.NewTimer(0.5, function(self) MythicPlusUtility:FormatInstanceDataString(self.instanceID) end)
    myTimer.instanceID = instanceID
end

function MythicPlusUtility:SortCurrentAbilitiesList()
    local sortBy = MythicPlusUtility.db.profile.textAndIcon.icon.sortBy

    if sortBy == "alpAsc" then
        table.sort(self.currentAbilitiesList, function(a, b) return a.spellName < b.spellName end)
    elseif sortBy == "alpDes" then
        table.sort(self.currentAbilitiesList, function(a, b) return a.spellName > b.spellName end)
    elseif sortBy == "typeAsc" then
        table.sort(self.currentAbilitiesList, function(a, b)
            local db = Variables.globals.iconTypeOrder
            if db[a.buttonType] ~= db[b.buttonType] then return db[a.buttonType] < db[b.buttonType] end
            return a.spellName < b.spellName
        end)
    elseif sortBy == "typeDes" then
        table.sort(self.currentAbilitiesList, function(a, b)
            local db = Variables.globals.iconTypeOrder
            if db[a.buttonType] ~= db[b.buttonType] then return db[a.buttonType] > db[b.buttonType] end
            return a.spellName < b.spellName
        end)
    end
end

function MythicPlusUtility:CreateCurrentAbilitiesList()
    -- ACTIVE_TALENT_GROUP_CHANGED
    local containers = Variables.spellContainers
    local t = {}

    local function add(abilities, knownOnly)
        if not abilities then return end
        for spellId, ability in pairs(abilities) do
            local entry = {}
            for key, value in pairs(ability) do entry[key] = value end
            self:UpdateKnownState(entry)
            if not knownOnly then
                t[spellId] = entry
            elseif entry.isKnown then
                t[entry.altSpellId or spellId] = entry
            end
        end
    end

    add(self.effectiveAbilities[self.db.char.class])
    add(self.effectiveAbilities[self.db.char.currentSpec])
    for _, entry in pairs(t) do
        if entry.override and entry.isKnown and t[entry.override] then t[entry.override].isOverriden = true end
    end
    add(self.effectiveAbilities[containers.racial], true)
    add(self.effectiveAbilities[containers.profession])

    self.currentAbilitiesList = {}
    for _, entry in pairs(t) do table.insert(self.currentAbilitiesList, entry) end

    self:SortCurrentAbilitiesList()
end

function MythicPlusUtility:UpdateCurrentAbilitiesList(petOnly)
    -- TRAIT_CONFIG_UPDATED
    -- UPDATE_VEHICLE_ACTIONBAR for Hunter and Warlock
    local bySpellId = {}

    for _, entry in ipairs(self.currentAbilitiesList) do
        if (not petOnly or entry.pet) and not entry.racial then
            self:UpdateKnownState(entry)
            entry.isOverriden = false
        end
        bySpellId[entry.spellId] = entry
    end

    for _, entry in ipairs(self.currentAbilitiesList) do
        if (not petOnly or entry.pet) and not entry.racial and entry.override and entry.isKnown and bySpellId[entry.override] then
            bySpellId[entry.override].isOverriden = true
        end
    end

end

function MythicPlusUtility:PopulateCurrentAbilitiesListWithInstanceData(instanceID)

    self.buttonsIndices = {}
    self.buttonsIndicesWithEmpty = {}

    for _, entry in ipairs(self.currentAbilitiesList) do
        entry.list = {}
        entry.hasImportant = false

        if not entry.isOverriden then
            if self.instancesData[instanceID] then
                local hasImportant = false
                for _, instanceEntry in ipairs(self.instancesData[instanceID]) do

                    if not (self.db.profile.generalSettings.hideNotImportant and not instanceEntry.tagsTable.important) then
                        local found = false
                        for tag, _ in pairs(instanceEntry.tagsTable) do
                            if entry.tagsTable[tag] then
                                found = true
                                break
                            end
                        end

                        if found then
                            if not hasImportant and instanceEntry.tagsTable.important then
                                hasImportant = true
                            end
                            table.insert(entry.list, instanceEntry.formattedText)
                        end
                    end
                end

                entry.hasImportant = hasImportant

            end
        end

        local buttonType
        if #entry.list > 0 then
            if entry.isKnown then
                if entry.hasImportant or not self.db.profile.buttonCosmetic.onlyNotImportantAbility.enabled then
                    buttonType = "learnedAbility"
                else
                    buttonType = "onlyNotImportantAbility"
                end
            else
                if entry.hasImportant or not self.db.profile.buttonCosmetic.needOnlyNotImportantAbility.enabled then
                    buttonType = "needAbility"
                else
                    buttonType = "needOnlyNotImportantAbility"
                end
            end
        else
            buttonType = "unlearnAbility"
        end
        entry.buttonType = buttonType
    end

    self:SortCurrentAbilitiesList()

    for id, entry in ipairs(self.currentAbilitiesList) do
        if entry.list and #entry.list > 0
          and (not entry.profession or entry.isKnown or self.db.profile.generalSettings.showAllProfessions) then
            table.insert(self.buttonsIndices, id)
        end
    end
    for id, entry in ipairs(self.currentAbilitiesList) do
        if (entry.list and #entry.list > 0
          and (not entry.profession or entry.isKnown or self.db.profile.generalSettings.showAllProfessions))
          or (entry.isKnown and not entry.baseline and not entry.racial and not entry.profession) then
            table.insert(self.buttonsIndicesWithEmpty, id)
        end
    end

end
