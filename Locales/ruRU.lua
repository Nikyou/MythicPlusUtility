local L = LibStub("AceLocale-3.0"):NewLocale("MythicPlusUtility", "ruRU")
if not L then return end

-- Options
L["Ability Content Settings"] = "Настройки содержимого способностей"
L["Anchor to Screen's"] = "Закрепить за экран"
L["Background Color"] = "Цвет фона"
L["Background Opacity"] = "Прозрачность фона"
L["Background Settings"] = "Настройки фона"
L["Body Text Size"] = "Размер текста"
L["Disable Minimap Button"] = "Отключить кнопку миникарты"
L["Dungeon Name Size"] = "Размер названия подземелья"
L["Dungeon Options"] = "Настройки подземелья"
L["Dungeon Preview"] = "Просмотр подземелья"
L["General Settings"] = "Общие настройки"
L["Height"] = "Высота"
L["Hide not Important"] = "Скрыть неважные"
L["Hide on Mythic+ start"] = "Скрыть при начале Эпохальный+"
L["Hides dungeon entries that are marked with %s"] =
  "Скрывает записи в подземельях, помеченные %s"
L["Highlight Color"] = "Цвет подсветки"
L["Icon Label Size"] = "Размер названия иконки"
L["Icon Size"] = "Размер иконки"
L["Lock Window"] = "Не двигать мышкой"
L["Minimap Icon"] = "Значок миникарты"
L["Open Settings"] = "Открыть настройки"
L["Season Select"] = "Выбор сезона"
L["Show in"] = "Показывать в"
L["Show Unlearned Professions"] = "Показывать неизученные профессии"
L["Show/Hide Utility Window"] = "Показать/Скрыть окно"
L["Shows dungeon entries with unlearned professions."] =
  "Показывает записи в подземельях содержащие неизученные профессии."
L["Talent Highlight Settings"] = "Настройки подсветки таланта"
L["Text and Icon Settings"] = "Настройки текста и иконки"
L["Toggle Window"] = "Переключение окна"
L["Tooltip NPC Model Settings"] = "Настройки модели в подсказке"
L["Width"] = "Ширина"
L["Window Settings"] = "Настройки окна"
L["X-Offset"] = "Смещение по X"
L["Y-Offset"] = "Смещение по Y"

-- Difficulty
L["Normal"] = "Обычный"
L["Heroic"] = "Героический"
L["Mythic"] = "Эпохальный"

-- Other
L["No utility abilities for this dungeon"] =
  "Для этого подземелья нет вспомогательных способностей"

-- Mythic+ Seasons
L["Midnight Season 2"] = "Midnight Сезон 2"
L["Midnight Season 1"] = "Midnight Сезон 1"

-- Dungeon entries
L["{spell:%d} buff is cast by {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted."] =
  "{spell:%d} бафф, который накладывает {npc:%d} (треш перед {npc:%d}). Также, это заклинание можно прервать."
L["{spell:%d} buff is cast by {npc:%d}."] = "{spell:%d} бафф, который накладывает {npc:%d}."
L["{spell:%d} buff on {npc:%d} (trash before {npc:%d})."] = "{spell:%d} бафф на {npc:%d} (треш перед {npc:%d})."
L["{spell:%d} buff on {npc:%d}."] = "{spell:%d} бафф на {npc:%d}."
L["{spell:%d} buff on the second boss {npc:%d}."] = "{spell:%d} бафф на втором боссе {npc:%d}."
L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted and LoS."] =
  "{spell:%d} дебафф, который накладывает {npc:%d} (треш перед {npc:%d}). Также, это заклинание можно прервать и укрыться от него."
L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted."] =
  "{spell:%d} дебафф, который накладывает {npc:%d} (треш перед {npc:%d}). Также, это заклинание можно прервать."
L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d}). Also, this cast can be LoS."] =
  "{spell:%d} дебафф, который накладывает {npc:%d} (треш перед {npc:%d}). Также, от этого заклинание можно укрытся."
L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d})."] =
  "{spell:%d} дебафф, который накладывает {npc:%d} (треш перед {npc:%d})."
L["{spell:%d} debuff is inflicted by {npc:%d} on the first boss {npc:%d}."] =
  "{spell:%d} дебафф, который накладывает {npc:%d} на первом боссе {npc:%d}."
L["{spell:%d} debuff is inflicted by {npc:%d}. Also, this cast can be interrupted."] =
  "{spell:%d} дебафф, который накладывает {npc:%d}. Также, это заклинание можно прервать."
L["{spell:%d} debuff is inflicted by {npc:%d}. Also, this debuff can be avoided."] =
  "{spell:%d} дебафф, который накладывает {npc:%d}. Также, этот дебафф можно избежать."
L["{spell:%d} debuff is inflicted by {npc:%d}."] = "{spell:%d} дебафф, который накладывает {npc:%d}."
L["{spell:%d} debuff is inflicted by contact with {npc:%d} on the last boss {npc:%d}."] =
  "{spell:%d} дебафф, который накладывает контакт с {npc:%d} на последнем боссе {npc:%d}."
L["{spell:%d} debuff is inflicted by contact with orbs on the last boss {npc:%d}."] =
  "{spell:%d} дебафф, который накладывает контакт со сферами на последнем боссе {npc:%d}."
L["{spell:%d} debuff is inflicted by the first boss {npc:%d}."] =
  "{spell:%d} дебафф, который накладывает первый босс {npc:%d}."
L["{spell:%d} debuff is inflicted by the second boss {npc:%d}."] =
  "{spell:%d} дебафф, который накладывает второй босс {npc:%d}."
L["{spell:%d} debuff is inflicted by the third boss {npc:%d}. Also, this debuff can be avoided."] =
  "{spell:%d} дебафф, который накладывает второй босс {npc:%d}. Также, этот дебафф можно избежать."
L["{spell:%d} debuff is inflicted on the first boss {npc:%d}. Also, this debuff can be avoided."] =
  "{spell:%d} дебафф, который накладывает первый босс {npc:%d}. Также, этот дебафф можно избежать."
L["{spell:%d} debuff is inflicted on the first boss {npc:%d}."] =
  "{spell:%d} дебафф, который накладывает первый босс {npc:%d}."
L["{spell:%d} debuff is inflicted on the last boss {npc:%d}."] =
  "{spell:%d} дебафф, который накладывает последний босс {npc:%d}."
L["{spell:%d} debuff is inflicted on the second boss {npc:%d}."] =
  "{spell:%d} дебафф, который накладывает второй босс {npc:%d}."
L["{spell:%d} is cast by {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted."] =
  "{spell:%d}, которое произносит {npc:%d} (треш перед {npc:%d}). Также, это заклинание можно прервать."
L["{spell:%d} is cast by {npc:%d}."] = "{spell:%d}, которое произносит {npc:%d}."
L["{spell:%d} is channeled by {npc:%d} on the third boss {npc:%d}."] =
  "{spell:%d}, которое направляет {npc:%d} на третьем боссе {npc:%d}."
L["{spell:%d} is channeled by {npc:%d}. The caster is immune to CC while it has {spell:%d}"] =
  "{spell:%d}, которое направляет {npc:%d}. Заклинатель невосприимчив к эффектам контроля пока на нём есть {spell:%d}"
L["{spell:%d} is channeled by {npc:%d}."] = "{spell:%d}, которое направляет {npc:%d}."
L["Avoid {spell:%d} when {npc:%d} casts on last seconds."] =
  "Избегите {spell:%d}, когда {npc:%d} произносит на последних секундах."
L["Avoid {spell:%d} when {npc:%d} jumps on you."] = "Избегите {spell:%d}, когда {npc:%d} прыгнет на вас."
L["Avoid {spell:%d} when {npc:%d} jumps. Targets the furthest player."] =
  "Избегите {spell:%d}, когда {npc:%d} прыгнет. Целью выберается самый дальний игрок."
L["Avoid {spell:%d} when {npc:%d} starts channeling on the third boss {npc:%d}."] =
  "Избегите {spell:%d}, когда {npc:%d} начинает поддерживать заклинание на третьем боссе {npc:%d}."
L["Avoid {spell:%d} when {npc:%d} starts channeling."] =
  "Избегите {spell:%d}, когда {npc:%d} начинает поддерживать заклинание."
L["Avoid {spell:%d} when {npc:%d} throws an axe."] = "Избегите {spell:%d}, когда {npc:%d} кинет топор."
L["Avoid {spell:%d} when the first boss {npc:%d} starts channeling."] =
  "Избегите {spell:%d}, когда первый босс {npc:%d} начинает поддерживать заклинание."
L["Avoid {spell:%d} when the last boss {npc:%d} starts channeling."] =
  "Избегите {spell:%d}, когда последний босс {npc:%d} начинает поддерживать заклинание."
L["Avoid {spell:%d} when totem starts channeling on the last boss {npc:%d}."] =
  "Избегите {spell:%d}, когда тотем начинает поддерживать заклинание на последнем боссе {npc:%d}."
L["Mitigates effects of {spell:%d} on the last boss {npc:%d}."] =
  "Нивелирует эффекты {spell:%d} на последнем боссе {npc:%d}."
L["Prevent {npc:%d} from reaching {npc:%d}."] = "Помешайте {npc:%d} достичь {npc:%d}."
L["Prevent {npc:%d} from reaching players or other {npc:%d} on the second boss {npc:%d}."] =
  "Помешайте {npc:%d} достичь игроков или других {npc:%d} на втором боссе {npc:%d}."
L["Prevent {npc:%d} from reaching the first boss {npc:%d}."] =
  "Помешайте {npc:%d} достичь первого босса {npc:%d}."
L["Slow {npc:%d} on the third boss {npc:%d}."] = "Замедляет {npc:%d} на третьем боссе {npc:%d}."
L["Stun {npc:%d} on the last boss {npc:%d}."] = "Оглушает {npc:%d} на последнем боссе {npc:%d}."
-- 1.1.9
L["{spell:%d} debuff is inflicted by {npc:%d}. Debuff is removed only from yourself."] =
  "{spell:%d} дебафф, который накладывает {npc:%d}. Дебафф снимается только с себя."
L["{spell:%d} debuff is inflicted by the first boss {npc:%d}. Debuff is removed only from yourself."] =
  "{spell:%d} дебафф, который накладывает первый босс {npc:%d}. Дебафф снимается только с себя."
L["{spell:%d} debuff is inflicted by the second boss {npc:%d}. Debuff is removed only from yourself."] =
  "{spell:%d} дебафф, который накладывает второй босс {npc:%d}. Дебафф снимается только с себя."
L["Avoid {spell:%d} when {npc:%d} throws glaive."] = "Избегите {spell:%d}, когда {npc:%d} кинет глефу."
L["Jump back to the platform if you are thrown off by {npc:%d} on the last boss {npc:%d}."] =
  "Прыгните обратно на платформу, если вас сбросил {npc:%d} на последнем боссе {npc:%d}."
L["Skips part of the wind maze after the third boss {npc:%d}."] =
  "Пропускает часть лабиринта ветра после третьего босса {npc:%d}."
-- 1.2.1
L["Avoid {spell:%d} when the last boss {npc:%d} targets you."] =
  "Избегите {spell:%d}, когда последний босс {npc:%d} выбирает вас целью."
L["Prevent {npc:%d} from reaching players on the third boss {npc:%d}."] =
  "Помешайте {npc:%d} достичь игроков на третьем боссе {npc:%d}."
L["Skips add pack before the last boss {npc:%d}. This is route specific."] =
  "Пропускает пачку врагов перед последним боссом {npc:%d}. Это специфично для маршрута."
-- 1.4.0
L["{npc:%d} are in stealth before the first boss."] = "{npc:%d} в незаметности перед первым боссом."
L["{npc:%d} are in stealth in the room with the orb (trash before {npc:%d})."] =
  "{npc:%d} в незаметности в комнате со сферой (треш перед {npc:%d})."
L["{npc:%d} are in stealth near {npc:%d} before the first boss."] =
  "{npc:%d} в незаметности рядом с {npc:%d} перед первым боссом."
L["{spell:%d} buff is cast by {npc:%d} (trash before {npc:%d})."] =
  "{spell:%d} бафф, который накладывает {npc:%d} (треш перед {npc:%d})."
L["{spell:%d} buff is cast by {npc:%d} on the third boss {npc:%d}."] =
  "{spell:%d} бафф, который накладывает {npc:%d} на третьем боссе {npc:%d}."
L["{spell:%d} buff is cast by {npc:%d}. Also, this cast can be interrupted."] =
  "{spell:%d} бафф, который накладывает {npc:%d}. Также, это заклинание можно прервать."
L["{spell:%d} buff on {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted."] =
  "{spell:%d} бафф на {npc:%d} (треш перед {npc:%d}). Также, это заклинание можно прервать."
L["{spell:%d} buff on {npc:%d} and {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted."] =
  "{spell:%d} бафф на {npc:%d} и {npc:%d} (треш перед {npc:%d}). Также, это заклинание можно прервать."
L["{spell:%d} buff on {npc:%d} and {npc:%d} (trash before {npc:%d})."] =
  "{spell:%d} бафф на {npc:%d} и {npc:%d} (треш перед {npc:%d})."
L["{spell:%d} buff on {npc:%d} and {npc:%d}."] = "{spell:%d} бафф на {npc:%d} и {npc:%d}."
L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d}). Also, this debuff can be avoided."] =
  "{spell:%d} дебафф, который накладывает {npc:%d} (треш перед {npc:%d}). Также, этот дебафф можно избежать."
L["{spell:%d} debuff is inflicted by {npc:%d} (trash before the third boss). Also, this cast can be interrupted."] =
  "{spell:%d} дебафф, который накладывает {npc:%d} (треш перед третьим боссом). Также, это заклинание можно прервать."
L["{spell:%d} debuff is inflicted by {npc:%d} (trash before the third boss)."] =
  "{spell:%d} дебафф, который накладывает {npc:%d} (треш перед третьим боссом)."
L["{spell:%d} debuff is inflicted by {npc:%d} and {npc:%d} (trash before {npc:%d}). Also, this debuff can be avoided."] =
  "{spell:%d} дебафф, который накладывает {npc:%d} и {npc:%d} (треш перед {npc:%d}). Также, этот дебафф можно избежать."
L["{spell:%d} debuff is inflicted by {npc:%d} and {npc:%d} (trash before {npc:%d})."] =
  "{spell:%d} дебафф, который накладывает {npc:%d} и {npc:%d} (треш перед {npc:%d})."
L["{spell:%d} debuff is inflicted by {npc:%d} and {npc:%d}."] =
  "{spell:%d} дебафф, который накладывает {npc:%d} и {npc:%d}."
L["{spell:%d} debuff is inflicted by {npc:%d} on the last boss {npc:%d}. Also, this cast can be interrupted."] =
  "{spell:%d} дебафф, который накладывает {npc:%d} на последнем боссе {npc:%d}. Также, это заклинание можно прервать."
L["{spell:%d} debuff is inflicted by {npc:%d} on the last boss {npc:%d}."] =
  "{spell:%d} дебафф, который накладывает {npc:%d} на последнем боссе {npc:%d}."
L["{spell:%d} debuff is inflicted by {npc:%d} on the second boss {npc:%d}. Also, this cast can be interrupted."] =
  "{spell:%d} дебафф, который накладывает {npc:%d} на втором боссе {npc:%d}. Также, это заклинание можно прервать."
L["{spell:%d} debuff is inflicted by {npc:%d} on the second boss {npc:%d}. Also, this debuff can be avoided."] =
  "{spell:%d} дебафф, который накладывает {npc:%d} на втором боссе {npc:%d}. Также, этот дебафф можно избежать."
L["{spell:%d} debuff is inflicted by {npc:%d} on the second boss {npc:%d}."] =
  "{spell:%d} дебафф, который накладывает {npc:%d} на втором боссе {npc:%d}."
L["{spell:%d} debuff is inflicted by {npc:%d}, which is summoned by {npc:%d}."] =
  "{spell:%d} дебафф, который накладывает {npc:%d}, которого призвает {npc:%d}."
L["{spell:%d} debuff is inflicted by contact with {npc:%d}."] =
  "{spell:%d} дебафф, который накладывается контактом с {npc:%d}."
L["{spell:%d} debuff is inflicted by not soaking the void zone on the second boss {npc:%d}."] =
  "{spell:%d} дебафф, который накладывается если не закрыть войд-зону на втором боссе {npc:%d}."
L["{spell:%d} debuff is inflicted by the first boss {npc:%d}. Also, this debuff can be avoided."] =
  "{spell:%d} дебафф, который накладывает первый босс {npc:%d}. Также, этот дебафф можно избежать."
L["{spell:%d} debuff is inflicted by the last boss {npc:%d}. Also, this debuff can be avoided."] =
  "{spell:%d} дебафф, который накладывает последний босс {npc:%d}. Также, этот дебафф можно избежать."
L["{spell:%d} debuff is inflicted by the last boss {npc:%d}."] =
  "{spell:%d} дебафф, который накладывает последний босс {npc:%d}."
L["{spell:%d} debuff is inflicted by the second boss {npc:%d}. Also, this debuff can be avoided."] =
  "{spell:%d} дебафф, который накладывает второй босс {npc:%d}. Также, этот дебафф можно избежать."
L["{spell:%d} debuff is inflicted by the third boss {npc:%d}. Also, this cast can be interrupted."] =
  "{spell:%d} дебафф, который накладывает третий босс {npc:%d}. Также, это заклинание можно прервать."
L["{spell:%d} debuff is inflicted by the third boss {npc:%d}."] =
  "{spell:%d} дебафф, который накладывает третий босс {npc:%d}."
L["{spell:%d} debuff is inflicted on the last boss {npc:%d}. Also, this debuff can be avoided."] =
  "{spell:%d} дебафф, который накладывает последний босс {npc:%d}. Также, этот дебафф можно избежать."
L["{spell:%d} debuff is inflicted on the second boss {npc:%d}. Also, this cast can be interrupted."] =
  "{spell:%d} дебафф, который накладывается на втором боссе {npc:%d}. Также, это заклинание можно прервать."
L["{spell:%d} debuff is inflicted on the second boss {npc:%d}. Also, this debuff can be avoided."] =
  "{spell:%d} дебафф, который накладывается на втором боссе {npc:%d}. Также, этот дебафф можно избежать."
L["{spell:%d} is cast by {npc:%d} (trash before {npc:%d})."] =
  "{spell:%d}, которое произносит {npc:%d} (треш перед {npc:%d})."
L["{spell:%d} is cast by {npc:%d} (trash before the third boss)."] =
  "{spell:%d}, которое произносит {npc:%d} (треш перед третьим боссом)."
L["{spell:%d} is cast by {npc:%d}. Also, this cast can be interrupted."] =
  "{spell:%d}, которое произносит {npc:%d}. Также, это заклинание можно прервать."
L["{spell:%d} is channeled by {npc:%d} (trash before {npc:%d}). Also, this channel can be interrupted."] =
  "{spell:%d}, которое направляет {npc:%d} (треш перед {npc:%d}). Также, его можно прервать."
L["{spell:%d} is channeled by {npc:%d} (trash before {npc:%d})."] =
  "{spell:%d}, которое направляет {npc:%d} (треш перед {npc:%d})."
L["{spell:%d} is channeled by {npc:%d} and {npc:%d} (trash before {npc:%d})."] =
  "{spell:%d}, которое направляет {npc:%d} и {npc:%d} (треш перед {npc:%d})."
L["{spell:%d} is channeled by {npc:%d}. Also, this channel can be interrupted."] =
  "{spell:%d}, которое направляет {npc:%d}. Также, его можно прервать."
L["Avoid {spell:%d} when the last boss {npc:%d} jumps at you."] =
  "Избегите {spell:%d}, когда последний босс {npc:%d} прыгнет на вас."
L["Avoid {spell:%d} when the second boss {npc:%d} starts channeling."] =
  "Избегите {spell:%d}, когда второй босс {npc:%d} начинает поддерживать заклинание."
L["Avoid {spell:%d} when the third boss {npc:%d} charges at you."] =
  "Избегите {spell:%d}, когда последний босс {npc:%d} совершит рывок на вас."
L["Avoid {spell:%d} when the third boss {npc:%d} throws an axe."] =
  "Избегите {spell:%d}, когда третий босс {npc:%d} кинет топор."
L["Prevent {npc:%d} from reaching your healer on the last boss {npc:%d}."] =
  "Помешайте {npc:%d} достичь вашего лекаря на последнем боссе {npc:%d}."
-- 1.4.1
L["Remove the curse from {npc:%d}, which are scattered throughout the dungeon. Then interact with them to receive {spell:%d}."] =
  "Снимите проклятие с {npc:%d}, разбросанных по всему подземелью. Затем взаимодействуйте с ними, чтобы получить {spell:%d}."

-- Profession Dungeon entries
L["After the second boss, go up the stairs to the {npc:%d} mini-boss room and interact with {npc:%d} in the top left corner next to the serpent eggs for {spell:%d}."] =
  "После второго босса поднимитесь по лестнице в комнату с мини-боссом {npc:%d} и взаимодействуйте с {npc:%d} в верхнем левом углу рядом с змеиными яйцами, чтобы получить {spell:%d}."
L["Interact with {npc:%d} located just after the two bundles of apples leading up to the first boss for {spell:%d}."] =
  "Взаимодействуйте с {npc:%d}, расположенным сразу за двумя связками яблок, ведущими к первому боссу, чтобы получить {spell:%d}."
L["Interact with {npc:%d} located on a small outlook leading up to the first boss for {spell:%d}."] =
  "Взаимодействуйте с {npc:%d}, расположенным на небольшой смотровой площадке, ведущей к первому боссу, чтобы получить {spell:%d}."

-- Icon Cosmetics Settings
L["\"Add Optional\""] = "\"Взять необязательно\""
L["\"Add\""] = "\"Взять\""
L["\"Known\""] = "\"Изучено\""
L["\"Optional\""] = "\"Необязательно\""
L["\"Remove\""] = "\"Убрать\""
L["Action Button Glow"] = "Свечение кнопки действия"
L["Add Not Important"] = "Взять неважные"
L["Add"] = "Взять"
L["Ascending Alphabetical"] = "В порядке возрастания по алфавиту"
L["AtlasID Texture"] = "Текстура AtlasID "
L["Auto Expand Height"] = "Автоматическая высота"
L["Autocast Shine"] = "Свечение при автоприменении"
L["Automatic"] = "Автоматически"
L["Body Text"] = "Основной текст"
L["Border"] = "Граница"
L["Currently known abilities that will be useful for this dungeon and only contain dungeon entries that are marked with %s. If disabled, \"Known\" settings will be used."] =
  "Изученные способности, которые будут полезны в этом подземелье, и содержат только записи, помеченные %s. Если эта опция отключена, будут использоваться настройки \"Изучено\""
L["Currently known abilities that will be useful for this dungeon."] =
  "Изученные способности, которые будут полезны в этом подземелье"
L["Currently not known abilities that will be useful in this dungeon and only contain dungeon entries that are marked with %s. If disabled, \"Add\" settings will be used."] =
  "Неизученные способности, которые будут полезны в этом подземелье, и содержат только записи, помеченные %s. Если эта опция отключена, будут использоваться настройки \"Взять\""
L["Currently not known abilities that will be useful in this dungeon."] =
  "Неизученные способности, которые будут полезны в этом подземелье"
L["Custom Text Settings"] = "Пользовательские настройки текста"
L["Custom Text"] = "Пользовательский текст"
L["Custom_text"] = "Свой"
L["Desaturate Icon"] = "Обесцветить иконку"
L["Desaturate"] = "Обесцветить"
L["Descending Alphabetical"] = "В порядке убывания по алфавиту"
L["Dungeon Name"] = "Название подземелья"
L["Enable Icon Glow"] = "Включить свечение иконки"
L["Enable"] = "Включить"
L["Fixed"] = "Фиксированная"
L["Font Settings"] = "Настройки шрифта"
L["Font"] = "Шрифт"
L["Frequency"] = "Частота"
L["Glow Color"] = "Цвет свечения"
L["Glow Settings"] = "Настройки свечения"
L["Glow Type"] = "Тип свечения"
L["Icon Color"] = "Цвет иконки"
L["Icon Cosmetics Settings"] = "Косметические настройки иконки"
L["Icon"] = "Иконка"
L["Ignore"] = "Игнорировать"
L["Known Not Important"] = "Изучено необязательно"
L["Known"] = "Изучено"
L["Length"] = "Длина"
L["Lines & Particles"] = "Линии и частицы"
L["Max Height"] = "Максимальная высота"
L["Monochrome Outline"] = "Монохромный край; контур"
L["Monochrome Thick Outline"] = "Монохр-й край; толстый контур"
L["Monochrome"] = "Монохромный край"
L["None"] = "Ничего"
L["Outline"] = "Контур"
L["Overflow"] = "Переполнение"
L["Paste Import String (replaces current profile)"] =
  "Вставьте строку импорта (заменит текущий профиль)"
L["Pixel Glow"] = "Пиксельное свечение"
L["Position Settings"] = "Настройки расположения"
L["Remove"] = "Убрать"
L["Reverse Type"] = "В обратном порядке по типу"
L["Scale"] = "Масштаб"
L["Set as white (#FFFFFF) to not change icon color"] = "Белый (#FFFFFF), чтобы не менять цвет иконки"
L["Set to negative to inverse direction of rotation"] =
  "Отрицательное значение изменит направление вращения"
L["Shadow Color"] = "Цвет тени"
L["Shadow Settings"] = "Настройки тени"
L["Shadow X-Offset"] = "Смещение тени по X"
L["Shadow Y-Offset"] = "Смещение тени по Y"
L["Shown Text"] = "Показывать текст"
L["Size Settings"] = "Настройки размера"
L["Sort by"] = "Сортировать по"
L["Talents that can be unlearned for this dungeon. Does not check if the talent is a prerequisite for another talent that is needed."] =
  "Талант, который можно убрать для этого подземелья. Не проверяет необходимость данного таланта для других талантов."
L["Text Color"] = "Цвет текста"
L["Text Settings"] = "Настройки текста"
L["Text Size"] = "Размер текста"
L["Text supports {texture:IconID} and {atlas:AtlasID} replacers. Instead of IconID you can provide a path to the texture. For AtlasID, I recommend finding Atlas Names with TextureAtlasViewer addon."] =
  "Текст поддерживает замены {texture:IconID} и {atlas:AtlasID}. Вместо IconID можно указать путь к текстуре. Для AtlasID я рекомендую находить имена атласов с помощью модификации TextureAtlasViewer."
L["Text"] = "Текст"
L["Thick Outline"] = "Толстый контур"
L["Thickness"] = "Толщина"
L["Type"] = "По типу"
L["Wrap"] = "Переносить слова"

-- Profile
L["|cff40ff40Profile imported successfully.|r"] = "|cff40ff40Профиль успешно импортирован.|r"
L["|cffff4040Decompression failed.|r"] = "|cffff4040Ошибка декомпрессии.|r"
L["|cffff4040Invalid encoded string.|r"] = "|cffff4040Неправильная закодированная строка.|r"
L["|cffff4040Invalid serialised data.|r"] = "|cffff4040Неправильные сериализованные данные.|r"
L["|cffff4040Missing profile data.|r"] = "|cffff4040Отсуствуют данные профиля.|r"
L["|cffff4040Profile belongs to another addon.|r"] =
  "|cffff4040Профиль принадлежит другой модификации.|r"
L["Export Profile"] = "Экспортировать профиль"
L["Export String (Ctrl+C to copy)"] = "Строка экспорта (Ctrl+C для копирования)"
L["Export"] = "Экспортировать"
L["Import / Export"] = "Импорт / Экспорт"
L["Import Profile"] = "Импорт профиля"
L["Profiles"] = "Профили"

-- Ability Settings
L["Ability"] = "Способность"
L["Ability Settings"] = "Настройки способностей"
L["Ability Values"] = "Значения способности"
L["Adds the imported settings. Settings of the same abilities are replaced."] =
  "Добавляет импортированные настройки. Настройки тех же заклинаний будут заменены."
L["All Classes"] = "Все классы"
L["Alternative Spell IDs"] = "Альтернативные ID заклинаний"
L["...and %d more"] = "...и еще %d"
L["Baseline"] = "Базовая"
L["Baseline abilities are not talents, so they are never suggested for removal."] =
  "Базовые способности не являются талантами, поэтому их никогда не предлагается убрать."
L["Built-in values of this ability. Custom values below are used instead where they are set."] =
  "Встроенные значения этой способности. Если ниже заданы свои значения, используются они."
L["|cffff4040Missing ability settings data.|r"] =
  "|cffff4040Отсутствуют данные настроек способностей.|r"
L["|cffff4040Not an Ability Settings string.|r"] =
  "|cffff4040Это не строка настроек способностей.|r"
L["Checked tags are used for this ability."] =
  "Для этой способности используются отмеченные метки."
L["Checked: tag is added. Grey: default. Empty: tag is removed. Green tags are default tags."] =
  "Отмечено: метка добавлена. Серая: по умолчанию. Пусто: метка убрана. Зеленые метки - метки по умолчанию."
L["Checks the pet spellbook for this ability."] =
  "Проверяет наличие способности в книге заклинаний питомца."
L["Class"] = "Класс"
L["Class Abilities"] = "Классовые способности"
L["Clear all custom values of this ability?"] = "Удалить все свои значения этой способности?"
L["Clears all custom values of this ability."] =
  "Удаляет все свои значения этой способности."
L["Current Class"] = "Текущий класс"
L["Custom Abilities"] = "Свои способности"
L["custom ability is now a default ability, customise the default ability instead"] =
  "своя способность теперь есть по умолчанию, настройте способность по умолчанию"
L["Custom Tags"] = "Свои метки"
L["Custom tags are not used while \"Custom Tags\" is off in Ability Settings."] =
  "Свои метки не используются, пока в настройках способностей отключено \"Свои метки\"."
L["Custom Values"] = "Свои значения"
L["Customise"] = "Настроить"
L["%d invalid entries were skipped."] = "Пропущено неверных записей: %d."
L["Default Used"] = "Не используется"
L["Default Values (read-only)"] = "Значения по умолчанию (только чтение)"
L["default values were updated"] = "значения по умолчанию изменились"
L["Delete"] = "Удалить"
L["Delete the custom abilities of the selected class?"] =
  "Удалить свои способности выбранного класса?"
L["Delete this custom ability?"] = "Удалить эту способность?"
L["Deletes the custom abilities of the selected class."] =
  "Удаляет свои способности выбранного класса."
L["Edit"] = "Изменить"
L["Enter a valid spell ID."] = "Введите верный ID заклинания."
L["Enter spell IDs separated by commas."] = "Введите ID заклинаний, разделенные запятыми."
L["Export Ability Settings"] = "Экспорт настроек способностей"
L["Import Ability Settings"] = "Импорт настроек способностей"
L["Imported %d customised and %d custom abilities."] =
  "Импортировано настроенных способностей: %d, своих способностей: %d."
L["Merge"] = "Объединить"
L["Merge %d customised and %d custom abilities into the current settings?"] =
  "Объединить с текущими настройками настроенные способности (%d) и свои способности (%d)?"
L["No"] = "Нет"
L["Open Ability Settings"] = "Настройки способностей"
L["Paste Import String"] = "Вставьте строку импорта"
L["Pet Ability"] = "Питомец"
L["Racials"] = "Расовые"
L["Ready to import %d customised and %d custom abilities."] =
  "Готово к импорту: настроенных способностей - %d, своих способностей - %d."
L["Replace"] = "Заменить"
L["Replace the current ability settings with %d customised and %d custom abilities?"] =
  "Заменить текущие настройки на настроенные способности (%d) и свои способности (%d)?"
L["Replaces all current ability settings with the imported settings."] =
  "Заменяет все текущие настройки способностей импортированными."
L["Replaces Spell ID"] = "Заменяет ID заклинания"
L["Reset"] = "Сбросить"
L["Reset the ability settings of the selected class?"] =
  "Сбросить настройки способностей выбранного класса?"
L["Reset the ability settings of this tab?"] =
  "Сбросить настройки способностей на этой вкладке?"
L["Reset to Default"] = "Сбросить значения"
L["Resets the ability settings of the selected class."] =
  "Сбрасывает настройки способностей выбранного класса."
L["Resets the ability settings of this tab."] =
  "Сбрасывает настройки способностей на этой вкладке."
L["%s tags"] = "Метки: %s"
L["Show"] = "Показать"
L["Some of your ability settings need your attention:"] =
  "Проверьте некоторые настройки способностей:"
L["Spell ID"] = "ID заклинания"
L["Spell ID %s does not exist."] = "Заклинания с ID %s не существует."
L["Spell IDs separated by commas. When one of them is known, it is shown instead of this ability. Leave empty to use the default value."] =
  "ID заклинаний, разделенные запятыми. Если одно из них изучено, оно показывается вместо этой способности. Оставьте пустым для значения по умолчанию."
L["Tags"] = "Метки"
L["This ability is already a default ability, which is used instead of this custom ability. Customise the default ability instead."] =
  "Эта способность уже есть по умолчанию, поэтому используется способность по умолчанию. Настройте ее вместо этой."
L["This ability is already added."] = "Эта способность уже добавлена."
L["When this ability is known, the ability with this spell ID is not shown. Leave empty to use the default value."] =
  "Если эта способность изучена, способность с этим ID заклинания не показывается. Оставьте пустым для значения по умолчанию."
L["Yes"] = "Да"

-- Tags
L["Aberration that needs a CC effect (cast time)"] =
  "Аберрация, требующий контроля (с временем применения)"
L["Aberration that needs a CC effect (instant cast)"] =
  "Аберрация, требующий контроля (мгновенного)"
L["Ability that only works on the player"] = "Способность действует только на игрока"
L["Beast that needs a CC effect (cast time)"] =
  "Животное, требующий контроля (с временем применения)"
L["Beast that needs a CC effect (instant cast)"] =
  "Животное, требующий контроля (мгновенного)"
L["Cast-time CC"] = "Контроль с временем применения"
L["Creature"] = "Существа"
L["Creature Effects"] = "Эффекты на существ"
L["Creature that needs a fear effect"] = "Существо, требующее эффекта страха"
L["Creature that needs a forced movement effect"] =
  "Существо, требующее принудительного перемещения"
L["Creature that needs a mortal strike effect"] =
  "Существо, требующее эффекта смертельного удара"
L["Creature that needs a root effect"] = "Существо, требующее обездвиживания"
L["Creature that needs a slow effect"] = "Существо, требующее замедления"
L["Creature that needs a stun effect"] = "Существо, требующее оглушения"
L["Creature that needs an incapacitation effect"] = "Существо, требующее выведения из строя"
L["Critter that needs a CC effect (cast time)"] =
  "Существо, требующий контроля (с временем применения)"
L["Critter that needs a CC effect (instant cast)"] =
  "Существо, требующий контроля (мгновенного)"
L["Crowd Control"] = "Контроль"
L["Curse that needs to be removed from a target, not only from yourself"] =
  "Проклятие, которое нужно снять с цели, а не только с себя"
L["Demon that needs a CC effect (cast time)"] =
  "Демон, требующий контроля (с временем применения)"
L["Demon that needs a CC effect (instant cast)"] = "Демон, требующий контроля (мгновенного)"
L["Dispel"] = "Рассеивание"
L["Dragonkin that needs a CC effect (cast time)"] =
  "Дракон, требующий контроля (с временем применения)"
L["Dragonkin that needs a CC effect (instant cast)"] =
  "Дракон, требующий контроля (мгновенного)"
L["Effects on Enemies"] = "Эффекты на противниках"
L["Effects on Players"] = "Эффекты на игроках"
L["Elemental that needs a CC effect (cast time)"] =
  "Элементаль, требующий контроля (с временем применения)"
L["Elemental that needs a CC effect (instant cast)"] =
  "Элементаль, требующий контроля (мгновенного)"
L["General"] = "Общее"
L["Giant that needs a CC effect (cast time)"] =
  "Великан, требующий контроля (с временем применения)"
L["Giant that needs a CC effect (instant cast)"] = "Великан, требующий контроля (мгновенного)"
L["Humanoid that needs a CC effect (cast time)"] =
  "Гуманоид, требующий контроля (с временем применения)"
L["Humanoid that needs a CC effect (instant cast)"] =
  "Гуманоид, требующий контроля (мгновенного)"
L["Instant-cast CC"] = "Мгновенный контроль"
L["Mechanic that the player can avoid with a \"jump\" ability"] =
  "Механика, которую игрок может избежать способностью \"прыжка\""
L["Mechanic that the player can avoid with immunity to forced movement"] =
  "Механика, которую игрок может избежать невосприимчивостью к принудительному перемещению"
L["Mechanical that needs a CC effect (cast time)"] =
  "Механизм, требующий контроля (с временем применения)"
L["Mechanical that needs a CC effect (instant cast)"] =
  "Механизм, требующий контроля (мгновенного)"
L["Movement"] = "Передвижение"
L["Other"] = "Другое"
L["Player Movement"] = "Передвижение игрока"
L["Professions"] = "Профессии"
L["Purgeable magic effect"] = "Магический эффект, который можно развеять"
L["Purgeable magic effect, Spellsteal special case"] =
  "Магический эффект, который можно развеять, особый случай для Чарокрада"
L["Removable bleed effect"] = "Снимаемое кровотечение"
L["Removable charm effect"] = "Снимаемое подчинение"
L["Removable curse effect"] = "Снимаемое проклятие"
L["Removable disease effect"] = "Снимаемая болезнь"
L["Removable enrage effect"] = "Снимаемое исступление"
L["Removable fear effect"] = "Снимаемый страх"
L["Removable incapacitate effect"] = "Снимаемое выведение из строя"
L["Removable magical debuff, not simply type \"magic\""] =
  "Снимаемый магический дебафф, не просто тип \"магия\""
L["Removable physical debuff"] = "Снимаемый физический дебафф"
L["Removable poison effect"] = "Снимаемый яд"
L["Removable polymorph effect"] = "Снимаемое превращение"
L["Removable root effect"] = "Снимаемое обездвиживание"
L["Removable sleep effect"] = "Снимаемый сон"
L["Removable slow effect"] = "Снимаемое замедление"
L["Removable snare effect"] = "Снимаемое снижение скорости передвижения"
L["Removable stealth effect"] = "Снимаемая незаметность"
L["Removable stun effect"] = "Снимаемое оглушение"
L["Requires Alchemy"] = "Требуется Алхимия"
L["Requires Archaeology"] = "Требуется Археология"
L["Requires Blacksmithing"] = "Требуется Кузнечное дело"
L["Requires Cooking"] = "Требуется Кулинария"
L["Requires Enchanting"] = "Требуется Наложение чар"
L["Requires Engineering"] = "Требуется Инженерное дело"
L["Requires Fishing"] = "Требуется Рыбная ловля"
L["Requires Herbalism"] = "Требуется Травничество"
L["Requires Inscription"] = "Требуется Начертание"
L["Requires Jewelcrafting"] = "Требуется Ювелирное дело"
L["Requires Leatherworking"] = "Требуется Кожевничество"
L["Requires Mining"] = "Требуется Горное дело"
L["Requires Skinning"] = "Требуется Снятие шкур"
L["Requires Tailoring"] = "Требуется Портняжное дело"
L["Special case for Alter Time"] = "Особый случай для Искажения времени"
L["Special CC"] = "Особый контроль"
L["Special CC case for Banish, as damage does not break it"] =
  "Особый случай для Изгнания, так как урон его не прерывает"
L["Special CC case for Cyclone, as damage does not break it"] =
  "Особый случай для Смерча, так как урон его не прерывает"
L["Targeted ability that can be avoided with Feign Death, Shadowmeld, etc."] =
  "Направленная способность, которую можно избежать с помощью Притвориться мертвым, Слиться с тенью и т. п."
L["Uncategorised creature that needs a CC effect (cast time)"] =
  "Существо без типа, требующий контроля (с временем применения)"
L["Uncategorised creature that needs a CC effect (instant cast)"] =
  "Существо без типа, требующий контроля (мгновенного)"
L["Undead that needs a CC effect (cast time)"] =
  "Нежить, требующий контроля (с временем применения)"
L["Undead that needs a CC effect (instant cast)"] = "Нежить, требующий контроля (мгновенного)"
