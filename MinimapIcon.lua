local L = LibStub("AceLocale-3.0"):GetLocale("MythicPlusUtility")

local minimapIcon = LibStub("LibDBIcon-1.0")

local LDB = LibStub("LibDataBroker-1.1"):NewDataObject("MythicPlusUtility", {
    type = "launcher",
    text = "Mythic Plus Utility",
    icon = 136108,
    OnClick = function(_, buttonName)
        if buttonName == "LeftButton" then
            MythicPlusUtility:ToggleAbilitiesFrame()
        elseif buttonName == "RightButton" then
            MythicPlusUtility:OpenSettings(UnitAffectingCombat("player"), MythicPlusUtility.optionsFrame)
        elseif buttonName == "MiddleButton" then
            MythicPlusUtility:ToggleMinimapIcon()
        end
    end,
    OnTooltipShow = function(tooltip)
        if not tooltip then return end

        tooltip:AddLine(WrapTextInColorCode("Mythic Plus Utility ", "00FFFFFF"))
        tooltip:AddLine("\n")
        tooltip:AddLine(CreateAtlasMarkup("newplayertutorial-icon-mouse-leftbutton") .. L["Show/Hide Utility Window"])
        tooltip:AddLine(CreateAtlasMarkup("newplayertutorial-icon-mouse-rightbutton") .. L["Open Settings"])
        tooltip:AddLine(CreateAtlasMarkup("newplayertutorial-icon-mouse-middlebutton") .. L["Disable Minimap Button"])
    end,
})

function MythicPlusUtility:InitializeMinimapIcon() minimapIcon:Register("MythicPlusUtility", LDB, self.db.profile.minimap) end

function MythicPlusUtility:ToggleMinimapIcon()
    self.db.profile.minimap.hide = not self.db.profile.minimap.hide

    if not self.db.profile.minimap.hide then
        minimapIcon:Show("MythicPlusUtility")
    else
        minimapIcon:Hide("MythicPlusUtility")
    end
end
