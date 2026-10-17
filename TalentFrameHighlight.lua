local TalentFrameHighlight = {}
TalentFrameHighlight.overlays = setmetatable({}, {__mode = "k"})
TalentFrameHighlight.entrySpells = {}
TalentFrameHighlight.spellColors = {}
MythicPlusUtility.TalentFrameHighlight = TalentFrameHighlight

function TalentFrameHighlight:Initialize()
    EventUtil.ContinueOnAddOnLoaded("Blizzard_PlayerSpells", function()
        local talentsFrame = PlayerSpellsFrame.TalentsFrame

        talentsFrame:RegisterCallback(TalentFrameBaseMixin.Event.TalentButtonAcquired, self.UpdateButton, self)
        talentsFrame:RegisterCallback(TalentFrameBaseMixin.Event.TalentButtonReleased, self.HideButton, self)
        EventRegistry:RegisterCallback("TalentFrameBase.ButtonsUpdated", self.OnButtonsUpdated, self)
        EventRegistry:RegisterCallback("PlayerSpellsFrame.TalentTab.Show", self.Refresh, self)
        hooksecurefunc(PlayerSpellsFrame, "SetInspecting", function() TalentFrameHighlight:Refresh() end)

        self:Refresh()
    end)
end

function TalentFrameHighlight:IsAvailable() return PlayerSpellsFrame and PlayerSpellsFrame.TalentsFrame end

function TalentFrameHighlight:UpdateSpellColors()
    local spellColors = {}
    local frame = MythicPlusUtility.Frame

    if frame and frame:IsShown() and not PlayerSpellsFrame.TalentsFrame:IsInspecting() then
        local buttonCosmetic = MythicPlusUtility.db.profile.buttonCosmetic

        for _, abilityId in ipairs(MythicPlusUtility:GetbuttonsIndices()) do
            local currentAbility = MythicPlusUtility.currentAbilitiesList[abilityId]
            local cosmeticDB = buttonCosmetic[currentAbility.buttonType]

            if cosmeticDB.enabled and cosmeticDB.hightlightEnabled then
                spellColors[currentAbility.altSpellId or currentAbility.spellId] = cosmeticDB.hightlightColor
            end
        end
    end

    self.spellColors = spellColors
end

function TalentFrameHighlight:GetEntrySpellId(configID, entryID)
    if not self.entrySpells[entryID] then
        local entryInfo = C_Traits.GetEntryInfo(configID, entryID)
        local definitionInfo = entryInfo and entryInfo.definitionID and C_Traits.GetDefinitionInfo(entryInfo.definitionID)
        self.entrySpells[entryID] = definitionInfo and definitionInfo.spellID
    end
    return self.entrySpells[entryID]
end

function TalentFrameHighlight:GetButtonColor(button)
    local nodeInfo = button.GetNodeInfo and button:GetNodeInfo()
    if not (nodeInfo and nodeInfo.entryIDs) then return end

    local configID = PlayerSpellsFrame.TalentsFrame:GetConfigID()
    for _, entryID in ipairs(nodeInfo.entryIDs) do
        local spellId = self:GetEntrySpellId(configID, entryID)
        if spellId and self.spellColors[spellId] then return self.spellColors[spellId] end
    end
end

function TalentFrameHighlight:HideButton(button) if self.overlays[button] then self.overlays[button]:Hide() end end

function TalentFrameHighlight:UpdateButton(button)
    local color = next(self.spellColors) and self:GetButtonColor(button)
    local overlay = self.overlays[button]

    if not color then
        if overlay then overlay:Hide() end
        return
    end

    if not overlay then
        overlay = CreateFrame("Frame", nil, button)
        overlay:EnableMouse(false)
        overlay:SetSize(40, 40)
        overlay:SetPoint("CENTER")

        local texture = overlay:CreateTexture(nil, "ARTWORK")
        texture:SetAllPoints()
        overlay.texture = texture
        self.overlays[button] = overlay
    end

    overlay.texture:SetColorTexture(color[1], color[2], color[3], color[4])
    overlay:Show()
end

function TalentFrameHighlight:Refresh()
    if not self:IsAvailable() then return end

    self:UpdateSpellColors()
    for button in PlayerSpellsFrame.TalentsFrame:EnumerateAllTalentButtons() do self:UpdateButton(button) end
end

function TalentFrameHighlight:OnButtonsUpdated(treeID)
    if treeID == PlayerSpellsFrame.TalentsFrame:GetTalentTreeID() then self:Refresh() end
end
