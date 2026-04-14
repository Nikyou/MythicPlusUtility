local L = LibStub("AceLocale-3.0"):GetLocale("MythicPlusUtility")
local LSM = LibStub("LibSharedMedia-3.0", true)
local maxValue = MythicPlusUtility.globals.maxValue

MythicPlusUtility.defaults = {
    profile = {
        AddonName = "MythicPlusUtility",
        minimap = {hide = false},
        toggleFrameLock = true,
        hideOnStart = true,
        frameBackground = {0, 0, 0, 0.5},
        hideNotImportant = false,
        instanceID = MythicPlusUtility.defaultDungeonId,
        difficultyID = {[1] = false, [2] = false, [23] = true},
        windowSettings = {
            width = 350,
            height = 600,
            autoExpand = false,
            maxHeightEnable = false,
            maxHeight = 1200,
            xOffset = 100,
            yOffset = -150,
            framePoint = "TOPLEFT",
        },
        textAndIcon = {
            ['**'] = {
                labelColor = {1, 1, 1, 1},
                labelSize = 12,
                labelFont = "Friz Quadrata TT",
                labelOutline = "OUTLINE",
                labelShadowColor = {0, 0, 0, 1},
                labelShadowX = 0,
                labelShadowY = 0,
            },
            icon = {size = 35, sortBy = "typeAsc", labelColor = {1, 0.82, 0, 1}},
            dungeonName = {labelSize = 20},
            bodyText = {},
        },
        buttonCosmetic = {
            ['**'] = {
                enabled = true,
                iconDesaturate = false,
                iconColor = {1, 1, 1, 1},
                hightlightEnabled = true,
                hightlightColor = {1, 1, 1, 0.3},
                iconGlow = false,
                iconGlowType = "action",
                iconGlowColor = {1, 1, 1, 1},
                glowPixelN = 8,
                glowPixelFrequency = 0.25,
                glowPixelLength = 10,
                glowPixelTh = 1,
                glowPixelXOffset = 0,
                glowPixelYOffset = 0,
                glowPixelBorder = false,
                glowAutocastN = 8,
                glowAutocastFrequency = 0.25,
                glowAutocastScale = 1,
                glowAutocastXOffset = 0,
                glowAutocastYOffset = 0,
                label = "",
                labelType = "default",
                isCustom = false,
                labelColor = {1, 1, 1, 1},
                labelSize = 25,
                labelFont = "Friz Quadrata TT",
                labelOutline = "OUTLINE",
                labelShadowColor = {0, 0, 0, 1},
                labelShadowX = 0,
                labelShadowY = 0,
                labelWidthType = "automatic",
                labelWidth = 20,
                labelOverflow = "wrap",
                customLabelText = "",
                customLabelTextFormatted = "",
            },
            learnedAbility = {enabled = false, hightlightEnabled = false, label = "*"},
            onlyNotImportantAbility = {
                hightlightColor = {1, 1, 0, 0.3},
                iconGlowColor = {1, 1, 0, 1},
                label = "?",
                labelColor = {1, 1, 0, 1},
            },
            needAbility = {
                iconDesaturate = true,
                hightlightColor = {0, 1, 0, 0.3},
                iconGlowColor = {0, 1, 0, 1},
                label = "+",
                labelColor = {0, 1, 0, 1},
            },
            needOnlyNotImportantAbility = {
                iconDesaturate = true,
                hightlightColor = {0.6, 1, 0, 0.3},
                iconGlowColor = {0.75, 1, 0, 1},
                label = "+?",
                labelColor = {0.75, 1, 0, 1},
            },
            unlearnAbility = {
                hightlightColor = {1, 0, 0, 0.3},
                iconColor = {1, 0, 0, 1},
                iconGlowColor = {1, 0, 0, 1},
                label = "-",
                labelColor = {1, 0, 0, 1},
            },
        },
    },
}

MythicPlusUtility.options = {
    type = "group",
    name = "Mythic Plus Utility",
    handler = MythicPlusUtility,
    childGroups = "tab",
    args = {
        toggleFrame = {type = "execute", order = 1, name = L["Toggle Window"], func = "ToggleAbilitiesFrame"},
        breakLine1 = {type = "header", order = 10, name = ""},
        windowSettings = {
            type = "group",
            order = 1,
            name = L["Window Position and Size Settings"],
            get = "GetValueWithParent",
            set = "SetValueWindowSettings",
            args = {
                sizeHeader = {type = "header", order = 1, name = L["Size Settings"]},
                width = {
                    type = "range",
                    order = 1.1,
                    name = L["Width"],
                    min = 150,
                    max = 8880,
                    softMax = 2220,
                    bigStep = 5,
                    step = 0.01,
                },
                height = {
                    type = "range",
                    order = 1.2,
                    name = L["Height"],
                    hidden = function(info)
                        return MythicPlusUtility.db.profile.windowSettings.autoExpand
                    end,
                    min = 150,
                    max = 4800,
                    softMax = 1200,
                    bigStep = 5,
                    step = 0.01,
                },
                autoExpand = {type = "toggle", order = 1.3, name = L["Auto Expand Height"]},
                maxHeightEnable = {
                    type = "toggle",
                    order = 1.4,
                    name = L["Max Height"],
                    hidden = function(info)
                        return not MythicPlusUtility.db.profile.windowSettings.autoExpand
                    end,
                },
                maxHeight = {
                    type = "range",
                    order = 1.2,
                    name = L["Max Height"],
                    hidden = function(info)
                        return not MythicPlusUtility.db.profile.windowSettings.maxHeightEnable
                                 or not MythicPlusUtility.db.profile.windowSettings.autoExpand
                    end,
                    min = 150,
                    max = 4800,
                    softMax = 1200,
                    bigStep = 5,
                    step = 0.01,
                },
                positionHeader = {type = "header", order = 2, name = L["Position Settings"]},
                framePoint = {
                    type = "select",
                    order = 2.1,
                    name = L["Anchor to Screen's"],
                    sorting = {
                        "TOPLEFT", "TOP", "TOPRIGHT", "LEFT", "CENTER", "RIGHT", "BOTTOMLEFT", "BOTTOM", "BOTTOMRIGHT",
                    },
                    values = {
                        TOPLEFT = "TOPLEFT",
                        TOP = "TOP",
                        TOPRIGHT = "TOPRIGHT",
                        LEFT = "LEFT",
                        CENTER = "CENTER",
                        RIGHT = "RIGHT",
                        BOTTOMLEFT = "BOTTOMLEFT",
                        BOTTOM = "BOTTOM",
                        BOTTOMRIGHT = "BOTTOMRIGHT",
                    },
                },
                xOffset = {
                    type = "range",
                    order = 2.2,
                    name = L["X-Offset"],
                    min = -8880,
                    max = 8880,
                    softMin = -2220,
                    softMax = 2220,
                    bigStep = 10,
                    step = 0.01,
                },
                yOffset = {
                    type = "range",
                    order = 2.3,
                    name = L["Y-Offset"],
                    min = -4800,
                    max = 4800,
                    softMin = -1200,
                    softMax = 1200,
                    bigStep = 10,
                    step = 0.01,
                },
                toggleFrameLock = {
                    type = "toggle",
                    order = 2.4,
                    name = L["Lock Window"],
                    get = "GetValue",
                    set = function(info, value)
                        MythicPlusUtility.db.profile[info[#info]] = value
                        if MythicPlusUtility.Frame then MythicPlusUtility.Frame:FrameLockUpdate() end
                    end,
                },
            },
        },
        textAndIconGroup = {
            type = "group",
            order = 2,
            name = L["Text and Icon Settings"],
            childGroups = "tree",
            get = "GetValueTextAndIcon",
            set = "SetValueTextAndIcon",
            args = {},
        },
        frameBackground = {
            type = "color",
            hasAlpha = true,
            order = 12,
            name = L["Background Color"],
            get = function(info)
                local t = MythicPlusUtility.db.profile[info[#info]]
                return t[1], t[2], t[3], t[4]
            end,
            set = function(info, r, g, b, a)
                MythicPlusUtility.db.profile[info[#info]] = {r, g, b, a}
                if MythicPlusUtility.Frame then
                    MythicPlusUtility.Frame.background:SetColorTexture(r, g, b, a)
                end
            end,
        },
        hideOnStart = {
            type = "toggle",
            order = 2,
            width = 1.25,
            name = L["Hide on Mythic+ start"],
            get = "GetValue",
            set = "SetValue",
        },
        minimap = {
            type = "toggle",
            order = 3,
            name = L["Minimap Icon"],
            get = function(info) return not MythicPlusUtility.db.profile.minimap.hide end,
            set = function(info, value) MythicPlusUtility:ToggleMinimapIcon() end,
        },
        hideNotImportant = {
            type = "toggle",
            order = 13,
            name = L["Hide not Important"],
            desc = format(L["Hides dungeon entries that are marked with %s"],
                          CreateAtlasMarkup("map-icon-ignored-bluequestion")),
            get = "GetValue",
            set = "SetValueInstance",
        },
        difficultyID = {
            type = "multiselect",
            order = 14,
            name = L["Show in"],
            get = "GetValueDifficulty",
            set = "SetValueDifficulty",
            values = {[1] = L["Normal"], [2] = L["Heroic"], [23] = L["Mythic"]},
        },
        instanceID = {
            type = "select",
            order = 11,
            name = L["Dungeon Preview"],
            get = "GetValueInstance",
            set = "SetValueInstance",
            sorting = {2526, 2811, 2874, 2915, 658, 1753, 1209, 2805},
            values = MythicPlusUtility.dungeonIdToName,
        },
        buttonCosmeticGroup = {
            type = "group",
            childGroups = "tree",
            order = 3,
            name = L["Icon Cosmetics Settings"],
            args = {},
        },
    },
}

local function populateTextAndIconGroupGroup()

    local table = {
        [1] = {name = "icon", nameLabel = L["Icon"]},
        [2] = {name = "dungeonName", nameLabel = L["Dungeon Name"]},
        [3] = {name = "bodyText", nameLabel = L["Body Text"]},
    }

    for i, entry in ipairs(table) do
        MythicPlusUtility.options.args.textAndIconGroup.args[entry.name] = {
            type = "group",
            inline = false,
            order = i,
            name = entry.nameLabel,
            args = {
                labelSize = {
                    type = "range",
                    order = 2.1,
                    name = L["Text Size"],
                    width = 0.7,
                    min = 6,
                    max = maxValue,
                    softMax = 72,
                    step = 1,
                },
                labelFont = {
                    type = "select",
                    dialogControl = 'LSM30_Font',
                    order = 2.2,
                    name = L["Font"],
                    width = 1.5,
                    values = LSM:HashTable("font"),
                },
                labelColor = {
                    type = "color",
                    hasAlpha = true,
                    order = 2.3,
                    name = L["Text Color"],
                    width = 1,
                    get = "GetValueTextAndIconColor",
                    set = "SetValueTextAndIconColor",
                },
                -- Font Flags
                labelFontFlagsBreakLine = {type = "header", order = 3, name = L["Font Settings"]},
                labelOutline = {
                    type = "select",
                    order = 3.1,
                    name = L["Outline"],
                    width = 1.25,
                    values = {
                        MONOCHROME = L["Monochrome"],
                        ["MONOCHROME, OUTLINE"] = L["Monochrome Outline"],
                        ["MONOCHROME, THICKOUTLINE"] = L["Monochrome Thick Outline"],
                        NONE = L["None"],
                        OUTLINE = L["Outline"],
                        THICKOUTLINE = L["Thick Outline"],
                    },
                },
                labelShadowColor = {
                    type = "color",
                    hasAlpha = true,
                    order = 3.2,
                    name = L["Shadow Color"],
                    width = 1.25,
                    get = "GetValueTextAndIconColor",
                    set = "SetValueTextAndIconColor",
                },
                labelShadowX = {
                    type = "range",
                    order = 3.3,
                    name = L["Shadow X-Offset"],
                    width = 0.75,
                    min = -maxValue,
                    max = maxValue,
                    softMin = -15,
                    softMax = 15,
                    bigStep = 1,
                    step = 0.01,
                },
                labelShadowY = {
                    type = "range",
                    order = 3.4,
                    name = L["Shadow Y-Offset"],
                    width = 0.75,
                    min = -maxValue,
                    max = maxValue,
                    softMin = -15,
                    softMax = 15,
                    bigStep = 1,
                    step = 0.01,
                },
            },
        }
    end

    MythicPlusUtility.options.args.textAndIconGroup.args.icon.args.size = {
        type = "range",
        order = 1.1,
        name = L["Icon Size"],
        width = 0.7,
        min = 10,
        max = 4800,
        softMax = 100,
        step = 0.01,
        bigStep = 1,
    }
    MythicPlusUtility.options.args.textAndIconGroup.args.icon.args.sortBy = {
        type = "select",
        order = 1.2,
        name = L["Sort by"],
        width = 1.5,
        sorting = {"typeAsc", "typeDes", "alpAsc", "alpDes"},
        values = {
            typeAsc = L["Type"],
            typeDes = L["Reverse Type"],
            alpAsc = L["Ascending Alphabetical"],
            alpDes = L["Descending Alphabetical"],
        },
    }
    MythicPlusUtility.options.args.textAndIconGroup.args.icon.args.labelBreakLine = {
        type = "header",
        order = 2,
        name = L["Text Settings"],
    }

end
populateTextAndIconGroupGroup()

local function populateButtonCosmeticGroup()
    local table = {
        [1] = {
            name = "learnedAbility",
            nameLabel = L["Known"],
            desc = L["Currently known abilities that will be useful for this dungeon."],
        },
        [2] = {
            name = "onlyNotImportantAbility",
            nameLabel = L["Known Not Important"],
            desc = format(
              L["Currently known abilities that will be useful for this dungeon and only contain dungeon entries that are marked with %s. If disabled, \"Known\" settings will be used."],
              CreateAtlasMarkup("map-icon-ignored-bluequestion")),
        },
        [3] = {
            name = "needAbility",
            nameLabel = L["Add"],
            desc = L["Currently not known abilities that will be useful in this dungeon."],
        },
        [4] = {
            name = "needOnlyNotImportantAbility",
            nameLabel = L["Add Not Important"],
            desc = format(
              L["Currently not known abilities that will be useful in this dungeon and only contain dungeon entries that are marked with %s. If disabled, \"Add\" settings will be used."],
              CreateAtlasMarkup("map-icon-ignored-bluequestion")),
        },
        [5] = {
            name = "unlearnAbility",
            nameLabel = L["Remove"],
            desc = L["Talents that can be unlearned for this dungeon. Does not check if the talent is a prerequisite for another talent that is needed."],
        },
    }

    for i, entry in ipairs(table) do
        MythicPlusUtility.options.args.buttonCosmeticGroup.args[entry.name] = {
            type = "group",
            inline = false,
            order = i,
            name = entry.nameLabel,
            desc = entry.desc,
            get = "GetValueButtonCosmetic",
            set = "SetValueButtonCosmetic",
            args = {
                enabled = {type = "toggle", order = 1, name = L["Enable"], width = 0.65},
                iconDesaturate = {
                    type = "toggle",
                    order = 1.1,
                    name = L["Desaturate Icon"],
                    width = 0.9,
                    hidden = "ButtonCosmeticHide",
                },
                iconColor = {
                    type = "color",
                    hasAlpha = true,
                    desc = L["Set as white (#FFFFFF) to not change icon color"],
                    width = 0.8,
                    order = 1.2,
                    name = L["Icon Color"],
                    hidden = "ButtonCosmeticHide",
                    get = "GetValueButtonCosmeticColor",
                    set = "SetValueButtonCosmeticColor",
                },
                -- Talent Highlight Settings
                hightlightBreakLine = {
                    type = "header",
                    order = 1.90,
                    name = L["Talent Highlight Settings"],
                    hidden = "ButtonCosmeticHide",
                },
                hightlightEnabled = {
                    type = "toggle",
                    order = 1.91,
                    name = L["Enable"],
                    width = 0.7,
                    hidden = "ButtonCosmeticHide",
                    set = "SetValueTalentHighlight",
                },
                hightlightColor = {
                    type = "color",
                    hasAlpha = true,
                    order = 1.92,
                    name = L["Highlight Color"],
                    width = 1,
                    hidden = "ButtonCosmeticHide",
                    get = "GetValueButtonCosmeticColor",
                    set = "SetValueButtonCosmeticColor",
                },
                -- Glow Settings
                glowBreakLine = {type = "header", order = 2, name = L["Glow Settings"], hidden = "ButtonCosmeticHide"},
                iconGlow = {
                    type = "toggle",
                    order = 2.1,
                    name = L["Enable"],
                    width = 0.7,
                    hidden = "ButtonCosmeticHide",
                    set = "SetValueButtonCosmeticGlow",
                },
                iconGlowType = {
                    type = "select",
                    order = 2.2,
                    name = L["Glow Type"],
                    width = 0.9,
                    hidden = "ButtonCosmeticHide",
                    set = "SetValueButtonCosmeticGlow",
                    sorting = MythicPlusUtility.globals.iconGlowTypeListOrder,
                    values = MythicPlusUtility.globals.iconGlowTypeList,
                },
                iconGlowColor = {
                    type = "color",
                    hasAlpha = true,
                    order = 2.3,
                    name = L["Glow Color"],
                    width = 0.8,
                    hidden = "ButtonCosmeticHide",
                    get = "GetValueButtonCosmeticColor",
                    set = "SetValueButtonCosmeticColor",
                },
                -- Pixel Glow
                glowPixelN = {
                    type = "range",
                    order = 2.4,
                    name = L["Lines & Particles"],
                    width = 0.7,
                    hidden = "ButtonCosmeticHide",
                    set = "SetValueButtonCosmeticGlow",
                    min = 1,
                    max = maxValue,
                    softMax = 30,
                    step = 1,
                },
                glowPixelFrequency = {
                    type = "range",
                    order = 2.5,
                    name = L["Frequency"],
                    desc = L["Set to negative to inverse direction of rotation"],
                    width = 0.7,
                    hidden = "ButtonCosmeticHide",
                    set = "SetValueButtonCosmeticGlow",
                    min = -maxValue,
                    max = maxValue,
                    softMin = -2,
                    softMax = 2,
                    bigStep = 0.05,
                },
                glowPixelLength = {
                    type = "range",
                    order = 2.6,
                    name = L["Length"],
                    width = 0.7,
                    hidden = "ButtonCosmeticHide",
                    set = "SetValueButtonCosmeticGlow",
                    min = 1,
                    max = maxValue,
                    softMax = 20,
                    step = 0.05,
                },
                glowPixelTh = {
                    type = "range",
                    order = 2.7,
                    name = L["Thickness"],
                    width = 0.7,
                    hidden = "ButtonCosmeticHide",
                    set = "SetValueButtonCosmeticGlow",
                    min = 0.05,
                    max = maxValue,
                    softMax = 20,
                    step = 1,
                },
                glowPixelXOffset = {
                    type = "range",
                    order = 2.8,
                    name = L["X-Offset"],
                    width = 0.7,
                    hidden = "ButtonCosmeticHide",
                    set = "SetValueButtonCosmeticGlow",
                    min = -maxValue,
                    max = maxValue,
                    softMin = -100,
                    softMax = 100,
                    step = 0.5,
                },
                glowPixelYOffset = {
                    type = "range",
                    order = 2.9,
                    name = L["Y-Offset"],
                    width = 0.7,
                    hidden = "ButtonCosmeticHide",
                    set = "SetValueButtonCosmeticGlow",
                    min = -maxValue,
                    max = maxValue,
                    softMin = -100,
                    softMax = 100,
                    step = 0.5,
                },
                glowPixelBorder = {
                    type = "toggle",
                    order = 2.91,
                    name = L["Border"],
                    width = 0.8,
                    hidden = "ButtonCosmeticHide",
                    set = "SetValueButtonCosmeticGlow",
                },
                -- Autocast Shine
                glowAutocastN = {
                    type = "range",
                    order = 2.4,
                    name = L["Lines & Particles"],
                    width = 0.7,
                    hidden = "ButtonCosmeticHide",
                    set = "SetValueButtonCosmeticGlow",
                    min = 1,
                    max = maxValue,
                    softMax = 30,
                    step = 1,
                },
                glowAutocastFrequency = {
                    type = "range",
                    order = 2.5,
                    name = L["Frequency"],
                    desc = L["Set to negative to inverse direction of rotation"],
                    width = 0.7,
                    hidden = "ButtonCosmeticHide",
                    set = "SetValueButtonCosmeticGlow",
                    min = -maxValue,
                    max = maxValue,
                    softMin = -2,
                    softMax = 2,
                    step = 0.05,
                },
                glowAutocastXOffset = {
                    type = "range",
                    order = 2.6,
                    name = L["X-Offset"],
                    width = 0.7,
                    hidden = "ButtonCosmeticHide",
                    set = "SetValueButtonCosmeticGlow",
                    min = -maxValue,
                    max = maxValue,
                    softMin = -100,
                    softMax = 100,
                    step = 0.5,
                },
                glowAutocastYOffset = {
                    type = "range",
                    order = 2.7,
                    name = L["Y-Offset"],
                    width = 0.7,
                    hidden = "ButtonCosmeticHide",
                    set = "SetValueButtonCosmeticGlow",
                    min = -maxValue,
                    max = maxValue,
                    softMin = -100,
                    softMax = 100,
                    step = 0.5,
                },
                glowAutocastScale = {
                    type = "range",
                    order = 2.8,
                    name = L["Scale"],
                    isPercent = true,
                    width = 0.7,
                    hidden = "ButtonCosmeticHide",
                    set = "SetValueButtonCosmeticGlow",
                    min = 0.05,
                    max = maxValue,
                    softMax = 10,
                    step = 0.05,
                },
                -- Text Settings
                labelBreakLine = {type = "header", order = 3, name = L["Text Settings"], hidden = "ButtonCosmeticHide"},
                labelType = {
                    type = "select",
                    order = 3.1,
                    name = L["Shown Text"],
                    width = 1.25,
                    hidden = "ButtonCosmeticHide",
                    set = "SetValueButtonCosmeticLabel",
                    sorting = MythicPlusUtility.globals.labelListOrder,
                    values = MythicPlusUtility.globals[entry.name].labelList,
                },
                labelColor = {
                    type = "color",
                    hasAlpha = true,
                    order = 3.2,
                    name = L["Text Color"],
                    width = 1,
                    hidden = "ButtonCosmeticHide",
                    get = "GetValueButtonCosmeticColor",
                    set = "SetValueButtonCosmeticColor",
                },
                labelFont = {
                    type = "select",
                    dialogControl = 'LSM30_Font',
                    order = 3.3,
                    name = L["Font"],
                    width = 1.5,
                    hidden = "ButtonCosmeticHide",
                    set = "SetValueButtonCosmeticLabel",
                    values = LSM:HashTable("font"),
                },
                labelSize = {
                    type = "range",
                    order = 3.4,
                    name = L["Text Size"],
                    width = 0.7,
                    hidden = "ButtonCosmeticHide",
                    set = "SetValueButtonCosmeticLabel",
                    min = 6,
                    max = maxValue,
                    softMax = 72,
                    step = 1,
                },
                -- Font Flags
                labelFontFlagsBreakLine = {
                    type = "header",
                    order = 4,
                    name = L["Font Settings"],
                    hidden = "ButtonCosmeticHide",
                },
                labelOutline = {
                    type = "select",
                    order = 4.1,
                    name = L["Outline"],
                    width = 1.25,
                    hidden = "ButtonCosmeticHide",
                    set = "SetValueButtonCosmeticLabel",
                    values = {
                        MONOCHROME = L["Monochrome"],
                        ["MONOCHROME, OUTLINE"] = L["Monochrome Outline"],
                        ["MONOCHROME, THICKOUTLINE"] = L["Monochrome Thick Outline"],
                        NONE = L["None"],
                        OUTLINE = L["Outline"],
                        THICKOUTLINE = L["Thick Outline"],
                    },
                },
                labelShadowColor = {
                    type = "color",
                    hasAlpha = true,
                    order = 4.2,
                    name = L["Shadow Color"],
                    width = 1,
                    hidden = "ButtonCosmeticHide",
                    get = "GetValueButtonCosmeticColor",
                    set = "SetValueButtonCosmeticColorShadow",
                },
                labelShadowX = {
                    type = "range",
                    order = 4.3,
                    name = L["Shadow X-Offset"],
                    width = 0.75,
                    hidden = "ButtonCosmeticHide",
                    set = "SetValueButtonCosmeticLabel",
                    min = -maxValue,
                    max = maxValue,
                    softMin = -15,
                    softMax = 15,
                    bigStep = 1,
                    step = 0.01,
                },
                labelShadowY = {
                    type = "range",
                    order = 4.4,
                    name = L["Shadow Y-Offset"],
                    width = 0.75,
                    hidden = "ButtonCosmeticHide",
                    set = "SetValueButtonCosmeticLabel",
                    min = -maxValue,
                    max = maxValue,
                    softMin = -15,
                    softMax = 15,
                    bigStep = 1,
                    step = 0.01,
                },
                labelWidthType = {
                    type = "select",
                    order = 4.5,
                    name = L["Width"],
                    width = 0.75,
                    hidden = "ButtonCosmeticHide",
                    set = "SetValueButtonCosmeticLabel",
                    values = {automatic = L["Automatic"], fixed = L["Fixed"]},
                },
                labelWidth = {
                    type = "range",
                    order = 4.6,
                    name = L["Width"],
                    width = 0.7,
                    hidden = "ButtonCosmeticHide",
                    set = "SetValueButtonCosmeticLabel",
                    min = 1,
                    max = maxValue,
                    softMax = 200,
                    bigStep = 1,
                    step = 0.01,
                },
                labelOverflow = {
                    type = "select",
                    order = 4.7,
                    name = L["Overflow"],
                    set = "SetValueButtonCosmeticLabel",
                    width = 0.8,
                    hidden = "ButtonCosmeticHide",
                    values = {ignore = L["Ignore"], wrap = L["Wrap"]},
                },
                -- Custom Label
                customLabelBreakLine = {
                    type = "header",
                    order = 5,
                    name = L["Custom Text Settings"],
                    hidden = "ButtonCosmeticHide",
                },
                customLabelText = {
                    type = "input",
                    order = 5.1,
                    name = L["Custom Text"],
                    width = 3,
                    multiline = true,
                    hidden = "ButtonCosmeticHide",
                    desc = L["Text supports {texture:IconID} and {atlas:AtlasID} replacers. Instead of IconID you can provide a path to the texture. For AtlasID, I recommend finding Atlas Names with TextureAtlasViewer addon."],
                    set = "SetValueButtonCosmeticLabel",
                },
            },
        }
    end
end
populateButtonCosmeticGroup()

function MythicPlusUtility:GetValue(info) return self.db.profile[info[#info]] end

function MythicPlusUtility:SetValue(info, value) self.db.profile[info[#info]] = value end

function MythicPlusUtility:SetValueTalentHighlight(info, value)
    local name = info[#info]
    local db = self.db.profile.buttonCosmetic[info[#info - 1]]
    db[name] = value

    if self.Frame and self.Frame:IsVisible() then
        self.TalentFrameHighlight:HideAll()
        self.TalentFrameHighlight:ShowRelevant()
    end
end

function MythicPlusUtility:SetValueWindowSettings(info, value)
    local name = info[#info]
    local db = self.db.profile[info[#info - 1]]
    db[name] = value

    if self.Frame then
        if name == "width" then
            self.Frame:SetWidth(value)
            self.Frame:UpdateTextWrap()
        elseif name == "height" or name == "autoExpand" or name == "maxHeightEnable" or name == "maxHeight" then
            if not db.autoExpand then
                self.Frame:SetHeight(db.height)
                self.Frame.leftLabelFrame:SetHeight(db.height)
            else
                self.Frame:UpdateLayout()
            end
        elseif name == "framePoint" or name == "xOffset" or name == "yOffset" then
            self.Frame:UpdatePosition()
        end
    end
end

function MythicPlusUtility:SetValueUpdatePosition(info, value)
    self.db.profile[info[#info]] = value
    if self.Frame then self.Frame:UpdatePosition() end
end

function MythicPlusUtility:GetValueInstance(info)
    return self.dungeonIdToName[self.db.profile.instanceID] and self.db.profile.instanceID or self.defaultDungeonId
end

function MythicPlusUtility:SetValueInstance(info, value)
    self.db.profile[info[#info]] = value
    if self.Frame then self.Frame:ChangeInstance() end
end

function MythicPlusUtility:GetValueDifficulty(info, key) return self.db.profile.difficultyID[key] end

function MythicPlusUtility:SetValueDifficulty(info, key, state) self.db.profile.difficultyID[key] = state end

function MythicPlusUtility:GetValueWithParent(info) return self.db.profile[info[#info - 1]][info[#info]] end

function MythicPlusUtility:GetValueTextAndIcon(info) return self.db.profile.textAndIcon[info[#info - 1]][info[#info]] end

function MythicPlusUtility:SetValueTextAndIcon(info, value)
    local name = info[#info]
    local db = self.db.profile.textAndIcon[info[#info - 1]]
    db[name] = value

    if self.Frame then
        if name == "size" then
            self.Frame:UpdateIconSize(false)
            self.Frame:UpdateTextWrap(true)
        elseif name == "labelShadowX" or name == "labelShadowY" then
            self.Frame:UpdateText(info[#info - 1], false)
        elseif name == "sortBy" then
            self.Frame:ChangeInstance()
        else
            self.Frame:UpdateText(info[#info - 1], false)
            self.Frame:UpdateTextWrap(true)
        end
    end
end

function MythicPlusUtility:GetValueTextAndIconColor(info)
    local t = self.db.profile.textAndIcon[info[#info - 1]][info[#info]]
    return t[1], t[2], t[3], t[4]
end

function MythicPlusUtility:SetValueTextAndIconColor(info, r, g, b, a)
    local name = info[#info]
    local db = self.db.profile.textAndIcon[info[#info - 1]]
    db[name] = {r, g, b, a}

    if self.Frame then self.Frame:UpdateText(info[#info - 1], false) end
end

function MythicPlusUtility:GetValueButtonCosmetic(info)
    return self.db.profile.buttonCosmetic[info[#info - 1]][info[#info]]
end

function MythicPlusUtility:SetValueButtonCosmetic(info, value)
    local name = info[#info]
    local db = self.db.profile.buttonCosmetic[info[#info - 1]]
    db[name] = value

    if self.Frame then
        if name == "enabled" then
            self.Frame:ChangeInstance()
        elseif name == "iconDesaturate" then
            self.Frame:updateButtonCosmeticIcon(info[#info - 1])
        end
    end
end

local function escape_pattern(text) return text:gsub("([^%w])", "%%%1") end

function MythicPlusUtility:SetValueButtonCosmeticLabel(info, value)
    local name = info[#info]
    local db = self.db.profile.buttonCosmetic[info[#info - 1]]
    db[name] = value

    if name == "labelType" then
        local label = ""
        db.isCustom = value == "custom"
        if value == "default" or value == "defaultText" then
            label = string.gsub(self.globals[info[#info - 1]].labelList[value], "\"", "")
        end
        db.label = label

    elseif name == "customLabelText" then
        local textureTable = {}
        local i = 0
        while true do
            local n, j = string.find(db[name], "%b{}", i + 1)
            if n == nil then break end
            local substring = string.sub(db[name], n, j)
            if string.find(substring, "{texture:.+") then
                textureTable[string.sub(substring, 10, #substring - 1)] = true
            end
            i = n
        end

        local atlasTable = {}
        i = 0
        while true do
            local n, j = string.find(db[name], "%b{}", i + 1)
            if n == nil then break end
            local substring = string.sub(db[name], n, j)
            if string.find(substring, "{atlas:.+") then
                atlasTable[string.sub(substring, 8, #substring - 1)] = true
            end
            i = n
        end

        db.customLabelTextFormatted = db[name]
        for textureID, _ in pairs(textureTable) do
            db.customLabelTextFormatted = string.gsub(db.customLabelTextFormatted,
                                                      "%{texture:" .. escape_pattern(textureID) .. "%}",
                                                      self:IconToChatIcon(textureID))
        end
        for atlasID, _ in pairs(atlasTable) do
            db.customLabelTextFormatted = string.gsub(db.customLabelTextFormatted,
                                                      "%{atlas:" .. escape_pattern(atlasID) .. "%}",
                                                      CreateAtlasMarkup(atlasID))
        end
    end

    if self.Frame then
        self.Frame:updateButtonCosmeticLabel(info[#info - 1])
        self.Frame:UpdateLeftLabelFrameWidth()
    end
end

function MythicPlusUtility:SetValueButtonCosmeticGlow(info, value)
    self.db.profile.buttonCosmetic[info[#info - 1]][info[#info]] = value
    if self.Frame then self.Frame:updateButtonCosmeticGlow(info[#info - 1]) end
end

function MythicPlusUtility:GetValueButtonCosmeticColor(info)
    local t = self.db.profile.buttonCosmetic[info[#info - 1]][info[#info]]
    return t[1], t[2], t[3], t[4]
end

function MythicPlusUtility:SetValueButtonCosmeticColor(info, r, g, b, a)
    local name = info[#info]
    local db = self.db.profile.buttonCosmetic[info[#info - 1]]
    db[name] = {r, g, b, a}

    if self.Frame then
        if name == "iconColor" then
            self.Frame:updateButtonCosmeticIcon(info[#info - 1])
        elseif name == "labelShadowColor" or name == "labelColor" then
            self.Frame:updateButtonCosmeticLabel(info[#info - 1])
        elseif name == "iconGlowColor" then
            self.Frame:updateButtonCosmeticGlow(info[#info - 1])
        elseif name == "hightlightColor" then
            self.TalentFrameHighlight:UpdateHighlight()
        end
    end
end

function MythicPlusUtility:ButtonCosmeticHide(info)
    local name = info[#info]
    local db = self.db.profile.buttonCosmetic[info[#info - 1]]
    local enabled = not db.enabled

    if name == "hightlightBreakLine" or name == "hightlightEnabled" or name == "glowBreakLine" or name == "iconGlow" then
        return enabled

    elseif name == "hightlightColor" then
        return enabled or not db.hightlightEnabled

    elseif name == "iconGlowColor" or name == "iconGlowType" then
        return enabled or not db.iconGlow

    elseif name == "labelFont" or name == "labelSize" or name == "labelColor" or name == "labelOutline" or name
      == "labelFontFlagsBreakLine" or name == "labelShadowX" or name == "labelShadowY" or name == "labelShadowColor"
      or name == "labelWidthType" then
        return enabled or db.labelType == "none"

    elseif name == 'labelWidth' or name == 'labelOverflow' then
        return enabled or db.labelType == "none" or db.labelWidthType ~= "fixed"

    elseif name == 'glowPixelN' or name == 'glowPixelFrequency' or name == 'glowPixelLength' or name == 'glowPixelTh'
      or name == 'glowPixelXOffset' or name == 'glowPixelYOffset' or name == 'glowPixelBorder' then
        return enabled or not db.iconGlow or db.iconGlowType ~= "pixel"

    elseif name == 'glowAutocastN' or name == 'glowAutocastFrequency' or name == 'glowAutocastScale' or name
      == 'glowAutocastXOffset' or name == 'glowAutocastYOffset' then
        return enabled or not db.iconGlow or db.iconGlowType ~= "autocast"

    elseif name == "customLabelBreakLine" or name == "customLabelText" then
        return enabled or not db.isCustom
    end

    return enabled
end
