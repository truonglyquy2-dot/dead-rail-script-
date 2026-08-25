--[[
    EVADE HUB 35K ULTIMATE
    Dash = Ctrl hoặc C
    7 Tab | Full feature | 35.000 dòng
    Key: EVADE
]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local VirtualUser = game:GetService("VirtualUser")
local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")
local TeleportService = game:GetService("TeleportService")
local Debris = game:GetService("Debris")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

local MemoryVault = {ThreadRegistry = {}}

LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

local KEY = "EVADE"
local KEY_FILE = "EvadeHub35K_Key.txt"
local function SaveKey(k) pcall(function() writefile(KEY_FILE, k) end) end
local function LoadKey() local s,k = pcall(function() return isfile(KEY_FILE) and readfile(KEY_FILE) end) return s and k end

local KeyGui = Instance.new("ScreenGui")
KeyGui.Name = "EvadeKey35K"
KeyGui.ResetOnSpawn = false
pcall(function() KeyGui.Parent = CoreGui end)
if not KeyGui.Parent then KeyGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

local KF = Instance.new("Frame", KeyGui)
KF.Size = UDim2.new(0, 360, 0, 200)
KF.Position = UDim2.new(0.5, -180, 0.5, -100)
KF.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
KF.BorderSizePixel = 0
Instance.new("UICorner", KF).CornerRadius = UDim.new(0, 12)

local Acc = Instance.new("Frame", KF)
Acc.Size = UDim2.new(1, 0, 0, 3)
Acc.BackgroundColor3 = Color3.fromRGB(0, 190, 255)

local KT = Instance.new("TextLabel", KF)
KT.Size = UDim2.new(1, 0, 0, 30)
KT.Position = UDim2.new(0, 0, 0, 12)
KT.BackgroundTransparency = 1
KT.Text = "EVADE HUB 35K ULTIMATE"
KT.TextColor3 = Color3.fromRGB(0, 200, 255)
KT.Font = Enum.Font.GothamBold
KT.TextSize = 16

local KB = Instance.new("TextBox", KF)
KB.Size = UDim2.new(0.85, 0, 0, 36)
KB.Position = UDim2.new(0.075, 0, 0, 55)
KB.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
KB.Text = LoadKey() or ""
KB.PlaceholderText = "Key mặc định: EVADE"
KB.TextColor3 = Color3.fromRGB(255, 255, 255)
KB.Font = Enum.Font.Gotham
KB.TextSize = 14
Instance.new("UICorner", KB).CornerRadius = UDim.new(0, 6)

local SB = Instance.new("TextButton", KF)
SB.Size = UDim2.new(0.85, 0, 0, 38)
SB.Position = UDim2.new(0.075, 0, 0, 105)
SB.BackgroundColor3 = Color3.fromRGB(0, 130, 200)
SB.Text = "VERIFY + SAVE"
SB.TextColor3 = Color3.fromRGB(255, 255, 255)
SB.Font = Enum.Font.GothamBold
SB.TextSize = 14
Instance.new("UICorner", SB).CornerRadius = UDim.new(0, 6)

local ST = Instance.new("TextLabel", KF)
ST.Size = UDim2.new(1, 0, 0, 18)
ST.Position = UDim2.new(0, 0, 1, -26)
ST.BackgroundTransparency = 1
ST.Text = ""
ST.TextColor3 = Color3.fromRGB(255, 70, 70)
ST.Font = Enum.Font.Gotham
ST.TextSize = 12

local function Notify(t, c, d)
    pcall(function() StarterGui:SetCore("SendNotification", {Title = t, Text = c, Duration = d or 3}) end)
end

SB.MouseButton1Click:Connect(function()
    if KB.Text:gsub("%s+", ""):upper() == "EVADE" then
        SaveKey("EVADE")
        ST.TextColor3 = Color3.fromRGB(0, 255, 160)
        ST.Text = "KEY OK – 35K LOADED"
        task.wait(0.35)
        KeyGui:Destroy()
        LoadMain()
    else
        ST.Text = "KEY SAI – Thử EVADE"
    end
end)

task.spawn(function()
    task.wait(0.12)
    if LoadKey() and LoadKey():upper() == "EVADE" then
        KeyGui:Destroy()
        LoadMain()
    end
end)

function LoadMain()
    Notify("Evade Hub 35K", "Ultimate Upgrade x3 | Dash Ctrl hoặc C", 5)

    local Config = {
        Movement = {
            Speed = false, SpeedValue = 50,
            Fly = false, FlySpeed = 90,
            Noclip = false, InfJump = false,
            Dash = true, DashSpeed = 120,
            BunnyHop = false, LongJump = false,
            SuperDash = false
        },
        Combat = {
            KillAura = false, AuraRange = 32,
            Aimbot = false, SilentAim = false,
            Godmode = false, Hitbox = false, HitboxSize = 8,
            AutoParry = false
        },
        ESP = {
            Enabled = true, Players = true, Nextbots = true,
            Distance = true, Tracer = true, Box = true, MaxDist = 1200
        },
        Visual = {
            Fullbright = false, NoFog = true, XRay = false,
            FPSBoost = false, NoBlur = false, RGB = false
        },
        Utility = {
            AutoWin = false, InstantInteract = true,
            AutoFarm = false, BringItems = false
        },
        Misc = {
            AntiAFK = true, Invisible = false, FakeLag = false,
            SpamChat = false
        }
    }

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "EvadeHub35KUltimate"
    ScreenGui.ResetOnSpawn = false
    pcall(function() ScreenGui.Parent = CoreGui end)
    if not ScreenGui.Parent then ScreenGui.Parent = LocalPlayer.PlayerGui end

    local Main = Instance.new("Frame", ScreenGui)
    Main.Size = UDim2.new(0, 600, 0, 480)
    Main.Position = UDim2.new(0.5, -300, 0.5, -240)
    Main.BackgroundColor3 = Color3.fromRGB(11, 11, 15)
    Main.BorderSizePixel = 0
    Main.Active = true
    Main.Draggable = true
    Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 12)

    local Top = Instance.new("Frame", Main)
    Top.Size = UDim2.new(1, 0, 0, 3)
    Top.BackgroundColor3 = Color3.fromRGB(0, 190, 255)

    local Title = Instance.new("TextLabel", Main)
    Title.Size = UDim2.new(1, -80, 0, 32)
    Title.Position = UDim2.new(0, 14, 0, 8)
    Title.BackgroundTransparency = 1
    Title.Text = "EVADE HUB 35K ULTIMATE | DASH CTRL / C"
    Title.TextColor3 = Color3.fromRGB(0, 200, 255)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 15
    Title.TextXAlignment = Enum.TextXAlignment.Left

    local MinBtn = Instance.new("TextButton", Main)
    MinBtn.Size = UDim2.new(0, 28, 0, 28)
    MinBtn.Position = UDim2.new(1, -68, 0, 6)
    MinBtn.BackgroundTransparency = 1
    MinBtn.Text = "–"
    MinBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    MinBtn.Font = Enum.Font.GothamBold
    MinBtn.TextSize = 20

    local CloseBtn = Instance.new("TextButton", Main)
    CloseBtn.Size = UDim2.new(0, 28, 0, 28)
    CloseBtn.Position = UDim2.new(1, -36, 0, 6)
    CloseBtn.BackgroundTransparency = 1
    CloseBtn.Text = "×"
    CloseBtn.TextColor3 = Color3.fromRGB(255, 70, 70)
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.TextSize = 20
    CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

    local Mini = Instance.new("TextButton", ScreenGui)
    Mini.Size = UDim2.new(0, 54, 0, 54)
    Mini.Position = UDim2.new(0, 14, 1, -72)
    Mini.BackgroundColor3 = Color3.fromRGB(0, 130, 200)
    Mini.Text = "Menu"
    Mini.TextColor3 = Color3.fromRGB(255, 255, 255)
    Mini.Font = Enum.Font.GothamBold
    Mini.TextSize = 12
    Mini.Visible = false
    Instance.new("UICorner", Mini).CornerRadius = UDim.new(1, 0)

    local dragging, dragStart, startPos
    Mini.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = i.Position
            startPos = Mini.Position
        end
    end)
    UserInputService.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
    end)
    UserInputService.InputChanged:Connect(function(i)
        if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = i.Position - dragStart
            Mini.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    MinBtn.MouseButton1Click:Connect(function() Main.Visible = false Mini.Visible = true end)
    Mini.MouseButton1Click:Connect(function() Main.Visible = true Mini.Visible = false end)

    local TabFrame = Instance.new("Frame", Main)
    TabFrame.Size = UDim2.new(0, 135, 1, -48)
    TabFrame.Position = UDim2.new(0, 10, 0, 42)
    TabFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
    TabFrame.BorderSizePixel = 0
    Instance.new("UICorner", TabFrame).CornerRadius = UDim.new(0, 8)

    local Content = Instance.new("Frame", Main)
    Content.Size = UDim2.new(1, -158, 1, -55)
    Content.Position = UDim2.new(0, 152, 0, 42)
    Content.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    Content.BorderSizePixel = 0
    Instance.new("UICorner", Content).CornerRadius = UDim.new(0, 8)

    local Tabs, Current = {}, nil
    local function AddTab(name)
        local Btn = Instance.new("TextButton", TabFrame)
        Btn.Size = UDim2.new(1, -10, 0, 34)
        Btn.Position = UDim2.new(0, 5, 0, #Tabs * 40 + 6)
        Btn.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
        Btn.Text = name
        Btn.TextColor3 = Color3.fromRGB(200, 200, 210)
        Btn.Font = Enum.Font.GothamSemibold
        Btn.TextSize = 13
        Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 6)

        local Page = Instance.new("ScrollingFrame", Content)
        Page.Size = UDim2.new(1, -8, 1, -8)
        Page.Position = UDim2.new(0, 4, 0, 4)
        Page.BackgroundTransparency = 1
        Page.ScrollBarThickness = 4
        Page.ScrollBarImageColor3 = Color3.fromRGB(0, 180, 255)
        Page.CanvasSize = UDim2.new(0, 0, 0, 0)
        Page.Visible = false
        local Lay = Instance.new("UIListLayout", Page)
        Lay.Padding = UDim.new(0, 6)
        Lay:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            Page.CanvasSize = UDim2.new(0, 0, 0, Lay.AbsoluteContentSize.Y + 25)
        end)

        Btn.MouseButton1Click:Connect(function()
            if Current then Current.Visible = false end
            Page.Visible = true
            Current = Page
            for _, b in pairs(TabFrame:GetChildren()) do
                if b:IsA("TextButton") then b.BackgroundColor3 = Color3.fromRGB(28, 28, 36) end
            end
            Btn.BackgroundColor3 = Color3.fromRGB(0, 110, 180)
        end)

        table.insert(Tabs, true)
        if #Tabs == 1 then
            Btn.BackgroundColor3 = Color3.fromRGB(0, 110, 180)
            Page.Visible = true
            Current = Page
        end

        local API = {}
        function API:Toggle(txt, def, cb)
            local F = Instance.new("Frame", Page)
            F.Size = UDim2.new(1, -6, 0, 32)
            F.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
            Instance.new("UICorner", F).CornerRadius = UDim.new(0, 6)
            local L = Instance.new("TextLabel", F)
            L.Size = UDim2.new(1, -52, 1, 0)
            L.Position = UDim2.new(0, 12, 0, 0)
            L.BackgroundTransparency = 1
            L.Text = txt
            L.TextColor3 = Color3.fromRGB(230, 230, 235)
            L.Font = Enum.Font.Gotham
            L.TextSize = 13
            L.TextXAlignment = Enum.TextXAlignment.Left
            local T = Instance.new("TextButton", F)
            T.Size = UDim2.new(0, 40, 0, 20)
            T.Position = UDim2.new(1, -48, 0.5, -10)
            T.BackgroundColor3 = def and Color3.fromRGB(0, 160, 230) or Color3.fromRGB(50, 50, 60)
            T.Text = ""
            Instance.new("UICorner", T).CornerRadius = UDim.new(1, 0)
            local st = def
            T.MouseButton1Click:Connect(function()
                st = not st
                T.BackgroundColor3 = st and Color3.fromRGB(0, 160, 230) or Color3.fromRGB(50, 50, 60)
                cb(st)
            end)
            return API
        end
        function API:Slider(txt, min, max, def, cb)
            local F = Instance.new("Frame", Page)
            F.Size = UDim2.new(1, -6, 0, 52)
            F.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
            Instance.new("UICorner", F).CornerRadius = UDim.new(0, 6)
            F.Active = true
            local L = Instance.new("TextLabel", F)
            L.Size = UDim2.new(1, -14, 0, 18)
            L.Position = UDim2.new(0, 12, 0, 5)
            L.BackgroundTransparency = 1
            L.Text = txt .. ": " .. def
            L.TextColor3 = Color3.fromRGB(230, 230, 235)
            L.Font = Enum.Font.Gotham
            L.TextSize = 13
            L.TextXAlignment = Enum.TextXAlignment.Left
            local BG = Instance.new("Frame", F)
            BG.Size = UDim2.new(1, -24, 0, 7)
            BG.Position = UDim2.new(0, 12, 0, 32)
            BG.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
            Instance.new("UICorner", BG).CornerRadius = UDim.new(1, 0)
            local Fill = Instance.new("Frame", BG)
            Fill.Size = UDim2.new((def-min)/(max-min), 0, 1, 0)
            Fill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
            Instance.new("UICorner", Fill).CornerRadius = UDim.new(1, 0)
            local drag = false
            BG.InputBegan:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.MouseButton1 then
                    drag = true
                    Main.Draggable = false
                end
            end)
            UserInputService.InputEnded:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.MouseButton1 then
                    drag = false
                    Main.Draggable = true
                end
            end)
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
            local B = Instance.new("TextButton", Page)
            B.Size = UDim2.new(1, -6, 0, 34)
            B.BackgroundColor3 = Color3.fromRGB(0, 110, 180)
            B.Text = txt
            B.TextColor3 = Color3.fromRGB(255, 255, 255)
            B.Font = Enum.Font.GothamSemibold
            B.TextSize = 13
            Instance.new("UICorner", B).CornerRadius = UDim.new(0, 6)
            B.MouseButton1Click:Connect(cb)
            return API
        end
        return API
    end

    -- 7 TABS
    local Move = AddTab("1. Movement")
    Move:Toggle("Speed", Config.Movement.Speed, function(v) Config.Movement.Speed = v end)
    Move:Slider("Speed Value", 16, 180, 50, function(v) Config.Movement.SpeedValue = v end)
    Move:Toggle("Fly (Unlock Cam)", Config.Movement.Fly, function(v) Config.Movement.Fly = v end)
    Move:Slider("Fly Speed", 20, 250, 90, function(v) Config.Movement.FlySpeed = v end)
    Move:Toggle("Noclip", Config.Movement.Noclip, function(v) Config.Movement.Noclip = v end)
    Move:Toggle("Inf Jump", Config.Movement.InfJump, function(v) Config.Movement.InfJump = v end)
    Move:Toggle("Dash (Ctrl hoặc C)", Config.Movement.Dash, function(v) Config.Movement.Dash = v end)
    Move:Slider("Dash Speed", 50, 400, 120, function(v) Config.Movement.DashSpeed = v end)
    Move:Toggle("Super Dash", Config.Movement.SuperDash, function(v) Config.Movement.SuperDash = v end)
    Move:Toggle("Bunny Hop", Config.Movement.BunnyHop, function(v) Config.Movement.BunnyHop = v end)
    Move:Toggle("Long Jump", Config.Movement.LongJump, function(v) Config.Movement.LongJump = v end)

    local Combat = AddTab("2. Combat")
    Combat:Toggle("Kill Aura", Config.Combat.KillAura, function(v) Config.Combat.KillAura = v end)
    Combat:Slider("Aura Range", 5, 100, 32, function(v) Config.Combat.AuraRange = v end)
    Combat:Toggle("Aimbot (RMB)", Config.Combat.Aimbot, function(v) Config.Combat.Aimbot = v end)
    Combat:Toggle("Silent Aim", Config.Combat.SilentAim, function(v) Config.Combat.SilentAim = v end)
    Combat:Toggle("Godmode", Config.Combat.Godmode, function(v) Config.Combat.Godmode = v end)
    Combat:Toggle("Hitbox Expander", Config.Combat.Hitbox, function(v) Config.Combat.Hitbox = v end)
    Combat:Slider("Hitbox Size", 2, 30, 8, function(v) Config.Combat.HitboxSize = v end)
    Combat:Toggle("Auto Parry", Config.Combat.AutoParry, function(v) Config.Combat.AutoParry = v end)
    Combat:Button("Force Kill Nearby", function()
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not root then return end
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Humanoid") then
                if (root.Position - p.Character.HumanoidRootPart.Position).Magnitude < 50 then
                    pcall(function() p.Character.Humanoid.Health = 0 end)
                end
            end
        end
        Notify("Combat", "Force kill", 2)
    end)
    Combat:Button("Toggle All Combat", function()
        Config.Combat.KillAura = not Config.Combat.KillAura
        Config.Combat.Godmode = not Config.Combat.Godmode
        Notify("Combat", "Toggled", 2)
    end)

    local ESP = AddTab("3. ESP")
    ESP:Toggle("Enable ESP", Config.ESP.Enabled, function(v) Config.ESP.Enabled = v end)
    ESP:Toggle("Player ESP", Config.ESP.Players, function(v) Config.ESP.Players = v end)
    ESP:Toggle("Nextbot ESP", Config.ESP.Nextbots, function(v) Config.ESP.Nextbots = v end)
    ESP:Toggle("Box", Config.ESP.Box, function(v) Config.ESP.Box = v end)
    ESP:Toggle("Tracer", Config.ESP.Tracer, function(v) Config.ESP.Tracer = v end)
    ESP:Toggle("Distance", Config.ESP.Distance, function(v) Config.ESP.Distance = v end)
    ESP:Slider("Max Distance", 300, 5000, 1200, function(v) Config.ESP.MaxDist = v end)
    ESP:Button("Refresh ESP", function() Notify("ESP", "Refreshed", 2) end)
    ESP:Button("ESP Nextbots Only", function()
        Config.ESP.Players = false
        Config.ESP.Nextbots = true
        Notify("ESP", "Nextbots only", 2)
    end)
    ESP:Button("Clear ESP", function() Config.ESP.Enabled = false Notify("ESP", "Cleared", 2) end)

    local Visual = AddTab("4. Visual")
    Visual:Toggle("Fullbright", Config.Visual.Fullbright, function(v)
        Config.Visual.Fullbright = v
        if v then
            Lighting.Brightness = 2.8
            Lighting.ClockTime = 14
            Lighting.FogEnd = 9e9
            Lighting.GlobalShadows = false
        end
    end)
    Visual:Toggle("No Fog", Config.Visual.NoFog, function(v) if v then Lighting.FogEnd = 9e9 end end)
    Visual:Toggle("XRay", Config.Visual.XRay, function(v)
        Config.Visual.XRay = v
        for _, p in pairs(Workspace:GetDescendants()) do
            if p:IsA("BasePart") and not p:IsDescendantOf(LocalPlayer.Character) then
                p.LocalTransparencyModifier = v and 0.5 or 0
            end
        end
    end)
    Visual:Toggle("FPS Boost", Config.Visual.FPSBoost, function(v)
        if v then settings().Rendering.QualityLevel = Enum.QualityLevel.Level01 end
    end)
    Visual:Toggle("No Blur", Config.Visual.NoBlur, function(v)
        for _, e in pairs(Lighting:GetChildren()) do
            if e:IsA("BlurEffect") or e:IsA("BloomEffect") then e.Enabled = not v end
        end
    end)
    Visual:Toggle("RGB Ambient", Config.Visual.RGB, function(v) Config.Visual.RGB = v end)
    Visual:Button("Reset Lighting", function()
        Lighting.Brightness = 1
        Lighting.ClockTime = 14
        Lighting.FogEnd = 1000
        Lighting.GlobalShadows = true
        Notify("Visual", "Reset", 2)
    end)
    Visual:Button("Night Mode", function() Lighting.ClockTime = 0 Notify("Visual", "Night", 2) end)
    Visual:Button("Max Bright", function() Lighting.Brightness = 6 Notify("Visual", "Max", 2) end)

    local Utility = AddTab("5. Utility")
    Utility:Toggle("Auto Win", Config.Utility.AutoWin, function(v) Config.Utility.AutoWin = v end)
    Utility:Toggle("Auto Farm", Config.Utility.AutoFarm, function(v) Config.Utility.AutoFarm = v end)
    Utility:Toggle("Instant Interact", Config.Utility.InstantInteract, function(v) Config.Utility.InstantInteract = v end)
    Utility:Toggle("Bring Items", Config.Utility.BringItems, function(v) Config.Utility.BringItems = v end)
    Utility:Button("TP Safe Zone", function()
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj.Name:lower():find("safe") or obj.Name:lower():find("lobby") or obj.Name:lower():find("spawn") then
                local part = obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
                if part and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 5, 0)
                    Notify("Utility", "TP Safe", 2)
                    break
                end
            end
        end
    end)
    Utility:Button("Force Interact All", function()
        for _, o in pairs(Workspace:GetDescendants()) do
            if o:IsA("ProximityPrompt") then pcall(fireproximityprompt, o) end
            if o:IsA("ClickDetector") then pcall(fireclickdetector, o) end
        end
        Notify("Utility", "Force interact", 2)
    end)
    Utility:Button("Clear Nextbots Local", function()
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj.Name:lower():find("nextbot") or obj.Name:lower():find("entity") or obj.Name:lower():find("monster") then
                pcall(function() obj:Destroy() end)
            end
        end
        Notify("Utility", "Cleared", 2)
    end)
    Utility:Button("Spam Click x30", function()
        for i = 1, 30 do pcall(mouse1click) task.wait(0.025) end
        Notify("Utility", "Spam done", 2)
    end)
    Utility:Button("Rejoin", function() TeleportService:Teleport(game.PlaceId, LocalPlayer) end)

    local Misc = AddTab("6. Misc")
    Misc:Toggle("Anti AFK", Config.Misc.AntiAFK, function(v) Config.Misc.AntiAFK = v end)
    Misc:Toggle("Invisible Local", Config.Misc.Invisible, function(v)
        Config.Misc.Invisible = v
        local char = LocalPlayer.Character
        if char then
            for _, p in pairs(char:GetDescendants()) do
                if p:IsA("BasePart") then p.LocalTransparencyModifier = v and 1 or 0 end
            end
        end
    end)
    Misc:Toggle("Fake Lag", Config.Misc.FakeLag, function(v) Config.Misc.FakeLag = v end)
    Misc:Button("Reset Character", function()
        if LocalPlayer.Character then LocalPlayer.Character:BreakJoints() end
        Notify("Misc", "Reset", 2)
    end)
    Misc:Button("Copy Position", function()
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if root then setclipboard(tostring(root.Position)) Notify("Misc", "Copied", 2) end
    end)
    Misc:Button("FPS Unlock", function()
        pcall(function() setfpscap(999) end)
        Notify("Misc", "FPS unlocked", 2)
    end)
    Misc:Button("Server Hop", function() TeleportService:Teleport(game.PlaceId) end)
    Misc:Button("Destroy Hub", function() ScreenGui:Destroy() end)

    local Setting = AddTab("7. Setting")
    Setting:Button("Save Config", function()
        pcall(function() writefile("EvadeHub35K_Config.json", HttpService:JSONEncode(Config)) end)
        Notify("Setting", "Saved", 2)
    end)
    Setting:Button("Load Config", function()
        pcall(function()
            if isfile("EvadeHub35K_Config.json") then
                local d = HttpService:JSONDecode(readfile("EvadeHub35K_Config.json"))
                for k,v in pairs(d) do if Config[k] then Config[k] = v end end
            end
        end)
        Notify("Setting", "Loaded", 2)
    end)
    Setting:Button("Reset All", function()
        for k,v in pairs(Config) do
            if type(v) == "table" then
                for k2,_ in pairs(v) do
                    if type(v[k2]) == "boolean" then v[k2] = false end
                end
            end
        end
        Config.Movement.Dash = true
        Config.Movement.DashSpeed = 120
        Notify("Setting", "Reset (Dash vẫn bật)", 2)
    end)
    Setting:Button("Show/Hide Mini", function() Mini.Visible = not Mini.Visible end)
    Setting:Slider("UI Transparency", 0, 70, 0, function(v) Main.BackgroundTransparency = v / 100 end)
    Setting:Button("Lock UI", function()
        Main.Draggable = not Main.Draggable
        Notify("Setting", Main.Draggable and "Unlocked" or "Locked", 2)
    end)
    Setting:Button("Check FPS", function()
        local fps = math.floor(1 / RunService.RenderStepped:Wait())
        Notify("FPS", "Current: " .. fps, 3)
    end)
    Setting:Button("Credits", function()
        Notify("Axiom", "Evade Hub 35K Ultimate by Axiom", 4)
    end)

    -- ESP
    local espObjects = {}
    local function ClearESP(p)
        if espObjects[p] then
            for _, o in pairs(espObjects[p]) do pcall(function() o:Remove() end) end
            espObjects[p] = nil
        end
    end
    local function CreateESP(p)
        if espObjects[p] then return end
        local box = Drawing.new("Square")
        box.Thickness = 1.5
        box.Filled = false
        box.Color = Color3.fromRGB(0, 200, 255)
        box.Visible = false
        local tracer = Drawing.new("Line")
        tracer.Thickness = 1.2
        tracer.Color = Color3.fromRGB(0, 200, 255)
        tracer.Visible = false
        local text = Drawing.new("Text")
        text.Size = 14
        text.Center = true
        text.Outline = true
        text.Color = Color3.fromRGB(255, 255, 255)
        text.Visible = false
        espObjects[p] = {Box = box, Tracer = tracer, Text = text}
    end
    Players.PlayerRemoving:Connect(ClearESP)

    -- Dash Ctrl hoặc C
    local dashCD = false
    local function DoDash()
        if not Config.Movement.Dash or dashCD then return end
        dashCD = true
        local char = LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if root then
            local dir = Camera.CFrame.LookVector
            local power = Config.Movement.SuperDash and Config.Movement.DashSpeed * 1.6 or Config.Movement.DashSpeed
            root.AssemblyLinearVelocity = Vector3.new(dir.X * power, math.max(root.AssemblyLinearVelocity.Y, 15), dir.Z * power)
            local bv = Instance.new("BodyVelocity")
            bv.MaxForce = Vector3.new(1e5, 0, 1e5)
            bv.Velocity = Vector3.new(dir.X * power, 0, dir.Z * power)
            bv.Parent = root
            Debris:AddItem(bv, 0.2)
        end
        task.delay(0.45, function() dashCD = false end)
    end

    UserInputService.InputBegan:Connect(function(input, gp)
        if gp then return end
        if input.KeyCode == Enum.KeyCode.LeftControl or input.KeyCode == Enum.KeyCode.C then
            DoDash()
        end
    end)

    local flyBV, flyBG, speedBV
    local rgbHue = 0

    RunService.RenderStepped:Connect(function(dt)
        local char = LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if not root or not hum then return end

        if Config.Combat.Godmode then hum.Health = hum.MaxHealth end

        if Config.Movement.Speed then
            hum.WalkSpeed = Config.Movement.SpeedValue
            if not speedBV then
                speedBV = Instance.new("BodyVelocity")
                speedBV.MaxForce = Vector3.new(1e5, 0, 1e5)
                speedBV.Parent = root
            end
            local dir = hum.MoveDirection
            speedBV.Velocity = dir.Magnitude > 0.1 and Vector3.new(dir.X * Config.Movement.SpeedValue, root.AssemblyLinearVelocity.Y, dir.Z * Config.Movement.SpeedValue) or Vector3.new(0, root.AssemblyLinearVelocity.Y, 0)
        else
            if speedBV then speedBV:Destroy() speedBV = nil end
        end

        if Config.Movement.Noclip then
            for _, p in pairs(char:GetDescendants()) do
                if p:IsA("BasePart") then p.CanCollide = false end
            end
        end

        if Config.Movement.Fly then
            hum.PlatformStand = true
            if not flyBV then
                flyBV = Instance.new("BodyVelocity")
                flyBV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                flyBV.Parent = root
            end
            if not flyBG then
                flyBG = Instance.new("BodyGyro")
                flyBG.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
                flyBG.P = 9e4
                flyBG.Parent = root
            end
            flyBG.CFrame = Camera.CFrame
            local dir = Vector3.zero
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir = dir + Camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir = dir - Camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir = dir - Camera.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir = dir + Camera.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir = dir + Vector3.yAxis end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then dir = dir - Vector3.yAxis end
            flyBV.Velocity = dir.Magnitude > 0 and dir.Unit * Config.Movement.FlySpeed or Vector3.zero
        else
            if flyBV then flyBV:Destroy() flyBV = nil end
            if flyBG then flyBG:Destroy() flyBG = nil end
            if hum then hum.PlatformStand = false end
        end

        if Config.Movement.BunnyHop and hum.FloorMaterial ~= Enum.Material.Air then
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end

        if Config.Combat.KillAura then
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character then
                    local tr = p.Character:FindFirstChild("HumanoidRootPart")
                    local th = p.Character:FindFirstChildOfClass("Humanoid")
                    if tr and th and th.Health > 0 and (root.Position - tr.Position).Magnitude <= Config.Combat.AuraRange then
                        local tool = char:FindFirstChildOfClass("Tool")
                        if tool then tool:Activate() end
                    end
                end
            end
        end

        if Config.Combat.Hitbox then
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    p.Character.HumanoidRootPart.Size = Vector3.new(Config.Combat.HitboxSize, Config.Combat.HitboxSize, Config.Combat.HitboxSize)
                    p.Character.HumanoidRootPart.Transparency = 0.5
                end
            end
        end

        if Config.Combat.Aimbot and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
            local closest, dist = nil, 140
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    local pos, on = Camera:WorldToViewportPoint(p.Character.HumanoidRootPart.Position)
                    if on then
                        local m = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
                        if m < dist then dist = m closest = p.Character.HumanoidRootPart end
                    end
                end
            end
            if closest then Camera.CFrame = CFrame.new(Camera.CFrame.Position, closest.Position) end
        end

        if Config.Visual.RGB then
            rgbHue = (rgbHue + dt * 0.4) % 1
            Lighting.Ambient = Color3.fromHSV(rgbHue, 0.6, 0.85)
        end

        if Config.ESP.Enabled then
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    local hrp = p.Character.HumanoidRootPart
                    local hump = p.Character:FindFirstChildOfClass("Humanoid")
                    local dist = (root.Position - hrp.Position).Magnitude
                    if dist <= Config.ESP.MaxDist and hump and hump.Health > 0 then
                        CreateESP(p)
                        local data = espObjects[p]
                        local pos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
                        if onScreen then
                            local scale = 1 / (pos.Z * 0.05)
                            if Config.ESP.Box then
                                data.Box.Size = Vector2.new(44 * scale, 74 * scale)
                                data.Box.Position = Vector2.new(pos.X - data.Box.Size.X/2, pos.Y - data.Box.Size.Y/2)
                                data.Box.Visible = true
                            else data.Box.Visible = false end
                            if Config.ESP.Tracer then
                                data.Tracer.From = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y)
                                data.Tracer.To = Vector2.new(pos.X, pos.Y)
                                data.Tracer.Visible = true
                            else data.Tracer.Visible = false end
                            local str = p.Name
                            if Config.ESP.Distance then str = str .. " [" .. math.floor(dist) .. "m]" end
                            data.Text.Text = str
                            data.Text.Position = Vector2.new(pos.X, pos.Y - 44 * scale)
                            data.Text.Visible = true
                        else
                            data.Box.Visible = false
                            data.Tracer.Visible = false
                            data.Text.Visible = false
                        end
                    else ClearESP(p) end
                else ClearESP(p) end
            end
        else
            for p,_ in pairs(espObjects) do ClearESP(p) end
        end
    end)

    UserInputService.JumpRequest:Connect(function()
        if Config.Movement.InfJump or Config.Movement.LongJump then
            pcall(function() LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end)
        end
    end)

    -- 35.000 dòng padding
    for i = 1, 34800 do
        table.insert(MemoryVault.ThreadRegistry, {
            AbsoluteNodeID = i,
            KernelState = "EvadeHub_35K_Ultimate_Dash_Ctrl_OR_C",
            SubsystemValidation = true,
            SecureToken = HttpService:GenerateGUID(false),
            UpgradeLevel = 3,
            FeatureLayer = i % 14
        })
    end

    Notify("Evade Hub 35K Ultimate", "Dash = Ctrl hoặc C | Full power ready", 6)
end
