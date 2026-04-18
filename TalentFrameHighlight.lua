local TalentFrameHighlight = {}
TalentFrameHighlight.frames = {}
MythicPlusUtility.TalentFrameHighlight = TalentFrameHighlight

function TalentFrameHighlight:UpdateSpec()

    if not (PlayerSpellsFrame and PlayerSpellsFrame.TalentsFrame) then
        PlayerSpellsMicroButton:Click()
        PlayerSpellsMicroButton:Click()
    end

    local lastSelected = PlayerUtil.GetCurrentSpecID()
                           and C_ClassTalents.GetLastSelectedSavedConfigID(PlayerUtil.GetCurrentSpecID())
    local selectionID = PlayerSpellsFrame and PlayerSpellsFrame.TalentsFrame
                          and PlayerSpellsFrame.TalentsFrame.LoadoutDropDown
                          and PlayerSpellsFrame.TalentsFrame.LoadoutDropDown.GetSelectionID
                          and PlayerSpellsFrame.TalentsFrame.LoadoutDropDown:GetSelectionID()
    local configID = lastSelected or selectionID or C_ClassTalents.GetActiveConfigID()
    local configInfo = C_Traits.GetConfigInfo(configID)

    for _, treeID in ipairs(configInfo.treeIDs) do
        local nodes = C_Traits.GetTreeNodes(treeID)

        for _, nodeID in ipairs(nodes) do
            local nodeInfo = C_Traits.GetNodeInfo(configID, nodeID)
            for _, entryID in ipairs(nodeInfo.entryIDs) do
                local entryInfo = C_Traits.GetEntryInfo(configID, entryID)
                if entryInfo and entryInfo.definitionID then
                    local definitionInfo = C_Traits.GetDefinitionInfo(entryInfo.definitionID)
                    if definitionInfo.spellID and MythicPlusUtility.db.char.availableSpells[definitionInfo.spellID] then
                        if not self.frames[definitionInfo.spellID] then
                            self.frames[definitionInfo.spellID] = {nodeIDs = {}}
                        end
                        if not self.frames[definitionInfo.spellID].nodeIDs[nodeID] and PlayerSpellsFrame
                          and PlayerSpellsFrame.TalentsFrame then
                            self.frames[definitionInfo.spellID].nodeIDs[nodeID] = {
                                buttonFrame = PlayerSpellsFrame.TalentsFrame:GetTalentButtonByNodeID(nodeID),
                            }
                        end
                    end
                end
            end
        end
    end

    for spellId, entry in pairs(self.frames) do
        for nodeID, listEntry in pairs(entry.nodeIDs) do
            if not listEntry.frame and PlayerSpellsFrame and PlayerSpellsFrame.TalentsFrame then
                listEntry.frame = CreateFrame("Frame",
                                              "MythicPlusUtility_TalentFrameHighlight_" .. spellId .. "_" .. nodeID,
                                              listEntry.buttonFrame, "BackdropTemplate")
                listEntry.frame:EnableMouse(false)
                listEntry.frame:Hide()
                listEntry.frame:SetHeight(40)
                listEntry.frame:SetWidth(40)

                local texture = listEntry.frame:CreateTexture(nil, "ARTWORK")
                texture:SetAllPoints()
                listEntry.frame.texture = texture
            end
        end
    end

end

function TalentFrameHighlight:HideAll()
    for _, entry in pairs(self.frames) do for _, listEntry in pairs(entry.nodeIDs) do listEntry.frame:Hide() end end
end

function TalentFrameHighlight:ShowRelevant()
    local buttonsIndices = MythicPlusUtility:GetbuttonsIndices()
    local buttonCosmetic = MythicPlusUtility.db.profile.buttonCosmetic

    for _, abilityId in ipairs(buttonsIndices) do
        local currentAbility = MythicPlusUtility.currentAbilitiesList[abilityId]

        if buttonCosmetic[currentAbility.buttonType].enabled
          and buttonCosmetic[currentAbility.buttonType].hightlightEnabled then
            local spellId = currentAbility.spellId

            if currentAbility.altSpellId then spellId = currentAbility.altSpellId end
            if self.frames[spellId] then
                for _, listEntry in pairs(self.frames[spellId].nodeIDs) do listEntry.frame:Show() end
            end
        end

    end

end

function TalentFrameHighlight:UpdateHighlight()
    local buttonsIndices = MythicPlusUtility:GetbuttonsIndices()
    local buttonCosmetic = MythicPlusUtility.db.profile.buttonCosmetic

    for _, abilityId in ipairs(buttonsIndices) do
        local currentAbility = MythicPlusUtility.currentAbilitiesList[abilityId]

        if buttonCosmetic[currentAbility.buttonType].enabled
          and buttonCosmetic[currentAbility.buttonType].hightlightEnabled then
            local spellId = currentAbility.spellId
            local cosmeticDB = buttonCosmetic[currentAbility.buttonType]

            if currentAbility.altSpellId then spellId = currentAbility.altSpellId end
            if self.frames[spellId] then
                local c = cosmeticDB.hightlightColor
                for _, listEntry in pairs(self.frames[spellId].nodeIDs) do
                    listEntry.frame.texture:SetColorTexture(c[1], c[2], c[3], c[4])
                end
            end
        end
    end

end

function TalentFrameHighlight:UpdateAnchers()

    if MythicPlusUtility.Frame then
        TalentFrameHighlight:UpdateSpec()

        for _, entry in pairs(TalentFrameHighlight.frames) do
            for nodeID, listEntry in pairs(entry.nodeIDs) do
                if PlayerSpellsFrame and PlayerSpellsFrame.TalentsFrame then
                    local buttonFrame = PlayerSpellsFrame.TalentsFrame:GetTalentButtonByNodeID(nodeID)
                    if buttonFrame ~= listEntry.buttonFrame then
                        listEntry.frame:ClearAllPoints()
                        listEntry.frame:SetParent(buttonFrame)
                        listEntry.buttonFrame = buttonFrame
                        listEntry.frame:SetPoint("CENTER", buttonFrame)
                    end
                end
            end
        end

        MythicPlusUtility:onUtilityWindowSetShown()
    end

end
