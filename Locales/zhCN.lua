local L = LibStub("AceLocale-3.0"):NewLocale("MythicPlusUtility", "zhCN")
if not L then return end

-- Options
L["Anchor to Screen's"] = "锚定到屏幕"
L["Background Color"] = "背景颜色"
L["Background Opacity"] = "背景透明度"
L["Background Settings"] = "背景设置"
L["Body Text Size"] = "正文文本大小"
L["Disable Minimap Button"] = "禁用小地图按钮"
L["Dungeon Name Size"] = "地下城名称大小"
L["Dungeon Preview"] = "地下城预览"
L["Height"] = "高度"
L["Hide not Important"] = "隐藏不重要的"
L["Hide on Mythic+ start"] = "大秘境开始时隐藏"
L["Hides dungeon entries that are marked with %s"] = "隐藏标记为 %s 的地下城条目"
L["Highlight Color"] = "高亮颜色"
L["Icon Label Size"] = "图标标签大小"
L["Icon Size"] = "图标大小"
L["Lock Window"] = "锁定窗口"
L["Minimap Icon"] = "小地图按钮"
L["Open Settings"] = "打开设置"
L["Season Select"] = "选择赛季"
L["Show in"] = "显示于"
L["Show/Hide Utility Window"] = "显示/隐藏功能窗口"
L["Talent Highlight Settings"] = "天赋高亮设置"
L["Text and Icon Settings"] = "文本和图标设置"
L["Toggle Window"] = "切换窗口显示"
L["Tooltip NPC Model Settings"] = "NPC 模型鼠标提示设置"
L["Width"] = "宽度"
L["Window Settings"] = "窗口设置"
L["X-Offset"] = "X轴偏移"
L["Y-Offset"] = "Y轴偏移"

-- Difficulty
L["Normal"] = "普通"
L["Heroic"] = "英雄"
L["Mythic"] = "史诗"

-- Other
L["No utility abilities for this dungeon"] = "该地下城没有功能性技能"

-- Mythic+ Seasons
L["Midnight Season 2"] = "至暗之夜 第2赛季"
L["Midnight Season 1"] = "至暗之夜 第1赛季"

-- Dungeons
-- Midnight
L["Altar of Fangs"] = "毒牙祭坛"
L["Den of Nalorakk"] = "纳洛拉克的洞穴"
L["Magisters' Terrace"] = "魔导师平台"
L["Maisara Caverns"] = "迈萨拉洞窟"
L["Murder Row"] = "密谋小径"
L["Nexus-Point Xenas"] = "节点希纳斯"
L["The Blinding Vale"] = "夺目谷"
L["Voidscar Arena"] = "虚空之痕竞技场"
L["Windrunner Spire"] = "风行者之塔"
-- Dragonflight
L["Algeth'ar Academy"] = "艾杰斯亚学院"
L["Ruby Life Pools"] = "红玉新生法池"
-- Battle for Azeroth
L["Kings' Rest"] = "诸王之眠"
L["Temple of Sethraliss"] = "塞塔里斯神庙"
-- Legion
L["Seat of the Triumvirate"] = "执政团之座"
-- Warlords of Draenor
L["Skyreach"] = "通天峰"
-- Wrath of the Lich King
L["Pit of Saron"] = "萨隆矿坑"

-- Dungeon entries
L["{spell:%d} buff is cast by {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted."] =
  "{spell:%d} buff由 {npc:%d} 施放（{npc:%d} 前的小怪），该施法可被打断。"
L["{spell:%d} buff is cast by {npc:%d}."] = "{spell:%d} buff由 {npc:%d} 施放。"
L["{spell:%d} buff on {npc:%d} (trash before {npc:%d})."] =
  "{spell:%d} buff 在 {npc:%d} 身上。（{npc:%d} 前的小怪）"
L["{spell:%d} buff on {npc:%d}."] = "{spell:%d} buff 在 {npc:%d} 身上。"
L["{spell:%d} buff on the second boss {npc:%d}."] = "{spell:%d} buff 在第二个首领 {npc:%d} 身上。"
L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted and LoS."] =
  "{spell:%d} debuff 由 {npc:%d} 施加（{npc:%d} 前的小怪），该施法可被打断或卡视角躲避。"
L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted."] =
  "{spell:%d} debuff由 {npc:%d} 施加（{npc:%d} 前的小怪），该施法可被打断。"
L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d}). Also, this cast can be LoS."] =
  "{spell:%d} debuff 由 {npc:%d} 施加（{npc:%d} 前的小怪），该施法可被卡视角躲避。"
L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d})."] =
  "{spell:%d} debuff由 {npc:%d} 施加（{npc:%d} 前的小怪）。"
L["{spell:%d} debuff is inflicted by {npc:%d} on the first boss {npc:%d}."] =
  "{spell:%d} debuff由 {npc:%d} 施加，在第一个首领 {npc:%d} 战斗中。"
L["{spell:%d} debuff is inflicted by {npc:%d}. Also, this cast can be interrupted."] =
  "{spell:%d} debuff由 {npc:%d} 施加，该施法可被打断。"
L["{spell:%d} debuff is inflicted by {npc:%d}. Also, this debuff can be avoided."] =
  "{spell:%d} debuff由 {npc:%d} 施加，该debuff可以躲避。"
L["{spell:%d} debuff is inflicted by {npc:%d}."] = "{spell:%d} debuff由 {npc:%d} 施加。"
L["{spell:%d} debuff is inflicted by contact with {npc:%d} on the last boss {npc:%d}."] =
  "{spell:%d} debuff 在接触 {npc:%d} 时施加，在尾王 {npc:%d} 战斗中。"
L["{spell:%d} debuff is inflicted by contact with orbs on the last boss {npc:%d}."] =
  "撞球会受到 {spell:%d} debuff，在尾王 {npc:%d} 战斗中。"
L["{spell:%d} debuff is inflicted by the first boss {npc:%d}."] =
  "{spell:%d} debuff由第一个首领 {npc:%d} 施加。"
L["{spell:%d} debuff is inflicted by the second boss {npc:%d}."] =
  "{spell:%d} debuff由第二个首领 {npc:%d} 施加。"
L["{spell:%d} debuff is inflicted by the third boss {npc:%d}. Also, this debuff can be avoided."] =
  "{spell:%d} debuff由第三个首领 {npc:%d} 施加，该debuff可以躲避。"
L["{spell:%d} debuff is inflicted on the first boss {npc:%d}. Also, this debuff can be avoided."] =
  "{spell:%d} debuff 会在第一个首领 {npc:%d} 战斗中施加，该debuff可以躲避。"
L["{spell:%d} debuff is inflicted on the first boss {npc:%d}."] =
  "{spell:%d} debuff 会在第一个首领 {npc:%d} 战斗中施加。"
L["{spell:%d} debuff is inflicted on the last boss {npc:%d}."] =
  "{spell:%d} debuff 会在尾王 {npc:%d} 战斗中施加。"
L["{spell:%d} debuff is inflicted on the second boss {npc:%d}."] =
  "{spell:%d} debuff 会在第二个首领 {npc:%d} 战斗中施加。"
L["{spell:%d} is cast by {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted."] =
  "{spell:%d} 由 {npc:%d} 施放（{npc:%d} 前的小怪），该施法可被打断。"
L["{spell:%d} is cast by {npc:%d}."] = "{spell:%d} 由 {npc:%d} 施放。"
L["{spell:%d} is channeled by {npc:%d} on the third boss {npc:%d}."] =
  "{spell:%d} 由 {npc:%d} 在第三个首领 {npc:%d} 战斗中引导。"
L["{spell:%d} is channeled by {npc:%d}. The caster is immune to CC while it has {spell:%d}"] =
  "{spell:%d} 由 {npc:%d} 引导，在拥有 {spell:%d} 时免疫控制。"
L["{spell:%d} is channeled by {npc:%d}."] = "{spell:%d} 由 {npc:%d} 引导。"
L["Avoid {spell:%d} when {npc:%d} casts on last seconds."] =
  "在最后一秒躲避 {spell:%d}，当 {npc:%d} 施放时。"
L["Avoid {spell:%d} when {npc:%d} jumps on you."] = "躲避 {spell:%d}，当 {npc:%d} 跳向你时。"
L["Avoid {spell:%d} when {npc:%d} jumps. Targets the furthest player."] =
  "躲避 {spell:%d}，当 {npc:%d} 跳跃时。该技能会锁定最远的玩家。"
L["Avoid {spell:%d} when {npc:%d} starts channeling on the third boss {npc:%d}."] =
  "躲避 {spell:%d}，当 {npc:%d} 开始引导时，在第三个首领 {npc:%d} 战斗中。"
L["Avoid {spell:%d} when {npc:%d} starts channeling."] = "躲避 {spell:%d}，当 {npc:%d} 开始引导时。"
L["Avoid {spell:%d} when {npc:%d} throws axe."] = "躲避 {spell:%d}，当 {npc:%d} 投掷斧头时。"
L["Avoid {spell:%d} when the first boss {npc:%d} starts channeling."] =
  "躲避 {spell:%d}，当第一个首领 {npc:%d} 开始引导时。"
L["Avoid {spell:%d} when the last boss {npc:%d} starts channeling."] =
  "躲避 {spell:%d}，当尾王 {npc:%d} 开始引导时。"
L["Avoid {spell:%d} when totem starts channeling on the last boss {npc:%d}."] =
  "躲避 {spell:%d}，当图腾开始引导时，在尾王 {npc:%d} 战斗中。"
L["Mitigates effects of {spell:%d} on the last boss {npc:%d}."] =
  "减轻 {spell:%d} 效果，在尾王 {npc:%d} 战斗中。"
L["Prevent {npc:%d} from reaching {npc:%d}."] = "阻止 {npc:%d} 接触 {npc:%d}。"
L["Prevent {npc:%d} from reaching players or other {npc:%d} on the second boss {npc:%d}."] =
  "阻止 {npc:%d} 接触玩家或其他 {npc:%d}，在第二个首领 {npc:%d} 战斗中。"
L["Prevent {npc:%d} from reaching the first boss {npc:%d}."] = "阻止 {npc:%d} 接触第一个首领 {npc:%d}。"
L["Slow {npc:%d} on the third boss {npc:%d}."] = "减速 {npc:%d}，在第三个首领 {npc:%d} 战斗中。"
L["Stun {npc:%d} on the last boss {npc:%d}."] = "击晕 {npc:%d}，在尾王 {npc:%d} 战斗中。"
-- 1.1.9
L["{spell:%d} debuff is inflicted by {npc:%d}. Debuff is removed only from yourself."] =
  "{spell:%d} debuff由 {npc:%d} 施加，该debuff只能由自己驱散。"
L["{spell:%d} debuff is inflicted by the first boss {npc:%d}. Debuff is removed only from yourself."] =
  "{spell:%d} debuff由第一个首领 {npc:%d} 施加，该debuff只能由自己驱散。"
L["{spell:%d} debuff is inflicted by the second boss {npc:%d}. Debuff is removed only from yourself."] =
  "{spell:%d} debuff由第二个首领 {npc:%d} 施加，该debuff只能由自己驱散。"
L["Avoid {spell:%d} when {npc:%d} throws glaive."] = "躲避 {spell:%d}，当 {npc:%d} 投掷战刃时。"
L["Jump back to the platform if you are thrown off by {npc:%d} on the last boss {npc:%d}."] =
  "如果被 {npc:%d} 击飞，跳回平台，在尾王 {npc:%d} 战斗中。"
L["Skips part of the wind maze after the third boss {npc:%d}."] = "跳过第三个首领 {npc:%d} 后面的风通道"
-- 1.2.1
L["Avoid {spell:%d} when the last boss {npc:%d} targets you."] =
  "躲避 {spell:%d}，当尾王 {npc:%d} 点名你时。"
L["Prevent {npc:%d} from reaching players on the third boss {npc:%d}."] =
  "阻止 {npc:%d} 接触玩家，在第三个首领 {npc:%d} 战斗中。"
L["Skips add pack before the last boss {npc:%d}. This is route specific."] =
  "跳过尾王 {npc:%d} 前的小怪。仅适用于特定路线。"
-- 1.3.0
L["{npc:%d} are in stealth before the first boss."] = "{npc:%d} 在第一个首领前处于潜行状态。"
L["{npc:%d} are in stealth in the room with the orb (trash before {npc:%d})."] = "{npc:%d} 在有球的房间内处于潜行状态（{npc:%d} 前的小怪）。"
L["{spell:%d} buff is cast by {npc:%d} (trash before {npc:%d})."] = "{spell:%d} buff由 {npc:%d} 施放（{npc:%d} 前的小怪）。"
L["{spell:%d} buff is cast by {npc:%d} on the third boss {npc:%d}."] = "{spell:%d} buff由 {npc:%d} 施放，在第三个首领 {npc:%d} 战斗中。"
L["{spell:%d} buff is cast by {npc:%d}. Also, this cast can be interrupted."] = "{spell:%d} buff由 {npc:%d} 施放，该施法可被打断。"
L["{spell:%d} buff on {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted."] = "{spell:%d} buff 在 {npc:%d} 身上（{npc:%d} 前的小怪），该施法可被打断。"
L["{spell:%d} buff on {npc:%d} and {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted."] = "{spell:%d} buff 在 {npc:%d} 和 {npc:%d} 身上（{npc:%d} 前的小怪），该施法可被打断。"
L["{spell:%d} buff on {npc:%d} and {npc:%d} (trash before {npc:%d})."] = "{spell:%d} buff 在 {npc:%d} 和 {npc:%d} 身上（{npc:%d} 前的小怪）。"
L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d}). Also, this debuff can be avoided."] = "{spell:%d} debuff由 {npc:%d} 施加（{npc:%d} 前的小怪），该debuff可以躲避。"
L["{spell:%d} debuff is inflicted by {npc:%d} (trash before the third boss). Also, this cast can be interrupted."] = "{spell:%d} debuff由 {npc:%d} 施加（第三个首领前的小怪），该施法可被打断。"
L["{spell:%d} debuff is inflicted by {npc:%d} (trash before the third boss)."] = "{spell:%d} debuff由 {npc:%d} 施加（第三个首领前的小怪）。"
L["{spell:%d} debuff is inflicted by {npc:%d} and {npc:%d} (trash before {npc:%d}). Also, this debuff can be avoided."] = "{spell:%d} debuff由 {npc:%d} 和 {npc:%d} 施加（{npc:%d} 前的小怪），该debuff可以躲避。"
L["{spell:%d} debuff is inflicted by {npc:%d} and {npc:%d} (trash before {npc:%d})."] = "{spell:%d} debuff由 {npc:%d} 和 {npc:%d} 施加（{npc:%d} 前的小怪）。"
L["{spell:%d} debuff is inflicted by {npc:%d} on the last boss {npc:%d}. Also, this cast can be interrupted."] = "{spell:%d} debuff由 {npc:%d} 施加，在尾王 {npc:%d} 战斗中，该施法可被打断。"
L["{spell:%d} debuff is inflicted by {npc:%d} on the last boss {npc:%d}."] = "{spell:%d} debuff由 {npc:%d} 施加，在尾王 {npc:%d} 战斗中。"
L["{spell:%d} debuff is inflicted by {npc:%d} on the second boss {npc:%d}. Also, this cast can be interrupted."] = "{spell:%d} debuff由 {npc:%d} 施加，在第二个首领 {npc:%d} 战斗中，该施法可被打断。"
L["{spell:%d} debuff is inflicted by {npc:%d} on the second boss {npc:%d}. Also, this debuff can be avoided."] = "{spell:%d} debuff由 {npc:%d} 施加，在第二个首领 {npc:%d} 战斗中，该debuff可以躲避。"
L["{spell:%d} debuff is inflicted by {npc:%d} on the second boss {npc:%d}."] = "{spell:%d} debuff由 {npc:%d} 施加，在第二个首领 {npc:%d} 战斗中。"
L["{spell:%d} debuff is inflicted by contact with {npc:%d}."] = "{spell:%d} debuff 会因接触 {npc:%d} 而受到。"
L["{spell:%d} debuff is inflicted by not soaking the void zone on the second boss {npc:%d}."] = "未进入虚空区域分担会受到 {spell:%d} debuff，在第二个首领 {npc:%d} 战斗中。"
L["{spell:%d} debuff is inflicted by the last boss {npc:%d}. Also, this debuff can be avoided."] = "{spell:%d} debuff由尾王 {npc:%d} 施加，该debuff可以躲避。"
L["{spell:%d} debuff is inflicted by the last boss {npc:%d}."] = "{spell:%d} debuff由尾王 {npc:%d} 施加。"
L["{spell:%d} debuff is inflicted by the second boss {npc:%d}. Also, this debuff can be avoided."] = "{spell:%d} debuff由第二个首领 {npc:%d} 施加，该debuff可以躲避。"
L["{spell:%d} debuff is inflicted by the third boss {npc:%d}. Also, this cast can be interrupted."] = "{spell:%d} debuff由第三个首领 {npc:%d} 施加，该施法可被打断。"
L["{spell:%d} debuff is inflicted by the third boss {npc:%d}."] = "{spell:%d} debuff由第三个首领 {npc:%d} 施加。"
L["{spell:%d} debuff is inflicted on the second boss {npc:%d}. Also, this debuff can be avoided."] = "{spell:%d} debuff 会在第二个首领 {npc:%d} 战斗中施加，该debuff可以躲避。"
L["{spell:%d} is cast by {npc:%d} (trash before {npc:%d})."] = "{spell:%d} 由 {npc:%d} 施放（{npc:%d} 前的小怪）。"
L["{spell:%d} is cast by {npc:%d} (trash before the third boss)."] = "{spell:%d} 由 {npc:%d} 施放（第三个首领前的小怪）。"
L["{spell:%d} is cast by {npc:%d}. Also, this cast can be interrupted."] = "{spell:%d} 由 {npc:%d} 施放，该施法可被打断。"
L["{spell:%d} is channeled by {npc:%d} (trash before {npc:%d})."] = "{spell:%d} 由 {npc:%d} 引导（{npc:%d} 前的小怪）。"
L["{spell:%d} is channeled by {npc:%d} and {npc:%d} (trash before {npc:%d})."] = "{spell:%d} 由 {npc:%d} 和 {npc:%d} 引导（{npc:%d} 前的小怪）。"

-- Icon Cosmetics Settings
L["\"Add Optional\""] = "推荐学习（可选）"
L["\"Add\""] = "推荐学习"
L["\"Known\""] = "已学习"
L["\"Optional\""] = "可选"
L["\"Remove\""] = "可移除"
L["Action Button Glow"] = "动作条按钮发光"
L["Add Not Important"] = "推荐学习（不重要）"
L["Add"] = "推荐学习"
L["Ascending Alphabetical"] = "按字母升序"
L["AtlasID Texture"] = "图集纹理"
L["Auto Expand Height"] = "自动扩展高度"
L["Autocast Shine"] = "自动施法闪光"
L["Automatic"] = "自动"
L["Body Text"] = "正文文本"
L["Border"] = "边框"
L["Currently known abilities that will be useful for this dungeon and only contain dungeon entries that are marked with %s. If disabled, \"Known\" settings will be used."] =
  "当前已学习且对该地下城有用的技能，仅包含标记为 %s 的地下城条目。若禁用，则使用“已学习”设置。"
L["Currently known abilities that will be useful for this dungeon."] =
  "当前已学习且对该地下城有用的技能。"
L["Currently not known abilities that will be useful in this dungeon and only contain dungeon entries that are marked with %s. If disabled, \"Add\" settings will be used."] =
  "当前未学习但对该地下城有用的技能，仅包含标记为 %s 的地下城条目。若禁用，则使用“推荐学习”设置。"
L["Currently not known abilities that will be useful in this dungeon."] =
  "当前未学习但对该地下城有用的技能。"
L["Custom Text Settings"] = "自定义文本设置"
L["Custom Text"] = "自定义文本"
L["Custom_text"] = "自定义"
L["Desaturate Icon"] = "图标褪色"
L["Desaturate"] = "褪色"
L["Descending Alphabetical"] = "按字母降序"
L["Dungeon Name"] = "地下城名称"
L["Enable Icon Glow"] = "启用图标发光"
L["Enable"] = "启用"
L["Fixed"] = "固定"
L["Font Settings"] = "字体设置"
L["Font"] = "字体"
L["Frequency"] = "频率"
L["Glow Color"] = "发光颜色"
L["Glow Settings"] = "发光设置"
L["Glow Type"] = "发光类型"
L["Icon Color"] = "图标颜色"
L["Icon Cosmetics Settings"] = "图标外观设置"
L["Icon"] = "图标"
L["Ignore"] = "忽略"
L["Known Not Important"] = "已学习（不重要）"
L["Known"] = "已学习"
L["Length"] = "长度"
L["Lines & Particles"] = "线条和粒子"
L["Max Height"] = "最大高度"
L["Monochrome Outline"] = "单色描边"
L["Monochrome Thick Outline"] = "单色粗描边"
L["Monochrome"] = "单色"
L["None"] = "无"
L["Outline"] = "描边"
L["Overflow"] = "溢出"
L["Paste Import String (replaces current profile)"] = "粘贴导入字符串（会替换当前配置）"
L["Pixel Glow"] = "像素发光"
L["Position Settings"] = "位置设置"
L["Remove"] = "可移除"
L["Reverse Type"] = "反向类型"
L["Scale"] = "缩放"
L["Set as white (#FFFFFF) to not change icon color"] = "设为白色（#FFFFFF）可不改变图标颜色"
L["Set to negative to inverse direction of rotation"] = "设为负值可反转旋转方向"
L["Shadow Color"] = "阴影颜色"
L["Shadow Settings"] = "阴影设置"
L["Shadow X-Offset"] = "阴影X轴偏移"
L["Shadow Y-Offset"] = "阴影Y轴偏移"
L["Shown Text"] = "显示文本"
L["Size Settings"] = "尺寸设置"
L["Sort by"] = "排序方式"
L["Talents that can be unlearned for this dungeon. Does not check if the talent is a prerequisite for another talent that is needed."] =
  "该地下城中可以不学习的天赋。不会检查该天赋是否为其他所需天赋的前置天赋。"
L["Text Color"] = "文本颜色"
L["Text Settings"] = "文本设置"
L["Text Size"] = "文本大小"
L["Text supports {texture:IconID} and {atlas:AtlasID} replacers. Instead of IconID you can provide a path to the texture. For AtlasID, I recommend finding Atlas Names with TextureAtlasViewer addon."] =
  "文本支持 {texture:IconID} 和 {atlas:AtlasID} 替换器。你也可以直接提供贴图路径来代替 IconID。对于 AtlasID，推荐使用 TextureAtlasViewer 插件查找 Atlas 名称。"
L["Text"] = "文本"
L["Thick Outline"] = "粗描边"
L["Thickness"] = "厚度"
L["Type"] = "类型"
L["Wrap"] = "自动换行"

-- Profile
L["|cff40ff40Profile imported successfully.|r"] = "|cff40ff40配置导入成功。|r"
L["|cffff4040Decompression failed.|r"] = "|cffff4040解压失败。|r"
L["|cffff4040Invalid encoded string.|r"] = "|cffff4040无效的编码字符串。|r"
L["|cffff4040Invalid serialised data.|r"] = "|cffff4040无效的序列化数据。|r"
L["|cffff4040Missing profile data.|r"] = "|cffff4040缺少配置数据。|r"
L["|cffff4040Profile belongs to another addon.|r"] = "|cffff4040该配置属于其他插件。|r"
L["Export Profile"] = "导出配置"
L["Export String (Ctrl+C to copy)"] = "导出字符串（Ctrl+C复制）"
L["Export"] = "导出"
L["Import / Export"] = "导入/导出"
L["Import Profile"] = "导入配置"
L["Profiles"] = "配置"
