local L = LibStub("AceLocale-3.0"):NewLocale("MythicPlusUtility", "deDE")
if not L then return end

-- Options
L["Anchor to Screen's"] = "An Bildschirm anchorn"
-- L["Background Color"] = true -- Translation missing
L["Background Opacity"] = "Hintergrunddeckkraft"
-- L["Background Settings"] = true -- Translation missing
L["Body Text Size"] = "Größe der Beschreibungen"
L["Disable Minimap Button"] = "Minimap-Button deaktivieren"
L["Dungeon Name Size"] = "Größe der Dungeon Namen"
L["Dungeon Preview"] = "Dungeon-Vorschau"
L["Height"] = "Höhe"
L["Hide not Important"] = "Unwichtige verstecken"
L["Hide on Mythic+ start"] = "Beim Start von Mythisch+ verstecken"
L["Hides dungeon entries that are marked with %s"] = "Dungeoneinträge die mit %s markiert sind verstecken"
-- L["Highlight Color"] = true -- Translation missing
L["Icon Label Size"] = "Größe der Zaubernamen"
L["Icon Size"] = "Größe der Icons"
L["Lock Window"] = "Fensterpositionierung verriegeln"
-- L["Minimap Icon"] = true -- Translation missing
L["Open Settings"] = "Einstellungen öffnen"
-- L["Season Select"] = true -- Translation missing
L["Show in"] = "Anzeigen in"
L["Show/Hide Utility Window"] = "Utilityfenster anzeigen/verstecken"
-- L["Talent Highlight Settings"] = true -- Translation missing
-- L["Text and Icon Settings"] = true -- Translation missing
L["Toggle Window"] = "Fenster umschalten"
-- L["Tooltip NPC Model Settings"] = true -- Translation missing
L["Width"] = "Breite"
L["Window Settings"] = "Fenstereinstellungen"
L["X-Offset"] = "X-Offset"
L["Y-Offset"] = "Y-Offset"

-- Difficulty
L["Normal"] = true
L["Heroic"] = "Heroisch"
L["Mythic"] = "Mythisch"

-- Other
-- L["No utility abilities for this dungeon"] = true -- Translation missing

-- Mythic+ Seasons
-- L["Midnight Season 2"] = true -- Translation missing
-- L["Midnight Season 1"] = true -- Translation missing

-- Dungeons
-- Midnight
-- L["Altar of Fangs"] = true -- Translation missing
L["Den of Nalorakk"] = "Nalorakks Bau"
L["Magisters' Terrace"] = "Terrasse der Magister"
L["Maisara Caverns"] = "Maisarakavernen"
L["Murder Row"] = "Mördergasse"
L["Nexus-Point Xenas"] = "Nexuspunkt Xenas"
L["The Blinding Vale"] = "Das blendende Tal"
L["Voidscar Arena"] = "Arena der Leerennarbe"
L["Windrunner Spire"] = "Windläuferturm"
-- Dragonflight
L["Algeth'ar Academy"] = "Akademie von Algeth'ar"
L["Ruby Life Pools"] = "Rubinlebensbecken"
-- Battle for Azeroth
L["Kings' Rest"] = "Die Königsruh"
L["Temple of Sethraliss"] = "Der Tempel von Sethraliss"
-- Legion
L["Seat of the Triumvirate"] = "Der Sitz des Triumvirats"
-- Warlords of Draenor
L["Skyreach"] = "Himmelsnadel"
-- Wrath of the Lich King
L["Pit of Saron"] = "Grube von Saron"

-- Dungeon entries
L["{spell:%d} buff is cast by {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted."] =
  "Zauber {spell:%d} wird von {npc:%d} gewirkt (Trash vor {npc:%d}). Dieser Zauber kann auch unterbrochen werden."
L["{spell:%d} buff is cast by {npc:%d}."] = "Buff {spell:%d} wird von {npc:%d} gewirkt."
L["{spell:%d} buff on {npc:%d} (trash before {npc:%d})."] = "Buff {spell:%d} auf {npc:%d} (Trash vor {npc:%d})."
L["{spell:%d} buff on {npc:%d}."] = "Buff {spell:%d} auf {npc:%d}."
L["{spell:%d} buff on the second boss {npc:%d}."] = "Buff {spell:%d} auf dem zweiten Boss {npc:%d}."
L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted and LoS."] =
  "Debuff {spell:%d} wird von {npc:%d} verursacht (Trash vor {npc:%d}). Dieser Zauber kann unterbrochen oder LoS werden."
L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted."] =
  "Debuff {spell:%d} wird von {npc:%d} verursacht (Trash vor {npc:%d}). Dieser Zauber kann unterbrochen werden."
L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d}). Also, this cast can be LoS."] =
  "Debuff {spell:%d} wird von {npc:%d} verursacht (Trash vor {npc:%d}). Dieser Zauber kann LoS werden."
L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d})."] =
  "Debuff {spell:%d} wird von {npc:%d} verursacht (Trash vor {npc:%d})."
L["{spell:%d} debuff is inflicted by {npc:%d} on the first boss {npc:%d}."] =
  "Debuff {spell:%d} wird von {npc:%d} beim ersten Boss {npc:%d} verursacht."
L["{spell:%d} debuff is inflicted by {npc:%d}. Also, this cast can be interrupted."] =
  "Debuff {spell:%d} wird von {npc:%d} verursacht. Dieser Zauber kann unterbrochen werden."
L["{spell:%d} debuff is inflicted by {npc:%d}. Also, this debuff can be avoided."] =
  "Debuff {spell:%d} wird von {npc:%d} verursacht. Dieser Debuff kann verhindert werden."
L["{spell:%d} debuff is inflicted by {npc:%d}."] = "Debuff {spell:%d} wird von {npc:%d} verursacht."
L["{spell:%d} debuff is inflicted by contact with {npc:%d} on the last boss {npc:%d}."] =
  "Debuff {spell:%d} wird durch Kontakt mit {npc:%d} beim letzten Boss {npc:%d} verursacht."
L["{spell:%d} debuff is inflicted by contact with orbs on the last boss {npc:%d}."] =
  "Debuff {spell:%d} wird durch Kontakt mit den Kugeln beim letzten Boss {npc:%d} verursacht."
L["{spell:%d} debuff is inflicted by the first boss {npc:%d}."] = "Debuff {spell:%d} wird vom ersten Boss {npc:%d} verursacht."
L["{spell:%d} debuff is inflicted by the second boss {npc:%d}."] = "Debuff {spell:%d} wird vom zweiten Boss {npc:%d} verursacht."
L["{spell:%d} debuff is inflicted by the third boss {npc:%d}. Also, this debuff can be avoided."] =
  "Debuff {spell:%d} wird vom dritten Boss {npc:%d} verursacht. Dieser Debuff kann verhindert werden."
L["{spell:%d} debuff is inflicted on the first boss {npc:%d}. Also, this debuff can be avoided."] =
  "Debuff {spell:%d} wird beim ersten Boss {npc:%d} verursacht. Dieser Debuff kann verhindert werden."
L["{spell:%d} debuff is inflicted on the first boss {npc:%d}."] = "Debuff {spell:%d} wird beim ersten Boss {npc:%d} verursacht."
L["{spell:%d} debuff is inflicted on the last boss {npc:%d}."] = "Debuff {spell:%d} wird beim letzten Boss {npc:%d} verursacht."
L["{spell:%d} debuff is inflicted on the second boss {npc:%d}."] = "Debuff {spell:%d} wird beim zweiten Boss {npc:%d} verursacht."
L["{spell:%d} is cast by {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted."] =
  "Zauber {spell:%d} wird von {npc:%d} (Trash vor {npc:%d}) gewirkt. Dieser Zauber kann unterbrochen werden."
L["{spell:%d} is cast by {npc:%d}."] = "Zauber {spell:%d} wird von {npc:%d} gewirkt."
L["{spell:%d} is channeled by {npc:%d} on the third boss {npc:%d}."] =
  "Zauber {spell:%d} wird von {npc:%d} beim dritten Boss {npc:%d} kanalisiert."
L["{spell:%d} is channeled by {npc:%d}. The caster is immune to CC while it has {spell:%d}"] =
  "Zauber {spell:%d} wird von {npc:%d} kanalisiert. Der Zaubernde ist CC-immun während er von {spell:%d} betroffen ist."
L["{spell:%d} is channeled by {npc:%d}."] = "Zauber {spell:%d} wird von {npc:%d} kanalisiert."
-- L["Avoid {spell:%d} when {npc:%d} casts on last seconds."] = true -- Translation missing
-- L["Avoid {spell:%d} when {npc:%d} jumps on you."] = true -- Translation missing
-- L["Avoid {spell:%d} when {npc:%d} jumps. Targets the furthest player."] = true -- Translation missing
-- L["Avoid {spell:%d} when {npc:%d} starts channeling on the third boss {npc:%d}."] = true -- Translation missing
-- L["Avoid {spell:%d} when {npc:%d} starts channeling."] = true -- Translation missing
-- L["Avoid {spell:%d} when {npc:%d} throws an axe."] = true -- Translation missing
-- L["Avoid {spell:%d} when the first boss {npc:%d} starts channeling."] = true -- Translation missing
-- L["Avoid {spell:%d} when the last boss {npc:%d} starts channeling."] = true -- Translation missing
-- L["Avoid {spell:%d} when totem starts channeling on the last boss {npc:%d}."] = true -- Translation missing
L["Mitigates effects of {spell:%d} on the last boss {npc:%d}."] =
  "Entschärft Effekte des Zaubers {spell:%d} beim letzetn Boss {npc:%d}."
L["Prevent {npc:%d} from reaching {npc:%d}."] = "{npc:%d} am Erreichen von {npc:%d} hindern."
L["Prevent {npc:%d} from reaching players or other {npc:%d} on the second boss {npc:%d}."] =
  "{npc:%d} am Erreichen von Spielern oder anderen {npc:%d} beim zweiten Boss {npc:%d} hindern."
L["Prevent {npc:%d} from reaching the first boss {npc:%d}."] = "{npc:%d} am erreichen des ersten Boss {npc:%d} hindern."
L["Slow {npc:%d} on the third boss {npc:%d}."] = "{npc:%d} beim dritten Boss {npc:%d} verlangsamen."
L["Stun {npc:%d} on the last boss {npc:%d}."] = "{npc:%d} beim letzten Boss {npc:%d} betäuben."
-- 1.1.9
-- L["{spell:%d} debuff is inflicted by {npc:%d}. Debuff is removed only from yourself."] = true -- Translation missing
-- L["{spell:%d} debuff is inflicted by the first boss {npc:%d}. Debuff is removed only from yourself."] = true -- Translation missing
-- L["{spell:%d} debuff is inflicted by the second boss {npc:%d}. Debuff is removed only from yourself."] = true -- Translation missing
-- L["Avoid {spell:%d} when {npc:%d} throws glaive."] = true -- Translation missing
-- L["Jump back to the platform if you are thrown off by {npc:%d} on the last boss {npc:%d}."] = true -- Translation missing
-- L["Skips part of the wind maze after the third boss {npc:%d}."] = true -- Translation missing
-- 1.2.1
-- L["Avoid {spell:%d} when the last boss {npc:%d} targets you."] = true -- Translation missing
-- L["Prevent {npc:%d} from reaching players on the third boss {npc:%d}."] = true -- Translation missing
-- L["Skips add pack before the last boss {npc:%d}. This is route specific."] = true -- Translation missing
-- 1.4.0
-- L["{npc:%d} are in stealth before the first boss."] = true -- Translation missing
-- L["{npc:%d} are in stealth in the room with the orb (trash before {npc:%d})."] = true -- Translation missing
-- L["{npc:%d} are in stealth near {npc:%d} before the first boss."] = true -- Translation missing
-- L["{spell:%d} buff is cast by {npc:%d} (trash before {npc:%d})."] = true -- Translation missing
-- L["{spell:%d} buff is cast by {npc:%d} on the third boss {npc:%d}."] = true -- Translation missing
-- L["{spell:%d} buff is cast by {npc:%d}. Also, this cast can be interrupted."] = true -- Translation missing
-- L["{spell:%d} buff on {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted."] = true -- Translation missing
-- L["{spell:%d} buff on {npc:%d} and {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted."] = true -- Translation missing
-- L["{spell:%d} buff on {npc:%d} and {npc:%d} (trash before {npc:%d})."] = true -- Translation missing
-- L["{spell:%d} buff on {npc:%d} and {npc:%d}."] = true -- Translation missing
-- L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d}). Also, this debuff can be avoided."] = true -- Translation missing
-- L["{spell:%d} debuff is inflicted by {npc:%d} (trash before the third boss). Also, this cast can be interrupted."] = true -- Translation missing
-- L["{spell:%d} debuff is inflicted by {npc:%d} (trash before the third boss)."] = true -- Translation missing
-- L["{spell:%d} debuff is inflicted by {npc:%d} and {npc:%d} (trash before {npc:%d}). Also, this debuff can be avoided."] = true -- Translation missing
-- L["{spell:%d} debuff is inflicted by {npc:%d} and {npc:%d} (trash before {npc:%d})."] = true -- Translation missing
-- L["{spell:%d} debuff is inflicted by {npc:%d} and {npc:%d}."] = true -- Translation missing
-- L["{spell:%d} debuff is inflicted by {npc:%d} on the last boss {npc:%d}. Also, this cast can be interrupted."] = true -- Translation missing
-- L["{spell:%d} debuff is inflicted by {npc:%d} on the last boss {npc:%d}."] = true -- Translation missing
-- L["{spell:%d} debuff is inflicted by {npc:%d} on the second boss {npc:%d}. Also, this cast can be interrupted."] = true -- Translation missing
-- L["{spell:%d} debuff is inflicted by {npc:%d} on the second boss {npc:%d}. Also, this debuff can be avoided."] = true -- Translation missing
-- L["{spell:%d} debuff is inflicted by {npc:%d} on the second boss {npc:%d}."] = true -- Translation missing
-- L["{spell:%d} debuff is inflicted by {npc:%d}, which is summoned by {npc:%d}."] = true -- Translation missing
-- L["{spell:%d} debuff is inflicted by contact with {npc:%d}."] = true -- Translation missing
-- L["{spell:%d} debuff is inflicted by not soaking the void zone on the second boss {npc:%d}."] = true -- Translation missing
-- L["{spell:%d} debuff is inflicted by the first boss {npc:%d}. Also, this debuff can be avoided."] = true -- Translation missing
-- L["{spell:%d} debuff is inflicted by the last boss {npc:%d}. Also, this debuff can be avoided."] = true -- Translation missing
-- L["{spell:%d} debuff is inflicted by the last boss {npc:%d}."] = true -- Translation missing
-- L["{spell:%d} debuff is inflicted by the second boss {npc:%d}. Also, this debuff can be avoided."] = true -- Translation missing
-- L["{spell:%d} debuff is inflicted by the third boss {npc:%d}. Also, this cast can be interrupted."] = true -- Translation missing
-- L["{spell:%d} debuff is inflicted by the third boss {npc:%d}."] = true -- Translation missing
-- L["{spell:%d} debuff is inflicted on the last boss {npc:%d}. Also, this debuff can be avoided."] = true -- Translation missing
-- L["{spell:%d} debuff is inflicted on the second boss {npc:%d}. Also, this cast can be interrupted."] = true -- Translation missing
-- L["{spell:%d} debuff is inflicted on the second boss {npc:%d}. Also, this debuff can be avoided."] = true -- Translation missing
-- L["{spell:%d} is cast by {npc:%d} (trash before {npc:%d})."] = true -- Translation missing
-- L["{spell:%d} is cast by {npc:%d} (trash before the third boss)."] = true -- Translation missing
-- L["{spell:%d} is cast by {npc:%d}. Also, this cast can be interrupted."] = true -- Translation missing
-- L["{spell:%d} is channeled by {npc:%d} (trash before {npc:%d}). Also, this channel can be interrupted."] = true -- Translation missing
-- L["{spell:%d} is channeled by {npc:%d} (trash before {npc:%d})."] = true -- Translation missing
-- L["{spell:%d} is channeled by {npc:%d} and {npc:%d} (trash before {npc:%d})."] = true -- Translation missing
-- L["{spell:%d} is channeled by {npc:%d}. Also, this channel can be interrupted."] = true -- Translation missing
-- L["Avoid {spell:%d} when the last boss {npc:%d} jumps at you."] = true -- Translation missing
-- L["Avoid {spell:%d} when the second boss {npc:%d} starts channeling."] = true -- Translation missing
-- L["Avoid {spell:%d} when the third boss {npc:%d} charges at you."] = true -- Translation missing
-- L["Avoid {spell:%d} when the third boss {npc:%d} throws an axe."] = true -- Translation missing
-- L["Prevent {npc:%d} from reaching your healer on the last boss {npc:%d}."] = true -- Translation missing

-- Icon Cosmetics Settings
-- L["\"Add Optional\""] = true -- Translation missing
-- L["\"Add\""] = true -- Translation missing
-- L["\"Known\""] = true -- Translation missing
-- L["\"Optional\""] = true -- Translation missing
-- L["\"Remove\""] = true -- Translation missing
-- L["Action Button Glow"] = true -- Translation missing
-- L["Add Not Important"] = true -- Translation missing
-- L["Add"] = true -- Translation missing
-- L["Ascending Alphabetical"] = true -- Translation missing
-- L["AtlasID Texture"] = true -- Translation missing
-- L["Auto Expand Height"] = true -- Translation missing
-- L["Autocast Shine"] = true -- Translation missing
-- L["Automatic"] = true -- Translation missing
-- L["Body Text"] = true -- Translation missing
-- L["Border"] = true -- Translation missing
-- L["Currently known abilities that will be useful for this dungeon and only contain dungeon entries that are marked with %s. If disabled, \"Known\" settings will be used."] =
--   true
-- Translation missing
-- L["Currently known abilities that will be useful for this dungeon."] = true -- Translation missing
-- L["Currently not known abilities that will be useful in this dungeon and only contain dungeon entries that are marked with %s. If disabled, \"Add\" settings will be used."] =
--   true
-- Translation missing
-- L["Currently not known abilities that will be useful in this dungeon."] = true -- Translation missing
-- L["Custom Text Settings"] = true -- Translation missing
-- L["Custom Text"] = true -- Translation missing
-- L["Custom_text"] = "Custom" -- Translation missing
-- L["Desaturate Icon"] = true -- Translation missing
-- L["Desaturate"] = true -- Translation missing
-- L["Descending Alphabetical"] = true -- Translation missing
-- L["Dungeon Name"] = true -- Translation missing
-- L["Enable Icon Glow"] = true -- Translation missing
-- L["Enable"] = true -- Translation missing
-- L["Fixed"] = true -- Translation missing
-- L["Font Settings"] = true -- Translation missing
-- L["Font"] = true -- Translation missing
-- L["Frequency"] = true -- Translation missing
-- L["Glow Color"] = true -- Translation missing
-- L["Glow Settings"] = true -- Translation missing
-- L["Glow Type"] = true -- Translation missing
-- L["Icon Color"] = true -- Translation missing
-- L["Icon Cosmetics Settings"] = true -- Translation missing
-- L["Icon"] = true -- Translation missing
-- L["Ignore"] = true -- Translation missing
-- L["Known Not Important"] = true -- Translation missing
-- L["Known"] = true -- Translation missing
-- L["Length"] = true -- Translation missing
-- L["Lines & Particles"] = true -- Translation missing
-- L["Max Height"] = true -- Translation missing
-- L["Monochrome Outline"] = true -- Translation missing
-- L["Monochrome Thick Outline"] = true -- Translation missing
-- L["Monochrome"] = true -- Translation missing
-- L["None"] = true -- Translation missing
-- L["Outline"] = true -- Translation missing
-- L["Overflow"] = true -- Translation missing
-- L["Paste Import String (replaces current profile)"] = true -- Translation missing
-- L["Pixel Glow"] = true -- Translation missing
-- L["Position Settings"] = true -- Translation missing
-- L["Remove"] = true -- Translation missing
-- L["Reverse Type"] = true -- Translation missing
-- L["Scale"] = true -- Translation missing
-- L["Set as white (#FFFFFF) to not change icon color"] = true -- Translation missing
-- L["Set to negative to inverse direction of rotation"] = true -- Translation missing
-- L["Shadow Color"] = true -- Translation missing
-- L["Shadow Settings"] = true -- Translation missing
-- L["Shadow X-Offset"] = true -- Translation missing
-- L["Shadow Y-Offset"] = true -- Translation missing
-- L["Shown Text"] = true -- Translation missing
-- L["Size Settings"] = true -- Translation missing
-- L["Sort by"] = true -- Translation missing
-- L["Talents that can be unlearned for this dungeon. Does not check if the talent is a prerequisite for another talent that is needed."] =
--   true
-- Translation missing
-- L["Text Color"] = true -- Translation missing
-- L["Text Settings"] = true -- Translation missing
-- L["Text Size"] = true -- Translation missing
-- L["Text supports {texture:IconID} and {atlas:AtlasID} replacers. Instead of IconID you can provide a path to the texture. For AtlasID, I recommend finding Atlas Names with TextureAtlasViewer addon."] =
--   true
-- Translation missing
-- L["Text"] = true -- Translation missing
-- L["Thick Outline"] = true -- Translation missing
-- L["Thickness"] = true -- Translation missing
-- L["Type"] = true -- Translation missing
-- L["Wrap"] = true -- Translation missing

-- Profile
-- L["|cff40ff40Profile imported successfully.|r"] = true -- Translation missing
-- L["|cffff4040Decompression failed.|r"] = true -- Translation missing
-- L["|cffff4040Invalid encoded string.|r"] = true -- Translation missing
-- L["|cffff4040Invalid serialised data.|r"] = true -- Translation missing
-- L["|cffff4040Missing profile data.|r"] = true -- Translation missing
-- L["|cffff4040Profile belongs to another addon.|r"] = true -- Translation missing
-- L["Export Profile"] = true -- Translation missing
-- L["Export String (Ctrl+C to copy)"] = true -- Translation missing
-- L["Export"] = true -- Translation missing
-- L["Import / Export"] = true -- Translation missing
-- L["Import Profile"] = true -- Translation missing
-- L["Profiles"] = true -- Translation missing
