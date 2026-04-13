function MythicPlusUtility:CreateTalentFrameHighlight()
    local frame = {}
    self.TalentFrameHighlight = frame

    frame.frames = {}

    local function PopulateNodeList()
        local treeID = C_ClassTalents.GetTraitTreeForSpec(PlayerUtil.GetCurrentSpecID())

        local nodes = C_Traits.GetTreeNodes(treeID)
        for _, nodeID in ipairs(nodes) do
            local nodeInfo = C_Traits.GetNodeInfo(configID, nodeID)
            for _, entryID in ipairs(nodeInfo.entryIDs) do -- each node can have multiple entries (e.g. choice nodes have 2)
                local entryInfo = C_Traits.GetEntryInfo(configID, entryID)
                if entryInfo and entryInfo.definitionID then
                    local definitionInfo = C_Traits.GetDefinitionInfo(entryInfo.definitionID)
                    if definitionInfo.spellID and self.db.char.availableSpells[definitionInfo.spellID]
                      and not frame.frames[definitionInfo.spellID] then
                        frame.frames[definitionInfo.spellID] = {nodeID = nodeID}
                    end
                end
            end
        end
    end
    PopulateNodeList()

    for spellId, entry in pairs(frame.frames) do
        entry.frame = CreateFrame("Frame", "MythicPlusUtility_TalentFrameHighlight_" .. spellId,
                                  "PlayerSpellsFrame.TalentsFrame.ButtonsParent." + entry.nodeID, "BackdropTemplate")
    end

end
