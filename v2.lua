--[[
    FAKE FOXNAME | DEAD RAIL PRIVATE LOADER
    Disguise as Foxname style
    Features: Key ALO (auto save), Minimize to purple circle "Menu",
              Auto Bring, Advanced Dupe, Train Speed Bypass,
              Kill Aura, Silent Aim, ESP, Auto Farm, Godmode, etc.
    Author: Axiom
]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local TeleportService = game:GetService("TeleportService")
local VirtualUser = game:GetService("VirtualUser")
local StarterGui = game:GetService("StarterGui")
local ProximityPromptService = game:GetService("ProximityPromptService")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

--==================== KEY SYSTEM ====================
local DEFAULT_KEY = "ALO"
local KEY_FILE = "FakeFoxname_Key.txt"
local VALID_KEYS = {["ALO"] = true, ["FOXNAME"] = true, ["AXIOM"] = true}

local function SaveKey(k) pcall(function() writefile(KEY_FILE, k) end) end
local function LoadSavedKey()
    local s, k = pcall(function() return isfile(KEY_FILE) and readfile(KEY_FILE) end)
    return s and k or nil
end
local function CheckKey(k)
    k = k:gsub("%s+", ""):upper()
    return VALID_KEYS[k] or k == DEFAULT_KEY
end

local KeyGui = Instance.new("ScreenGui")
KeyGui.Name = "FoxKey"
KeyGui.ResetOnSpawn = false
pcall(function() KeyGui.Parent = CoreGui end)
if not KeyGui.Parent then KeyGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

local KF = Instance.new("Frame")
KF.Size = UDim2.new(0, 380, 0, 240)
KF.Position = UDim2.new(0.5, -190, 0.5, -120)
KF.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
KF.BorderSizePixel = 0
KF.Parent = KeyGui
Instance.new("UICorner", KF).CornerRadius = UDim.new(0, 12)

local Acc = Instance.new("Frame")
Acc.Size = UDim2.new(1, 0, 0, 4)
Acc.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
Acc.BorderSizePixel = 0
Acc.Parent = KF

local KT = Instance.new("TextLabel")
KT.Size = UDim2.new(1, 0, 0, 34)
KT.Position = UDim2.new(0, 0, 0, 12)
KT.BackgroundTransparency = 1
KT.Text = "FAKE FOXNAME | DEAD RAIL"
KT.TextColor3 = Color3.fromRGB(240, 240, 240)
KT.Font = Enum.Font.GothamBold
KT.TextSize = 17
KT.Parent = KF

local Hint = Instance.new("TextLabel")
Hint.Size = UDim2.new(1, -20, 0, 20)
Hint.Position = UDim2.new(0, 10, 0, 48)
Hint.BackgroundTransparency = 1
Hint.Text = "Key mặc định: ALO"
Hint.TextColor3 = Color3.fromRGB(170, 0, 255)
Hint.Font = Enum.Font.Gotham
Hint.TextSize = 13
Hint.Parent = KF

local KB = Instance.new("TextBox")
KB.Size = UDim2.new(0.86, 0, 0, 40)
KB.Position = UDim2.new(0.07, 0, 0, 78)
KB.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
KB.Text = LoadSavedKey() or ""
KB.PlaceholderText = "Nhập key..."
KB.TextColor3 = Color3.fromRGB(255, 255, 255)
KB.PlaceholderColor3 = Color3.fromRGB(120, 120, 130)
KB.Font = Enum.Font.Gotham
KB.TextSize = 14
KB.Parent = KF
Instance.new("UICorner", KB).CornerRadius = UDim.new(0, 8)

local SB = Instance.new("TextButton")
SB.Size = UDim2.new(0.86, 0, 0, 42)
SB.Position = UDim2.new(0.07, 0, 0, 135)
SB.BackgroundColor3 = Color3.fromRGB(140, 0, 220)
SB.Text = "VERIFY + SAVE"
SB.TextColor3 = Color3.fromRGB(255, 255, 255)
SB.Font = Enum.Font.GothamBold
SB.TextSize = 15
SB.Parent = KF
Instance.new("UICorner", SB).CornerRadius = UDim.new(0, 8)

local ST = Instance.new("TextLabel")
ST.Size = UDim2.new(1, 0, 0, 24)
ST.Position = UDim2.new(0, 0, 1, -30)
ST.BackgroundTransparency = 1
ST.Text = ""
ST.TextColor3 = Color3.fromRGB(255, 60, 60)
ST.Font = Enum.Font.Gotham
ST.TextSize = 13
ST.Parent = KF

local function Notify(t, tx, d)
    pcall(function()
        StarterGui:SetCore("SendNotification", {Title = t, Text = tx, Duration = d or 4})
    end)
end

SB.MouseButton1Click:Connect(function()
    local input = KB.Text:gsub("%s+", "")
    if CheckKey(input) then
        SaveKey(input)
        ST.TextColor3 = Color3.fromRGB(0, 255, 140)
        ST.Text = "KEY OK - LOADING..."
        task.wait(0.6)
        KeyGui:Destroy()
        LoadMain()
    else
        ST.Text = "KEY SAI - Thử ALO"
        KB.Text = ""
    end
end)

task.spawn(function()
    task.wait(0.25)
    local saved = LoadSavedKey()
    if saved and CheckKey(saved) then
        ST.TextColor3 = Color3.fromRGB(0, 255, 140)
        ST.Text = "AUTO KEY..."
        task.wait(0.5)
        KeyGui:Destroy()
        LoadMain()
    end
end)

--==================== MAIN ====================
function LoadMain()
    pcall(function()
        local mt = getrawmetatable(game)
        setreadonly(mt, false)
        local old = mt.__namecall
        mt.__namecall = newcclosure(function(self, ...)
            local m = getnamecallmethod()
            if m == "Kick" or m == "kick" then return nil end
            return old(self, ...)
        end)
        setreadonly(mt, true)
    end)

    Notify("Fake Foxname", "Loaded | Dead Rail Private", 5)

    local Config = {
        ESP = {Enabled = true, Players = true, Items = true, MaxDistance = 3000,
               ColorEnemy = Color3.fromRGB(255, 50, 50), ColorItem = Color3.fromRGB(255, 215, 0)},
        Combat = {KillAura = false, AuraRange = 32, SilentAim = false, FOV = 160, Prediction = true, Godmode = false},
        Farm = {AutoCollect = true, AutoRepair = true, AutoHeal = true, CollectRange = 55, InstantPrompt = true, AutoBring = false, BringRange = 80},
        Movement = {Speed = false, SpeedValue = 36, Fly = false, FlySpeed = 85, Noclip = false, InfiniteJump = false,
                    TrainBypass = false, TrainSpeed = 130},
        Dupe = {Enabled = false, Amount = 8},
        Misc = {FullBright = false, NoFog = true, FPSBoost = true, AntiAFK = true}
    }

    local function SaveConfig()
        pcall(function() writefile("FakeFoxname_Config.json", HttpService:JSONEncode(Config)) end)
        Notify("Config", "Saved", 3)
    end
    pcall(function()
        if isfile("FakeFoxname_Config.json") then
            local d = HttpService:JSONDecode(readfile("FakeFoxname_Config.json"))
            for k, v in pairs(d) do if type(v) == "table" and Config[k] then for k2, v2 in pairs(v) do Config[k][k2] = v2 end end end
        end
    end)

    --==================== UI + MINIMIZE ====================
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "FakeFoxname"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    pcall(function() ScreenGui.Parent = CoreGui end)
    if not ScreenGui.Parent then ScreenGui.Parent = LocalPlayer.PlayerGui end

    local Main = Instance.new("Frame")
    Main.Name = "Main"
    Main.Size = UDim2.new(0, 620, 0, 470)
    Main.Position = UDim2.new(0.5, -310, 0.5, -235)
    Main.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
    Main.BorderSizePixel = 0
    Main.Active = true
    Main.Draggable = true
    Main.Visible = true
    Main.Parent = ScreenGui
    Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 12)

    local TopBar = Instance.new("Frame")
    TopBar.Size = UDim2.new(1, 0, 0, 4)
    TopBar.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
    TopBar.BorderSizePixel = 0
    TopBar.Parent = Main

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, -90, 0, 34)
    Title.Position = UDim2.new(0, 14, 0, 10)
    Title.BackgroundTransparency = 1
    Title.Text = "FAKE FOXNAME | DEAD RAIL"
    Title.TextColor3 = Color3.fromRGB(240, 240, 240)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 16
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = Main

    local MinBtn = Instance.new("TextButton")
    MinBtn.Size = UDim2.new(0, 30, 0, 30)
    MinBtn.Position = UDim2.new(1, -70, 0, 8)
    MinBtn.BackgroundTransparency = 1
    MinBtn.Text = "–"
    MinBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    MinBtn.Font = Enum.Font.GothamBold
    MinBtn.TextSize = 22
    MinBtn.Parent = Main

    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Size = UDim2.new(0, 30, 0, 30)
    CloseBtn.Position = UDim2.new(1, -38, 0, 8)
    CloseBtn.BackgroundTransparency = 1
    CloseBtn.Text = "×"
    CloseBtn.TextColor3 = Color3.fromRGB(255, 70, 70)
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.TextSize = 22
    CloseBtn.Parent = Main
    CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

    -- Minimize Circle (purple)
    local Mini = Instance.new("TextButton")
    Mini.Name = "MiniCircle"
    Mini.Size = UDim2.new(0, 56, 0, 56)
    Mini.Position = UDim2.new(0, 18, 1, -74)
    Mini.BackgroundColor3 = Color3.fromRGB(140, 0, 220)
    Mini.Text = "Menu"
    Mini.TextColor3 = Color3.fromRGB(255, 255, 255)
    Mini.Font = Enum.Font.GothamBold
    Mini.TextSize = 13
    Mini.Visible = false
    Mini.Parent = ScreenGui
    Instance.new("UICorner", Mini).CornerRadius = UDim.new(1, 0)
    local MiniStroke = Instance.new("UIStroke", Mini)
    MiniStroke.Color = Color3.fromRGB(200, 80, 255)
    MiniStroke.Thickness = 2

    -- Make Mini draggable
    local dragging, dragStart, startPos
    Mini.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = Mini.Position
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            Mini.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    MinBtn.MouseButton1Click:Connect(function()
        Main.Visible = false
        Mini.Visible = true
    end)
    Mini.MouseButton1Click:Connect(function()
        Main.Visible = true
        Mini.Visible = false
    end)

    -- Tabs
    local TabFrame = Instance.new("Frame")
    TabFrame.Size = UDim2.new(0, 145, 1, -55)
    TabFrame.Position = UDim2.new(0, 10, 0, 48)
    TabFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
    TabFrame.BorderSizePixel = 0
    TabFrame.Parent = Main
    Instance.new("UICorner", TabFrame).CornerRadius = UDim.new(0, 8)

    local Content = Instance.new("Frame")
    Content.Size = UDim2.new(1, -170, 1, -60)
    Content.Position = UDim2.new(0, 162, 0, 48)
    Content.BackgroundColor3 = Color3.fromRGB(16, 16, 22)
    Content.BorderSizePixel = 0
    Content.Parent = Main
    Instance.new("UICorner", Content).CornerRadius = UDim.new(0, 8)

    local Tabs, Current = {}, nil
    local function AddTab(name)
        local Btn = Instance.new("TextButton")
        Btn.Size = UDim2.new(1, -12, 0, 36)
        Btn.Position = UDim2.new(0, 6, 0, #Tabs * 44 + 8)
        Btn.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
        Btn.Text = name
        Btn.TextColor3 = Color3.fromRGB(200, 200, 210)
        Btn.Font = Enum.Font.GothamSemibold
        Btn.TextSize = 13
        Btn.Parent = TabFrame
        Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 6)

        local Page = Instance.new("ScrollingFrame")
        Page.Size = UDim2.new(1, -10, 1, -10)
        Page.Position = UDim2.new(0, 5, 0, 5)
        Page.BackgroundTransparency = 1
        Page.ScrollBarThickness = 3
        Page.ScrollBarImageColor3 = Color3.fromRGB(170, 0, 255)
        Page.CanvasSize = UDim2.new(0, 0, 0, 0)
        Page.Visible = false
        Page.Parent = Content
        local Lay = Instance.new("UIListLayout", Page)
        Lay.Padding = UDim.new(0, 6)
        Lay:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            Page.CanvasSize = UDim2.new(0, 0, 0, Lay.AbsoluteContentSize.Y + 20)
        end)

        Btn.MouseButton1Click:Connect(function()
            if Current then Current.Visible = false end
            Page.Visible = true
            Current = Page
            for _, b in pairs(TabFrame:GetChildren()) do
                if b:IsA("TextButton") then b.BackgroundColor3 = Color3.fromRGB(28, 28, 36) end
            end
            Btn.BackgroundColor3 = Color3.fromRGB(120, 0, 200)
        end)

        table.insert(Tabs, true)
        if #Tabs == 1 then
            Btn.BackgroundColor3 = Color3.fromRGB(120, 0, 200)
            Page.Visible = true
            Current = Page
        end

        local API = {}
        function API:Toggle(txt, def, cb)
            local F = Instance.new("Frame")
            F.Size = UDim2.new(1, -4, 0, 32)
            F.BackgroundColor3 = Color3.fromRGB(24, 24, 30)
            F.Parent = Page
            Instance.new("UICorner", F).CornerRadius = UDim.new(0, 6)
            local L = Instance.new("TextLabel")
            L.Size = UDim2.new(1, -52, 1, 0)
            L.Position = UDim2.new(0, 10, 0, 0)
            L.BackgroundTransparency = 1
            L.Text = txt
            L.TextColor3 = Color3.fromRGB(230, 230, 235)
            L.Font = Enum.Font.Gotham
            L.TextSize = 13
            L.TextXAlignment = Enum.TextXAlignment.Left
            L.Parent = F
            local T = Instance.new("TextButton")
            T.Size = UDim2.new(0, 40, 0, 20)
            T.Position = UDim2.new(1, -48, 0.5, -10)
            T.BackgroundColor3 = def and Color3.fromRGB(140, 0, 220) or Color3.fromRGB(50, 50, 60)
            T.Text = ""
            T.Parent = F
            Instance.new("UICorner", T).CornerRadius = UDim.new(1, 0)
            local st = def
            T.MouseButton1Click:Connect(function()
                st = not st
                T.BackgroundColor3 = st and Color3.fromRGB(140, 0, 220) or Color3.fromRGB(50, 50, 60)
                cb(st)
            end)
            return API
        end
        function API:Slider(txt, min, max, def, cb)
            local F = Instance.new("Frame")
            F.Size = UDim2.new(1, -4, 0, 50)
            F.BackgroundColor3 = Color3.fromRGB(24, 24, 30)
            F.Parent = Page
            Instance.new("UICorner", F).CornerRadius = UDim.new(0, 6)
            local L = Instance.new("TextLabel")
            L.Size = UDim2.new(1, -16, 0, 20)
            L.Position = UDim2.new(0, 10, 0, 4)
            L.BackgroundTransparency = 1
            L.Text = txt .. ": " .. def
            L.TextColor3 = Color3.fromRGB(230, 230, 235)
            L.Font = Enum.Font.Gotham
            L.TextSize = 13
            L.TextXAlignment = Enum.TextXAlignment.Left
            L.Parent = F
            local BG = Instance.new("Frame")
            BG.Size = UDim2.new(1, -20, 0, 6)
            BG.Position = UDim2.new(0, 10, 0, 30)
            BG.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
            BG.Parent = F
            Instance.new("UICorner", BG).CornerRadius = UDim.new(1, 0)
            local Fill = Instance.new("Frame")
            Fill.Size = UDim2.new((def - min) / (max - min), 0, 1, 0)
            Fill.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
            Fill.Parent = BG
            Instance.new("UICorner", Fill).CornerRadius = UDim.new(1, 0)
            local drag = false
            BG.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then drag = true end end)
            UserInputService.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then drag = false end end)
            UserInputService.InputChanged:Connect(function(i)
                if drag and i.UserInputType == Enum.UserInputType.MouseMovement then
                    local pct = math.clamp((i.Position.X - BG.AbsolutePosition.X) / BG.AbsoluteSize.X, 0, 1)
                    local val = math.floor(min + (max - min) * pct)
                    Fill.Size = UDim2.new(pct, 0, 1, 0)
                    L.Text = txt .. ": " .. val
                    cb(val)
                end
            end)
            return API
        end
        function API:Button(txt, cb)
            local B = Instance.new("TextButton")
            B.Size = UDim2.new(1, -4, 0, 34)
            B.BackgroundColor3 = Color3.fromRGB(120, 0, 200)
            B.Text = txt
            B.TextColor3 = Color3.fromRGB(255, 255, 255)
            B.Font = Enum.Font.GothamSemibold
            B.TextSize = 13
            B.Parent = Page
            Instance.new("UICorner", B).CornerRadius = UDim.new(0, 6)
            B.MouseButton1Click:Connect(cb)
            return API
        end
        return API
    end

    local Combat = AddTab("Combat")
    Combat:Toggle("Kill Aura", Config.Combat.KillAura, function(v) Config.Combat.KillAura = v end)
    Combat:Slider("Aura Range", 10, 60, Config.Combat.AuraRange, function(v) Config.Combat.AuraRange = v end)
    Combat:Toggle("Silent Aim", Config.Combat.SilentAim, function(v) Config.Combat.SilentAim = v end)
    Combat:Slider("FOV", 50, 400, Config.Combat.FOV, function(v) Config.Combat.FOV = v end)
    Combat:Toggle("Prediction", Config.Combat.Prediction, function(v) Config.Combat.Prediction = v end)
    Combat:Toggle("Godmode", Config.Combat.Godmode, function(v) Config.Combat.Godmode = v end)

    local Farm = AddTab("Auto Farm")
    Farm:Toggle("Auto Collect", Config.Farm.AutoCollect, function(v) Config.Farm.AutoCollect = v end)
    Farm:Toggle("Auto Repair", Config.Farm.AutoRepair, function(v) Config.Farm.AutoRepair = v end)
    Farm:Toggle("Auto Heal", Config.Farm.AutoHeal, function(v) Config.Farm.AutoHeal = v end)
    Farm:Toggle("Instant Prompt", Config.Farm.InstantPrompt, function(v) Config.Farm.InstantPrompt = v end)
    Farm:Toggle("Auto Bring Items", Config.Farm.AutoBring, function(v) Config.Farm.AutoBring = v end)
    Farm:Slider("Bring Range", 30, 150, Config.Farm.BringRange, function(v) Config.Farm.BringRange = v end)
    Farm:Slider("Collect Range", 20, 100, Config.Farm.CollectRange, function(v) Config.Farm.CollectRange = v end)
    Farm:Button("Force Collect All", function()
        for _, o in pairs(Workspace:GetDescendants()) do
            if o:IsA("ProximityPrompt") then pcall(fireproximityprompt, o) end
        end
        Notify("Farm", "Force collect done", 3)
    end)

    local Move = AddTab("Movement")
    Move:Toggle("Speed", Config.Movement.Speed, function(v) Config.Movement.Speed = v end)
    Move:Slider("Speed Value", 16, 120, Config.Movement.SpeedValue, function(v) Config.Movement.SpeedValue = v end)
    Move:Toggle("Fly", Config.Movement.Fly, function(v) Config.Movement.Fly = v end)
    Move:Slider("Fly Speed", 30, 200, Config.Movement.FlySpeed, function(v) Config.Movement.FlySpeed = v end)
    Move:Toggle("Noclip", Config.Movement.Noclip, function(v) Config.Movement.Noclip = v end)
    Move:Toggle("Infinite Jump", Config.Movement.InfiniteJump, function(v) Config.Movement.InfiniteJump = v end)
    Move:Toggle("Train Speed Bypass", Config.Movement.TrainBypass, function(v) Config.Movement.TrainBypass = v end)
    Move:Slider("Train Speed", 50, 300, Config.Movement.TrainSpeed, function(v) Config.Movement.TrainSpeed = v end)

    local Dupe = AddTab("Dupe")
    Dupe:Toggle("Enable Dupe", Config.Dupe.Enabled, function(v) Config.Dupe.Enabled = v end)
    Dupe:Slider("Dupe Amount", 1, 25, Config.Dupe.Amount, function(v) Config.Dupe.Amount = v end)
    Dupe:Button("Execute Dupe (Hold Item)", function()
        if not Config.Dupe.Enabled then Notify("Dupe", "Bật Enable trước", 3) return end
        local char = LocalPlayer.Character
        local tool = char and char:FindFirstChildOfClass("Tool")
        if not tool then Notify("Dupe", "Cầm item vào tay", 3) return end
        for i = 1, Config.Dupe.Amount do
            pcall(function() tool:Clone().Parent = LocalPlayer.Backpack end)
            task.wait(0.04)
        end
        Notify("Dupe", "Duped x" .. Config.Dupe.Amount, 4)
    end)

    local ESP = AddTab("ESP")
    ESP:Toggle("Enable ESP", Config.ESP.Enabled, function(v) Config.ESP.Enabled = v end)
    ESP:Toggle("Player ESP", Config.ESP.Players, function(v) Config.ESP.Players = v end)
    ESP:Toggle("Item ESP", Config.ESP.Items, function(v) Config.ESP.Items = v end)
    ESP:Slider("Max Distance", 500, 8000, Config.ESP.MaxDistance, function(v) Config.ESP.MaxDistance = v end)

    local Misc = AddTab("Misc")
    Misc:Toggle("Fullbright", Config.Misc.FullBright, function(v)
        Config.Misc.FullBright = v
        if v then Lighting.Brightness = 2.5 Lighting.ClockTime = 14 Lighting.FogEnd = 9e9 Lighting.GlobalShadows = false end
    end)
    Misc:Toggle("No Fog", Config.Misc.NoFog, function(v) Config.Misc.NoFog = v end)
    Misc:Toggle("FPS Boost", Config.Misc.FPSBoost, function(v) if v then settings().Rendering.QualityLevel = Enum.QualityLevel.Level01 end end)
    Misc:Toggle("Anti AFK", Config.Misc.AntiAFK, function(v) Config.Misc.AntiAFK = v end)
    Misc:Button("Save Config", SaveConfig)
    Misc:Button("Rejoin", function() TeleportService:Teleport(game.PlaceId, LocalPlayer) end)

    -- ESP Folder
    local ESPFolder = Instance.new("Folder", CoreGui)
    ESPFolder.Name = "FoxESP"

    local function DrawESP(ad, col, txt)
        local bb = Instance.new("BillboardGui")
        bb.AlwaysOnTop = true
        bb.Size = UDim2.new(0, 220, 0, 36)
        bb.StudsOffset = Vector3.new(0, 2.6, 0)
        bb.Adornee = ad
        bb.Parent = ESPFolder
        local l = Instance.new("TextLabel")
        l.Size = UDim2.new(1, 0, 1, 0)
        l.BackgroundTransparency = 1
        l.Text = txt
        l.TextColor3 = col
        l.TextStrokeTransparency = 0.3
        l.Font = Enum.Font.GothamBold
        l.TextSize = 12
        l.Parent = bb
    end

    if Config.Farm.InstantPrompt then
        ProximityPromptService.PromptButtonHoldBegan:Connect(function(p)
            if Config.Farm.InstantPrompt then fireproximityprompt(p) end
        end)
    end

    LocalPlayer.Idled:Connect(function()
        if Config.Misc.AntiAFK then
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end
    end)

    RunService.Heartbeat:Connect(function()
        local char = LocalPlayer.Character
        if not char then return end
        local hum = char:FindFirstChildOfClass("Humanoid")
        local root = char:FindFirstChild("HumanoidRootPart")
        if not hum or not root then return end

        if Config.Movement.Speed then hum.WalkSpeed = Config.Movement.SpeedValue end
        if Config.Movement.InfiniteJump then hum.JumpPower = 95 end
        if Config.Combat.Godmode then hum.Health = hum.MaxHealth end

        if Config.Movement.Noclip then
            for _, p in pairs(char:GetDescendants()) do
                if p:IsA("BasePart") then p.CanCollide = false end
            end
        end

        if Config.Movement.Fly then
            local bv = root:FindFirstChild("FlyF") or Instance.new("BodyVelocity")
            bv.Name = "FlyF"
            bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
            bv.Parent = root
            local dir = Vector3.zero
            local cf = Camera.CFrame
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir = dir + cf.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir = dir - cf.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir = dir - cf.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir = dir + cf.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir = dir + Vector3.yAxis end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then dir = dir - Vector3.yAxis end
            bv.Velocity = dir.Magnitude > 0 and dir.Unit * Config.Movement.FlySpeed or Vector3.zero
        else
            local o = root:FindFirstChild("FlyF")
            if o then o:Destroy() end
        end

        if Config.Movement.TrainBypass then
            for _, obj in pairs(Workspace:GetDescendants()) do
                if obj:IsA("BasePart") and (obj.Name:lower():find("train") or obj.Name:lower():find("engine") or obj.Name:lower():find("loco") or obj.Name:lower():find("cart")) then
                    local bf = obj:FindFirstChild("TrainF") or Instance.new("BodyVelocity")
                    bf.Name = "TrainF"
                    bf.MaxForce = Vector3.new(1e6, 0, 1e6)
                    bf.Velocity = obj.CFrame.LookVector * Config.Movement.TrainSpeed
                    bf.Parent = obj
                end
            end
        end
    end)

    RunService.RenderStepped:Connect(function()
        local char = LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if not root then return end

        if Config.Combat.KillAura then
            for _, plr in pairs(Players:GetPlayers()) do
                if plr ~= LocalPlayer and plr.Character then
                    local tr = plr.Character:FindFirstChild("HumanoidRootPart")
                    local th = plr.Character:FindFirstChildOfClass("Humanoid")
                    if tr and th and th.Health > 0 and (root.Position - tr.Position).Magnitude <= Config.Combat.AuraRange then
                        pcall(function()
                            local tool = char:FindFirstChildOfClass("Tool")
                            if tool then tool:Activate() end
                        end)
                    end
                end
            end
        end

        -- Auto Collect / Repair / Heal + Auto Bring
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj:IsA("ProximityPrompt") then
                local n = (obj.Parent and obj.Parent.Name or ""):lower()
                local part = obj.Parent:IsA("BasePart") and obj.Parent or obj.Parent:FindFirstChildWhichIsA("BasePart")
                if part then
                    local d = (root.Position - part.Position).Magnitude
                    if Config.Farm.AutoBring and d <= Config.Farm.BringRange and (n:find("gold") or n:find("ammo") or n:find("med") or n:find("crate") or n:find("loot")) then
                        pcall(function() part.CFrame = root.CFrame * CFrame.new(0, 0, -3) end)
                    end
                    if d <= Config.Farm.CollectRange then
                        if Config.Farm.AutoCollect and (n:find("gold") or n:find("ammo") or n:find("med") or n:find("crate") or n:find("loot")) then
                            pcall(fireproximityprompt, obj)
                        end
                        if Config.Farm.AutoRepair and (n:find("repair") or n:find("fix") or n:find("engine")) then
                            pcall(fireproximityprompt, obj)
                        end
                        if Config.Farm.AutoHeal and (n:find("heal") or n:find("medkit") or n:find("bandage")) then
                            pcall(fireproximityprompt, obj)
                        end
                    end
                end
            end
        end
    end)

    task.spawn(function()
        while true do
            task.wait(0.35)
            ESPFolder:ClearAllChildren()
            if not Config.ESP.Enabled then continue end
            local my = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if Config.ESP.Players then
                for _, plr in pairs(Players:GetPlayers()) do
                    if plr ~= LocalPlayer and plr.Character then
                        local r = plr.Character:FindFirstChild("HumanoidRootPart")
                        local h = plr.Character:FindFirstChildOfClass("Humanoid")
                        if r and h and h.Health > 0 and my then
                            local dist = (my.Position - r.Position).Magnitude
                            if dist <= Config.ESP.MaxDistance then
                                DrawESP(r, Config.ESP.ColorEnemy, plr.Name .. " | " .. math.floor(dist) .. "m | " .. math.floor(h.Health))
                            end
                        end
                    end
                end
            end
            if Config.ESP.Items then
                for _, obj in pairs(Workspace:GetDescendants()) do
                    if obj:IsA("ProximityPrompt") then
                        local n = obj.Parent and obj.Parent.Name or ""
                        if n:lower():find("gold") or n:lower():find("ammo") or n:lower():find("med") or n:lower():find("crate") then
                            local part = obj.Parent:FindFirstChildWhichIsA("BasePart") or obj.Parent
                            if part and my then
                                local dist = (my.Position - part.Position).Magnitude
                                if dist <= Config.ESP.MaxDistance then
                                    DrawESP(part, Config.ESP.ColorItem, n .. " | " .. math.floor(dist) .. "m")
                                end
                            end
                        end
                    end
                end
            end
        end
    end)

    local function GetClosest()
        local c, d = nil, Config.Combat.FOV
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character then
                local r = plr.Character:FindFirstChild("HumanoidRootPart")
                local h = plr.Character:FindFirstChildOfClass("Humanoid")
                if r and h and h.Health > 0 then
                    local pos, vis = Camera:WorldToViewportPoint(r.Position)
                    if vis then
                        local mag = (Vector2.new(pos.X, pos.Y) - UserInputService:GetMouseLocation()).Magnitude
                        if mag < d then d = mag c = r end
                    end
                end
            end
        end
        return c
    end

    pcall(function()
        local mt = getrawmetatable(game)
        setreadonly(mt, false)
        local old = mt.__index
        mt.__index = newcclosure(function(self, k)
            if Config.Combat.SilentAim and self == Mouse and (k == "Hit" or k == "Target") then
                local t = GetClosest()
                if t then
                    if Config.Combat.Prediction then
                        return CFrame.new(t.Position + (t.AssemblyLinearVelocity or Vector3.zero) * 0.13)
                    end
                    return CFrame.new(t.Position)
                end
            end
            return old(self, k)
        end)
        setreadonly(mt, true)
    end)

    Notify("Fake Foxname", "All features ready | Minimize = purple circle", 5)
end
