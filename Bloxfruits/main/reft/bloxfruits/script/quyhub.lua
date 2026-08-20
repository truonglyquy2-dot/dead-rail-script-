-- ==========================================================================================
--                              QUY HUB ULTIMATE v11.5
--                     Key System: 2 link – 2 loại key
--                     🔑 Key chính: 23za3a
--                     👑 Key Premium: 9213 (hiệu lực 5h)
--                     🌐 Hỗ trợ đa ngôn ngữ: Tiếng Việt / English
--                     Tác giả: Quy
-- ==========================================================================================

-- ============================ 1. TẢI RAYFIELD ============================
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- ============================ 2. CẤU HÌNH KEY SYSTEM ============================
local KeyConfig = {
    MainLink = "https://link4sub.com/XFwyhwt2zw",
    PremiumLink = "https://link4sub.com/8paBqdaAu2",
    ValidKeys = {"23za3a", "9213"},
    PremiumKey = "9213",
    SaveKey = true,
    FileName = "QuyHubKey.txt",
}

-- ============================ 3. NGÔN NGỮ ============================
local Lang = {
    ["vi"] = {
        -- Tên script
        script_name = "Quy Hub Ultimate v11.5",
        loading_title = "⚡ Quy Hub Ultimate ⚡",
        loading_sub = "Key chính: 23za3a | Premium: 9213",
        -- Tab Key System
        key_tab = "🔑 Key System",
        key_section_hd = "📋 HƯỚNG DẪN LẤY KEY",
        key_intro = "🔹 CÓ 2 LOẠI KEY:",
        key_main_label = "🔑 Key chính (23za3a) – Dùng script cơ bản",
        key_premium_label = "👑 Key Premium (9213) – Mở tab Premium (hiệu lực 5h)",
        key_main_link_label = "📋 Sao chép link lấy key chính",
        key_premium_link_label = "📋 Sao chép link lấy key Premium",
        key_main_guide = "Hướng dẫn:",
        key_main_step = "1. Nhấn nút trên để copy link.\n2. Mở trình duyệt, dán link vào.\n3. Hoàn thành nhiệm vụ trên trang.\n4. Nhận Key (sẽ là 23za3a).\n5. Dán Key vào ô bên dưới và nhấn Xác thực.",
        key_premium_step = "1. Nhấn nút trên để copy link.\n2. Mở trình duyệt, dán link vào.\n3. Hoàn thành nhiệm vụ trên trang.\n4. Nhận Key (sẽ là 9213).\n5. Dán Key vào ô bên dưới và nhấn Xác thực.\n6. ⏰ Key Premium có hiệu lực 5 giờ.",
        key_enter = "🔑 Nhập Key của bạn",
        key_placeholder = "Ví dụ: 23za3a hoặc 9213",
        key_validate = "🔄 Xác thực lại",
        key_invalid = "❌ Key không hợp lệ! Vui lòng kiểm tra lại hoặc lấy key mới.",
        key_valid = "✅ Key hợp lệ! Bạn đã được cấp quyền sử dụng.",
        key_premium_unlock = "👑 Key Premium 9213! Tab Premium đã được mở khóa!\n⏰ Key có hiệu lực 5 giờ.",
        key_saved_invalid = "⚠️ Key đã lưu không hợp lệ, vui lòng nhập key mới.",
        key_copied_main = "✅ Đã sao chép link lấy key chính!\nMở trình duyệt và dán vào thanh địa chỉ.",
        key_copied_premium = "✅ Đã sao chép link lấy key Premium!\nMở trình duyệt và dán vào thanh địa chỉ.",
        -- Tab Home
        home_tab = "🏠 Home",
        home_section = "👤 Thông tin người chơi",
        home_info_title = "📊 Thông tin",
        home_info_content = "Đang tải...",
        home_refresh = "🔄 Refresh",
        home_respawn = "💀 Respawn",
        home_start = "📍 Về đảo khởi đầu",
        -- Tab Farm
        farm_tab = "⚔️ Farm",
        farm_section = "🔥 Auto Farm",
        farm_toggle_name = "🔥 Auto Farm",
        farm_toggle_on = "Bắt đầu Farm!",
        farm_toggle_off = "Tắt Farm!",
        farm_mode_label = "⚡ Chế độ tấn công",
        farm_target_label = "🎯 Loại quái",
        farm_range_label = "📏 Khoảng cách",
        farm_speed_label = "⏱️ Tốc độ (giây)",
        farm_boss_section = "👹 Auto Boss",
        farm_boss_toggle = "👹 Auto Boss",
        farm_boss_on = "Bắt đầu Farm Boss!",
        farm_boss_off = "Tắt Farm Boss!",
        farm_boss_range = "📏 Khoảng cách boss",
        -- Tab Collect
        collect_tab = "📦 Collect & Sell",
        collect_section = "📦 Auto Collect",
        collect_fruit_toggle = "🍎 Auto Collect Fruits",
        collect_fruit_on = "Bắt đầu nhặt Fruit!",
        collect_fruit_off = "Tắt Collect Fruit!",
        collect_items_toggle = "📦 Auto Collect Items & Chests",
        collect_items_on = "Bắt đầu nhặt Items!",
        collect_items_off = "Tắt Collect Items!",
        collect_range = "📏 Khoảng cách thu thập",
        -- Tab Raid & Sea
        raid_tab = "🌊 Raid & Sea",
        raid_section = "🌀 Auto Raid",
        raid_toggle = "🌀 Auto Raid",
        raid_on = "Bắt đầu Auto Raid!",
        raid_off = "Tắt Auto Raid!",
        raid_teleport = "📍 Teleport đến NPC Raid",
        raid_teleport_ok = "Đã teleport!",
        sea_section = "🐉 Auto Sea Beast",
        sea_toggle = "🐉 Auto Sea Beast",
        sea_on = "Bắt đầu săn Sea Beast!",
        sea_off = "Tắt Auto Sea Beast!",
        sea_teleport = "🚤 Đi ra biển",
        sea_teleport_ok = "Đã ra biển!",
        -- Tab Teleport
        tele_tab = "📍 Teleport",
        tele_section = "🏝️ Đảo",
        tele_custom = "✏️ Tọa độ tùy chỉnh",
        tele_button = "🚀 Teleport",
        tele_ok = "Đã teleport đến ",
        tele_custom_ok = "Teleport đến (",
        -- Tab Premium
        premium_tab = "👑 Premium",
        premium_section = "🌟 TÍNH NĂNG PREMIUM (Key: 9213)",
        premium_welcome = "👑 Chào mừng Premium User!",
        premium_desc = "Bạn đã nhập key Premium (9213).\n⏰ Key có hiệu lực 5 giờ.\nDưới đây là các tính năng độc quyền dành cho bạn.",
        premium_hop = "🔄 Hop Server (Tìm server có trái)",
        premium_hop_on = "Bắt đầu Hop Server!",
        premium_hop_off = "Tắt Hop Server!",
        premium_hop_no_fruit = "Không có trái, đang hop server...",
        premium_loot = "🍎 Lụm Trái (Auto Collect Fruit toàn map)",
        premium_loot_on = "Bắt đầu lụm trái!",
        premium_loot_off = "Tắt lụm trái!",
        premium_hop_loot = "🔄🍎 Hop Server + Lụm Trái (Kết hợp)",
        premium_hop_loot_on = "Bắt đầu Hop + Lụm!",
        premium_hop_loot_off = "Tắt Hop + Lụm!",
        premium_farm_fruit = "🌳 Auto Farm Fruit (Tự động farm trái từ NPC)",
        premium_farm_fruit_on = "Bắt đầu Farm Fruit!",
        premium_farm_fruit_off = "Tắt Farm Fruit!",
        premium_farming = "Đang farm trái từ NPC...",
        -- Tab Misc
        misc_tab = "🛠️ Misc",
        misc_fly = "✈️ Fly",
        misc_fly_on = "Bật Fly!",
        misc_fly_off = "Tắt Fly!",
        misc_fly_speed = "📈 Tốc độ bay",
        misc_noclip = "🚧 NoClip",
        misc_noclip_on = "Bật NoClip!",
        misc_noclip_off = "Tắt NoClip!",
        misc_speed = "🏃 Tốc độ di chuyển",
        misc_jump = "🦘 Sức bật nhảy",
        misc_esp = "👁️ ESP",
        misc_esp_on = "Bật ESP!",
        misc_esp_off = "Tắt ESP!",
        misc_antiafk = "⏰ Anti AFK",
        misc_antiafk_on = "Bật Anti AFK!",
        misc_antiafk_off = "Tắt Anti AFK!",
        misc_heal = "💊 Auto Heal",
        misc_heal_on = "Bật Auto Heal!",
        misc_heal_off = "Tắt Auto Heal!",
        misc_heal_threshold = "🩸 Ngưỡng HP để heal (%)",
        misc_rejoin = "🔄 Auto Rejoin",
        misc_rejoin_on = "Bật Auto Rejoin!",
        misc_rejoin_off = "Tắt Auto Rejoin!",
        -- Tab Settings
        settings_tab = "⚙️ Settings",
        settings_reset = "🔄 Reset tất cả",
        settings_reset_ok = "Reset thành công!",
        settings_info = "📋 Thông tin script",
        -- Thông báo chung
        notify_unlock_warning = "⚠️ Vui lòng nhập key trước!",
        notify_premium_warning = "⚠️ Vui lòng nhập key Premium (9213)!",
        notify_copied = "✅ Đã sao chép link! Mở trình duyệt và dán vào thanh địa chỉ.",
        notify_startup = "Đã tải thành công!\n🔑 Key chính: 23za3a\n👑 Key Premium: 9213 (hiệu lực 5h)\n📥 Cả 2 link đều là link4sub.com",
        -- Language
        lang_tab = "🌐 Language",
        lang_section = "Chọn ngôn ngữ / Select Language",
        lang_label = "Ngôn ngữ / Language",
        lang_options = {"Tiếng Việt", "English"},
        lang_current = "vi",
    },
    ["en"] = {
        script_name = "Quy Hub Ultimate v11.5",
        loading_title = "⚡ Quy Hub Ultimate ⚡",
        loading_sub = "Main Key: 23za3a | Premium: 9213",
        key_tab = "🔑 Key System",
        key_section_hd = "📋 HOW TO GET KEY",
        key_intro = "🔹 THERE ARE 2 TYPES OF KEY:",
        key_main_label = "🔑 Main Key (23za3a) – Use basic script",
        key_premium_label = "👑 Premium Key (9213) – Unlock Premium tab (5h validity)",
        key_main_link_label = "📋 Copy main key link",
        key_premium_link_label = "📋 Copy premium key link",
        key_main_guide = "Guide:",
        key_main_step = "1. Click the button above to copy link.\n2. Open browser, paste the link.\n3. Complete tasks on the page.\n4. Get Key (it will be 23za3a).\n5. Paste Key below and click Verify.",
        key_premium_step = "1. Click the button above to copy link.\n2. Open browser, paste the link.\n3. Complete tasks on the page.\n4. Get Key (it will be 9213).\n5. Paste Key below and click Verify.\n6. ⏰ Premium Key has 5 hours validity.",
        key_enter = "🔑 Enter your Key",
        key_placeholder = "Example: 23za3a or 9213",
        key_validate = "🔄 Verify again",
        key_invalid = "❌ Invalid Key! Please check again or get a new key.",
        key_valid = "✅ Valid Key! You have been granted access.",
        key_premium_unlock = "👑 Premium Key 9213! Premium tab unlocked!\n⏰ Key valid for 5 hours.",
        key_saved_invalid = "⚠️ Saved key is invalid, please enter a new key.",
        key_copied_main = "✅ Main key link copied!\nOpen browser and paste into address bar.",
        key_copied_premium = "✅ Premium key link copied!\nOpen browser and paste into address bar.",
        home_tab = "🏠 Home",
        home_section = "👤 Player Info",
        home_info_title = "📊 Info",
        home_info_content = "Loading...",
        home_refresh = "🔄 Refresh",
        home_respawn = "💀 Respawn",
        home_start = "📍 Go to starter island",
        farm_tab = "⚔️ Farm",
        farm_section = "🔥 Auto Farm",
        farm_toggle_name = "🔥 Auto Farm",
        farm_toggle_on = "Start Farming!",
        farm_toggle_off = "Stop Farming!",
        farm_mode_label = "⚡ Attack Mode",
        farm_target_label = "🎯 Target Monster",
        farm_range_label = "📏 Range",
        farm_speed_label = "⏱️ Speed (seconds)",
        farm_boss_section = "👹 Auto Boss",
        farm_boss_toggle = "👹 Auto Boss",
        farm_boss_on = "Start Boss Farming!",
        farm_boss_off = "Stop Boss Farming!",
        farm_boss_range = "📏 Boss Range",
        collect_tab = "📦 Collect & Sell",
        collect_section = "📦 Auto Collect",
        collect_fruit_toggle = "🍎 Auto Collect Fruits",
        collect_fruit_on = "Start Collecting Fruits!",
        collect_fruit_off = "Stop Collecting Fruits!",
        collect_items_toggle = "📦 Auto Collect Items & Chests",
        collect_items_on = "Start Collecting Items!",
        collect_items_off = "Stop Collecting Items!",
        collect_range = "📏 Collect Range",
        raid_tab = "🌊 Raid & Sea",
        raid_section = "🌀 Auto Raid",
        raid_toggle = "🌀 Auto Raid",
        raid_on = "Start Auto Raid!",
        raid_off = "Stop Auto Raid!",
        raid_teleport = "📍 Teleport to Raid NPC",
        raid_teleport_ok = "Teleported!",
        sea_section = "🐉 Auto Sea Beast",
        sea_toggle = "🐉 Auto Sea Beast",
        sea_on = "Start Hunting Sea Beast!",
        sea_off = "Stop Auto Sea Beast!",
        sea_teleport = "🚤 Go to Sea",
        sea_teleport_ok = "Arrived at Sea!",
        tele_tab = "📍 Teleport",
        tele_section = "🏝️ Islands",
        tele_custom = "✏️ Custom Coordinates",
        tele_button = "🚀 Teleport",
        tele_ok = "Teleported to ",
        tele_custom_ok = "Teleported to (",
        premium_tab = "👑 Premium",
        premium_section = "🌟 PREMIUM FEATURES (Key: 9213)",
        premium_welcome = "👑 Welcome Premium User!",
        premium_desc = "You have entered Premium Key (9213).\n⏰ Key valid for 5 hours.\nBelow are exclusive features for you.",
        premium_hop = "🔄 Hop Server (Find server with fruit)",
        premium_hop_on = "Start Hop Server!",
        premium_hop_off = "Stop Hop Server!",
        premium_hop_no_fruit = "No fruit, hopping server...",
        premium_loot = "🍎 Loot Fruit (Auto Collect fruit across map)",
        premium_loot_on = "Start Looting Fruits!",
        premium_loot_off = "Stop Looting Fruits!",
        premium_hop_loot = "🔄🍎 Hop Server + Loot Fruit (Combined)",
        premium_hop_loot_on = "Start Hop + Loot!",
        premium_hop_loot_off = "Stop Hop + Loot!",
        premium_farm_fruit = "🌳 Auto Farm Fruit (Farm fruit from NPC)",
        premium_farm_fruit_on = "Start Farm Fruit!",
        premium_farm_fruit_off = "Stop Farm Fruit!",
        premium_farming = "Farming fruit from NPC...",
        misc_tab = "🛠️ Misc",
        misc_fly = "✈️ Fly",
        misc_fly_on = "Fly On!",
        misc_fly_off = "Fly Off!",
        misc_fly_speed = "📈 Fly Speed",
        misc_noclip = "🚧 NoClip",
        misc_noclip_on = "NoClip On!",
        misc_noclip_off = "NoClip Off!",
        misc_speed = "🏃 Movement Speed",
        misc_jump = "🦘 Jump Power",
        misc_esp = "👁️ ESP",
        misc_esp_on = "ESP On!",
        misc_esp_off = "ESP Off!",
        misc_antiafk = "⏰ Anti AFK",
        misc_antiafk_on = "Anti AFK On!",
        misc_antiafk_off = "Anti AFK Off!",
        misc_heal = "💊 Auto Heal",
        misc_heal_on = "Auto Heal On!",
        misc_heal_off = "Auto Heal Off!",
        misc_heal_threshold = "🩸 Heal Threshold (%)",
        misc_rejoin = "🔄 Auto Rejoin",
        misc_rejoin_on = "Auto Rejoin On!",
        misc_rejoin_off = "Auto Rejoin Off!",
        settings_tab = "⚙️ Settings",
        settings_reset = "🔄 Reset All",
        settings_reset_ok = "Reset successful!",
        settings_info = "📋 Script Info",
        notify_unlock_warning = "⚠️ Please enter key first!",
        notify_premium_warning = "⚠️ Please enter Premium Key (9213)!",
        notify_copied = "✅ Link copied! Open browser and paste into address bar.",
        notify_startup = "Loaded successfully!\n🔑 Main Key: 23za3a\n👑 Premium Key: 9213 (5h validity)\n📥 Both links are link4sub.com",
        lang_tab = "🌐 Language",
        lang_section = "Select Language / Chọn ngôn ngữ",
        lang_label = "Language / Ngôn ngữ",
        lang_options = {"Tiếng Việt", "English"},
        lang_current = "en",
    }
}

-- Ngôn ngữ mặc định
local currentLang = "vi"
_G.QuyHub = _G.QuyHub or {}
_G.QuyHub.Language = currentLang

local function T(textKey)
    if Lang[currentLang] and Lang[currentLang][textKey] then
        return Lang[currentLang][textKey]
    end
    -- Fallback to English if not found
    if Lang["en"] and Lang["en"][textKey] then
        return Lang["en"][textKey]
    end
    return textKey
end

-- ============================ 4. TẠO CỬA SỔ CHÍNH ============================
local Window = Rayfield:CreateWindow({
    Name = T("script_name"),
    LoadingTitle = T("loading_title"),
    LoadingSubtitle = T("loading_sub"),
    ConfigurationSaving = {
        Enabled = true,
        FileName = "QuyHubConfig"
    },
    Discord = {
        Enabled = true,
        Invite = "quyhub",
        RememberJoins = true
    },
    KeySystem = false,
})

-- ============================ 5. BIẾN TOÀN CỤ ============================
_G.QuyHub = _G.QuyHub or {}
_G.QuyHub.Unlocked = false
_G.QuyHub.Premium = false
_G.QuyHub.Key = ""
_G.QuyHub.Farm = false
_G.QuyHub.FarmMode = "Melee"
_G.QuyHub.FarmTarget = "All"
_G.QuyHub.FarmRange = 20
_G.QuyHub.FarmSpeed = 0.2
_G.QuyHub.FarmUseSkill = true
_G.QuyHub.FarmCombo = {"Z", "X", "C", "V"}
_G.QuyHub.FarmBoss = false
_G.QuyHub.FarmBossRange = 30
_G.QuyHub.AutoCollectFruits = false
_G.QuyHub.AutoCollectItems = false
_G.QuyHub.CollectRange = 30
_G.QuyHub.AutoRaid = false
_G.QuyHub.AutoSeaBeast = false
_G.QuyHub.HopServer = false
_G.QuyHub.HopServerFruit = false
_G.QuyHub.AutoLootFruit = false
_G.QuyHub.AutoFarmFruit = false
_G.QuyHub.Fly = false
_G.QuyHub.FlySpeed = 50
_G.QuyHub.NoClip = false
_G.QuyHub.Speed = 16
_G.QuyHub.JumpPower = 50
_G.QuyHub.ESP = false
_G.QuyHub.ESPMode = "Box"
_G.QuyHub.ESPColor = Color3.fromRGB(255, 0, 0)
_G.QuyHub.AntiAFK = false
_G.QuyHub.AutoHeal = false
_G.QuyHub.HealThreshold = 0.3
_G.QuyHub.AutoBuff = false
_G.QuyHub.AutoSpin = false
_G.QuyHub.SpinSpeed = 10
_G.QuyHub.AutoJump = false
_G.QuyHub.JumpInterval = 2
_G.QuyHub.AutoRejoin = false
_G.QuyHub.DebugMode = false
_G.QuyHub.Language = currentLang

-- ============================ 6. HÀM TIỆN ÍCH ============================
local function Notify(title, content, duration, icon)
    Rayfield:Notify({
        Title = title,
        Content = content,
        Duration = duration or 3,
        Icon = icon or nil,
    })
end

local function GetPlayer() return game.Players.LocalPlayer end
local function GetCharacter()
    local p = GetPlayer()
    return p and p.Character or nil
end
local function GetHumanoid()
    local c = GetCharacter()
    return c and c:FindFirstChildOfClass("Humanoid") or nil
end
local function GetHumanoidRootPart()
    local c = GetCharacter()
    return c and c:FindFirstChild("HumanoidRootPart") or nil
end

local function UpdateCharacter()
    _G.QuyHub.Character = GetCharacter()
    _G.QuyHub.Humanoid = GetHumanoid()
    _G.QuyHub.HumanoidRootPart = GetHumanoidRootPart()
end
UpdateCharacter()
game.Players.LocalPlayer.CharacterAdded:Connect(UpdateCharacter)

local function TeleportTo(pos)
    local root = GetHumanoidRootPart()
    if root then root.CFrame = CFrame.new(pos) return true end
    return false
end

local function SaveKey(key)
    if writefile then writefile(KeyConfig.FileName, key) end
end

local function LoadKey()
    if isfile and isfile(KeyConfig.FileName) then
        return readfile(KeyConfig.FileName)
    end
    return nil
end

-- ============================ 7. XÁC THỰC KEY ============================
local function ValidateKey(key)
    for _, v in ipairs(KeyConfig.ValidKeys) do
        if v == key then return true end
    end
    return false
end

local function IsPremiumKey(key)
    return key == KeyConfig.PremiumKey
end

local function UnlockFeatures(key)
    _G.QuyHub.Unlocked = true
    if IsPremiumKey(key) then
        _G.QuyHub.Premium = true
        Notify("Quy Hub Premium", T("key_premium_unlock"), 5, "👑")
    else
        Notify("Quy Hub", T("key_valid"), 5, "🎉")
    end
    -- Hiện tab Language (nếu chưa có)
    if LanguageTab then
        LanguageTab.Visible = true
    end
end

-- Kiểm tra key đã lưu
local savedKey = LoadKey()
if savedKey and ValidateKey(savedKey) then
    _G.QuyHub.Key = savedKey
    UnlockFeatures(savedKey)
elseif savedKey then
    Notify("Quy Hub", T("key_saved_invalid"), 4, "⚠️")
end

-- ============================ 8. TAB KEY SYSTEM ============================
local KeyTab = Window:CreateTab(T("key_tab"), nil)
KeyTab:CreateSection(T("key_section_hd"))

KeyTab:CreateParagraph({
    Title = T("key_intro"),
    Content = "🔑 " .. T("key_main_label") .. "\n   👉 " .. KeyConfig.MainLink .. "\n\n👑 " .. T("key_premium_label") .. "\n   👉 " .. KeyConfig.PremiumLink,
})

KeyTab:CreateSection("🔑 " .. T("key_main_label"))
KeyTab:CreateButton({
    Name = T("key_main_link_label"),
    Callback = function()
        setclipboard(KeyConfig.MainLink)
        Notify("Quy Hub", T("key_copied_main"), 4, "📋")
    end,
})
KeyTab:CreateParagraph({
    Title = T("key_main_guide"),
    Content = T("key_main_step"),
})

KeyTab:CreateSection("👑 " .. T("key_premium_label"))
KeyTab:CreateButton({
    Name = T("key_premium_link_label"),
    Callback = function()
        setclipboard(KeyConfig.PremiumLink)
        Notify("Quy Hub Premium", T("key_copied_premium"), 4, "📋")
    end,
})
KeyTab:CreateParagraph({
    Title = T("key_main_guide"),
    Content = T("key_premium_step"),
})

KeyTab:CreateSection("🔑 " .. T("key_enter"))
KeyTab:CreateTextBox({
    Name = T("key_enter"),
    PlaceholderText = T("key_placeholder"),
    CurrentValue = "",
    Flag = "KeyInput",
    Callback = function(Text)
        if ValidateKey(Text) then
            _G.QuyHub.Key = Text
            if KeyConfig.SaveKey then SaveKey(Text) end
            UnlockFeatures(Text)
        else
            Notify("Quy Hub", T("key_invalid"), 4, "❌")
        end
    end,
})

KeyTab:CreateButton({
    Name = T("key_validate"),
    Callback = function()
        local k = _G.QuyHub.Key or ""
        if k ~= "" and ValidateKey(k) then
            Notify("Quy Hub", T("key_valid"), 3, "✅")
            if IsPremiumKey(k) then
                Notify("Quy Hub Premium", T("key_premium_unlock"), 3, "👑")
                _G.QuyHub.Premium = true
            end
        else
            Notify("Quy Hub", T("key_invalid"), 3, "❌")
        end
    end,
})

-- ============================ 9. TAB LANGUAGE ============================
local LanguageTab = Window:CreateTab(T("lang_tab"), nil)
LanguageTab.Visible = _G.QuyHub.Unlocked

LanguageTab:CreateSection(T("lang_section"))
local LangDropdown = LanguageTab:CreateDropdown({
    Name = T("lang_label"),
    Options = {"Tiếng Việt", "English"},
    CurrentOption = {currentLang == "vi" and "Tiếng Việt" or "English"},
    MultipleOptions = false,
    Flag = "LanguageSelect",
    Callback = function(Option)
        if Option == "Tiếng Việt" then
            currentLang = "vi"
            _G.QuyHub.Language = "vi"
        else
            currentLang = "en"
            _G.QuyHub.Language = "en"
        end
        -- Cập nhật tất cả tab và các thành phần
        -- Do Rayfield không hỗ trợ refresh động, ta sẽ thông báo
        Notify("Quy Hub", "✅ Đã chuyển sang ngôn ngữ: " .. Option, 3, "🌐")
        -- Có thể yêu cầu restart script để áp dụng đầy đủ
        Notify("Quy Hub", "🔄 Vui lòng chạy lại script để áp dụng đầy đủ.", 4, "🔄")
    end,
})

-- ============================ 10. TAB HOME ============================
local HomeTab = Window:CreateTab(T("home_tab"), nil)
HomeTab:CreateSection(T("home_section"))

local PlayerInfo = HomeTab:CreateParagraph({
    Title = T("home_info_title"),
    Content = T("home_info_content"),
})

local function UpdateInfo()
    local p = GetPlayer()
    if not p then return end
    local level = p.Data and p.Data.Level and p.Data.Level.Value or "?"
    local fruit = p.Data and p.Data.Fruit and p.Data.Fruit.Value or "Không"
    local beli = p.Data and p.Data.Beli and p.Data.Beli.Value or "?"
    local frag = p.Data and p.Data.Fragments and p.Data.Fragments.Value or "?"
    PlayerInfo:SetContent(
        "👤 " .. T("home_info_title") .. ": " .. p.Name ..
        "\n📈 Level: " .. level ..
        "\n🍎 Fruit: " .. fruit ..
        "\n💰 Beli: " .. beli ..
        "\n💎 Fragments: " .. frag
    )
end
UpdateInfo()

HomeTab:CreateButton({ Name = T("home_refresh"), Callback = UpdateInfo })
HomeTab:CreateButton({ Name = T("home_respawn"), Callback = function() GetPlayer():LoadCharacter() end })
HomeTab:CreateButton({ Name = T("home_start"), Callback = function() TeleportTo(Vector3.new(0, 100, 0)) end })

-- ============================ 11. TAB FARM ============================
local FarmTab = Window:CreateTab(T("farm_tab"), nil)
FarmTab:CreateSection(T("farm_section"))

FarmTab:CreateToggle({
    Name = T("farm_toggle_name"),
    CurrentValue = false,
    Flag = "Farm",
    Callback = function(Value)
        if not _G.QuyHub.Unlocked then Notify("Quy Hub", T("notify_unlock_warning"), 3, "⚠️") return end
        _G.QuyHub.Farm = Value
        if Value then
            Notify("Quy Hub", T("farm_toggle_on"), 3, "⚔️")
            spawn(function()
                while _G.QuyHub.Farm do
                    local root = GetHumanoidRootPart()
                    if not root then wait(1) continue end
                    local nearest, minDist = nil, _G.QuyHub.FarmRange or 20
                    local enemies = game:GetService("Workspace"):FindFirstChild("Enemies")
                    if enemies then
                        for _, v in pairs(enemies:GetChildren()) do
                            if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                local dist = (root.Position - v.HumanoidRootPart.Position).Magnitude
                                if dist < minDist then
                                    nearest = v
                                    minDist = dist
                                end
                            end
                        end
                    end
                    if nearest then
                        root.CFrame = nearest.HumanoidRootPart.CFrame * CFrame.new(0, 0, -4)
                        wait(0.1)
                        game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, game:GetService("UserInputService").MouseIcon, 0)
                        wait(0.05)
                        game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, false, game:GetService("UserInputService").MouseIcon, 0)
                    end
                    wait(_G.QuyHub.FarmSpeed or 0.2)
                end
            end)
        else
            Notify("Quy Hub", T("farm_toggle_off"), 3, "⏹️")
        end
    end,
})

FarmTab:CreateDropdown({
    Name = T("farm_mode_label"),
    Options = {"Melee", "Sword", "Fruit"},
    CurrentOption = {"Melee"},
    Flag = "FarmMode",
    Callback = function(o) _G.QuyHub.FarmMode = o end
})

FarmTab:CreateDropdown({
    Name = T("farm_target_label"),
    Options = {"All", "Bandit", "Pirate", "Marine", "Gorilla", "Yeti", "Dragon"},
    CurrentOption = {"All"},
    Flag = "FarmTarget",
    Callback = function(o) _G.QuyHub.FarmTarget = o end
})

FarmTab:CreateSlider({
    Name = T("farm_range_label"),
    Range = {5, 60},
    Increment = 1,
    Suffix = "m",
    CurrentValue = 20,
    Flag = "FarmRange",
    Callback = function(v) _G.QuyHub.FarmRange = v end
})

FarmTab:CreateSlider({
    Name = T("farm_speed_label"),
    Range = {0.05, 1},
    Increment = 0.05,
    Suffix = "s",
    CurrentValue = 0.2,
    Flag = "FarmSpeed",
    Callback = function(v) _G.QuyHub.FarmSpeed = v end
})

FarmTab:CreateSection(T("farm_boss_section"))
FarmTab:CreateToggle({
    Name = T("farm_boss_toggle"),
    CurrentValue = false,
    Flag = "FarmBoss",
    Callback = function(Value)
        if not _G.QuyHub.Unlocked then Notify("Quy Hub", T("notify_unlock_warning"), 3, "⚠️") return end
        _G.QuyHub.FarmBoss = Value
        if Value then
            Notify("Quy Hub", T("farm_boss_on"), 3, "👹")
            spawn(function()
                while _G.QuyHub.FarmBoss do
                    local root = GetHumanoidRootPart()
                    if not root then wait(1) continue end
                    local nearest, minDist = nil, _G.QuyHub.FarmBossRange or 30
                    local enemies = game:GetService("Workspace"):FindFirstChild("Enemies")
                    if enemies then
                        for _, v in pairs(enemies:GetChildren()) do
                            if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                local name = v.Name
                                if name:find("Boss") or name:find("King") or name:find("Yeti") or name:find("Dragon") then
                                    local dist = (root.Position - v.HumanoidRootPart.Position).Magnitude
                                    if dist < minDist then
                                        nearest = v
                                        minDist = dist
                                    end
                                end
                            end
                        end
                    end
                    if nearest then
                        root.CFrame = nearest.HumanoidRootPart.CFrame * CFrame.new(0, 0, -6)
                        wait(0.2)
                        game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, game:GetService("UserInputService").MouseIcon, 0)
                        wait(0.05)
                        game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, false, game:GetService("UserInputService").MouseIcon, 0)
                    end
                    wait(0.3)
                end
            end)
        else
            Notify("Quy Hub", T("farm_boss_off"), 3, "⏹️")
        end
    end,
})

FarmTab:CreateSlider({
    Name = T("farm_boss_range"),
    Range = {10, 60},
    Increment = 1,
    Suffix = "m",
    CurrentValue = 30,
    Flag = "FarmBossRange",
    Callback = function(v) _G.QuyHub.FarmBossRange = v end
})

-- ============================ 12. TAB COLLECT ============================
local CollectTab = Window:CreateTab(T("collect_tab"), nil)
CollectTab:CreateSection(T("collect_section"))

CollectTab:CreateToggle({
    Name = T("collect_fruit_toggle"),
    CurrentValue = false,
    Flag = "CollectFruits",
    Callback = function(Value)
        if not _G.QuyHub.Unlocked then Notify("Quy Hub", T("notify_unlock_warning"), 3, "⚠️") return end
        _G.QuyHub.AutoCollectFruits = Value
        if Value then
            Notify("Quy Hub", T("collect_fruit_on"), 3, "🍎")
            spawn(function()
                while _G.QuyHub.AutoCollectFruits do
                    local root = GetHumanoidRootPart()
                    if not root then wait(1) continue end
                    for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
                        if v:IsA("Tool") and v:FindFirstChild("Handle") and (v.Name:find("Fruit") or v.Name:find("fruit")) then
                            local dist = (root.Position - v.Handle.Position).Magnitude
                            if dist < (_G.QuyHub.CollectRange or 30) then
                                root.CFrame = v.Handle.CFrame
                                wait(0.2)
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                                wait(0.1)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
                            end
                        end
                    end
                    wait(1)
                end
            end)
        else
            Notify("Quy Hub", T("collect_fruit_off"), 3, "⏹️")
        end
    end,
})

CollectTab:CreateToggle({
    Name = T("collect_items_toggle"),
    CurrentValue = false,
    Flag = "CollectItems",
    Callback = function(Value)
        if not _G.QuyHub.Unlocked then Notify("Quy Hub", T("notify_unlock_warning"), 3, "⚠️") return end
        _G.QuyHub.AutoCollectItems = Value
        if Value then
            Notify("Quy Hub", T("collect_items_on"), 3, "📦")
            spawn(function()
                while _G.QuyHub.AutoCollectItems do
                    local root = GetHumanoidRootPart()
                    if not root then wait(1) continue end
                    for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
                        if v:IsA("Tool") and v:FindFirstChild("Handle") and (v.Name:find("Chest") or v.Name:find("Drop") or v.Name:find("Potion") or v.Name:find("Gold")) then
                            local dist = (root.Position - v.Handle.Position).Magnitude
                            if dist < (_G.QuyHub.CollectRange or 30) then
                                root.CFrame = v.Handle.CFrame
                                wait(0.2)
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                                wait(0.1)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
                            end
                        end
                    end
                    wait(1)
                end
            end)
        else
            Notify("Quy Hub", T("collect_items_off"), 3, "⏹️")
        end
    end,
})

CollectTab:CreateSlider({
    Name = T("collect_range"),
    Range = {5, 50},
    Increment = 1,
    Suffix = "m",
    CurrentValue = 30,
    Flag = "CollectRange",
    Callback = function(v) _G.QuyHub.CollectRange = v end
})

-- ============================ 13. TAB RAID & SEA ============================
local RaidTab = Window:CreateTab(T("raid_tab"), nil)
RaidTab:CreateSection(T("raid_section"))

RaidTab:CreateToggle({
    Name = T("raid_toggle"),
    CurrentValue = false,
    Flag = "AutoRaid",
    Callback = function(Value)
        if not _G.QuyHub.Unlocked then Notify("Quy Hub", T("notify_unlock_warning"), 3, "⚠️") return end
        _G.QuyHub.AutoRaid = Value
        if Value then
            Notify("Quy Hub", T("raid_on"), 3, "🌀")
            spawn(function()
                while _G.QuyHub.AutoRaid do
                    TeleportTo(Vector3.new(2700, 120, -2000))
                    wait(2)
                    for i = 1, 30 do
                        local root = GetHumanoidRootPart()
                        if not root then break end
                        local enemies = game:GetService("Workspace"):FindFirstChild("Enemies")
                        if enemies then
                            for _, v in pairs(enemies:GetChildren()) do
                                if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                    root.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5)
                                    wait(0.1)
                                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, game:GetService("UserInputService").MouseIcon, 0)
                                    wait(0.05)
                                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, false, game:GetService("UserInputService").MouseIcon, 0)
                                    break
                                end
                            end
                        end
                        wait(0.2)
                    end
                    wait(5)
                end
            end)
        else
            Notify("Quy Hub", T("raid_off"), 3, "⏹️")
        end
    end,
})

RaidTab:CreateButton({
    Name = T("raid_teleport"),
    Callback = function()
        TeleportTo(Vector3.new(2700, 120, -2000))
        Notify("Quy Hub", T("raid_teleport_ok"), 3, "📍")
    end,
})

RaidTab:CreateSection(T("sea_section"))
RaidTab:CreateToggle({
    Name = T("sea_toggle"),
    CurrentValue = false,
    Flag = "AutoSeaBeast",
    Callback = function(Value)
        if not _G.QuyHub.Unlocked then Notify("Quy Hub", T("notify_unlock_warning"), 3, "⚠️") return end
        _G.QuyHub.AutoSeaBeast = Value
        if Value then
            Notify("Quy Hub", T("sea_on"), 3, "🐉")
            spawn(function()
                while _G.QuyHub.AutoSeaBeast do
                    local root = GetHumanoidRootPart()
                    if not root then wait(1) continue end
                    local seaBeast = nil
                    for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
                        if v:IsA("Model") and (v.Name:find("Sea") or v.Name:find("Beast") or v.Name:find("Kraken")) and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                            seaBeast = v
                            break
                        end
                    end
                    if seaBeast then
                        root.CFrame = seaBeast.HumanoidRootPart.CFrame * CFrame.new(0, 20, -15)
                        wait(0.5)
                        game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, game:GetService("UserInputService").MouseIcon, 0)
                        wait(0.05)
                        game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, false, game:GetService("UserInputService").MouseIcon, 0)
                    else
                        TeleportTo(Vector3.new(5000, 0, 3000))
                        wait(2)
                    end
                    wait(2)
                end
            end)
        else
            Notify("Quy Hub", T("sea_off"), 3, "⏹️")
        end
    end,
})

RaidTab:CreateButton({
    Name = T("sea_teleport"),
    Callback = function()
        TeleportTo(Vector3.new(5000, 0, 0))
        Notify("Quy Hub", T("sea_teleport_ok"), 2, "🌊")
    end,
})

-- ============================ 14. TAB TELEPORT ============================
local TeleportTab = Window:CreateTab(T("tele_tab"), nil)
TeleportTab:CreateSection(T("tele_section"))

local islands = {
    {"Đảo Khởi Đầu", Vector3.new(0, 100, 0)},
    {"Làng Hải Tặc", Vector3.new(1000, 50, 200)},
    {"Jungle", Vector3.new(-800, 80, -500)},
    {"Trung tâm", Vector3.new(2000, 100, 1500)},
    {"Đảo Băng", Vector3.new(-1500, 120, 1000)},
    {"Đảo Lửa", Vector3.new(2500, 150, -1000)},
    {"Vương Quốc", Vector3.new(3500, 200, 0)},
    {"Đảo Rồng", Vector3.new(-3000, 250, 2000)},
    {"Đảo Quái Vật", Vector3.new(4000, 300, -2000)},
    {"Đảo Biển", Vector3.new(5000, 0, 0)},
}

for _, island in ipairs(islands) do
    TeleportTab:CreateButton({
        Name = "📍 " .. island[1],
        Callback = function()
            TeleportTo(island[2])
            Notify("Quy Hub", T("tele_ok") .. island[1], 3, "📍")
        end,
    })
end

TeleportTab:CreateSection(T("tele_custom"))
TeleportTab:CreateTextBox({
    Name = "X",
    PlaceholderText = "0",
    CurrentValue = "0",
    Flag = "TeleX",
    Callback = function(t) _G.QuyHub.TeleX = tonumber(t) or 0 end
})
TeleportTab:CreateTextBox({
    Name = "Y",
    PlaceholderText = "0",
    CurrentValue = "0",
    Flag = "TeleY",
    Callback = function(t) _G.QuyHub.TeleY = tonumber(t) or 0 end
})
TeleportTab:CreateTextBox({
    Name = "Z",
    PlaceholderText = "0",
    CurrentValue = "0",
    Flag = "TeleZ",
    Callback = function(t) _G.QuyHub.TeleZ = tonumber(t) or 0 end
})
TeleportTab:CreateButton({
    Name = T("tele_button"),
    Callback = function()
        local x = _G.QuyHub.TeleX or 0
        local y = _G.QuyHub.TeleY or 0
        local z = _G.QuyHub.TeleZ or 0
        TeleportTo(Vector3.new(x, y, z))
        Notify("Quy Hub", T("tele_custom_ok") .. x .. ", " .. y .. ", " .. z .. ")", 3, "🚀")
    end,
})

-- ============================ 15. TAB PREMIUM ============================
local PremiumTab = Window:CreateTab(T("premium_tab"), nil)
PremiumTab.Visible = _G.QuyHub.Premium

PremiumTab:CreateSection(T("premium_section"))
PremiumTab:CreateParagraph({
    Title = T("premium_welcome"),
    Content = T("premium_desc"),
})

PremiumTab:CreateToggle({
    Name = T("premium_hop"),
    CurrentValue = false,
    Flag = "HopServer",
    Callback = function(Value)
        if not _G.QuyHub.Premium then Notify("Quy Hub", T("notify_premium_warning"), 3, "⚠️") return end
        _G.QuyHub.HopServer = Value
        if Value then
            Notify("Quy Hub Premium", T("premium_hop_on"), 3, "🔄")
            spawn(function()
                while _G.QuyHub.HopServer do
                    local hasFruit = false
                    for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
                        if v:IsA("Tool") and v:FindFirstChild("Handle") and (v.Name:find("Fruit") or v.Name:find("fruit")) then
                            hasFruit = true
                            break
                        end
                    end
                    if not hasFruit then
                        Notify("Quy Hub Premium", T("premium_hop_no_fruit"), 2, "🔄")
                        game:GetService("TeleportService"):Teleport(game.PlaceId)
                        wait(5)
                    else
                        wait(10)
                    end
                    wait(5)
                end
            end)
        else
            Notify("Quy Hub Premium", T("premium_hop_off"), 3, "⏹️")
        end
    end,
})

PremiumTab:CreateToggle({
    Name = T("premium_loot"),
    CurrentValue = false,
    Flag = "AutoLootFruit",
    Callback = function(Value)
        if not _G.QuyHub.Premium then Notify("Quy Hub", T("notify_premium_warning"), 3, "⚠️") return end
        _G.QuyHub.AutoLootFruit = Value
        if Value then
            Notify("Quy Hub Premium", T("premium_loot_on"), 3, "🍎")
            spawn(function()
                while _G.QuyHub.AutoLootFruit do
                    local root = GetHumanoidRootPart()
                    if not root then wait(1) continue end
                    local nearest = nil
                    local minDist = 500
                    for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
                        if v:IsA("Tool") and v:FindFirstChild("Handle") and (v.Name:find("Fruit") or v.Name:find("fruit")) then
                            local dist = (root.Position - v.Handle.Position).Magnitude
                            if dist < minDist then
                                nearest = v
                                minDist = dist
                            end
                        end
                    end
                    if nearest then
                        root.CFrame = nearest.Handle.CFrame
                        wait(0.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                        wait(0.1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
                    end
                    wait(1)
                end
            end)
        else
            Notify("Quy Hub Premium", T("premium_loot_off"), 3, "⏹️")
        end
    end,
})

PremiumTab:CreateToggle({
    Name = T("premium_hop_loot"),
    CurrentValue = false,
    Flag = "HopServerFruit",
    Callback = function(Value)
        if not _G.QuyHub.Premium then Notify("Quy Hub", T("notify_premium_warning"), 3, "⚠️") return end
        _G.QuyHub.HopServerFruit = Value
        if Value then
            Notify("Quy Hub Premium", T("premium_hop_loot_on"), 3, "🔄🍎")
            spawn(function()
                while _G.QuyHub.HopServerFruit do
                    local root = GetHumanoidRootPart()
                    if not root then wait(1) continue end
                    local nearest = nil
                    local minDist = 500
                    for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
                        if v:IsA("Tool") and v:FindFirstChild("Handle") and (v.Name:find("Fruit") or v.Name:find("fruit")) then
                            local dist = (root.Position - v.Handle.Position).Magnitude
                            if dist < minDist then
                                nearest = v
                                minDist = dist
                            end
                        end
                    end
                    if nearest then
                        root.CFrame = nearest.Handle.CFrame
                        wait(0.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                        wait(0.1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
                    else
                        Notify("Quy Hub Premium", T("premium_hop_no_fruit"), 2, "🔄")
                        game:GetService("TeleportService"):Teleport(game.PlaceId)
                        wait(5)
                    end
                    wait(2)
                end
            end)
        else
            Notify("Quy Hub Premium", T("premium_hop_loot_off"), 3, "⏹️")
        end
    end,
})

PremiumTab:CreateToggle({
    Name = T("premium_farm_fruit"),
    CurrentValue = false,
    Flag = "AutoFarmFruit",
    Callback = function(Value)
        if not _G.QuyHub.Premium then Notify("Quy Hub", T("notify_premium_warning"), 3, "⚠️") return end
        _G.QuyHub.AutoFarmFruit = Value
        if Value then
            Notify("Quy Hub Premium", T("premium_farm_fruit_on"), 3, "🌳")
            spawn(function()
                while _G.QuyHub.AutoFarmFruit do
                    Notify("Quy Hub Premium", T("premium_farming"), 2, "🌳")
                    wait(10)
                end
            end)
        else
            Notify("Quy Hub Premium", T("premium_farm_fruit_off"), 3, "⏹️")
        end
    end,
})

-- ============================ 16. TAB MISC ============================
local MiscTab = Window:CreateTab(T("misc_tab"), nil)

MiscTab:CreateSection("✈️ " .. T("misc_fly"))
MiscTab:CreateToggle({
    Name = T("misc_fly"),
    CurrentValue = false,
    Flag = "Fly",
    Callback = function(Value)
        if not _G.QuyHub.Unlocked then Notify("Quy Hub", T("notify_unlock_warning"), 3, "⚠️") return end
        _G.QuyHub.Fly = Value
        local root = GetHumanoidRootPart()
        local h = GetHumanoid()
        if not root or not h then return end
        if Value then
            local bv = Instance.new("BodyVelocity")
            bv.MaxForce = Vector3.new(1e9, 1e9, 1e9)
            bv.Velocity = Vector3.new(0, _G.QuyHub.FlySpeed or 50, 0)
            bv.Parent = root
            h.PlatformStand = true
            Notify("Quy Hub", T("misc_fly_on"), 2, "✈️")
        else
            for _, v in pairs(root:GetChildren()) do
                if v:IsA("BodyVelocity") then v:Destroy() end
            end
            h.PlatformStand = false
            Notify("Quy Hub", T("misc_fly_off"), 2, "⏹️")
        end
    end,
})
MiscTab:CreateSlider({
    Name = T("misc_fly_speed"),
    Range = {20, 200},
    Increment = 5,
    Suffix = "speed",
    CurrentValue = 50,
    Flag = "FlySpeed",
    Callback = function(v)
        _G.QuyHub.FlySpeed = v
        if _G.QuyHub.Fly then
            local root = GetHumanoidRootPart()
            if root then
                for _, bv in pairs(root:GetChildren()) do
                    if bv:IsA("BodyVelocity") then
                        bv.Velocity = Vector3.new(0, v, 0)
                    end
                end
            end
        end
    end,
})

MiscTab:CreateSection("🚧 " .. T("misc_noclip"))
MiscTab:CreateToggle({
    Name = T("misc_noclip"),
    CurrentValue = false,
    Flag = "NoClip",
    Callback = function(Value)
        if not _G.QuyHub.Unlocked then Notify("Quy Hub", T("notify_unlock_warning"), 3, "⚠️") return end
        _G.QuyHub.NoClip = Value
        local root = GetHumanoidRootPart()
        if root then root.CanCollide = not Value end
        Notify("Quy Hub", Value and T("misc_noclip_on") or T("misc_noclip_off"), 2, "🚧")
    end,
})

MiscTab:CreateSection("🏃 " .. T("misc_speed"))
MiscTab:CreateSlider({
    Name = T("misc_speed"),
    Range = {16, 500},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "Speed",
    Callback = function(v)
        _G.QuyHub.Speed = v
        local h = GetHumanoid()
        if h then h.WalkSpeed = v end
    end,
})

MiscTab:CreateSlider({
    Name = T("misc_jump"),
    Range = {50, 800},
    Increment = 5,
    Suffix = "JP",
    CurrentValue = 50,
    Flag = "JumpPower",
    Callback = function(v)
        _G.QuyHub.JumpPower = v
        local h = GetHumanoid()
        if h then h.JumpPower = v end
    end,
})

MiscTab:CreateSection("👁️ " .. T("misc_esp"))
MiscTab:CreateToggle({
    Name = T("misc_esp"),
    CurrentValue = false,
    Flag = "ESP",
    Callback = function(Value)
        if not _G.QuyHub.Unlocked then Notify("Quy Hub", T("notify_unlock_warning"), 3, "⚠️") return end
        _G.QuyHub.ESP = Value
        Notify("Quy Hub", Value and T("misc_esp_on") or T("misc_esp_off"), 2, "👁️")
    end,
})

MiscTab:CreateSection("🛡️ " .. T("misc_antiafk"))
MiscTab:CreateToggle({
    Name = T("misc_antiafk"),
    CurrentValue = false,
    Flag = "AntiAFK",
    Callback = function(Value)
        if not _G.QuyHub.Unlocked then Notify("Quy Hub", T("notify_unlock_warning"), 3, "⚠️") return end
        _G.QuyHub.AntiAFK = Value
        if Value then
            local vu = game:GetService("VirtualUser")
            game:GetService("Players").LocalPlayer.Idled:Connect(function()
                vu:CaptureController()
                vu:ClickButton2(Vector2.new())
            end)
            Notify("Quy Hub", T("misc_antiafk_on"), 2, "⏰")
        else
            Notify("Quy Hub", T("misc_antiafk_off"), 2, "⏹️")
        end
    end,
})

MiscTab:CreateToggle({
    Name = T("misc_heal"),
    CurrentValue = false,
    Flag = "AutoHeal",
    Callback = function(Value)
        if not _G.QuyHub.Unlocked then Notify("Quy Hub", T("notify_unlock_warning"), 3, "⚠️") return end
        _G.QuyHub.AutoHeal = Value
        Notify("Quy Hub", Value and T("misc_heal_on") or T("misc_heal_off"), 2, "💊")
    end,
})
MiscTab:CreateSlider({
    Name = T("misc_heal_threshold"),
    Range = {10, 80},
    Increment = 5,
    Suffix = "%",
    CurrentValue = 30,
    Flag = "HealThreshold",
    Callback = function(v) _G.QuyHub.HealThreshold = v / 100 end
})

MiscTab:CreateToggle({
    Name = T("misc_rejoin"),
    CurrentValue = false,
    Flag = "AutoRejoin",
    Callback = function(Value)
        if not _G.QuyHub.Unlocked then Notify("Quy Hub", T("notify_unlock_warning"), 3, "⚠️") return end
        _G.QuyHub.AutoRejoin = Value
        if Value then
            Notify("Quy Hub", T("misc_rejoin_on"), 2, "🔄")
            game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(state)
                if state == Enum.TeleportState.Teleporting then
                    wait(10)
                    game:GetService("TeleportService"):Teleport(game.PlaceId)
                end
            end)
        else
            Notify("Quy Hub", T("misc_rejoin_off"), 2, "⏹️")
        end
    end,
})

-- ============================ 17. TAB SETTINGS ============================
local SettingsTab = Window:CreateTab(T("settings_tab"), nil)

SettingsTab:CreateSection("🔧 " .. T("settings_tab"))
SettingsTab:CreateButton({
    Name = T("settings_reset"),
    Callback = function()
        if not _G.QuyHub.Unlocked then Notify("Quy Hub", T("notify_unlock_warning"), 3, "⚠️") return end
        _G.QuyHub.Farm = false
        _G.QuyHub.FarmBoss = false
        _G.QuyHub.AutoCollectFruits = false
        _G.QuyHub.AutoCollectItems = false
        _G.QuyHub.AutoRaid = false
        _G.QuyHub.AutoSeaBeast = false
        _G.QuyHub.Fly = false
        _G.QuyHub.NoClip = false
        _G.QuyHub.ESP = false
        _G.QuyHub.AntiAFK = false
        _G.QuyHub.AutoHeal = false
        _G.QuyHub.AutoRejoin = false
        _G.QuyHub.HopServer = false
        _G.QuyHub.HopServerFruit = false
        _G.QuyHub.AutoLootFruit = false
        _G.QuyHub.AutoFarmFruit = false
        local h = GetHumanoid()
        local r = GetHumanoidRootPart()
        if h then
            h.WalkSpeed = 16
            h.JumpPower = 50
            h.PlatformStand = false
        end
        if r then
            r.CanCollide = true
            for _, v in pairs(r:GetChildren()) do
                if v:IsA("BodyVelocity") then v:Destroy() end
            end
        end
        Notify("Quy Hub", T("settings_reset_ok"), 3, "✅")
    end,
})

SettingsTab:CreateParagraph({
    Title = T("settings_info"),
    Content = "Quy Hub Ultimate v11.5\nTác giả: Quy\n🔑 Key chính: 23za3a\n   Link: " .. KeyConfig.MainLink .. "\n👑 Key Premium: 9213\n   Link: " .. KeyConfig.PremiumLink .. "\n⏰ Premium có hiệu lực 5h\n🌐 Hỗ trợ tiếng Việt & English",
})

-- ============================ 18. KHỞI ĐỘNG ============================
Notify("Quy Hub Ultimate", T("notify_startup"), 5, "🚀")
print("✅ Quy Hub Ultimate v11.5 đã chạy!")
print("🔑 Key chính: 23za3a")
print("👑 Key Premium: 9213")
print("📥 Link chính: " .. KeyConfig.MainLink)
print("📥 Link Premium: " .. KeyConfig.PremiumLink)

-- Cập nhật thông tin định kỳ
spawn(function()
    while true do
        wait(30)
        UpdateInfo()
        if _G.QuyHub.Premium and not PremiumTab.Visible then
            PremiumTab.Visible = true
        end
        if _G.QuyHub.Unlocked and not LanguageTab.Visible then
            LanguageTab.Visible = true
        end
    end
end)

-- Auto Heal nền
spawn(function()
    while true do
        if _G.QuyHub.Unlocked and _G.QuyHub.AutoHeal then
            local h = GetHumanoid()
            if h and h.Health / h.MaxHealth < _G.QuyHub.HealThreshold then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "5", false, game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, "5", false, game)
            end
        end
        wait(1)
    end
end)

-- ============================ KẾT THÚC ============================
