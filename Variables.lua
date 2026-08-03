local L = LibStub("AceLocale-3.0"):GetLocale("MythicPlusUtility")

MythicPlusUtility.Variables = {}
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
}

Variables.defaultDungeonId = 2526

Variables.dungeonIdToName = {
    [2526] = L["Algeth\'ar Academy"],
    [2811] = L["Magisters\' Terrace"],
    [2874] = L["Maisara Caverns"],
    [2915] = L["Nexus-Point Xenas"],
    [658] = L["Pit of Saron"],
    [1753] = L["Seat of the Triumvirate"],
    [1209] = L["Skyreach"],
    [2805] = L["Windrunner Spire"],
}

Variables.globals = {
    labelListOrder = {"default", "defaultText", "custom", "none"},
    unlearnAbility = {
        labelList = {default = "\"-\"", defaultText = L["\"Remove\""], none = L["None"], custom = L["Custom_text"]},
    },
    needAbility = {
        labelList = {default = "\"+\"", defaultText = L["\"Add\""], none = L["None"], custom = L["Custom_text"]},
    },
    onlyNotImportantAbility = {
        labelList = {default = "\"?\"", defaultText = L["\"Optional\""], none = L["None"], custom = L["Custom_text"]},
    },
    needOnlyNotImportantAbility = {
        labelList = {
            default = "\"+?\"",
            defaultText = L["\"Add Optional\""],
            none = L["None"],
            custom = L["Custom_text"],
        },
    },
    learnedAbility = {
        labelList = {default = "\"*\"", defaultText = L["\"Known\""], none = L["None"], custom = L["Custom_text"]},
    },
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
