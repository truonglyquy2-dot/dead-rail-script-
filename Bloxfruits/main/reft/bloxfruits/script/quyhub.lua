-- ==========================================================================================
--                              QUY HUB V3 – BLOX FRUITS
--                     Key System 3 cấp độ: Pr | quyhub | mm
--                     🔑 Pr  = Unlock ALL tab (bao gồm Premium)
--                     🔑 quyhub = Unlock ALL tab (KHÓA Premium)
--                     🔑 mm  = Chỉ unlock tab FARM
--                     🚀 Auto Execute khi vào Blox Fruits
--                     Tác giả: Quy
-- ==========================================================================================

-- ============================ 1. KIỂM TRA GAME ============================
local function IsBloxFruits()
    local placeId = game.PlaceId
    -- Danh sách PlaceId của Blox Fruits
    local bloxFruitsIds = {
        2753915549,  -- Blox Fruits (chính)
        4442272183,  -- Blox Fruits (cũ)
        7449423635,  -- Blox Fruits (mới)
        5842599403,  -- Blox Fruits (update)
    }
    for _, id in ipairs(bloxFruitsIds) do
        if placeId == id then return true end
    end
    -- Kiểm tra tên game
    if game.Name and game.Name:find("Blox Fruits") then return true end
    return false
end

-- ============================ 2. TẢI RAYFIELD ============================
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- ============================ 3. CẤU HÌNH KEY SYSTEM ============================
local KeyConfig = {
    MainLink = "https://link4sub.com/XFwyhwt2zw",
    PremiumLink = "https://link4sub.com/8paBqdaAu2",
    Keys = {
        ["Pr"] = { level = "premium", desc = "Unlock ALL tab (bao gồm Premium)" },
        ["quyhub"] = { level = "full", desc = "Unlock ALL tab (KHÓA Premium)" },
        ["mm"] = { level = "farmonly", desc = "Chỉ unlock tab FARM, khóa tất cả còn lại" },
    },
    SaveKey = true,
    FileName = "QuyHubKeyV3.txt",
    -- Auto Execute settings
    AutoExecute = true,  -- Tự động chạy khi vào Blox Fruits
    AutoFarmOnStart = false,  -- Tự động bật farm khi vào game (cần key hợp lệ)
}

-- ============================ 4. BIẾN TOÀN CỤ ============================
_G.QuyHub = {
    Unlocked = false,
    KeyLevel = "none", -- none | farmonly | full | premium
    KeyUsed = "",
    -- Farm
    Farm = false,
    FarmMode = "Melee",
    FarmTarget = "All",
    FarmRange = 20,
    FarmSpeed = 0.2,
    FarmBoss = false,
    FarmBossRange = 30,
    -- Collect
    AutoCollectFruits = false,
    AutoCollectItems = false,
    CollectRange = 30,
    -- Raid & Sea
    AutoRaid = false,
    AutoSeaBeast = false,
    -- Premium
    HopServer = false,
    HopServerFruit = false,
    AutoLootFruit = false,
    -- Misc
    Fly = false,
    FlySpeed = 50,
    NoClip = false,
    Speed = 16,
    JumpPower = 50,
    ESP = false,
    AntiAFK = false,
    AutoHeal = false,
    HealThreshold = 0.3,
    AutoRejoin = false,
    -- Auto Execute
    AutoStarted = false,
}

-- ============================ 5. HÀM TIỆN ÍCH ============================
local function Notify(title, content, duration, icon)
    Rayfield:Notify({Title = title, Content = content, Duration = duration or 3, Icon = icon})
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

-- ============================ 6. XÁC THỰC KEY (3 CẤP ĐỘ) ============================
local function ValidateKey(key)
    return KeyConfig.Keys[key] ~= nil
end

local function GetKeyLevel(key)
    if KeyConfig.Keys[key] then
        return KeyConfig.Keys[key].level
    end
    return "none"
end

local function UnlockFeatures(key)
    local level = GetKeyLevel(key)
    _G.QuyHub.KeyLevel = level
    _G.QuyHub.KeyUsed = key
    _G.QuyHub.Unlocked = true

    local msg = ""
    if level == "premium" then
        msg = "👑 Key PREMIUM! Mở khóa TẤT CẢ tab (bao gồm Premium)"
    elseif level == "full" then
        msg = "🔓 Key FULL! Mở khóa TẤT CẢ tab (KHÓA Premium)"
    elseif level == "farmonly" then
        msg = "🌾 Key FARM ONLY! Chỉ mở tab FARM, khóa các tab khác"
    end
    Notify("Quy Hub V3", msg, 5, "🎯")

    if KeyWindow then KeyWindow:Destroy() end
    CreateMainWindow()
end

-- ============================ 7. CỬA SỔ KEY SYSTEM ============================
local KeyWindow = nil
local function CreateKeyWindow()
    if KeyWindow then return end
    KeyWindow = Rayfield:CreateWindow({
        Name = "Quy Hub V3",
        LoadingTitle = "⚡ Quy Hub V3 ⚡",
        LoadingSubtitle = "Key System 3 cấp độ | by Quy",
        ConfigurationSaving = {Enabled = false},
        Discord = {Enabled = true, Invite = "quyhub", RememberJoins = true},
        KeySystem = false,
    })

    local KeyTab = KeyWindow:CreateTab("Key System", nil)
    KeyTab:CreateParagraph({Title = "⚡ Quy Hub V3", Content = "Blox Fruits | 3 Key Levels"})

    KeyTab:CreateSection("📋 Get Your Key")
    KeyTab:CreateButton({
        Name = "🔑 Get Key (Pr / quyhub / mm)",
        Callback = function()
            setclipboard(KeyConfig.MainLink)
            Notify("Quy Hub", "✅ Đã copy link lấy key!\nMở trình duyệt, hoàn thành task để nhận key.", 4, "📋")
        end,
    })

    KeyTab:CreateSection("🔑 Enter Key")
    KeyTab:CreateParagraph({
        Title = "📌 Các key hợp lệ:",
        Content = "🔑 Pr  = Unlock ALL tab (bao gồm Premium)\n🔑 quyhub = Unlock ALL tab (KHÓA Premium)\n🔑 mm  = Chỉ unlock tab FARM",
    })

    local KeyInput = KeyTab:CreateTextBox({
        Name = "Enter your key...",
        PlaceholderText = "Paste key here (Pr / quyhub / mm)",
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
                KeyTab.Flags.MainKey = ""
                _G.QuyHub.TempKey = ""
            else
                Notify("Quy Hub", "❌ Key không hợp lệ! Các key hợp lệ: Pr, quyhub, mm", 4, "❌")
            end
        end,
    })

    KeyTab:CreateSection("📌 Get Key From")
    KeyTab:CreateParagraph({Title = "🔗 Linkvertise", Content = "👉 " .. KeyConfig.MainLink})
    KeyTab:CreateParagraph({Title = "🔗 LootLabs", Content = "👉 " .. KeyConfig.PremiumLink})

    KeyTab:CreateSection("💬 Need Support?")
    KeyTab:CreateButton({
        Name = "💬 Join Discord",
        Callback = function()
            setclipboard("https://discord.gg/quyhub")
            Notify("Quy Hub", "✅ Đã copy link Discord!", 3, "📋")
        end,
    })
end

-- ============================ 8. MAIN WINDOW ============================
local MainWindow = nil
local function CreateMainWindow()
    if MainWindow then return end

    local level = _G.QuyHub.KeyLevel
    local isPremium = (level == "premium")
    local isFull = (level == "full" or level == "premium")
    local isFarmOnly = (level == "farmonly")
    local isTabLocked = function(tabName)
        if isPremium then return false end
        if isFull then
            if tabName == "Premium" then return true end
            return false
        end
        if isFarmOnly then
            if tabName == "Farm" or tabName == "Home" or tabName == "Settings" then return false end
            return true
        end
        return true
    end

    MainWindow = Rayfield:CreateWindow({
        Name = "Quy Hub V3 - Main",
        LoadingTitle = "⚡ Quy Hub V3 ⚡",
        LoadingSubtitle = "Level: " .. level .. " | by Quy",
        ConfigurationSaving = {Enabled = true, FileName = "QuyHubConfigV3"},
        Discord = {Enabled = true, Invite = "quyhub", RememberJoins = true},
        KeySystem = false,
    })

    -- ============================ TAB HOME ============================
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

    -- ============================ TAB FARM ============================
    local FarmTab = MainWindow:CreateTab("⚔️ Farm", nil)
    FarmTab:CreateSection("🔥 Auto Farm")
    local FarmToggle = FarmTab:CreateToggle({
        Name = "🔥 Auto Farm",
        CurrentValue = false,
        Flag = "Farm",
        Callback = function(v)
            _G.QuyHub.Farm = v
            if v then
                Notify("Quy Hub", "Bắt đầu Farm!", 3, "⚔️")
                spawn(function()
                    while _G.QuyHub.Farm do
                        local root = GetHumanoidRootPart()
                        if not root then wait(1) continue end
                        local nearest, minDist = nil, _G.QuyHub.FarmRange or 20
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
    FarmTab:CreateSection("👹 Auto Boss")
    FarmTab:CreateToggle({Name = "👹 Auto Boss", CurrentValue=false, Flag="FarmBoss", Callback=function(v)
        _G.QuyHub.FarmBoss = v
        if v then Notify("Quy Hub", "Bắt đầu Farm Boss!", 3, "👹")
            spawn(function() while _G.QuyHub.FarmBoss do
                local root = GetHumanoidRootPart()
                if not root then wait(1) continue end
                local nearest, minDist = nil, _G.QuyHub.FarmBossRange or 30
                local enemies = game:GetService("Workspace"):FindFirstChild("Enemies")
                if enemies then
                    for _, e in pairs(enemies:GetChildren()) do
                        if e:FindFirstChild("Humanoid") and e.Humanoid.Health > 0 then
                            local name = e.Name
                            if name:find("Boss") or name:find("King") or name:find("Yeti") or name:find("Dragon") then
                                local d = (root.Position - e.HumanoidRootPart.Position).Magnitude
                                if d < minDist then nearest = e; minDist = d end
                            end
                        end
                    end
                end
                if nearest then
                    root.CFrame = nearest.HumanoidRootPart.CFrame * CFrame.new(0,0,-6)
                    wait(0.2)
                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(0,0,0,true,game:GetService("UserInputService").MouseIcon,0)
                    wait(0.05)
                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(0,0,0,false,game:GetService("UserInputService").MouseIcon,0)
                end
                wait(0.3)
            end end)
        else Notify("Quy Hub", "Tắt Farm Boss!", 3, "⏹️") end
    end})
    FarmTab:CreateSlider({Name = "📏 Khoảng cách boss", Range={10,60}, Increment=1, Suffix="m", CurrentValue=30, Flag="FarmBossRange", Callback=function(v) _G.QuyHub.FarmBossRange=v end})

    -- ============================ TAB COLLECT ============================
    local CollectTab = MainWindow:CreateTab("📦 Collect", nil)
    CollectTab.Visible = not isTabLocked("Collect")
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

    -- ============================ TAB TELEPORT ============================
    local TeleportTab = MainWindow:CreateTab("📍 Teleport", nil)
    TeleportTab.Visible = not isTabLocked("Teleport")
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

    -- ============================ TAB PREMIUM ============================
    local PremiumTab = MainWindow:CreateTab("👑 Premium", nil)
    PremiumTab.Visible = (level == "premium")
    PremiumTab:CreateSection("🌟 Premium Features (Key: Pr)")
    PremiumTab:CreateParagraph({Title = "👑 Welcome Premium User!", Content = "Key: Pr – Unlock all features!"})
    PremiumTab:CreateToggle({Name = "🔄 Hop Server (find fruit)", CurrentValue=false, Flag="HopServer", Callback=function(v)
        if level ~= "premium" then Notify("Quy Hub", "⚠️ Cần key Pr!", 3, "⚠️") return end
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
        if level ~= "premium" then Notify("Quy Hub", "⚠️ Cần key Pr!", 3, "⚠️") return end
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

    -- ============================ TAB FRUITS ============================
    local FruitsTab = MainWindow:CreateTab("🍎 Fruits", nil)
    FruitsTab.Visible = not isTabLocked("Fruits")
    FruitsTab:CreateSection("🍎 Fruit Features")
    FruitsTab:CreateToggle({Name = "🍎 Auto Farm Fruit", CurrentValue=false, Flag="FarmFruit", Callback=function(v)
        Notify("Quy Hub", v and "Bắt đầu Farm Fruit!" or "Tắt Farm Fruit!", 3, "🍎")
    end})

    -- ============================ TAB RAID & SEA ============================
    local RaidTab = MainWindow:CreateTab("🌊 Raid & Sea", nil)
    RaidTab.Visible = not isTabLocked("Raid")
    RaidTab:CreateSection("🌀 Raid & Sea")
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

    -- ============================ TAB MISC ============================
    local MiscTab = MainWindow:CreateTab("🛠️ Misc", nil)
    MiscTab.Visible = not isTabLocked("Misc")
    MiscTab:CreateSection("🛠️ Misc Features")
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

    -- ============================ TAB SETTINGS ============================
    local SettingsTab = MainWindow:CreateTab("⚙️ Settings", nil)
    SettingsTab:CreateSection("🔧 Settings")
    SettingsTab:CreateButton({Name = "🔄 Reset All", Callback = function()
        for k,v in pairs(_G.QuyHub) do
            if type(v) == "boolean" and k ~= "Unlocked" and k ~= "KeyLevel" and k ~= "AutoStarted" then
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
    SettingsTab:CreateParagraph({Title = "📋 Info", Content = "Quy Hub V3\nby Quy\n🔑 Pr  = Premium (Unlock ALL)\n🔑 quyhub = Full (Lock Premium)\n🔑 mm  = Farm Only\n🚀 Auto Execute: Blox Fruits\nDiscord: quyhub"})

    Notify("Quy Hub V3", "✅ Main window loaded! Level: " .. level, 3, "🎉")
end

-- ============================ 9. AUTO EXECUTE ============================
local function AutoExecute()
    -- Kiểm tra nếu đã unlock
    if _G.QuyHub.Unlocked then
        -- Nếu đã có main window, không tạo lại
        if not MainWindow then
            CreateMainWindow()
        end
        -- Tự động bật Farm nếu cài đặt
        if KeyConfig.AutoFarmOnStart and not _G.QuyHub.Farm then
            _G.QuyHub.Farm = true
            Notify("Quy Hub", "🚀 Auto Farm đã được bật!", 3, "⚔️")
            -- Kích hoạt farm loop
            spawn(function()
                while _G.QuyHub.Farm do
                    local root = GetHumanoidRootPart()
                    if not root then wait(1) continue end
                    local nearest, minDist = nil, _G.QuyHub.FarmRange or 20
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
        end
        _G.QuyHub.AutoStarted = true
        return
    end

    -- Nếu chưa unlock, kiểm tra key đã lưu
    local savedKey = LoadKey()
    if savedKey and ValidateKey(savedKey) then
        _G.QuyHub.Key = savedKey
        UnlockFeatures(savedKey)
        -- Sau khi unlock, auto execute sẽ được gọi lại
        return
    end

    -- Nếu chưa có key, hiển thị key window
    if not KeyWindow then
        CreateKeyWindow()
    end
end

-- ============================ 10. KIỂM TRA VÀ AUTO EXECUTE ============================
local function StartHub()
    if _G.QuyHub.AutoStarted then return end
    
    -- Kiểm tra nếu đang ở Blox Fruits
    if IsBloxFruits() then
        print("[Quy Hub V3]: Phát hiện Blox Fruits! Đang tự động khởi chạy...")
        Notify("Quy Hub V3", "🚀 Blox Fruits detected! Auto executing...", 3, "🎯")
        AutoExecute()
    else
        print("[Quy Hub V3]: Không phải Blox Fruits. Đang chờ...")
        -- Vẫn cho phép dùng script nhưng hiển thị thông báo
        Notify("Quy Hub V3", "⚠️ Chỉ hỗ trợ Blox Fruits! Vẫn có thể nhập key để sử dụng.", 4, "⚠️")
        -- Cho phép nhập key manual
        if not KeyWindow then
            CreateKeyWindow()
        end
    end
end

-- Chạy sau khi script load
task.spawn(function()
    wait(0.5)
    StartHub()
end)

-- ============================ 11. THEO DÕI KHI VÀO GAME ============================
-- Nếu người chơi vào game (teleport), tự động chạy lại
game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(state)
    if state == Enum.TeleportState.Teleporting then
        wait(5)
        _G.QuyHub.AutoStarted = false
        StartHub()
    end
end)

-- Khi nhân vật spawn, kiểm tra lại
game.Players.LocalPlayer.CharacterAdded:Connect(function()
    wait(2)
    if IsBloxFruits() and _G.QuyHub.Unlocked and not _G.QuyHub.AutoStarted then
        AutoExecute()
    end
end)

-- ============================ 12. AUTO HEAL NỀN ============================
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

print("✅ Quy Hub V3 loaded! (Auto Execute)")
print("🔑 Các key hợp lệ:")
print("   Pr     = Unlock ALL (bao gồm Premium)")
print("   quyhub = Unlock ALL (KHÓA Premium)")
print("   mm     = Chỉ unlock tab FARM")
print("🚀 Auto Execute: Blox Fruits only")
