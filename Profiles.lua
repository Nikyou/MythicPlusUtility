local L = LibStub("AceLocale-3.0"):GetLocale("MythicPlusUtility")
local AC = LibStub("AceConfig-3.0")
local ADBO = LibStub("AceDBOptions-3.0")
local LibDeflate = LibStub("LibDeflate")

local Profiles = {}
MythicPlusUtility.Profiles = Profiles

local exportString = ""
local messageText = ""

local function SafeMerge(target, source)

    for k, v in pairs(source) do
        if type(v) == "table" then
            if type(target[k]) ~= "table" then target[k] = {} end
            SafeMerge(target[k], v)
        else
            target[k] = v
        end
    end

end

function Profiles:GenerateExport()

    local exportData = {profile = MythicPlusUtility.db.profile, meta = {addon = "MythicPlusUtility", version = 1}}

    local serialized = MythicPlusUtility:Serialize(exportData)

    local compressed = LibDeflate:CompressDeflate(serialized, {level = 9})

    exportString = LibDeflate:EncodeForPrint(compressed)

end

function Profiles:PerformImport(importString)

    messageText = ""

    local decoded = LibDeflate:DecodeForPrint(importString)
    if not decoded then
        messageText = L["|cffff4040Invalid encoded string.|r"]
        return
    end

    local decompressed = LibDeflate:DecompressDeflate(decoded)
    if not decompressed then
        messageText = L["|cffff4040Decompression failed.|r"]
        return
    end

    local success, data = MythicPlusUtility:Deserialize(decompressed)
    if not success or type(data) ~= "table" then
        messageText = L["|cffff4040Invalid serialised data.|r"]
        return
    end

    if not data.profile then
        messageText = L["|cffff4040Missing profile data.|r"]
        return
    end

    if data.profile.AddonName ~= "MythicPlusUtility" then
        messageText = L["|cffff4040Profile belongs to another addon.|r"]
        return
    end

    SafeMerge(MythicPlusUtility.db.profile, data.profile)
    messageText = L["|cff40ff40Profile imported successfully.|r"]

end

function Profiles:CreateOptions()

    local profileOptions = ADBO:GetOptionsTable(MythicPlusUtility.db)

    local options = {
        type = "group",
        name = L["Profiles"],
        childGroups = "tab",
        args = {

            profiles = profileOptions,

            importExport = {
                type = "group",
                name = L["Import / Export"],
                order = -1,
                args = {

                    exportHeader = {type = "header", name = L["Export Profile"], order = 1},

                    exportButton = {
                        type = "execute",
                        name = L["Export"],
                        order = 2,
                        func = function() Profiles:GenerateExport() end,
                    },

                    exportBox = {
                        type = "input",
                        name = L["Export String (Ctrl+C to copy)"],
                        order = 3,
                        multiline = 8,
                        width = "full",
                        get = function() return exportString end,
                        set = function() end,
                    },

                    importHeader = {type = "header", name = L["Import Profile"], order = 10},

                    importBox = {
                        type = "input",
                        name = L["Paste Import String (replaces current profile)"],
                        order = 11,
                        multiline = 8,
                        width = "full",
                        get = function() return "" end,
                        set = function(info, value)
                            Profiles:PerformImport(value)
                            MythicPlusUtility:RefreshConfig()
                        end,
                    },

                    message = {type = "description", name = function() return messageText end, order = 13, width = "full"},

                },
            },
        },
    }

    AC:RegisterOptionsTable("MythicPlusUtility_Profiles", options)

    return options

end
