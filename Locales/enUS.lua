local L = LibStub("AceLocale-3.0"):NewLocale("MythicPlusUtility", "enUS", true)

-- Options
L["Ability Content Settings"] = true
L["Anchor to Screen's"] = true
L["Background Color"] = true
L["Background Opacity"] = true
L["Background Settings"] = true
L["Body Text Size"] = true
L["Disable Minimap Button"] = true
L["Dungeon Name Size"] = true
L["Dungeon Options"] = true
L["Dungeon Preview"] = true
L["General Settings"] = true
L["Height"] = true
L["Hide not Important"] = true
L["Hide on Mythic+ start"] = true
L["Hides dungeon entries that are marked with %s"] = true
L["Highlight Color"] = true
L["Icon Label Size"] = true
L["Icon Size"] = true
L["Lock Window"] = true
L["Minimap Icon"] = true
L["Open Settings"] = true
L["Season Select"] = true
L["Show in"] = true
L["Show Unlearned Professions"] = true
L["Show/Hide Utility Window"] = true
L["Shows dungeon entries with unlearned professions."] = true
L["Talent Highlight Settings"] = true
L["Text and Icon Settings"] = true
L["Toggle Window"] = true
L["Tooltip NPC Model Settings"] = true
L["Width"] = true
L["Window Settings"] = true
L["X-Offset"] = true
L["Y-Offset"] = true

-- Difficulty
L["Normal"] = true
L["Heroic"] = true
L["Mythic"] = true

-- Other
L["No utility abilities for this dungeon"] = true

-- Mythic+ Seasons
L["Midnight Season 2"] = true
L["Midnight Season 1"] = true

-- Dungeons
-- Midnight
L["Altar of Fangs"] = true
L["Den of Nalorakk"] = true
L["Magisters' Terrace"] = true
L["Maisara Caverns"] = true
L["Murder Row"] = true
L["Nexus-Point Xenas"] = true
L["The Blinding Vale"] = true
L["Voidscar Arena"] = true
L["Windrunner Spire"] = true
-- Dragonflight
L["Algeth'ar Academy"] = true
L["Ruby Life Pools"] = true
-- Battle for Azeroth
L["Kings' Rest"] = true
L["Temple of Sethraliss"] = true
-- Legion
L["Seat of the Triumvirate"] = true
-- Warlords of Draenor
L["Skyreach"] = true
-- Wrath of the Lich King
L["Pit of Saron"] = true

-- Dungeon entries
L["{spell:%d} buff is cast by {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted."] = true
L["{spell:%d} buff is cast by {npc:%d}."] = true
L["{spell:%d} buff on {npc:%d} (trash before {npc:%d})."] = true
L["{spell:%d} buff on {npc:%d}."] = true
L["{spell:%d} buff on the second boss {npc:%d}."] = true
L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted and LoS."] = true
L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted."] = true
L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d}). Also, this cast can be LoS."] = true
L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d})."] = true
L["{spell:%d} debuff is inflicted by {npc:%d} on the first boss {npc:%d}."] = true
L["{spell:%d} debuff is inflicted by {npc:%d}. Also, this cast can be interrupted."] = true
L["{spell:%d} debuff is inflicted by {npc:%d}. Also, this debuff can be avoided."] = true
L["{spell:%d} debuff is inflicted by {npc:%d}."] = true
L["{spell:%d} debuff is inflicted by contact with {npc:%d} on the last boss {npc:%d}."] = true
L["{spell:%d} debuff is inflicted by contact with orbs on the last boss {npc:%d}."] = true
L["{spell:%d} debuff is inflicted by the first boss {npc:%d}."] = true
L["{spell:%d} debuff is inflicted by the second boss {npc:%d}."] = true
L["{spell:%d} debuff is inflicted by the third boss {npc:%d}. Also, this debuff can be avoided."] = true
L["{spell:%d} debuff is inflicted on the first boss {npc:%d}. Also, this debuff can be avoided."] = true
L["{spell:%d} debuff is inflicted on the first boss {npc:%d}."] = true
L["{spell:%d} debuff is inflicted on the last boss {npc:%d}."] = true
L["{spell:%d} debuff is inflicted on the second boss {npc:%d}."] = true
L["{spell:%d} is cast by {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted."] = true
L["{spell:%d} is cast by {npc:%d}."] = true
L["{spell:%d} is channeled by {npc:%d} on the third boss {npc:%d}."] = true
L["{spell:%d} is channeled by {npc:%d}. The caster is immune to CC while it has {spell:%d}"] = true
L["{spell:%d} is channeled by {npc:%d}."] = true
L["Avoid {spell:%d} when {npc:%d} casts on last seconds."] = true
L["Avoid {spell:%d} when {npc:%d} jumps on you."] = true
L["Avoid {spell:%d} when {npc:%d} jumps. Targets the furthest player."] = true
L["Avoid {spell:%d} when {npc:%d} starts channeling on the third boss {npc:%d}."] = true
L["Avoid {spell:%d} when {npc:%d} starts channeling."] = true
L["Avoid {spell:%d} when {npc:%d} throws an axe."] = true
L["Avoid {spell:%d} when the first boss {npc:%d} starts channeling."] = true
L["Avoid {spell:%d} when the last boss {npc:%d} starts channeling."] = true
L["Avoid {spell:%d} when totem starts channeling on the last boss {npc:%d}."] = true
L["Mitigates effects of {spell:%d} on the last boss {npc:%d}."] = true
L["Prevent {npc:%d} from reaching {npc:%d}."] = true
L["Prevent {npc:%d} from reaching players or other {npc:%d} on the second boss {npc:%d}."] = true
L["Prevent {npc:%d} from reaching the first boss {npc:%d}."] = true
L["Slow {npc:%d} on the third boss {npc:%d}."] = true
L["Stun {npc:%d} on the last boss {npc:%d}."] = true
-- 1.1.9
L["{spell:%d} debuff is inflicted by {npc:%d}. Debuff is removed only from yourself."] = true
L["{spell:%d} debuff is inflicted by the first boss {npc:%d}. Debuff is removed only from yourself."] = true
L["{spell:%d} debuff is inflicted by the second boss {npc:%d}. Debuff is removed only from yourself."] = true
L["Avoid {spell:%d} when {npc:%d} throws glaive."] = true
L["Jump back to the platform if you are thrown off by {npc:%d} on the last boss {npc:%d}."] = true
L["Skips part of the wind maze after the third boss {npc:%d}."] = true
-- 1.2.1
L["Avoid {spell:%d} when the last boss {npc:%d} targets you."] = true
L["Prevent {npc:%d} from reaching players on the third boss {npc:%d}."] = true
L["Skips add pack before the last boss {npc:%d}. This is route specific."] = true
-- 1.4.0
L["{npc:%d} are in stealth before the first boss."] = true
L["{npc:%d} are in stealth in the room with the orb (trash before {npc:%d})."] = true
L["{npc:%d} are in stealth near {npc:%d} before the first boss."] = true
L["{spell:%d} buff is cast by {npc:%d} (trash before {npc:%d})."] = true
L["{spell:%d} buff is cast by {npc:%d} on the third boss {npc:%d}."] = true
L["{spell:%d} buff is cast by {npc:%d}. Also, this cast can be interrupted."] = true
L["{spell:%d} buff on {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted."] = true
L["{spell:%d} buff on {npc:%d} and {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted."] = true
L["{spell:%d} buff on {npc:%d} and {npc:%d} (trash before {npc:%d})."] = true
L["{spell:%d} buff on {npc:%d} and {npc:%d}."] = true
L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d}). Also, this debuff can be avoided."] = true
L["{spell:%d} debuff is inflicted by {npc:%d} (trash before the third boss). Also, this cast can be interrupted."] = true
L["{spell:%d} debuff is inflicted by {npc:%d} (trash before the third boss)."] = true
L["{spell:%d} debuff is inflicted by {npc:%d} and {npc:%d} (trash before {npc:%d}). Also, this debuff can be avoided."] = true
L["{spell:%d} debuff is inflicted by {npc:%d} and {npc:%d} (trash before {npc:%d})."] = true
L["{spell:%d} debuff is inflicted by {npc:%d} and {npc:%d}."] = true
L["{spell:%d} debuff is inflicted by {npc:%d} on the last boss {npc:%d}. Also, this cast can be interrupted."] = true
L["{spell:%d} debuff is inflicted by {npc:%d} on the last boss {npc:%d}."] = true
L["{spell:%d} debuff is inflicted by {npc:%d} on the second boss {npc:%d}. Also, this cast can be interrupted."] = true
L["{spell:%d} debuff is inflicted by {npc:%d} on the second boss {npc:%d}. Also, this debuff can be avoided."] = true
L["{spell:%d} debuff is inflicted by {npc:%d} on the second boss {npc:%d}."] = true
L["{spell:%d} debuff is inflicted by {npc:%d}, which is summoned by {npc:%d}."] = true
L["{spell:%d} debuff is inflicted by contact with {npc:%d}."] = true
L["{spell:%d} debuff is inflicted by not soaking the void zone on the second boss {npc:%d}."] = true
L["{spell:%d} debuff is inflicted by the first boss {npc:%d}. Also, this debuff can be avoided."] = true
L["{spell:%d} debuff is inflicted by the last boss {npc:%d}. Also, this debuff can be avoided."] = true
L["{spell:%d} debuff is inflicted by the last boss {npc:%d}."] = true
L["{spell:%d} debuff is inflicted by the second boss {npc:%d}. Also, this debuff can be avoided."] = true
L["{spell:%d} debuff is inflicted by the third boss {npc:%d}. Also, this cast can be interrupted."] = true
L["{spell:%d} debuff is inflicted by the third boss {npc:%d}."] = true
L["{spell:%d} debuff is inflicted on the last boss {npc:%d}. Also, this debuff can be avoided."] = true
L["{spell:%d} debuff is inflicted on the second boss {npc:%d}. Also, this cast can be interrupted."] = true
L["{spell:%d} debuff is inflicted on the second boss {npc:%d}. Also, this debuff can be avoided."] = true
L["{spell:%d} is cast by {npc:%d} (trash before {npc:%d})."] = true
L["{spell:%d} is cast by {npc:%d} (trash before the third boss)."] = true
L["{spell:%d} is cast by {npc:%d}. Also, this cast can be interrupted."] = true
L["{spell:%d} is channeled by {npc:%d} (trash before {npc:%d}). Also, this channel can be interrupted."] = true
L["{spell:%d} is channeled by {npc:%d} (trash before {npc:%d})."] = true
L["{spell:%d} is channeled by {npc:%d} and {npc:%d} (trash before {npc:%d})."] = true
L["{spell:%d} is channeled by {npc:%d}. Also, this channel can be interrupted."] = true
L["Avoid {spell:%d} when the last boss {npc:%d} jumps at you."] = true
L["Avoid {spell:%d} when the second boss {npc:%d} starts channeling."] = true
L["Avoid {spell:%d} when the third boss {npc:%d} charges at you."] = true
L["Avoid {spell:%d} when the third boss {npc:%d} throws an axe."] = true
L["Prevent {npc:%d} from reaching your healer on the last boss {npc:%d}."] = true

-- Profession Dungeon entries
L["Interact with {npc:%d} located just after the two bundles of apples leading up to the first boss for {spell:%d}"] = true
L["Interact with {npc:%d} located on a small outlook leading up to the first boss for {spell:%d}"] = true

-- Icon Cosmetics Settings
L["\"Add Optional\""] = true
L["\"Add\""] = true
L["\"Known\""] = true
L["\"Optional\""] = true
L["\"Remove\""] = true
L["Action Button Glow"] = true
L["Add Not Important"] = true
L["Add"] = true
L["Ascending Alphabetical"] = true
L["AtlasID Texture"] = true
L["Auto Expand Height"] = true
L["Autocast Shine"] = true
L["Automatic"] = true
L["Body Text"] = true
L["Border"] = true
L["Currently known abilities that will be useful for this dungeon and only contain dungeon entries that are marked with %s. If disabled, \"Known\" settings will be used."] =
  true
L["Currently known abilities that will be useful for this dungeon."] = true
L["Currently not known abilities that will be useful in this dungeon and only contain dungeon entries that are marked with %s. If disabled, \"Add\" settings will be used."] =
  true
L["Currently not known abilities that will be useful in this dungeon."] = true
L["Custom Text Settings"] = true
L["Custom Text"] = true
L["Custom_text"] = "Custom"
L["Desaturate Icon"] = true
L["Desaturate"] = true
L["Descending Alphabetical"] = true
L["Dungeon Name"] = true
L["Enable Icon Glow"] = true
L["Enable"] = true
L["Fixed"] = true
L["Font Settings"] = true
L["Font"] = true
L["Frequency"] = true
L["Glow Color"] = true
L["Glow Settings"] = true
L["Glow Type"] = true
L["Icon Color"] = true
L["Icon Cosmetics Settings"] = true
L["Icon"] = true
L["Ignore"] = true
L["Known Not Important"] = true
L["Known"] = true
L["Length"] = true
L["Lines & Particles"] = true
L["Max Height"] = true
L["Monochrome Outline"] = true
L["Monochrome Thick Outline"] = true
L["Monochrome"] = true
L["None"] = true
L["Outline"] = true
L["Overflow"] = true
L["Paste Import String (replaces current profile)"] = true
L["Pixel Glow"] = true
L["Position Settings"] = true
L["Remove"] = true
L["Reverse Type"] = true
L["Scale"] = true
L["Set as white (#FFFFFF) to not change icon color"] = true
L["Set to negative to inverse direction of rotation"] = true
L["Shadow Color"] = true
L["Shadow Settings"] = true
L["Shadow X-Offset"] = true
L["Shadow Y-Offset"] = true
L["Shown Text"] = true
L["Size Settings"] = true
L["Sort by"] = true
L["Talents that can be unlearned for this dungeon. Does not check if the talent is a prerequisite for another talent that is needed."] =
  true
L["Text Color"] = true
L["Text Settings"] = true
L["Text Size"] = true
L["Text supports {texture:IconID} and {atlas:AtlasID} replacers. Instead of IconID you can provide a path to the texture. For AtlasID, I recommend finding Atlas Names with TextureAtlasViewer addon."] =
  true
L["Text"] = true
L["Thick Outline"] = true
L["Thickness"] = true
L["Type"] = true
L["Wrap"] = true

-- Profile
L["|cff40ff40Profile imported successfully.|r"] = true
L["|cffff4040Decompression failed.|r"] = true
L["|cffff4040Invalid encoded string.|r"] = true
L["|cffff4040Invalid serialised data.|r"] = true
L["|cffff4040Missing profile data.|r"] = true
L["|cffff4040Profile belongs to another addon.|r"] = true
L["Export Profile"] = true
L["Export String (Ctrl+C to copy)"] = true
L["Export"] = true
L["Import / Export"] = true
L["Import Profile"] = true
L["Profiles"] = true
