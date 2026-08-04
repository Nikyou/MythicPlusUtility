local L = LibStub("AceLocale-3.0"):GetLocale("MythicPlusUtility")
MythicPlusUtility.instancesData = {
    -- Current Season (12.1)
    [2993] = { -- Altar of Fangs
        -- Boss
        { -- Regurgitate
            text = format(L["{spell:%d} debuff is inflicted on the first boss {npc:%d}. Also, this debuff can be avoided."],
                          1296069, 259445),
            tags = "[snare][slow][disease][magic_debuff]",
        }, { -- Toxic Atrophy
            text = format(L["{spell:%d} debuff is inflicted on the second boss {npc:%d}. Also, this cast can be interrupted."],
                          1310358, 259446),
            tags = "[snare][slow][magic_debuff]",
        }, -- Trash
        { -- Evolve
            text = format(L["{spell:%d} is channeled by {npc:%d}."], 1306385, 261557),
            tags = "[important][creature_stun][creature_fear][creature_incapacitate][creature_grip][cc_humanoid][creature_mortal_strike]",
        }, { -- Paralyzing Shots
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1294569, 272271),
            tags = "[important][snare][slow][magic_debuff]",
        }, { -- Envenom
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}. Also, this cast can be interrupted."], 1289416, 261557),
            tags = "[poison][magic_debuff]",
        }, { -- Gorge
            text = format(L["{spell:%d} buff on {npc:%d}."], 1307098, 262035),
            tags = "[creature_mortal_strike]",
        }, { -- Mass Envenom
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}. Also, this cast can be interrupted."], 1307567, 263109),
            tags = "[important][poison][magic_debuff]",
        }, { -- Nascent Hunger
            text = format(L["{spell:%d} is cast by {npc:%d}."], 1306383, 261556),
            tags = "[creature_slow]",
        }, { -- Ravenous Claws
            text = format(L["{spell:%d} buff on {npc:%d}."], 1306333, 261553),
            tags = "[enrage]",
        },
    },
    [2825] = { -- Den of Nalorakk
        -- Boss
        { -- Toxic Spores
            text = format(L["{spell:%d} debuff is inflicted on the first boss {npc:%d}."], 1234846, 248710),
            tags = "[important][poison][magic_debuff]",
        }, { -- Rime Detonation
            text = format(L["{spell:%d} debuff is inflicted by not soaking the void zone on the second boss {npc:%d}."], 1263597,
                          261053),
            tags = "[slow][root][magic_debuff]",
        }, -- Trash
        { -- Feast of Misery
            text = format(L["{spell:%d} is channeled by {npc:%d}."], 1238687, 245855),
            tags = "[important][creature_mortal_strike]",
        }, { -- Frigid Roar
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}. Also, this cast can be interrupted."], 1309919, 241872),
            tags = "[important][snare][slow][magic_debuff]",
        }, { -- Glacial Tomb
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1241464, 241869),
            tags = "[important][root][slow][magic_debuff]",
        }, { -- Healing Breeze
            text = format(L["{spell:%d} buff is cast by {npc:%d}. Also, this cast can be interrupted."], 1297696, 241814),
            tags = "[important][purge][purge_spellsteal][creature_mortal_strike]",
        }, { -- Insatiable Hunger
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}, which is summoned by {npc:%d}."], 1238801, 245567, 245855),
            tags = "[important][curse]",
        }, { -- Bestial Wrath
            text = format(L["{spell:%d} buff on {npc:%d} and {npc:%d}."], 1246865, 245145, 245190),
            tags = "[enrage]",
        }, { -- Mother's Wrath
            text = format(L["{spell:%d} buff on {npc:%d}."], 1238053, 241808),
            tags = "[enrage]",
        }, { -- Razor Dive
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1238439, 241816),
            tags = "[bleed][physical_debuff]",
        },
    },
    [1762] = { -- Kings' Rest
        -- Boss
        { -- Animated Gold NPC
            text = format(L["Prevent {npc:%d} from reaching the first boss {npc:%d}."], 135406, 135322),
            tags = "[important][creature_slow][creature_stun]",
        }, { -- Drain Fluids
            text = format(L["Avoid {spell:%d} when the second boss {npc:%d} starts channeling."], 267618, 134993),
            tags = "[important][targeted_avoid]",
        }, { -- Barrel Through
            text = format(L["Avoid {spell:%d} when the third boss {npc:%d} charges at you."], 266951, 269808),
            tags = "[important][targeted_avoid]",
        }, { -- Severing Axe
            text = format(L["{spell:%d} debuff is inflicted by the third boss {npc:%d}."], 266231, 269811),
            tags = "[important][bleed][physical_debuff]",
        }, { -- Severing Axe
            text = format(L["Avoid {spell:%d} when the third boss {npc:%d} throws an axe."], 266231, 269811),
            tags = "[important][targeted_avoid]",
        }, { -- Poison Nova
            text = format(L["{spell:%d} debuff is inflicted by the third boss {npc:%d}. Also, this cast can be interrupted."],
                          267273, 135472),
            tags = "[poison][magic_debuff]",
        }, { -- Whirling Axe
            text = format(L["{spell:%d} debuff is inflicted by the third boss {npc:%d}. Also, this debuff can be avoided."],
                          266191, 269811),
            tags = "[bleed][physical_debuff]",
        }, { -- Aerial Smash
            text = format(L["Avoid {spell:%d} when the last boss {npc:%d} jumps at you."], 1303105, 136160),
            tags = "[targeted_avoid]",
        }, { -- Deathly Roar
            text = format(
              L["{spell:%d} debuff is inflicted by {npc:%d} on the last boss {npc:%d}. Also, this cast can be interrupted."],
              269369, 136984, 136160),
            tags = "[fear][magic_debuff]",
        }, { -- Impaling Spear
            text = format(L["{spell:%d} debuff is inflicted on the last boss {npc:%d}. Also, this debuff can be avoided."],
                          1302945, 136160),
            tags = "[bleed][physical_debuff]",
        }, { -- Savage Maul
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d} on the last boss {npc:%d}."], 1303490, 136976, 136160),
            tags = "[bleed][physical_debuff]",
        }, -- Trash
        { -- Wretched Discharge
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}. Also, this cast can be interrupted."], 267763, 270502),
            tags = "[super_important][disease][magic_debuff]",
        }, { -- Ancestral Fury
            text = format(L["{spell:%d} buff is cast by {npc:%d} (trash before {npc:%d})."], 269976, 134158, 135322),
            tags = "[super_important][enrage]",
        }, { -- Bind Soul
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d})."], 270920, 137478, 134993),
            tags = "[super_important][purge]",
        }, { -- Healing Tide Totem
            text = format(L["{spell:%d} is cast by {npc:%d} (trash before the third boss)."], 270497, 135239),
            tags = "[important][creature_mortal_strike]",
        }, { -- Hex
            text = format(
              L["{spell:%d} debuff is inflicted by {npc:%d} (trash before the third boss). Also, this cast can be interrupted."],
              270492, 135204),
            tags = "[important][curse][incapacitate][polymorph][magic_debuff]",
        }, { -- Hex Volley
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}. Also, this cast can be interrupted."], 269972, 134174),
            tags = "[important][curse][magic_debuff]",
        }, { -- Overload
            text = format(L["{spell:%d} is cast by {npc:%d} (trash before {npc:%d})."], 270889, 134331, 134993),
            tags = "[important][creature_grip]",
        }, { -- Unholy Mending
            text = format(L["{spell:%d} buff is cast by {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted."],
                          270901, 134251, 134993),
            tags = "[important][purge][purge_spellsteal][creature_mortal_strike]",
        }, { -- Bestial Berserk
            text = format(L["{spell:%d} buff is cast by {npc:%d}."], 1297763, 137486),
            tags = "[enrage]",
        }, { -- Bladestorm
            text = format(L["Avoid {spell:%d} when {npc:%d} starts channeling."], 270927, 137474),
            tags = "[targeted_avoid]",
        }, { -- Blood Drain
            text = format(L["{spell:%d} is cast by {npc:%d}."], 1297970, 137484),
            tags = "[creature_mortal_strike]",
        }, { -- Bloodthirsty Axe
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1301851, 135167),
            tags = "[bleed][physical_debuff]",
        }, { -- Bound by Shadow
            text = format(L["{spell:%d} buff on {npc:%d}."], 269935, 133943),
            tags = "[purge][purge_spellsteal]",
        }, { -- Captain's Bulwark
            text = format(L["{spell:%d} buff is cast by {npc:%d}."], 1296671, 137473),
            tags = "[purge][purge_spellsteal]",
        }, { -- Frost Shock
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d} (trash before the third boss)."], 270499, 135239),
            tags = "[snare][slow][magic_debuff]",
        }, { -- Lingering Fluid
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d})."], 271564, 137989, 134993),
            tags = "[poison][snare][slow][magic_debuff]",
        }, { -- Mortal Bleed
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1297918, 137484),
            tags = "[bleed][physical_debuff]",
        }, { -- Pit of Despair
            text = format(L["{spell:%d} debuff is inflicted by contact with {npc:%d}."], 276031, 133943),
            tags = "[fear][magic_debuff]",
        }, { -- Serpent Strike
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1306763, 137486),
            tags = "[poison][snare][slow][magic_debuff]",
        }, { -- Shadowfrost Bolt
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}. Also, this cast can be interrupted."], 1294815, 134174),
            tags = "[snare][slow][magic_debuff]",
        }, { -- Sudden Rupture
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1297781, 137485),
            tags = "[bleed][physical_debuff]",
        },
    },
    [2813] = { -- Murder Row
        -- Boss
        { -- Heartstop Poison
            text = format(L["{spell:%d} debuff is inflicted by the first boss {npc:%d}."], 474515, 234649),
            tags = "[important][poison][magic_debuff]",
        }, { -- Murder in a Row
            text = format(L["{spell:%d} debuff is inflicted by the first boss {npc:%d}. Also, this debuff can be avoided."],
                          474740, 234649),
            tags = "[bleed][physical_debuff]",
        }, -- Trash
        { -- Curse of Doom
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1217973, 235265),
            tags = "[super_important][curse][magic_debuff]",
        }, { -- Seduction
            text = format(L["{spell:%d} is channeled by {npc:%d}. Also, this channel can be interrupted."], 1201554, 236082),
            tags = "[important][sleep][magic_debuff][creature_stun][creature_fear][creature_incapacitate][creature_grip][cc_demon]",
        }, { -- Fel Rage
            text = format(L["{spell:%d} buff is cast by {npc:%d}. Also, this cast can be interrupted."], 1214922, 235267),
            tags = "[important][enrage]",
        }, { -- Back to Work!
            text = format(L["{spell:%d} buff is cast by {npc:%d}."], 1216970, 236897),
            tags = "[enrage]",
        }, { -- Cutpurse
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1216300, 236073),
            tags = "[bleed][physical_debuff]",
        }, { -- Fel Crazed
            text = format(L["{spell:%d} buff on {npc:%d}."], 1229433, 236084),
            tags = "[purge][purge_spellsteal]",
        }, { -- Fel Missiles
            text = format(L["{spell:%d} is channeled by {npc:%d}. Also, this channel can be interrupted."], 1216571, 236084),
            tags = "[creature_stun][creature_fear][creature_incapacitate][creature_grip][cc_humanoid]",
        }, { -- Flay
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1295427, 235267),
            tags = "[bleed][physical_debuff]",
        }, { -- Glaive Toss
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d} and {npc:%d}."], 1295035, 236071, 252529),
            tags = "[bleed][physical_debuff]",
        }, { -- Health Funnel
            text = format(L["{spell:%d} is channeled by {npc:%d}."], 1297682, 235265),
            tags = "[creature_mortal_strike]",
        }, { -- Health Funnel
            text = format(L["Avoid {spell:%d} when {npc:%d} starts channeling."], 1297682, 235265),
            tags = "[targeted_avoid]",
        }, { -- Heartstop Poison
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1216590, 236091),
            tags = "[poison][magic_debuff]",
        }, { -- Sharp Nail
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1311136, 236893),
            tags = "[bleed][physical_debuff]",
        },
    },
    [2521] = { -- Ruby Life Pools
        -- Boss
        -- Trash
        { -- Flaming Barrage
            text = format(L["{spell:%d} is channeled by {npc:%d} (trash before {npc:%d})."], 385536, 190206, 189232),
            tags = "[important][creature_stun][creature_fear][creature_incapacitate][creature_grip][cc_humanoid]",
        }, { -- Inferno
            text = format(L["Avoid {spell:%d} when {npc:%d} casts on last seconds."], 373692, 190034),
            tags = "[important][targeted_avoid]",
        }, { -- Blaze of Glory
            text = format(L["{spell:%d} buff on {npc:%d} (trash before {npc:%d})."], 373972, 190207, 189232),
            tags = "[purge][purge_spellsteal]",
        }, { -- Blazing Rush
            text = format(
              L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d}). Also, this debuff can be avoided."], 372796,
              187897, 188252),
            tags = "[bleed][physical_debuff]",
        }, { -- Cold Claws
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1305234, 189893),
            tags = "[snare][slow][magic_debuff]",
        }, { -- Ice Shield
            text = format(
              L["{spell:%d} is channeled by {npc:%d} (trash before {npc:%d}). Also, this channel can be interrupted."], 372743,
              188067, 188252),
            tags = "[creature_stun][creature_fear][creature_incapacitate][creature_grip][cc_humanoid]",
        }, { -- Stormcloud Barrier
            text = format(L["{spell:%d} buff on {npc:%d} (trash before {npc:%d})."], 391031, 197509, 199791),
            tags = "[purge][purge_spellsteal]",
        },
    },
    [1877] = { -- Temple of Sethraliss
        -- Boss
        { -- A Knot of Snakes
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d} on the second boss {npc:%d}."], 263958, 134388, 133384),
            tags = "[important][creature_stun][creature_fear][creature_incapacitate][creature_grip][cc_beast]",
        }, { -- Poison Spit
            text = format(
              L["{spell:%d} debuff is inflicted by {npc:%d} on the second boss {npc:%d}. Also, this cast can be interrupted."],
              267027, 134389, 133384),
            tags = "[important][poison][magic_debuff]",
        }, { -- Faithless Tormentor NPC
            text = format(L["Prevent {npc:%d} from reaching your healer on the last boss {npc:%d}."], 268317, 133392),
            tags = "[important][creature_slow][creature_grip]",
        }, -- Trash
        { -- Addle Mind
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}. Also, this cast can be interrupted."], 1314082, 134364),
            tags = "[important][curse][magic_debuff]",
        }, { -- Arrow Barrage
            text = format(L["{spell:%d} is channeled by {npc:%d}."], 1308113, 134600),
            tags = "[important][creature_stun][creature_fear][creature_incapacitate][creature_grip][cc_humanoid]",
        }, { -- Arrow Barrage
            text = format(L["Avoid {spell:%d} when {npc:%d} starts channeling."], 1308113, 134600),
            tags = "[important][targeted_avoid]",
        }, { -- Serrated Charge
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1291399, 134616),
            tags = "[important][bleed][physical_debuff]",
        }, { -- Accumulate Charge
            text = format(L["{spell:%d} buff on {npc:%d} (trash before {npc:%d})."], 1310739, 136076, 133389),
            tags = "[purge][purge_spellsteal]",
        }, { -- Cytotoxin
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1308148, 135562),
            tags = "[poison][magic_debuff]",
        }, { -- Essence Disruption
            text = format(L["{spell:%d} is channeled by {npc:%d}. Also, this channel can be interrupted."], 1303535, 269227),
            tags = "[creature_stun][creature_fear][creature_incapacitate][creature_grip][cc_humanoid]",
        }, { -- Poisoned Cheap Shot
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}. Also, this cast can be interrupted."], 1308100, 134602),
            tags = "[poison][magic_debuff]",
        }, { -- Shrouded Fang NPC
            text = format(L["{npc:%d} are in stealth near {npc:%d} before the first boss."], 134602, 134617),
            tags = "[stealth]",
        },
    },
    [2859] = { -- The Blinding Vale
        -- Boss
        { -- Thornblade
            text = format(L["{spell:%d} debuff is inflicted by the first boss {npc:%d}."], 1235865, 243030),
            tags = "[bleed][physical_debuff]",
        }, { -- Bloodthorn Roots
            text = format(L["{spell:%d} debuff is inflicted on the second boss {npc:%d}."], 1236658, 244887),
            tags = "[important][slow][root][magic_debuff]",
        }, { -- Incise
            text = format(L["{spell:%d} debuff is inflicted by the second boss {npc:%d}. Also, this debuff can be avoided."],
                          1237166, 244887),
            tags = "[bleed][physical_debuff]",
        }, { -- Grievous Thrash
            text = format(L["{spell:%d} debuff is inflicted by the third boss {npc:%d}."], 1241058, 245912),
            tags = "[important][bleed][physical_debuff]",
        }, { -- Thornspike
            text = format(L["{spell:%d} debuff is inflicted by the last boss {npc:%d}."], 1247746, 247676),
            tags = "[important][bleed][physical_debuff]",
        }, -- Trash
        { -- Lightbloom Pollination
            text = format(L["{spell:%d} is cast by {npc:%d}."], 1238158, 245345),
            tags = "[important][creature_mortal_strike]",
        }, { -- Toxic Spew
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1250937, 249756),
            tags = "[important][poison][magic_debuff]",
        }, { -- Grievous Gash
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1242135, 246871),
            tags = "[bleed][physical_debuff]",
        }, { -- Lightmaw Beams
            text = format(L["Avoid {spell:%d} when {npc:%d} starts channeling."], 1238368, 245513),
            tags = "[important][targeted_avoid]",
        }, { -- Potad-Toss
            text = format(L["{spell:%d} is cast by {npc:%d}."], 1250829, 250202),
            tags = "[creature_stun][creature_fear][creature_incapacitate][creature_grip][cc_elemental]",
        }, { -- Spore Spines
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1238084, 245410),
            tags = "[snare][slow][magic_debuff]",
        }, { -- Thornblade
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1238076, 245339),
            tags = "[bleed][physical_debuff]",
        },
    },
    [2923] = { -- Voidscar Arena
        -- Boss
        { -- Poison Splash
            text = format(L["{spell:%d} debuff is inflicted by the second boss {npc:%d}."], 1226031, 239008),
            tags = "[important][poison][magic_debuff]",
        }, { -- Mind-Numbing Poison
            text = format(L["{spell:%d} debuff is inflicted on the second boss {npc:%d}. Also, this debuff can be avoided."],
                          1263971, 239008),
            tags = "[poison][magic_debuff]",
        }, { -- Condensed Mass
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d} on the last boss {npc:%d}."], 1287450, 255001, 248015),
            tags = "[snare][slow][magic_debuff]",
        }, -- Trash
        { -- Devour
            text = format(L["{spell:%d} is cast by {npc:%d}."], 1300249, 268184),
            tags = "[important][creature_mortal_strike]",
        }, { -- Bloodsurge
            text = format(L["{spell:%d} buff on {npc:%d}."], 1254826, 238883),
            tags = "[enrage]",
        }, { -- Bolster
            text = format(L["{spell:%d} buff on {npc:%d}."], 1310319, 243985),
            tags = "[enrage]",
        }, { -- Corrosive Essence
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1289258, 263228),
            tags = "[poison][magic_debuff]",
        }, { -- Feral Rage
            text = format(L["{spell:%d} buff is cast by {npc:%d}."], 1249661, 249608),
            tags = "[enrage]",
        }, { -- Ferocious Leap
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1299133, 267545),
            tags = "[bleed][physical_debuff]",
        }, { -- Mad Shriek
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}. Also, this cast can be interrupted."], 1233398, 243766),
            tags = "[fear][physical_debuff]",
        }, { -- Mending Void
            text = format(L["{spell:%d} is channeled by {npc:%d}."], 1310324, 244708),
            tags = "[creature_mortal_strike][creature_stun][creature_fear][creature_incapacitate][creature_grip][cc_aberration]",
        }, { -- Rip and Slice
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1311778, 263228),
            tags = "[bleed][physical_debuff]",
        }, { -- Savage Leap
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1267894, 243988),
            tags = "[bleed][physical_debuff]",
        }, { -- Shell Guard
            text = format(L["{spell:%d} is channeled by {npc:%d}."], 1250021, 249603),
            tags = "[creature_stun][creature_fear][creature_incapacitate][cc_beast]",
        }, { -- Violent Sand
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1249621, 249590),
            tags = "[snare][slow][magic_debuff]",
        }, { -- Void Beam
            text = format(L["Avoid {spell:%d} when {npc:%d} starts channeling."], 1300138, 245950),
            tags = "[targeted_avoid]",
        },
    },
    -- Midnight
    [2811] = { -- Magisters' Terrace
        -- Boss
        { -- Ethereal Shackles
            text = format(L["{spell:%d} debuff is inflicted by the first boss {npc:%d}."], 1214038, 231861),
            tags = "[important][slow][root][magic_debuff]",
        }, { -- Hastening Ward
            text = format(L["{spell:%d} buff on the second boss {npc:%d}."], 1248689, 231863),
            tags = "[super_important][purge][purge_spellsteal]",
        }, { -- Entropy Orb
            text = format(L["{spell:%d} debuff is inflicted by contact with orbs on the last boss {npc:%d}."], 1269631, 231865),
            tags = "[important][slow][root][magic_debuff]",
        }, -- Trash
        { -- Power Word: Shield
            text = format(L["{spell:%d} buff is cast by {npc:%d}."], 1254306, 234486),
            tags = "[super_important][purge][purge_spellsteal]",
        }, { -- Consuming Shadows
            text = format(L["{spell:%d} is cast by {npc:%d}."], 1265977, 234068),
            tags = "[important][creature_mortal_strike]",
        }, { -- Runic Glaive
            text = format(L["Avoid {spell:%d} when {npc:%d} throws glaive."], 1244907, 240973),
            tags = "[important][targeted_avoid]",
        }, { -- Terror Wave
            text = format(
              L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted and LoS."],
              1264693, 249086, 231864),
            tags = "[important][fear]",
        }, { -- Arcane Beam
            text = format(L["Avoid {spell:%d} when {npc:%d} casts on last seconds."], 1282050, 257476),
            tags = "[targeted_avoid]",
        }, { -- Arcane Blade
            text = format(L["{spell:%d} buff on {npc:%d}."], 1252909, 234124),
            tags = "[purge][purge_spellsteal]",
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
            text = format(L["{spell:%d} debuff is inflicted by contact with {npc:%d} on the last boss {npc:%d}."], 1254175, 1531,
                          248605),
            tags = "[slow][root][magic_debuff]",
        }, -- Trash
        { -- Ritual Sacrifice
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1259794, 253683),
            tags = "[super_important][slow][root][magic_debuff][targeted_avoid]",
        }, { -- Grim Ward
            text = format(L["{spell:%d} buff on {npc:%d}."], 1270079, 248690),
            tags = "[important][purge][purge_spellsteal]",
        }, { -- Blood Frenzy
            text = format(L["{spell:%d} buff on {npc:%d}."], 1255765, 248684),
            tags = "[enrage]",
        }, { -- Frost Nova
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1271623, 249024),
            tags = "[slow][root][magic_debuff]",
        }, { -- Hooked Snare
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}. Also, this cast can be interrupted."], 1266381, 242964),
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
            tags = "[important][purge][purge_spellsteal]",
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
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}. Also, this debuff can be avoided."], 1282724, 251853),
            tags = "[fear]",
        }, { -- Leech Veil
            text = format(L["{spell:%d} is cast by {npc:%d}."], 1252204, 241645),
            tags = "[creature_stun][creature_fear][creature_incapacitate][creature_grip][creature_mortal_strike][cc_aberration]",
        }, { -- Smudge NPC
            text = format(L["Prevent {npc:%d} from reaching {npc:%d}."], 248769, 252903),
            tags = "[creature_slow][creature_grip]",
        },
    },
    -- Dragonflight
    [2526] = { -- Algeth'ar Academy
        -- Boss
        { -- Branch Out
            text = format(L["{spell:%d} debuff is inflicted on the first boss {npc:%d}."], 388623, 196482),
            tags = "[important][bleed][physical_debuff]",
        }, { -- Lasher Toxin
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d} on the first boss {npc:%d}."], 389033, 197398, 196482),
            tags = "[important][poison][magic_debuff]",
        }, { -- Savage Peck
            text = format(L["{spell:%d} debuff is inflicted by the second boss {npc:%d}."], 376997, 191736),
            tags = "[bleed][physical_debuff]",
        }, { -- Power Vacuum
            text = format(L["Mitigates effects of {spell:%d} on the last boss {npc:%d}."], 388822, 190609),
            tags = "[important][player_jump][player_movement_immune][alter_time]",
        }, -- Trash
        { -- Raging Screech
            text = format(L["{spell:%d} buff is cast by {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted."],
                          377389, 192333, 191736),
            tags = "[important][enrage]",
        }, { -- Monotonous Lecture
            text = format(
              L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted."],
              388392, 196044, 194181),
            tags = "[important][sleep]",
        }, { -- Monotonous Lecture
            text = format(L["{spell:%d} is cast by {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted."],
                          388392, 196044, 194181),
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
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d})."], 377344, 192329, 191736),
            tags = "[bleed][physical_debuff]",
        }, { -- Vile Bite
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d})."], 1282244, 197219, 196482),
            tags = "[bleed][physical_debuff]",
        },
    },
    [2805] = { -- Windrunner Spire
        -- Boss
        { -- Curse of Darkness
            text = format(L["{spell:%d} debuff is inflicted by the second boss {npc:%d}."], 1215803, 231626),
            tags = "[super_important][curse][magic_debuff]",
        }, { -- Intimidating Shout
            text = format(L["{spell:%d} debuff is inflicted by the third boss {npc:%d}. Also, this debuff can be avoided."],
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
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}. Also, this cast can be interrupted."], 473794, 232171),
            tags = "[important][poison][magic_debuff]",
        }, { -- Throw Axe
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1217094, 232447),
            tags = "[important][bleed][physical_debuff]",
        }, { -- Throw Axe
            text = format(L["Avoid {spell:%d} when {npc:%d} throws an axe."], 1217094, 232447),
            tags = "[important][targeted_avoid]",
        }, { -- Bolstering Flames
            text = format(L["{spell:%d} buff on {npc:%d}."], 1216860, 236891),
            tags = "[important][purge][purge_spellsteal]",
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
    -- Legion
    [1753] = { -- Seat of the Triumvirate
        -- Boss
        { -- Coalesced Void NPC
            text = format(L["Prevent {npc:%d} from reaching the first boss {npc:%d}."], 122716, 122313),
            tags = "[important][creature_slow][creature_grip][cc_aberration][cast_cc_aberration][cc_cyclone][cc_banish]",
        }, { -- Shadow Pounce
            text = format(L["{spell:%d} debuff is inflicted on the second boss {npc:%d}."], 245742, 122316),
            tags = "[bleed][physical_debuff]",
        }, { -- Mind Flay
            text = format(L["{spell:%d} is channeled by {npc:%d} on the third boss {npc:%d}."], 1268733, 122827, 124309),
            tags = "[creature_stun][creature_fear][creature_incapacitate][cc_aberration]",
        }, { -- Mind Flay
            text = format(L["Avoid {spell:%d} when {npc:%d} starts channeling on the third boss {npc:%d}."], 1268733, 122827,
                          124309),
            tags = "[targeted_avoid]",
        }, -- Trash
        { -- Chains of Subjugation
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1262509, 124171),
            tags = "[important][slow][snare][magic_debuff]",
        }, { -- Abyssal Enhancement
            text = format(L["{spell:%d} buff on {npc:%d}."], 1262526, 122404),
            tags = "[purge][purge_spellsteal]",
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
    -- Warlords of Draenor
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
            text = format(L["Jump back to the platform if you are thrown off by {npc:%d} on the last boss {npc:%d}."], 76267,
                          76266),
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
            text = format(L["{spell:%d} buff on {npc:%d}."], 1254670, 76205),
            tags = "[purge][purge_spellsteal]",
        }, { -- Solar Barrier
            text = format(L["{spell:%d} buff is cast by {npc:%d}."], 1273356, 79462),
            tags = "[purge][purge_spellsteal]",
        }, { -- Wrathful Wind
            text = format(L["{spell:%d} buff on {npc:%d}."], 1254678, 250992),
            tags = "[enrage]",
        },
    },
    -- Wrath of the Lich King
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
            text = format(L["{spell:%d} is channeled by {npc:%d}. The caster is immune to CC while it has {spell:%d}"], 1258997,
                          252707, 1271543),
            tags = "[important][creature_stun][creature_incapacitate][creature_grip][cc_undead]",
        }, { -- Curse of Torment
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1258434, 252561),
            tags = "[important][curse][magic_debuff]",
        }, { -- Permeating Cold
            text = format(L["{spell:%d} debuff is inflicted by {npc:%d}."], 1258437, 252566),
            tags = "[important][slow][snare][magic_debuff]",
        }, { -- Necromantic Infusion
            text = format(L["{spell:%d} buff is cast by {npc:%d}."], 1258448, 252551),
            tags = "[purge][purge_spellsteal]",
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
}
