local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

local Window = Rayfield:CreateWindow({
   Name = "Evade | Blue Pro Hub",
   LoadingTitle = "Đang khởi tạo Blue Hub...",
   LoadingSubtitle = "Hỗ trợ Key System, Auto Farm & Blue Theme",
   ConfigurationSaving = { 
      Enabled = true, 
      FolderName = "EvadeBlueHub", 
      FileName = "EvadeBlueConfig" 
   },
   Discord = {
      Enabled = false,
      Invite = "noinvite",
      RememberJoins = true
   },
   KeySystem = true,
   KeySettings = {
      Title = "Evade Blue Hub | Xác Thực Key",
      Subtitle = "Hệ thống bảo mật chính thức",
      Note = "Nhập key 'evade' để mở khóa menu",
      FileName = "EvadeBlueKey",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"evade"}
   }
})

local FarmTab = Window:CreateTab("Auto Farm & TP", 4483362458)

_G.AutoFarmCorner = false
_G.AutoFarmBongBong = false
_G.DashSpeed = 100

FarmTab:CreateSection("Hệ Thống Né Nextbot (TP 4 Góc & Tạo Part)")

FarmTab:CreateToggle({
   Name = "Auto Farm TP 4 Góc Mập + Tạo Part Trú Ẩn (Cao 199 Stud)",
   CurrentValue = false,
   Callback = function(Value)
      _G.AutoFarmCorner = Value
      
      task.spawn(function()
         local safeParts = {}
         if Value then
            pcall(function()
               local corners = {
                  Vector3.new(300, 199, 300),
                  Vector3.new(-300, 199, 300),
                  Vector3.new(300, 199, -300),
                  Vector3.new(-300, 199, -300)
               }
               for i, pos in ipairs(corners) do
                  local part = Instance.new("Part")
                  part.Size = Vector3.new(15, 2, 15)
                  part.Position = pos
                  part.Anchored = true
                  part.Transparency = 0.4
                  part.BrickColor = BrickColor.new("Deep blue")
                  part.Material = Enum.Material.Neon
                  part.Name = "EvadeSafeCorner_" .. i
                  part.Parent = Workspace
                  table.insert(safeParts, part)
               end
            end)
         else
            pcall(function()
               for _, obj in pairs(Workspace:GetChildren()) do
                  if obj.Name:find("EvadeSafeCorner_") then
                     obj:Destroy()
                  end
               end
            end)
         end

         local index = 1
         local cornerPositions = {
            Vector3.new(300, 199, 300),
            Vector3.new(-300, 199, 300),
            Vector3.new(300, 199, -300),
            Vector3.new(-300, 199, -300)
         }

         while _G.AutoFarmCorner do
            pcall(function()
               local char = LocalPlayer.Character
               if char and char:FindFirstChild("HumanoidRootPart") then
                  local hrp = char.HumanoidRootPart
                  hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                  hrp.CFrame = CFrame.new(cornerPositions[index] + Vector3.new(0, 3, 0))
                  
                  index = index + 1
                  if index > #cornerPositions then
                     index = 1
                  end
               end
            end)
            task.wait(2.5)
         end
      end)
   end,
})

FarmTab:CreateSection("Auto Farm Bong Bóng (Balloons)")

FarmTab:CreateToggle({
   Name = "Auto Farm Bong Bóng (Tự Động Thu Thập)",
   CurrentValue = false,
   Callback = function(Value)
      _G.AutoFarmBongBong = Value
      task.spawn(function()
         while _G.AutoFarmBongBong do
            pcall(function()
               local char = LocalPlayer.Character
               if char and char:FindFirstChild("HumanoidRootPart") then
                  local hrp = char.HumanoidRootPart
                  for _, obj in pairs(Workspace:GetDescendants()) do
                     local name = obj.Name:lower()
                     if name:find("balloon") or name:find("bongbong") or name:find("bubble") then
                        local targetPart = obj:IsA("Model") and (obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")) or (obj:IsA("BasePart") and obj)
                        if targetPart and (targetPart.Position - hrp.Position).Magnitude <= 1500 then
                           hrp.CFrame = targetPart.CFrame + Vector3.new(0, 2, 0)
                           task.wait(0.3)
                        end
                     end
                  end
               end
            end)
            task.wait(1)
         end
      end)
   end,
})

local MovementTab = Window:CreateTab("Dash & Speed", 4483362458)

MovementTab:CreateSection("Cài Đặt Tốc Độ Dash")

MovementTab:CreateSlider({
   Name = "Mức Tốc Độ Dash (Dash Speed Value)",
   Range = {50, 300},
   Increment = 5,
   CurrentValue = 100,
   Callback = function(Value)
      _G.DashSpeed = Value
   end,
})

MovementTab:CreateParagraph({Title = "Hướng dẫn phím tắt Dash", Content = "Nhấn phím [Ctrl] HOẶC phím [C] trên bàn phím để kích hoạt gia tốc Dash ngay lập tức."})

-- Lắng nghe sự kiện: chỉ cần bấm phím Ctrl HOẶC phím C là kích hoạt
UserInputService.InputBegan:Connect(function(input, gameProcessed)
   if gameProcessed then return end
   
   if input.KeyCode == Enum.KeyCode.LeftControl or input.KeyCode == Enum.KeyCode.RightControl or input.KeyCode == Enum.KeyCode.C then
      pcall(function()
         local char = LocalPlayer.Character
         if char and char:FindFirstChild("HumanoidRootPart") then
            local hrp = char.HumanoidRootPart
            hrp.AssemblyLinearVelocity = hrp.CFrame.LookVector * _G.DashSpeed + Vector3.new(0, 50, 0)
            Rayfield:Notify({
               Title = "Blue Dash Activated!",
               Content = "Đã kích hoạt Dash Speed: " .. tostring(_G.DashSpeed),
               Duration = 1.2,
               Image = 4483362458,
            })
         end
      end)
   end
end)

Rayfield:LoadConfiguration()
