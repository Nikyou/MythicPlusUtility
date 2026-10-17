local L = LibStub("AceLocale-3.0"):GetLocale("MythicPlusUtility")
local AC = LibStub("AceConfig-3.0")
local ACD = LibStub("AceConfigDialog-3.0")
local ACR = LibStub("AceConfigRegistry-3.0")
local AceGUI = LibStub("AceGUI-3.0")
local Variables = MythicPlusUtility.Variables
local containers = Variables.spellContainers
local SpellSettings = MythicPlusUtility.SpellSettings

local QUESTION_MARK_ICON = "Interface\\Icons\\INV_Misc_QuestionMark"
local WARNING_ICON = "Interface\\DialogFrame\\UI-Dialog-Icon-AlertNew"
local HELP_ICON = "Interface\\common\\help-i"

SpellSettings.showCurrentClass = {classSpells = true, custom = true}
SpellSettings.selectedClass = {}
SpellSettings.pendingSpellIds = {}

local overrideColumns = {{L["Customise"], 0.5}, {L["Show"], 0.5}, {L["Ability"], 1.3}, {L["Custom Tags"], 0.6}, {"", 0.5}}
local customColumns = {{L["Show"], 0.5}, {L["Ability"], 1.3}, {"", 0.5}, {"", 0.5}}

local function GetContainerKey(key) return tonumber(key) or key end

local function GetRowSpell(info) return GetContainerKey(info[#info - 2]), tonumber(info[#info - 1]) end

local function ParseSpellId(value) return tonumber(string.match(value, "^%s*(%d+)%s*$")) end

local function ParseSpellList(value)
    local spellIds = {}
    for spellId in string.gmatch(value, "%d+") do table.insert(spellIds, tonumber(spellId)) end
    return #spellIds > 0 and spellIds or nil
end

-- Classes and Containers
function SpellSettings:GetClassNames()
    if self.classNames then return self.classNames, self.classOrder end

    local classNames, classOrder, plainNames = {}, {}, {}
    for classID = 1, GetNumClasses() do
        local classInfo = C_CreatureInfo.GetClassInfo(classID)
        if classInfo and MythicPlusUtility.classSpecialisations[classInfo.classFile] then
            local class = classInfo.classFile
            plainNames[class] = classInfo.className
            classNames[class] = C_ClassColor.GetClassColor(class):WrapTextInColorCode(classInfo.className)
            table.insert(classOrder, class)
        end
    end
    table.sort(classOrder, function(a, b) return plainNames[a] < plainNames[b] end)

    self.classNames = classNames
    self.classOrder = classOrder
    return classNames, classOrder
end

function SpellSettings:GetSelectedClass(tab)
    if self.showCurrentClass[tab] then return UnitClassBase("player") end
    return self.selectedClass[tab] or UnitClassBase("player")
end

function SpellSettings:GetClassContainers(class)
    if class == containers.allClasses then return {containers.allClasses} end

    local containerList = {class}
    local specIds = {}
    for specId, _ in pairs(MythicPlusUtility.classSpecialisations[class]) do table.insert(specIds, specId) end
    table.sort(specIds)
    for _, specId in ipairs(specIds) do table.insert(containerList, specId) end

    return containerList
end

function SpellSettings:GetContainerName(container)
    if container == containers.racial then return L["Racials"] end
    if container == containers.profession then return L["Professions"] end
    if container == containers.allClasses then return L["All classes"] end
    if type(container) == "number" then
        local _, name = GetSpecializationInfoByID(container)
        return name or tostring(container)
    end
    return self:GetClassNames()[container] or container
end

function SpellSettings:GetContainerTitle(container)
    local icon
    if type(container) == "number" then
        icon = MythicPlusUtility:IconToChatIcon(select(4, GetSpecializationInfoByID(container)))
    elseif Variables.classToIcon[container] then
        icon = CreateAtlasMarkup(Variables.classToIcon[container])
    end

    if icon then return format("%s %s", icon, self:GetContainerName(container)) end
    return self:GetContainerName(container)
end

function SpellSettings:GetSortedSpellIds(abilities)
    local spellIds = {}
    for spellId, _ in pairs(abilities or {}) do table.insert(spellIds, spellId) end
    table.sort(spellIds,
               function(a, b) return MythicPlusUtility:GetSpellNameById(a) < MythicPlusUtility:GetSpellNameById(b) end)
    return spellIds
end

-- Rows
local function CreateSpellLabel(spellId, order)
    return {
        type = "description",
        dialogControl = "InteractiveLabel",
        order = order,
        width = 1.3,
        fontSize = "medium",
        disabled = false,
        name = function() return MythicPlusUtility:GetSpellNameById(spellId) end,
        image = function()
            local icon = MythicPlusUtility:GetSpellIconById(spellId)
            return icon ~= "" and icon or QUESTION_MARK_ICON
        end,
        imageWidth = 20,
        imageHeight = 20,
        tooltipHyperlink = format("spell:%d", spellId),
    }
end

local function CreateHeaderRow(columns, order)
    local args = {}
    for i, column in ipairs(columns) do
        args["column" .. i] = {
            type = "description",
            order = i,
            width = column[2],
            fontSize = "medium",
            name = NORMAL_FONT_COLOR_CODE .. column[1] .. FONT_COLOR_CODE_CLOSE,
        }
    end
    return {type = "group", inline = true, order = order, name = "", args = args}
end

local function CreateOverrideRow(spellId, order)
    return {
        type = "group",
        inline = true,
        order = order,
        name = "",
        disabled = "IsSpellOverrideInactive",
        args = {
            active = {
                type = "toggle",
                order = 1,
                width = 0.5,
                name = "",
                descStyle = "inline",
                disabled = false,
                get = "GetValueSpellOverride",
                set = "SetValueSpellOverride",
            },
            enabled = {
                type = "toggle",
                order = 2,
                width = 0.5,
                name = "",
                descStyle = "inline",
                get = "GetValueSpellOverrideEnabled",
                set = "SetValueSpellOverrideEnabled",
            },
            name = CreateSpellLabel(spellId, 3),
            changeTags = {
                type = "toggle",
                order = 4,
                width = 0.6,
                name = "",
                descStyle = "inline",
                get = "GetValueSpellOverride",
                set = "SetValueSpellOverride",
            },
            edit = {type = "execute", order = 5, width = 0.5, name = L["Edit"], func = "OpenSpellOverrideEditor"},
        },
    }
end

local function CreateCustomRow(container, spellId, order)
    return {
        type = "group",
        inline = true,
        order = order,
        name = "",
        args = {
            enabled = {
                type = "toggle",
                order = 1,
                width = 0.5,
                name = "",
                descStyle = "inline",
                get = "GetValueCustomAbilityEnabled",
                set = "SetValueCustomAbilityEnabled",
            },
            name = CreateSpellLabel(spellId, 2),
            delete = {
                type = "execute",
                order = 3,
                width = 0.5,
                name = L["Delete"],
                confirm = true,
                confirmText = L["Delete this custom ability?"],
                func = "DeleteCustomAbilityRow",
            },
            edit = {type = "execute", order = 4, width = 0.5, name = L["Edit"], func = "OpenCustomAbilityEditor"},
            warning = {
                type = "description",
                dialogControl = "InteractiveLabel",
                order = 5,
                width = 0.6,
                fontSize = "medium",
                name = L["Default Used"],
                desc = L["This ability is already a default ability, so the default ability is used instead. Customise the default ability instead."],
                image = WARNING_ICON,
                imageWidth = 20,
                imageHeight = 20,
                hidden = function() return not MythicPlusUtility:IsDefaultSpell(container, spellId) end,
            },
        },
    }
end

-- Tabs
function SpellSettings:CreateClassSelectArgs()
    return {
        showCurrentClass = {
            type = "toggle",
            order = 1,
            width = 1.2,
            name = L["Current Class"],
            get = "GetValueSpellSettingsCurrentClass",
            set = "SetValueSpellSettingsCurrentClass",
        },
        selectedClass = {
            type = "select",
            order = 2,
            name = L["Class"],
            hidden = "GetValueSpellSettingsCurrentClass",
            get = "GetValueSpellSettingsClass",
            set = "SetValueSpellSettingsClass",
            values = "GetSpellSettingsClassValues",
            sorting = "GetSpellSettingsClassOrder",
        },
        reset = {
            type = "execute",
            order = 3,
            name = L["Reset"],
            desc = L["Resets the ability settings of the selected class."],
            confirm = true,
            confirmText = L["Reset the ability settings of the selected class?"],
            func = "ResetSpellSettingsTab",
        },
    }
end

function SpellSettings:CreateOverrideContainer(container, order, name)
    local spellIds = self:GetSortedSpellIds(MythicPlusUtility:GetDefaultAbilities(container))
    if #spellIds == 0 then return end

    local args = {header = CreateHeaderRow(overrideColumns, 1)}
    for i, spellId in ipairs(spellIds) do args[tostring(spellId)] = CreateOverrideRow(spellId, i + 1) end

    return {type = "group", inline = true, order = order, name = name, args = args}
end

function SpellSettings:CreateCustomContainer(container, order)
    local spellIds = self:GetSortedSpellIds(MythicPlusUtility.db.profile.spellSettings.custom[container])
    local args = {
        addSpellId = {
            type = "input",
            order = 1,
            width = 0.7,
            name = L["Spell ID"],
            get = "GetValueCustomPendingSpell",
            set = "SetValueCustomPendingSpell",
            validate = "ValidateCustomPendingSpell",
        },
        addPreview = {
            type = "description",
            dialogControl = "InteractiveLabel",
            order = 2,
            width = 1.3,
            fontSize = "medium",
            hidden = "IsCustomPendingEmpty",
            name = function()
                local spellId = SpellSettings.pendingSpellIds[container]
                return spellId and MythicPlusUtility:GetSpellNameById(spellId) or ""
            end,
            image = function() return MythicPlusUtility:GetSpellIconById(SpellSettings.pendingSpellIds[container]) end,
            imageWidth = 20,
            imageHeight = 20,
            tooltipHyperlink = function() return format("spell:%d", SpellSettings.pendingSpellIds[container]) end,
        },
        add = {
            type = "execute",
            order = 3,
            width = 0.5,
            name = L["Add"],
            disabled = "IsCustomPendingEmpty",
            func = "AddCustomPendingSpell",
        },
    }

    if #spellIds > 0 then args.header = CreateHeaderRow(customColumns, 4) end
    for i, spellId in ipairs(spellIds) do args[tostring(spellId)] = CreateCustomRow(container, spellId, i + 4) end

    return {type = "group", inline = true, order = order, name = self:GetContainerTitle(container), args = args}
end

function SpellSettings:CreateClassSpellsArgs()
    local args = self:CreateClassSelectArgs()
    for i, container in ipairs(self:GetClassContainers(self:GetSelectedClass("classSpells"))) do
        args[tostring(container)] = self:CreateOverrideContainer(container, 10 + i, self:GetContainerTitle(container))
    end
    return args
end

function SpellSettings:CreateSingleContainerArgs(container)
    return {
        reset = {
            type = "execute",
            order = 1,
            name = L["Reset"],
            desc = L["Resets the ability settings of this tab."],
            confirm = true,
            confirmText = L["Reset the ability settings of this tab?"],
            func = "ResetSpellSettingsTab",
        },
        [container] = self:CreateOverrideContainer(container, 2, ""),
    }
end

function SpellSettings:CreateCustomArgs()
    local args = self:CreateClassSelectArgs()
    args.reset.desc = L["Deletes the custom abilities of the selected class."]
    args.reset.confirmText = L["Delete the custom abilities of the selected class?"]

    for i, container in ipairs(self:GetClassContainers(self:GetSelectedClass("custom"))) do
        args[tostring(container)] = self:CreateCustomContainer(container, 10 + i)
    end
    return args
end

function SpellSettings:CreateImportExportArgs()
    return {
        exportHeader = {type = "header", order = 1, name = L["Export Ability Settings"]},
        exportButton = {type = "execute", order = 2, name = L["Export"], func = function() SpellSettings:GenerateExport() end},
        exportBox = {
            type = "input",
            order = 3,
            multiline = 8,
            width = "full",
            name = L["Export String (Ctrl+C to copy)"],
            get = function() return SpellSettings.exportString end,
            set = function() end,
        },
        importHeader = {type = "header", order = 10, name = L["Import Ability Settings"]},
        importBox = {
            type = "input",
            order = 11,
            multiline = 8,
            width = "full",
            name = L["Paste Import String"],
            get = function() return "" end,
            set = function(info, value) SpellSettings:ParseImport(value) end,
        },
        merge = {
            type = "execute",
            order = 12,
            name = L["Merge"],
            desc = L["Adds the imported settings. Settings of the same spells are replaced."],
            disabled = function() return not SpellSettings.pendingImport end,
            confirm = function()
                return SpellSettings:GetImportSummary(
                         L["Merge %d customised abilities and %d custom abilities into the current settings?"])
            end,
            func = function() SpellSettings:ApplyImport(false) end,
        },
        replace = {
            type = "execute",
            order = 13,
            name = L["Replace"],
            desc = L["Replaces all current ability settings with the imported settings."],
            disabled = function() return not SpellSettings.pendingImport end,
            confirm = function()
                return SpellSettings:GetImportSummary(
                         L["Replace the current ability settings with %d customised abilities and %d custom abilities?"])
            end,
            func = function() SpellSettings:ApplyImport(true) end,
        },
        message = {
            type = "description",
            order = 14,
            width = "full",
            fontSize = "medium",
            name = function() return SpellSettings.messageText end,
        },
    }
end

function SpellSettings:BuildOptions()
    local args = self.options.args
    args.classSpells.args = self:CreateClassSpellsArgs()
    args.racials.args = self:CreateSingleContainerArgs(containers.racial)
    args.professions.args = self:CreateSingleContainerArgs(containers.profession)
    args.custom.args = self:CreateCustomArgs()
end

function SpellSettings:RefreshOptions()
    if self.editorFrame then self.editorFrame:Hide() end
    self:BuildOptions()
    ACR:NotifyChange("MythicPlusUtility_SpellSettings")
end

function SpellSettings:CreateOptions()
    self.options = {
        type = "group",
        name = L["Ability Settings"],
        handler = MythicPlusUtility,
        childGroups = "tab",
        args = {
            classSpells = {type = "group", order = 1, name = L["Class Abilities"], args = {}},
            racials = {type = "group", order = 2, name = L["Racials"], args = {}},
            professions = {type = "group", order = 3, name = L["Professions"], args = {}},
            custom = {type = "group", order = 4, name = L["Custom Abilities"], args = {}},
            importExport = {type = "group", order = 5, name = L["Import / Export"], args = self:CreateImportExportArgs()},
        },
    }
    self.editorOptions = {type = "group", name = "", handler = MythicPlusUtility, childGroups = "tab", args = {}}

    AC:RegisterOptionsTable("MythicPlusUtility_SpellSettings", self.options)
    AC:RegisterOptionsTable("MythicPlusUtility_SpellEditor", self.editorOptions)
end

-- Editor
function SpellSettings:GetTagsHelp(category)
    local lines = {}
    for _, group in ipairs(category.groups) do
        table.insert(lines, NORMAL_FONT_COLOR_CODE .. group.name .. FONT_COLOR_CODE_CLOSE)
        for _, tag in ipairs(group.tags) do table.insert(lines, format("%s - %s", tag, Variables.tagDescriptions[tag])) end
    end
    return table.concat(lines, "\n")
end

function SpellSettings:CreateTagArgs(category, isCustom, defaultTags)
    local args = {
        help = {
            type = "description",
            dialogControl = "InteractiveLabel",
            order = 0,
            fontSize = "medium",
            width = 3.4,
            name = format(L["%s tags"], category.name),
            desc = self:GetTagsHelp(category),
            image = HELP_ICON,
            imageWidth = 20,
            imageHeight = 20,
        },
    }

    local order = 1
    for i, group in ipairs(category.groups) do
        args["header" .. i] = {type = "header", order = order, name = group.name}
        order = order + 1

        for _, tag in ipairs(group.tags) do
            args[tag] = {
                type = "toggle",
                order = order,
                width = 1.1,
                tristate = not isCustom,
                name = defaultTags[tag] and GREEN_FONT_COLOR:WrapTextInColorCode(tag) or tag,
                desc = Variables.tagDescriptions[tag],
                get = "GetValueSpellEditorTag",
                set = "SetValueSpellEditorTag",
            }
            order = order + 1
        end
    end

    return args
end

function SpellSettings:GetDefaultValueText(label, value)
    return format("%s%s:%s %s", NORMAL_FONT_COLOR_CODE, label, FONT_COLOR_CODE_CLOSE, value)
end

function SpellSettings:GetSpellListText(spellIds)
    local names = {}
    for _, spellId in ipairs(spellIds) do
        table.insert(names, format("%s (%d)", MythicPlusUtility:GetSpellNameById(spellId), spellId))
    end
    return table.concat(names, ", ")
end

function SpellSettings:CreateDefaultArgs(data)
    local args = {
        info = {
            type = "description",
            order = 1,
            width = 3.6,
            fontSize = "medium",
            name = L["Built-in values of this ability. Custom values below are used instead where they are set."],
        },
        tags = {
            type = "description",
            order = 2,
            width = 3.6,
            fontSize = "medium",
            name = self:GetDefaultValueText(L["Tags"], data.tags),
        },
        baseline = {
            type = "description",
            order = 5,
            width = 3.6,
            fontSize = "medium",
            name = self:GetDefaultValueText(L["Baseline"], data.baseline and L["Yes"] or L["No"]),
        },
    }

    if data.override then
        args.override = {
            type = "description",
            order = 3,
            width = 3.6,
            fontSize = "medium",
            name = self:GetDefaultValueText(L["Replaces Spell ID"], self:GetSpellListText({data.override})),
        }
    end
    if data.alternatives then
        args.alternatives = {
            type = "description",
            order = 4,
            width = 3.6,
            fontSize = "medium",
            name = self:GetDefaultValueText(L["Alternative Spell IDs"], self:GetSpellListText(data.alternatives)),
        }
    end

    return args
end

function SpellSettings:GetTagsHelpText()
    if self.editing.isCustom then return L["Checked tags are used for this ability."] end

    local text = L["Checked - tag is added, grey - default, empty - tag is removed. Green tags are default tags."]
    local record = MythicPlusUtility:GetSpellEditorRecord()
    if not (record and record.changeTags) then
        text = text .. "\n" .. ORANGE_FONT_COLOR:WrapTextInColorCode(
                 L["Custom tags are not used while \"Custom Tags\" is off in Ability Settings."])
    end
    return text
end

function SpellSettings:CreateEditorArgs()
    local editing = self.editing
    local isCustom = editing.isCustom
    local defaultTags = {}
    local args = {}

    if not isCustom then
        local data = MythicPlusUtility:GetDefaultAbilities(editing.container)[editing.spellId]
        defaultTags = MythicPlusUtility:ParseTags(data.tags)
        args.default = {
            type = "group",
            inline = true,
            order = 1,
            name = L["Default Values (read-only)"],
            args = self:CreateDefaultArgs(data),
        }
    end

    args.settings = {
        type = "group",
        inline = true,
        order = 2,
        name = isCustom and L["Ability Values"] or L["Custom Values"],
        get = "GetValueSpellEditor",
        set = "SetValueSpellEditor",
        args = {
            override = {
                type = "input",
                order = 1,
                width = 1,
                name = L["Replaces Spell ID"],
                desc = L["When this ability is known, the ability with this spell ID is not shown. Leave empty to use the default value."],
                validate = "ValidateSpellEditorSpellId",
            },
            alternatives = {
                type = "input",
                order = 2,
                width = 1.5,
                name = L["Alternative Spell IDs"],
                desc = L["Spell IDs separated by commas. When one of them is known, it is shown instead of this ability. Leave empty to use the default value."],
                validate = "ValidateSpellEditorSpellList",
            },
            baseline = {
                type = "toggle",
                order = 3,
                width = 0.8,
                tristate = not isCustom,
                name = L["Baseline"],
                desc = L["Baseline abilities are not talents, so they are never suggested for removal."],
            },
            pet = {
                type = "toggle",
                order = 4,
                width = 0.8,
                hidden = not isCustom,
                name = L["Pet ability"],
                desc = L["Checks the pet spellbook for this ability."],
            },
            reset = {
                type = "execute",
                order = 5,
                hidden = isCustom,
                name = L["Reset to Default"],
                desc = L["Clears all custom values of this ability."],
                confirm = true,
                confirmText = L["Clear all custom values of this ability?"],
                func = "ResetSpellEditor",
            },
        },
    }

    args.tagsHeader = {type = "header", order = 3, name = L["Tags"]}
    args.tagsHelp = {
        type = "description",
        order = 4,
        width = 3.6,
        fontSize = "medium",
        name = function() return SpellSettings:GetTagsHelpText() end,
    }

    for i, category in ipairs(Variables.tagCategoriesOrder) do
        local categoryData = Variables.tagCategories[category]
        args[category] = {
            type = "group",
            order = 10 + i,
            name = categoryData.name,
            args = self:CreateTagArgs(categoryData, isCustom, defaultTags),
        }
    end

    return args
end

function SpellSettings:CreateEditorFrame()
    local frame = CreateFrame("Frame", "MythicPlusUtility_SpellEditor", UIParent, "PortraitFrameTemplate")
    frame:SetSize(700, 720)
    frame:SetPoint("CENTER")
    frame:SetFrameStrata("DIALOG")
    frame:SetToplevel(true)
    frame:EnableMouse(true)
    frame:SetMovable(true)
    frame:SetClampedToScreen(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", frame.StartMoving)
    frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
    self:SetPortraitLogo(frame)
    frame.onCloseCallback = function()
        frame:Hide()
        return false
    end

    local group = AceGUI:Create("SimpleGroup")
    group:SetAutoAdjustHeight(false)
    group:SetWidth(frame:GetWidth() - 28)
    group:SetHeight(frame:GetHeight() - 76)
    group.frame:SetParent(frame)
    group.frame:ClearAllPoints()
    group.frame:SetPoint("TOPLEFT", 16, -64)
    group.frame:Show()

    frame:SetScript("OnHide", function()
        SpellSettings.editing = nil
        SpellSettings.editorOptions.args = {}
        group:ReleaseChildren()
    end)
    if SettingsPanel then SettingsPanel:HookScript("OnHide", function() frame:Hide() end) end

    self.editorFrame = frame
    self.editorGroup = group
    return frame
end

function SpellSettings:RefreshEditor()
    if self.editorFrame and self.editorFrame:IsShown() then ACD:Open("MythicPlusUtility_SpellEditor", self.editorGroup) end
end

function SpellSettings:OpenEditor(isCustom, container, spellId)
    if InCombatLockdown() then return end

    local frame = self.editorFrame or self:CreateEditorFrame()
    self.editing = {isCustom = isCustom, container = container, spellId = spellId}
    self.editorOptions.args = self:CreateEditorArgs()

    frame:SetTitle(format("Mythic Plus Utility - %s", MythicPlusUtility:GetSpellNameById(spellId)))
    frame:Show()
    ACD:Open("MythicPlusUtility_SpellEditor", self.editorGroup)
end

-- Spell Settings Handlers
function MythicPlusUtility:GetValueSpellSettingsCurrentClass(info) return SpellSettings.showCurrentClass[info[#info - 1]] end

function MythicPlusUtility:SetValueSpellSettingsCurrentClass(info, value)
    SpellSettings.showCurrentClass[info[#info - 1]] = value
    SpellSettings:BuildOptions()
end

function MythicPlusUtility:GetValueSpellSettingsClass(info) return SpellSettings:GetSelectedClass(info[#info - 1]) end

function MythicPlusUtility:SetValueSpellSettingsClass(info, value)
    SpellSettings.selectedClass[info[#info - 1]] = value
    SpellSettings:BuildOptions()
end

function MythicPlusUtility:GetSpellSettingsClassValues(info)
    local classNames = SpellSettings:GetClassNames()
    if info[#info - 1] ~= "custom" then return classNames end

    local values = {[containers.allClasses] = L["All classes"]}
    for class, name in pairs(classNames) do values[class] = name end
    return values
end

function MythicPlusUtility:GetSpellSettingsClassOrder(info)
    local _, classOrder = SpellSettings:GetClassNames()
    if info[#info - 1] ~= "custom" then return classOrder end

    local order = {containers.allClasses}
    for _, class in ipairs(classOrder) do table.insert(order, class) end
    return order
end

function MythicPlusUtility:ResetSpellSettingsTab(info)
    local tab = info[#info - 1]

    if tab == "classSpells" then
        self:ResetSpellOverrides(SpellSettings:GetClassContainers(SpellSettings:GetSelectedClass(tab)))
    elseif tab == "racials" then
        self:ResetSpellOverrides({containers.racial})
    elseif tab == "professions" then
        self:ResetSpellOverrides({containers.profession})
    elseif tab == "custom" then
        self:ResetCustomAbilities(SpellSettings:GetClassContainers(SpellSettings:GetSelectedClass(tab)))
        SpellSettings:BuildOptions()
    end
    if SpellSettings.editorFrame then SpellSettings.editorFrame:Hide() end
end

function MythicPlusUtility:IsSpellOverrideInactive(info)
    local record = self:GetSpellOverride(GetRowSpell(info))
    return not (record and record.active)
end

function MythicPlusUtility:GetValueSpellOverride(info)
    local record = self:GetSpellOverride(GetRowSpell(info))
    return record and record[info[#info]] or false
end

function MythicPlusUtility:SetValueSpellOverride(info, value)
    local container, spellId = GetRowSpell(info)
    self:SetSpellOverrideValue(container, spellId, info[#info], value or nil)
    SpellSettings:RefreshEditor()
end

function MythicPlusUtility:GetValueSpellOverrideEnabled(info)
    local record = self:GetSpellOverride(GetRowSpell(info))
    return not (record and record.enabled == false)
end

function MythicPlusUtility:SetValueSpellOverrideEnabled(info, value)
    local container, spellId = GetRowSpell(info)
    if value then value = nil end
    self:SetSpellOverrideValue(container, spellId, "enabled", value)
    SpellSettings:RefreshEditor()
end

function MythicPlusUtility:OpenSpellOverrideEditor(info) SpellSettings:OpenEditor(false, GetRowSpell(info)) end

function MythicPlusUtility:GetValueCustomAbilityEnabled(info)
    local record = self:GetCustomAbility(GetRowSpell(info))
    return not (record and record.enabled == false)
end

function MythicPlusUtility:SetValueCustomAbilityEnabled(info, value)
    local container, spellId = GetRowSpell(info)
    if value then value = nil end
    self:SetCustomAbilityValue(container, spellId, "enabled", value)
end

function MythicPlusUtility:DeleteCustomAbilityRow(info)
    local container, spellId = GetRowSpell(info)
    local editing = SpellSettings.editing

    if editing and editing.isCustom and editing.container == container and editing.spellId == spellId then
        SpellSettings.editorFrame:Hide()
    end
    self:DeleteCustomAbility(container, spellId)
    SpellSettings:BuildOptions()
end

function MythicPlusUtility:OpenCustomAbilityEditor(info) SpellSettings:OpenEditor(true, GetRowSpell(info)) end

function MythicPlusUtility:GetValueCustomPendingSpell(info)
    local spellId = SpellSettings.pendingSpellIds[GetContainerKey(info[#info - 1])]
    return spellId and tostring(spellId) or ""
end

function MythicPlusUtility:SetValueCustomPendingSpell(info, value)
    SpellSettings.pendingSpellIds[GetContainerKey(info[#info - 1])] = ParseSpellId(value)
end

function MythicPlusUtility:ValidateCustomPendingSpell(info, value)
    if value == "" then return true end

    local spellId = ParseSpellId(value)
    if not (spellId and C_Spell.DoesSpellExist(spellId)) then return L["Enter a valid spell ID."] end
    if self:GetCustomAbility(GetContainerKey(info[#info - 1]), spellId) then return L["This ability is already added."] end
    return true
end

function MythicPlusUtility:IsCustomPendingEmpty(info)
    return not SpellSettings.pendingSpellIds[GetContainerKey(info[#info - 1])]
end

function MythicPlusUtility:AddCustomPendingSpell(info)
    local container = GetContainerKey(info[#info - 1])
    local spellId = SpellSettings.pendingSpellIds[container]

    SpellSettings.pendingSpellIds[container] = nil
    self:AddCustomAbility(container, spellId)
    SpellSettings:BuildOptions()
end

-- Editor Handlers
function MythicPlusUtility:GetSpellEditorRecord(create)
    local editing = SpellSettings.editing
    if editing.isCustom then return self:GetCustomAbility(editing.container, editing.spellId) end
    return self:GetSpellOverride(editing.container, editing.spellId, create)
end

function MythicPlusUtility:ResetSpellEditor()
    local editing = SpellSettings.editing
    if not editing then return end

    self:ResetSpellOverride(editing.container, editing.spellId)
    ACR:NotifyChange("MythicPlusUtility_SpellSettings")
end

function MythicPlusUtility:GetValueSpellEditor(info)
    local record = self:GetSpellEditorRecord()
    local name = info[#info]
    local value = record and record[name]

    if name == "override" then return value and tostring(value) or "" end
    if name == "alternatives" then return value and table.concat(value, ", ") or "" end
    if SpellSettings.editing.isCustom then return value or false end
    return value
end

function MythicPlusUtility:SetValueSpellEditor(info, value)
    local editing = SpellSettings.editing
    local name = info[#info]

    if name == "override" then
        value = ParseSpellId(value)
    elseif name == "alternatives" then
        value = ParseSpellList(value)
    elseif editing.isCustom then
        value = value or nil
    end

    if editing.isCustom then
        self:SetCustomAbilityValue(editing.container, editing.spellId, name, value)
    else
        self:SetSpellOverrideValue(editing.container, editing.spellId, name, value)
    end
end

function MythicPlusUtility:ValidateSpellEditorSpellId(info, value)
    if string.match(value, "^%s*$") then return true end

    local spellId = ParseSpellId(value)
    if not (spellId and C_Spell.DoesSpellExist(spellId)) then return L["Enter a valid spell ID."] end
    return true
end

function MythicPlusUtility:ValidateSpellEditorSpellList(info, value)
    if string.find(value, "[^%d%s,]") then return L["Enter spell IDs separated by commas."] end

    for spellId in string.gmatch(value, "%d+") do
        if not C_Spell.DoesSpellExist(tonumber(spellId)) then return format(L["Spell ID %s does not exist."], spellId) end
    end
    return true
end

function MythicPlusUtility:GetValueSpellEditorTag(info)
    local record = self:GetSpellEditorRecord()
    local value = record and record.tags and record.tags[info[#info]]

    if SpellSettings.editing.isCustom then return value or false end
    return value
end

function MythicPlusUtility:SetValueSpellEditorTag(info, value)
    local editing = SpellSettings.editing

    if editing.isCustom then
        self:SetCustomAbilityTag(editing.container, editing.spellId, info[#info], value or nil)
    else
        self:SetSpellOverrideTag(editing.container, editing.spellId, info[#info], value)
    end
end
