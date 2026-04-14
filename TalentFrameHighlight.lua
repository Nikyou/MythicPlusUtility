local TalentFrameHighlight = {}
MythicPlusUtility.TalentFrameHighlight = TalentFrameHighlight

function MythicPlusUtility:CreateTalentFrameHighlight()
    TalentFrameHighlight.frames = {}

    local treeID = C_ClassTalents.GetTraitTreeForSpec(PlayerUtil.GetCurrentSpecID())
    local nodes = C_Traits.GetTreeNodes(treeID)

    for _, nodeID in ipairs(nodes) do
        local nodeInfo = C_Traits.GetNodeInfo(configID, nodeID)
        for _, entryID in ipairs(nodeInfo.entryIDs) do -- each node can have multiple entries (e.g. choice nodes have 2)
            local entryInfo = C_Traits.GetEntryInfo(configID, entryID)
            if entryInfo and entryInfo.definitionID then
                local definitionInfo = C_Traits.GetDefinitionInfo(entryInfo.definitionID)
                if definitionInfo.spellID and self.db.char.availableSpells[definitionInfo.spellID]
                  and not TalentFrameHighlight.frames[definitionInfo.spellID] then
                    TalentFrameHighlight.frames[definitionInfo.spellID] = {
                        nodeID = nodeID,
                        buttonFrame = PlayerSpellsFrame.TalentsFrame:GetTalentButtonByNodeID(nodeID),
                    }
                end
            end
        end
    end

    for spellId, entry in pairs(TalentFrameHighlight.frames) do
        entry.frame = CreateFrame("Frame", "MythicPlusUtility_TalentFrameHighlight_" .. spellId, entry.buttonFrame,
                                  "BackdropTemplate")
        entry.frame:EnableMouse(false)
        entry.frame:Hide()

        local texture = entry.frame:CreateTexture(nil, "ARTWORK")
        texture:SetAllPoints()
        TalentFrameHighlight.texture = texture
    end
end

function TalentFrameHighlight:HideAll() for _, entry in pairs(self.frames) do entry.frame:Hide() end end

function TalentFrameHighlight:ShowRelevant()
    local buttonsIndices = MythicPlusUtility:GetbuttonsIndices()
    local buttonCosmetic = self.db.profile.buttonCosmetic

    for _, abilityId in ipairs(buttonsIndices) do
        local currentAbility = MythicPlusUtility.currentAbilitiesList[abilityId]
        local enabled = buttonCosmetic[currentAbility.buttonType].enabled

        if enabled then
            local spellId = currentAbility.spellId

            if currentAbility.altSpellId then spellId = currentAbility.altSpellId end
            if self.frames[spellId] then
                local frame = self.frames[spellId].frame
                frame:Show()
            end
        end

    end
end

function TalentFrameHighlight:UpdateHighlight()
    local buttonsIndices = MythicPlusUtility:GetbuttonsIndices()
    local buttonCosmetic = self.db.profile.buttonCosmetic

    for _, abilityId in ipairs(buttonsIndices) do
        local currentAbility = MythicPlusUtility.currentAbilitiesList[abilityId]
        local enabled = buttonCosmetic[currentAbility.buttonType].enabled

        if enabled then
            local spellId = currentAbility.spellId
            local cosmeticDB = buttonCosmetic[currentAbility.buttonType]

            if currentAbility.altSpellId then spellId = currentAbility.altSpellId end
            if self.frames[spellId] then
                local frame = self.frames[spellId].frame
                local c = cosmeticDB.iconColor
                frame.texture:SetVertexColor(c[1], c[2], c[3], c[4])
            end
        end
    end
end
