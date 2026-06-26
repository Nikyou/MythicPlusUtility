MythicPlusUtility.ModelContainer =
  CreateFrame("Frame", "MPU_Tooltip_Model", GameTooltip, "TooltipBorderedFrameTemplate")
ModelContainer = MythicPlusUtility.ModelContainer
ModelContainer:SetSize(190, 269)
ModelContainer:SetPoint("TOPLEFT", GameTooltip, "TOPRIGHT", 0, 0)
ModelContainer:Hide()

ModelContainer.ModelClip = CreateFrame("Frame", nil, ModelContainer)
ModelContainer.ModelClip:SetPoint("TOPLEFT", 4, -4)
ModelContainer.ModelClip:SetPoint("BOTTOMRIGHT", -4, 4)
ModelContainer.ModelClip:SetClipsChildren(true)

ModelContainer.NPCModel = CreateFrame("PlayerModel", nil, ModelContainer.ModelClip)
ModelContainer.NPCModel:SetAllPoints()

function ModelContainer:ShowModel(link)
    local guid = link:match("unit:([^:]+):")
    local npcId = false
    if guid then npcId = guid:match("^Creature%-0%-0%-0%-0%-(%d+)%-0$") end
    if not npcId then return end

    self:Show()
    self.NPCModel:ClearModel()
    self.NPCModel:SetCreature(npcId)
end

function ModelContainer:HideModel()
    if self:IsShown() then
        self:Hide()
        self.NPCModel:ClearModel()
    end
end
