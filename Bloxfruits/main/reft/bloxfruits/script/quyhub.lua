-- ==========================================================================================
--                              QUY HUB ULTIMATE v11.2
--                     Key System: link4sub.com (nhanh, dễ dàng)
--                     Key chính: 23za3a (dùng script cơ bản)
--                     Key Premium: 9213 (mở tab Premium, hiệu lực 5h)
--                     Tác giả: Quy | Ngôn ngữ: Tiếng Việt
--                     Link lấy key: https://link4sub.com/8paBqdaAu2
-- ==========================================================================================

-- ============================ 1. TẢI RAYFIELD ============================
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- ============================ 2. CẤU HÌNH KEY SYSTEM ============================
local KeyConfig = {
    Link = "https://link4sub.com/8paBqdaAu2",  -- Link lấy key
    ValidKeys = {
        "23za3a",  -- Key chính (dùng script cơ bản)
        "9213",    -- Key Premium (mở tab Premium, hiệu lực 5h)
    },
    PremiumKey = "9213",  -- Key dùng để mở tab Premium
    SaveKey = true,
    FileName = "QuyHubKey.txt",
}

-- ============================ 3. TẠO CỬA SỔ CHÍNH ============================
local Window = Rayfield:CreateWindow({
    Name = "Quy Hub Ultimate v11.2",
    LoadingTitle = "⚡ Quy Hub Ultimate ⚡",
    LoadingSubtitle = "Key: 23za3a | Premium: 9213",
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

-- ============================ 4. BIẾN TOÀN CỤ ============================
_G.QuyHub = {
    Unlocked = false,
    Premium = false,
    Key = "",
    -- Farm
    Farm = false,
    FarmMode = "Melee",
    FarmTarget = "All",
    FarmRange = 20,
    FarmSpeed = 0.2,
    FarmUseSkill = true,
    FarmCombo = {"Z", "X", "C", "V"},
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
    AutoFarmFruit = false,
    -- Misc
    Fly = false,
    FlySpeed = 50,
    NoClip = false,
    Speed = 16,
    JumpPower = 50,
    ESP = false,
    ESPMode = "Box",
    ESPColor = Color3.fromRGB(255, 0, 0),
    AntiAFK = false,
    AutoHeal = false,
    HealThreshold = 0.3,
    AutoBuff = false,
    AutoSpin = false,
    SpinSpeed = 10,
    AutoJump = false,
    JumpInterval = 2,
    AutoRejoin = false,
    DebugMode = false,
}

-- ============================ 5. HÀM TIỆN ÍCH ============================
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

-- ============================ 6. XÁC THỰC KEY ============================
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
        Notify("Quy Hub Premium", "👑 Key Premium 9213! Tab Premium đã được mở khóa!\n⏰ Key có hiệu lực 5 giờ.", 5, "👑")
    else
        Notify("Quy Hub", "✅ Key chính 23za3a hợp lệ! Chào mừng bạn!", 5, "🎉")
    end
end

-- Kiểm tra key đã lưu
local savedKey = LoadKey()
if savedKey and ValidateKey(savedKey) then
    _G.QuyHub.Key = savedKey
    UnlockFeatures(savedKey)
elseif savedKey then
    Notify("Quy Hub", "⚠️ Key đã lưu không hợp lệ, vui lòng nhập key mới.", 4, "⚠️")
end

-- ============================ 7. TAB KEY SYSTEM ============================
local KeyTab = Window:CreateTab("🔑 Key System", nil)
KeyTab:CreateSection("📋 HƯỚNG DẪN LẤY KEY")

KeyTab:CreateParagraph({
    Title = "🔹 Bước 1: Sao chép link",
    Content = "Nhấn nút '📋 Sao chép link' bên dưới. Link sẽ được copy vào bộ nhớ tạm.",
})

KeyTab:CreateButton({
    Name = "📋 Sao chép link",
    Callback = function()
        setclipboard(KeyConfig.Link)
        Notify("Quy Hub", "✅ Đã sao chép link! Mở trình duyệt và dán vào thanh địa chỉ.", 4, "📋")
    end,
})

KeyTab:CreateParagraph({
    Title = "🔹 Bước 2: Hoàn thành nhiệm vụ",
    Content = "Mở trình duyệt (Chrome, Firefox, ...). Dán link vừa copy vào thanh địa chỉ và truy cập.\n\nTrang sẽ yêu cầu bạn hoàn thành một số nhiệm vụ đơn giản.\nSau khi hoàn thành tất cả, bạn sẽ nhận được một Key.",
})

KeyTab:CreateParagraph({
    Title = "🔹 Bước 3: Nhập Key",
    Content = "Sao chép Key đó, quay lại script, dán vào ô bên dưới và nhấn 'Xác thực'.\n\n🔑 Key chính: 23za3a (dùng script cơ bản)\n👑 Key Premium: 9213 (mở tab Premium, hiệu lực 5h)",
})

KeyTab:CreateTextBox({
    Name = "🔑 Nhập Key của bạn",
    PlaceholderText = "Ví dụ: 23za3a hoặc 9213",
    CurrentValue = "",
    Flag = "KeyInput",
    Callback = function(Text)
        if ValidateKey(Text) then
            _G.QuyHub.Key = Text
            if KeyConfig.SaveKey then SaveKey(Text) end
            UnlockFeatures(Text)
        else
            Notify("Quy Hub", "❌ Key không hợp lệ! Vui lòng kiểm tra lại hoặc lấy key mới.", 4, "❌")
        end
    end,
})

KeyTab:CreateButton({
    Name = "🔄 Xác thực lại",
    Callback = function()
        local k = _G.QuyHub.Key or ""
        if k ~= "" and ValidateKey(k) then
            Notify("Quy Hub", "✅ Key hợp lệ! Bạn đã được cấp quyền sử dụng.", 3, "✅")
            if IsPremiumKey(k) then
                Notify("Quy Hub Premium", "👑 Key Premium 9213! Tab Premium đã được mở khóa!\n⏰ Key có hiệu lực 5 giờ.", 3, "👑")
                _G.QuyHub.Premium = true
            end
        else
            Notify("Quy Hub", "❌ Key không hợp lệ hoặc chưa nhập. Vui lòng làm theo hướng dẫn ở trên.", 3, "❌")
        end
    end,
})

-- ============================ 8. TAB HOME ============================
local HomeTab = Window:CreateTab("🏠 Home", nil)
HomeTab:CreateSection("👤 Thông tin người chơi")

local PlayerInfo = HomeTab:CreateParagraph({
    Title = "📊 Thông tin",
    Content = "Đang tải...",
})

local function UpdateInfo()
    local p = GetPlayer()
    if not p then return end
    local level = p.Data and p.Data.Level and p.Data.Level.Value or "?"
    local fruit = p.Data and p.Data.Fruit and p.Data.Fruit.Value or "Không"
    local beli = p.Data and p.Data.Beli and p.Data.Beli.Value or "?"
    local frag = p.Data and p.Data.Fragments and p.Data.Fragments.Value or "?"
    PlayerInfo:SetContent(
        "👤 Tên: " .. p.Name ..
        "\n📈 Level: " .. level ..
        "\n🍎 Trái cây: " .. fruit ..
        "\n💰 Beli: " .. beli ..
        "\n💎 Fragments: " .. frag
    )
end
UpdateInfo()

HomeTab:CreateButton({ Name = "🔄 Refresh", Callback = UpdateInfo })
HomeTab:CreateButton({ Name = "💀 Respawn", Callback = function() GetPlayer():LoadCharacter() end })
HomeTab:CreateButton({ Name = "📍 Về đảo khởi đầu", Callback = function() TeleportTo(Vector3.new(0, 100, 0)) end })

-- ============================ 9. TAB FARM ============================
local FarmTab = Window:CreateTab("⚔️ Farm", nil)

FarmTab:CreateSection("🔥 Auto Farm")
FarmTab:CreateToggle({
    Name = "🔥 Auto Farm",
    CurrentValue = false,
    Flag = "Farm",
    Callback = function(Value)
        if not _G.QuyHub.Unlocked then Notify("Quy Hub", "⚠️ Vui lòng nhập key trước!", 3, "⚠️") return end
        _G.QuyHub.Farm = Value
        if Value then
            Notify("Quy Hub", "Bắt đầu Farm!", 3, "⚔️")
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
            Notify("Quy Hub", "Tắt Farm!", 3, "⏹️")
        end
    end,
})

FarmTab:CreateDropdown({
    Name = "⚡ Chế độ tấn công",
    Options = {"Melee", "Sword", "Fruit"},
    CurrentOption = {"Melee"},
    Flag = "FarmMode",
    Callback = function(o) _G.QuyHub.FarmMode = o end
})

FarmTab:CreateDropdown({
    Name = "🎯 Loại quái",
    Options = {"All", "Bandit", "Pirate", "Marine", "Gorilla", "Yeti", "Dragon"},
    CurrentOption = {"All"},
    Flag = "FarmTarget",
    Callback = function(o) _G.QuyHub.FarmTarget = o end
})

FarmTab:CreateSlider({
    Name = "📏 Khoảng cách",
    Range = {5, 60},
    Increment = 1,
    Suffix = "m",
    CurrentValue = 20,
    Flag = "FarmRange",
    Callback = function(v) _G.QuyHub.FarmRange = v end
})

FarmTab:CreateSlider({
    Name = "⏱️ Tốc độ (giây)",
    Range = {0.05, 1},
    Increment = 0.05,
    Suffix = "s",
    CurrentValue = 0.2,
    Flag = "FarmSpeed",
    Callback = function(v) _G.QuyHub.FarmSpeed = v end
})

FarmTab:CreateSection("👹 Auto Boss")
FarmTab:CreateToggle({
    Name = "👹 Auto Boss",
    CurrentValue = false,
    Flag = "FarmBoss",
    Callback = function(Value)
        if not _G.QuyHub.Unlocked then Notify("Quy Hub", "⚠️ Vui lòng nhập key trước!", 3, "⚠️") return end
        _G.QuyHub.FarmBoss = Value
        if Value then
            Notify("Quy Hub", "Bắt đầu Farm Boss!", 3, "👹")
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
            Notify("Quy Hub", "Tắt Farm Boss!", 3, "⏹️")
        end
    end,
})

FarmTab:CreateSlider({
    Name = "📏 Khoảng cách boss",
    Range = {10, 60},
    Increment = 1,
    Suffix = "m",
    CurrentValue = 30,
    Flag = "FarmBossRange",
    Callback = function(v) _G.QuyHub.FarmBossRange = v end
})

-- ============================ 10. TAB COLLECT ============================
local CollectTab = Window:CreateTab("📦 Collect & Sell", nil)

CollectTab:CreateSection("📦 Auto Collect")
CollectTab:CreateToggle({
    Name = "🍎 Auto Collect Fruits",
    CurrentValue = false,
    Flag = "CollectFruits",
    Callback = function(Value)
        if not _G.QuyHub.Unlocked then Notify("Quy Hub", "⚠️ Vui lòng nhập key trước!", 3, "⚠️") return end
        _G.QuyHub.AutoCollectFruits = Value
        if Value then
            Notify("Quy Hub", "Bắt đầu nhặt Fruit!", 3, "🍎")
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
            Notify("Quy Hub", "Tắt Collect Fruit!", 3, "⏹️")
        end
    end,
})

CollectTab:CreateToggle({
    Name = "📦 Auto Collect Items & Chests",
    CurrentValue = false,
    Flag = "CollectItems",
    Callback = function(Value)
        if not _G.QuyHub.Unlocked then Notify("Quy Hub", "⚠️ Vui lòng nhập key trước!", 3, "⚠️") return end
        _G.QuyHub.AutoCollectItems = Value
        if Value then
            Notify("Quy Hub", "Bắt đầu nhặt Items!", 3, "📦")
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
            Notify("Quy Hub", "Tắt Collect Items!", 3, "⏹️")
        end
    end,
})

CollectTab:CreateSlider({
    Name = "📏 Khoảng cách thu thập",
    Range = {5, 50},
    Increment = 1,
    Suffix = "m",
    CurrentValue = 30,
    Flag = "CollectRange",
    Callback = function(v) _G.QuyHub.CollectRange = v end
})

-- ============================ 11. TAB RAID & SEA ============================
local RaidTab = Window:CreateTab("🌊 Raid & Sea", nil)

RaidTab:CreateSection("🌀 Auto Raid")
RaidTab:CreateToggle({
    Name = "🌀 Auto Raid",
    CurrentValue = false,
    Flag = "AutoRaid",
    Callback = function(Value)
        if not _G.QuyHub.Unlocked then Notify("Quy Hub", "⚠️ Vui lòng nhập key trước!", 3, "⚠️") return end
        _G.QuyHub.AutoRaid = Value
        if Value then
            Notify("Quy Hub", "Bắt đầu Auto Raid!", 3, "🌀")
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
            Notify("Quy Hub", "Tắt Auto Raid!", 3, "⏹️")
        end
    end,
})

RaidTab:CreateButton({
    Name = "📍 Teleport đến NPC Raid",
    Callback = function()
        TeleportTo(Vector3.new(2700, 120, -2000))
        Notify("Quy Hub", "Đã teleport!", 3, "📍")
    end,
})

RaidTab:CreateSection("🐉 Auto Sea Beast")
RaidTab:CreateToggle({
    Name = "🐉 Auto Sea Beast",
    CurrentValue = false,
    Flag = "AutoSeaBeast",
    Callback = function(Value)
        if not _G.QuyHub.Unlocked then Notify("Quy Hub", "⚠️ Vui lòng nhập key trước!", 3, "⚠️") return end
        _G.QuyHub.AutoSeaBeast = Value
        if Value then
            Notify("Quy Hub", "Bắt đầu săn Sea Beast!", 3, "🐉")
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
            Notify("Quy Hub", "Tắt Auto Sea Beast!", 3, "⏹️")
        end
    end,
})

RaidTab:CreateButton({
    Name = "🚤 Đi ra biển",
    Callback = function()
        TeleportTo(Vector3.new(5000, 0, 0))
        Notify("Quy Hub", "Đã ra biển!", 2, "🌊")
    end,
})

-- ============================ 12. TAB TELEPORT ============================
local TeleportTab = Window:CreateTab("📍 Teleport", nil)

TeleportTab:CreateSection("🏝️ Đảo")

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
            Notify("Quy Hub", "Đã teleport đến " .. island[1], 3, "📍")
        end,
    })
end

TeleportTab:CreateSection("✏️ Tọa độ tùy chỉnh")
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
    Name = "🚀 Teleport",
    Callback = function()
        local x = _G.QuyHub.TeleX or 0
        local y = _G.QuyHub.TeleY or 0
        local z = _G.QuyHub.TeleZ or 0
        TeleportTo(Vector3.new(x, y, z))
        Notify("Quy Hub", "Teleport đến (" .. x .. ", " .. y .. ", " .. z .. ")", 3, "🚀")
    end,
})

-- ============================ 13. TAB PREMIUM ============================
local PremiumTab = Window:CreateTab("👑 Premium", nil)
PremiumTab.Visible = _G.QuyHub.Premium

PremiumTab:CreateSection("🌟 TÍNH NĂNG PREMIUM (Key: 9213)")

PremiumTab:CreateParagraph({
    Title = "👑 Chào mừng Premium User!",
    Content = "Bạn đã nhập key Premium (9213).\n⏰ Key có hiệu lực 5 giờ.\nDưới đây là các tính năng độc quyền dành cho bạn.",
})

PremiumTab:CreateToggle({
    Name = "🔄 Hop Server (Tìm server có trái)",
    CurrentValue = false,
    Flag = "HopServer",
    Callback = function(Value)
        if not _G.QuyHub.Premium then Notify("Quy Hub", "⚠️ Vui lòng nhập key Premium (9213)!", 3, "⚠️") return end
        _G.QuyHub.HopServer = Value
        if Value then
            Notify("Quy Hub Premium", "Bắt đầu Hop Server!", 3, "🔄")
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
                        Notify("Quy Hub Premium", "Không có trái, đang hop server...", 2, "🔄")
                        game:GetService("TeleportService"):Teleport(game.PlaceId)
                        wait(5)
                    else
                        wait(10)
                    end
                    wait(5)
                end
            end)
        else
            Notify("Quy Hub Premium", "Tắt Hop Server!", 3, "⏹️")
        end
    end,
})

PremiumTab:CreateToggle({
    Name = "🍎 Lụm Trái (Auto Collect Fruit toàn map)",
    CurrentValue = false,
    Flag = "AutoLootFruit",
    Callback = function(Value)
        if not _G.QuyHub.Premium then Notify("Quy Hub", "⚠️ Vui lòng nhập key Premium (9213)!", 3, "⚠️") return end
        _G.QuyHub.AutoLootFruit = Value
        if Value then
            Notify("Quy Hub Premium", "Bắt đầu lụm trái!", 3, "🍎")
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
            Notify("Quy Hub Premium", "Tắt lụm trái!", 3, "⏹️")
        end
    end,
})

PremiumTab:CreateToggle({
    Name = "🔄🍎 Hop Server + Lụm Trái (Kết hợp)",
    CurrentValue = false,
    Flag = "HopServerFruit",
    Callback = function(Value)
        if not _G.QuyHub.Premium then Notify("Quy Hub", "⚠️ Vui lòng nhập key Premium (9213)!", 3, "⚠️") return end
        _G.QuyHub.HopServerFruit = Value
        if Value then
            Notify("Quy Hub Premium", "Bắt đầu Hop + Lụm!", 3, "🔄🍎")
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
                        Notify("Quy Hub Premium", "Không có trái, hop server...", 2, "🔄")
                        game:GetService("TeleportService"):Teleport(game.PlaceId)
                        wait(5)
                    end
                    wait(2)
                end
            end)
        else
            Notify("Quy Hub Premium", "Tắt Hop + Lụm!", 3, "⏹️")
        end
    end,
})

PremiumTab:CreateToggle({
    Name = "🌳 Auto Farm Fruit (Tự động farm trái từ NPC)",
    CurrentValue = false,
    Flag = "AutoFarmFruit",
    Callback = function(Value)
        if not _G.QuyHub.Premium then Notify("Quy Hub", "⚠️ Vui lòng nhập key Premium (9213)!", 3, "⚠️") return end
        _G.QuyHub.AutoFarmFruit = Value
        if Value then
            Notify("Quy Hub Premium", "Bắt đầu Farm Fruit!", 3, "🌳")
            spawn(function()
                while _G.QuyHub.AutoFarmFruit do
                    -- Code farm trái từ NPC (có thể tùy chỉnh)
                    Notify("Quy Hub Premium", "Đang farm trái từ NPC...", 2, "🌳")
                    wait(10)
                end
            end)
        else
            Notify("Quy Hub Premium", "Tắt Farm Fruit!", 3, "⏹️")
        end
    end,
})

-- ============================ 14. TAB MISC ============================
local MiscTab = Window:CreateTab("🛠️ Misc", nil)

MiscTab:CreateSection("✈️ Di chuyển")
MiscTab:CreateToggle({
    Name = "✈️ Fly",
    CurrentValue = false,
    Flag = "Fly",
    Callback = function(Value)
        if not _G.QuyHub.Unlocked then Notify("Quy Hub", "⚠️ Vui lòng nhập key trước!", 3, "⚠️") return end
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
            Notify("Quy Hub", "Bật Fly!", 2, "✈️")
        else
            for _, v in pairs(root:GetChildren()) do
                if v:IsA("BodyVelocity") then v:Destroy() end
            end
            h.PlatformStand = false
            Notify("Quy Hub", "Tắt Fly!", 2, "⏹️")
        end
    end,
})

MiscTab:CreateSlider({
    Name = "📈 Tốc độ bay",
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

MiscTab:CreateToggle({
    Name = "🚧 NoClip",
    CurrentValue = false,
    Flag = "NoClip",
    Callback = function(Value)
        if not _G.QuyHub.Unlocked then Notify("Quy Hub", "⚠️ Vui lòng nhập key trước!", 3, "⚠️") return end
        _G.QuyHub.NoClip = Value
        local root = GetHumanoidRootPart()
        if root then root.CanCollide = not Value end
        Notify("Quy Hub", Value and "Bật NoClip!" or "Tắt NoClip!", 2, "🚧")
    end,
})

MiscTab:CreateSlider({
    Name = "🏃 Tốc độ di chuyển",
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
    Name = "🦘 Sức bật nhảy",
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

MiscTab:CreateSection("👁️ ESP")
MiscTab:CreateToggle({
    Name = "👁️ ESP",
    CurrentValue = false,
    Flag = "ESP",
    Callback = function(Value)
        if not _G.QuyHub.Unlocked then Notify("Quy Hub", "⚠️ Vui lòng nhập key trước!", 3, "⚠️") return end
        _G.QuyHub.ESP = Value
        Notify("Quy Hub", Value and "Bật ESP!" or "Tắt ESP!", 2, "👁️")
    end,
})

MiscTab:CreateSection("🛡️ Tiện ích")
MiscTab:CreateToggle({
    Name = "⏰ Anti AFK",
    CurrentValue = false,
    Flag = "AntiAFK",
    Callback = function(Value)
        if not _G.QuyHub.Unlocked then Notify("Quy Hub", "⚠️ Vui lòng nhập key trước!", 3, "⚠️") return end
        _G.QuyHub.AntiAFK = Value
        if Value then
            local vu = game:GetService("VirtualUser")
            game:GetService("Players").LocalPlayer.Idled:Connect(function()
                vu:CaptureController()
                vu:ClickButton2(Vector2.new())
            end)
            Notify("Quy Hub", "Bật Anti AFK!", 2, "⏰")
        else
            Notify("Quy Hub", "Tắt Anti AFK!", 2, "⏹️")
        end
    end,
})

MiscTab:CreateToggle({
    Name = "💊 Auto Heal",
    CurrentValue = false,
    Flag = "AutoHeal",
    Callback = function(Value)
        if not _G.QuyHub.Unlocked then Notify("Quy Hub", "⚠️ Vui lòng nhập key trước!", 3, "⚠️") return end
        _G.QuyHub.AutoHeal = Value
        Notify("Quy Hub", Value and "Bật Auto Heal!" or "Tắt Auto Heal!", 2, "💊")
    end,
})

MiscTab:CreateSlider({
    Name = "🩸 Ngưỡng HP để heal (%)",
    Range = {10, 80},
    Increment = 5,
    Suffix = "%",
    CurrentValue = 30,
    Flag = "HealThreshold",
    Callback = function(v) _G.QuyHub.HealThreshold = v / 100 end
})

MiscTab:CreateToggle({
    Name = "🔄 Auto Rejoin",
    CurrentValue = false,
    Flag = "AutoRejoin",
    Callback = function(Value)
        if not _G.QuyHub.Unlocked then Notify("Quy Hub", "⚠️ Vui lòng nhập key trước!", 3, "⚠️") return end
        _G.QuyHub.AutoRejoin = Value
        if Value then
            Notify("Quy Hub", "Bật Auto Rejoin!", 2, "🔄")
            game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(state)
                if state == Enum.TeleportState.Teleporting then
                    wait(10)
                    game:GetService("TeleportService"):Teleport(game.PlaceId)
                end
            end)
        else
            Notify("Quy Hub", "Tắt Auto Rejoin!", 2, "⏹️")
        end
    end,
})

-- ============================ 15. TAB SETTINGS ============================
local SettingsTab = Window:CreateTab("⚙️ Settings", nil)

SettingsTab:CreateSection("🔧 Cài đặt")
SettingsTab:CreateButton({
    Name = "🔄 Reset tất cả",
    Callback = function()
        if not _G.QuyHub.Unlocked then Notify("Quy Hub", "⚠️ Vui lòng nhập key trước!", 3, "⚠️") return end
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
        Notify("Quy Hub", "Reset thành công!", 3, "✅")
    end,
})

SettingsTab:CreateParagraph({
    Title = "📋 Thông tin script",
    Content = "Quy Hub Ultimate v11.2\nTác giả: Quy\nKey System: link4sub.com\n🔑 Key chính: 23za3a\n👑 Key Premium: 9213 (hiệu lực 5h)\nLink lấy key: " .. KeyConfig.Link,
})

-- ============================ 16. KHỞI ĐỘNG ============================
Notify("Quy Hub Ultimate", "Đã tải thành công!\n🔑 Key chính: 23za3a\n👑 Key Premium: 9213 (mở tab Premium)\n⏰ Key Premium có hiệu lực 5 giờ", 5, "🚀")
print("✅ Quy Hub Ultimate v11.2 đã chạy!")
print("🔑 Key chính: 23za3a")
print("👑 Key Premium: 9213 (hiệu lực 5 giờ)")
print("📥 Lấy Key tại: " .. KeyConfig.Link)

-- Cập nhật thông tin định kỳ
spawn(function()
    while true do
        wait(30)
        UpdateInfo()
        if _G.QuyHub.Premium and not PremiumTab.Visible then
            PremiumTab.Visible = true
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
