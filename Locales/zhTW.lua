local L = LibStub("AceLocale-3.0"):NewLocale("MythicPlusUtility", "zhTW")
if not L then return end

-- Options
L["Ability Content Settings"] = "技能內容設定"
L["Anchor to Screen's"] = "錨定至螢幕"
L["Background Color"] = "背景顏色"
L["Background Opacity"] = "背景透明度"
L["Background Settings"] = "背景設定"
L["Body Text Size"] = "內文文字大小"
L["Disable Minimap Button"] = "停用小地圖按鈕"
L["Dungeon Name Size"] = "地城名稱大小"
L["Dungeon Options"] = "地城選項"
L["Dungeon Preview"] = "地城預覽"
L["General Settings"] = "一般設定"
L["Height"] = "高度"
L["Hide not Important"] = "隱藏不重要項目"
L["Hide on Mythic+ start"] = "傳奇鑰石開始時隱藏"
L["Hides dungeon entries that are marked with %s"] = "隱藏標記為 %s 的地城條目"
L["Highlight Color"] = "醒目提示顏色"
L["Icon Label Size"] = "圖示標籤大小"
L["Icon Size"] = "圖示大小"
L["Lock Window"] = "鎖定視窗"
L["Minimap Icon"] = "小地圖按鈕"
L["Open Settings"] = "開啟設定"
L["Season Select"] = "選擇賽季"
L["Show in"] = "顯示於"
L["Show Unlearned Professions"] = "顯示未學會的專業技能"
L["Show/Hide Utility Window"] = "顯示/隱藏功能視窗"
L["Shows dungeon entries with unlearned professions."] = "顯示尚未學會的專業技能所對應的地城項目。"
L["Talent Highlight Settings"] = "天賦醒目提示設定"
L["Text and Icon Settings"] = "文字與圖示設定"
L["Toggle Window"] = "切換視窗顯示"
L["Tooltip NPC Model Settings"] = "NPC 模型提示資訊設定"
L["Width"] = "寬度"
L["Window Settings"] = "視窗設定"
L["X-Offset"] = "X 軸位移"
L["Y-Offset"] = "Y 軸位移"

-- Difficulty
L["Normal"] = "普通"
L["Heroic"] = "英雄"
L["Mythic"] = "傳奇"

-- Other
L["No utility abilities for this dungeon"] = "該地城沒有功能性技能"

-- Mythic+ Seasons
L["Midnight Season 2"] = "至暗之夜 第2賽季"
L["Midnight Season 1"] = "至暗之夜 第1賽季"

-- Dungeon entries
L["{spell:%d} buff is cast by {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted."] =
  "{spell:%d} buff由 {npc:%d} 施放（{npc:%d} 前的小怪），該施法可被打斷。"
L["{spell:%d} buff is cast by {npc:%d}."] = "{spell:%d} buff由 {npc:%d} 施放。"
L["{spell:%d} buff on {npc:%d} (trash before {npc:%d})."] = "{spell:%d} buff 在 {npc:%d} 身上。（{npc:%d} 前的小怪）"
L["{spell:%d} buff on {npc:%d}."] = "{spell:%d} buff 在 {npc:%d} 身上。"
L["{spell:%d} buff on the second boss {npc:%d}."] = "{spell:%d} buff 在第二個首領 {npc:%d} 身上。"
L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted and LoS."] =
  "{spell:%d} debuff 由 {npc:%d} 施加（{npc:%d} 前的小怪），該施法可被打斷或卡視角躲避。"
L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted."] =
  "{spell:%d} debuff由 {npc:%d} 施加（{npc:%d} 前的小怪），該施法可被打斷。"
L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d}). Also, this cast can be LoS."] =
  "{spell:%d} debuff 由 {npc:%d} 施加（{npc:%d} 前的小怪），該施法可被卡視角躲避。"
L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d})."] =
  "{spell:%d} debuff由 {npc:%d} 施加（{npc:%d} 前的小怪）。"
L["{spell:%d} debuff is inflicted by {npc:%d} on the first boss {npc:%d}."] =
  "{spell:%d} debuff由 {npc:%d} 施加，在第一個首領 {npc:%d} 戰鬥中。"
L["{spell:%d} debuff is inflicted by {npc:%d}. Also, this cast can be interrupted."] =
  "{spell:%d} debuff由 {npc:%d} 施加，該施法可被打斷。"
L["{spell:%d} debuff is inflicted by {npc:%d}. Also, this debuff can be avoided."] =
  "{spell:%d} debuff由 {npc:%d} 施加，該debuff可以躲避。"
L["{spell:%d} debuff is inflicted by {npc:%d}."] = "{spell:%d} debuff由 {npc:%d} 施加。"
L["{spell:%d} debuff is inflicted by contact with {npc:%d} on the last boss {npc:%d}."] =
  "{spell:%d} debuff 在接觸 {npc:%d} 時施加，在尾王 {npc:%d} 戰鬥中。"
L["{spell:%d} debuff is inflicted by contact with orbs on the last boss {npc:%d}."] =
  "撞球會受到 {spell:%d} debuff，在尾王 {npc:%d} 戰鬥中。"
L["{spell:%d} debuff is inflicted by the first boss {npc:%d}."] = "{spell:%d} debuff由第一個首領 {npc:%d} 施加。"
L["{spell:%d} debuff is inflicted by the second boss {npc:%d}."] = "{spell:%d} debuff由第二個首領 {npc:%d} 施加。"
L["{spell:%d} debuff is inflicted by the third boss {npc:%d}. Also, this debuff can be avoided."] =
  "{spell:%d} debuff由第三個首領 {npc:%d} 施加，該debuff可以躲避。"
L["{spell:%d} debuff is inflicted on the first boss {npc:%d}. Also, this debuff can be avoided."] =
  "{spell:%d} debuff 會在第一個首領 {npc:%d} 戰鬥中施加，該debuff可以躲避。"
L["{spell:%d} debuff is inflicted on the first boss {npc:%d}."] =
  "{spell:%d} debuff 會在第一個首領 {npc:%d} 戰鬥中施加。"
L["{spell:%d} debuff is inflicted on the last boss {npc:%d}."] = "{spell:%d} debuff 會在尾王 {npc:%d} 戰鬥中施加。"
L["{spell:%d} debuff is inflicted on the second boss {npc:%d}."] =
  "{spell:%d} debuff 會在第二個首領 {npc:%d} 戰鬥中施加。"
L["{spell:%d} is cast by {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted."] =
  "{spell:%d} 由 {npc:%d} 施放（{npc:%d} 前的小怪），該施法可被打斷。"
L["{spell:%d} is cast by {npc:%d}."] = "{spell:%d} 由 {npc:%d} 施放。"
L["{spell:%d} is channeled by {npc:%d} on the third boss {npc:%d}."] =
  "{spell:%d} 由 {npc:%d} 在第三個首領 {npc:%d} 戰鬥中引導。"
L["{spell:%d} is channeled by {npc:%d}. The caster is immune to CC while it has {spell:%d}"] =
  "{spell:%d} 由 {npc:%d} 引導，在擁有 {spell:%d} 時免疫控制。"
L["{spell:%d} is channeled by {npc:%d}."] = "{spell:%d} 由 {npc:%d} 引導。"
L["Avoid {spell:%d} when {npc:%d} casts on last seconds."] = "在最後一秒躲避 {spell:%d}，當 {npc:%d} 施放時。"
L["Avoid {spell:%d} when {npc:%d} jumps on you."] = "躲避 {spell:%d}，當 {npc:%d} 跳向你時。"
L["Avoid {spell:%d} when {npc:%d} jumps. Targets the furthest player."] =
  "躲避 {spell:%d}，當 {npc:%d} 跳躍時。該技能會鎖定最遠的玩家。"
L["Avoid {spell:%d} when {npc:%d} starts channeling on the third boss {npc:%d}."] =
  "躲避 {spell:%d}，當 {npc:%d} 開始引導時，在第三個首領 {npc:%d} 戰鬥中。"
L["Avoid {spell:%d} when {npc:%d} starts channeling."] = "躲避 {spell:%d}，當 {npc:%d} 開始引導時。"
L["Avoid {spell:%d} when {npc:%d} throws an axe."] = "躲避 {spell:%d}，當 {npc:%d} 投擲斧頭時。"
L["Avoid {spell:%d} when the first boss {npc:%d} starts channeling."] =
  "躲避 {spell:%d}，當第一個首領 {npc:%d} 開始引導時。"
L["Avoid {spell:%d} when the last boss {npc:%d} starts channeling."] = "躲避 {spell:%d}，當尾王 {npc:%d} 開始引導時。"
L["Avoid {spell:%d} when totem starts channeling on the last boss {npc:%d}."] =
  "躲避 {spell:%d}，當圖騰開始引導時，在尾王 {npc:%d} 戰鬥中。"
L["Mitigates effects of {spell:%d} on the last boss {npc:%d}."] = "減輕 {spell:%d} 效果，在尾王 {npc:%d} 戰鬥中。"
L["Prevent {npc:%d} from reaching {npc:%d}."] = "阻止 {npc:%d} 接觸 {npc:%d}。"
L["Prevent {npc:%d} from reaching players or other {npc:%d} on the second boss {npc:%d}."] =
  "阻止 {npc:%d} 接觸玩家或其他 {npc:%d}，在第二個首領 {npc:%d} 戰鬥中。"
L["Prevent {npc:%d} from reaching the first boss {npc:%d}."] = "阻止 {npc:%d} 接觸第一個首領 {npc:%d}。"
L["Slow {npc:%d} on the third boss {npc:%d}."] = "減速 {npc:%d}，在第三個首領 {npc:%d} 戰鬥中。"
L["Stun {npc:%d} on the last boss {npc:%d}."] = "擊暈 {npc:%d}，在尾王 {npc:%d} 戰鬥中。"
-- 1.1.9
L["{spell:%d} debuff is inflicted by {npc:%d}. Debuff is removed only from yourself."] =
  "{spell:%d} debuff由 {npc:%d} 施加，該debuff只能由自己驅散。"
L["{spell:%d} debuff is inflicted by the first boss {npc:%d}. Debuff is removed only from yourself."] =
  "{spell:%d} debuff由第一個首領 {npc:%d} 施加，該debuff只能由自己驅散。"
L["{spell:%d} debuff is inflicted by the second boss {npc:%d}. Debuff is removed only from yourself."] =
  "{spell:%d} debuff由第二個首領 {npc:%d} 施加，該debuff只能由自己驅散。"
L["Avoid {spell:%d} when {npc:%d} throws glaive."] = "躲避 {spell:%d}，當 {npc:%d} 投擲戰刃時。"
L["Jump back to the platform if you are thrown off by {npc:%d} on the last boss {npc:%d}."] =
  "如果被 {npc:%d} 擊飛，跳回平臺，在尾王 {npc:%d} 戰鬥中。"
L["Skips part of the wind maze after the third boss {npc:%d}."] = "跳過第三個首領 {npc:%d} 後面的風通道"
-- 1.2.1
L["Avoid {spell:%d} when the last boss {npc:%d} targets you."] = "躲避 {spell:%d}，當尾王 {npc:%d} 點名你時。"
L["Prevent {npc:%d} from reaching players on the third boss {npc:%d}."] =
  "阻止 {npc:%d} 接觸玩家，在第三個首領 {npc:%d} 戰鬥中。"
L["Skips add pack before the last boss {npc:%d}. This is route specific."] =
  "跳過尾王 {npc:%d} 前的小怪。僅適用於特定路線。"
-- 1.4.0
L["{npc:%d} are in stealth before the first boss."] = "{npc:%d} 在第一個首領前處於潛行狀態。"
L["{npc:%d} are in stealth in the room with the orb (trash before {npc:%d})."] =
  "{npc:%d} 在有球的房間內處於潛行狀態（{npc:%d} 前的小怪）。"
L["{npc:%d} are in stealth near {npc:%d} before the first boss."] =
  "{npc:%d} 在第一個首領前的 {npc:%d} 附近處於潛行狀態。"
L["{spell:%d} buff is cast by {npc:%d} (trash before {npc:%d})."] =
  "{spell:%d} buff由 {npc:%d} 施放（{npc:%d} 前的小怪）。"
L["{spell:%d} buff is cast by {npc:%d} on the third boss {npc:%d}."] =
  "{spell:%d} buff由 {npc:%d} 施放，在第三個首領 {npc:%d} 戰鬥中。"
L["{spell:%d} buff is cast by {npc:%d}. Also, this cast can be interrupted."] =
  "{spell:%d} buff由 {npc:%d} 施放，該施法可被打斷。"
L["{spell:%d} buff on {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted."] =
  "{spell:%d} buff 在 {npc:%d} 身上（{npc:%d} 前的小怪），該施法可被打斷。"
L["{spell:%d} buff on {npc:%d} and {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted."] =
  "{spell:%d} buff 在 {npc:%d} 和 {npc:%d} 身上（{npc:%d} 前的小怪），該施法可被打斷。"
L["{spell:%d} buff on {npc:%d} and {npc:%d} (trash before {npc:%d})."] =
  "{spell:%d} buff 在 {npc:%d} 和 {npc:%d} 身上（{npc:%d} 前的小怪）。"
L["{spell:%d} buff on {npc:%d} and {npc:%d}."] = "{spell:%d} buff 在 {npc:%d} 和 {npc:%d} 身上。"
L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d}). Also, this debuff can be avoided."] =
  "{spell:%d} debuff由 {npc:%d} 施加（{npc:%d} 前的小怪），該debuff可以躲避。"
L["{spell:%d} debuff is inflicted by {npc:%d} (trash before the third boss). Also, this cast can be interrupted."] =
  "{spell:%d} debuff由 {npc:%d} 施加（第三個首領前的小怪），該施法可被打斷。"
L["{spell:%d} debuff is inflicted by {npc:%d} (trash before the third boss)."] =
  "{spell:%d} debuff由 {npc:%d} 施加（第三個首領前的小怪）。"
L["{spell:%d} debuff is inflicted by {npc:%d} and {npc:%d} (trash before {npc:%d}). Also, this debuff can be avoided."] =
  "{spell:%d} debuff由 {npc:%d} 和 {npc:%d} 施加（{npc:%d} 前的小怪），該debuff可以躲避。"
L["{spell:%d} debuff is inflicted by {npc:%d} and {npc:%d} (trash before {npc:%d})."] =
  "{spell:%d} debuff由 {npc:%d} 和 {npc:%d} 施加（{npc:%d} 前的小怪）。"
L["{spell:%d} debuff is inflicted by {npc:%d} and {npc:%d}."] = "{spell:%d} debuff由 {npc:%d} 和 {npc:%d} 施加。"
L["{spell:%d} debuff is inflicted by {npc:%d} on the last boss {npc:%d}. Also, this cast can be interrupted."] =
  "{spell:%d} debuff由 {npc:%d} 施加，在尾王 {npc:%d} 戰鬥中，該施法可被打斷。"
L["{spell:%d} debuff is inflicted by {npc:%d} on the last boss {npc:%d}."] =
  "{spell:%d} debuff由 {npc:%d} 施加，在尾王 {npc:%d} 戰鬥中。"
L["{spell:%d} debuff is inflicted by {npc:%d} on the second boss {npc:%d}. Also, this cast can be interrupted."] =
  "{spell:%d} debuff由 {npc:%d} 施加，在第二個首領 {npc:%d} 戰鬥中，該施法可被打斷。"
L["{spell:%d} debuff is inflicted by {npc:%d} on the second boss {npc:%d}. Also, this debuff can be avoided."] =
  "{spell:%d} debuff由 {npc:%d} 施加，在第二個首領 {npc:%d} 戰鬥中，該debuff可以躲避。"
L["{spell:%d} debuff is inflicted by {npc:%d} on the second boss {npc:%d}."] =
  "{spell:%d} debuff由 {npc:%d} 施加，在第二個首領 {npc:%d} 戰鬥中。"
L["{spell:%d} debuff is inflicted by {npc:%d}, which is summoned by {npc:%d}."] =
  "{spell:%d} debuff由 {npc:%d} 施加，該單位由 {npc:%d} 召喚。"
L["{spell:%d} debuff is inflicted by contact with {npc:%d}."] = "{spell:%d} debuff 會因接觸 {npc:%d} 而受到。"
L["{spell:%d} debuff is inflicted by not soaking the void zone on the second boss {npc:%d}."] =
  "未進入虛空區域分擔會受到 {spell:%d} debuff，在第二個首領 {npc:%d} 戰鬥中。"
L["{spell:%d} debuff is inflicted by the first boss {npc:%d}. Also, this debuff can be avoided."] =
  "{spell:%d} debuff由第一個首領 {npc:%d} 施加，該debuff可以躲避。"
L["{spell:%d} debuff is inflicted by the last boss {npc:%d}. Also, this debuff can be avoided."] =
  "{spell:%d} debuff由尾王 {npc:%d} 施加，該debuff可以躲避。"
L["{spell:%d} debuff is inflicted by the last boss {npc:%d}."] = "{spell:%d} debuff由尾王 {npc:%d} 施加。"
L["{spell:%d} debuff is inflicted by the second boss {npc:%d}. Also, this debuff can be avoided."] =
  "{spell:%d} debuff由第二個首領 {npc:%d} 施加，該debuff可以躲避。"
L["{spell:%d} debuff is inflicted by the third boss {npc:%d}. Also, this cast can be interrupted."] =
  "{spell:%d} debuff由第三個首領 {npc:%d} 施加，該施法可被打斷。"
L["{spell:%d} debuff is inflicted by the third boss {npc:%d}."] = "{spell:%d} debuff由第三個首領 {npc:%d} 施加。"
L["{spell:%d} debuff is inflicted on the last boss {npc:%d}. Also, this debuff can be avoided."] =
  "{spell:%d} debuff 會在尾王 {npc:%d} 戰鬥中施加，該debuff可以躲避。"
L["{spell:%d} debuff is inflicted on the second boss {npc:%d}. Also, this cast can be interrupted."] =
  "{spell:%d} debuff 會在第二個首領 {npc:%d} 戰鬥中施加，該施法可被打斷。"
L["{spell:%d} debuff is inflicted on the second boss {npc:%d}. Also, this debuff can be avoided."] =
  "{spell:%d} debuff 會在第二個首領 {npc:%d} 戰鬥中施加，該debuff可以躲避。"
L["{spell:%d} is cast by {npc:%d} (trash before {npc:%d})."] = "{spell:%d} 由 {npc:%d} 施放（{npc:%d} 前的小怪）。"
L["{spell:%d} is cast by {npc:%d} (trash before the third boss)."] =
  "{spell:%d} 由 {npc:%d} 施放（第三個首領前的小怪）。"
L["{spell:%d} is cast by {npc:%d}. Also, this cast can be interrupted."] =
  "{spell:%d} 由 {npc:%d} 施放，該施法可被打斷。"
L["{spell:%d} is channeled by {npc:%d} (trash before {npc:%d}). Also, this channel can be interrupted."] =
  "{spell:%d} 由 {npc:%d} 引導（{npc:%d} 前的小怪），該引導可被打斷。"
L["{spell:%d} is channeled by {npc:%d} (trash before {npc:%d})."] = "{spell:%d} 由 {npc:%d} 引導（{npc:%d} 前的小怪）。"
L["{spell:%d} is channeled by {npc:%d} and {npc:%d} (trash before {npc:%d})."] =
  "{spell:%d} 由 {npc:%d} 和 {npc:%d} 引導（{npc:%d} 前的小怪）。"
L["{spell:%d} is channeled by {npc:%d}. Also, this channel can be interrupted."] =
  "{spell:%d} 由 {npc:%d} 引導，該引導可被打斷。"
L["Avoid {spell:%d} when the last boss {npc:%d} jumps at you."] = "躲避 {spell:%d}，當尾王 {npc:%d} 跳向你時。"
L["Avoid {spell:%d} when the second boss {npc:%d} starts channeling."] =
  "躲避 {spell:%d}，當第二個首領 {npc:%d} 開始引導時。"
L["Avoid {spell:%d} when the third boss {npc:%d} charges at you."] =
  "躲避 {spell:%d}，當第三個首領 {npc:%d} 向你沖鋒時。"
L["Avoid {spell:%d} when the third boss {npc:%d} throws an axe."] =
  "躲避 {spell:%d}，當第三個首領 {npc:%d} 投擲斧頭時。"
L["Prevent {npc:%d} from reaching your healer on the last boss {npc:%d}."] =
  "阻止 {npc:%d} 靠近你的治療，在尾王 {npc:%d} 戰鬥中。"
-- 1.4.1
L["Remove the curse from {npc:%d}, which are scattered throughout the dungeon. Then interact with them to receive {spell:%d}."] =
  "為散布在地城各處的 {npc:%d} 驅散詛咒，然後與其互動，以獲得 {spell:%d}。"

-- Profession Dungeon entries
L["After the second boss, go up the stairs to the {npc:%d} mini-boss room and interact with {npc:%d} in the top left corner next to the serpent eggs for {spell:%d}."] =
  "擊敗第二個首領後，前往 {npc:%d} 小首領房間，與左上角蛇蛋旁的 {npc:%d} 互動，以獲得 {spell:%d}。"
L["Interact with {npc:%d} located just after the two bundles of apples leading up to the first boss for {spell:%d}."] =
  "與通往第一個首領路上兩堆蘋果後方的 {npc:%d} 互動，以獲得 {spell:%d}。"
L["Interact with {npc:%d} located on a small outlook leading up to the first boss for {spell:%d}."] =
  "與通往第一個首領路旁小平臺上的 {npc:%d} 互動，以獲得 {spell:%d}。"

-- Icon Cosmetics Settings
L["\"Add Optional\""] = "建議學會（可選）"
L["\"Add\""] = "建議學會"
L["\"Known\""] = "已學會"
L["\"Optional\""] = "可選"
L["\"Remove\""] = "可移除"
L["Action Button Glow"] = "快捷列按鈕發光"
L["Add Not Important"] = "建議學會（不重要）"
L["Add"] = "建議學會"
L["Ascending Alphabetical"] = "按字母升冪排列"
L["AtlasID Texture"] = "AtlasID 材質"
L["Auto Expand Height"] = "自動延展高度"
L["Autocast Shine"] = "自動施法閃光"
L["Automatic"] = "自動"
L["Body Text"] = "內文"
L["Border"] = "邊框"
L["Currently known abilities that will be useful for this dungeon and only contain dungeon entries that are marked with %s. If disabled, \"Known\" settings will be used."] =
  "當前已學習且對該地城有用的技能，僅包含標記為 %s 的地城條目。若禁用，則使用“已學習”設置。"
L["Currently known abilities that will be useful for this dungeon."] = "目前已學會且對此地城有用的技能。"
L["Currently not known abilities that will be useful in this dungeon and only contain dungeon entries that are marked with %s. If disabled, \"Add\" settings will be used."] =
  "當前未學習但對該地城有用的技能，僅包含標記為 %s 的地城條目。若禁用，則使用“推薦學習”設置。"
L["Currently not known abilities that will be useful in this dungeon."] = "目前尚未學會但對此地城有用的技能。"
L["Custom Text Settings"] = "自訂文字設定"
L["Custom Text"] = "自訂文字"
L["Custom_text"] = "自訂"
L["Desaturate Icon"] = "圖示去色"
L["Desaturate"] = "去色"
L["Descending Alphabetical"] = "按字母降冪排列"
L["Dungeon Name"] = "地城名稱"
L["Enable Icon Glow"] = "啟用圖示發光"
L["Enable"] = "啟用"
L["Fixed"] = "固定"
L["Font Settings"] = "字型設定"
L["Font"] = "字型"
L["Frequency"] = "頻率"
L["Glow Color"] = "發光顏色"
L["Glow Settings"] = "發光設定"
L["Glow Type"] = "發光類型"
L["Icon Color"] = "圖示顏色"
L["Icon Cosmetics Settings"] = "技能分類外觀設定"
L["Icon"] = "圖示"
L["Ignore"] = "忽略"
L["Known Not Important"] = "已學會（不重要）"
L["Known"] = "已學會"
L["Length"] = "長度"
L["Lines & Particles"] = "線條與粒子"
L["Max Height"] = "最大高度"
L["Monochrome Outline"] = "單色描邊"
L["Monochrome Thick Outline"] = "單色粗描邊"
L["Monochrome"] = "單色"
L["None"] = "無"
L["Outline"] = "描邊"
L["Overflow"] = "溢出"
L["Paste Import String (replaces current profile)"] = "貼上匯入字串（會取代目前的設定檔）"
L["Pixel Glow"] = "像素發光"
L["Position Settings"] = "位置設定"
L["Remove"] = "可移除"
L["Reverse Type"] = "反向類型"
L["Scale"] = "縮放比例"
L["Set as white (#FFFFFF) to not change icon color"] = "設為白色（#FFFFFF）即可維持圖示原色"
L["Set to negative to inverse direction of rotation"] = "設為負值即可反轉旋轉方向"
L["Shadow Color"] = "陰影顏色"
L["Shadow Settings"] = "陰影設定"
L["Shadow X-Offset"] = "陰影 X 軸位移"
L["Shadow Y-Offset"] = "陰影 Y 軸位移"
L["Shown Text"] = "顯示文字"
L["Size Settings"] = "尺寸設定"
L["Sort by"] = "排序方式"
L["Talents that can be unlearned for this dungeon. Does not check if the talent is a prerequisite for another talent that is needed."] =
  "此地城中可以取消學習的天賦。不會檢查該天賦是否為其他必要天賦的前置天賦。"
L["Text Color"] = "文字顏色"
L["Text Settings"] = "文字設定"
L["Text Size"] = "文字大小"
L["Text supports {texture:IconID} and {atlas:AtlasID} replacers. Instead of IconID you can provide a path to the texture. For AtlasID, I recommend finding Atlas Names with TextureAtlasViewer addon."] =
  "文本支持 {texture:IconID} 和 {atlas:AtlasID} 替換器。你也可以直接提供貼圖路徑來代替 IconID。對於 AtlasID，推薦使用 TextureAtlasViewer 插件查找 Atlas 名稱。"
L["Text"] = "文字"
L["Thick Outline"] = "粗描邊"
L["Thickness"] = "粗細"
L["Type"] = "類型"
L["Wrap"] = "自動換行"

-- Profile
L["|cff40ff40Profile imported successfully.|r"] = "|cff40ff40配置導入成功。|r"
L["|cffff4040Decompression failed.|r"] = "|cffff4040解壓失敗。|r"
L["|cffff4040Invalid encoded string.|r"] = "|cffff4040無效的編碼字符串。|r"
L["|cffff4040Invalid serialised data.|r"] = "|cffff4040無效的序列化數據。|r"
L["|cffff4040Missing profile data.|r"] = "|cffff4040缺少配置數據。|r"
L["|cffff4040Profile belongs to another addon.|r"] = "|cffff4040該配置屬於其他插件。|r"
L["Export Profile"] = "匯出設定檔"
L["Export String (Ctrl+C to copy)"] = "匯出字串（按 Ctrl+C 複製）"
L["Export"] = "匯出"
L["Import / Export"] = "匯入/匯出"
L["Import Profile"] = "匯入設定檔"
L["Profiles"] = "設定檔"
