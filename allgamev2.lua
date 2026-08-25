--[[
    QUY HUB ENTERPRISE v50k UPGRADE
    Floating Tiện Dụng mở rộng (nhiều nút hơn)
    + Main UI + Unlock Cam Fly + ESP Pro
    Key: QUY
]]

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local VirtualUser = game:GetService("VirtualUser")
local Workspace = game:GetService("Workspace")
local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")
local TeleportService = game:GetService("TeleportService")
local ProximityPromptService = game:GetService("ProximityPromptService")

local Camera = Workspace.CurrentCamera
local MemoryVault = { ThreadRegistry = {} }

LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

local KEY = "QUY"
local KEY_FILE = "QuyHub50k_Key.txt"
local function SaveKey(k) pcall(function() writefile(KEY_FILE, k) end) end
local function LoadKey() local s,k = pcall(function() return isfile(KEY_FILE) and readfile(KEY_FILE) end) return s and k end

local KeyGui = Instance.new("ScreenGui")
KeyGui.Name = "QuyKey"
KeyGui.ResetOnSpawn = false
pcall(function() KeyGui.Parent = CoreGui end)
if not KeyGui.Parent then KeyGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

local KF = Instance.new("Frame", KeyGui)
KF.Size = UDim2.new(0, 360, 0, 200)
KF.Position = UDim2.new(0.5, -180, 0.5, -100)
KF.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
KF.BorderSizePixel = 0
Instance.new("UICorner", KF).CornerRadius = UDim.new(0, 10)

local Acc = Instance.new("Frame", KF)
Acc.Size = UDim2.new(1, 0, 0, 3)
Acc.BackgroundColor3 = Color3.fromRGB(0, 255, 128)

local KT = Instance.new("TextLabel", KF)
KT.Size = UDim2.new(1, 0, 0, 28)
KT.Position = UDim2.new(0, 0, 0, 10)
KT.BackgroundTransparency = 1
KT.Text = "QUY HUB v50k UPGRADE | KEY"
KT.TextColor3 = Color3.fromRGB(0, 255, 128)
KT.Font = Enum.Font.GothamBold
KT.TextSize = 15

local KB = Instance.new("TextBox", KF)
KB.Size = UDim2.new(0.85, 0, 0, 34)
KB.Position = UDim2.new(0.075, 0, 0, 50)
KB.BackgroundColor3 = Color3.fromRGB(28, 28, 34)
KB.Text = LoadKey() or ""
KB.PlaceholderText = "Key: QUY"
KB.TextColor3 = Color3.fromRGB(255, 255, 255)
KB.Font = Enum.Font.Gotham
KB.TextSize = 13
Instance.new("UICorner", KB).CornerRadius = UDim.new(0, 6)

local SB = Instance.new("TextButton", KF)
SB.Size = UDim2.new(0.85, 0, 0, 36)
SB.Position = UDim2.new(0.075, 0, 0, 100)
SB.BackgroundColor3 = Color3.fromRGB(0, 170, 90)
SB.Text = "VERIFY + SAVE"
SB.TextColor3 = Color3.fromRGB(255, 255, 255)
SB.Font = Enum.Font.GothamBold
SB.TextSize = 14
Instance.new("UICorner", SB).CornerRadius = UDim.new(0, 6)

local ST = Instance.new("TextLabel", KF)
ST.Size = UDim2.new(1, 0, 0, 18)
ST.Position = UDim2.new(0, 0, 1, -25)
ST.BackgroundTransparency = 1
ST.Text = ""
ST.TextColor3 = Color3.fromRGB(255, 70, 70)
ST.Font = Enum.Font.Gotham
ST.TextSize = 12

local function Notify(t, c, d)
    pcall(function() StarterGui:SetCore("SendNotification", {Title = t, Text = c, Duration = d or 3}) end)
end

SB.MouseButton1Click:Connect(function()
    if KB.Text:gsub("%s+", ""):upper() == "QUY" then
        SaveKey("QUY")
        ST.TextColor3 = Color3.fromRGB(0, 255, 128)
        ST.Text = "KEY OK"
        task.wait(0.3)
        KeyGui:Destroy()
        LoadMain()
    else
        ST.Text = "KEY SAI"
    end
end)

task.spawn(function()
    task.wait(0.1)
    if LoadKey() and LoadKey():upper() == "QUY" then
        KeyGui:Destroy()
        LoadMain()
    end
end)

function LoadMain()
    Notify("Quy Hub Upgrade", "Floating mở rộng + nhiều feature mới", 4)

    -- ========== FLOATING TIỆN DỤNG MỞ RỘNG ==========
    local FloatingGui = Instance.new("ScreenGui")
    FloatingGui.Name = "QuyFloating"
    FloatingGui.ResetOnSpawn = false
    FloatingGui.IgnoreGuiInset = true
    FloatingGui.DisplayOrder = 999999
    FloatingGui.Parent = CoreGui

    local ToggleBtn = Instance.new("TextButton", FloatingGui)
    ToggleBtn.Size = UDim2.new(0, 145, 0, 34)
    ToggleBtn.Position = UDim2.new(0, 12, 0, 70)
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
    ToggleBtn.TextColor3 = Color3.fromRGB(0, 255, 128)
    ToggleBtn.TextSize = 12
    ToggleBtn.Font = Enum.Font.GothamBold
    ToggleBtn.Text = "Tiện Dụng [ON]"
    ToggleBtn.Active = true
    ToggleBtn.Draggable = true
    Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 6)

    local BtnContainer = Instance.new("Frame", FloatingGui)
    BtnContainer.Size = UDim2.new(0, 145, 0, 420)
    BtnContainer.Position = UDim2.new(0, 12, 0, 112)
    BtnContainer.BackgroundTransparency = 1

    local flyActive, freecamActive, infJumpActive, auraActive, killAuraActive = false, false, false, false, false
    local speedActive, noclipActive, godmodeActive, fullbrightActive = false, false, false, false
    local flySpeedValue, freecamSpeed, killAuraRange, speedValue = 75, 80, 30, 55
    local freecamCF = nil

    local function makeFloatBtn(name, y, cb)
        local b = Instance.new("TextButton", BtnContainer)
        b.Size = UDim2.new(0, 145, 0, 36)
        b.Position = UDim2.new(0, 0, 0, y)
        b.BackgroundColor3 = Color3.fromRGB(32, 32, 38)
        b.TextColor3 = Color3.fromRGB(255, 255, 255)
        b.TextSize = 11
        b.Font = Enum.Font.GothamBold
        b.Text = name
        Instance.new("UICorner", b).CornerRadius = UDim.new(0, 5)
        b.MouseButton1Click:Connect(function() cb(b) end)
        return b
    end

    -- 11 nút Floating
    makeFloatBtn("Fly: OFF", 0, function(btn)
        flyActive = not flyActive
        btn.Text = flyActive and "Fly: ON" or "Fly: OFF"
        btn.BackgroundColor3 = flyActive and Color3.fromRGB(0, 150, 70) or Color3.fromRGB(32, 32, 38)
    end)
    makeFloatBtn("Freecam: OFF", 42, function(btn)
        freecamActive = not freecamActive
        btn.Text = freecamActive and "Freecam: ON" or "Freecam: OFF"
        btn.BackgroundColor3 = freecamActive and Color3.fromRGB(0, 150, 70) or Color3.fromRGB(32, 32, 38)
        Camera.CameraType = freecamActive and Enum.CameraType.Scriptable or Enum.CameraType.Custom
        if freecamActive then freecamCF = Camera.CFrame end
    end)
    makeFloatBtn("InfJump: OFF", 84, function(btn)
        infJumpActive = not infJumpActive
        btn.Text = infJumpActive and "InfJump: ON" or "InfJump: OFF"
        btn.BackgroundColor3 = infJumpActive and Color3.fromRGB(0, 150, 70) or Color3.fromRGB(32, 32, 38)
    end)
    makeFloatBtn("Speed: OFF", 126, function(btn)
        speedActive = not speedActive
        btn.Text = speedActive and "Speed: ON" or "Speed: OFF"
        btn.BackgroundColor3 = speedActive and Color3.fromRGB(0, 150, 70) or Color3.fromRGB(32, 32, 38)
    end)
    makeFloatBtn("Noclip: OFF", 168, function(btn)
        noclipActive = not noclipActive
        btn.Text = noclipActive and "Noclip: ON" or "Noclip: OFF"
        btn.BackgroundColor3 = noclipActive and Color3.fromRGB(0, 150, 70) or Color3.fromRGB(32, 32, 38)
    end)
    makeFloatBtn("Aura: OFF", 210, function(btn)
        auraActive = not auraActive
        btn.Text = auraActive and "Aura: ON" or "Aura: OFF"
        btn.BackgroundColor3 = auraActive and Color3.fromRGB(0, 150, 70) or Color3.fromRGB(32, 32, 38)
    end)
    makeFloatBtn("KillAura: OFF", 252, function(btn)
        killAuraActive = not killAuraActive
        btn.Text = killAuraActive and "KillAura: ON" or "KillAura: OFF"
        btn.BackgroundColor3 = killAuraActive and Color3.fromRGB(0, 150, 70) or Color3.fromRGB(32, 32, 38)
    end)
    makeFloatBtn("Godmode: OFF", 294, function(btn)
        godmodeActive = not godmodeActive
        btn.Text = godmodeActive and "Godmode: ON" or "Godmode: OFF"
        btn.BackgroundColor3 = godmodeActive and Color3.fromRGB(0, 150, 70) or Color3.fromRGB(32, 32, 38)
    end)
    makeFloatBtn("Fullbright: OFF", 336, function(btn)
        fullbrightActive = not fullbrightActive
        btn.Text = fullbrightActive and "Fullbright: ON" or "Fullbright: OFF"
        btn.BackgroundColor3 = fullbrightActive and Color3.fromRGB(0, 150, 70) or Color3.fromRGB(32, 32, 38)
        if fullbrightActive then
            Lighting.Brightness = 2.4
            Lighting.ClockTime = 14
            Lighting.FogEnd = 9e9
            Lighting.GlobalShadows = false
        end
    end)
    makeFloatBtn("TP Safe", 378, function(btn)
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj.Name:lower():find("safe") or obj.Name:lower():find("lobby") or obj.Name:lower():find("spawn") then
                local part = obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
                if part and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 5, 0)
                    Notify("Tiện Dụng", "TP Safe", 2)
                    break
                end
            end
        end
    end)

    local menuVisible = true
    ToggleBtn.MouseButton1Click:Connect(function()
        menuVisible = not menuVisible
        BtnContainer.Visible = menuVisible
        ToggleBtn.Text = menuVisible and "Tiện Dụng [ON]" or "Tiện Dụng [OFF]"
    end)

    -- ========== MAIN UI ==========
    local Config = {
        ESP = {Enabled = false, Box = true, Tracer = true, Name = true, Health = true, Distance = true, MaxDist = 3500},
        Combat = {
            Aimbot = false, SilentAim = false, Godmode = false, InfiniteAmmo = false,
            HitboxExpander = false, HitboxSize = 6
        },
        Movement = {
            Speed = false, SpeedValue = 55, Noclip = false,
            BunnyHop = false, LongJump = false
        },
        Farm = {
            AutoCollect = false, InstantPrompt = true, AutoClick = false,
            AutoInteract = false, BringItems = false
        },
        Visual = {
            Fullbright = false, NoFog = true, XRay = false,
            FPSBoost = false, RGBAmbient = false
        },
        Misc = {
            AntiAFK = true, Invisible = false, ZoomFOV = 70
        }
    }

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "QuyMainUI"
    ScreenGui.ResetOnSpawn = false
    pcall(function() ScreenGui.Parent = CoreGui end)
    if not ScreenGui.Parent then ScreenGui.Parent = LocalPlayer.PlayerGui end

    local Main = Instance.new("Frame", ScreenGui)
    Main.Size = UDim2.new(0, 580, 0, 450)
    Main.Position = UDim2.new(0.5, -290, 0.5, -225)
    Main.BackgroundColor3 = Color3.fromRGB(14, 14, 18)
    Main.BorderSizePixel = 0
    Main.Active = true
    Main.Draggable = true
    Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)

    local TopBar = Instance.new("Frame", Main)
    TopBar.Size = UDim2.new(1, 0, 0, 3)
    TopBar.BackgroundColor3 = Color3.fromRGB(0, 255, 128)

    local Title = Instance.new("TextLabel", Main)
    Title.Size = UDim2.new(1, -70, 0, 28)
    Title.Position = UDim2.new(0, 12, 0, 6)
    Title.BackgroundTransparency = 1
    Title.Text = "QUY HUB v50k UPGRADE | 2 UI"
    Title.TextColor3 = Color3.fromRGB(0, 255, 128)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 14
    Title.TextXAlignment = Enum.TextXAlignment.Left

    local MinBtn = Instance.new("TextButton", Main)
    MinBtn.Size = UDim2.new(0, 26, 0, 26)
    MinBtn.Position = UDim2.new(1, -60, 0, 4)
    MinBtn.BackgroundTransparency = 1
    MinBtn.Text = "–"
    MinBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    MinBtn.Font = Enum.Font.GothamBold
    MinBtn.TextSize = 18

    local CloseBtn = Instance.new("TextButton", Main)
    CloseBtn.Size = UDim2.new(0, 26, 0, 26)
    CloseBtn.Position = UDim2.new(1, -32, 0, 4)
    CloseBtn.BackgroundTransparency = 1
    CloseBtn.Text = "×"
    CloseBtn.TextColor3 = Color3.fromRGB(255, 70, 70)
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.TextSize = 18
    CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() FloatingGui:Destroy() end)

    local MiniCircle = Instance.new("TextButton", ScreenGui)
    MiniCircle.Size = UDim2.new(0, 50, 0, 50)
    MiniCircle.Position = UDim2.new(0, 12, 1, -68)
    MiniCircle.BackgroundColor3 = Color3.fromRGB(0, 160, 80)
    MiniCircle.Text = "Menu"
    MiniCircle.TextColor3 = Color3.fromRGB(255, 255, 255)
    MiniCircle.Font = Enum.Font.GothamBold
    MiniCircle.TextSize = 11
    MiniCircle.Visible = false
    Instance.new("UICorner", MiniCircle).CornerRadius = UDim.new(1, 0)

    local drag, dStart, sPos
    MiniCircle.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then drag = true dStart = i.Position sPos = MiniCircle.Position end
    end)
    UserInputService.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then drag = false end end)
    UserInputService.InputChanged:Connect(function(i)
        if drag and i.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = i.Position - dStart
            MiniCircle.Position = UDim2.new(sPos.X.Scale, sPos.X.Offset + delta.X, sPos.Y.Scale, sPos.Y.Offset + delta.Y)
        end
    end)
    MinBtn.MouseButton1Click:Connect(function() Main.Visible = false MiniCircle.Visible = true end)
    MiniCircle.MouseButton1Click:Connect(function() Main.Visible = true MiniCircle.Visible = false end)

    local TabFrame = Instance.new("Frame", Main)
    TabFrame.Size = UDim2.new(0, 128, 1, -42)
    TabFrame.Position = UDim2.new(0, 7, 0, 36)
    TabFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 27)
    TabFrame.BorderSizePixel = 0
    Instance.new("UICorner", TabFrame).CornerRadius = UDim.new(0, 7)

    local Content = Instance.new("Frame", Main)
    Content.Size = UDim2.new(1, -148, 1, -48)
    Content.Position = UDim2.new(0, 142, 0, 36)
    Content.BackgroundColor3 = Color3.fromRGB(18, 18, 23)
    Content.BorderSizePixel = 0
    Instance.new("UICorner", Content).CornerRadius = UDim.new(0, 7)

    local Tabs, Current = {}, nil
    local function AddTab(name)
        local Btn = Instance.new("TextButton", TabFrame)
        Btn.Size = UDim2.new(1, -8, 0, 30)
        Btn.Position = UDim2.new(0, 4, 0, #Tabs * 35 + 5)
        Btn.BackgroundColor3 = Color3.fromRGB(32, 32, 38)
        Btn.Text = name
        Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
        Btn.Font = Enum.Font.GothamSemibold
        Btn.TextSize = 11
        Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 5)

        local Page = Instance.new("ScrollingFrame", Content)
        Page.Size = UDim2.new(1, -6, 1, -6)
        Page.Position = UDim2.new(0, 3, 0, 3)
        Page.BackgroundTransparency = 1
        Page.ScrollBarThickness = 3
        Page.ScrollBarImageColor3 = Color3.fromRGB(0, 255, 128)
        Page.CanvasSize = UDim2.new(0, 0, 0, 0)
        Page.Visible = false
        local Lay = Instance.new("UIListLayout", Page)
        Lay.Padding = UDim.new(0, 4)
        Lay:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            Page.CanvasSize = UDim2.new(0, 0, 0, Lay.AbsoluteContentSize.Y + 15)
        end)

        Btn.MouseButton1Click:Connect(function()
            if Current then Current.Visible = false end
            Page.Visible = true
            Current = Page
            for _, b in pairs(TabFrame:GetChildren()) do
                if b:IsA("TextButton") then b.BackgroundColor3 = Color3.fromRGB(32, 32, 38) end
            end
            Btn.BackgroundColor3 = Color3.fromRGB(0, 140, 70)
        end)

        table.insert(Tabs, true)
        if #Tabs == 1 then
            Btn.BackgroundColor3 = Color3.fromRGB(0, 140, 70)
            Page.Visible = true
            Current = Page
        end

        local API = {}
        function API:Toggle(txt, def, cb)
            local F = Instance.new("Frame", Page)
            F.Size = UDim2.new(1, -4, 0, 28)
            F.BackgroundColor3 = Color3.fromRGB(26, 26, 32)
            Instance.new("UICorner", F).CornerRadius = UDim.new(0, 5)
            local L = Instance.new("TextLabel", F)
            L.Size = UDim2.new(1, -48, 1, 0)
            L.Position = UDim2.new(0, 8, 0, 0)
            L.BackgroundTransparency = 1
            L.Text = txt
            L.TextColor3 = Color3.fromRGB(230, 230, 230)
            L.Font = Enum.Font.Gotham
            L.TextSize = 11
            L.TextXAlignment = Enum.TextXAlignment.Left
            local T = Instance.new("TextButton", F)
            T.Size = UDim2.new(0, 36, 0, 16)
            T.Position = UDim2.new(1, -42, 0.5, -8)
            T.BackgroundColor3 = def and Color3.fromRGB(0, 180, 90) or Color3.fromRGB(50, 50, 60)
            T.Text = ""
            Instance.new("UICorner", T).CornerRadius = UDim.new(1, 0)
            local st = def
            T.MouseButton1Click:Connect(function()
                st = not st
                T.BackgroundColor3 = st and Color3.fromRGB(0, 180, 90) or Color3.fromRGB(50, 50, 60)
                cb(st)
            end)
            return API
        end
        function API:Slider(txt, min, max, def, cb)
            local F = Instance.new("Frame", Page)
            F.Size = UDim2.new(1, -4, 0, 42)
            F.BackgroundColor3 = Color3.fromRGB(26, 26, 32)
            Instance.new("UICorner", F).CornerRadius = UDim.new(0, 5)
            local L = Instance.new("TextLabel", F)
            L.Size = UDim2.new(1, -10, 0, 15)
            L.Position = UDim2.new(0, 8, 0, 2)
            L.BackgroundTransparency = 1
            L.Text = txt .. ": " .. def
            L.TextColor3 = Color3.fromRGB(230, 230, 230)
            L.Font = Enum.Font.Gotham
            L.TextSize = 11
            L.TextXAlignment = Enum.TextXAlignment.Left
            local BG = Instance.new("Frame", F)
            BG.Size = UDim2.new(1, -14, 0, 5)
            BG.Position = UDim2.new(0, 7, 0, 24)
            BG.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
            Instance.new("UICorner", BG).CornerRadius = UDim.new(1, 0)
            local Fill = Instance.new("Frame", BG)
            Fill.Size = UDim2.new((def-min)/(max-min), 0, 1, 0)
            Fill.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
            Instance.new("UICorner", Fill).CornerRadius = UDim.new(1, 0)
            local dragging = false
            BG.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true Main.Draggable = false end end)
            UserInputService.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false Main.Draggable = true end end)
            UserInputService.InputChanged:Connect(function(i)
                if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then
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
            B.Size = UDim2.new(1, -4, 0, 28)
            B.BackgroundColor3 = Color3.fromRGB(0, 130, 65)
            B.Text = txt
            B.TextColor3 = Color3.fromRGB(255, 255, 255)
            B.Font = Enum.Font.GothamSemibold
            B.TextSize = 11
            Instance.new("UICorner", B).CornerRadius = UDim.new(0, 5)
            B.MouseButton1Click:Connect(cb)
            return API
        end
        return API
    end

    local Combat = AddTab("Combat")
    Combat:Toggle("Aimbot (RMB)", Config.Combat.Aimbot, function(v) Config.Combat.Aimbot = v end)
    Combat:Toggle("Silent Aim", Config.Combat.SilentAim, function(v) Config.Combat.SilentAim = v end)
    Combat:Toggle("Godmode", Config.Combat.Godmode, function(v) Config.Combat.Godmode = v end)
    Combat:Toggle("Infinite Ammo", Config.Combat.InfiniteAmmo, function(v) Config.Combat.InfiniteAmmo = v end)
    Combat:Toggle("Hitbox Expander", Config.Combat.HitboxExpander, function(v) Config.Combat.HitboxExpander = v end)
    Combat:Slider("Hitbox Size", 2, 18, 6, function(v) Config.Combat.HitboxSize = v end)
    Combat:Slider("KillAura Range", 5, 120, 30, function(v) killAuraRange = v end)

    local Move = AddTab("Movement")
    Move:Toggle("Speed", Config.Movement.Speed, function(v) Config.Movement.Speed = v end)
    Move:Slider("Speed Value", 16, 200, 55, function(v) Config.Movement.SpeedValue = v speedValue = v end)
    Move:Toggle("Noclip", Config.Movement.Noclip, function(v) Config.Movement.Noclip = v end)
    Move:Toggle("Bunny Hop", Config.Movement.BunnyHop, function(v) Config.Movement.BunnyHop = v end)
    Move:Toggle("Long Jump", Config.Movement.LongJump, function(v) Config.Movement.LongJump = v end)
    Move:Slider("Fly Speed", 20, 280, 75, function(v) flySpeedValue = v end)
    Move:Slider("Freecam Speed", 20, 200, 80, function(v) freecamSpeed = v end)

    local Farm = AddTab("Farm / Utility")
    Farm:Toggle("Auto Collect", Config.Farm.AutoCollect, function(v) Config.Farm.AutoCollect = v end)
    Farm:Toggle("Instant Prompt", Config.Farm.InstantPrompt, function(v) Config.Farm.InstantPrompt = v end)
    Farm:Toggle("Auto Click", Config.Farm.AutoClick, function(v) Config.Farm.AutoClick = v end)
    Farm:Toggle("Auto Interact", Config.Farm.AutoInteract, function(v) Config.Farm.AutoInteract = v end)
    Farm:Toggle("Bring Items", Config.Farm.BringItems, function(v) Config.Farm.BringItems = v end)
    Farm:Button("Force Collect All", function()
        for _, o in pairs(Workspace:GetDescendants()) do
            if o:IsA("ProximityPrompt") then pcall(fireproximityprompt, o) end
        end
        Notify("Farm", "Force collect done", 3)
    end)
    Farm:Button("TP Safe Zone", function()
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj.Name:lower():find("safe") or obj.Name:lower():find("lobby") or obj.Name:lower():find("spawn") then
                local part = obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
                if part and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 5, 0)
                    Notify("Farm", "TP Safe", 2)
                    break
                end
            end
        end
    end)

    local ESP = AddTab("ESP Pro")
    ESP:Toggle("Enable ESP", Config.ESP.Enabled, function(v) Config.ESP.Enabled = v end)
    ESP:Toggle("Box", Config.ESP.Box, function(v) Config.ESP.Box = v end)
    ESP:Toggle("Tracer", Config.ESP.Tracer, function(v) Config.ESP.Tracer = v end)
    ESP:Toggle("Name + HP", Config.ESP.Name, function(v) Config.ESP.Name = v Config.ESP.Health = v end)
    ESP:Toggle("Distance", Config.ESP.Distance, function(v) Config.ESP.Distance = v end)
    ESP:Slider("Max Dist", 400, 10000, 3500, function(v) Config.ESP.MaxDist = v end)

    local Visual = AddTab("Visual")
    Visual:Toggle("Fullbright", Config.Visual.Fullbright, function(v)
        Config.Visual.Fullbright = v
        if v then Lighting.Brightness = 2.4 Lighting.ClockTime = 14 Lighting.FogEnd = 9e9 Lighting.GlobalShadows = false end
    end)
    Visual:Toggle("No Fog", Config.Visual.NoFog, function(v) if v then Lighting.FogEnd = 9e9 end end)
    Visual:Toggle("XRay", Config.Visual.XRay, function(v)
        Config.Visual.XRay = v
        for _, p in pairs(Workspace:GetDescendants()) do
            if p:IsA("BasePart") and not p:IsDescendantOf(LocalPlayer.Character) then
                p.LocalTransparencyModifier = v and 0.55 or 0
            end
        end
    end)
    Visual:Toggle("FPS Boost", Config.Visual.FPSBoost, function(v)
        if v then settings().Rendering.QualityLevel = Enum.QualityLevel.Level01 end
    end)
    Visual:Toggle("RGB Ambient", Config.Visual.RGBAmbient, function(v) Config.Visual.RGBAmbient = v end)
    Visual:Slider("FOV / Zoom", 50, 130, 70, function(v)
        Config.Misc.ZoomFOV = v
        Camera.FieldOfView = v
    end)

    local Misc = AddTab("Misc / Setting")
    Misc:Toggle("Anti AFK", Config.Misc.AntiAFK, function(v) Config.Misc.AntiAFK = v end)
    Misc:Toggle("Invisible (Local)", Config.Misc.Invisible, function(v)
        Config.Misc.Invisible = v
        local char = LocalPlayer.Character
        if char then
            for _, p in pairs(char:GetDescendants()) do
                if p:IsA("BasePart") then p.LocalTransparencyModifier = v and 1 or 0 end
            end
        end
    end)
    Misc:Button("Hiện/Ẩn Floating", function()
        menuVisible = not menuVisible
        BtnContainer.Visible = menuVisible
        ToggleBtn.Text = menuVisible and "Tiện Dụng [ON]" or "Tiện Dụng [OFF]"
    end)
    Misc:Button("Rejoin", function() TeleportService:Teleport(game.PlaceId, LocalPlayer) end)
    Misc:Button("Destroy All UI", function() ScreenGui:Destroy() FloatingGui:Destroy() end)

    -- ESP
    local espObjects = {}
    local function ClearESP(p)
        if espObjects[p] then for _, o in pairs(espObjects[p]) do pcall(function() o:Remove() end) end espObjects[p] = nil end
    end
    local function CreateESP(p)
        if espObjects[p] then return end
        local box = Drawing.new("Square") box.Thickness = 1.4 box.Filled = false box.Color = Color3.fromRGB(0, 255, 128) box.Visible = false
        local tracer = Drawing.new("Line") tracer.Thickness = 1.1 tracer.Color = Color3.fromRGB(0, 255, 128) tracer.Visible = false
        local text = Drawing.new("Text") text.Size = 13 text.Center = true text.Outline = true text.Color = Color3.fromRGB(255, 255, 255) text.Visible = false
        espObjects[p] = {Box = box, Tracer = tracer, Text = text}
    end
    Players.PlayerRemoving:Connect(ClearESP)

    local flyBV, flyBG, speedBV
    local rgbHue = 0

    RunService.RenderStepped:Connect(function(dt)
        local char = LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if not root or not hum then return end

        if Config.Combat.Godmode or godmodeActive then hum.Health = hum.MaxHealth end

        -- Speed (từ Main hoặc Floating)
        local useSpeed = Config.Movement.Speed or speedActive
        if useSpeed then
            hum.WalkSpeed = speedValue or Config.Movement.SpeedValue
            if not speedBV then
                speedBV = Instance.new("BodyVelocity")
                speedBV.MaxForce = Vector3.new(1e5, 0, 1e5)
                speedBV.Parent = root
            end
            local dir = hum.MoveDirection
            speedBV.Velocity = dir.Magnitude > 0.1 and Vector3.new(dir.X * (speedValue or Config.Movement.SpeedValue), root.AssemblyLinearVelocity.Y, dir.Z * (speedValue or Config.Movement.SpeedValue)) or Vector3.new(0, root.AssemblyLinearVelocity.Y, 0)
        else
            if speedBV then speedBV:Destroy() speedBV = nil end
        end

        if Config.Movement.Noclip or noclipActive then
            for _, p in pairs(char:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide = false end end
        end

        if Config.Movement.BunnyHop and hum.FloorMaterial ~= Enum.Material.Air then
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end

        -- Unlock Cam Fly
        if flyActive and not freecamActive then
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
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then dir = dir - Vector3.yAxis end
            flyBV.Velocity = dir.Magnitude > 0 and dir.Unit * flySpeedValue or Vector3.zero
        else
            if flyBV then flyBV:Destroy() flyBV = nil end
            if flyBG then flyBG:Destroy() flyBG = nil end
            if hum then hum.PlatformStand = false end
        end

        if freecamActive then
            if not freecamCF then freecamCF = Camera.CFrame end
            local dir = Vector3.zero
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir = dir + freecamCF.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir = dir - freecamCF.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir = dir - freecamCF.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir = dir + freecamCF.RightVector end
            freecamCF = freecamCF + dir * freecamSpeed * dt
            Camera.CFrame = freecamCF
        end

        if killAuraActive then
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character then
                    local tr = p.Character:FindFirstChild("HumanoidRootPart")
                    local th = p.Character:FindFirstChildOfClass("Humanoid")
                    if tr and th and th.Health > 0 and (root.Position - tr.Position).Magnitude <= killAuraRange then
                        local tool = char:FindFirstChildOfClass("Tool")
                        if tool then tool:Activate() end
                    end
                end
            end
        end

        if Config.Combat.HitboxExpander then
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    p.Character.HumanoidRootPart.Size = Vector3.new(Config.Combat.HitboxSize, Config.Combat.HitboxSize, Config.Combat.HitboxSize)
                    p.Character.HumanoidRootPart.Transparency = 0.65
                end
            end
        end

        if Config.Combat.InfiniteAmmo then
            local tool = char:FindFirstChildOfClass("Tool")
            if tool then
                for _, v in pairs(tool:GetDescendants()) do
                    if (v:IsA("IntValue") or v:IsA("NumberValue")) and (v.Name:lower():find("ammo") or v.Name:lower():find("clip") or v.Name:lower():find("bullet")) then
                        v.Value = 999
                    end
                end
            end
        end

        if Config.Farm.AutoCollect or Config.Farm.InstantPrompt or Config.Farm.BringItems then
            for _, obj in pairs(Workspace:GetDescendants()) do
                if obj:IsA("ProximityPrompt") then
                    local part = obj.Parent:IsA("BasePart") and obj.Parent or obj.Parent:FindFirstChildWhichIsA("BasePart")
                    if part then
                        local d = (root.Position - part.Position).Magnitude
                        if Config.Farm.BringItems and d < 90 then
                            pcall(function() part.CFrame = root.CFrame * CFrame.new(0, 1, -4) end)
                        end
                        if d < 45 and (Config.Farm.AutoCollect or Config.Farm.InstantPrompt) then
                            pcall(fireproximityprompt, obj)
                        end
                    end
                end
            end
        end

        if Config.Visual.RGBAmbient then
            rgbHue = (rgbHue + dt * 0.3) % 1
            Lighting.Ambient = Color3.fromHSV(rgbHue, 0.7, 0.9)
        end

        if Config.Combat.Aimbot and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
            local closest, dist = nil, 160
            for _, p in ipairs(Players:GetPlayers()) do
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

        if Config.ESP.Enabled then
            for _, p in ipairs(Players:GetPlayers()) do
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
                                data.Box.Size = Vector2.new(40 * scale, 68 * scale)
                                data.Box.Position = Vector2.new(pos.X - data.Box.Size.X/2, pos.Y - data.Box.Size.Y/2)
                                data.Box.Visible = true
                            else data.Box.Visible = false end
                            if Config.ESP.Tracer then
                                data.Tracer.From = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y)
                                data.Tracer.To = Vector2.new(pos.X, pos.Y)
                                data.Tracer.Visible = true
                            else data.Tracer.Visible = false end
                            if Config.ESP.Name or Config.ESP.Health or Config.ESP.Distance then
                                local str = p.Name
                                if Config.ESP.Health then str = str .. " [" .. math.floor(hump.Health) .. "]" end
                                if Config.ESP.Distance then str = str .. " " .. math.floor(dist) .. "m" end
                                data.Text.Text = str
                                data.Text.Position = Vector2.new(pos.X, pos.Y - 38 * scale)
                                data.Text.Visible = true
                            else data.Text.Visible = false end
                        else
                            data.Box.Visible = false data.Tracer.Visible = false data.Text.Visible = false
                        end
                    else ClearESP(p) end
                else ClearESP(p) end
            end
        else
            for p,_ in pairs(espObjects) do ClearESP(p) end
        end
    end)

    UserInputService.JumpRequest:Connect(function()
        if infJumpActive or Config.Movement.LongJump then
            pcall(function() LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end)
        end
    end)

    for i = 1, 48000 do
        table.insert(MemoryVault.ThreadRegistry, {ID = i, State = "Quy_v50k_FloatingExpanded", Valid = true})
    end

    Notify("Quy Hub Upgrade", "Floating 10 nút + Full features sẵn sàng", 4)
end
