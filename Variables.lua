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

    cc_aberration = true, -- Aberration that needs a CC effect (instant cast)
    cc_beast = true, -- Beast that needs a CC effect (instant cast)
    cc_critter = true, -- Critter that needs a CC effect (instant cast)
    cc_demon = true, -- Demon that needs a CC effect (instant cast)
    cc_dragonkin = true, -- Dragonkin that needs a CC effect (instant cast)
    cc_elemental = true, -- Elemental that needs a CC effect (instant cast)
    cc_giant = true, -- Giant that needs a CC effect (instant cast)
    cc_humanoid = true, -- Humanoid that needs a CC effect (instant cast)
    cc_mechanical = true, -- Mechanical that needs a CC effect (instant cast)
    cc_undead = true, -- Undead that needs a CC effect (instant cast)
    cc_other = true, -- Uncategorised creature that needs a CC effect (instant cast)

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
    physical_debuff = true, -- Removable physical debuff

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

    -- extra
    curse_target = true, -- Remove curse from target, not self
}

Variables.tagCategoriesOrder = {"crowdControl", "creature", "dispel", "movement", "other"}
Variables.tagCategories = {
    crowdControl = {
        name = L["Crowd Control"],
        groups = {
            {
                name = L["Cast-time CC"],
                tags = {
                    "cast_cc_aberration",
                    "cast_cc_beast",
                    "cast_cc_critter",
                    "cast_cc_demon",
                    "cast_cc_dragonkin",
                    "cast_cc_elemental",
                    "cast_cc_giant",
                    "cast_cc_humanoid",
                    "cast_cc_mechanical",
                    "cast_cc_undead",
                    "cast_cc_other",
                },
            },
            {
                name = L["Instant-cast CC"],
                tags = {
                    "cc_aberration",
                    "cc_beast",
                    "cc_critter",
                    "cc_demon",
                    "cc_dragonkin",
                    "cc_elemental",
                    "cc_giant",
                    "cc_humanoid",
                    "cc_mechanical",
                    "cc_undead",
                    "cc_other",
                },
            },
            {name = L["Special CC"], tags = {"cc_banish", "cc_cyclone"}},
        },
    },
    creature = {
        name = L["Creature"],
        groups = {
            {
                name = L["Creature Effects"],
                tags = {
                    "creature_grip",
                    "creature_root",
                    "creature_slow",
                    "creature_stun",
                    "creature_fear",
                    "creature_incapacitate",
                    "creature_mortal_strike",
                },
            },
        },
    },
    dispel = {
        name = L["Dispel"],
        groups = {
            {
                name = L["Effects on Players"],
                tags = {
                    "bleed",
                    "charm",
                    "curse",
                    "curse_target",
                    "disease",
                    "fear",
                    "incapacitate",
                    "poison",
                    "polymorph",
                    "sleep",
                    "slow",
                    "root",
                    "snare",
                    "stun",
                    "magic_debuff",
                    "physical_debuff",
                },
            },
            {name = L["Effects on Enemies"], tags = {"enrage", "purge", "purge_spellsteal", "stealth"}},
        },
    },
    movement = {
        name = L["Movement"],
        groups = {{name = L["Player Movement"], tags = {"player_jump", "player_movement_immune", "alter_time"}}},
    },
    other = {
        name = L["Other"],
        groups = {
            {name = L["General"], tags = {"self_only", "targeted_avoid"}},
            {
                name = L["Professions"],
                tags = {
                    "profession_alchemy",
                    "profession_archaeology",
                    "profession_blacksmithing",
                    "profession_cooking",
                    "profession_enchanting",
                    "profession_engineering",
                    "profession_fishing",
                    "profession_herbalism",
                    "profession_inscription",
                    "profession_jewelcrafting",
                    "profession_leatherworking",
                    "profession_mining",
                    "profession_skinning",
                    "profession_tailoring",
                },
            },
        },
    },
}

Variables.tagDescriptions = {
    self_only = L["Ability that only works on the player"],
    cast_cc_aberration = L["Aberration that needs a CC effect (cast time)"],
    cast_cc_beast = L["Beast that needs a CC effect (cast time)"],
    cast_cc_critter = L["Critter that needs a CC effect (cast time)"],
    cast_cc_demon = L["Demon that needs a CC effect (cast time)"],
    cast_cc_dragonkin = L["Dragonkin that needs a CC effect (cast time)"],
    cast_cc_elemental = L["Elemental that needs a CC effect (cast time)"],
    cast_cc_giant = L["Giant that needs a CC effect (cast time)"],
    cast_cc_humanoid = L["Humanoid that needs a CC effect (cast time)"],
    cast_cc_mechanical = L["Mechanical that needs a CC effect (cast time)"],
    cast_cc_undead = L["Undead that needs a CC effect (cast time)"],
    cast_cc_other = L["Uncategorised creature that needs a CC effect (cast time)"],
    cc_aberration = L["Aberration that needs a CC effect (instant cast)"],
    cc_beast = L["Beast that needs a CC effect (instant cast)"],
    cc_critter = L["Critter that needs a CC effect (instant cast)"],
    cc_demon = L["Demon that needs a CC effect (instant cast)"],
    cc_dragonkin = L["Dragonkin that needs a CC effect (instant cast)"],
    cc_elemental = L["Elemental that needs a CC effect (instant cast)"],
    cc_giant = L["Giant that needs a CC effect (instant cast)"],
    cc_humanoid = L["Humanoid that needs a CC effect (instant cast)"],
    cc_mechanical = L["Mechanical that needs a CC effect (instant cast)"],
    cc_undead = L["Undead that needs a CC effect (instant cast)"],
    cc_other = L["Uncategorised creature that needs a CC effect (instant cast)"],
    cc_banish = L["Special CC case for Banish, as damage does not break it"],
    cc_cyclone = L["Special CC case for Cyclone, as damage does not break it"],
    creature_grip = L["Creature that needs a forced movement effect"],
    creature_root = L["Creature that needs a root effect"],
    creature_slow = L["Creature that needs a slow effect"],
    creature_stun = L["Creature that needs a stun effect"],
    creature_fear = L["Creature that needs a fear effect"],
    creature_incapacitate = L["Creature that needs an incapacitation effect"],
    creature_mortal_strike = L["Creature that needs a mortal strike effect"],
    bleed = L["Removable bleed effect"],
    charm = L["Removable charm effect"],
    curse = L["Removable curse effect"],
    curse_target = L["Curse that needs to be removed from a target, not only from yourself"],
    disease = L["Removable disease effect"],
    enrage = L["Removable enrage effect"],
    fear = L["Removable fear effect"],
    incapacitate = L["Removable incapacitate effect"],
    poison = L["Removable poison effect"],
    purge = L["Purgeable magic effect"],
    purge_spellsteal = L["Purgeable magic effect, Spellsteal special case"],
    polymorph = L["Removable polymorph effect"],
    sleep = L["Removable sleep effect"],
    slow = L["Removable slow effect"],
    root = L["Removable root effect"],
    snare = L["Removable snare effect"],
    stealth = L["Removable stealth effect"],
    stun = L["Removable stun effect"],
    magic_debuff = L["Removable magical debuff, not simply type \"magic\""],
    physical_debuff = L["Removable physical debuff"],
    player_jump = L["Mechanic that the player can avoid with a \"jump\" ability"],
    player_movement_immune = L["Mechanic that the player can avoid with immunity to forced movement"],
    alter_time = L["Special case for Alter Time"],
    targeted_avoid = L["Targeted ability that can be avoided with Feign Death, Shadowmeld, etc."],
    profession_alchemy = L["Requires Alchemy"],
    profession_archaeology = L["Requires Archaeology"],
    profession_blacksmithing = L["Requires Blacksmithing"],
    profession_cooking = L["Requires Cooking"],
    profession_enchanting = L["Requires Enchanting"],
    profession_engineering = L["Requires Engineering"],
    profession_fishing = L["Requires Fishing"],
    profession_herbalism = L["Requires Herbalism"],
    profession_inscription = L["Requires Inscription"],
    profession_jewelcrafting = L["Requires Jewelcrafting"],
    profession_leatherworking = L["Requires Leatherworking"],
    profession_mining = L["Requires Mining"],
    profession_skinning = L["Requires Skinning"],
    profession_tailoring = L["Requires Tailoring"],
}

Variables.spellContainers = {racial = "racial", profession = "profession", allClasses = "ALL"}

Variables.dungeonGlobals = {}
Variables.dungeonGlobals.currentSeason = "12.1"
Variables.dungeonGlobals.seasons = {["12.1"] = L["Midnight Season 2"], ["12.0"] = L["Midnight Season 1"]}
Variables.dungeonGlobals.seasonsOrder = {"12.1", "12.0"}
Variables.dungeonGlobals.defaultDungeonId = 2993
Variables.dungeonGlobals.dungeonList = {
    -- Midnight
    [2993] = true, -- Altar of Fangs
    [2825] = true, -- Den of Nalorakk
    [2811] = true, -- Magisters' Terrace
    [2874] = true, -- Maisara Caverns
    [2813] = true, -- Murder Row
    [2915] = true, -- Nexus-Point Xenas
    [2859] = true, -- The Blinding Vale
    [2923] = true, -- Voidscar Arena
    [2805] = true, -- Windrunner Spire
    -- Dragonflight
    [2526] = true, -- Algeth'ar Academy
    [2521] = true, -- Ruby Life Pools
    -- Battle for Azeroth
    [1762] = true, -- Kings' Rest
    [1877] = true, -- Temple of Sethraliss
    -- Legion
    [1753] = true, -- Seat of the Triumvirate
    -- Warlords of Draenor
    [1209] = true, -- Skyreach
    -- Wrath of the Lich King
    [658] = true, -- Pit of Saron
}
Variables.dungeonGlobals.dungeonListBySeasonOrder = {
    ["12.0"] = {2526, 2811, 2874, 2915, 658, 1753, 1209, 2805},
    ["12.1"] = {2993, 2825, 1762, 2813, 2521, 1877, 2859, 2923},
}
Variables.dungeonGlobals.dungeonListBySeason = {
    ["12.0"] = {[2526] = "", [2811] = "", [2874] = "", [2915] = "", [658] = "", [1753] = "", [1209] = "", [2805] = ""},
    ["12.1"] = {[2813] = "", [2825] = "", [2859] = "", [2923] = "", [2993] = "", [2521] = "", [1877] = "", [1762] = ""},
}

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
