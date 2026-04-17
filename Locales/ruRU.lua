local L = LibStub("AceLocale-3.0"):NewLocale("MythicPlusUtility", "ruRU")
if not L then return end

-- Options
L["Toggle Window"] = "Переключение окна"
L["Window Position and Size Settings"] = "Размер и положение окна"
L["Width"] = "Ширина"
L["Height"] = "Высота"
L["Lock Window"] = "Не двигать мышкой"
L["Anchor to Screen's"] = "Закрепить за экран"
L["X-Offset"] = "Смещение по X"
L["Y-Offset"] = "Смещение по Y"
L["Text and Icon Settings"] = "Настройки текста и иконки"
L["Dungeon Name Size"] = "Размер названия подземелья"
L["Icon Size"] = "Размер иконки"
L["Icon Label Size"] = "Размер названия иконки"
L["Body Text Size"] = "Размер текста"
L["Background Opacity"] = "Прозрачность фона"
L["Background Color"] = "Цвет фона"
L["Hide on Mythic+ start"] = "Скрыть при начале Эпохальный+"
L["Hide not Important"] = "Скрыть неважные"
L["Hides dungeon entries that are marked with %s"] =
  "Скрывает записи в подземельях, помеченные %s"
L["Dungeon Preview"] = "Просмотр подземелья"
L["Show in"] = "Показывать в"
L["Minimap Icon"] = "Значок миникарты"
L["Talent Highlight Settings"] = "Настройки подсветки таланта"
L["Highlight Color"] = "Цвет подсветки"

-- Difficulty
L["Normal"] = "Обычный"
L["Heroic"] = "Героический"
L["Mythic"] = "Эпохальный"

L["Show/Hide Utility Window"] = "Показать/Скрыть окно"
L["Open Settings"] = "Открыть настройки"
L["Disable Minimap Button"] = "Отключить кнопку миникарты"

-- Dungeons
L["Algeth\'ar Academy"] = "Академия Алгет\'ар"
L["Magisters\' Terrace"] = "Терраса Магистров"
L["Maisara Caverns"] = "Пещеры Маисара"
L["Nexus-Point Xenas"] = "Узел Нексуса Зенас"
L["Pit of Saron"] = "Яма Сарона"
L["Seat of the Triumvirate"] = "Престол Триумвирата"
L["Skyreach"] = "Небесный Путь"
L["Windrunner Spire"] = "Шпили Ветрокрылых"

-- Dungeon entries
L["{spell:%d} buff is cast by {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted."] =
  "{spell:%d} бафф, который накладывает {npc:%d} (треш перед {npc:%d}). Также, это заклинание можно прервать."
L["{spell:%d} buff is cast by {npc:%d}."] = "{spell:%d} бафф, который накладывает {npc:%d}."
L["{spell:%d} buff on {npc:%d} (trash before {npc:%d})."] =
  "{spell:%d} бафф на {npc:%d} (треш перед {npc:%d})."
L["{spell:%d} buff on {npc:%d}."] = "{spell:%d} бафф на {npc:%d}."
L["{spell:%d} buff on the second boss {npc:%d}."] = "{spell:%d} бафф на втором боссе {npc:%d}."
L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted."] =
  "{spell:%d} дебафф, который накладывает {npc:%d} (треш перед {npc:%d}). Также, это заклинание можно прервать."
L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d})."] =
  "{spell:%d} дебафф, который накладывает {npc:%d} (треш перед {npc:%d})."
L["{spell:%d} debuff is inflicted by {npc:%d} on the first boss {npc:%d}."] =
  "{spell:%d} дебафф, который накладывает {npc:%d} на первом боссе {npc:%d}."
L["{spell:%d} debuff is inflicted by {npc:%d}. Also, this cast can be interrupted."] =
  "{spell:%d} дебафф, который накладывает {npc:%d}. Также, это заклинание можно прервать."
L["{spell:%d} debuff is inflicted by {npc:%d}."] =
  "{spell:%d} дебафф, который накладывает {npc:%d}."
L["{spell:%d} debuff is inflicted by contact with {npc:%d} on the last boss {npc:%d}."] =
  "{spell:%d} дебафф, который накладывает контакт с {npc:%d} на последнем боссе {npc:%d}."
L["{spell:%d} debuff is inflicted by contact with orbs on the last boss {npc:%d}."] =
  "{spell:%d} дебафф, который накладывает контакт со сферами на последнем боссе {npc:%d}."
L["{spell:%d} debuff is inflicted by the first boss {npc:%d}."] =
  "{spell:%d} дебафф, который накладывает первый босс {npc:%d}."
L["{spell:%d} debuff is inflicted by the second boss {npc:%d}."] =
  "{spell:%d} дебафф, который накладывает второй босс {npc:%d}."
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
L["Mitigates effects of {spell:%d} on the last boss {npc:%d}."] =
  "Нивелирует эффекты {spell:%d} на последнем боссе {npc:%d}."
L["Prevent {npc:%d} from reaching {npc:%d}."] = "Мешает {npc:%d} достичь {npc:%d}."
L["Prevent {npc:%d} from reaching players or other {npc:%d} on the second boss {npc:%d}."] =
  "Мешает {npc:%d} достичь игроков или других {npc:%d} на втором боссе {npc:%d}."
L["Prevent {npc:%d} from reaching the first boss {npc:%d}."] =
  "Мешает {npc:%d} достичь первого босса {npc:%d}."
L["Slow {npc:%d} on the third boss {npc:%d}."] = "Замедляет {npc:%d} на третьем боссе {npc:%d}."
L["Stun {npc:%d} on the last boss {npc:%d}."] = "Оглушает {npc:%d} на последнем боссе {npc:%d}."
L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d}). Also, this cast can be LoS."] =
  "{spell:%d} дебафф, который накладывает {npc:%d} (треш перед {npc:%d}). Также, от этого заклинание можно укрытся."
L["{spell:%d} debuff is inflicted by {npc:%d} (trash before {npc:%d}). Also, this cast can be interrupted and LoS."] =
  "{spell:%d} дебафф, который накладывает {npc:%d} (треш перед {npc:%d}). Также, это заклинание можно прервать и укрыться от него."
L["{spell:%d} debuff is inflicted by {npc:%d}. Also, this debuff can be avoided."] =
  "{spell:%d} дебафф, который накладывает {npc:%d}. Также, этот дебафф можно избежать."
L["{spell:%d} debuff is inflicted by the third boss {npc:%d}. Also, this debuff can be avoided."] =
  "{spell:%d} дебафф, который накладывает второй босс {npc:%d}. Также, этот дебафф можно избежать."
L["Avoid {spell:%d} when {npc:%d} casts on last seconds."] =
  "Избегите {spell:%d}, когда {npc:%d} произносит на последних секундах."
L["Avoid {spell:%d} when the first boss {npc:%d} starts channeling."] =
  "Избегите {spell:%d}, когда первый босс {npc:%d} начинает поддерживать заклинание."
L["Avoid {spell:%d} when totem starts channeling on the last boss {npc:%d}."] =
  "Избегите {spell:%d}, когда тотем начинает поддерживать заклинание на последнем боссе {npc:%d}."
L["Avoid {spell:%d} when {npc:%d} starts channeling."] =
  "Избегите {spell:%d}, когда {npc:%d} начинает поддерживать заклинание."
L["Avoid {spell:%d} when {npc:%d} starts channeling on the third boss {npc:%d}."] =
  "Избегите {spell:%d}, когда {npc:%d} начинает поддерживать заклинание на третьем боссе {npc:%d}."
L["Avoid {spell:%d} when {npc:%d} jumps on you."] =
  "Избегите {spell:%d}, когда {npc:%d} прыгнет на вас."
L["Avoid {spell:%d} when the last boss {npc:%d} starts channeling."] =
  "Избегите {spell:%d}, когда последний босс {npc:%d} начинает поддерживать заклинание."
L["Avoid {spell:%d} when {npc:%d} throws axe."] =
  "Избегите {spell:%d}, когда {npc:%d} кинет топор."

-- 1.1.0
L["\"Add Optional\""] = "\"Взять необязательно\""
L["\"Add\""] = "\"Взять\""
L["\"Known\""] = "\"Изучено\""
L["\"Optional\""] = "\"Необязательно\""
L["\"Remove\""] = "\"Убрать\""
L["|cff40ff40Profile imported successfully.|r"] = "|cff40ff40Профиль успешно импортирован.|r"
L["|cffff4040Decompression failed.|r"] = "|cffff4040Ошибка декомпрессии.|r"
L["|cffff4040Invalid encoded string.|r"] =
  "|cffff4040Неправильная закодированная строка.|r"
L["|cffff4040Invalid serialised data.|r"] =
  "|cffff4040Неправильные сериализованные данные.|r"
L["|cffff4040Missing profile data.|r"] = "|cffff4040Отсуствуют данные профиля.|r"
L["|cffff4040Profile belongs to another addon.|r"] =
  "|cffff4040Профиль принадлежит другой модификации.|r"
L["Action Button Glow"] = "Свечение кнопки действия"
L["Add Not Important"] = "Взять неважные"
L["Add"] = "Взять"
L["Ascending Alphabetical"] = "В порядке возрастания по алфавиту"
L["AtlasID Texture"] = "Текстура AtlasID "
L["Auto Expand Height"] = "Автоматическая высота"
L["Autocast Shine"] = "Свечение при автоприменении"
L["Automatic"] = "Автоматически"
L["Avoid {spell:%d} when {npc:%d} jumps. Targets the furthest player."] =
  "Избегите {spell:%d}, когда {npc:%d} прыгнет. Целью выберается самый дальний игрок."
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
L["Export Profile"] = "Экспортировать профиль"
L["Export String (Ctrl+C to copy)"] = "Строка экспорта (Ctrl+C для копирования)"
L["Export"] = "Экспортировать"
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
L["Import / Export"] = "Импорт / Экспорт"
L["Import Profile"] = "Импорт профиля"
L["Known Not Important"] = "Изучено необязательно"
L["Known"] = "Изучено"
L["Length"] = "Длина"
L["Lines & Particles"] = "Линии и частицы"
L["Max Height"] = "Максимальная высота"
L["Monochrome Outline"] = "Монохромный край; контур"
L["Monochrome Thick Outline"] = "Монохр-й край; толстый контур"
L["Monochrome"] = "Монохромный край"
L["No utility abilities for this dungeon"] =
  "Для этого подземелья нет вспомогательных способностей"
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
L["Set as white (#FFFFFF) to not change icon color"] =
  "Белый (#FFFFFF), чтобы не менять цвет иконки"
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
L["Profiles"] = "Профили"

-- 1.1.9
L["{spell:%d} debuff is inflicted by {npc:%d}. Debuff is removed only from yourself."] =
  "{spell:%d} дебафф, который накладывает {npc:%d}. Дебафф снимается только с себя."
L["{spell:%d} debuff is inflicted by the first boss {npc:%d}. Debuff is removed only from yourself."] =
  "{spell:%d} дебафф, который накладывает первый босс {npc:%d}. Дебафф снимается только с себя."
L["{spell:%d} debuff is inflicted by the second boss {npc:%d}. Debuff is removed only from yourself."] =
  "{spell:%d} дебафф, который накладывает второй босс {npc:%d}. Дебафф снимается только с себя."
L["Avoid {spell:%d} when {npc:%d} throws glaive."] =
  "Избегите {spell:%d}, когда {npc:%d} кинет глефу."
L["Jump back to the platform if you are thrown off by {npc:%d} on the last boss {npc:%d}."] =
  "Прыгните обратно на платформу, если вас сбросил {npc:%d} на последнем боссе {npc:%d}."
L["Skips part of the wind maze after the third boss {npc:%d}."] =
  "Пропускает часть лабиринта ветра после третьего босса {npc:%d}."

-- 1.2.1
L["Avoid {spell:%d} when the last boss {npc:%d} targets you."] =
  "Избегите {spell:%d}, когда последний босс {npc:%d} выбирает вас целью."
L["Prevent {npc:%d} from reaching players on the third boss {npc:%d}."] =
  "Мешает {npc:%d} достичь игроков на третьем боссе {npc:%d}."
L["Skips add pack before the last boss {npc:%d}. This is route specific."] =
  "Пропускает пачку врагов перед последним боссом {npc:%d}. Это специфично для маршрута."
