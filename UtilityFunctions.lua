function MythicPlusUtility:GetbuttonsIndices()
    if self.db.profile.buttonCosmetic.unlearnAbility.enabled then
        return self.buttonsIndicesWithEmpty
    else
        return self.buttonsIndices
    end
end

function MythicPlusUtility:InitializeFrames()
    self.Frame = self:UtilityAbilitiesFrame()
    MythicPlusUtility.TalentFrameHighlight:UpdateAnchers()
    MythicPlusUtility.TalentFrameHighlight:UpdateHighlight()
    MythicPlusUtility.TalentFrameHighlight:ShowRelevant()
end

function MythicPlusUtility:IsSpellKnownHandler(spellId, isPet)
    isPet = isPet or false
    local known = false

    if isPet then
        known = C_SpellBook.IsSpellInSpellBook(spellId, 1)
    else
        known = C_SpellBook.IsSpellKnown(spellId)
    end

    return known
end

function MythicPlusUtility:tablecopy(tbl)
    if type(tbl) ~= "table" then return tbl end
    local t = {}
    for i, v in pairs(tbl) do t[i] = self:tablecopy(v) end
    return t
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
    if db.npcIdToName[npcId] and db.npcIdToName[npcId] ~= "" then
        return db.npcIdToName[npcId]
    elseif self.npcIdToEncounterSectionId[npcId] then
        local name = ""
        local info = C_EncounterJournal.GetSectionInfo(self.npcIdToEncounterSectionId[npcId])
        if info and info.title then name = info.title end
        db.npcIdToName[npcId] = name

        return name
    else
        local guid = format("Creature-0-0-0-0-%s-0", npcId)
        local tooltipData = C_TooltipInfo.GetHyperlink(format("unit:%s", guid))
        if tooltipData then
            local name
            for _, line in pairs(tooltipData.lines) do
                if line.type == Enum.TooltipDataLineType.UnitName then
                    name = line.leftText;
                    break
                end
            end
            db.npcIdToName[npcId] = name
            return name
        end
    end
    return ""
end

function MythicPlusUtility:GetNpcHyperlinkById(npcId)
    local db = self.db.locale
    if (db.npcIdToHyperlink[npcId]) and (not string.find(db.npcIdToHyperlink[npcId], "|h%[%]|h|r")) then
        return db.npcIdToHyperlink[npcId]
    else
        local npcName = self:GetNpcNameById(npcId)
        if npcName then
            db.npcIdToHyperlink[npcId] = format("|cffffd100|Hunit:Creature-0-0-0-0-%s-0:%s|h[%s]|h|r", npcId, npcName,
                                                npcName)
            return db.npcIdToHyperlink[npcId]
        end
    end
    return ""
end

function MythicPlusUtility:ExtractSpellIdsFromInstanceData(instanceID)
    local function extract(entry)
        entry.spellIds = {}
        local i = 0

        while true do
            local n, j = string.find(entry.text, "{spell:%d+}", i + 1)
            if n == nil then break end
            local substring = string.sub(entry.text, n, j)
            local spellId = tonumber(string.sub(substring, string.find(substring, "%d+")))
            self:GetSpellNameById(spellId)
            self:GetSpellIconById(spellId)
            entry.spellIds[spellId] = true
            i = j
        end
    end

    if not instanceID then
        for _, instance in pairs(self.instancesData) do for _, entry in pairs(instance) do extract(entry) end end
    else
        for _, entry in pairs(self.instancesData[instanceID]) do extract(entry) end
    end
end

function MythicPlusUtility:ExtractNpcIdsFromInstanceData(instanceID)
    local function extract(entry)
        entry.npcIds = {}
        local i = 0

        while true do
            local n, j = string.find(entry.text, "{npc:%d+}", i + 1)
            if n == nil then break end
            local substring = string.sub(entry.text, n, j)
            local npcId = tonumber(string.sub(substring, string.find(substring, "%d+")))
            self:GetNpcNameById(npcId)
            entry.npcIds[npcId] = true
            i = j
        end
    end

    if not instanceID then
        for _, instance in pairs(self.instancesData) do for _, entry in pairs(instance) do extract(entry) end end
    else
        for _, entry in pairs(self.instancesData[instanceID]) do extract(entry) end
    end
end
function MythicPlusUtility:ExtractTagsFromInstanceData(instanceID)
    local function extract(entry)
        entry.tagsTable = {}
        local i = 0

        while true do
            local n, j = string.find(entry.tags, "%b[]", i + 1)
            if n == nil then break end
            local substring = string.sub(entry.tags, n, j)
            local tag = string.sub(substring, string.find(substring, "[^%[%]]+"))

            if self.supportedTags[tag] or tag == "important" then
                entry.tagsTable[tag] = true
            elseif tag == "super_important" then
                entry.tagsTable[tag] = true
                entry.tagsTable.important = true
            end

            i = j
        end
    end

    if not instanceID then
        for _, instance in pairs(self.instancesData) do for _, entry in pairs(instance) do extract(entry) end end
    else
        for _, entry in pairs(self.instancesData[instanceID]) do extract(entry) end
    end
end
function MythicPlusUtility:FormatInstanceDataString(instanceID)
    local function format(entry)
        entry.formattedText = entry.text

        for spellId, _ in pairs(entry.spellIds) do
            entry.formattedText = string.gsub(entry.formattedText, "{spell:" .. spellId .. "}", self:IconToChatIcon(
                                                self:GetSpellIconById(spellId)) .. self:GetSpellHyperlinkById(spellId))
        end
        for npcId, _ in pairs(entry.npcIds) do
            entry.formattedText = string.gsub(entry.formattedText, "{npc:" .. npcId .. "}",
                                              self:GetNpcHyperlinkById(npcId))
        end
        if not entry.tagsTable.important then
            entry.formattedText = CreateAtlasMarkup("map-icon-ignored-bluequestion") .. entry.formattedText
        end

        if entry.tagsTable.super_important then
            entry.formattedText = CreateAtlasMarkup("QuestNormal") .. entry.formattedText
        end
    end

    if not instanceID then
        for _, instance in pairs(self.instancesData) do for _, entry in pairs(instance) do format(entry) end end
    else
        for _, entry in pairs(self.instancesData[instanceID]) do format(entry) end
    end
end

function MythicPlusUtility:FormatInstanceData(instanceID)
    self:ExtractSpellIdsFromInstanceData(instanceID)
    self:ExtractNpcIdsFromInstanceData(instanceID)
    self:ExtractTagsFromInstanceData(instanceID)

    local myTimer =
      C_Timer.NewTimer(0.5, function(self) MythicPlusUtility:FormatInstanceDataString(self.instanceID) end)
    myTimer.instanceID = instanceID
end

function MythicPlusUtility:FormatSpellsData(spellId)
    local function extract(entry)
        entry.tagsTable = {}
        local i = 0

        while true do
            local n, j = string.find(entry.tags, "%b[]", i + 1)
            if n == nil then break end
            local substring = string.sub(entry.tags, n, j)
            local tag = string.sub(substring, string.find(substring, "[^%[%]]+"))

            if self.supportedTags[tag] then entry.tagsTable[tag] = true end

            i = j
        end
    end

    if not spellId then
        for spellId, entry in pairs(self.utilityAbilities[self.db.char.class]) do
            extract(entry)
            entry.spellId = spellId
            entry.spellName = self:GetSpellNameById(spellId)
        end
        for specId, _ in pairs(self.classSpecialisations[self.db.char.class]) do
            for spellId, entry in pairs(self.utilityAbilities[specId]) do
                extract(entry)
                entry.spellId = spellId
                entry.spellName = self:GetSpellNameById(spellId)
            end
        end
        for spellId, entry in pairs(self.utilityAbilitiesRacials) do
            extract(entry)
            entry.spellId = spellId
            entry.spellName = self:GetSpellNameById(spellId)
        end
    else
        if self.utilityAbilities[self.db.char.class][spellId] then
            extract(self.utilityAbilities[self.db.char.class][spellId])
            self.utilityAbilities[self.db.char.class][spellId].spellId = spellId
            self.utilityAbilities[self.db.char.class][spellId].spellName = self:GetSpellNameById(spellId)
        end
        for specId, _ in pairs(self.classSpecialisations[self.db.char.class]) do
            if self.utilityAbilities[specId][spellId] then
                extract(self.utilityAbilities[specId][spellId])
                self.utilityAbilities[specId][spellId].spellId = spellId
                self.utilityAbilities[specId][spellId].spellName = self:GetSpellNameById(spellId)
            end
        end
        if self.utilityAbilitiesRacials[spellId] then
            extract(self.utilityAbilitiesRacials[spellId])
            self.utilityAbilitiesRacials[spellId].spellId = spellId
            self.utilityAbilitiesRacials[spellId].spellName = self:GetSpellNameById(spellId)
        end
    end
end

function MythicPlusUtility:SortCurrentAbilitiesList()
    local sortBy = MythicPlusUtility.db.profile.textAndIcon.icon.sortBy

    if sortBy == "alpAsc" then
        table.sort(self.currentAbilitiesList, function(a, b) return a.spellName < b.spellName end)
    elseif sortBy == "alpDes" then
        table.sort(self.currentAbilitiesList, function(a, b) return a.spellName > b.spellName end)
    elseif sortBy == "typeAsc" then
        table.sort(self.currentAbilitiesList, function(a, b)
            local db = MythicPlusUtility.globals.iconTypeOrder
            if db[a.buttonType] ~= db[b.buttonType] then return db[a.buttonType] < db[b.buttonType] end
            return a.spellName < b.spellName
        end)
    elseif sortBy == "typeDes" then
        table.sort(self.currentAbilitiesList, function(a, b)
            local db = MythicPlusUtility.globals.iconTypeOrder
            if db[a.buttonType] ~= db[b.buttonType] then return db[a.buttonType] > db[b.buttonType] end
            return a.spellName < b.spellName
        end)
    end
end

function MythicPlusUtility:CreateCurrentAbilitiesList()
    -- ACTIVE_TALENT_GROUP_CHANGED
    local t = self:tablecopy(self.utilityAbilities[self.db.char.class])
    if self.utilityAbilities[self.db.char.currentSpec] then
        for spellId, entry in pairs(self.utilityAbilities[self.db.char.currentSpec]) do
            t[spellId] = self:tablecopy(entry)
        end
    end

    for spellId, entry in pairs(t) do
        entry.spellId = spellId

        if not (entry.alternatives and #entry.alternatives > 0) then
            entry.isKnown = MythicPlusUtility:IsSpellKnownHandler(spellId, entry.pet)
        else
            local known = false

            for _, subSpellId in ipairs(entry.alternatives) do
                known = MythicPlusUtility:IsSpellKnownHandler(subSpellId, entry.pet)
                if known then
                    entry.isKnown = true
                    entry.altSpellId = subSpellId
                    entry.spellName = self:GetSpellNameById(subSpellId)

                    break
                end
            end
            if not known then entry.isKnown = MythicPlusUtility:IsSpellKnownHandler(spellId, entry.pet) end
        end

        if entry.override and entry.isKnown and t[entry.override] then t[entry.override].isOverriden = true end
    end

    for spellId, entry in pairs(self.utilityAbilitiesRacials) do
        if entry.isKnown then
            if entry.altSpellId then
                t[entry.altSpellId] = self:tablecopy(entry)
            else
                t[spellId] = self:tablecopy(entry)
            end
        end
    end

    self.currentAbilitiesList = {}
    for _, entry in pairs(t) do table.insert(self.currentAbilitiesList, self:tablecopy(entry)) end

    self:SortCurrentAbilitiesList()
end

function MythicPlusUtility:UpdateCurrentAbilitiesList(petOnly)
    -- TRAIT_CONFIG_UPDATED
    -- UPDATE_VEHICLE_ACTIONBAR for Hunter and Warlock
    petOnly = petOnly or false

    for _, entry in pairs(self.currentAbilitiesList) do
        if (not petOnly or entry.pet) and not entry.racial then

            if not (entry.alternatives and #entry.alternatives > 0) then
                entry.isKnown = MythicPlusUtility:IsSpellKnownHandler(entry.spellId, entry.pet)
            else
                local known = false

                for _, subSpellId in ipairs(entry.alternatives) do
                    known = MythicPlusUtility:IsSpellKnownHandler(subSpellId, entry.pet)
                    if known then
                        entry.isKnown = true
                        entry.altSpellId = subSpellId
                        entry.spellName = self:GetSpellNameById(subSpellId)

                        break
                    end
                end

                if not known then
                    entry.isKnown = MythicPlusUtility:IsSpellKnownHandler(entry.spellId, entry.pet)
                    if entry.altSpellId then
                        entry.altSpellId = false
                        entry.spellName = self:GetSpellNameById(entry.spellId)
                    end
                end
            end

            if entry.isOverriden then entry.isOverriden = false end
        end
    end

    for _, entry in pairs(self.currentAbilitiesList) do
        if (not petOnly or entry.pet) and not entry.racial then
            if entry.override and entry.isKnown and (self.utilityAbilities[self.db.char.class][entry.override]
              or self.utilityAbilities[self.db.char.currentSpec][entry.override]) then
                for _, subEntry in pairs(self.currentAbilitiesList) do
                    if subEntry.spellId == entry.override then
                        subEntry.isOverriden = true
                        break
                    end
                end
            end
        end
    end

end

function MythicPlusUtility:PopulateCurrentAbilitiesListWithInstanceData(instanceID)

    self.buttonsIndices = {}
    self.buttonsIndicesWithEmpty = {}

    for _, entry in ipairs(self.currentAbilitiesList) do
        entry.list = {}

        if not entry.isOverriden then
            if self.instancesData[instanceID] then
                local hasImportant = false
                for _, instanceEntry in ipairs(self.instancesData[instanceID]) do

                    if not (self.db.profile.hideNotImportant and not instanceEntry.tagsTable.important) then
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
        if entry.list and #entry.list > 0 then table.insert(self.buttonsIndices, id) end
    end
    for id, entry in ipairs(self.currentAbilitiesList) do
        if (entry.list and #entry.list > 0) or (entry.isKnown and not (entry.baseline or entry.racial)) then
            table.insert(self.buttonsIndicesWithEmpty, id)
        end
    end

end
