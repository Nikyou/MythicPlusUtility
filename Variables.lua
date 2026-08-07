local L = LibStub("AceLocale-3.0"):GetLocale("MythicPlusUtility")
local Variables = MythicPlusUtility.Variables

Variables.supportedTags = {
    self_only = true, -- Ability that only works on the player

    cast_cc_aberration = true, -- Aberration that needs a CC effect  (cast time)
    cast_cc_beast = true, -- Beast that needs a CC effect  (cast time)
    cast_cc_critter = true, -- Critter that needs a CC effect  (cast time)
    cast_cc_demon = true, -- Demon that needs a CC effect  (cast time)
    cast_cc_dragonkin = true, -- Dragonkin that needs a CC effect  (cast time)
    cast_cc_elemental = true, -- Elemental that needs a CC effect  (cast time)
    cast_cc_giant = true, -- Giant that needs a CC effect  (cast time)
    cast_cc_humanoid = true, -- Humanoid that needs a CC effect  (cast time)
    cast_cc_mechanical = true, -- Mechanical that needs a CC effect  (cast time)
    cast_cc_undead = true, -- Undead that needs a CC effect  (cast time)
    cast_cc_other = true, -- Uncategorised creature that needs a CC effect  (cast time)

    cc_aberration = true, -- Aberration that needs a CC effect (insta cast)
    cc_beast = true, -- Beast that needs a CC effect (insta cast)
    cc_critter = true, -- Critter that needs a CC effect (insta cast)
    cc_demon = true, -- Demon that needs a CC effect (insta cast)
    cc_dragonkin = true, -- Dragonkin that needs a CC effect (insta cast)
    cc_elemental = true, -- Elemental that needs a CC effect (insta cast)
    cc_giant = true, -- Giant that needs a CC effect (insta cast)
    cc_humanoid = true, -- Humanoid that needs a CC effect (insta cast)
    cc_mechanical = true, -- Mechanical that needs a CC effect (insta cast)
    cc_undead = true, -- Undead that needs a CC effect (insta cast)
    cc_other = true, -- Uncategorised creature that needs a CC effect (insta cast)

    cc_banish = true, -- Special CC case for Banish as damage does not break it ([cast_cc_demon][cast_cc_aberration][cast_cc_elemental])
    cc_cyclone = true, -- Special CC case for cyclone as damage does not break it (cast cc everything)

    creature_grip = true, -- Creature that needs a forced movement effect
    creature_root = true, -- Creature that needs a root effect
    creature_slow = true, -- Creature that needs a slow effect
    creature_stun = true, -- Creature that needs a stun effect
    creature_fear = true, -- Creature that needs a fear effect
    creature_incapacitate = true, -- Creature that needs an incapacitation effect
    creature_mortal_strike = true, -- Creature that needs a mortal strike effect

    bleed = true, -- Removable bleed effect 
    charm = true, -- Removable charm effect
    curse = true, -- Removable curse effect
    disease = true, -- Removable disease effect
    enrage = true, -- Removable enrage effect
    fear = true, -- Removable  fear effect
    incapacitate = true, -- Removable incapacitate effect
    poison = true, -- Removable poison effect
    purge = true, -- Purgable magic effect
    purge_spellsteal = true, -- Purgable magic effect, Spellsteal special case
    polymorph = true, -- Removable polymorph effect
    sleep = true, -- Removable sleep effect
    slow = true, -- Removable slow effect
    root = true, --  Removable root effect
    snare = true, -- Removable snare effect
    -- snare_jet = true, -- Removable snare effect with Jet Sream (Shaman talent, special case)
    stealth = true, -- Removable stealth effect
    stun = true, -- Removable stun effect

    magic_debuff = true, -- Removable magical debuff, not simply type "magic"
    physical_debuf = true, -- Removable physical debuff

    player_jump = true, -- Mechanic that can be prevented by player using "jump" ability
    player_movement_immune = true, -- Mechanic that can be prevented by player using immunity to forced movement
    alter_time = true, -- Special case of alter time

    targeted_avoid = true, -- Targeted ability that can be avoided with FD, Shadowmeld, etc.

    -- Professions; When something can be used only if the player has a specific profession
    profession_alchemy = true,
    profession_archaeology = true,
    profession_blacksmithing = true,
    profession_cooking = true,
    profession_enchanting = true,
    profession_engineering = true,
    profession_fishing = true,
    profession_herbalism = true,
    profession_inscription = true,
    profession_jewelcrafting = true,
    profession_leatherworking = true,
    profession_mining = true,
    profession_skinning = true,
    profession_tailoring = true,
}

Variables.dungeonGlobals = {}
Variables.dungeonGlobals.currentSeason = "12.1"
Variables.dungeonGlobals.seasons = {["12.1"] = L["Midnight Season 2"], ["12.0"] = L["Midnight Season 1"]}
Variables.dungeonGlobals.seasonsOrder = {"12.1", "12.0"}
Variables.dungeonGlobals.defaultDungeonId = 2993
Variables.dungeonGlobals.dungeonIdToName = {
    -- Midnight
    [2993] = L["Altar of Fangs"],
    [2825] = L["Den of Nalorakk"],
    [2811] = L["Magisters' Terrace"],
    [2874] = L["Maisara Caverns"],
    [2813] = L["Murder Row"],
    [2915] = L["Nexus-Point Xenas"],
    [2859] = L["The Blinding Vale"],
    [2923] = L["Voidscar Arena"],
    [2805] = L["Windrunner Spire"],
    -- Dragonflight
    [2526] = L["Algeth'ar Academy"],
    [2521] = L["Ruby Life Pools"],
    -- Battle for Azeroth
    [1762] = L["Kings' Rest"],
    [1877] = L["Temple of Sethraliss"],
    -- Legion
    [1753] = L["Seat of the Triumvirate"],
    -- Warlords of Draenor
    [1209] = L["Skyreach"],
    -- Wrath of the Lich King
    [658] = L["Pit of Saron"],
}
Variables.dungeonGlobals.dungeonListBySeasonOrder = {
    ["12.0"] = {2526, 2811, 2874, 2915, 658, 1753, 1209, 2805},
    ["12.1"] = {2993, 2825, 1762, 2813, 2521, 1877, 2859, 2923},
}
Variables.dungeonGlobals.dungeonListBySeason = {
    ["12.0"] = {[2526] = "", [2811] = "", [2874] = "", [2915] = "", [658] = "", [1753] = "", [1209] = "", [2805] = ""},
    ["12.1"] = {[2813] = "", [2825] = "", [2859] = "", [2923] = "", [2993] = "", [2521] = "", [1877] = "", [1762] = ""},
}
local dungeonIdToName = Variables.dungeonGlobals.dungeonIdToName
local dungeonListBySeason = Variables.dungeonGlobals.dungeonListBySeason
for season, list in pairs(Variables.dungeonGlobals.dungeonListBySeason) do
    for id, _ in pairs(list) do if dungeonIdToName[id] then dungeonListBySeason[season][id] = dungeonIdToName[id] end end
end

Variables.globals = {
    labelListOrder = {"default", "defaultText", "custom", "none"},
    unlearnAbility = {labelList = {default = "\"-\"", defaultText = L["\"Remove\""], none = L["None"], custom = L["Custom_text"]}},
    needAbility = {labelList = {default = "\"+\"", defaultText = L["\"Add\""], none = L["None"], custom = L["Custom_text"]}},
    onlyNotImportantAbility = {
        labelList = {default = "\"?\"", defaultText = L["\"Optional\""], none = L["None"], custom = L["Custom_text"]},
    },
    needOnlyNotImportantAbility = {
        labelList = {default = "\"+?\"", defaultText = L["\"Add Optional\""], none = L["None"], custom = L["Custom_text"]},
    },
    learnedAbility = {labelList = {default = "\"*\"", defaultText = L["\"Known\""], none = L["None"], custom = L["Custom_text"]}},
    iconGlowTypeList = {pixel = L["Pixel Glow"], autocast = L["Autocast Shine"], action = L["Action Button Glow"]},
    iconGlowTypeListOrder = {"pixel", "autocast", "action"},
    maxValue = 2147483640, -- Little less than Integer Limit
    iconTypeOrder = {
        learnedAbility = 1,
        onlyNotImportantAbility = 2,
        needAbility = 3,
        needOnlyNotImportantAbility = 4,
        unlearnAbility = 5,
    },
}

Variables.npcIdToEncounterSectionId = {[76227] = 33940}

Variables.classToIcon = {
    DEATHKNIGHT = "classicon_deathknight",
    DEMONHUNTER = "classicon_demonhunter",
    DRUID = "classicon_druid",
    EVOKER = "classicon_evoker",
    HUNTER = "classicon_hunter",
    MAGE = "classicon_mage",
    MONK = "classicon_monk",
    PALADIN = "classicon_paladin",
    PRIEST = "classicon_priest",
    ROGUE = "classicon_rogue",
    SHAMAN = "classicon_shaman",
    WARLOCK = "classicon_warlock",
    WARRIOR = "classicon_warrior",
}
