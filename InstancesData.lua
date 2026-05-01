local L = LibStub("AceLocale-3.0"):GetLocale("MythicPlusUtility")

MythicPlusUtility.instancesData = {
    [2526] = { -- Algeth'ar Academy
        -- Boss
        { -- Branch Out
            text = format(L["{spell:%d} debuff is inflicted on the first boss {npc:%d}."], 388623, 196482),
            tags = "[important][bleed][physical_debuff]",
        }, { -- Lasher Toxin
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d} on the first boss {npc:%d}."], 389033, 197398,
                          196482),
            tags = "[important][poison][magic_debuff]",
        }, { -- Savage Peck
            text = format(L["{spell:%d} debuff is inflicted by the second boss {npc:%d}."], 376997, 191736),
            tags = "[bleed][physical_debuff]",
        }, { -- Power Vacuum
            text = format(L["Mitigates effects of {spell:%d} on the last boss {npc:%d}."], 388822, 190609),
            tags = "[important][player_jump][player_movement_immune][alter_time]",
        }, -- Trash
        { -- Raging Screech
            text = format(
              L["{spell:%d} buff is cast by {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted."],
              377389, 192333, 191736),
            tags = "[important][enrage]",
        }, { -- Monotonous Lecture
            text = format(
              L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted."],
              388392, 196044, 194181),
            tags = "[important][sleep]",
        }, { -- Monotonous Lecture
            text = format(
              L["{spell:%d} is cast by {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted."], 388392,
              196044, 194181),
            tags = "[important][creature_stun][creature_incapacitate][creature_grip][cc_elemental]",
        }, { -- Monotonous Lecture
            text = format(L["Avoid {spell:%d} when {npc:%d} casts on last seconds."], 388392, 196044),
            tags = "[important][targeted_avoid]",
        }, { -- Vicious Ambush
            text = format(L["Avoid {spell:%d} when {npc:%d} jumps. Targets the furthest player."], 388940, 196671),
            tags = "[important][targeted_avoid]",
        }, { -- Agitation
            text = format(L["{spell:%d} buff on {npc:%d} (trash before {npc:%d})."], 390938, 197406, 191736),
            tags = "[enrage]",
        }, { -- Peck
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d})."], 377344, 192329,
                          191736),
            tags = "[bleed][physical_debuff]",
        }, { -- Vile Bite
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d})."], 1282244, 197219,
                          196482),
            tags = "[bleed][physical_debuff]",
        },
    },
    [2811] = { -- Magisters' Terrace
        -- Boss
        { -- Ethereal Shackles
            text = format(L["{spell:%d} debuff is inflicted by the first boss {npc:%d}."], 1214038, 231861),
            tags = "[important][slow][root][magic_debuff]",
        }, { -- Hastening Ward
            text = format(L["{spell:%d} buff on the second boss {npc:%d}."], 1248689, 231863),
            tags = "[super_important][purge]",
        }, { -- Entropy Orb
            text = format(L["{spell:%d} debuff is inflicted by contact with orbs on the last boss {npc:%d}."], 1269631,
                          231865),
            tags = "[important][slow][root][magic_debuff]",
        }, -- Trash
        { -- Power Word: Shield
            text = format(L["{spell:%d} buff is cast by {npc:%d}."], 1254306, 234486),
            tags = "[super_important][purge]",
        }, { -- Consuming Shadows
            text = format(L["{spell:%d} is cast by {npc:%d}."], 1265977, 234068),
            tags = "[important][creature_mortal_strike]",
        }, { -- Runic Glaive
            text = format(L["Avoid {spell:%d} when {npc:%d} throws glaive."], 1244907, 240973),
            tags = "[important][targeted_avoid]",
        }, { -- Terror Wave
            text = format(
              L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted and LoS."],
              1264693, 231552, 231864), -- First NpcId is wrong but has the same name 
            tags = "[important][fear]",
        }, { -- Arcane Beam
            text = format(L["Avoid {spell:%d} when {npc:%d} casts on last seconds."], 1282050, 257476),
            tags = "[targeted_avoid]",
        }, { -- Arcane Blade
            text = format(L["{spell:%d} buff on {npc:%d}."], 1252909, 234124),
            tags = "[purge]",
        }, { -- Last adds skip
            text = format(L["Skips add pack before the last boss {npc:%d}. This is route specific."], 231865),
            tags = "[player_jump]",
        },
    },
    [2874] = { -- Maisara Caverns
        -- Boss
        { -- Open Wound
            text = format(L["{spell:%d} debuff is inflicted by the first boss {npc:%d}."], 1266488, 247572),
            tags = "[important][bleed][physical_debuff]",
        }, { -- Barrage
            text = format(L["Avoid {spell:%d} when the first boss {npc:%d} starts channeling."], 1260643, 247570),
            tags = "[targeted_avoid]",
        }, { -- Infected Pinions
            text = format(L["{spell:%d} debuff is inflicted by the first boss {npc:%d}."], 1246666, 247572),
            tags = "[disease][magic_debuff]",
        }, { -- Vilebranch Sting
            text = format(L["{spell:%d} debuff is inflicted by the first boss {npc:%d}."], 1260709, 247570),
            tags = "[snare][magic_debuff]",
        }, { -- Soulbind
            text = format(L["Avoid {spell:%d} when totem starts channeling on the last boss {npc:%d}."], 1252777, 248595),
            tags = "[important][targeted_avoid]",
        }, { -- Cries of the Fallen
            text = format(L["{spell:%d} debuff is inflicted by contact with {npc:%d} on the last boss {npc:%d}."],
                          1254175, 1531, 248605),
            tags = "[slow][root][magic_debuff]",
        }, -- Trash
        { -- Ritual Sacrifice
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1259794, 253683),
            tags = "[super_important][slow][root][magic_debuff][targeted_avoid]",
        }, { -- Grim Ward
            text = format(L["{spell:%d} buff on {npc:%d}."], 1270079, 248690),
            tags = "[important][purge]",
        }, { -- Blood Frenzy
            text = format(L["{spell:%d} buff on {npc:%d}."], 1255765, 248684),
            tags = "[enrage]",
        }, { -- Frost Nova
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1271623, 249024),
            tags = "[slow][root][magic_debuff]",
        }, { -- Hooked Snare
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}. Also, this cast can be interrupted."], 1266381,
                          242964),
            tags = "[slow][root][physical_debuff]",
        }, { -- Reanimation
            text = format(L["{spell:%d} is cast by {npc:%d}."], 1257716, 248692),
            tags = "[creature_stun][creature_incapacitate][creature_grip][cc_undead]",
        }, { -- Regeneratin'
            text = format(L["{spell:%d} is cast by {npc:%d}."], 1255966, 242964),
            tags = "[creature_mortal_strike]",
        }, { -- Regeneratin'
            text = format(L["{spell:%d} is cast by {npc:%d}."], 1255966, 248684),
            tags = "[creature_mortal_strike]",
        }, { -- Rending Gore
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1256059, 248678),
            tags = "[bleed][physical_debuff]",
        }, { -- Shrink
            text = format(L["Avoid {spell:%d} when {npc:%d} starts channeling."], 1263292, 254740),
            tags = "[targeted_avoid]",
        },
    },
    [2915] = { -- Nexus-Point Xenas
        -- Boss
        -- Trash
        { -- Holy Echo
            text = format(L["{spell:%d} buff on {npc:%d}."], 1263785, 254928),
            tags = "[important][purge]",
        }, { -- Supression Field
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 249081, 241647),
            tags = "[important][slow][snare][magic_debuff]",
        }, { -- Entropic Leech
            text = format(L["Avoid {spell:%d} when {npc:%d} starts channeling."], 1252062, 241660),
            tags = "[targeted_avoid]",
        }, { -- Arcane Explosion
            text = format(L["{spell:%d} is channeled by {npc:%d}."], 1285445, 241644),
            tags = "[creature_stun][creature_fear][creature_incapacitate][creature_grip][cc_humanoid]",
        }, { -- Creeping Void
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1281636, 248706),
            tags = "[curse][magic_debuff]",
        }, { -- Dusk Frights
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}. Also, this debuff can be avoided."], 1282724,
                          251853),
            tags = "[fear]",
        }, { -- Leech Veil
            text = format(L["{spell:%d} is cast by {npc:%d}."], 1252204, 241645),
            tags = "[creature_stun][creature_fear][creature_incapacitate][creature_grip][creature_mortal_strike][cc_aberration]",
        }, { -- Smudge NPC
            text = format(L["Prevent {npc:%d} from reaching {npc:%d}."], 248769, 252903),
            tags = "[creature_slow][creature_grip]",
        },
    },
    [658] = { -- Pit of Saron
        -- Boss
        { -- Cryoshards
            text = format(L["{spell:%d} debuff is inflicted by the first boss {npc:%d}."], 1261921, 36494),
            tags = "[important][slow][snare][magic_debuff]",
        }, { -- Shadowbind
            text = format(L["{spell:%d} debuff is inflicted by the second boss {npc:%d}."], 1264186, 36477),
            tags = "[super_important][slow][snare][curse][magic_debuff]",
        }, { -- Rotting Strikes
            text = format(L["{spell:%d} debuff is inflicted on the last boss {npc:%d}."], 1262930, 36658),
            tags = "[disease][physical_debuff]",
        }, -- Trash
        { -- Plungegrip
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1258997, 252707),
            tags = "[super_important][slow][root][physical_debuff]",
        }, { -- Plungegrip
            text = format(L["{spell:%d} is channeled by {npc:%d}. The caster is immune to CC while it has {spell:%d}"],
                          1258997, 252707, 1271543),
            tags = "[important][creature_stun][creature_incapacitate][creature_grip][cc_undead]",
        }, { -- Curse of Torment
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1258434, 252561),
            tags = "[important][curse][magic_debuff]",
        }, { -- Permeating Cold
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1258437, 252566),
            tags = "[important][slow][snare][magic_debuff]",
        }, { -- Necromantic Infusion
            text = format(L["{spell:%d} buff is cast by {npc:%d}."], 1258448, 252551),
            tags = "[purge]",
        }, { -- Plague Frenzy
            text = format(L["{spell:%d} buff on {npc:%d}."], 1259132, 252555),
            tags = "[enrage]",
        }, { -- Rotting Strikes
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1258459, 252558),
            tags = "[disease][physical_debuff]",
        }, { -- Torrent of Misery
            text = format(L["Avoid {spell:%d} when {npc:%d} starts channeling."], 1258826, 252563),
            tags = "[targeted_avoid]",
        },
    },
    [1753] = { -- Seat of the Triumvirate
        -- Boss
        { -- Coalesced Void NPC
            text = format(L["Prevent {npc:%d} from reaching the first boss {npc:%d}."], 122716, 122313),
            tags = "[important][creature_slow][creature_grip][cc_aberration][cast_cc_aberration]",
        }, { -- Shadow Pounce
            text = format(L["{spell:%d} debuff is inflicted on the second boss {npc:%d}."], 245742, 122316),
            tags = "[bleed][physical_debuff]",
        }, { -- Mind Flay
            text = format(L["{spell:%d} is channeled by {npc:%d} on the third boss {npc:%d}."], 1268733, 122827, 124309),
            tags = "[creature_stun][creature_fear][creature_incapacitate][cc_aberration]",
        }, { -- Mind Flay
            text = format(L["Avoid {spell:%d} when {npc:%d} starts channeling on the third boss {npc:%d}."], 1268733,
                          122827, 124309),
            tags = "[targeted_avoid]",
        }, -- Trash
        { -- Chains of Subjugation
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1262509, 124171),
            tags = "[important][slow][snare][magic_debuff]",
        }, { -- Abyssal Enhancement
            text = format(L["{spell:%d} buff on {npc:%d}."], 1262526, 122404),
            tags = "[purge]",
        }, { -- Battle Rage
            text = format(L["{spell:%d} buff on {npc:%d}."], 1264036, 122403),
            tags = "[enrage]",
        }, { -- Devouring Frenzy
            text = format(L["{spell:%d} is cast by {npc:%d}."], 1264678, 255320),
            tags = "[creature_mortal_strike]",
        }, { -- Shadowmend
            text = format(L["{spell:%d} is cast by {npc:%d}."], 1277339, 122413),
            tags = "[creature_stun][creature_fear][creature_incapacitate][creature_grip][cc_humanoid]",
        }, { -- Void Infusion
            text = format(L["Avoid {spell:%d} when {npc:%d} starts channeling."], 1262508, 122423),
            tags = "[targeted_avoid]",
        },
    },
    [1209] = { -- Skyreach
        -- Boss
        { -- Fan of Blades
            text = format(L["{spell:%d} debuff is inflicted on the first boss {npc:%d}."], 153757, 75964),
            tags = "[bleed][physical_debuff]",
        }, { -- Sunwings npc
            text = format(L["Prevent {npc:%d} from reaching players on the third boss {npc:%d}."], 76227, 76379),
            tags = "[creature_slow][creature_grip]",
        }, { -- Solar Zealot NPC
            text = format(L["Stun {npc:%d} on the last boss {npc:%d}."], 76267, 76266),
            tags = "[creature_stun]",
        }, { -- Lens Flare
            text = format(L["Avoid {spell:%d} when the last boss {npc:%d} targets you."], 154044, 76266),
            tags = "[important][targeted_avoid]",
        }, { -- Solar Zealot NPC Jump
            text = format(L["Jump back to the platform if you are thrown off by {npc:%d} on the last boss {npc:%d}."],
                          76267, 76266),
            tags = "[important][player_jump]",
        }, -- Trash
        { -- Blade Rush
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1254475, 79303),
            tags = "[important][bleed][physical_debuff]",
        }, { -- Blade Rush
            text = format(L["Avoid {spell:%d} when {npc:%d} jumps on you."], 1254475, 79303),
            tags = "[important][targeted_avoid]",
        }, { -- Mark of Death
            text = format(L["{spell:%d} is cast by {npc:%d}."], 1254686, 76154),
            tags = "[important][creature_stun][creature_fear][creature_incapacitate][cc_humanoid]",
        }, { -- Solar Flame
            text = format(L["Avoid {spell:%d} when {npc:%d} starts channeling."], 1253446, 76087),
            tags = "[important][targeted_avoid]",
        }, { -- Wind Maze
            text = format(L["Skips part of the wind maze after the third boss {npc:%d}."], 76379),
            tags = "[important][player_jump][player_movement_immune]",
        }, { -- Bloodcrazed
            text = format(L["{spell:%d} is cast by {npc:%d}."], 1254690, 79093),
            tags = "[creature_slow]",
        }, { -- Rushing Winds
            text = format(L["{spell:%d} buff on {npc:%d}."], 1254670, 78096),
            tags = "[purge]",
        }, { -- Solar Barrier
            text = format(L["{spell:%d} buff is cast by {npc:%d}."], 1273356, 79462),
            tags = "[purge]",
        }, { -- Wrathful Wind
            text = format(L["{spell:%d} buff on {npc:%d}."], 1254678, 250992),
            tags = "[enrage]",
        },
    },
    [2805] = { -- Windrunner Spire
        -- Boss
        { -- Curse of Darkness
            text = format(L["{spell:%d} debuff is inflicted by the second boss {npc:%d}."], 1215803, 231626),
            tags = "[super_important][curse][magic_debuff]",
        }, { -- Intimidating Shout
            text = format(
              L["{spell:%d} debuff is inflicted by the third boss {npc:%d}. Also, this debuff can be avoided."],
              1253030, 231631),
            tags = "[fear]",
        }, { -- Bolt Gale
            text = format(L["Avoid {spell:%d} when the last boss {npc:%d} starts channeling."], 474528, 231636),
            tags = "[targeted_avoid]",
        }, -- Trash
        { -- Emphemeral Bloodlust
            text = format(L["{spell:%d} buff is cast by {npc:%d}."], 1216459, 232146),
            tags = "[important][enrage]",
        }, { -- Fire Spit
            text = format(L["Avoid {spell:%d} when {npc:%d} starts channeling."], 1216848, 236891),
            tags = "[important][targeted_avoid]",
        }, { -- Fire Spit
            text = format(L["{spell:%d} is channeled by {npc:%d}."], 1216848, 236891),
            tags = "[important][creature_stun][creature_fear][creature_incapacitate][creature_grip][cc_beast]",
        }, { -- Poison Blades
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}. Also, this cast can be interrupted."], 473794,
                          232171),
            tags = "[important][poison][magic_debuff]",
        }, { -- Throw Axe
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1217094, 232447),
            tags = "[important][bleed][physical_debuff]",
        }, { -- Throw Axe
            text = format(L["Avoid {spell:%d} when {npc:%d} throws axe."], 1217094, 232447),
            tags = "[important][targeted_avoid]",
        }, { -- Bolstering Flames
            text = format(L["{spell:%d} buff on {npc:%d}."], 1216860, 236891),
            tags = "[important][purge]",
        }, { -- Arrow Rain
            text = format(L["{spell:%d} is channeled by {npc:%d}."], 1216449, 238035),
            tags = "[creature_stun][creature_incapacitate][creature_grip][cc_undead]",
        }, { -- Gore Whirl
            text = format(L["{spell:%d} is channeled by {npc:%d}."], 1216637, 232147),
            tags = "[creature_stun][creature_incapacitate][creature_grip][cc_undead]",
        }, { -- Poison Spray
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1216822, 232067),
            tags = "[poison][magic_debuff]",
        }, { -- Puncturing Bite
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1216985, 232063),
            tags = "[bleed][physical_debuff]",
        }, { -- Shred Flesh
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1253739, 232283),
            tags = "[bleed][physical_debuff]",
        },
    },
}
