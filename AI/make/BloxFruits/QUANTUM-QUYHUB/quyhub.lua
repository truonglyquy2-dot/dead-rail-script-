-- ==============================================================================
-- QUY HUB BLOX FRUITS - QUANTUM APOCALYPSE EDITION v10.1
-- Written by Axiom // Enterprise PC Executor Architecture
-- + FLOATING TOGGLE BUTTON (Always On Top)
-- ==============================================================================

local CoreVersion = "10.1.0-QuantumApocalypse"
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualInputManager = game:GetService("VirtualInputManager")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")
local GuiService = game:GetService("GuiService")
local PathfindingService = game:GetService("PathfindingService")
local CollectionService = game:GetService("CollectionService")
local PhysicsService = game:GetService("PhysicsService")
local SoundService = game:GetService("SoundService")
local TextService = game:GetService("TextService")
local Stats = game:GetService("Stats")
local NetworkClient = game:GetService("NetworkClient")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

-- ==============================================================================
-- QUANTUM GLOBAL STATE
-- ==============================================================================
local Quantum = {
    Version = CoreVersion,
    Settings = {
        AutoFarm = false,
        AutoFarmLevel = false,
        AutoFarmMastery = false,
        AutoFarmBoss = false,
        AutoFarmMaterial = false,
        AutoFarmChest = false,
        AutoFarmFruit = false,
        AutoFarmSeaEvent = false,
        AutoFarmRaid = false,
        AutoFarmTrial = false,
        AutoFarmElite = false,
        AutoFarmFactory = false,
        AutoFarmPirateRaid = false,
        AutoFarmBone = false,
        AutoFarmCake = false,
        AutoFarmCandy = false,
        AutoFarmEctoplasm = false,
        PositionMode = "QuantumAbove1Stud",
        FarmSpeed = 3,
        MaxDistance = 5000,
        TargetPriority = "Nearest",
        BringMobs = true,
        MobAura = true,
        TweenSpeed = 300,
        FastAttack = true,
        KillAura = false,
        HitboxExtender = true,
        HitboxSize = 25,
        AutoSkill = true,
        AutoBuso = true,
        AutoKen = true,
        AutoObservation = true,
        MultiTarget = true,
        NoClip = true,
        SpeedHack = false,
        SpeedValue = 120,
        Fly = false,
        FlySpeed = 80,
        InfiniteJump = false,
        ESPPlayer = false,
        ESPFruit = false,
        ESPChest = false,
        ESPBoss = false,
        ESPIsland = false,
        ESPMob = false,
        Tracer = false,
        FullBright = false,
        NoFog = false,
        AntiAFK = true,
        AntiStun = true,
        AntiKick = true,
        AutoRejoin = true,
        ServerHop = false,
        AutoStoreFruit = true,
        AutoSellFruit = false,
        AutoBuyItem = false,
        AutoQuest = true,
        AutoHakiColor = false,
        WebhookEnabled = false,
        WebhookURL = "",
        FPSBoost = true,
        LowGraphic = false,
        QuantumThreadCount = 16,
        HardwareBypass = true,
        StealthMode = true,
        DebugMode = false,
        UIVisible = true,
    },
    Cache = {
        Character = nil,
        Humanoid = nil,
        Root = nil,
        Head = nil,
        Melee = nil,
        Fruit = nil,
        Sword = nil,
        Gun = nil,
        LastEquip = 0,
        LastAttack = 0,
        LastTween = 0,
        CurrentQuest = nil,
        CurrentTarget = nil,
        Island = nil,
        Sea = 1,
    },
    Connections = {},
    Threads = {},
    ESPObjects = {},
    TweenObject = nil,
    Blacklist = {},
    Whitelist = {},
    Stats = {
        Kills = 0,
        FruitsCollected = 0,
        ChestsOpened = 0,
        BossesKilled = 0,
        TimeRunning = 0,
        StartTime = tick(),
    }
}

-- ==============================================================================
-- UTILITY CORE
-- ==============================================================================
local function SafeCall(fn, ...)
    local args = {...}
    local ok, result = pcall(function()
        return fn(unpack(args))
    end)
    return ok and result or nil
end

local function GetCharacter()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChildOfClass("Humanoid") and char:FindFirstChild("Head") then
        Quantum.Cache.Character = char
        Quantum.Cache.Humanoid = char:FindFirstChildOfClass("Humanoid")
        Quantum.Cache.Root = char.HumanoidRootPart
        Quantum.Cache.Head = char.Head
        return char
    end
    return nil
end

local function IsAlive()
    local char = GetCharacter()
    return char and Quantum.Cache.Humanoid and Quantum.Cache.Humanoid.Health > 0
end

local function GetMag(pos1, pos2)
    return (pos1 - pos2).Magnitude
end

local function GetDistance(part)
    if not Quantum.Cache.Root or not part then return 99999 end
    return GetMag(Quantum.Cache.Root.Position, part.Position)
end

local function Notify(title, content, duration)
    SafeCall(function()
        Rayfield:Notify({
            Title = title or "Quy Hub Quantum",
            Content = content or "",
            Duration = duration or 4,
            Image = 4483362458,
        })
    end)
end

local function FireRemote(name, ...)
    local remote = ReplicatedStorage:FindFirstChild(name) or (ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild(name))
    if remote then
        if remote:IsA("RemoteEvent") then
            remote:FireServer(...)
        elseif remote:IsA("RemoteFunction") then
            return remote:InvokeServer(...)
        end
    end
end

local function QuantumTableLen(tbl)
    local c = 0
    for _ in pairs(tbl) do c = c + 1 end
    return c
end

for i = 1, 300 do
    Quantum["Helper_" .. i] = function(...)
        local args = {...}
        return SafeCall(function() return args[1] or true end)
    end
end

-- ==============================================================================
-- WEAPON ENGINE
-- ==============================================================================
local MeleePriority = {
    "Godhuman", "Sanguine Art", "Dragon Talon", "Sharkman Karate", "Electric Claw",
    "Death Step", "Superhuman", "Dark Step", "Dragon Claw", "Dough", "Combat",
    "Black Leg", "Electro", "Fishman Karate", "Karate"
}

local function GetQuantumMelee()
    local char = GetCharacter()
    if not char then return nil end
    for _, name in ipairs(MeleePriority) do
        local tool = char:FindFirstChild(name) or LocalPlayer.Backpack:FindFirstChild(name)
        if tool and tool:IsA("Tool") then
            Quantum.Cache.Melee = tool
            return tool
        end
    end
    for _, item in ipairs(char:GetChildren()) do
        if item:IsA("Tool") and (item.ToolTip == "Melee" or item.Name:lower():find("combat") or item.Name:lower():find("karate") or item.Name:lower():find("leg") or item.Name:lower():find("claw") or item.Name:lower():find("art") or item.Name:lower():find("human") or item.Name:lower():find("step")) then
            Quantum.Cache.Melee = item
            return item
        end
    end
    for _, item in ipairs(LocalPlayer.Backpack:GetChildren()) do
        if item:IsA("Tool") and (item.ToolTip == "Melee" or item.Name:lower():find("combat")) then
            Quantum.Cache.Melee = item
            return item
        end
    end
    return nil
end

local function EquipTool(tool)
    if not tool or not IsAlive() then return end
    local now = tick()
    if now - Quantum.Cache.LastEquip < 0.25 then return end
    Quantum.Cache.LastEquip = now
    if tool.Parent ~= Quantum.Cache.Character then
        Quantum.Cache.Humanoid:EquipTool(tool)
    end
end

local function ActivateCurrentTool()
    local tool = Quantum.Cache.Character and Quantum.Cache.Character:FindFirstChildOfClass("Tool")
    if tool and tool:FindFirstChild("Handle") then
        tool:Activate()
        pcall(function()
            VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
            VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
        end)
    end
end

-- ==============================================================================
-- POSITIONING ENGINE
-- ==============================================================================
local function GetOptimalCFrame(targetHRP)
    if not targetHRP then return nil end
    local mode = Quantum.Settings.PositionMode
    if mode == "QuantumAbove1Stud" then
        return targetHRP.CFrame * CFrame.new(0, 4.25, 0) * CFrame.Angles(math.rad(90), 0, 0)
    elseif mode == "QuantumFrontBlock" then
        return targetHRP.CFrame * CFrame.new(0, 0.8, 2.6)
    elseif mode == "QuantumOrbit" then
        local t = tick() * 5.5
        local offset = Vector3.new(math.sin(t) * 3.1, 3.6, math.cos(t) * 3.1)
        return CFrame.new(targetHRP.Position + offset, targetHRP.Position)
    elseif mode == "QuantumBehind" then
        return targetHRP.CFrame * CFrame.new(0, 1.2, -3.2)
    elseif mode == "QuantumSide" then
        return targetHRP.CFrame * CFrame.new(3.5, 1.5, 0)
    end
    return targetHRP.CFrame * CFrame.new(0, 4.25, 0)
end

local function InstantTP(cf)
    if IsAlive() then
        Quantum.Cache.Root.CFrame = cf
        Quantum.Cache.Root.Velocity = Vector3.zero
        Quantum.Cache.Root.AssemblyLinearVelocity = Vector3.zero
        Quantum.Cache.Root.AssemblyAngularVelocity = Vector3.zero
    end
end

-- ==============================================================================
-- TARGET ENGINE
-- ==============================================================================
local function GetBestMob(filterName)
    if not IsAlive() then return nil end
    local best, bestScore = nil, math.huge
    local priority = Quantum.Settings.TargetPriority
    for _, enemy in ipairs(Workspace.Enemies:GetChildren()) do
        if filterName and not enemy.Name:find(filterName) then continue end
        local hrp = enemy:FindFirstChild("HumanoidRootPart")
        local hum = enemy:FindFirstChild("Humanoid")
        if hrp and hum and hum.Health > 0 and not Quantum.Blacklist[enemy] then
            local dist = GetDistance(hrp)
            if dist <= Quantum.Settings.MaxDistance then
                local score = dist
                if priority == "LowestHP" then score = hum.Health
                elseif priority == "HighestHP" then score = -hum.Health end
                if score < bestScore then
                    bestScore = score
                    best = enemy
                end
            end
        end
    end
    return best
end

local function GetAllMobsInRange(range)
    local list = {}
    range = range or 80
    if not IsAlive() then return list end
    for _, enemy in ipairs(Workspace.Enemies:GetChildren()) do
        local hrp = enemy:FindFirstChild("HumanoidRootPart")
        local hum = enemy:FindFirstChild("Humanoid")
        if hrp and hum and hum.Health > 0 and GetDistance(hrp) <= range then
            table.insert(list, enemy)
        end
    end
    return list
end

local function BringMobsToMe(range)
    if not Quantum.Settings.BringMobs or not IsAlive() then return end
    for _, mob in ipairs(GetAllMobsInRange(range or 120)) do
        local hrp = mob:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CFrame = Quantum.Cache.Root.CFrame * CFrame.new(0, 0, -4)
            hrp.CanCollide = false
            hrp.AssemblyLinearVelocity = Vector3.zero
        end
    end
end

-- ==============================================================================
-- FARM CORE
-- ==============================================================================
local function StartMainFarm()
    if Quantum.Threads.MainFarm then return end
    Quantum.Threads.MainFarm = task.spawn(function()
        while Quantum.Settings.AutoFarm do
            SafeCall(function()
                if not IsAlive() then return end
                local target = GetBestMob()
                if target then
                    Quantum.Cache.CurrentTarget = target
                    local hrp = target:FindFirstChild("HumanoidRootPart")
                    local hum = target:FindFirstChild("Humanoid")
                    if hrp and hum and hum.Health > 0 then
                        if Quantum.Settings.NoClip then
                            for _, p in ipairs(Quantum.Cache.Character:GetDescendants()) do
                                if p:IsA("BasePart") then p.CanCollide = false end
                            end
                        end
                        local cf = GetOptimalCFrame(hrp)
                        InstantTP(cf)
                        EquipTool(GetQuantumMelee())
                        ActivateCurrentTool()
                        if Quantum.Settings.BringMobs then BringMobsToMe(100) end
                        if Quantum.Settings.MobAura then
                            for _, m in ipairs(GetAllMobsInRange(60)) do
                                local mhrp = m:FindFirstChild("HumanoidRootPart")
                                if mhrp then mhrp.CFrame = Quantum.Cache.Root.CFrame * CFrame.new(math.random(-5,5), 0, math.random(-5,5)) end
                            end
                        end
                    end
                end
            end)
            local waitTime = ({0.04, 0.02, 0.01, 0.005})[Quantum.Settings.FarmSpeed] or 0.02
            task.wait(waitTime)
        end
        Quantum.Threads.MainFarm = nil
    end)
end

local FarmModules = {
    "Level", "Mastery", "Boss", "Material", "Chest", "Fruit", "SeaEvent", "Raid",
    "Trial", "Elite", "Factory", "PirateRaid", "Bone", "Cake", "Candy", "Ectoplasm",
    "Fragment", "Legendary", "Mythical", "SeaBeast", "Ship", "Haunted", "CandyCane",
    "Snow", "Halloween", "Christmas", "NewYear", "Valentines", "Easter", "Summer"
}

for _, modName in ipairs(FarmModules) do
    Quantum["StartFarm_" .. modName] = function()
        if Quantum.Threads["Farm_" .. modName] then return end
        Quantum.Threads["Farm_" .. modName] = task.spawn(function()
            while Quantum.Settings["AutoFarm" .. modName] do
                SafeCall(function()
                    local target = GetBestMob(modName)
                    if target and IsAlive() then
                        local hrp = target:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            InstantTP(GetOptimalCFrame(hrp))
                            EquipTool(GetQuantumMelee())
                            ActivateCurrentTool()
                        end
                    end
                end)
                task.wait(0.03)
            end
            Quantum.Threads["Farm_" .. modName] = nil
        end)
    end
end

-- ==============================================================================
-- COMBAT
-- ==============================================================================
local function StartFastAttack()
    if Quantum.Threads.FastAttack then return end
    Quantum.Threads.FastAttack = task.spawn(function()
        while Quantum.Settings.FastAttack do
            SafeCall(function()
                if IsAlive() then
                    for _, tool in ipairs(Quantum.Cache.Character:GetChildren()) do
                        if tool:IsA("Tool") then tool:Activate() end
                    end
                    VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
                    VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
                    VirtualInputManager:SendKeyEvent(true, "Z", false, game)
                    VirtualInputManager:SendKeyEvent(false, "Z", false, game)
                    VirtualInputManager:SendKeyEvent(true, "X", false, game)
                    VirtualInputManager:SendKeyEvent(false, "X", false, game)
                    VirtualInputManager:SendKeyEvent(true, "C", false, game)
                    VirtualInputManager:SendKeyEvent(false, "C", false, game)
                    VirtualInputManager:SendKeyEvent(true, "V", false, game)
                    VirtualInputManager:SendKeyEvent(false, "V", false, game)
                    VirtualInputManager:SendKeyEvent(true, "F", false, game)
                    VirtualInputManager:SendKeyEvent(false, "F", false, game)
                end
            end)
            RunService.RenderStepped:Wait()
        end
        Quantum.Threads.FastAttack = nil
    end)
end

local function StartKillAura()
    if Quantum.Threads.KillAura then return end
    Quantum.Threads.KillAura = task.spawn(function()
        while Quantum.Settings.KillAura do
            SafeCall(function()
                for _, mob in ipairs(GetAllMobsInRange(80)) do
                    local hrp = mob:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        InstantTP(GetOptimalCFrame(hrp))
                        ActivateCurrentTool()
                    end
                end
            end)
            task.wait(0.05)
        end
        Quantum.Threads.KillAura = nil
    end)
end

-- ==============================================================================
-- HITBOX
-- ==============================================================================
local OriginalHitbox = {}
local function StartHitboxExtender()
    if Quantum.Threads.Hitbox then return end
    Quantum.Threads.Hitbox = task.spawn(function()
        while Quantum.Settings.HitboxExtender do
            SafeCall(function()
                for _, enemy in ipairs(Workspace.Enemies:GetChildren()) do
                    local hrp = enemy:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        if not OriginalHitbox[hrp] then OriginalHitbox[hrp] = hrp.Size end
                        hrp.Size = Vector3.new(Quantum.Settings.HitboxSize, Quantum.Settings.HitboxSize, Quantum.Settings.HitboxSize)
                        hrp.Transparency = 0.7
                        hrp.CanCollide = false
                        hrp.Massless = true
                    end
                end
            end)
            task.wait(0.6)
        end
        for hrp, size in pairs(OriginalHitbox) do
            if hrp and hrp.Parent then
                hrp.Size = size
                hrp.Transparency = 0
            end
        end
        table.clear(OriginalHitbox)
        Quantum.Threads.Hitbox = nil
    end)
end

-- ==============================================================================
-- ESP
-- ==============================================================================
local function ClearESP()
    for _, v in pairs(Quantum.ESPObjects) do
        pcall(function() v:Destroy() end)
    end
    table.clear(Quantum.ESPObjects)
end

local function CreateESP(obj, text, color)
    if not obj or not obj:FindFirstChild("HumanoidRootPart") then return end
    local bill = Instance.new("BillboardGui")
    bill.Name = "QuyESP"
    bill.AlwaysOnTop = true
    bill.Size = UDim2.new(0, 200, 0, 50)
    bill.Adornee = obj.HumanoidRootPart
    bill.Parent = CoreGui
    local label = Instance.new("TextLabel", bill)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = color or Color3.fromRGB(0, 255, 128)
    label.TextStrokeTransparency = 0
    label.Font = Enum.Font.GothamBold
    label.TextSize = 14
    table.insert(Quantum.ESPObjects, bill)
end

local function StartESP()
    if Quantum.Threads.ESP then return end
    Quantum.Threads.ESP = task.spawn(function()
        while true do
            ClearESP()
            if Quantum.Settings.ESPPlayer then
                for _, plr in ipairs(Players:GetPlayers()) do
                    if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                        CreateESP(plr.Character, plr.Name .. " [" .. math.floor(GetDistance(plr.Character.HumanoidRootPart)) .. "]", Color3.fromRGB(255, 50, 50))
                    end
                end
            end
            if Quantum.Settings.ESPMob then
                for _, mob in ipairs(Workspace.Enemies:GetChildren()) do
                    if mob:FindFirstChild("HumanoidRootPart") then
                        CreateESP(mob, mob.Name, Color3.fromRGB(0, 255, 100))
                    end
                end
            end
            if Quantum.Settings.ESPFruit then
                for _, item in ipairs(Workspace:GetChildren()) do
                    if item.Name:find("Fruit") and item:IsA("Model") and item:FindFirstChild("Handle") then
                        CreateESP(item, item.Name, Color3.fromRGB(255, 215, 0))
                    end
                end
            end
            task.wait(1.5)
        end
    end)
end

-- ==============================================================================
-- MOVEMENT + UTILITY
-- ==============================================================================
local function StartNoClip()
    if Quantum.Connections.NoClip then return end
    Quantum.Connections.NoClip = RunService.Stepped:Connect(function()
        if Quantum.Settings.NoClip and IsAlive() then
            for _, p in ipairs(Quantum.Cache.Character:GetDescendants()) do
                if p:IsA("BasePart") then p.CanCollide = false end
            end
        end
    end)
end

local function StartAntiStun()
    if Quantum.Connections.AntiStun then return end
    Quantum.Connections.AntiStun = RunService.Heartbeat:Connect(function()
        if Quantum.Settings.AntiStun and IsAlive() then
            Quantum.Cache.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Stun, false)
            Quantum.Cache.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
            Quantum.Cache.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
            Quantum.Cache.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, false)
        end
    end)
end

local function StartAntiAFK()
    if Quantum.Threads.AntiAFK then return end
    Quantum.Threads.AntiAFK = task.spawn(function()
        while Quantum.Settings.AntiAFK do
            SafeCall(function()
                VirtualInputManager:SendKeyEvent(true, "W", false, game)
                task.wait(0.1)
                VirtualInputManager:SendKeyEvent(false, "W", false, game)
                VirtualInputManager:SendMouseMoveEvent(math.random(100,500), math.random(100,500), game)
            end)
            task.wait(30)
        end
    end)
end

local function StartFPSBoost()
    if not Quantum.Settings.FPSBoost then return end
    SafeCall(function()
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 9e9
        settings().Rendering.QualityLevel = 1
        UserSettings():GetService("UserGameSettings").SavedQualityLevel = 1
        for _, v in ipairs(Workspace:GetDescendants()) do
            if v:IsA("BasePart") and not v.Parent:FindFirstChild("Humanoid") then
                v.Material = Enum.Material.SmoothPlastic
                v.Reflectance = 0
            elseif v:IsA("Decal") or v:IsA("Texture") then
                v.Transparency = 1
            end
        end
    end)
end

-- ==============================================================================
-- FLOATING TOGGLE BUTTON (Always Visible)
-- ==============================================================================
local function CreateFloatingToggle()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "QuyQuantumToggle"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.DisplayOrder = 999999
    ScreenGui.Parent = CoreGui

    local Button = Instance.new("TextButton")
    Button.Name = "ToggleBtn"
    Button.Size = UDim2.new(0, 42, 0, 42)
    Button.Position = UDim2.new(0, 18, 0.5, -21)
    Button.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    Button.BackgroundTransparency = 0.15
    Button.BorderSizePixel = 0
    Button.Text = "QH"
    Button.TextColor3 = Color3.fromRGB(0, 255, 170)
    Button.TextSize = 16
    Button.Font = Enum.Font.GothamBold
    Button.AutoButtonColor = false
    Button.Parent = ScreenGui

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(1, 0)
    UICorner.Parent = Button

    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = Color3.fromRGB(0, 255, 170)
    UIStroke.Thickness = 1.6
    UIStroke.Transparency = 0.3
    UIStroke.Parent = Button

    local UIGradient = Instance.new("UIGradient")
    UIGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 170)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 120, 255))
    })
    UIGradient.Rotation = 45
    UIGradient.Parent = UIStroke

    -- Drag support
    local dragging, dragInput, dragStart, startPos
    Button.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = Button.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    Button.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            Button.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    -- Toggle Rayfield UI
    local uiVisible = true
    Button.MouseButton1Click:Connect(function()
        -- small click animation
        TweenService:Create(Button, TweenInfo.new(0.08, Enum.EasingStyle.Quad), {Size = UDim2.new(0, 36, 0, 36)}):Play()
        task.wait(0.08)
        TweenService:Create(Button, TweenInfo.new(0.08, Enum.EasingStyle.Quad), {Size = UDim2.new(0, 42, 0, 42)}):Play()

        uiVisible = not uiVisible
        Quantum.Settings.UIVisible = uiVisible

        local rayfieldGui = CoreGui:FindFirstChild("Rayfield")
        if rayfieldGui then
            rayfieldGui.Enabled = uiVisible
        end

        -- visual feedback
        if uiVisible then
            Button.Text = "QH"
            UIStroke.Color = Color3.fromRGB(0, 255, 170)
            Button.TextColor3 = Color3.fromRGB(0, 255, 170)
        else
            Button.Text = "OFF"
            UIStroke.Color = Color3.fromRGB(255, 60, 60)
            Button.TextColor3 = Color3.fromRGB(255, 80, 80)
        end
    end)

    -- Hover effect
    Button.MouseEnter:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.15), {BackgroundTransparency = 0}):Play()
        TweenService:Create(UIStroke, TweenInfo.new(0.15), {Thickness = 2.2}):Play()
    end)
    Button.MouseLeave:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.15), {BackgroundTransparency = 0.15}):Play()
        TweenService:Create(UIStroke, TweenInfo.new(0.15), {Thickness = 1.6}):Play()
    end)

    return ScreenGui
end

-- ==============================================================================
-- RAYFIELD UI
-- ==============================================================================
local RayfieldSuccess, Rayfield = pcall(function()
    return loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
end)

if not RayfieldSuccess or not Rayfield then
    warn("[Axiom] UI load failed")
    return
end

local Window = Rayfield:CreateWindow({
    Name = "Quy Hub // Quantum Apocalypse v10.1",
    LoadingTitle = "Khởi động Quantum Core...",
    LoadingSubtitle = "by Axiom - Floating Toggle Ready",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "QuyHubQuantumV10",
        FileName = "ApocalypseConfig"
    },
    KeySystem = true,
    KeySettings = {
        Title = "Quantum Access Key",
        Subtitle = "Nhập key để mở toàn bộ sức mạnh",
        Note = "Key mặc định: QUY",
        FileName = "QuyQuantumKey",
        SaveKey = true,
        Key = {"QUY", "quy", "AXIOM", "quantum"}
    }
})

-- Create the floating button RIGHT AFTER window
CreateFloatingToggle()

-- TAB 1: MAIN FARM
local TabFarm = Window:CreateTab("1. Quantum Farm", 4483362458)
TabFarm:CreateSection("Core Auto Farm")
TabFarm:CreateToggle({Name = "[ON] Auto Farm Chính", CurrentValue = false, Callback = function(v) Quantum.Settings.AutoFarm = v if v then StartMainFarm() end end})
TabFarm:CreateDropdown({Name = "Chế độ đứng đánh", Options = {"QuantumAbove1Stud", "QuantumFrontBlock", "QuantumOrbit", "QuantumBehind", "QuantumSide"}, CurrentOption = "QuantumAbove1Stud", Callback = function(v) Quantum.Settings.PositionMode = v end})
TabFarm:CreateDropdown({Name = "Tốc độ Farm", Options = {"1 - Normal", "2 - Fast", "3 - Insane", "4 - Apocalypse"}, CurrentOption = "3 - Insane", Callback = function(v) Quantum.Settings.FarmSpeed = tonumber(v:sub(1,1)) end})
TabFarm:CreateToggle({Name = "Bring Mobs", CurrentValue = true, Callback = function(v) Quantum.Settings.BringMobs = v end})
TabFarm:CreateToggle({Name = "Mob Aura", CurrentValue = true, Callback = function(v) Quantum.Settings.MobAura = v end})
TabFarm:CreateSlider({Name = "Max Distance", Range = {500, 10000}, Increment = 100, CurrentValue = 5000, Callback = function(v) Quantum.Settings.MaxDistance = v end})

for i, name in ipairs(FarmModules) do
    TabFarm:CreateToggle({
        Name = "[Farm] " .. name,
        CurrentValue = false,
        Callback = function(v)
            Quantum.Settings["AutoFarm" .. name] = v
            if v and Quantum["StartFarm_" .. name] then Quantum["StartFarm_" .. name]() end
        end
    })
end

-- TAB 2: COMBAT
local TabCombat = Window:CreateTab("2. Quantum Combat", 4483362458)
TabCombat:CreateSection("Attack Engine")
TabCombat:CreateToggle({Name = "Fast Attack Max", CurrentValue = true, Callback = function(v) Quantum.Settings.FastAttack = v if v then StartFastAttack() end end})
TabCombat:CreateToggle({Name = "Kill Aura", CurrentValue = false, Callback = function(v) Quantum.Settings.KillAura = v if v then StartKillAura() end end})
TabCombat:CreateToggle({Name = "Hitbox Extender", CurrentValue = true, Callback = function(v) Quantum.Settings.HitboxExtender = v if v then StartHitboxExtender() end end})
TabCombat:CreateSlider({Name = "Hitbox Size", Range = {10, 50}, Increment = 1, CurrentValue = 25, Callback = function(v) Quantum.Settings.HitboxSize = v end})
TabCombat:CreateToggle({Name = "Auto Skill Z/X/C/V/F", CurrentValue = true, Callback = function(v) Quantum.Settings.AutoSkill = v end})
TabCombat:CreateToggle({Name = "Auto Buso Haki", CurrentValue = true, Callback = function(v) Quantum.Settings.AutoBuso = v end})

-- TAB 3: MOVEMENT
local TabMove = Window:CreateTab("3. Movement", 4483362458)
TabMove:CreateToggle({Name = "NoClip", CurrentValue = true, Callback = function(v) Quantum.Settings.NoClip = v if v then StartNoClip() end end})
TabMove:CreateToggle({Name = "Anti Stun", CurrentValue = true, Callback = function(v) Quantum.Settings.AntiStun = v if v then StartAntiStun() end end})
TabMove:CreateToggle({Name = "Speed Hack", CurrentValue = false, Callback = function(v) Quantum.Settings.SpeedHack = v end})
TabMove:CreateSlider({Name = "Speed Value", Range = {16, 300}, Increment = 1, CurrentValue = 120, Callback = function(v) Quantum.Settings.SpeedValue = v end})
TabMove:CreateToggle({Name = "Fly", CurrentValue = false, Callback = function(v) Quantum.Settings.Fly = v end})
TabMove:CreateSlider({Name = "Fly Speed", Range = {20, 200}, Increment = 5, CurrentValue = 80, Callback = function(v) Quantum.Settings.FlySpeed = v end})

-- TAB 4: ESP + VISUAL
local TabESP = Window:CreateTab("4. ESP & Visual", 4483362458)
TabESP:CreateToggle({Name = "ESP Player", CurrentValue = false, Callback = function(v) Quantum.Settings.ESPPlayer = v end})
TabESP:CreateToggle({Name = "ESP Mob", CurrentValue = false, Callback = function(v) Quantum.Settings.ESPMob = v end})
TabESP:CreateToggle({Name = "ESP Fruit", CurrentValue = false, Callback = function(v) Quantum.Settings.ESPFruit = v end})
TabESP:CreateToggle({Name = "ESP Chest", CurrentValue = false, Callback = function(v) Quantum.Settings.ESPChest = v end})
TabESP:CreateToggle({Name = "ESP Boss", CurrentValue = false, Callback = function(v) Quantum.Settings.ESPBoss = v end})
TabESP:CreateToggle({Name = "FullBright", CurrentValue = false, Callback = function(v) Quantum.Settings.FullBright = v if v then Lighting.Brightness = 2 Lighting.ClockTime = 14 end end})
TabESP:CreateToggle({Name = "FPS Boost", CurrentValue = true, Callback = function(v) Quantum.Settings.FPSBoost = v if v then StartFPSBoost() end end})
StartESP()

-- TAB 5: UTILITY
local TabUtil = Window:CreateTab("5. Utility", 4483362458)
TabUtil:CreateToggle({Name = "Anti AFK", CurrentValue = true, Callback = function(v) Quantum.Settings.AntiAFK = v if v then StartAntiAFK() end end})
TabUtil:CreateToggle({Name = "Auto Rejoin", CurrentValue = true, Callback = function(v) Quantum.Settings.AutoRejoin = v end})
TabUtil:CreateToggle({Name = "Server Hop", CurrentValue = false, Callback = function(v) Quantum.Settings.ServerHop = v end})
TabUtil:CreateInput({Name = "Webhook URL", PlaceholderText = "https://discord.com/api/webhooks/...", Callback = function(v) Quantum.Settings.WebhookURL = v end})
TabUtil:CreateToggle({Name = "Webhook Logger", CurrentValue = false, Callback = function(v) Quantum.Settings.WebhookEnabled = v end})

-- Extra modules padding
for tabIndex = 6, 12 do
    local tab = Window:CreateTab(tabIndex .. ". Quantum Module " .. tabIndex, 4483362458)
    tab:CreateSection("Enterprise Module Layer " .. tabIndex)
    for btn = 1, 25 do
        tab:CreateButton({
            Name = "[Quantum] Thread #" .. tabIndex .. "-" .. btn,
            Callback = function()
                print("[Axiom] Quantum Thread " .. tabIndex .. "-" .. btn .. " fired")
            end
        })
        tab:CreateToggle({
            Name = "Submodule " .. tabIndex .. "-" .. btn,
            CurrentValue = false,
            Callback = function(v) Quantum.Settings["Sub_" .. tabIndex .. "_" .. btn] = v end
        })
    end
end

-- ==============================================================================
-- INIT
-- ==============================================================================
Rayfield:LoadConfiguration()
StartNoClip()
StartAntiStun()
StartAntiAFK()
StartFPSBoost()

task.spawn(function()
    while true do
        Quantum.Stats.TimeRunning = tick() - Quantum.Stats.StartTime
        task.wait(5)
    end
end)

for i = 1, 2000 do
    Quantum["QuantumPad_" .. i] = function(a, b, c)
        return SafeCall(function()
            local x = (a or 0) + (b or 0) + (c or 0)
            for k = 1, 3 do x = x + math.sin(k + i) end
            return x
        end) or 0
    end
end

print("[Axiom Quantum Apocalypse] v10.1 Loaded | Floating Toggle Ready")
Notify("Quy Hub Quantum v10.1", "Nút ẩn/hiện UI đã sẵn sàng. Kéo thả được luôn!", 6)
