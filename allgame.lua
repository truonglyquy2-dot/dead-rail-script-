local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

-- Xóa menu cũ
if CoreGui:FindFirstChild("FanHubMain") then
    CoreGui.FanHubMain:Destroy()
end
if CoreGui:FindFirstChild("FanHubMinisize") then
    CoreGui.FanHubMinisize:Destroy()
end

pcall(function()
    for _, obj in ipairs(Workspace:GetChildren()) do
        if obj:IsA("Part") and obj.Size == Vector3.new(4, 1, 2) and obj.Anchored == false then
            obj:Destroy()
        end
    end
end)

-- GIAO DIỆN
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FanHubMain"
ScreenGui.Parent = CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 480, 0, 550)
MainFrame.Position = UDim2.new(0.25, 0, 0.15, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 45)
Title.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Text = "🔥 Fan Hub - Custom Clean Edition"
Title.TextSize = 11
Title.Font = Enum.Font.SourceSansBold
Title.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = Title

local MiniGui = Instance.new("ScreenGui")
MiniGui.Name = "FanHubMinisize"
MiniGui.Parent = CoreGui

local MinisizeBtn = Instance.new("ImageButton")
MinisizeBtn.Size = UDim2.new(0, 55, 0, 55)
MinisizeBtn.Position = UDim2.new(0, 30, 0, 150)
MinisizeBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MinisizeBtn.Image = "rbxassetid://138662915830919"
MinisizeBtn.Visible = false
MinisizeBtn.Active = true
MinisizeBtn.Draggable = true
MinisizeBtn.Parent = MiniGui

local MiniCorner = Instance.new("UICorner")
MiniCorner.CornerRadius = UDim.new(1, 0)
MiniCorner.Parent = MinisizeBtn

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 25)
CloseBtn.Position = UDim2.new(1, -38, 0.1, 0)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Text = "X"
CloseBtn.TextSize = 16
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.Parent = MainFrame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseBtn

local function toggleMenu()
    MainFrame.Visible = not MainFrame.Visible
    MinisizeBtn.Visible = not MainFrame.Visible
end

CloseBtn.MouseButton1Click:Connect(toggleMenu)
MinisizeBtn.MouseButton1Click:Connect(toggleMenu)

UserInputService.InputBegan:Connect(function(input, gp)
    if not gp and input.KeyCode == Enum.KeyCode.Insert then
        toggleMenu()
    end
end)

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Size = UDim2.new(1, -20, 1, -95)
ScrollingFrame.Position = UDim2.new(0, 10, 0, 85)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 5200)
ScrollingFrame.Parent = MainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)
UIListLayout.Parent = ScrollingFrame

local function createToggle(text, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 38)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = text .. " [OFF]"
    btn.TextSize = 13
    btn.Font = Enum.Font.SourceSansBold
    btn.Parent = ScrollingFrame
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn
    local state = false
    btn.MouseButton1Click:Connect(function()
        state = not state
        if state then
            btn.Text = text .. " [ON]"
            btn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
        else
            btn.Text = text .. " [OFF]"
            btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        end
        pcall(function() callback(state) end)
    end)
    return btn
end

local function createButton(text, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 38)
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 100)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = text
    btn.TextSize = 13
    btn.Font = Enum.Font.SourceSansBold
    btn.Parent = ScrollingFrame
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn
    btn.MouseButton1Click:Connect(function()
        pcall(callback)
    end)
    return btn
end

local function createTextBox(placeholder, callback)
    local box = Instance.new("TextBox")
    box.Size = UDim2.new(1, -10, 0, 36)
    box.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    box.TextColor3 = Color3.fromRGB(255, 255, 255)
    box.PlaceholderText = placeholder
    box.Text = ""
    box.TextSize = 13
    box.Font = Enum.Font.SourceSansBold
    box.Parent = ScrollingFrame
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = box
    box.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            pcall(function() callback(box.Text) end)
        end
    end)
    return box
end

-- 1. FLY MODE
createToggle("1. Fly Mode", function(state)
    _G.FlyRunning = state
    task.spawn(function()
        local char = LocalPlayer.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then return end
        local hrp = char.HumanoidRootPart
        local bodyGyro, bodyVelocity
        if _G.FlyRunning then
            bodyGyro = Instance.new("BodyGyro", hrp)
            bodyGyro.P = 9e4
            bodyGyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            bodyVelocity = Instance.new("BodyVelocity", hrp)
            bodyVelocity.maxForce = Vector3.new(9e9, 9e9, 9e9)
            while _G.FlyRunning do
                task.wait()
                local cam = Camera.CFrame
                local moveDir = Vector3.new()
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + cam.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - cam.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + cam.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - cam.RightVector end
                bodyVelocity.velocity = moveDir * (_G.FlySpeed or 50)
                bodyGyro.cframe = cam
            end
        else
            if hrp:FindFirstChildOfClass("BodyGyro") then hrp:FindFirstChildOfClass("BodyGyro"):Destroy() end
            if hrp:FindFirstChildOfClass("BodyVelocity") then hrp:FindFirstChildOfClass("BodyVelocity"):Destroy() end
        end
    end)
end)

createTextBox("Nhập Fly Speed (mặc định 50)", function(val)
    local num = tonumber(val)
    if num and num > 0 then _G.FlySpeed = num end
end)

-- 2. AIMBOT HEAD
createToggle("2. Aimbot Head (Workspace)", function(state)
    _G.AimbotHead = state
    RunService.RenderStepped:Connect(function()
        if _G.AimbotHead then
            pcall(function()
                local nearestDist = math.huge
                local targetHead = nil
                for _, obj in ipairs(Workspace:GetDescendants()) do
                    if obj:IsA("Model") and obj ~= LocalPlayer.Character then
                        local head = obj:FindFirstChild("Head")
                        local hum = obj:FindFirstChildOfClass("Humanoid")
                        if head and hum and hum.Health > 0 then
                            local screenPos, onScreen = Camera:WorldToScreenPoint(head.Position)
                            if onScreen then
                                local dist = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)).Magnitude
                                if dist < nearestDist then
                                    nearestDist = dist
                                    targetHead = head
                                end
                            end
                        end
                    end
                end
                if targetHead then
                    Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetHead.Position)
                end
            end)
        end
    end)
end)

-- 3. HEAD ESP
createToggle("3. Head ESP", function(state)
    _G.HeadESP = state
    task.spawn(function()
        while true do
            task.wait(1)
            pcall(function()
                for _, obj in ipairs(Workspace:GetDescendants()) do
                    if obj:IsA("Model") and obj ~= LocalPlayer.Character then
                        local head = obj:FindFirstChild("Head")
                        if head then
                            local billboard = head:FindFirstChild("ESP_Tag")
                            if _G.HeadESP and not billboard then
                                billboard = Instance.new("BillboardGui")
                                billboard.Name = "ESP_Tag"
                                billboard.Size = UDim2.new(0, 50, 0, 25)
                                billboard.AlwaysOnTop = true
                                billboard.Adornee = head
                                billboard.Parent = head
                                local txt = Instance.new("TextLabel")
                                txt.Size = UDim2.new(1, 0, 1, 0)
                                txt.BackgroundTransparency = 1
                                txt.Text = "[ TARGET ]"
                                txt.TextColor3 = Color3.fromRGB(255, 0, 0)
                                txt.TextSize = 10
                                txt.Font = Enum.Font.SourceSansBold
                                txt.Parent = billboard
                            elseif not _G.HeadESP and billboard then
                                billboard:Destroy()
                            end
                        end
                    end
                end
            end)
        end
    end)
end)

-- 4. NOCLIP
createToggle("4. Noclip", function(state)
    _G.Noclip = state
    RunService.Stepped:Connect(function()
        if _G.Noclip and LocalPlayer.Character then
            pcall(function()
                for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = false end
                end
            end)
        end
    end)
end)

-- 5 & 6. SPEED & JUMP
createTextBox("Nhập Speed mới (Enter)", function(val)
    local num = tonumber(val)
    if num then pcall(function() LocalPlayer.Character.Humanoid.WalkSpeed = num end) end
end)
createTextBox("Nhập JumpPower mới (Enter)", function(val)
    local num = tonumber(val)
    if num then
        pcall(function()
            LocalPlayer.Character.Humanoid.UseJumpPower = true
            LocalPlayer.Character.Humanoid.JumpPower = num
        end)
    end
end)

-- 7. INFINITE JUMP
UserInputService.JumpRequest:Connect(function()
    pcall(function()
        if _G.InfJump and LocalPlayer.Character then
            LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
end)
createToggle("7. Infinite Jump", function(state) _G.InfJump = state end)

-- 8. BYPASS GODMODE
createToggle("8. Bypass Godmode", function(state)
    _G.BypassGod = state
    task.spawn(function()
        while _G.BypassGod do
            task.wait(0.1)
            pcall(function()
                local hum = LocalPlayer.Character.Humanoid
                hum.Health = hum.MaxHealth
            end)
        end
    end)
end)

-- 9. SUPER MOD (Keybind K)
local superModBtn = Instance.new("TextButton")
superModBtn.Size = UDim2.new(1, -10, 0, 38)
superModBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
superModBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
superModBtn.Text = "9. Super Mod [OFF] (Key K)"
superModBtn.TextSize = 13
superModBtn.Font = Enum.Font.SourceSansBold
superModBtn.Parent = ScrollingFrame
local cornerBtn = Instance.new("UICorner")
cornerBtn.CornerRadius = UDim.new(0, 6)
cornerBtn.Parent = superModBtn

local superModState = false
local superModLoop = nil
local function toggleSuperMod()
    superModState = not superModState
    _G.SuperMod = superModState
    if superModState then
        superModBtn.Text = "9. Super Mod [ON] (Key K)"
        superModBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    else
        superModBtn.Text = "9. Super Mod [OFF] (Key K)"
        superModBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    end
    pcall(function()
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if superModState then
            if hrp and not hrp:FindFirstChild("SuperModLightning") then
                local effect = Instance.new("ParticleEmitter")
                effect.Name = "SuperModLightning"
                effect.Texture = "rbxassetid://1084991219"
                effect.Color = ColorSequence.new(Color3.fromRGB(0, 200, 255))
                effect.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 2), NumberSequenceKeypoint.new(1, 0)})
                effect.Rate = 45
                effect.Speed = NumberRange.new(5, 12)
                effect.Lifetime = NumberRange.new(0.2, 0.4)
                effect.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1)})
                effect.Parent = hrp
            end
            if superModLoop then superModLoop:Disconnect() end
            superModLoop = RunService.RenderStepped:Connect(function()
                pcall(function()
                    local currentCharacter = LocalPlayer.Character
                    local hum = currentCharacter and currentCharacter:FindFirstChildOfClass("Humanoid")
                    local currentHrp = currentCharacter and currentCharacter:FindFirstChild("HumanoidRootPart")
                    if hum and currentHrp and hum.MoveDirection.Magnitude > 0 then
                        currentHrp.CFrame = currentHrp.CFrame + (hum.MoveDirection * ((_G.SuperSpeed or 90) * 0.016))
                    end
                end)
            end)
        else
            if hrp and hrp:FindFirstChild("SuperModLightning") then
                hrp.SuperModLightning:Destroy()
            end
            if superModLoop then
                superModLoop:Disconnect()
                superModLoop = nil
            end
        end
    end)
end
superModBtn.MouseButton1Click:Connect(toggleSuperMod)
UserInputService.InputBegan:Connect(function(input, gp)
    if not gp and input.KeyCode == Enum.KeyCode.K then toggleSuperMod() end
end)

createTextBox("Nhập Super Speed (mặc định 90)", function(val)
    local num = tonumber(val)
    if num and num > 0 then _G.SuperSpeed = num end
end)

-- 10. DASH MODE
_G.DashStuds = 30
createToggle("10. Dash Mode (Press E + Lightning)", function(state) _G.DashMode = state end)
createTextBox("Cài đặt khoảng cách Dash (Studs) [Mặc định: 30]", function(val)
    local num = tonumber(val)
    if num and num > 0 then _G.DashStuds = num end
end)

UserInputService.InputBegan:Connect(function(input, gp)
    if not gp and _G.DashMode and input.KeyCode == Enum.KeyCode.E then
        pcall(function()
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.CFrame = hrp.CFrame + (hrp.CFrame.LookVector * _G.DashStuds)
                local flash = Instance.new("ParticleEmitter")
                flash.Texture = "rbxassetid://1084991219"
                flash.Color = ColorSequence.new(Color3.fromRGB(255, 255, 0))
                flash.Size = NumberSequence.new(3)
                flash.Rate = 100
                flash.Lifetime = NumberRange.new(0.1, 0.2)
                flash.Parent = hrp
                task.delay(0.2, function() pcall(function() flash:Destroy() end) end)
            end
        end)
    end
end)

-- 11. ADVANCED ESP
createToggle("11. Advanced Name & Highlight ESP", function(state)
    _G.AdvESP = state
    task.spawn(function()
        while _G.AdvESP do
            task.wait(1)
            pcall(function()
                for _, p in ipairs(Players:GetPlayers()) do
                    if p ~= LocalPlayer and p.Character then
                        if not p.Character:FindFirstChild("MegaHighlight") then
                            local hl = Instance.new("Highlight", p.Character)
                            hl.Name = "MegaHighlight"
                            hl.FillColor = Color3.fromRGB(0, 255, 255)
                        end
                    end
                end
            end)
        end
    end)
end)

-- 12. UNLOCK CAM MAX ZOOM
createToggle("12. Unlock Cam Max Zoom", function(state)
    _G.UnlockCam = state
    task.spawn(function()
        while _G.UnlockCam do
            task.wait(0.5)
            pcall(function() LocalPlayer.CameraMaxZoomDistance = 999999 end)
        end
    end)
end)

-- 13. AUTO WALLHOP
createToggle("13. Auto Wallhop", function(state)
    _G.AutoWallhop = state
    task.spawn(function()
        while _G.AutoWallhop do
            task.wait(0.05)
            pcall(function()
                local char = LocalPlayer.Character
                if not char then return end
                local hrp = char:FindFirstChild("HumanoidRootPart")
                local hum = char:FindFirstChildOfClass("Humanoid")
                if not hrp or not hum then return end
                if hum:GetState() == Enum.HumanoidStateType.FreeFall then
                    local raycastParams = RaycastParams.new()
                    raycastParams.FilterDescendantsInstances = {char}
                    raycastParams.FilterType = Enum.RaycastFilterType.Exclude
                    local rayResult = Workspace:Raycast(hrp.Position, hrp.CFrame.LookVector * 3, raycastParams)
                    if rayResult and rayResult.Instance and rayResult.Instance.CanCollide then
                        hrp.Velocity = Vector3.new(hrp.Velocity.X, 55, hrp.Velocity.Z)
                        hum:ChangeState(Enum.HumanoidStateType.Jumping)
                    end
                end
            end)
        end
    end)
end)

-- 14. ESP NAME & DISTANCE
createToggle("ESP Name & Distance (Workspace)", function(state)
    _G.ESPNameDist = state
    task.spawn(function()
        while _G.ESPNameDist do
            task.wait(0.5)
            pcall(function()
                for _, obj in ipairs(Workspace:GetDescendants()) do
                    if obj:IsA("Model") and obj ~= LocalPlayer.Character then
                        local hum = obj:FindFirstChildOfClass("Humanoid")
                        if hum and hum.Health > 0 then
                            local head = obj:FindFirstChild("Head")
                            if head then
                                local tag = head:FindFirstChild("ESPNameDist")
                                if not tag then
                                    tag = Instance.new("BillboardGui")
                                    tag.Name = "ESPNameDist"
                                    tag.Size = UDim2.new(0, 120, 0, 30)
                                    tag.AlwaysOnTop = true
                                    tag.Adornee = head
                                    tag.Parent = head
                                    local txt = Instance.new("TextLabel")
                                    txt.Size = UDim2.new(1, 0, 1, 0)
                                    txt.BackgroundTransparency = 1
                                    txt.TextColor3 = Color3.fromRGB(255, 255, 0)
                                    txt.TextSize = 11
                                    txt.Font = Enum.Font.SourceSansBold
                                    txt.Parent = tag
                                end
                                local hrp = obj:FindFirstChild("HumanoidRootPart")
                                local dist = 0
                                if hrp and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                    dist = (hrp.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                                end
                                tag.TextLabel.Text = obj.Name .. " | " .. string.format("%.1f", dist) .. "s"
                            end
                        end
                    end
                end
            end)
        end
    end)
end)

-- 15. FLY UP
createButton("Fly Up 1000", function()
    pcall(function()
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame + Vector3.new(0, 1000, 0)
        end
    end)
end)
createToggle("Auto Fly Up", function(state)
    _G.AutoFlyUp = state
    task.spawn(function()
        while _G.AutoFlyUp do
            task.wait(0.05)
            pcall(function()
                local char = LocalPlayer.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame + Vector3.new(0, 10, 0)
                end
            end)
        end
    end)
end)

-- 16. ĐỔI RIG & CHOOSE CHARACTER
createButton("📌 Đổi Rig sang R6", function()
    pcall(function()
        local desc = Players:GetHumanoidDescriptionFromUserId(LocalPlayer.UserId)
        desc.Head = 0
        local char = LocalPlayer.Character
        if char and char:FindFirstChildOfClass("Humanoid") then
            char:FindFirstChildOfClass("Humanoid"):ApplyDescriptionReset()
        end
    end)
end)
createButton("📌 Đổi Rig sang R15", function()
    pcall(function()
        local char = LocalPlayer.Character
        if char then
            LocalPlayer.CharacterAppearanceLoaded:Wait()
            char:BreakJoints()
        end
    end)
end)
createTextBox("Chọn Character theo tên Player (Nhập tên + Enter)", function(targetName)
    pcall(function()
        for _, p in ipairs(Players:GetPlayers()) do
            if string.find(string.lower(p.Name), string.lower(targetName)) or string.find(string.lower(p.DisplayName), string.lower(targetName)) then
                if p.Character and p.Character:FindFirstChildOfClass("Humanoid") then
                    local targetHum = p.Character:FindFirstChildOfClass("Humanoid")
                    local success, desc = pcall(function()
                        return targetHum:GetAppliedDescription()
                    end)
                    if success and desc then
                        local myHum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                        if myHum then
                            myHum:ApplyDescription(desc)
                        end
                    end
                end
            end
        end
    end)
end)

-- 17. TELEPORT TOOL
createButton("📌 Nhận Teleport Tool (Bấm vào đất để dịch chuyển)", function()
    pcall(function()
        for _, t in ipairs(LocalPlayer.Backpack:GetChildren()) do
            if t.Name == "TeleportTool" then t:Destroy() end
        end
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("TeleportTool") then
            LocalPlayer.Character.TeleportTool:Destroy()
        end
        local tool = Instance.new("Tool")
        tool.Name = "TeleportTool"
        tool.RequiresHandle = false
        tool.Parent = LocalPlayer.Backpack
        tool.Activated:Connect(function()
            pcall(function()
                local mouse = LocalPlayer:GetMouse()
                local char = LocalPlayer.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if hrp and mouse.Hit then
                    hrp.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, 3, 0))
                end
            end)
        end)
    end)
end)

-- 18. SUPER MAN MOD
local superManActive = false
local function toggleSuperMan()
    superManActive = not superManActive
    pcall(function()
        local char = LocalPlayer.Character
        if not char then return end
        local head = char:FindFirstChild("Head")
        if superManActive then
            local laserTool = Instance.new("Tool")
            laserTool.Name = "SuperMan Laser"
            laserTool.RequiresHandle = false
            laserTool.Parent = LocalPlayer.Backpack
            laserTool.Activated:Connect(function()
                pcall(function()
                    if head then
                        local beamPart = Instance.new("Part")
                        beamPart.Size = Vector3.new(0.6, 0.6, 60)
                        beamPart.CFrame = CFrame.new(head.Position, head.Position + (Camera.CFrame.LookVector * 60))
                        beamPart.Color = Color3.fromRGB(255, 0, 0)
                        beamPart.Material = Enum.Material.Neon
                        beamPart.Anchored = true
                        beamPart.CanCollide = false
                        beamPart.Parent = Workspace
                        task.delay(0.1, function() pcall(function() beamPart:Destroy() end) end)
                    end
                    local mouse = LocalPlayer:GetMouse()
                    if mouse.Target then
                        local enemyChar = mouse.Target.Parent
                        local enemyHum = enemyChar:FindFirstChildOfClass("Humanoid")
                        if enemyHum and enemyChar ~= char then
                            enemyHum.Health = math.max(0, enemyHum.Health - 40)
                        end
                    end
                end)
            end)
            local punchTool = Instance.new("Tool")
            punchTool.Name = "SuperMan Punch"
            punchTool.RequiresHandle = false
            punchTool.Parent = LocalPlayer.Backpack
            punchTool.Activated:Connect(function()
                pcall(function()
                    local mouse = LocalPlayer:GetMouse()
                    if mouse and mouse.Target then
                        local enemyChar = mouse.Target.Parent
                        local enemyHum = enemyChar:FindFirstChildOfClass("Humanoid")
                        local enemyHrp = enemyChar:FindFirstChild("HumanoidRootPart")
                        if enemyHum and enemyHrp and enemyChar ~= char then
                            enemyHum.Health = math.max(0, enemyHum.Health - 70)
                            enemyHrp.Velocity = enemyHrp.Velocity + (Camera.CFrame.LookVector * 50) + Vector3.new(0, 30, 0)
                        end
                    end
                end)
            end)
        else
            for _, t in ipairs(LocalPlayer.Backpack:GetChildren()) do
                if t.Name == "SuperMan Laser" or t.Name == "SuperMan Punch" then
                    pcall(function() t:Destroy() end)
                end
            end
        end
    end)
end
UserInputService.InputBegan:Connect(function(input, gp)
    if not gp and input.KeyCode == Enum.KeyCode.G then toggleSuperMan() end
end)
createButton("Kích hoạt Super Man (Phím G)", toggleSuperMan)

-- 19. KIẾM VÔ HỆN
createButton("⚔️ Nhận Kiếm Vô Hẹn (Fixed + Normal Attack + Grab B)", function()
    pcall(function()
        local backpack = LocalPlayer.Backpack
        local tool = Instance.new("Tool")
        tool.Name = "KiemVoHen_Fixed"
        tool.RequiresHandle = true
        local handle = Instance.new("Part")
        handle.Name = "Handle"
        handle.Size = Vector3.new(0.6, 4, 1.2)
        handle.Color = Color3.fromRGB(0, 200, 255)
        handle.Material = Enum.Material.Neon
        handle.Parent = tool
        local equipped = false
        tool.Equipped:Connect(function() equipped = true end)
        tool.Unequipped:Connect(function() equipped = false end)
        tool.Activated:Connect(function()
            pcall(function()
                local char = LocalPlayer.Character
                if not char then return end
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if not hrp then return end
                local flyingSword = Instance.new("Part")
                flyingSword.Size = Vector3.new(0.6, 1, 4)
                flyingSword.CFrame = hrp.CFrame * CFrame.new(0, 0, -2) * CFrame.Angles(math.rad(90), 0, 0)
                flyingSword.Color = Color3.fromRGB(0, 200, 255)
                flyingSword.Material = Enum.Material.Neon
                flyingSword.Anchored = true
                flyingSword.CanCollide = false
                flyingSword.Parent = Workspace
                task.spawn(function()
                    for i = 1, 35 do
                        pcall(function()
                            flyingSword.CFrame = flyingSword.CFrame + (hrp.CFrame.LookVector * 4)
                            for _, p in ipairs(Players:GetPlayers()) do
                                if p ~= LocalPlayer and p.Character then
                                    local eHrp = p.Character:FindFirstChild("HumanoidRootPart")
                                    local eHum = p.Character:FindFirstChildOfClass("Humanoid")
                                    if eHrp and eHum and (flyingSword.Position - eHrp.Position).Magnitude < 6 then
                                        eHum:TakeDamage(35)
                                        flyingSword:Destroy()
                                        return
                                    end
                                end
                            end
                        end)
                        task.wait(0.03)
                    end
                    pcall(function() flyingSword:Destroy() end)
                end)
            end)
        end)
        UserInputService.InputBegan:Connect(function(input, gp)
            if not gp and equipped then
                pcall(function()
                    local char = LocalPlayer.Character
                    if not char then return end
                    local hrp = char:FindFirstChild("HumanoidRootPart")
                    if not hrp then return end
                    if input.KeyCode == Enum.KeyCode.Z then
                        local wave = Instance.new("Part")
                        wave.Size = Vector3.new(5, 1, 5)
                        wave.CFrame = hrp.CFrame * CFrame.new(0, 0, -3)
                        wave.Color = Color3.fromRGB(0, 255, 255)
                        wave.Material = Enum.Material.Neon
                        wave.Anchored = true
                        wave.CanCollide = false
                        wave.Parent = Workspace
                        task.spawn(function()
                            for i = 1, 20 do
                                pcall(function()
                                    wave.CFrame = wave.CFrame + (hrp.CFrame.LookVector * 3)
                                    for _, p in ipairs(Players:GetPlayers()) do
                                        if p ~= LocalPlayer and p.Character then
                                            local eHrp = p.Character:FindFirstChild("HumanoidRootPart")
                                            local eHum = p.Character:FindFirstChildOfClass("Humanoid")
                                            if eHrp and eHum and (wave.Position - eHrp.Position).Magnitude < 7 then
                                                eHum:TakeDamage(50)
                                                eHrp.Velocity = hrp.CFrame.LookVector * 50 + Vector3.new(0, 25, 0)
                                            end
                                        end
                                    end
                                end)
                                task.wait(0.02)
                            end
                            pcall(function() wave:Destroy() end)
                        end)
                    elseif input.KeyCode == Enum.KeyCode.X then
                        local explosionPart = Instance.new("Part")
                        explosionPart.Shape = Enum.PartType.Ball
                        explosionPart.Size = Vector3.new(4, 4, 4)
                        explosionPart.Position = hrp.Position
                        explosionPart.Color = Color3.fromRGB(0, 150, 255)
                        explosionPart.Material = Enum.Material.Neon
                        explosionPart.Anchored = true
                        explosionPart.CanCollide = false
                        explosionPart.Parent = Workspace
                        task.spawn(function()
                            for i = 1, 15 do
                                pcall(function()
                                    explosionPart.Size = explosionPart.Size + Vector3.new(2, 2, 2)
                                end)
                                task.wait(0.03)
                            end
                            pcall(function()
                                for _, p in ipairs(Players:GetPlayers()) do
                                    if p ~= LocalPlayer and p.Character then
                                        local eHrp = p.Character:FindFirstChild("HumanoidRootPart")
                                        local eHum = p.Character:FindFirstChildOfClass("Humanoid")
                                        if eHrp and eHum and (explosionPart.Position - eHrp.Position).Magnitude < 20 then
                                            eHum:TakeDamage(75)
                                            eHrp.Velocity = (eHrp.Position - hrp.Position).Unit * 60 + Vector3.new(0, 35, 0)
                                        end
                                    end
                                end
                                explosionPart:Destroy()
                            end)
                        end)
                    elseif input.KeyCode == Enum.KeyCode.B then
                        pcall(function()
                            for _, p in ipairs(Players:GetPlayers()) do
                                if p ~= LocalPlayer and p.Character then
                                    local eHrp = p.Character:FindFirstChild("HumanoidRootPart")
                                    if eHrp and (hrp.Position - eHrp.Position).Magnitude <= 30 then
                                        eHrp.CFrame = hrp.CFrame * CFrame.new(0, 0, -5)
                                        eHrp.Velocity = Vector3.new(0, 0, 0)
                                    end
                                end
                            end
                        end)
                    end
                end)
            end
        end)
        tool.Parent = backpack
    end)
end)

-- 20. GUN (Z, X, F + Ammo 16/16) - NÂNG CẤP
createButton("🔫 Give Gun (Click bắn đạn, Z/X/F, Ammo)", function()
    pcall(function()
        -- Xóa tool cũ
        for _, t in ipairs(LocalPlayer.Backpack:GetChildren()) do
            if t.Name == "FanGun" then t:Destroy() end
        end
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("FanGun") then
            LocalPlayer.Character.FanGun:Destroy()
        end

        local tool = Instance.new("Tool")
        tool.Name = "FanGun"
        tool.RequiresHandle = true
        tool.CanBeDropped = false
        tool.GripForward = Vector3.new(0, 0, -1)
        tool.GripRight = Vector3.new(1, 0, 0)
        tool.GripUp = Vector3.new(0, 1, 0)

        -- ===== MODEL CHI TIẾT =====
        local handle = Instance.new("Part")
        handle.Name = "Handle"
        handle.Size = Vector3.new(0.6, 0.6, 1.2)
        handle.Color = Color3.fromRGB(80, 80, 80)
        handle.Material = Enum.Material.Metal
        handle.Parent = tool

        -- Thân chính (body)
        local body = Instance.new("Part")
        body.Name = "Body"
        body.Size = Vector3.new(0.8, 0.6, 1.8)
        body.Color = Color3.fromRGB(60, 60, 70)
        body.Material = Enum.Material.Metal
        body.Parent = tool

        -- Nòng (barrel)
        local barrel = Instance.new("Part")
        barrel.Name = "Barrel"
        barrel.Size = Vector3.new(0.3, 0.3, 2.5)
        barrel.Color = Color3.fromRGB(20, 20, 25)
        barrel.Material = Enum.Material.Metal
        barrel.Parent = tool

        -- Ống ngắm (sight)
        local sight = Instance.new("Part")
        sight.Name = "Sight"
        sight.Size = Vector3.new(0.15, 0.4, 0.15)
        sight.Color = Color3.fromRGB(255, 200, 0)
        sight.Material = Enum.Material.Neon
        sight.Parent = tool

        -- Cò (trigger)
        local trigger = Instance.new("Part")
        trigger.Name = "Trigger"
        trigger.Size = Vector3.new(0.1, 0.3, 0.1)
        trigger.Color = Color3.fromRGB(150, 0, 0)
        trigger.Material = Enum.Material.Neon
        trigger.Parent = tool

        -- Báng (stock) - không cần nếu súng ngắn, nhưng thêm cho đẹp
        local stock = Instance.new("Part")
        stock.Name = "Stock"
        stock.Size = Vector3.new(0.4, 0.2, 0.6)
        stock.Color = Color3.fromRGB(139, 69, 19)
        stock.Material = Enum.Material.Wood
        stock.Parent = tool

        -- Đế lắp đạn (magazine)
        local mag = Instance.new("Part")
        mag.Name = "Magazine"
        mag.Size = Vector3.new(0.5, 0.4, 0.4)
        mag.Color = Color3.fromRGB(40, 40, 45)
        mag.Material = Enum.Material.Metal
        mag.Parent = tool

        -- Định vị các part so với handle (handle là gốc)
        -- Vị trí handle: (0,0,0)
        body.CFrame = CFrame.new(0, 0, 0.2)
        barrel.CFrame = CFrame.new(0, 0, 1.5)
        sight.CFrame = CFrame.new(0, 0.45, 0.5)
        trigger.CFrame = CFrame.new(0, -0.5, -0.3)
        stock.CFrame = CFrame.new(0, 0, -0.9)
        mag.CFrame = CFrame.new(0, -0.5, 0.2)

        -- Tạo welds để gắn các part vào handle
        local function weld(part, offset)
            local w = Instance.new("Weld")
            w.Part0 = handle
            w.Part1 = part
            w.C0 = offset
            w.Parent = part
        end

        weld(body, body.CFrame)
        weld(barrel, barrel.CFrame)
        weld(sight, sight.CFrame)
        weld(trigger, trigger.CFrame)
        weld(stock, stock.CFrame)
        weld(mag, mag.CFrame)

        -- ===== HỆ THỐNG ĐẠN =====
        local maxAmmo = 16
        local currentAmmo = maxAmmo
        local ammoGUI = nil
        local isReloading = false

        local function updateAmmoGUI()
            if ammoGUI and ammoGUI.Parent then
                local txt = ammoGUI:FindFirstChild("AmmoText")
                if txt then txt.Text = currentAmmo .. "/" .. maxAmmo end
            end
        end

        local function createAmmoGUI()
            if ammoGUI then ammoGUI:Destroy() end
            ammoGUI = Instance.new("BillboardGui")
            ammoGUI.Name = "AmmoDisplay"
            ammoGUI.Size = UDim2.new(0, 100, 0, 30)
            ammoGUI.Adornee = LocalPlayer.Character:FindFirstChild("Head")
            ammoGUI.StudsOffset = Vector3.new(0, 2.5, 0)
            ammoGUI.AlwaysOnTop = true
            ammoGUI.Parent = LocalPlayer.Character.Head

            local frame = Instance.new("Frame")
            frame.Size = UDim2.new(1, 0, 1, 0)
            frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            frame.BackgroundTransparency = 0.5
            frame.Parent = ammoGUI
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 6)
            corner.Parent = frame

            local txt = Instance.new("TextLabel")
            txt.Name = "AmmoText"
            txt.Size = UDim2.new(1, 0, 1, 0)
            txt.BackgroundTransparency = 1
            txt.TextColor3 = Color3.fromRGB(255, 255, 0)
            txt.Text = currentAmmo .. "/" .. maxAmmo
            txt.TextSize = 18
            txt.Font = Enum.Font.SourceSansBold
            txt.Parent = frame
            updateAmmoGUI()
        end

        local function reloadAmmo()
            if isReloading or currentAmmo == maxAmmo then return end
            isReloading = true
            if ammoGUI then
                local txt = ammoGUI:FindFirstChild("AmmoText")
                if txt then txt.Text = "RELOADING..." end
            end
            task.wait(2)
            currentAmmo = maxAmmo
            isReloading = false
            updateAmmoGUI()
        end

        local function useAmmo()
            if currentAmmo <= 0 then
                task.spawn(reloadAmmo)
                return false
            end
            currentAmmo = currentAmmo - 1
            updateAmmoGUI()
            if currentAmmo == 0 then
                task.spawn(reloadAmmo)
            end
            return true
        end

        -- ===== HÀM BẮN ĐẠN THƯỜNG (DÙNG CHO CLICK) =====
        local function shootBullet()
            if not useAmmo() then return end
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            local dir = hrp.CFrame.LookVector
            local bullet = Instance.new("Part")
            bullet.Shape = Enum.PartType.Ball
            bullet.Size = Vector3.new(0.4, 0.4, 0.4)
            -- Lấy vị trí nòng súng (barrel) để bắn ra từ đó
            local barrelPos = hrp.CFrame * CFrame.new(0, 0, -2)
            bullet.CFrame = CFrame.new(barrelPos.Position + dir * 1.5)
            bullet.Color = Color3.fromRGB(255, 255, 0)
            bullet.Material = Enum.Material.Neon
            bullet.Anchored = true
            bullet.CanCollide = false
            bullet.Parent = Workspace

            -- Thêm hiệu ứng tia sáng
            local flash = Instance.new("ParticleEmitter")
            flash.Texture = "rbxassetid://1084991219"
            flash.Color = ColorSequence.new(Color3.fromRGB(255, 255, 200))
            flash.Size = NumberSequence.new(0.5)
            flash.Rate = 30
            flash.Lifetime = NumberRange.new(0.1)
            flash.Parent = bullet
            task.delay(0.1, function() pcall(function() flash:Destroy() end) end)

            task.spawn(function()
                for step = 1, 25 do
                    pcall(function()
                        bullet.CFrame = bullet.CFrame + (dir * 4)
                        for _, p in ipairs(Players:GetPlayers()) do
                            if p ~= LocalPlayer and p.Character then
                                local eHrp = p.Character:FindFirstChild("HumanoidRootPart")
                                local eHum = p.Character:FindFirstChildOfClass("Humanoid")
                                if eHrp and eHum and (bullet.Position - eHrp.Position).Magnitude < 3 then
                                    eHum:TakeDamage(25)
                                    bullet:Destroy()
                                    return
                                end
                            end
                        end
                    end)
                    task.wait(0.02)
                end
                pcall(function() bullet:Destroy() end)
            end)
        end

        -- ===== SKILL Z: BẮN 8 VIÊN XUNG QUANH =====
        local function skillZ()
            if not useAmmo() then return end
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            for i = 1, 8 do
                local angle = (i / 8) * 2 * math.pi
                local dir = Vector3.new(math.cos(angle), 0, math.sin(angle))
                local bullet = Instance.new("Part")
                bullet.Size = Vector3.new(0.4, 0.4, 1)
                bullet.CFrame = hrp.CFrame * CFrame.new(dir * 2) * CFrame.Angles(0, -angle, 0)
                bullet.Color = Color3.fromRGB(255, 0, 0)
                bullet.Material = Enum.Material.Neon
                bullet.Anchored = true
                bullet.CanCollide = false
                bullet.Parent = Workspace
                task.spawn(function()
                    for step = 1, 20 do
                        pcall(function()
                            bullet.CFrame = bullet.CFrame + (dir * 3)
                            for _, p in ipairs(Players:GetPlayers()) do
                                if p ~= LocalPlayer and p.Character then
                                    local eHrp = p.Character:FindFirstChild("HumanoidRootPart")
                                    local eHum = p.Character:FindFirstChildOfClass("Humanoid")
                                    if eHrp and eHum and (bullet.Position - eHrp.Position).Magnitude < 4 then
                                        eHum:TakeDamage(20)
                                        bullet:Destroy()
                                        return
                                    end
                                end
                            end
                        end)
                        task.wait(0.03)
                    end
                    pcall(function() bullet:Destroy() end)
                end)
            end
        end

        -- ===== SKILL X: QUẢ CẦU LỬA KÉO DÀI 5 GIÂY =====
        local function skillX()
            if not useAmmo() then return end
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            local dir = hrp.CFrame.LookVector
            local fireball = Instance.new("Part")
            fireball.Shape = Enum.PartType.Ball
            fireball.Size = Vector3.new(2, 2, 2)
            fireball.CFrame = hrp.CFrame * CFrame.new(0, 0, -3)
            fireball.Color = Color3.fromRGB(255, 100, 0)
            fireball.Material = Enum.Material.Neon
            fireball.Anchored = true
            fireball.CanCollide = false
            fireball.Parent = Workspace

            local fire = Instance.new("ParticleEmitter")
            fire.Texture = "rbxassetid://1084991219"
            fire.Color = ColorSequence.new(Color3.fromRGB(255, 150, 0))
            fire.Size = NumberSequence.new(2)
            fire.Rate = 80
            fire.Lifetime = NumberRange.new(0.3)
            fire.Parent = fireball

            local startTime = tick()
            task.spawn(function()
                while tick() - startTime < 5 and fireball.Parent do
                    pcall(function()
                        fireball.CFrame = fireball.CFrame + (dir * 2)
                        for _, p in ipairs(Players:GetPlayers()) do
                            if p ~= LocalPlayer and p.Character then
                                local eHrp = p.Character:FindFirstChild("HumanoidRootPart")
                                local eHum = p.Character:FindFirstChildOfClass("Humanoid")
                                if eHrp and eHum and (fireball.Position - eHrp.Position).Magnitude < 4 then
                                    eHum:TakeDamage(10)
                                end
                            end
                        end
                    end)
                    task.wait(0.1)
                end
                pcall(function() fireball:Destroy() end)
            end)
        end

        -- ===== SKILL F: ĐẠN NỔ =====
        local function skillF()
            if not useAmmo() then return end
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            local explosion = Instance.new("Part")
            explosion.Shape = Enum.PartType.Ball
            explosion.Size = Vector3.new(1, 1, 1)
            explosion.Position = hrp.Position + hrp.CFrame.LookVector * 5
            explosion.Color = Color3.fromRGB(255, 255, 0)
            explosion.Material = Enum.Material.Neon
            explosion.Anchored = true
            explosion.CanCollide = false
            explosion.Parent = Workspace
            task.spawn(function()
                for i = 1, 15 do
                    pcall(function()
                        explosion.Size = explosion.Size + Vector3.new(1, 1, 1)
                        for _, p in ipairs(Players:GetPlayers()) do
                            if p ~= LocalPlayer and p.Character then
                                local eHrp = p.Character:FindFirstChild("HumanoidRootPart")
                                local eHum = p.Character:FindFirstChildOfClass("Humanoid")
                                if eHrp and eHum and (explosion.Position - eHrp.Position).Magnitude < explosion.Size.X * 1.5 then
                                    eHum:TakeDamage(30)
                                end
                            end
                        end
                    end)
                    task.wait(0.05)
                end
                pcall(function() explosion:Destroy() end)
            end)
        end

        -- ===== EQUIP / UNEQUIP =====
        local equipped = false
        tool.Equipped:Connect(function()
            equipped = true
            createAmmoGUI()
        end)
        tool.Unequipped:Connect(function()
            equipped = false
            if ammoGUI then ammoGUI:Destroy() ammoGUI = nil end
        end)

        -- ===== KEYBINDS =====
        UserInputService.InputBegan:Connect(function(input, gp)
            if not gp and equipped then
                if input.KeyCode == Enum.KeyCode.Z then
                    task.spawn(skillZ)
                elseif input.KeyCode == Enum.KeyCode.X then
                    task.spawn(skillX)
                elseif input.KeyCode == Enum.KeyCode.F then
                    task.spawn(skillF)
                elseif input.KeyCode == Enum.KeyCode.R then
                    task.spawn(reloadAmmo)
                end
            end
        end)

        -- ===== CLICK BẮN ĐẠN =====
        tool.Activated:Connect(function()
            task.spawn(shootBullet)
        end)

        tool.Parent = LocalPlayer.Backpack
        LocalPlayer.Character.Humanoid:EquipTool(tool)
    end)
end)
