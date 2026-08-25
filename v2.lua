--[[
    FAKE FOXNAME | DEAD RAIL v10
    Upgrade mới:
    - Thêm tab Tool
    - Keybind mặc định Z → bật/tắt Tool
    - Air Weld (hàn trên không)
    - Giữ toàn bộ fix cũ (Speed no rubberband, Fly Unlock Cam, Bring, Dupe, 16 Mode...)
]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
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

-- Key System
local DEFAULT_KEY = "ALO"
local KEY_FILE = "FakeFox_Key.txt"
local function SaveKey(k) pcall(function() writefile(KEY_FILE, k) end) end
local function LoadKey() local s,k = pcall(function() return isfile(KEY_FILE) and readfile(KEY_FILE) end) return s and k end
local function CheckKey(k) k = (k or ""):gsub("%s+",""):upper() return k == "ALO" or k == "FOXNAME" or k == "AXIOM" end

local KeyGui = Instance.new("ScreenGui")
KeyGui.Name = "FoxKey"
KeyGui.ResetOnSpawn = false
pcall(function() KeyGui.Parent = CoreGui end)
if not KeyGui.Parent then KeyGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

local KF = Instance.new("Frame", KeyGui)
KF.Size = UDim2.new(0, 370, 0, 230)
KF.Position = UDim2.new(0.5, -185, 0.5, -115)
KF.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
KF.BorderSizePixel = 0
Instance.new("UICorner", KF).CornerRadius = UDim.new(0, 12)

local Acc = Instance.new("Frame", KF)
Acc.Size = UDim2.new(1, 0, 0, 4)
Acc.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
Acc.BorderSizePixel = 0

local KT = Instance.new("TextLabel", KF)
KT.Size = UDim2.new(1, 0, 0, 32)
KT.Position = UDim2.new(0, 0, 0, 12)
KT.BackgroundTransparency = 1
KT.Text = "FAKE FOXNAME v10 | TOOL + Z"
KT.TextColor3 = Color3.fromRGB(240, 240, 240)
KT.Font = Enum.Font.GothamBold
KT.TextSize = 16

local Hint = Instance.new("TextLabel", KF)
Hint.Size = UDim2.new(1, -20, 0, 18)
Hint.Position = UDim2.new(0, 10, 0, 46)
Hint.BackgroundTransparency = 1
Hint.Text = "Key mặc định: ALO"
Hint.TextColor3 = Color3.fromRGB(170, 0, 255)
Hint.Font = Enum.Font.Gotham
Hint.TextSize = 13

local KB = Instance.new("TextBox", KF)
KB.Size = UDim2.new(0.86, 0, 0, 38)
KB.Position = UDim2.new(0.07, 0, 0, 74)
KB.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
KB.Text = LoadKey() or ""
KB.PlaceholderText = "Nhập key..."
KB.TextColor3 = Color3.fromRGB(255, 255, 255)
KB.Font = Enum.Font.Gotham
KB.TextSize = 14
Instance.new("UICorner", KB).CornerRadius = UDim.new(0, 8)

local SB = Instance.new("TextButton", KF)
SB.Size = UDim2.new(0.86, 0, 0, 40)
SB.Position = UDim2.new(0.07, 0, 0, 128)
SB.BackgroundColor3 = Color3.fromRGB(140, 0, 220)
SB.Text = "VERIFY + SAVE"
SB.TextColor3 = Color3.fromRGB(255, 255, 255)
SB.Font = Enum.Font.GothamBold
SB.TextSize = 15
Instance.new("UICorner", SB).CornerRadius = UDim.new(0, 8)

local ST = Instance.new("TextLabel", KF)
ST.Size = UDim2.new(1, 0, 0, 22)
ST.Position = UDim2.new(0, 0, 1, -28)
ST.BackgroundTransparency = 1
ST.Text = ""
ST.TextColor3 = Color3.fromRGB(255, 60, 60)
ST.Font = Enum.Font.Gotham
ST.TextSize = 13

local function Notify(t, tx, d)
    pcall(function() StarterGui:SetCore("SendNotification", {Title = t, Text = tx, Duration = d or 4}) end)
end

SB.MouseButton1Click:Connect(function()
    local input = KB.Text:gsub("%s+", "")
    if CheckKey(input) then
        SaveKey(input)
        ST.TextColor3 = Color3.fromRGB(0, 255, 140)
        ST.Text = "KEY OK - LOADING..."
        task.wait(0.5)
        KeyGui:Destroy()
        LoadMain()
    else
        ST.Text = "KEY SAI - Thử ALO"
    end
end)

task.spawn(function()
    task.wait(0.2)
    local saved = LoadKey()
    if saved and CheckKey(saved) then
        ST.TextColor3 = Color3.fromRGB(0, 255, 140)
        ST.Text = "AUTO KEY..."
        task.wait(0.4)
        KeyGui:Destroy()
        LoadMain()
    end
end)

function LoadMain()
    pcall(function()
        local mt = getrawmetatable(game)
        setreadonly(mt, false)
        local old = mt.__namecall
        mt.__namecall = newcclosure(function(self, ...)
            if getnamecallmethod() == "Kick" or getnamecallmethod() == "kick" then return nil end
            return old(self, ...)
        end)
        setreadonly(mt, true)
    end)

    Notify("Fake Foxname v10", "Tab Tool + Keybind Z (Air Weld) đã sẵn", 5)

    local Config = {
        ESP = {Enabled = true, Players = true, Items = true, MaxDistance = 4000,
               ColorEnemy = Color3.fromRGB(255, 50, 50), ColorItem = Color3.fromRGB(255, 215, 0)},
        Combat = {KillAura = false, AuraRange = 38, SilentAim = false, FOV = 180, Prediction = true, Godmode = false, InfiniteAmmo = false},
        Farm = {AutoCollect = true, AutoRepair = true, AutoHeal = true, CollectRange = 65, InstantPrompt = true,
                AutoBring = false, BringRange = 110},
        Movement = {Speed = false, SpeedValue = 50, Fly = false, FlySpeed = 100, Noclip = false, InfiniteJump = false,
                    TrainBypass = false, TrainSpeed = 160},
        Dupe = {Enabled = false, Amount = 12},
        Tool = {
            Enabled = false,           -- bật/tắt bằng Z
            AirWeld = true,            -- hàn trên không
            Keybind = Enum.KeyCode.Z   -- mặc định Z
        },
        Misc = {FullBright = false, NoFog = true, FPSBoost = true, AntiAFK = true, AutoRespawn = false}
    }

    local function SaveConfig()
        pcall(function() writefile("FakeFox_v10.json", HttpService:JSONEncode(Config)) end)
    end
    pcall(function()
        if isfile("FakeFox_v10.json") then
            local d = HttpService:JSONDecode(readfile("FakeFox_v10.json"))
            for k,v in pairs(d) do if type(v)=="table" and Config[k] then for k2,v2 in pairs(v) do Config[k][k2]=v2 end end end
        end
    end)

    task.spawn(function()
        while true do
            task.wait(30)
            SaveConfig()
        end
    end)

    -- UI
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "FakeFoxnameV10"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    pcall(function() ScreenGui.Parent = CoreGui end)
    if not ScreenGui.Parent then ScreenGui.Parent = LocalPlayer.PlayerGui end

    local Main = Instance.new("Frame", ScreenGui)
    Main.Size = UDim2.new(0, 650, 0, 510)
    Main.Position = UDim2.new(0.5, -325, 0.5, -255)
    Main.BackgroundColor3 = Color3.fromRGB(10, 10, 14)
    Main.BorderSizePixel = 0
    Main.Active = true
    Main.Draggable = true
    Main.Visible = true
    Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 12)

    local Top = Instance.new("Frame", Main)
    Top.Size = UDim2.new(1, 0, 0, 4)
    Top.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
    Top.BorderSizePixel = 0

    local Title = Instance.new("TextLabel", Main)
    Title.Size = UDim2.new(1, -90, 0, 34)
    Title.Position = UDim2.new(0, 14, 0, 10)
    Title.BackgroundTransparency = 1
    Title.Text = "FAKE FOXNAME v10 | TOOL + Z"
    Title.TextColor3 = Color3.fromRGB(240, 240, 240)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 16
    Title.TextXAlignment = Enum.TextXAlignment.Left

    local MinBtn = Instance.new("TextButton", Main)
    MinBtn.Size = UDim2.new(0, 30, 0, 30)
    MinBtn.Position = UDim2.new(1, -70, 0, 8)
    MinBtn.BackgroundTransparency = 1
    MinBtn.Text = "–"
    MinBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    MinBtn.Font = Enum.Font.GothamBold
    MinBtn.TextSize = 22

    local CloseBtn = Instance.new("TextButton", Main)
    CloseBtn.Size = UDim2.new(0, 30, 0, 30)
    CloseBtn.Position = UDim2.new(1, -38, 0, 8)
    CloseBtn.BackgroundTransparency = 1
    CloseBtn.Text = "×"
    CloseBtn.TextColor3 = Color3.fromRGB(255, 70, 70)
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.TextSize = 22
    CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

    local Mini = Instance.new("TextButton", ScreenGui)
    Mini.Size = UDim2.new(0, 58, 0, 58)
    Mini.Position = UDim2.new(0, 16, 1, -76)
    Mini.BackgroundColor3 = Color3.fromRGB(140, 0, 220)
    Mini.Text = "Menu"
    Mini.TextColor3 = Color3.fromRGB(255, 255, 255)
    Mini.Font = Enum.Font.GothamBold
    Mini.TextSize = 13
    Mini.Visible = false
    Instance.new("UICorner", Mini).CornerRadius = UDim.new(1, 0)
    local stroke = Instance.new("UIStroke", Mini)
    stroke.Color = Color3.fromRGB(200, 80, 255)
    stroke.Thickness = 2

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
    TabFrame.Size = UDim2.new(0, 150, 1, -55)
    TabFrame.Position = UDim2.new(0, 10, 0, 48)
    TabFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 22)
    TabFrame.BorderSizePixel = 0
    Instance.new("UICorner", TabFrame).CornerRadius = UDim.new(0, 8)

    local Content = Instance.new("Frame", Main)
    Content.Size = UDim2.new(1, -175, 1, -60)
    Content.Position = UDim2.new(0, 166, 0, 48)
    Content.BackgroundColor3 = Color3.fromRGB(14, 14, 19)
    Content.BorderSizePixel = 0
    Instance.new("UICorner", Content).CornerRadius = UDim.new(0, 8)

    local Tabs, Current = {}, nil
    local function AddTab(name)
        local Btn = Instance.new("TextButton", TabFrame)
        Btn.Size = UDim2.new(1, -12, 0, 34)
        Btn.Position = UDim2.new(0, 6, 0, #Tabs * 42 + 8)
        Btn.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
        Btn.Text = name
        Btn.TextColor3 = Color3.fromRGB(200, 200, 210)
        Btn.Font = Enum.Font.GothamSemibold
        Btn.TextSize = 13
        Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 6)

        local Page = Instance.new("ScrollingFrame", Content)
        Page.Size = UDim2.new(1, -10, 1, -10)
        Page.Position = UDim2.new(0, 5, 0, 5)
        Page.BackgroundTransparency = 1
        Page.ScrollBarThickness = 3
        Page.ScrollBarImageColor3 = Color3.fromRGB(170, 0, 255)
        Page.CanvasSize = UDim2.new(0, 0, 0, 0)
        Page.Visible = false
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
            local F = Instance.new("Frame", Page)
            F.Size = UDim2.new(1, -4, 0, 32)
            F.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
            Instance.new("UICorner", F).CornerRadius = UDim.new(0, 6)
            local L = Instance.new("TextLabel", F)
            L.Size = UDim2.new(1, -52, 1, 0)
            L.Position = UDim2.new(0, 10, 0, 0)
            L.BackgroundTransparency = 1
            L.Text = txt
            L.TextColor3 = Color3.fromRGB(230, 230, 235)
            L.Font = Enum.Font.Gotham
            L.TextSize = 13
            L.TextXAlignment = Enum.TextXAlignment.Left
            local T = Instance.new("TextButton", F)
            T.Size = UDim2.new(0, 40, 0, 20)
            T.Position = UDim2.new(1, -48, 0.5, -10)
            T.BackgroundColor3 = def and Color3.fromRGB(140, 0, 220) or Color3.fromRGB(50, 50, 60)
            T.Text = ""
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
            local F = Instance.new("Frame", Page)
            F.Size = UDim2.new(1, -4, 0, 50)
            F.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
            Instance.new("UICorner", F).CornerRadius = UDim.new(0, 6)
            local L = Instance.new("TextLabel", F)
            L.Size = UDim2.new(1, -16, 0, 20)
            L.Position = UDim2.new(0, 10, 0, 4)
            L.BackgroundTransparency = 1
            L.Text = txt .. ": " .. def
            L.TextColor3 = Color3.fromRGB(230, 230, 235)
            L.Font = Enum.Font.Gotham
            L.TextSize = 13
            L.TextXAlignment = Enum.TextXAlignment.Left
            local BG = Instance.new("Frame", F)
            BG.Size = UDim2.new(1, -20, 0, 6)
            BG.Position = UDim2.new(0, 10, 0, 30)
            BG.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
            Instance.new("UICorner", BG).CornerRadius = UDim.new(1, 0)
            local Fill = Instance.new("Frame", BG)
            Fill.Size = UDim2.new((def-min)/(max-min), 0, 1, 0)
            Fill.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
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
            local B = Instance.new("TextButton", Page)
            B.Size = UDim2.new(1, -4, 0, 34)
            B.BackgroundColor3 = Color3.fromRGB(120, 0, 200)
            B.Text = txt
            B.TextColor3 = Color3.fromRGB(255, 255, 255)
            B.Font = Enum.Font.GothamSemibold
            B.TextSize = 13
            Instance.new("UICorner", B).CornerRadius = UDim.new(0, 6)
            B.MouseButton1Click:Connect(cb)
            return API
        end
        function API:Label(txt)
            local L = Instance.new("TextLabel", Page)
            L.Size = UDim2.new(1, -4, 0, 28)
            L.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
            L.Text = txt
            L.TextColor3 = Color3.fromRGB(180, 180, 190)
            L.Font = Enum.Font.Gotham
            L.TextSize = 12
            Instance.new("UICorner", L).CornerRadius = UDim.new(0, 6)
            return API
        end
        return API
    end

    -- Tabs
    local Combat = AddTab("Combat")
    Combat:Toggle("Kill Aura", Config.Combat.KillAura, function(v) Config.Combat.KillAura = v end)
    Combat:Slider("Aura Range", 10, 80, Config.Combat.AuraRange, function(v) Config.Combat.AuraRange = v end)
    Combat:Toggle("Silent Aim", Config.Combat.SilentAim, function(v) Config.Combat.SilentAim = v end)
    Combat:Slider("FOV", 50, 500, Config.Combat.FOV, function(v) Config.Combat.FOV = v end)
    Combat:Toggle("Prediction", Config.Combat.Prediction, function(v) Config.Combat.Prediction = v end)
    Combat:Toggle("Godmode", Config.Combat.Godmode, function(v) Config.Combat.Godmode = v end)
    Combat:Toggle("Infinite Ammo", Config.Combat.InfiniteAmmo, function(v) Config.Combat.InfiniteAmmo = v end)

    local Farm = AddTab("Auto Farm")
    Farm:Toggle("Auto Collect", Config.Farm.AutoCollect, function(v) Config.Farm.AutoCollect = v end)
    Farm:Toggle("Auto Repair", Config.Farm.AutoRepair, function(v) Config.Farm.AutoRepair = v end)
    Farm:Toggle("Auto Heal", Config.Farm.AutoHeal, function(v) Config.Farm.AutoHeal = v end)
    Farm:Toggle("Instant Prompt", Config.Farm.InstantPrompt, function(v) Config.Farm.InstantPrompt = v end)
    Farm:Toggle("Auto Bring", Config.Farm.AutoBring, function(v) Config.Farm.AutoBring = v end)
    Farm:Slider("Bring Range", 40, 220, Config.Farm.BringRange, function(v) Config.Farm.BringRange = v end)
    Farm:Slider("Collect Range", 20, 130, Config.Farm.CollectRange, function(v) Config.Farm.CollectRange = v end)
    Farm:Button("Force Collect All", function()
        for _, o in pairs(Workspace:GetDescendants()) do
            if o:IsA("ProximityPrompt") then pcall(fireproximityprompt, o) end
        end
        Notify("Farm", "Force collect xong", 3)
    end)
    Farm:Button("Teleport to Train", function()
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj:IsA("BasePart") and (obj.Name:lower():find("train") or obj.Name:lower():find("engine") or obj.Name:lower():find("loco")) then
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = obj.CFrame + Vector3.new(0, 6, 0)
                    Notify("TP", "Đã tới tàu", 3)
                    break
                end
            end
        end
    end)

    local Move = AddTab("Movement")
    Move:Toggle("Speed (No Rubberband)", Config.Movement.Speed, function(v) Config.Movement.Speed = v end)
    Move:Slider("Speed Value", 16, 200, Config.Movement.SpeedValue, function(v) Config.Movement.SpeedValue = v end)
    Move:Toggle("Fly (Unlock Cam)", Config.Movement.Fly, function(v) Config.Movement.Fly = v end)
    Move:Slider("Fly Speed", 30, 280, Config.Movement.FlySpeed, function(v) Config.Movement.FlySpeed = v end)
    Move:Toggle("Noclip", Config.Movement.Noclip, function(v) Config.Movement.Noclip = v end)
    Move:Toggle("Infinite Jump", Config.Movement.InfiniteJump, function(v) Config.Movement.InfiniteJump = v end)
    Move:Toggle("Train Speed Bypass", Config.Movement.TrainBypass, function(v) Config.Movement.TrainBypass = v end)
    Move:Slider("Train Speed", 50, 400, Config.Movement.TrainSpeed, function(v) Config.Movement.TrainSpeed = v end)

    -- TAB TOOL MỚI
    local ToolTab = AddTab("Tool")
    ToolTab:Label("Keybind mặc định: Z (bật/tắt Tool)")
    ToolTab:Toggle("Tool Enabled (Z)", Config.Tool.Enabled, function(v)
        Config.Tool.Enabled = v
        Notify("Tool", v and "Tool ON (Z)" or "Tool OFF (Z)", 3)
    end)
    ToolTab:Toggle("Air Weld (Hàn trên không)", Config.Tool.AirWeld, function(v)
        Config.Tool.AirWeld = v
    end)
    ToolTab:Button("Force Toggle Tool (Z)", function()
        Config.Tool.Enabled = not Config.Tool.Enabled
        Notify("Tool", Config.Tool.Enabled and "Tool ON" or "Tool OFF", 3)
    end)

    local DupeTab = AddTab("Dupe")
    DupeTab:Toggle("Enable Dupe", Config.Dupe.Enabled, function(v) Config.Dupe.Enabled = v end)
    DupeTab:Slider("Dupe Amount", 1, 35, Config.Dupe.Amount, function(v) Config.Dupe.Amount = v end)
    DupeTab:Button("Execute Dupe (Hold Item)", function()
        if not Config.Dupe.Enabled then Notify("Dupe", "Bật Enable trước", 3) return end
        local char = LocalPlayer.Character
        local tool = char and char:FindFirstChildOfClass("Tool")
        if not tool then Notify("Dupe", "Cầm item vào tay trước", 3) return end
        local backpack = LocalPlayer:FindFirstChild("Backpack")
        if not backpack then return end
        for i = 1, Config.Dupe.Amount do
            pcall(function()
                local clone = tool:Clone()
                clone.Parent = backpack
            end)
            task.wait(0.025)
        end
        Notify("Dupe", "Đã dupe x" .. Config.Dupe.Amount, 4)
    end)

    local ModeTab = AddTab("16 Mode")
    local modes = {
        "God + Aura", "Full Farm", "Fly + Noclip", "Silent + Pred",
        "Bring + Collect", "Train Max", "Dupe x20", "ESP Full",
        "Speed 100", "Heal + Repair", "Combat All", "Movement All",
        "Farm + Bring", "Stealth", "Rage", "Reset All"
    }
    for i, name in ipairs(modes) do
        ModeTab:Button("Mode " .. i .. ": " .. name, function()
            if i == 1 then Config.Combat.Godmode = true Config.Combat.KillAura = true
            elseif i == 2 then Config.Farm.AutoCollect = true Config.Farm.AutoRepair = true Config.Farm.AutoHeal = true Config.Farm.AutoBring = true
            elseif i == 3 then Config.Movement.Fly = true Config.Movement.Noclip = true
            elseif i == 4 then Config.Combat.SilentAim = true Config.Combat.Prediction = true
            elseif i == 5 then Config.Farm.AutoBring = true Config.Farm.AutoCollect = true
            elseif i == 6 then Config.Movement.TrainBypass = true Config.Movement.TrainSpeed = 350
            elseif i == 7 then Config.Dupe.Enabled = true Config.Dupe.Amount = 20
            elseif i == 8 then Config.ESP.Enabled = true Config.ESP.Players = true Config.ESP.Items = true
            elseif i == 9 then Config.Movement.Speed = true Config.Movement.SpeedValue = 100
            elseif i == 10 then Config.Farm.AutoHeal = true Config.Farm.AutoRepair = true
            elseif i == 11 then Config.Combat.KillAura = true Config.Combat.SilentAim = true Config.Combat.Godmode = true
            elseif i == 12 then Config.Movement.Speed = true Config.Movement.Fly = true Config.Movement.Noclip = true Config.Movement.InfiniteJump = true
            elseif i == 13 then Config.Farm.AutoCollect = true Config.Farm.AutoBring = true Config.Farm.InstantPrompt = true
            elseif i == 14 then Config.Combat.KillAura = false Config.Movement.Speed = false Config.ESP.Enabled = false
            elseif i == 15 then Config.Combat.KillAura = true Config.Combat.AuraRange = 55 Config.Movement.Speed = true Config.Movement.SpeedValue = 80
            elseif i == 16 then
                for k,v in pairs(Config) do if type(v)=="table" then for k2,_ in pairs(v) do if type(v[k2])=="boolean" then v[k2]=false end end end end
            end
            Notify("16 Mode", "Activated: " .. name, 3)
        end)
    end

    local ESP = AddTab("ESP")
    ESP:Toggle("Enable ESP", Config.ESP.Enabled, function(v) Config.ESP.Enabled = v end)
    ESP:Toggle("Player ESP", Config.ESP.Players, function(v) Config.ESP.Players = v end)
    ESP:Toggle("Item ESP", Config.ESP.Items, function(v) Config.ESP.Items = v end)
    ESP:Slider("Max Distance", 500, 12000, Config.ESP.MaxDistance, function(v) Config.ESP.MaxDistance = v end)

    local Misc = AddTab("Misc")
    Misc:Toggle("Fullbright", Config.Misc.FullBright, function(v)
        Config.Misc.FullBright = v
        if v then Lighting.Brightness = 2.5 Lighting.ClockTime = 14 Lighting.FogEnd = 9e9 Lighting.GlobalShadows = false end
    end)
    Misc:Toggle("No Fog", Config.Misc.NoFog, function(v) Config.Misc.NoFog = v end)
    Misc:Toggle("FPS Boost", Config.Misc.FPSBoost, function(v) if v then settings().Rendering.QualityLevel = Enum.QualityLevel.Level01 end end)
    Misc:Toggle("Anti AFK", Config.Misc.AntiAFK, function(v) Config.Misc.AntiAFK = v end)
    Misc:Toggle("Auto Respawn", Config.Misc.AutoRespawn, function(v) Config.Misc.AutoRespawn = v end)
    Misc:Button("Save Config", function() SaveConfig() Notify("Config", "Đã lưu", 3) end)
    Misc:Button("Rejoin", function() TeleportService:Teleport(game.PlaceId, LocalPlayer) end)

    -- Keybind Z cho Tool
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.KeyCode == Config.Tool.Keybind then
            Config.Tool.Enabled = not Config.Tool.Enabled
            Notify("Tool", Config.Tool.Enabled and "Tool ON (Z)" or "Tool OFF (Z)", 2)
        end
    end)

    local ESPFolder = Instance.new("Folder", CoreGui)
    ESPFolder.Name = "FoxESPv10"
    local function DrawESP(ad, col, txt)
        local bb = Instance.new("BillboardGui")
        bb.AlwaysOnTop = true
        bb.Size = UDim2.new(0, 220, 0, 34)
        bb.StudsOffset = Vector3.new(0, 2.5, 0)
        bb.Adornee = ad
        bb.Parent = ESPFolder
        local l = Instance.new("TextLabel", bb)
        l.Size = UDim2.new(1, 0, 1, 0)
        l.BackgroundTransparency = 1
        l.Text = txt
        l.TextColor3 = col
        l.TextStrokeTransparency = 0.3
        l.Font = Enum.Font.GothamBold
        l.TextSize = 12
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

    local speedBV, flyBV, flyBG

    RunService.Heartbeat:Connect(function()
        local char = LocalPlayer.Character
        if not char then return end
        local hum = char:FindFirstChildOfClass("Humanoid")
        local root = char:FindFirstChild("HumanoidRootPart")
        if not hum or not root then return end

        -- Speed No Rubberband
        if Config.Movement.Speed then
            hum.WalkSpeed = Config.Movement.SpeedValue
            if not speedBV then
                speedBV = Instance.new("BodyVelocity")
                speedBV.Name = "SpeedFix"
                speedBV.MaxForce = Vector3.new(1e5, 0, 1e5)
                speedBV.Velocity = Vector3.zero
                speedBV.Parent = root
            end
            local moveDir = hum.MoveDirection
            if moveDir.Magnitude > 0.1 then
                speedBV.Velocity = Vector3.new(moveDir.X * Config.Movement.SpeedValue, root.AssemblyLinearVelocity.Y, moveDir.Z * Config.Movement.SpeedValue)
            else
                speedBV.Velocity = Vector3.new(0, root.AssemblyLinearVelocity.Y, 0)
            end
        else
            if speedBV then speedBV:Destroy() speedBV = nil end
            if hum.WalkSpeed > 20 then hum.WalkSpeed = 16 end
        end

        if Config.Movement.InfiniteJump then hum.JumpPower = 105 end
        if Config.Combat.Godmode then hum.Health = hum.MaxHealth end

        if Config.Movement.Noclip then
            for _, p in pairs(char:GetDescendants()) do
                if p:IsA("BasePart") then p.CanCollide = false end
            end
        end

        -- Fly Unlock Cam
        if Config.Movement.Fly then
            hum.PlatformStand = true
            if not flyBV then
                flyBV = Instance.new("BodyVelocity")
                flyBV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                flyBV.Velocity = Vector3.zero
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
            flyBV.Velocity = dir.Magnitude > 0 and dir.Unit * Config.Movement.FlySpeed or Vector3.zero
        else
            if flyBV then flyBV:Destroy() flyBV = nil end
            if flyBG then flyBG:Destroy() flyBG = nil end
            if hum then hum.PlatformStand = false end
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

        -- AIR WELD (khi Tool Enabled + AirWeld)
        if Config.Tool.Enabled and Config.Tool.AirWeld then
            -- Cho phép hàn / giữ object trên không (đơn giản: giữ BodyPosition cho các part gần)
            for _, obj in pairs(Workspace:GetDescendants()) do
                if obj:IsA("BasePart") and not obj.Anchored and (obj.Name:lower():find("weld") or obj.Name:lower():find("part") or obj.Name:lower():find("metal") or obj.Name:lower():find("plate")) then
                    local dist = (root.Position - obj.Position).Magnitude
                    if dist < 25 then
                        local bp = obj:FindFirstChild("AirWeldBP") or Instance.new("BodyPosition")
                        bp.Name = "AirWeldBP"
                        bp.MaxForce = Vector3.new(1e5, 1e5, 1e5)
                        bp.Position = obj.Position + Vector3.new(0, 0.5, 0) -- giữ trên không nhẹ
                        bp.Parent = obj
                    end
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

        if Config.Combat.InfiniteAmmo then
            local tool = char:FindFirstChildOfClass("Tool")
            if tool then
                for _, v in pairs(tool:GetDescendants()) do
                    if v:IsA("NumberValue") or v:IsA("IntValue") then
                        if v.Name:lower():find("ammo") or v.Name:lower():find("bullet") or v.Name:lower():find("clip") then
                            v.Value = 999
                        end
                    end
                end
            end
        end

        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj:IsA("ProximityPrompt") then
                local n = (obj.Parent and obj.Parent.Name or ""):lower()
                local part = obj.Parent:IsA("BasePart") and obj.Parent or obj.Parent:FindFirstChildWhichIsA("BasePart")
                if part and part:IsA("BasePart") then
                    local d = (root.Position - part.Position).Magnitude
                    if Config.Farm.AutoBring and d <= Config.Farm.BringRange and (n:find("gold") or n:find("ammo") or n:find("med") or n:find("crate") or n:find("loot") or n:find("item")) then
                        pcall(function()
                            part.CFrame = root.CFrame * CFrame.new(math.random(-2,2), 1, math.random(-3,-1))
                        end)
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
            task.wait(0.3)
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
                        return CFrame.new(t.Position + (t.AssemblyLinearVelocity or Vector3.zero) * 0.14)
                    end
                    return CFrame.new(t.Position)
                end
            end
            return old(self, k)
        end)
        setreadonly(mt, true)
    end)

    Notify("Fake Foxname v10", "Tab Tool + Z (Air Weld) sẵn sàng", 5)
end
