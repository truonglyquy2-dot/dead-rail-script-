local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

-- Xóa menu cũ nếu đang chạy để tránh trùng lặp
if CoreGui:FindFirstChild("FanHubMain") then
    CoreGui.FanHubMain:Destroy()
end
if CoreGui:FindFirstChild("FanHubMinisize") then
    CoreGui.FanHubMinisize:Destroy()
end

-- Dọn dẹp rác cũ
pcall(function()
    for _, obj in ipairs(Workspace:GetChildren()) do
        if obj:IsA("Part") and obj.Size == Vector3.new(4, 1, 2) and obj.Anchored == false then
            obj:Destroy()
        end
    end
end)

-- GIAO DIỆN CHÍNH
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FanHubMain"
ScreenGui.Parent = CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 480, 0, 500)
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

-- Phím ẩn/hiện menu là Insert
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
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 3500)
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
                bodyVelocity.velocity = moveDir * 50
                bodyGyro.cframe = cam
            end
        else
            if hrp:FindFirstChildOfClass("BodyGyro") then hrp:FindFirstChildOfClass("BodyGyro"):Destroy() end
            if hrp:FindFirstChildOfClass("BodyVelocity") then hrp:FindFirstChildOfClass("BodyVelocity"):Destroy() end
        end
    end)
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

-- 5 & 6. SPEED & JUMP INPUTS
createTextBox("Nhập Speed mới (Enter)", function(val)
    local num = tonumber(val)
    if num then
        pcall(function() LocalPlayer.Character.Humanoid.WalkSpeed = num end)
    end
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

-- 9. SUPER MOD
local lightningEffect = nil
createToggle("9. Super Mod (Lightning + Skills Z & F)", function(state)
    _G.SuperMod = state
    pcall(function()
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")

        if state then
            if hrp and not hrp:FindFirstChild("SuperModLightning") then
                lightningEffect = Instance.new("ParticleEmitter")
                lightningEffect.Name = "SuperModLightning"
                lightningEffect.Texture = "rbxassetid://1084991219"
                lightningEffect.Color = ColorSequence.new(Color3.fromRGB(0, 200, 255))
                lightningEffect.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 2), NumberSequenceKeypoint.new(1, 0)})
                lightningEffect.Rate = 45
                lightningEffect.Speed = NumberRange.new(5, 12)
                lightningEffect.Lifetime = NumberRange.new(0.2, 0.4)
                lightningEffect.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1)})
                lightningEffect.Parent = hrp
            end

            task.spawn(function()
                while _G.SuperMod do
                    RunService.RenderStepped:Wait()
                    pcall(function()
                        local currentCharacter = LocalPlayer.Character
                        local hum = currentCharacter and currentCharacter:FindFirstChildOfClass("Humanoid")
                        local currentHrp = currentCharacter and currentCharacter:FindFirstChild("HumanoidRootPart")
                        if hum and currentHrp and hum.MoveDirection.Magnitude > 0 then
                            currentHrp.CFrame = currentHrp.CFrame + (hum.MoveDirection * (90 * 0.016))
                        end
                    end)
                end
            end)
        else
            if hrp and hrp:FindFirstChild("SuperModLightning") then
                hrp.SuperModLightning:Destroy()
            end
            if lightningEffect then
                lightningEffect:Destroy()
                lightningEffect = nil
            end
        end
    end)
end)

UserInputService.InputBegan:Connect(function(input, gp)
    if not gp and _G.SuperMod then
        pcall(function()
            local char = LocalPlayer.Character
            if not char then return end
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if not hrp then return end

            if input.KeyCode == Enum.KeyCode.Z then
                local sphere = Instance.new("Part")
                sphere.Shape = Enum.PartType.Ball
                sphere.Size = Vector3.new(4, 4, 4)
                sphere.Position = hrp.Position
                sphere.Color = Color3.fromRGB(255, 100, 0)
                sphere.Material = Enum.Material.Neon
                sphere.Anchored = true
                sphere.CanCollide = false
                sphere.Parent = Workspace

                task.spawn(function()
                    for i = 1, 20 do
                        pcall(function()
                            sphere.Size = sphere.Size + Vector3.new(3, 3, 3)
                        end)
                        task.wait(0.02)
                    end
                    pcall(function()
                        for _, p in ipairs(Players:GetPlayers()) do
                            if p ~= LocalPlayer and p.Character then
                                local eHrp = p.Character:FindFirstChild("HumanoidRootPart")
                                local eHum = p.Character:FindFirstChildOfClass("Humanoid")
                                if eHrp and eHum and (sphere.Position - eHrp.Position).Magnitude < 25 then
                                    eHum:TakeDamage(80)
                                    eHrp.Velocity = (eHrp.Position - hrp.Position).Unit * 60 + Vector3.new(0, 40, 0)
                                end
                            end
                        end
                        sphere:Destroy()
                    end)
                end)

            elseif input.KeyCode == Enum.KeyCode.F then
                local laser = Instance.new("Part")
                laser.Size = Vector3.new(1, 1, 80)
                laser.CFrame = hrp.CFrame * CFrame.new(0, 0, -40)
                laser.Color = Color3.fromRGB(0, 200, 255)
                laser.Material = Enum.Material.Neon
                laser.Anchored = true
                laser.CanCollide = false
                laser.Parent = Workspace

                task.spawn(function()
                    for _, p in ipairs(Players:GetPlayers()) do
                        if p ~= LocalPlayer and p.Character then
                            local eHrp = p.Character:FindFirstChild("HumanoidRootPart")
                            local eHum = p.Character:FindFirstChildOfClass("Humanoid")
                            if eHrp and eHum and (hrp.Position - eHrp.Position).Magnitude < 50 then
                                local dot = (eHrp.Position - hrp.Position).Unit:Dot(hrp.CFrame.LookVector)
                                if dot > 0.5 then
                                    eHum:TakeDamage(60)
                                end
                            end
                        end
                    end
                    task.delay(0.2, function()
                        pcall(function() laser:Destroy() end)
                    end)
                end)
            end
        end)
    end
end)

-- 10. DASH MODE
_G.DashStuds = 30
createToggle("10. Dash Mode (Press E + Lightning)", function(state) _G.DashMode = state end)
createTextBox("Cài đặt khoảng cách Dash (Studs) [Mặc định: 30]", function(val)
    local num = tonumber(val)
    if num and num > 0 then
        _G.DashStuds = num
    end
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
            pcall(function()
                LocalPlayer.CameraMaxZoomDistance = 999999
            end)
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

-- 14. ĐỔI RIG & CHOOSE CHARACTER
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

-- 15. TELEPORT TOOL (Đã tối ưu mượt mà)
createButton("📌 Nhận Teleport Tool (Bấm vào đất để dịch chuyển)", function()
    pcall(function()
        -- Xóa tool cũ nếu có
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

-- 16. SUPER MAN MOD (Đã bỏ hoàn toàn áo choàng/cape rườm rà)
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
    if not gp and input.KeyCode == Enum.KeyCode.G then
        toggleSuperMan()
    end
end)

createButton("Kích hoạt Super Man (Phím G)", function()
    toggleSuperMan()
end)

-- 17. KIẾM VÔ HỆN
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
        tool.Equipped:Connect(function()
            equipped = true
        end)
        tool.Unequipped:Connect(function()
            equipped = false
        end)

        tool.Activated:Connect(function()
            pcall(function()
                local char = LocalPlayer.Character
                if not char then return end
                local hrp = char:FindFirstChild("HumanoidRootPart")
                local leftArm = char:FindFirstChild("Left Arm") or char:FindFirstChild("LeftHand")
                local rightArm = char:FindFirstChild("Right Arm") or char:FindFirstChild("RightHand")
                if not hrp then return end

                local hands = {leftArm, rightArm}
                for _, arm in ipairs(hands) do
                    if arm then
                        local spark = Instance.new("ParticleEmitter")
                        spark.Texture = "rbxassetid://1084991219"
                        spark.Color = ColorSequence.new(Color3.fromRGB(0, 255, 255))
                        spark.Size = NumberSequence.new(1)
                        spark.Rate = 60
                        spark.Lifetime = NumberRange.new(0.2)
                        spark.Parent = arm
                        task.delay(0.2, function() pcall(function() spark:Destroy() end) end)
                    end
                end

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
