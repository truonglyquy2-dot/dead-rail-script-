-- ==========================================================================================
--                              QUY HUB V2 – BLOX FRUITS
--                     Key System chuẩn: 2 nút Get Key + ô nhập
--                     🔑 Key: 23za3a (chính) | 9213 (Premium)
--                     🎯 Code: quy (mở tab Fruits, Raid, Misc)
--                     Tác giả: Quy
-- ==========================================================================================

-- ============================ 1. TẢI RAYFIELD ============================
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- ============================ 2. CẤU HÌNH ============================
local KeyConfig = {
    MainLink = "https://link4sub.com/XFwyhwt2zw",
    PremiumLink = "https://link4sub.com/8paBqdaAu2",
    ValidKeys = {"23za3a", "9213"},
    PremiumKey = "9213",
    SaveKey = true,
    FileName = "QuyHubKey.txt",
}

local UnlockCode = "quy"
local UnlockedTabs = {Fruits = false, Raid = false, Misc = false}
local MainWindow = nil

-- ============================ 3. BIẾN TOÀN CỤ ============================
_G.QuyHub = {
    Unlocked = false,
    Premium = false,
    Key = "",
    -- Các biến tính năng...
    Farm = false, FarmMode = "Melee", FarmTarget = "All", FarmRange = 20, FarmSpeed = 0.2,
    AutoCollectFruits = false, AutoCollectItems = false, CollectRange = 30,
    AutoRaid = false, AutoSeaBeast = false,
    HopServer = false, HopServerFruit = false, AutoLootFruit = false,
    Fly = false, FlySpeed = 50, NoClip = false, Speed = 16, JumpPower = 50,
    ESP = false, AntiAFK = false, AutoHeal = false, HealThreshold = 0.3,
    AutoRejoin = false,
}

-- ============================ 4. HÀM TIỆN ÍCH ============================
local function Notify(title, content, duration, icon)
    Rayfield:Notify({Title = title, Content = content, Duration = duration or 3, Icon = icon})
end

local function GetPlayer() return game.Players.LocalPlayer end
local function GetCharacter() return GetPlayer().Character end
local function GetHumanoid() local c = GetCharacter() return c and c:FindFirstChildOfClass("Humanoid") end
local function GetHumanoidRootPart() local c = GetCharacter() return c and c:FindFirstChild("HumanoidRootPart") end

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

-- ============================ 5. XÁC THỰC KEY ============================
local function ValidateKey(key)
    for _, v in ipairs(KeyConfig.ValidKeys) do
        if v == key then return true end
    end
    return false
end

local function IsPremiumKey(key) return key == KeyConfig.PremiumKey end

local function UnlockFeatures(key)
    _G.QuyHub.Unlocked = true
    if IsPremiumKey(key) then
        _G.QuyHub.Premium = true
        Notify("Quy Hub Premium", "👑 Premium Key 9213! Tab Premium đã mở!", 5, "👑")
    else
        Notify("Quy Hub", "✅ Key hợp lệ! Chào mừng bạn!", 5, "🎉")
    end
    if KeyWindow then KeyWindow:Destroy() end
    CreateMainWindow()
end

-- ============================ 6. CỬA SỔ KEY SYSTEM ============================
local KeyWindow = Rayfield:CreateWindow({
    Name = "Quy Hub V2",
    LoadingTitle = "⚡ Quy Hub V2 ⚡",
    LoadingSubtitle = "Key System | by Quy",
    ConfigurationSaving = {Enabled = false},
    Discord = {Enabled = true, Invite = "quyhub", RememberJoins = true},
    KeySystem = false,
})

local KeyTab = KeyWindow:CreateTab("Key System", nil)
KeyTab:CreateParagraph({Title = "⚡ Quy Hub V2", Content = "Blox Fruits | Premium Script"})

-- ===== HÀNG NÚT GET KEY (2 nút) =====
KeyTab:CreateSection("📋 Get Your Key")

-- Nút 1: Lấy key chính (23za3a)
KeyTab:CreateButton({
    Name = "🔑 Get License Key (23za3a)",
    Callback = function()
        setclipboard(KeyConfig.MainLink)
        Notify("Quy Hub", "✅ Đã copy link lấy key chính!\nMở trình duyệt, hoàn thành task để nhận key.", 4, "📋")
    end,
})

-- Nút 2: Lấy key Premium (9213)
KeyTab:CreateButton({
    Name = "👑 Get Premium Key (9213)",
    Callback = function()
        setclipboard(KeyConfig.PremiumLink)
        Notify("Quy Hub Premium", "✅ Đã copy link lấy key Premium!\nMở trình duyệt, hoàn thành task để nhận key.", 4, "📋")
    end,
})

-- ===== Ô NHẬP KEY + REDEEM =====
KeyTab:CreateSection("🔑 Enter Key")

local KeyInput = KeyTab:CreateTextBox({
    Name = "Enter your key...",
    PlaceholderText = "Paste key here (23za3a / 9213)",
    CurrentValue = "",
    Flag = "MainKey",
    Callback = function(Text)
        _G.QuyHub.TempKey = Text
    end,
})

KeyTab:CreateButton({
    Name = "🎯 Redeem Key",
    Callback = function()
        local key = KeyTab.Flags.MainKey or ""
        if ValidateKey(key) then
            _G.QuyHub.Key = key
            if KeyConfig.SaveKey then SaveKey(key) end
            UnlockFeatures(key)
            KeyTab.Flags.MainKey = ""  -- Xóa ô nhập
            _G.QuyHub.TempKey = ""
        else
            Notify("Quy Hub", "❌ Key không hợp lệ! Vui lòng kiểm tra lại.", 3, "❌")
        end
    end,
})

-- ===== UNLOCK CODE (quy) =====
KeyTab:CreateSection("🎯 Unlock Code (Fruits, Raid, Misc)")

local CodeInput = KeyTab:CreateTextBox({
    Name = "Enter unlock code...",
    PlaceholderText = "Enter code (quy)...",
    CurrentValue = "",
    Flag = "UnlockCode",
    Callback = function(Text) _G.QuyHub.TempCode = Text end,
})

KeyTab:CreateButton({
    Name = "🔓 Redeem Code",
    Callback = function()
        local code = KeyTab.Flags.UnlockCode or ""
        if code == UnlockCode then
            UnlockedTabs.Fruits = true
            UnlockedTabs.Raid = true
            UnlockedTabs.Misc = true
            Notify("Quy Hub", "✅ Code hợp lệ! Các tab Fruits, Raid, Misc đã mở!", 4, "🔓")
            KeyTab.Flags.UnlockCode = ""
            _G.QuyHub.TempCode = ""
            if MainWindow then
                if MainWindow.Tabs and MainWindow.Tabs["🍎 Fruits"] then MainWindow.Tabs["🍎 Fruits"].Visible = true end
                if MainWindow.Tabs and MainWindow.Tabs["🌊 Raid & Sea"] then MainWindow.Tabs["🌊 Raid & Sea"].Visible = true end
                if MainWindow.Tabs and MainWindow.Tabs["🛠️ Misc"] then MainWindow.Tabs["🛠️ Misc"].Visible = true end
            end
        else
            Notify("Quy Hub", "❌ Code không hợp lệ! Vui lòng thử lại.", 3, "❌")
        end
    end,
})

-- ===== BADGES & DISCORD =====
KeyTab:CreateSection("📌 Get Key From")
KeyTab:CreateParagraph({Title = "🔗 Linkvertise", Content = "👉 " .. KeyConfig.MainLink})
KeyTab:CreateParagraph({Title = "🔗 LootLabs", Content = "👉 " .. KeyConfig.PremiumLink})
KeyTab:CreateParagraph({Title = "🔗 Workink", Content = "👉 " .. KeyConfig.MainLink})

KeyTab:CreateSection("💬 Need Support?")
KeyTab:CreateButton({
    Name = "💬 Join Discord",
    Callback = function()
        setclipboard("https://discord.gg/quyhub")
        Notify("Quy Hub", "✅ Đã copy link Discord!", 3, "📋")
    end,
})

-- ============================ 7. MAIN WINDOW ============================
function CreateMainWindow()
    if MainWindow then return end
    MainWindow = Rayfield:CreateWindow({
        Name = "Quy Hub V2 - Main",
        LoadingTitle = "⚡ Quy Hub V2 ⚡",
        LoadingSubtitle = "by Quy | Blox Fruits",
        ConfigurationSaving = {Enabled = true, FileName = "QuyHubConfig"},
        Discord = {Enabled = true, Invite = "quyhub", RememberJoins = true},
        KeySystem = false,
    })

    -- TAB HOME
    local HomeTab = MainWindow:CreateTab("🏠 Home", nil)
    HomeTab:CreateSection("👤 Player Info")
    local PlayerInfo = HomeTab:CreateParagraph({Title = "📊 Thông tin", Content = "Loading..."})
    local function UpdateInfo()
        local p = GetPlayer()
        if not p then return end
        local lv = p.Data and p.Data.Level and p.Data.Level.Value or "?"
        local fruit = p.Data and p.Data.Fruit and p.Data.Fruit.Value or "Không"
        local beli = p.Data and p.Data.Beli and p.Data.Beli.Value or "?"
        local frag = p.Data and p.Data.Fragments and p.Data.Fragments.Value or "?"
        PlayerInfo:SetContent("👤 Tên: " .. p.Name .. "\n📈 Level: " .. lv .. "\n🍎 Fruit: " .. fruit .. "\n💰 Beli: " .. beli .. "\n💎 Fragments: " .. frag)
    end
    UpdateInfo()
    HomeTab:CreateButton({Name = "🔄 Refresh", Callback = UpdateInfo})
    HomeTab:CreateButton({Name = "💀 Respawn", Callback = function() GetPlayer():LoadCharacter() end})
    HomeTab:CreateButton({Name = "📍 Về đảo khởi đầu", Callback = function() TeleportTo(Vector3.new(0, 100, 0)) end})

    -- TAB FARM
    local FarmTab = MainWindow:CreateTab("⚔️ Farm", nil)
    FarmTab:CreateSection("🔥 Auto Farm")
    FarmTab:CreateToggle({
        Name = "🔥 Auto Farm",
        CurrentValue = false,
        Flag = "Farm",
        Callback = function(v)
            _G.QuyHub.Farm = v
            if v then Notify("Quy Hub", "Bắt đầu Farm!", 3, "⚔️")
                spawn(function()
                    while _G.QuyHub.Farm do
                        local root = GetHumanoidRootPart()
                        if not root then wait(1) continue end
                        local nearest, minDist = nil, 20
                        local enemies = game:GetService("Workspace"):FindFirstChild("Enemies")
                        if enemies then
                            for _, e in pairs(enemies:GetChildren()) do
                                if e:FindFirstChild("Humanoid") and e.Humanoid.Health > 0 then
                                    local d = (root.Position - e.HumanoidRootPart.Position).Magnitude
                                    if d < minDist then nearest = e; minDist = d end
                                end
                            end
                        end
                        if nearest then
                            root.CFrame = nearest.HumanoidRootPart.CFrame * CFrame.new(0,0,-4)
                            wait(0.1)
                            game:GetService("VirtualInputManager"):SendMouseButtonEvent(0,0,0,true,game:GetService("UserInputService").MouseIcon,0)
                            wait(0.05)
                            game:GetService("VirtualInputManager"):SendMouseButtonEvent(0,0,0,false,game:GetService("UserInputService").MouseIcon,0)
                        end
                        wait(0.2)
                    end
                end)
            else Notify("Quy Hub", "Tắt Farm!", 3, "⏹️") end
        end
    })
    FarmTab:CreateDropdown({Name = "⚡ Chế độ", Options = {"Melee","Sword","Fruit"}, CurrentOption={"Melee"}, Flag="FarmMode", Callback=function(o) _G.QuyHub.FarmMode=o end})
    FarmTab:CreateDropdown({Name = "🎯 Loại quái", Options={"All","Bandit","Pirate","Marine","Gorilla","Yeti","Dragon"}, CurrentOption={"All"}, Flag="FarmTarget", Callback=function(o) _G.QuyHub.FarmTarget=o end})
    FarmTab:CreateSlider({Name = "📏 Khoảng cách", Range={5,60}, Increment=1, Suffix="m", CurrentValue=20, Flag="FarmRange", Callback=function(v) _G.QuyHub.FarmRange=v end})
    FarmTab:CreateSlider({Name = "⏱️ Tốc độ", Range={0.05,1}, Increment=0.05, Suffix="s", CurrentValue=0.2, Flag="FarmSpeed", Callback=function(v) _G.QuyHub.FarmSpeed=v end})

    -- TAB COLLECT
    local CollectTab = MainWindow:CreateTab("📦 Collect", nil)
    CollectTab:CreateSection("📦 Auto Collect")
    CollectTab:CreateToggle({Name = "🍎 Auto Collect Fruits", CurrentValue=false, Flag="CollectFruits", Callback=function(v)
        _G.QuyHub.AutoCollectFruits = v
        if v then Notify("Quy Hub", "Bắt đầu nhặt Fruit!", 3, "🍎")
            spawn(function() while _G.QuyHub.AutoCollectFruits do
                local root = GetHumanoidRootPart()
                if not root then wait(1) continue end
                for _, obj in pairs(game:GetService("Workspace"):GetDescendants()) do
                    if obj:IsA("Tool") and obj:FindFirstChild("Handle") and (obj.Name:find("Fruit") or obj.Name:find("fruit")) then
                        local d = (root.Position - obj.Handle.Position).Magnitude
                        if d < 30 then
                            root.CFrame = obj.Handle.CFrame
                            wait(0.2)
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,"E",false,game)
                            wait(0.1)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,"E",false,game)
                        end
                    end
                end
                wait(1)
            end end)
        else Notify("Quy Hub", "Tắt Collect Fruit!", 3, "⏹️") end
    end})
    CollectTab:CreateSlider({Name = "📏 Khoảng cách", Range={5,50}, Increment=1, Suffix="m", CurrentValue=30, Flag="CollectRange", Callback=function(v) _G.QuyHub.CollectRange=v end})

    -- TAB TELEPORT
    local TeleportTab = MainWindow:CreateTab("📍 Teleport", nil)
    TeleportTab:CreateSection("🏝️ Islands")
    local islands = {
        {"Đảo Khởi Đầu", Vector3.new(0,100,0)},
        {"Làng Hải Tặc", Vector3.new(1000,50,200)},
        {"Jungle", Vector3.new(-800,80,-500)},
        {"Trung tâm", Vector3.new(2000,100,1500)},
        {"Đảo Băng", Vector3.new(-1500,120,1000)},
        {"Đảo Lửa", Vector3.new(2500,150,-1000)},
        {"Vương Quốc", Vector3.new(3500,200,0)},
        {"Đảo Rồng", Vector3.new(-3000,250,2000)},
        {"Đảo Quái Vật", Vector3.new(4000,300,-2000)},
        {"Đảo Biển", Vector3.new(5000,0,0)},
    }
    for _, island in ipairs(islands) do
        TeleportTab:CreateButton({Name = "📍 " .. island[1], Callback = function()
            TeleportTo(island[2])
            Notify("Quy Hub", "Đã teleport đến " .. island[1], 3, "📍")
        end})
    end
    TeleportTab:CreateSection("✏️ Custom Coords")
    TeleportTab:CreateTextBox({Name="X", PlaceholderText="0", CurrentValue="0", Flag="TeleX", Callback=function(t) _G.QuyHub.TeleX=tonumber(t) or 0 end})
    TeleportTab:CreateTextBox({Name="Y", PlaceholderText="0", CurrentValue="0", Flag="TeleY", Callback=function(t) _G.QuyHub.TeleY=tonumber(t) or 0 end})
    TeleportTab:CreateTextBox({Name="Z", PlaceholderText="0", CurrentValue="0", Flag="TeleZ", Callback=function(t) _G.QuyHub.TeleZ=tonumber(t) or 0 end})
    TeleportTab:CreateButton({Name = "🚀 Teleport", Callback = function()
        local x = _G.QuyHub.TeleX or 0; local y = _G.QuyHub.TeleY or 0; local z = _G.QuyHub.TeleZ or 0
        TeleportTo(Vector3.new(x,y,z))
        Notify("Quy Hub", "Teleport đến ("..x..", "..y..", "..z..")", 3, "🚀")
    end})

    -- TAB PREMIUM (chỉ hiện khi Premium)
    local PremiumTab = MainWindow:CreateTab("👑 Premium", nil)
    PremiumTab.Visible = _G.QuyHub.Premium
    PremiumTab:CreateSection("🌟 Premium Features (9213)")
    PremiumTab:CreateParagraph({Title = "👑 Welcome Premium User!", Content = "Key: 9213 – valid 5h"})
    PremiumTab:CreateToggle({Name = "🔄 Hop Server (find fruit)", CurrentValue=false, Flag="HopServer", Callback=function(v)
        if not _G.QuyHub.Premium then Notify("Quy Hub", "⚠️ Need Premium Key!", 3, "⚠️") return end
        _G.QuyHub.HopServer = v
        if v then Notify("Quy Hub Premium", "Start Hop Server!", 3, "🔄")
            spawn(function() while _G.QuyHub.HopServer do
                local hasFruit = false
                for _, obj in pairs(game:GetService("Workspace"):GetDescendants()) do
                    if obj:IsA("Tool") and obj:FindFirstChild("Handle") and (obj.Name:find("Fruit") or obj.Name:find("fruit")) then
                        hasFruit = true; break
                    end
                end
                if not hasFruit then Notify("Quy Hub Premium", "No fruit, hopping...", 2, "🔄")
                    game:GetService("TeleportService"):Teleport(game.PlaceId)
                    wait(5)
                else wait(10) end
                wait(5)
            end end)
        else Notify("Quy Hub Premium", "Stop Hop Server!", 3, "⏹️") end
    end})
    PremiumTab:CreateToggle({Name = "🍎 Loot Fruit (auto collect)", CurrentValue=false, Flag="AutoLootFruit", Callback=function(v)
        if not _G.QuyHub.Premium then Notify("Quy Hub", "⚠️ Need Premium Key!", 3, "⚠️") return end
        _G.QuyHub.AutoLootFruit = v
        if v then Notify("Quy Hub Premium", "Start Looting!", 3, "🍎")
            spawn(function() while _G.QuyHub.AutoLootFruit do
                local root = GetHumanoidRootPart()
                if not root then wait(1) continue end
                local nearest, minDist = nil, 500
                for _, obj in pairs(game:GetService("Workspace"):GetDescendants()) do
                    if obj:IsA("Tool") and obj:FindFirstChild("Handle") and (obj.Name:find("Fruit") or obj.Name:find("fruit")) then
                        local d = (root.Position - obj.Handle.Position).Magnitude
                        if d < minDist then nearest = obj; minDist = d end
                    end
                end
                if nearest then
                    root.CFrame = nearest.Handle.CFrame
                    wait(0.2)
                    game:GetService("VirtualInputManager"):SendKeyEvent(true,"E",false,game)
                    wait(0.1)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false,"E",false,game)
                end
                wait(1)
            end end)
        else Notify("Quy Hub Premium", "Stop Looting!", 3, "⏹️") end
    end})

    -- TAB FRUITS (khóa, mở bằng code "quy")
    local FruitsTab = MainWindow:CreateTab("🍎 Fruits", nil)
    FruitsTab.Visible = UnlockedTabs.Fruits
    FruitsTab:CreateSection("🍎 Fruit Features (Code: quy)")
    FruitsTab:CreateToggle({Name = "🍎 Auto Farm Fruit", CurrentValue=false, Flag="FarmFruit", Callback=function(v)
        Notify("Quy Hub", v and "Bắt đầu Farm Fruit!" or "Tắt Farm Fruit!", 3, "🍎")
    end})

    -- TAB RAID & SEA (khóa, mở bằng code "quy")
    local RaidTab = MainWindow:CreateTab("🌊 Raid & Sea", nil)
    RaidTab.Visible = UnlockedTabs.Raid
    RaidTab:CreateSection("🌀 Raid & Sea (Code: quy)")
    RaidTab:CreateToggle({Name = "🌀 Auto Raid", CurrentValue=false, Flag="AutoRaid", Callback=function(v)
        _G.QuyHub.AutoRaid = v
        if v then Notify("Quy Hub", "Start Auto Raid!", 3, "🌀")
            spawn(function() while _G.QuyHub.AutoRaid do
                TeleportTo(Vector3.new(2700,120,-2000))
                wait(2)
                for i=1,10 do
                    local root = GetHumanoidRootPart()
                    if not root then break end
                    local enemies = game:GetService("Workspace"):FindFirstChild("Enemies")
                    if enemies then
                        for _, e in pairs(enemies:GetChildren()) do
                            if e:FindFirstChild("Humanoid") and e.Humanoid.Health > 0 then
                                root.CFrame = e.HumanoidRootPart.CFrame * CFrame.new(0,0,-5)
                                wait(0.1)
                                game:GetService("VirtualInputManager"):SendMouseButtonEvent(0,0,0,true,game:GetService("UserInputService").MouseIcon,0)
                                wait(0.05)
                                game:GetService("VirtualInputManager"):SendMouseButtonEvent(0,0,0,false,game:GetService("UserInputService").MouseIcon,0)
                                break
                            end
                        end
                    end
                    wait(0.2)
                end
                wait(5)
            end end)
        else Notify("Quy Hub", "Stop Auto Raid!", 3, "⏹️") end
    end})
    RaidTab:CreateToggle({Name = "🐉 Auto Sea Beast", CurrentValue=false, Flag="AutoSeaBeast", Callback=function(v)
        _G.QuyHub.AutoSeaBeast = v
        if v then Notify("Quy Hub", "Start Sea Beast!", 3, "🐉")
            spawn(function() while _G.QuyHub.AutoSeaBeast do
                local root = GetHumanoidRootPart()
                if not root then wait(1) continue end
                local seaBeast = nil
                for _, obj in pairs(game:GetService("Workspace"):GetDescendants()) do
                    if obj:IsA("Model") and (obj.Name:find("Sea") or obj.Name:find("Beast") or obj.Name:find("Kraken")) and obj:FindFirstChild("Humanoid") and obj.Humanoid.Health > 0 then
                        seaBeast = obj; break
                    end
                end
                if seaBeast then
                    root.CFrame = seaBeast.HumanoidRootPart.CFrame * CFrame.new(0,20,-15)
                    wait(0.5)
                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(0,0,0,true,game:GetService("UserInputService").MouseIcon,0)
                    wait(0.05)
                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(0,0,0,false,game:GetService("UserInputService").MouseIcon,0)
                else
                    TeleportTo(Vector3.new(5000,0,3000))
                    wait(2)
                end
                wait(2)
            end end)
        else Notify("Quy Hub", "Stop Sea Beast!", 3, "⏹️") end
    end})

    -- TAB MISC (khóa, mở bằng code "quy")
    local MiscTab = MainWindow:CreateTab("🛠️ Misc", nil)
    MiscTab.Visible = UnlockedTabs.Misc
    MiscTab:CreateSection("🛠️ Misc Features (Code: quy)")
    MiscTab:CreateToggle({Name = "✈️ Fly", CurrentValue=false, Flag="Fly", Callback=function(v)
        _G.QuyHub.Fly = v
        local root = GetHumanoidRootPart(); local h = GetHumanoid()
        if not root or not h then return end
        if v then
            local bv = Instance.new("BodyVelocity")
            bv.MaxForce = Vector3.new(1e9,1e9,1e9)
            bv.Velocity = Vector3.new(0,50,0)
            bv.Parent = root
            h.PlatformStand = true
            Notify("Quy Hub", "Fly On!", 2, "✈️")
        else
            for _, obj in pairs(root:GetChildren()) do if obj:IsA("BodyVelocity") then obj:Destroy() end end
            h.PlatformStand = false
            Notify("Quy Hub", "Fly Off!", 2, "⏹️")
        end
    end})
    MiscTab:CreateToggle({Name = "🚧 NoClip", CurrentValue=false, Flag="NoClip", Callback=function(v)
        _G.QuyHub.NoClip = v
        local root = GetHumanoidRootPart()
        if root then root.CanCollide = not v end
        Notify("Quy Hub", v and "NoClip On!" or "NoClip Off!", 2, "🚧")
    end})
    MiscTab:CreateSlider({Name = "🏃 Speed", Range={16,500}, Increment=1, Suffix="Speed", CurrentValue=16, Flag="Speed", Callback=function(v)
        _G.QuyHub.Speed = v
        local h = GetHumanoid()
        if h then h.WalkSpeed = v end
    end})
    MiscTab:CreateSlider({Name = "🦘 Jump Power", Range={50,800}, Increment=5, Suffix="JP", CurrentValue=50, Flag="JumpPower", Callback=function(v)
        _G.QuyHub.JumpPower = v
        local h = GetHumanoid()
        if h then h.JumpPower = v end
    end})
    MiscTab:CreateToggle({Name = "👁️ ESP", CurrentValue=false, Flag="ESP", Callback=function(v)
        _G.QuyHub.ESP = v
        Notify("Quy Hub", v and "ESP On!" or "ESP Off!", 2, "👁️")
    end})
    MiscTab:CreateToggle({Name = "⏰ Anti AFK", CurrentValue=false, Flag="AntiAFK", Callback=function(v)
        _G.QuyHub.AntiAFK = v
        if v then
            local vu = game:GetService("VirtualUser")
            game:GetService("Players").LocalPlayer.Idled:Connect(function()
                vu:CaptureController()
                vu:ClickButton2(Vector2.new())
            end)
            Notify("Quy Hub", "Anti AFK On!", 2, "⏰")
        else Notify("Quy Hub", "Anti AFK Off!", 2, "⏹️") end
    end})
    MiscTab:CreateToggle({Name = "💊 Auto Heal", CurrentValue=false, Flag="AutoHeal", Callback=function(v)
        _G.QuyHub.AutoHeal = v
        Notify("Quy Hub", v and "Auto Heal On!" or "Auto Heal Off!", 2, "💊")
    end})
    MiscTab:CreateSlider({Name = "🩸 Heal Threshold (%)", Range={10,80}, Increment=5, Suffix="%", CurrentValue=30, Flag="HealThreshold", Callback=function(v)
        _G.QuyHub.HealThreshold = v/100
    end})
    MiscTab:CreateToggle({Name = "🔄 Auto Rejoin", CurrentValue=false, Flag="AutoRejoin", Callback=function(v)
        _G.QuyHub.AutoRejoin = v
        if v then
            Notify("Quy Hub", "Auto Rejoin On!", 2, "🔄")
            game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(state)
                if state == Enum.TeleportState.Teleporting then
                    wait(10)
                    game:GetService("TeleportService"):Teleport(game.PlaceId)
                end
            end)
        else Notify("Quy Hub", "Auto Rejoin Off!", 2, "⏹️") end
    end})

    -- TAB SETTINGS
    local SettingsTab = MainWindow:CreateTab("⚙️ Settings", nil)
    SettingsTab:CreateSection("🔧 Settings")
    SettingsTab:CreateButton({Name = "🔄 Reset All", Callback = function()
        for k,v in pairs(_G.QuyHub) do
            if type(v) == "boolean" and k ~= "Unlocked" and k ~= "Premium" then
                _G.QuyHub[k] = false
            end
        end
        local h = GetHumanoid(); local r = GetHumanoidRootPart()
        if h then h.WalkSpeed = 16; h.JumpPower = 50; h.PlatformStand = false end
        if r then
            r.CanCollide = true
            for _, obj in pairs(r:GetChildren()) do if obj:IsA("BodyVelocity") then obj:Destroy() end end
        end
        Notify("Quy Hub", "Reset All Done!", 3, "✅")
    end})
    SettingsTab:CreateParagraph({Title = "📋 Info", Content = "Quy Hub V2\nby Quy\nKey: 23za3a | Premium: 9213\nCode: quy\nDiscord: quyhub"})

    Notify("Quy Hub V2", "✅ Main window loaded! Enjoy!", 3, "🎉")
end

-- ============================ 8. KIỂM TRA KEY ĐÃ LƯU ============================
local savedKey = LoadKey()
if savedKey and ValidateKey(savedKey) then
    _G.QuyHub.Key = savedKey
    UnlockFeatures(savedKey)
end

-- ============================ 9. AUTO HEAL NỀN ============================
spawn(function()
    while true do
        wait(1)
        if _G.QuyHub.Unlocked and _G.QuyHub.AutoHeal then
            local h = GetHumanoid()
            if h and h.Health / h.MaxHealth < _G.QuyHub.HealThreshold then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "5", false, game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, "5", false, game)
            end
        end
    end
end)

print("✅ Quy Hub V2 loaded!")
print("🔑 Key: 23za3a | Premium: 9213")
print("🎯 Code: quy")
