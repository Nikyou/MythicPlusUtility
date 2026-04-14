local L = LibStub("AceLocale-3.0"):GetLocale("MythicPlusUtility")
local ACR = LibStub("AceConfigRegistry-3.0")
local LCG = LibStub("LibCustomGlow-1.0")
local LSM = LibStub("LibSharedMedia-3.0", true)

local function AddLinkTooltip(widget, link)
    if not link then return end

    widget:EnableMouse(true)

    widget:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetHyperlink(link)
        GameTooltip:Show()
    end)

    widget:SetScript("OnLeave", function() GameTooltip:Hide() end)
end

local function CalculateCoords(frame, framePoint)
    local left = frame:GetLeft()
    local top = frame:GetTop()
    local screenWidth = GetScreenWidth()
    local screenHeight = GetScreenHeight()
    local x = 0
    local y = 0

    if framePoint == "TOPLEFT" then
        x = Round(left)
        y = Round(top - screenHeight)
    elseif framePoint == "TOP" then
        x = Round(left - (screenWidth / 2))
        y = Round(top - screenHeight)
    elseif framePoint == "TOPRIGHT" then
        x = Round(left - screenWidth)
        y = Round(top - screenHeight)
    elseif framePoint == "LEFT" then
        x = Round(left)
        y = Round(top - (screenHeight / 2))
    elseif framePoint == "CENTER" then
        x = Round(left - (screenWidth / 2))
        y = Round(top - (screenHeight / 2))
    elseif framePoint == "RIGHT" then
        x = Round(left - screenWidth)
        y = Round(top - (screenHeight / 2))
    elseif framePoint == "BOTTOMLEFT" then
        x = Round(left)
        y = Round(top)
    elseif framePoint == "BOTTOM" then
        x = Round(left - (screenWidth / 2))
        y = Round(top)
    elseif framePoint == "BOTTOMRIGHT" then
        x = Round(left - screenWidth)
        y = Round(top)
    end

    return x, y
end

local function ApplyGlowToFrame(frame, db, type)
    if type == "pixel" then
        LCG.PixelGlow_Start(frame, db.iconGlowColor, db.glowPixelN, db.glowPixelFrequency, db.glowPixelLength,
                            db.glowPixelTh, db.glowPixelXOffset, db.glowPixelYOffset, db.glowPixelBorder)
        frame.Glow_Stop = LCG.PixelGlow_Stop
    elseif type == "autocast" then
        LCG.AutoCastGlow_Start(frame, db.iconGlowColor, db.glowAutocastN, db.glowAutocastFrequency,
                               db.glowAutocastScale, db.glowAutocastXOffset, db.glowAutocastYOffset)
        frame.Glow_Stop = LCG.AutoCastGlow_Stop
    elseif type == "action" then
        LCG.ButtonGlow_Start(frame, db.iconGlowColor)
        frame.Glow_Stop = LCG.ButtonGlow_Stop
    end
end

function MythicPlusUtility:UtilityAbilitiesFrame()
    local BUTTON_SPACING = 8
    local LEFT_PADDING = 5
    local RIGHT_PADDING = 5
    local TOP_PADDING = 5
    local TEXT_WRAP_PADDING = 7
    local CLOSE_BUTTON_SIZE = 15
    local buttonsIndices

    local db = self.db
    local profile = self.db.profile
    local buttonCosmetic = self.db.profile.buttonCosmetic
    local windowSettings = self.db.profile.windowSettings
    local textAndIcon = self.db.profile.textAndIcon

    self:PopulateCurrentAbilitiesListWithInstanceData(profile.instanceID)

    local frame = CreateFrame("Frame", "MythicPlusUtility_UtilityAbilitiesFrame", UIParent, "BackdropTemplate")

    frame:SetPoint("TOPLEFT", UIParent, windowSettings.framePoint, windowSettings.xOffset, windowSettings.yOffset)
    frame:SetWidth(windowSettings.width)

    frame:SetHyperlinksEnabled(true)

    if windowSettings.autoExpand then
        frame:SetHeight(1)
    else
        frame:SetHeight(windowSettings.height)
    end
    frame:SetClipsChildren(true)

    local leftLabelFrame = CreateFrame("Frame", nil, UIParent)
    leftLabelFrame:SetPoint("TOPRIGHT", frame, "TOPLEFT", LEFT_PADDING - 1, 0)
    leftLabelFrame:SetHeight(frame:GetHeight())
    leftLabelFrame:SetClipsChildren(true)
    leftLabelFrame:SetFrameLevel(frame:GetFrameLevel() + 1)
    frame.leftLabelFrame = leftLabelFrame

    function frame:FrameLockUpdate() self:EnableMouse(not profile.toggleFrameLock) end

    frame:SetMovable(true)
    frame:FrameLockUpdate()
    frame:RegisterForDrag("LeftButton")

    frame:SetScript("OnDragStart", function(self) if not profile.toggleFrameLock then self:StartMoving() end end)

    frame:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        local framePoint = windowSettings.framePoint
        local x, y = CalculateCoords(self, framePoint)
        self:ClearAllPoints()

        windowSettings.xOffset = x
        windowSettings.yOffset = y
        self:SetPoint("TOPLEFT", UIParent, framePoint, x, y)

        ACR:NotifyChange("MythicPlusUtility_Options")
    end)

    function frame:ProfileChange()
        db = MythicPlusUtility.db
        profile = MythicPlusUtility.db.profile
        buttonCosmetic = MythicPlusUtility.db.profile.buttonCosmetic
        windowSettings = MythicPlusUtility.db.profile.windowSettings
        textAndIcon = MythicPlusUtility.db.profile.textAndIcon

        self:FrameLockUpdate()
        self:UpdatePosition()
        MythicPlusUtility:PopulateCurrentAbilitiesListWithInstanceData(profile.instanceID)
        self:UpdateButtons()
        self:UpdateIconSize(false)
        self:UpdateText(false, false)
        self:UpdateTextWrap(false)
        self:UpdateLayout()
    end

    function frame:ChangeInstance()
        MythicPlusUtility:PopulateCurrentAbilitiesListWithInstanceData(profile.instanceID)
        self.dungeonNameText:SetText(MythicPlusUtility.dungeonIdToName[profile.instanceID] or "")
        self:UpdateButtons()
        self:UpdateLayout()

        MythicPlusUtility.TalentFrameHighlight:UpdateHighlight()
        MythicPlusUtility.TalentFrameHighlight:UpdateAnchers()
        if self:IsVisible() then
            MythicPlusUtility.TalentFrameHighlight:HideAll()
            MythicPlusUtility.TalentFrameHighlight:ShowRelevant()
        end
    end

    function frame:SetShownHandler(show)
        if show then
            if db.char.changedSpec or db.char.changedTalents then
                if db.char.changedSpec then
                    db.char.changedSpec = false
                    db.char.changedTalents = false
                    MythicPlusUtility:CreateCurrentAbilitiesList()
                elseif db.char.changedTalents then
                    db.char.changedTalents = false
                    MythicPlusUtility:UpdateCurrentAbilitiesList()
                end

                self:ChangeInstance()
            end
            MythicPlusUtility.TalentFrameHighlight:ShowRelevant()
        else
            MythicPlusUtility.TalentFrameHighlight:HideAll()
        end

        self:SetShown(show)
        self.leftLabelFrame:SetShown(show)
    end

    function frame:UpdatePosition()
        self:SetPoint("TOPLEFT", UIParent, windowSettings.framePoint, windowSettings.xOffset, windowSettings.yOffset)
    end

    local background = frame:CreateTexture(nil, "ARTWORK")
    background:SetAllPoints()

    local c = profile.frameBackground
    background:SetColorTexture(c[1], c[2], c[3], c[4])
    frame.background = background
    frame.buttons = {}

    function frame:UpdateLeftLabelFrameWidth()
        buttonsIndices = MythicPlusUtility:GetbuttonsIndices()
        local width = 0
        for id, _ in ipairs(buttonsIndices) do
            if self.buttons[id].labelLeft:IsShown() and self.buttons[id].labelLeft:GetWrappedWidth() > width then
                width = self.buttons[id].labelLeft:GetWrappedWidth()
            end
        end
        width = width + 10
        leftLabelFrame:SetWidth(width)
    end

    function frame:UpdateLayout()
        local currentY = -TOP_PADDING - self:GetTop() + self.dungeonNameText:GetBottom()
        self.listEmptyText:SetPoint("TOPLEFT", LEFT_PADDING + RIGHT_PADDING, currentY)
        buttonsIndices = MythicPlusUtility:GetbuttonsIndices()

        self:UpdateLeftLabelFrameWidth()

        for id, _ in ipairs(buttonsIndices) do
            local button = self.buttons[id]
            button:ClearAllPoints()
            button:SetPoint("TOPLEFT", LEFT_PADDING, currentY)

            currentY = currentY - textAndIcon.icon.size - BUTTON_SPACING

            if button.listFrame:IsShown() then
                button.listFrame:ClearAllPoints()
                button.listFrame:SetPoint("TOPLEFT", LEFT_PADDING + 10, currentY + BUTTON_SPACING - 5)
                button.listFrame:SetHeight(1)

                local listHeight = 0
                if #button.list > 0 then
                    local first = button.listFrame.lines[1]
                    local last = button.listFrame.lines[#button.list]
                    listHeight = first:GetTop() - last:GetBottom()
                end
                button.listFrame:SetHeight(listHeight)

                currentY = currentY - listHeight - BUTTON_SPACING
            end
        end

        if windowSettings.autoExpand then
            local bottom
            local height = 0
            if #buttonsIndices > 0 then
                if self.buttons[#buttonsIndices].listFrame:IsShown() then
                    bottom = self.buttons[#buttonsIndices].listFrame:GetBottom()
                else
                    bottom = self.buttons[#buttonsIndices]:GetBottom()
                end
                height = TOP_PADDING + self:GetTop() - bottom
            end

            if height < 150 then height = 150 end
            if windowSettings.maxHeightEnable and height > windowSettings.maxHeight then
                height = windowSettings.maxHeight
            end
            self:SetHeight(height)
            self.leftLabelFrame:SetHeight(height)
        end

    end

    function frame:UpdateButtons()

        buttonsIndices = MythicPlusUtility:GetbuttonsIndices()

        if #buttonsIndices == 0 then
            self.listEmptyText:Show()
        else
            self.listEmptyText:Hide()
        end
        if #self.buttons > #buttonsIndices then
            for i = #buttonsIndices + 1, #self.buttons do
                self.buttons[i].labelLeft:Hide()
                self.buttons[i].listFrame:Hide()
                self.buttons[i]:Hide()
            end
        end

        for id, abilityId in ipairs(buttonsIndices) do
            local currentAbility = MythicPlusUtility.currentAbilitiesList[abilityId]
            local spellId = currentAbility.spellId
            if currentAbility.altSpellId then spellId = currentAbility.altSpellId end
            local enabled = buttonCosmetic[currentAbility.buttonType].enabled
            local cosmeticDB = buttonCosmetic[currentAbility.buttonType]

            if self.buttons[id] then
                local button = self.buttons[id]
                button:Show()

                button.list = MythicPlusUtility:tablecopy(currentAbility.list)
                button.hasImportant = currentAbility.hasImportant
                button.buttonType = currentAbility.buttonType

                button.texture:SetTexture(MythicPlusUtility:GetSpellIconById(spellId))

                if button.Glow_Stop then
                    button.Glow_Stop(button)
                    button.Glow_Stop = false
                end
                if enabled and cosmeticDB.iconGlow then
                    ApplyGlowToFrame(button, cosmeticDB, cosmeticDB.iconGlowType)
                end

                if enabled and cosmeticDB.iconDesaturate then
                    button.texture:SetDesaturated(true)
                else
                    button.texture:SetDesaturated(false)
                end
                if enabled and cosmeticDB.iconColor then
                    c = cosmeticDB.iconColor
                    button.texture:SetVertexColor(c[1], c[2], c[3], c[4])
                else
                    button.texture:SetVertexColor(1, 1, 1, 1)
                end

                local name = currentAbility.spellName
                if currentAbility.tagsTable.self_only then
                    name = CreateAtlasMarkup("friendslist-recentallies-yellow") .. name
                end
                button.label:SetText(name)

                AddLinkTooltip(button, MythicPlusUtility:GetSpellHyperlinkById(spellId))

                local flags = ""
                if cosmeticDB.labelOutline ~= "NONE" then flags = cosmeticDB.labelOutline end
                button.labelLeft:SetFont(LSM:Fetch("font", cosmeticDB.labelFont), cosmeticDB.labelSize, flags)
                button.labelLeft:SetShown(enabled)

                if cosmeticDB.labelWidthType == "automatic" then
                    button.labelLeft:SetWidth(0)
                else
                    button.labelLeft:SetWidth(cosmeticDB.labelWidth)
                    button.labelLeft:SetWordWrap(cosmeticDB.labelOverflow == "wrap")
                end
                if cosmeticDB.labelType == "custom" then
                    button.labelLeft:SetText(cosmeticDB.customLabelTextFormatted)
                else
                    button.labelLeft:SetText(cosmeticDB.label)
                end

                c = cosmeticDB.labelColor
                button.labelLeft:SetTextColor(c[1], c[2], c[3], c[4])
                c = cosmeticDB.labelShadowColor
                button.labelLeft:SetShadowColor(c[1], c[2], c[3], c[4])
                button.labelLeft:SetShadowOffset(cosmeticDB.labelShadowX, cosmeticDB.labelShadowY)

                if #button.listFrame.lines > #button.list then
                    for i = #button.list + 1, #button.listFrame.lines do
                        button.listFrame.lines[i]:Hide()
                    end
                end

                for listId, text in ipairs(button.list) do
                    if button.listFrame.lines[listId] then
                        button.listFrame.lines[listId]:Show()
                        button.listFrame.lines[listId]:SetText(text)
                    else
                        local line = button.listFrame:CreateFontString(nil, "OVERLAY", "ChatFontNormal")
                        line:SetJustifyH("LEFT")
                        line:SetWordWrap(true)
                        line:SetWidth(windowSettings.width - LEFT_PADDING - RIGHT_PADDING - TEXT_WRAP_PADDING)
                        line:SetFont(LSM:Fetch("font", textAndIcon.bodyText.labelFont), textAndIcon.bodyText.labelSize,
                                     nil)
                        line:SetText(text)

                        if listId == 1 then
                            line:SetPoint("TOPLEFT", 0, 0)
                        else
                            line:SetPoint("TOPLEFT", button.listFrame.lines[listId - 1], "BOTTOMLEFT", 0, -4)
                        end
                        table.insert(button.listFrame.lines, line)
                    end
                end

                if (not (#button.list > 0)) and button.listFrame:IsShown() then button.listFrame:Hide() end

            else
                local button = CreateFrame("Button", nil, self)
                button:SetSize(textAndIcon.icon.size, textAndIcon.icon.size)

                button.list = MythicPlusUtility:tablecopy(currentAbility.list)
                button.hasImportant = currentAbility.hasImportant
                button.buttonType = currentAbility.buttonType

                local texture = button:CreateTexture(nil, "ARTWORK")
                texture:SetAllPoints()
                texture:SetTexture(MythicPlusUtility:GetSpellIconById(spellId))

                if enabled and cosmeticDB.iconDesaturate then
                    texture:SetDesaturated(true)
                else
                    texture:SetDesaturated(false)
                end
                if enabled and cosmeticDB.iconColor then
                    c = cosmeticDB.iconColor
                    texture:SetVertexColor(c[1], c[2], c[3], c[4])
                end

                if enabled and cosmeticDB.iconGlow then
                    ApplyGlowToFrame(button, cosmeticDB, cosmeticDB.iconGlowType)
                end

                button.texture = texture

                local label = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
                label:SetPoint("LEFT", button, "RIGHT", 10, 0)
                label:SetJustifyH("LEFT")
                label:SetWordWrap(true)
                label:SetWidth(windowSettings.width - LEFT_PADDING - textAndIcon.icon.size - RIGHT_PADDING - 5)
                label:SetFont(LSM:Fetch("font", textAndIcon.icon.labelFont), textAndIcon.icon.labelSize, nil)

                local name = currentAbility.spellName
                if currentAbility.tagsTable.self_only then
                    name = CreateAtlasMarkup("friendslist-recentallies-yellow") .. name
                end
                label:SetText(name)
                button.label = label
                AddLinkTooltip(button, MythicPlusUtility:GetSpellHyperlinkById(spellId))

                local labelLeft = frame.leftLabelFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
                labelLeft:SetPoint("RIGHT", button, "LEFT", -1, 0)
                labelLeft:SetJustifyH("RIGHT")

                local flags = ""
                if cosmeticDB.labelOutline ~= "NONE" then flags = cosmeticDB.labelOutline end
                labelLeft:SetFont(LSM:Fetch("font", cosmeticDB.labelFont), cosmeticDB.labelSize, flags)
                labelLeft:SetShown(enabled)

                if cosmeticDB.labelWidthType == "automatic" then
                    labelLeft:SetWidth(0)
                else
                    labelLeft:SetWidth(cosmeticDB.labelWidth)
                    labelLeft:SetWordWrap(cosmeticDB.labelOverflow == "wrap")
                end
                if cosmeticDB.labelType == "custom" then
                    labelLeft:SetText(cosmeticDB.customLabelTextFormatted)
                else
                    labelLeft:SetText(cosmeticDB.label)
                end

                c = cosmeticDB.labelColor
                labelLeft:SetTextColor(c[1], c[2], c[3], c[4])
                c = cosmeticDB.labelShadowColor
                labelLeft:SetShadowColor(c[1], c[2], c[3], c[4])
                labelLeft:SetShadowOffset(cosmeticDB.labelShadowX, cosmeticDB.labelShadowY)
                button.labelLeft = labelLeft

                local listFrame = CreateFrame("Frame", nil, self)
                listFrame:SetWidth(1)
                listFrame:Hide()
                listFrame.lines = {}

                listFrame:SetHyperlinksEnabled(true)

                listFrame:SetScript("OnHyperlinkEnter", function(self, link, text, region, left, bottom, width, height)
                    GameTooltip:SetOwner(self, "ANCHOR_CURSOR_RIGHT")
                    GameTooltip:SetHyperlink(link)
                    GameTooltip:Show()
                end)
                listFrame:SetScript("OnHyperlinkClick",
                                    function(self, link, text, button)
                    SetItemRef(link, text, button, self)
                end)
                listFrame:SetScript("OnHyperlinkLeave", function() GameTooltip:Hide() end)
                button.listFrame = listFrame

                for i, text in ipairs(button.list) do
                    local line = listFrame:CreateFontString(nil, "OVERLAY", "ChatFontNormal")
                    line:SetJustifyH("LEFT")
                    line:SetWordWrap(true)
                    line:SetWidth(windowSettings.width - LEFT_PADDING - RIGHT_PADDING - TEXT_WRAP_PADDING)
                    line:SetFont(LSM:Fetch("font", textAndIcon.bodyText.labelFont), textAndIcon.bodyText.labelSize, nil)
                    line:SetText(text)

                    if i == 1 then
                        line:SetPoint("TOPLEFT", 0, 0)
                    else
                        line:SetPoint("TOPLEFT", listFrame.lines[i - 1], "BOTTOMLEFT", 0, -4)
                    end
                    table.insert(listFrame.lines, line)
                end

                button:SetScript("OnClick", function(self)
                    if #self.list > 0 then
                        self.listFrame:SetShown(not self.listFrame:IsShown())
                        frame:UpdateLayout()
                    end
                end)

                table.insert(self.buttons, button)
            end
        end

    end

    function frame:updateButtonCosmeticIcon(buttonType)
        local cosmeticDB = buttonCosmetic[buttonType]
        c = buttonCosmetic[buttonType].iconColor
        buttonsIndices = MythicPlusUtility:GetbuttonsIndices()

        for id, _ in ipairs(buttonsIndices) do
            local button = self.buttons[id]
            if button.buttonType == buttonType then
                if button.texture:IsDesaturated() ~= cosmeticDB.iconDesaturate then
                    button.texture:SetDesaturated(cosmeticDB.iconDesaturate)
                end
                local r, g, b, a = button.texture:GetVertexColor()
                if r ~= c[1] or g ~= c[2] or b ~= c[3] or a ~= c[4] then
                    button.texture:SetVertexColor(c[1], c[2], c[3], c[4])
                end
            end
        end
    end

    function frame:updateButtonCosmeticLabel(buttonType)
        local cosmeticDB = buttonCosmetic[buttonType]
        local cLabel = buttonCosmetic[buttonType].labelColor
        local cShadow = buttonCosmetic[buttonType].labelShadowColor
        local fontFileDB = LSM:Fetch("font", cosmeticDB.labelFont)
        local flagsDB = ""
        if cosmeticDB.labelOutline ~= "NONE" then flagsDB = cosmeticDB.labelOutline end
        local text
        if cosmeticDB.labelType == "custom" then
            text = cosmeticDB.customLabelTextFormatted
        else
            text = cosmeticDB.label
        end
        buttonsIndices = MythicPlusUtility:GetbuttonsIndices()

        for id, _ in ipairs(buttonsIndices) do
            local button = self.buttons[id]
            if button.buttonType == buttonType then

                if button.labelLeft:GetText() ~= text then button.labelLeft:SetText(text) end

                local r, g, b, a = button.labelLeft:GetTextColor()
                if r ~= cLabel[1] or g ~= cLabel[2] or b ~= cLabel[3] or a ~= cLabel[4] then
                    button.labelLeft:SetTextColor(cLabel[1], cLabel[2], cLabel[3], cLabel[4])
                end

                local fontFile, height, flags = button.labelLeft:GetFont()
                if fontFile ~= fontFileDB or height ~= cosmeticDB.labelSize or flags ~= flagsDB then
                    button.labelLeft:SetFont(fontFileDB, cosmeticDB.labelSize, flagsDB)
                end

                r, g, b, a = button.labelLeft:GetShadowColor()
                if r ~= cShadow[1] or g ~= cShadow[2] or b ~= cShadow[3] or a ~= cShadow[4] then
                    button.labelLeft:SetShadowColor(cShadow[1], cShadow[2], cShadow[3], cShadow[4])
                end

                local x, y = button.labelLeft:GetShadowOffset()
                if x ~= cosmeticDB.labelShadowX or y ~= cosmeticDB.labelShadowY then
                    button.labelLeft:SetShadowOffset(cosmeticDB.labelShadowX, cosmeticDB.labelShadowY)
                end

                if cosmeticDB.labelWidthType == "automatic" then
                    button.labelLeft:SetWidth(0)
                else
                    button.labelLeft:SetWidth(cosmeticDB.labelWidth)
                    button.labelLeft:SetWordWrap(cosmeticDB.labelOverflow == "wrap")
                end

            end
        end
    end

    function frame:updateButtonCosmeticGlow(buttonType)
        local cosmeticDB = buttonCosmetic[buttonType]
        buttonsIndices = MythicPlusUtility:GetbuttonsIndices()

        for id, _ in ipairs(buttonsIndices) do
            local button = self.buttons[id]
            if button.buttonType == buttonType then
                if button.Glow_Stop then button.Glow_Stop(button) end
                if cosmeticDB.iconGlow then ApplyGlowToFrame(button, cosmeticDB, cosmeticDB.iconGlowType) end
            end
        end
    end

    function frame:UpdateIconSize(updateLayout)
        updateLayout = updateLayout or true

        if #self.buttons > 0 then
            for _, button in ipairs(self.buttons) do
                button:SetSize(textAndIcon.icon.size, textAndIcon.icon.size)
                button.label:SetWidth(windowSettings.width - LEFT_PADDING - textAndIcon.icon.size - RIGHT_PADDING - 5)
            end
            if updateLayout then self:UpdateLayout() end
        end
    end

    function frame:UpdateText(parent, updateLayout)
        updateLayout = updateLayout or true
        if not parent then
            self:UpdateText("icon", updateLayout)
            self:UpdateText("dungeonName", updateLayout)
            self:UpdateText("bodyText", updateLayout)
        end

        if parent == "icon" and #self.buttons > 0 then
            local iconDB = textAndIcon.icon
            local cLabel = iconDB.labelColor
            local cShadow = iconDB.labelShadowColor
            local fontFileDB = LSM:Fetch("font", iconDB.labelFont)
            local flagsDB = ""
            if iconDB.labelOutline ~= "NONE" then flagsDB = iconDB.labelOutline end

            for _, button in ipairs(self.buttons) do
                local fontFile, height, flags = button.label:GetFont()
                if fontFile ~= fontFileDB or height ~= iconDB.labelSize or flags ~= flagsDB then
                    button.label:SetFont(fontFileDB, iconDB.labelSize, flagsDB)
                end

                local r, g, b, a = button.label:GetTextColor()
                if r ~= cLabel[1] or g ~= cLabel[2] or b ~= cLabel[3] or a ~= cLabel[4] then
                    button.label:SetTextColor(cLabel[1], cLabel[2], cLabel[3], cLabel[4])
                end

                r, g, b, a = button.label:GetShadowColor()
                if r ~= cShadow[1] or g ~= cShadow[2] or b ~= cShadow[3] or a ~= cShadow[4] then
                    button.label:SetShadowColor(cShadow[1], cShadow[2], cShadow[3], cShadow[4])
                end

                local x, y = button.label:GetShadowOffset()
                if x ~= iconDB.labelShadowX or y ~= iconDB.labelShadowY then
                    button.label:SetShadowOffset(iconDB.labelShadowX, iconDB.labelShadowY)
                end
            end
        end

        if parent == "dungeonName" then
            local dungeonDB = textAndIcon.dungeonName
            local cLabel = dungeonDB.labelColor
            local cShadow = dungeonDB.labelShadowColor
            local flagsDB = ""
            if dungeonDB.labelOutline ~= "NONE" then flagsDB = dungeonDB.labelOutline end

            self.dungeonNameText:SetFont(LSM:Fetch("font", dungeonDB.labelFont), dungeonDB.labelSize, flagsDB)
            self.dungeonNameText:SetTextColor(cLabel[1], cLabel[2], cLabel[3], cLabel[4])
            self.dungeonNameText:SetShadowColor(cShadow[1], cShadow[2], cShadow[3], cShadow[4])
            self.dungeonNameText:SetShadowOffset(dungeonDB.labelShadowX, dungeonDB.labelShadowY)
        end

        if parent == "bodyText" then
            local bodyDB = textAndIcon.bodyText
            local cLabel = bodyDB.labelColor
            local cShadow = bodyDB.labelShadowColor
            local fontFileDB = LSM:Fetch("font", bodyDB.labelFont)
            local flagsDB = ""
            if bodyDB.labelOutline ~= "NONE" then flagsDB = bodyDB.labelOutline end

            self.listEmptyText:SetFont(LSM:Fetch("font", fontFileDB), bodyDB.labelSize, flagsDB)
            if #self.buttons > 0 then
                for _, button in ipairs(self.buttons) do
                    for _, line in ipairs(button.listFrame.lines) do
                        local fontFile, height, flags = line:GetFont()
                        if fontFile ~= fontFileDB or height ~= bodyDB.labelSize or flags ~= flagsDB then
                            line:SetFont(fontFileDB, bodyDB.labelSize, flagsDB)
                        end

                        local r, g, b, a = line:GetTextColor()
                        if r ~= cLabel[1] or g ~= cLabel[2] or b ~= cLabel[3] or a ~= cLabel[4] then
                            line:SetTextColor(cLabel[1], cLabel[2], cLabel[3], cLabel[4])
                        end

                        r, g, b, a = line:GetShadowColor()
                        if r ~= cShadow[1] or g ~= cShadow[2] or b ~= cShadow[3] or a ~= cShadow[4] then
                            line:SetShadowColor(cShadow[1], cShadow[2], cShadow[3], cShadow[4])
                        end

                        local x, y = line:GetShadowOffset()
                        if x ~= bodyDB.labelShadowX or y ~= bodyDB.labelShadowY then
                            line:SetShadowOffset(bodyDB.labelShadowX, bodyDB.labelShadowY)
                        end
                    end
                end
            end
        end

        if updateLayout then self:UpdateLayout() end
    end

    function frame:UpdateTextWrap(updateLayout)
        updateLayout = updateLayout or true
        buttonsIndices = MythicPlusUtility:GetbuttonsIndices()

        self.dungeonNameText:SetWidth(windowSettings.width - 2 * CLOSE_BUTTON_SIZE - TEXT_WRAP_PADDING)
        self.listEmptyText:SetWidth(windowSettings.width - LEFT_PADDING - RIGHT_PADDING - TEXT_WRAP_PADDING)
        for id, _ in ipairs(buttonsIndices) do
            local button = self.buttons[id]
            button.label:SetWidth(windowSettings.width - LEFT_PADDING - textAndIcon.icon.size - RIGHT_PADDING - 1)
            for subId, _ in ipairs(button.list) do
                button.listFrame.lines[subId]:SetWidth(windowSettings.width - LEFT_PADDING - RIGHT_PADDING
                                                         - TEXT_WRAP_PADDING)
            end
        end
        if updateLayout then self:UpdateLayout() end
    end

    local closeButton = CreateFrame("Button", nil, frame)
    closeButton:SetSize(CLOSE_BUTTON_SIZE, CLOSE_BUTTON_SIZE)
    closeButton:SetPoint("TOPRIGHT", 1, 1)

    local texture = closeButton:CreateTexture(nil, "ARTWORK")
    texture:SetAllPoints()
    texture:SetAtlas("simplecheckout-close-normal-1x")
    closeButton.texture = texture

    closeButton:SetScript("OnEnter", function(self) self.texture:SetAtlas("simplecheckout-close-hover-1x") end)
    closeButton:SetScript("OnMouseDown", function(self, button)
        if button == "LeftButton" then self.texture:SetAtlas("simplecheckout-close-pressed-1x") end
    end)
    closeButton:SetScript("OnLeave", function(self) self.texture:SetAtlas("simplecheckout-close-normal-1x") end)
    closeButton:SetScript("OnClick", function(self) frame:SetShownHandler(false) end)

    local dungeonNameText = frame:CreateFontString(nil, "OVERLAY", "ChatFontNormal")
    dungeonNameText:SetJustifyH("CENTER")
    dungeonNameText:SetJustifyV("TOP")
    dungeonNameText:SetWordWrap(true)
    dungeonNameText:SetWidth(windowSettings.width - 2 * CLOSE_BUTTON_SIZE - TEXT_WRAP_PADDING)
    dungeonNameText:SetText(self.dungeonIdToName[profile.instanceID] or "")
    dungeonNameText:SetFont(LSM:Fetch("font", textAndIcon.dungeonName.labelFont), textAndIcon.dungeonName.labelSize,
                            "OUTLINE")
    dungeonNameText:SetPoint("TOP", 0, -TOP_PADDING)
    frame.dungeonNameText = dungeonNameText

    local listEmptyText = frame:CreateFontString(nil, "OVERLAY", "ChatFontNormal")
    listEmptyText:SetJustifyH("LEFT")
    listEmptyText:SetWordWrap(true)
    listEmptyText:SetWidth(windowSettings.width - LEFT_PADDING - RIGHT_PADDING - TEXT_WRAP_PADDING)
    listEmptyText:SetText(L["No utility abilities for this dungeon"])
    listEmptyText:SetFont(LSM:Fetch("font", textAndIcon.bodyText.labelFont), textAndIcon.bodyText.labelSize, nil)
    listEmptyText:SetPoint("TOPLEFT", LEFT_PADDING + RIGHT_PADDING,
                           -TOP_PADDING - frame:GetTop() + frame.dungeonNameText:GetBottom())
    listEmptyText:Hide()
    frame.listEmptyText = listEmptyText

    frame:UpdateButtons()
    frame:UpdateLayout()
    return frame
end
