-- ============================ 6. TẠO CỬA SỔ KEY SYSTEM (3 Ô NHẬP) ============================
local KeyWindow = Rayfield:CreateWindow({
    Name = "Quy Hub V2",
    LoadingTitle = "⚡ Quy Hub V2 ⚡",
    LoadingSubtitle = "Key System | by Quy",
    ConfigurationSaving = {
        Enabled = false,
    },
    Discord = {
        Enabled = true,
        Invite = "quyhub",
        RememberJoins = true
    },
    KeySystem = false,
})

-- Tab Key System
local KeyTab = KeyWindow:CreateTab("Key System", nil)

-- Logo / Tiêu đề
KeyTab:CreateParagraph({
    Title = "⚡ Quy Hub V2",
    Content = "Blox Fruits | Premium Script",
})

-- ============================ Ô 1: LICENSE KEY ============================
KeyTab:CreateSection("🔑 License Key")

local LicenseInput = KeyTab:CreateTextBox({
    Name = "Enter license key...",
    PlaceholderText = "Enter key (23za3a)...",
    CurrentValue = "",
    Flag = "LicenseKey",
    Callback = function(Text)
        _G.QuyHub.TempLicense = Text
    end,
})

KeyTab:CreateButton({
    Name = "🎯 Redeem License",
    Callback = function()
        local key = KeyTab.Flags.LicenseKey or ""
        if key == "23za3a" then
            _G.QuyHub.Key = key
            if KeyConfig.SaveKey then SaveKey(key) end
            _G.QuyHub.Unlocked = true
            Notify("Quy Hub", "✅ License Key hợp lệ! Chào mừng bạn!", 4, "🎉")
            KeyTab.Flags.LicenseKey = ""
            _G.QuyHub.TempLicense = ""
            -- Tạo main window nếu chưa có
            if not MainWindow then
                CreateMainWindow()
            end
        else
            Notify("Quy Hub", "❌ License Key không hợp lệ! Vui lòng thử lại.", 3, "❌")
        end
    end,
})

-- ============================ Ô 2: PREMIUM KEY ============================
KeyTab:CreateSection("👑 Premium Key")

local PremiumInput = KeyTab:CreateTextBox({
    Name = "Enter premium key...",
    PlaceholderText = "Enter key (9213)...",
    CurrentValue = "",
    Flag = "PremiumKey",
    Callback = function(Text)
        _G.QuyHub.TempPremium = Text
    end,
})

KeyTab:CreateButton({
    Name = "👑 Redeem Premium",
    Callback = function()
        local key = KeyTab.Flags.PremiumKey or ""
        if key == "9213" then
            _G.QuyHub.Premium = true
            Notify("Quy Hub Premium", "👑 Premium Key hợp lệ! Tab Premium đã được mở khóa!\n⏰ Key có hiệu lực 5 giờ.", 4, "👑")
            KeyTab.Flags.PremiumKey = ""
            _G.QuyHub.TempPremium = ""
            -- Cập nhật Premium tab nếu MainWindow tồn tại
            if MainWindow and MainWindow.Tabs and MainWindow.Tabs["👑 Premium"] then
                MainWindow.Tabs["👑 Premium"].Visible = true
            end
        else
            Notify("Quy Hub", "❌ Premium Key không hợp lệ! Vui lòng thử lại.", 3, "❌")
        end
    end,
})

-- ============================ Ô 3: UNLOCK CODE ============================
KeyTab:CreateSection("🎯 Unlock Code (Fruits, Raid, Misc)")

local CodeInput = KeyTab:CreateTextBox({
    Name = "Enter unlock code...",
    PlaceholderText = "Enter code (quy)...",
    CurrentValue = "",
    Flag = "UnlockCode",
    Callback = function(Text)
        _G.QuyHub.TempCode = Text
    end,
})

KeyTab:CreateButton({
    Name = "🔓 Redeem Code",
    Callback = function()
        local code = KeyTab.Flags.UnlockCode or ""
        if code == "quy" then
            UnlockedTabs.Fruits = true
            UnlockedTabs.Raid = true
            UnlockedTabs.Misc = true
            Notify("Quy Hub", "✅ Code hợp lệ! Các tab Fruits, Raid, Misc đã được mở khóa!", 4, "🔓")
            KeyTab.Flags.UnlockCode = ""
            _G.QuyHub.TempCode = ""
            -- Cập nhật visibility các tab nếu MainWindow tồn tại
            if MainWindow then
                if MainWindow.Tabs and MainWindow.Tabs["🍎 Fruits"] then
                    MainWindow.Tabs["🍎 Fruits"].Visible = true
                end
                if MainWindow.Tabs and MainWindow.Tabs["🌊 Raid & Sea"] then
                    MainWindow.Tabs["🌊 Raid & Sea"].Visible = true
                end
                if MainWindow.Tabs and MainWindow.Tabs["🛠️ Misc"] then
                    MainWindow.Tabs["🛠️ Misc"].Visible = true
                end
            end
        else
            Notify("Quy Hub", "❌ Code không hợp lệ! Vui lòng thử lại.", 3, "❌")
        end
    end,
})

-- ============================ BADGES & DISCORD ============================
KeyTab:CreateSection("📌 Get Key From")
KeyTab:CreateParagraph({
    Title = "🔗 Linkvertise",
    Content = "👉 " .. KeyConfig.MainLink,
})
KeyTab:CreateParagraph({
    Title = "🔗 LootLabs",
    Content = "👉 " .. KeyConfig.PremiumLink,
})
KeyTab:CreateParagraph({
    Title = "🔗 Workink",
    Content = "👉 " .. KeyConfig.MainLink,
})

KeyTab:CreateSection("💬 Need Support?")
KeyTab:CreateButton({
    Name = "💬 Join the Discord",
    Callback = function()
        setclipboard("https://discord.gg/quyhub")
        Notify("Quy Hub", "✅ Đã sao chép link Discord!", 3, "📋")
    end,
})
