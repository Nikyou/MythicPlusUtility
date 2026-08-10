MythicPlusUtility = LibStub("AceAddon-3.0"):NewAddon("MythicPlusUtility", "AceEvent-3.0", "AceConsole-3.0", "AceSerializer-3.0")
MythicPlusUtility.Variables = {}
local Variables = MythicPlusUtility.Variables
local AC = LibStub("AceConfig-3.0")
local ACD = LibStub("AceConfigDialog-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("MythicPlusUtility")
local minimapIcon = LibStub("LibDBIcon-1.0")

function MythicPlusUtility:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("MythicPlusUtilityDB", self.defaults, true)
    AC:RegisterOptionsTable("MythicPlusUtility_Options", self.options)
    self:MigrateOldSettings()

    self.optionsFrame = ACD:AddToBlizOptions("MythicPlusUtility_Options", "Mythic Plus Utility")
    -- ACD:SetDefaultSize("MythicPlusUtility_Options", 800, 630)

    self.profiles = self.Profiles:CreateOptions()
    self.db.profile.seasonSelect = Variables.dungeonGlobals.currentSeason
    self.ModelContainer:SetSize(self.db.profile.windowSettings.tooltipModelWidth,
                                self.db.profile.windowSettings.tooltipModelHeight)
    self.profilesFrame = ACD:AddToBlizOptions("MythicPlusUtility_Profiles", L["Profiles"], "Mythic Plus Utility")

    self.ModelContainer:SetSize(self.db.profile.windowSettings.tooltipModelWidth,
                                self.db.profile.windowSettings.tooltipModelHeight)

    self.db.RegisterCallback(self, "OnProfileChanged", "RefreshConfig")
    self.db.RegisterCallback(self, "OnProfileCopied", "RefreshConfig")
    self.db.RegisterCallback(self, "OnProfileReset", "RefreshConfig")

    self:RegisterChatCommand("mpu", "SlashCommand")
    self:InitializeMinimapIcon()
    self:GetCharacterInfo()
    self:ExtractSpellsFromDB()
    self:CheckLocalisation()
    self:FormatInstanceData()
    self:FormatSpellsData()

    C_Timer.NewTimer(1, function()
        if MythicPlusUtility.db.char.class == "HUNTER" or MythicPlusUtility.db.char.class == "WARLOCK" then
            MythicPlusUtility:RegisterEvent("UPDATE_VEHICLE_ACTIONBAR")
        end
        MythicPlusUtility:CreateCurrentAbilitiesList()
    end)

end

function MythicPlusUtility:MigrateOldSettings()
    -- Will clean up / change in a few updates
    local db = self.db.profile
    if db.hideOnStart then
        db.generalSettings.hideOnStart = db.hideOnStart
        db.hideOnStart = nil
    end
    if db.hideNotImportant then
        db.generalSettings.hideNotImportant = db.hideNotImportant
        db.hideNotImportant = nil
    end
    if db.difficultyID then
        db.generalSettings.difficultyID = db.difficultyID
        db.difficultyID = nil
    end
end

function MythicPlusUtility:RefreshConfig()
    if not self.db.profile.minimap.hide then
        minimapIcon:Show("MythicPlusUtility")
    else
        minimapIcon:Hide("MythicPlusUtility")
    end
    if self.Frame then self.Frame:ProfileChange() end
    self.ModelContainer:SetSize(self.db.profile.windowSettings.tooltipModelWidth,
                                self.db.profile.windowSettings.tooltipModelHeight)
end

function MythicPlusUtility:onTalentFrameShow()
    if MythicPlusUtility.Frame and MythicPlusUtility.Frame:IsShown() then
        MythicPlusUtility.TalentFrameHighlight:UpdateAnchers()
        MythicPlusUtility.TalentFrameHighlight:UpdateHighlight()
        MythicPlusUtility.TalentFrameHighlight:ShowRelevant()
    end
end

function MythicPlusUtility:onTalentFrameClose()
    if MythicPlusUtility.Frame and MythicPlusUtility.Frame:IsShown() then MythicPlusUtility.TalentFrameHighlight:HideAll() end
end

function MythicPlusUtility:onUtilityWindowSetShown()
    if MythicPlusUtility.Frame:IsShown() then
        MythicPlusUtility.TalentFrameHighlight:UpdateAnchers()
        MythicPlusUtility.TalentFrameHighlight:UpdateHighlight()
        MythicPlusUtility.TalentFrameHighlight:ShowRelevant()
    else
        MythicPlusUtility.TalentFrameHighlight:HideAll()
    end
end

function MythicPlusUtility:onUtilityWindowChangeInstance()
    C_Timer.NewTimer(0.5, function()
        MythicPlusUtility.TalentFrameHighlight:UpdateAnchers()
        MythicPlusUtility.TalentFrameHighlight:UpdateHighlight()
        if MythicPlusUtility.Frame:IsShown() then MythicPlusUtility.TalentFrameHighlight:ShowRelevant() end
    end)
end

function MythicPlusUtility:OnEnable()
    self:RegisterEvent("ACTIVE_PLAYER_SPECIALIZATION_CHANGED")
    self:RegisterEvent("TRAIT_CONFIG_UPDATED")
    self:RegisterEvent("PLAYER_ENTERING_WORLD")
    self:RegisterEvent("CHALLENGE_MODE_START")

    EventRegistry:RegisterCallback("PlayerSpellsFrame.OpenFrame", MythicPlusUtility.onTalentFrameShow)
    EventRegistry:RegisterCallback("PlayerSpellsFrame.CloseFrame", MythicPlusUtility.onTalentFrameClose)
    EventRegistry:RegisterCallback("MPU_UtilityWindow_SetShown", MythicPlusUtility.onUtilityWindowSetShown)
    EventRegistry:RegisterCallback("MPU_UtilityWindow_ChangeInstance", MythicPlusUtility.onUtilityWindowChangeInstance)
end

function MythicPlusUtility:ACTIVE_PLAYER_SPECIALIZATION_CHANGED(event)
    self.db.char.currentSpec = C_SpecializationInfo.GetSpecializationInfo(C_SpecializationInfo.GetSpecialization())
    if self.Frame and self.Frame:IsShown() then
        self:CreateCurrentAbilitiesList()
        self.Frame:ChangeInstance()
    else
        self.db.char.changedSpec = true
    end
end

function MythicPlusUtility:TRAIT_CONFIG_UPDATED(event)
    if self.Frame and self.Frame:IsShown() then
        self:UpdateCurrentAbilitiesList()
        self.Frame:ChangeInstance()
    else
        self.db.char.changedTalents = true
    end
end

function MythicPlusUtility:PLAYER_ENTERING_WORLD(event, isInitialLogin, isReloadingUi)
    C_Timer.NewTimer(0.5, function()
        if not (isInitialLogin or isReloadingUi) then
            local _, _, difficultyID, _, _, _, _, instanceID = GetInstanceInfo()
            if MythicPlusUtility.db.profile.generalSettings.difficultyID[difficultyID]
              and MythicPlusUtility.instancesData[instanceID] then
                MythicPlusUtility.db.profile.instanceID = instanceID
                if not MythicPlusUtility.Frame then MythicPlusUtility:InitializeFrames() end
                MythicPlusUtility.Frame:SetShownHandler(true)
                MythicPlusUtility.Frame:ChangeInstance()
            else
                if MythicPlusUtility.Frame and MythicPlusUtility.Frame:IsShown() then
                    MythicPlusUtility.Frame:SetShownHandler(false)
                end
            end
        end
    end)
end

function MythicPlusUtility:CHALLENGE_MODE_START(event)
    if self.Frame and self.db.profile.generalSettings.hideOnStart and self.Frame:IsShown() then
        self.Frame:SetShownHandler(false)
    end
end

function MythicPlusUtility:UPDATE_VEHICLE_ACTIONBAR(event)
    if self.Frame and self.Frame:IsShown() then
        self:UpdateCurrentAbilitiesList(true)
        self.Frame:ChangeInstance()
    else
        self.db.char.changedTalents = true
    end
end

function MythicPlusUtility:CheckLocalisation()
    self.db.global.buildNumber = (select(2, GetBuildInfo()))
    if (not self.db.locale.buildNumber) or (self.db.locale.buildNumber ~= self.db.global.buildNumber) then
        self.db.locale.buildNumber = self.db.global.buildNumber
        self.db.locale.spellIdToName = {}
        self.db.locale.spellIdToHyperlink = {}
        self.db.locale.spellIdToIconId = {}
        self.db.locale.npcIdToName = {}
        self.db.locale.npcIdToHyperlink = {}
    end
    self:PopulateLocalisation()
    C_Timer.NewTimer(0.5, function() MythicPlusUtility:PopulateLocalisation() end)
end

function MythicPlusUtility:ExtractSpellsFromDB()

    local function extract(spellId, entry)
        self.db.char.availableSpells[spellId] = true
        if entry.alternatives and #entry.alternatives > 0 then
            for _, subSpellId in pairs(entry.alternatives) do self.db.char.availableSpells[subSpellId] = true end
        end
    end

    self.db.char.availableSpells = {}

    for spellId, entry in pairs(self.utilityAbilities[self.db.char.class]) do extract(spellId, entry) end
    for specId, _ in pairs(self.classSpecialisations[self.db.char.class]) do
        for spellId, entry in pairs(self.utilityAbilities[specId]) do extract(spellId, entry) end
    end
    for spellId, entry in pairs(MythicPlusUtility.utilityAbilitiesRacials) do if entry.isKnown then extract(spellId, entry) end end
    for spellId, entry in pairs(MythicPlusUtility.utilityAbilitiesProfessions) do extract(spellId, entry) end
end

function MythicPlusUtility:PopulateLocalisation()
    for spellId, _ in pairs(self.db.char.availableSpells) do
        self:GetSpellNameById(spellId)
        self:GetSpellIconById(spellId)
        self:GetSpellHyperlinkById(spellId)
    end
end

function MythicPlusUtility:GetCharacterInfo()
    self.db.char.class = UnitClassBase("player")
    C_Timer.NewTimer(0.5, function()
        for spellId, entry in pairs(MythicPlusUtility.utilityAbilitiesRacials) do
            if not (entry.alternatives and #entry.alternatives > 0) then
                entry.isKnown = MythicPlusUtility:IsSpellKnownHandler(spellId)
                entry.spellId = spellId
                entry.spellName = MythicPlusUtility:GetSpellNameById(spellId)
            else
                local known = false

                for _, subSpellId in ipairs(entry.alternatives) do
                    known = MythicPlusUtility:IsSpellKnownHandler(subSpellId)
                    if known then
                        entry.isKnown = true
                        entry.altSpellId = subSpellId
                        entry.spellName = MythicPlusUtility:GetSpellNameById(subSpellId)

                        break
                    end
                end
                if not known then entry.isKnown = self:IsSpellKnownHandler(spellId) end
            end
        end

        for spellId, entry in pairs(MythicPlusUtility.utilityAbilitiesProfessions) do
            entry.isKnown = MythicPlusUtility:IsSpellKnownHandler(spellId)
            entry.spellId = spellId
            entry.spellName = MythicPlusUtility:GetSpellNameById(spellId)
        end

        MythicPlusUtility.db.char.currentSpec = C_SpecializationInfo.GetSpecializationInfo(
                                                  C_SpecializationInfo.GetSpecialization())
        MythicPlusUtility:ExtractSpellsFromDB()
    end)
end

function MythicPlusUtility:ToggleAbilitiesFrame()
    if not self.Frame then
        self:InitializeFrames()
        self.Frame:SetShownHandler(true)
        return
    end
    self.Frame:SetShownHandler(not self.Frame:IsShown())
end

function MythicPlusUtility:OpenSettings(inCombat, frame) if not inCombat then Settings.OpenToCategory(frame.name) end end

function MythicPlusUtility:SlashCommand(input, editbox)
    if input == "show" then
        self:ToggleAbilitiesFrame()
    elseif input == "minimap" then
        self:ToggleMinimapIcon()
    elseif input == "profile" or input == "profiles" then
        self:OpenSettings(UnitAffectingCombat("player"), self.profilesFrame)
    else
        self:OpenSettings(UnitAffectingCombat("player"), self.optionsFrame)
    end
end
