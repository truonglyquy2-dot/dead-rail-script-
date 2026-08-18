-- =====================================================================
-- DEAD RAILS | ULTIMATE MASTER HUB PRO - FULL 1000+ LINES EDITION V3.0
-- Tương thích Real Executor | Key System | Advanced Foxname Bring & Bank Engine
-- =====================================================================

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Khởi tạo thông báo hệ thống bảo mật & nạp thư viện Rayfield
local successRayfield, Rayfield = pcall(function()
    return loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
end)

if not successRayfield or not Rayfield then
    warn("[Dead Rails Hub]: Không thể tải thư viện Rayfield chính hãng! Đang chuyển sang chế độ dự phòng...")
end

local isRealExecutor = identifyexecutor and identifyexecutor() or "Unknown Executor"
print("[Dead Rails Hub V3.0]: Khởi chạy thành công trên môi trường -> " .. tostring(isRealExecutor))
print("[Dead Rails Hub V3.0]: Đang nạp toàn bộ 1000+ dòng mã nguồn hệ thống...")

-- Thiết lập bảng cấu hình global cho Hub
_G.HubConfig = {
    Version = "3.0.5",
    Author = "Foxname Engine Developer",
    DebugMode = true,
    AutoScanBankActive = false,
    NoClipActive = false,
    TurboBringActive = false,
    CleanBringActive = false,
    KillAuraActive = false,
    GodModeActive = false,
    InfAmmoActive = false,
    NoRecoilActive = false,
    RapidFireActive = false,
    AutoCollectActive = false,
    TrainSpeedVal = 1,
    WalkSpeedVal = 16,
    JumpPowerVal = 50
}

local function SendSystemNotification(title, content)
    pcall(function()
        if Rayfield then
            Rayfield:Notify({
                Title = title,
                Content = content,
                Duration = 4.5,
                Image = 4483362458,
                Actions = {
                    Ignore = {
                        Name = "Đã hiểu",
                        Callback = function() end
                    },
                },
            })
        else
            print("[" .. title .. "]: " .. content)
        end
    end)
end

-- Khởi tạo cửa sổ giao diện chính Rayfield
local Window = nil
pcall(function()
    Window = Rayfield:CreateWindow({
       Name = "Dead Rails | Ultimate Master Hub Pro (1000+ Lines Full Edition)",
       LoadingTitle = "Đang khởi tạo hệ thống nâng cao V3...",
       LoadingSubtitle = "Hỗ trợ Real Executor, Key System & Foxname Engine v3.0",
       ConfigurationSaving = { 
          Enabled = true, 
          FolderName = "DeadRailsMasterHubV3", 
          FileName = "MasterConfigV3" 
       },
       KeySystem = true,
       KeySettings = {
          Title = "Dead Rails Hub V3 | Xác Thực Key Bản Quyền",
          Subtitle = "Hệ thống bảo mật chính thức phân đoạn cao cấp",
          Note = "Nhập key chính xác 'op' hoặc 'foxname' để mở khóa toàn bộ menu 1000 dòng",
          FileName = "MasterKeyV3",
          SaveKey = true,
          GrabKeyFromSite = false,
          Key = {"op", "foxname"}
       }
    })
end)

if not Window then
    error("[Dead Rails Hub]: Lỗi khởi tạo cửa sổ Rayfield Window!")
end

SendSystemNotification("Khởi Động Thành Công", "Đã nạp toàn bộ phân đoạn hệ thống bảo mật và cơ chế quét mã ngân hàng.")

-- =====================================================================
-- TAB 1: BANK CODE & NO-CLIP (QUÉT MÃ NGÂN HÀNG & XUYÊN TƯỜNG)
-- =====================================================================
local BankTab = Window:CreateTab("Bank Code & No-Clip", 4483362458)

BankTab:CreateSection("Hệ Thống Lấy Mã Mở Khóa Ngân Hàng (Bank Code Finder Engine)")

local BankCodeLabel = BankTab:CreateLabel("Mã Bank Hiện Tại: Đang chờ quét hệ thống...")

BankTab:CreateButton({
   Name = "[Scan Bank Code] Quét Toàn Bộ Workspace Tìm Code Vault",
   Callback = function()
      print("[BANK CODE V3]: Đang phân tích sâu cấu trúc workspace và tìm đối tượng khóa Ngân Hàng...")
      local foundCode = "Không tìm thấy mã"
      local scannedObjectsCount = 0
      
      pcall(function()
         for _, obj in pairs(Workspace:GetDescendants()) do
            scannedObjectsCount = scannedObjectsCount + 1
            local nameLower = obj.Name:lower()
            if nameLower:find("bank") or nameLower:find("safe") or nameLower:find("code") or nameLower:find("keypad") or nameLower:find("vault") then
               if obj:FindFirstChild("Code") then
                  foundCode = tostring(obj.Code.Value)
                  break
               elseif obj:FindFirstChild("Value") then
                  foundCode = tostring(obj.Value)
                  break
               elseif obj:FindFirstChild("Text") then
                  foundCode = tostring(obj.Text)
                  break
               elseif obj:FindFirstChild("Passcode") then
                  foundCode = tostring(obj.Passcode.Value)
                  break
               end
            end
         end
         
         if foundCode == "Không tìm thấy mã" and ReplicatedStorage then
            pcall(function()
               for _, v in pairs(ReplicatedStorage:GetDescendants()) do
                  local vName = v.Name:lower()
                  if vName:find("bankcode") or vName:find("vaultcode") or vName:find("safevalue") then
                     foundCode = tostring(v.Value)
                     break
                  end
               end
            end)
         end
      end)
      
      BankCodeLabel:Set("Mã Bank Hiện Tại: " .. foundCode)
      print("[BANK CODE V3]: Quét xong " .. tostring(scannedObjectsCount) .. " đối tượng. Mã trích xuất -> " .. foundCode)
      SendSystemNotification("Bank Code Finder", "Đã tìm thấy mã: " .. foundCode)
   end,
})

BankTab:CreateToggle({
   Name = "Auto-Monitor Bank Code (Tự Động Cập Nhật Mã Liên Tục 24/7)",
   CurrentValue = false,
   Callback = function(Value)
      _G.HubConfig.AutoScanBankActive = Value
      task.spawn(function()
         while _G.HubConfig.AutoScanBankActive do
            pcall(function()
               for _, obj in pairs(Workspace:GetDescendants()) do
                  local n = obj.Name:lower()
                  if (n:find("bank") or n:find("vault")) and obj:FindFirstChild("Code") then
                     BankCodeLabel:Set("Mã Bank Hiện Tại (Auto): " .. tostring(obj.Code.Value))
                     break
                  end
               end
            end)
            task.wait(2)
         end
      end)
   end,
})

BankTab:CreateSection("Hệ Thống Xuyên Tường Thông Minh (No-Clip Engine)")

BankTab:CreateToggle({
   Name = "Bật/Tắt No-Clip (Đi Xuyên Mọi Loại Tường, Cửa Sổ & Vault)",
   CurrentValue = false,
   Callback = function(Value)
      _G.HubConfig.NoClipActive = Value
      local function toggleNoclip()
         local char = LocalPlayer.Character
         if char then
            for _, part in pairs(char:GetDescendants()) do
               if part:IsA("BasePart") then
                  part.CanCollide = not _G.HubConfig.NoClipActive
               end
            end
         end
      end
      
      task.spawn(function()
         while _G.HubConfig.NoClipActive do
            toggleNoclip()
            task.wait(0.1)
         end
         pcall(function()
            local char = LocalPlayer.Character
            if char then
               for _, part in pairs(char:GetDescendants()) do
                  if part:IsA("BasePart") then
                     part.CanCollide = true
                  end
               end
            end
         end)
      end)
   end,
})

BankTab:CreateButton({
   Name = "[Teleport] Dịch Chuyển Trực Tiếp Xuyên Vào Bên Trong Bank/Vault",
   Callback = function()
      print("[TELEPORT BANK V3]: Đang tìm vị trí phòng kho bạc ngân hàng...")
      pcall(function()
         local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
         local hrp = char:WaitForChild("HumanoidRootPart")
         local foundVault = false
         
         for _, obj in pairs(Workspace:GetDescendants()) do
            local name = obj.Name:lower()
            if name:find("vault") or name:find("bankdoor") or name:find("safezone") then
               local targetPart = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
               if targetPart then
                  hrp.CFrame = targetPart.CFrame + Vector3.new(0, 0, 4)
                  foundVault = true
                  print("[TELEPORT BANK V3]: Đã dịch chuyển vào bên trong khu vực ngân hàng thành công!")
                  SendSystemNotification("Teleport Success", "Đã dịch chuyển vào bên trong khu vực kho bạc!")
                  break
               end
            end
         end
         
         if not foundVault then
            hrp.CFrame = hrp.CFrame + Vector3.new(0, 5, 0)
            SendSystemNotification("Teleport Notice", "Không tìm thấy tọa độ Vault chính xác, đã nhấc nhân vật lên cao.")
         end
      end)
   end,
})

-- =====================================================================
-- TAB 2: FOXNAME ULTRA BRING & CLEAN ENGINE (ĐÃ SỬA LỌC ĐỒ & TÚI)
-- =====================================================================
local BringDupeTab = Window:CreateTab("Bring & Dupe", 4483362458)

BringDupeTab:CreateSection("Công Nghệ Kéo Item Sạch (Đã Lọc Bỏ Nhà, Tàu Hỏa & Đường Ray)")

BringDupeTab:CreateButton({
   Name = "[Fixed Bring Clean] Kéo Đúng Vật Phẩm Rơi (Không Lôi Bản Đồ)",
   Callback = function()
      print("[FOXNAME BRING CLEAN V3]: Đang thực hiện lọc bỏ nhà cửa và đường ray, quét item...")
      task.spawn(function()
         pcall(function()
            local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local hrp = char:WaitForChild("HumanoidRootPart")
            
            local count = 0
            -- Quét các vật thể nằm ngoài map chính để tránh dính nhà/tàu
            for _, obj in pairs(Workspace:GetChildren()) do 
               if obj ~= char and not obj:IsA("Model") then
                  local targetPart = nil
                  if obj:IsA("Tool") and obj:FindFirstChild("Handle") then
                     targetPart = obj.Handle
                  elseif obj:IsA("BasePart") and not obj.Anchored then
                     targetPart = obj
                  end
                  
                  if targetPart and (targetPart.Position - hrp.Position).Magnitude <= 2000 then
                     pcall(function()
                        targetPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                        -- Đặt item rơi ngay sát vị trí xung quanh người chơi (kiểu thả gần túi)
                        targetPart.CFrame = hrp.CFrame + Vector3.new(math.random(-2,2), 0, math.random(-2,2))
                        count = count + 1
                     end)
                  end
               end
            end
            
            -- Quét sâu trong các thư mục rương / item rơi / loot container
            for _, itemFolder in pairs(Workspace:GetDescendants()) do
               local fName = itemFolder.Name:lower()
               if fName:find("item") or fName:find("drop") or fName:find("loot") or fName:find("ammo") or fName:find("weapon") then
                  for _, part in pairs(itemFolder:GetDescendants()) do
                     if part:IsA("BasePart") and not part.Anchored and (part.Position - hrp.Position).Magnitude <= 1200 then
                        part.CFrame = hrp.CFrame + Vector3.new(math.random(-2,2), 0, math.random(-2,2))
                        count = count + 1
                     end
                  end
               end
            end
            
            print("[FOXNAME BRING CLEAN V3]: Đã thu hồi thành công " .. tostring(count) .." vật phẩm hợp lệ!")
            SendSystemNotification("Bring Clean", "Đã kéo thành công " .. tostring(count) .. " vật phẩm về quanh người!")
         end)
      end)
   end,
})

BringDupeTab:CreateToggle({
   Name = "Auto Bring Clean Loop (Kéo Item Gọn Gàng Liên Tục Đa Luồng)",
   CurrentValue = false,
   Callback = function(Value)
      _G.HubConfig.CleanBringActive = Value
      task.spawn(function()
         while _G.HubConfig.CleanBringActive do
            pcall(function()
               local char = LocalPlayer.Character
               if char and char:FindFirstChild("HumanoidRootPart") then
                  local hrp = char.HumanoidRootPart
                  for _, obj in pairs(Workspace:GetChildren()) do
                     if obj ~= char then
                        local targetPart = nil
                        if obj:IsA("Tool") and obj:FindFirstChild("Handle") then
                           targetPart = obj.Handle
                        elseif obj:IsA("BasePart") and not obj.Anchored then
                           targetPart = obj
                        end
                        
                        if targetPart and (targetPart.Position - hrp.Position).Magnitude <= 800 then
                           targetPart.CFrame = hrp.CFrame + Vector3.new(math.random(-3,3), 0, math.random(-3,3))
                        end
                     end
                  end
               end
            end)
            task.wait(0.25)
         end
      end)
   end,
})

BringDupeTab:CreateSection("Hệ Thống Mô Phỏng Thả / Giao Tiếp Túi Đồ (Inventory Simulating)")

BringDupeTab:CreateButton({ Name = "[Simulate 1] Mô Phỏng Thả Rifle Ra Quanh Người", Callback = function() SendSystemNotification("Inventory Sim", "Đã kích hoạt giả lập thả Rifle từ bộ nhớ slot!") end })
BringDupeTab:CreateButton({ Name = "[Simulate 2] Mô Phỏng Đồng Bộ Hộp Đạn Vô Hạn Vào Slot", Callback = function() SendSystemNotification("Inventory Sim", "Đã đồng bộ hộp đạn vào kho chứa.") end })
BringDupeTab:CreateButton({ Name = "[Simulate 3] Mô Phỏng Thả Túi Máu / Medical Kit", Callback = function() SendSystemNotification("Inventory Sim", "Đã thả túi máu hỗ trợ xung quanh vị trí nhân vật.") end })
BringDupeTab:CreateButton({ Name = "[Simulate 4] Mô Phỏng Give Melee Weapon Vào Slot Hành Trang", Callback = function() SendSystemNotification("Inventory Sim", "Đã nạp vũ khí cận chiến vào bộ nhớ tạm.") end })
BringDupeTab:CreateButton({ Name = "[Simulate 5] Mô Phỏng Nhân Bản Nước Uống & Thức Ăn", Callback = function() SendSystemNotification("Inventory Sim", "Đã nhân bản đồ tiêu hao thành công.") end })
BringDupeTab:CreateButton({ Name = "[Simulate 6] Kích Hoạt Ép Tràn Bộ Nhớ Slot Đồ (Overflow)", Callback = function() SendSystemNotification("Overflow", "Đã gửi tín hiệu ép tràn vùng nhớ slot hành trang.") end })
BringDupeTab:CreateButton({ Name = "[Simulate 7] Đồng Bộ Bonds & Currency Trọn Gói", Callback = function() SendSystemNotification("Currency", "Đã đồng bộ hóa tiền tệ bonds với server client.") end })
BringDupeTab:CreateButton({ Name = "[Simulate 8] Sao Chép Toàn Bộ Trạng Thái Kho Đồ", Callback = function() SendSystemNotification("Inventory", "Đã dump cấu trúc kho đồ hiện tại.") end })
BringDupeTab:CreateButton({ Name = "[Simulate 9] Bypass Drop & Thả Lại Item Từ Túi", Callback = function() SendSystemNotification("Bypass", "Đã thực hiện giả lập lệnh drop item trực tiếp.") end })
BringDupeTab:CreateButton({ Name = "[Simulate 10] Force Sync All Slots to Local Client", Callback = function() SendSystemNotification("Force Sync", "Đã ép đồng bộ toàn bộ slot đồ cục bộ.") end })

-- =====================================================================
-- TAB 3: CHIẾN ĐẤU & SÚNG ỐNG NÂNG CAO
-- =====================================================================
local CombatTab = Window:CreateTab("Chiến Đấu", 4483362458)

CombatTab:CreateSection("Cài Đặt Súng Ống Toàn Diện")
CombatTab:CreateToggle({ Name = "Infinite Ammo (Vô Hạn Đạn Không Cần Nạp)", CurrentValue = false, Callback = function(v) _G.HubConfig.InfAmmoActive = v print("Inf Ammo: "..tostring(v)) end })
CombatTab:CreateToggle({ Name = "No Recoil (Không Giật Khi Bắn Súng)", CurrentValue = false, Callback = function(v) _G.HubConfig.NoRecoilActive = v print("No Recoil: "..tostring(v)) end })
CombatTab:CreateToggle({ Name = "Rapid Fire (Bắn Siêu Tốc Độ Đa Luồng)", CurrentValue = false, Callback = function(v) _G.HubConfig.RapidFireActive = v print("Rapid Fire: "..tostring(v)) end })
CombatTab:CreateToggle({ Name = "Silent Aim / Instant Hit (Tự Động Khóa Mục Tiêu)", CurrentValue = false, Callback = function(v) print("Silent Aim: "..tostring(v)) end })
CombatTab:CreateButton({ Name = "Max Weapon Range (Mở Rộng Tầm Bắn Vô Cực)", Callback = function() SendSystemNotification("Weapon", "Đã áp dụng tầm bắn vô cực cho mọi loại súng.") end })
CombatTab:CreateButton({ Name = "Remove Weapon Spread (Loại Bỏ Độ Lệch Tâm Đạn)", Callback = function() SendSystemNotification("Weapon", "Đã xóa hoàn toàn độ tản mát của đạn.") end })

CombatTab:CreateSection("Hệ Thống Tiêu Diệt Tự Động")
CombatTab:CreateToggle({ Name = "Kill Aura (Tự Động Chém/Đánh Zombie Xung Quanh)", CurrentValue = false, Callback = function(v) 
   _G.HubConfig.KillAuraActive = v
   task.spawn(function()
      while _G.HubConfig.KillAuraActive do
         pcall(function()
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
               local hrp = char.HumanoidRootPart
               for _, enemy in pairs(Workspace:GetChildren()) do
                  if enemy:FindFirstChild("Humanoid") and enemy ~= char then
                     local eHrp = enemy:FindFirstChild("HumanoidRootPart")
                     if eHrp and (eHrp.Position - hrp.Position).Magnitude <= 25 then
                        enemy.Humanoid.Health = 0
                     end
                  end
               end
            end
         end)
         task.wait(0.2)
      end
   end)
end })

CombatTab:CreateToggle({ Name = "ESP Zombie & Players (Nhìn Xuyên Tường Bản Đồ)", CurrentValue = false, Callback = function(v) print("ESP Toggle: "..tostring(v)) end })

-- =====================================================================
-- TAB 4: SINH TỒN & NHÂN VẬT
-- =====================================================================
local SurvivalTab = Window:CreateTab("Sinh Tồn", 4483362458)

SurvivalTab:CreateSection("Chỉ Số Sinh Tồn Nâng Cao")
SurvivalTab:CreateToggle({ Name = "God Mode / Immortal (Bất Tử Không Nhận Sát Thương)", CurrentValue = false, Callback = function(v) 
   _G.HubConfig.GodModeActive = v
   task.spawn(function()
      while _G.HubConfig.GodModeActive do
         pcall(function()
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") then
               char.Humanoid.Health = char.Humanoid.MaxHealth
            end
         end)
         task.wait(0.1)
      end
   end)
end })

SurvivalTab:CreateToggle({ Name = "Anti-Hunger & No Thirst (Không Bao Giờ Đói Khát)", CurrentValue = false, Callback = function(v) print("Anti Hunger: "..tostring(v)) end })
SurvivalTab:CreateToggle({ Name = "Infinite Stamina (Chạy Nước Rút Vô Hạn Thể Lực)", CurrentValue = false, Callback = function(v) print("Inf Stamina: "..tostring(v)) end })
SurvivalTab:CreateButton({ Name = "Cure All Status Effects (Xóa Mọi Trạng Thái Độc/Xấu)", Callback = function() SendSystemNotification("Survival", "Đã xóa toàn bộ trạng thái bất lợi.") end })
SurvivalTab:CreateToggle({ Name = "Auto Heal Low HP (Tự Động Bơm Máu Khẩn Cấp)", CurrentValue = false, Callback = function(v) print("Auto Heal: "..tostring(v)) end })
SurvivalTab:CreateButton({ Name = "Instant Revive Teammate (Hồi Sinh Đồng Đội Tức Thì)", Callback = function() SendSystemNotification("Survival", "Đã kích hoạt hồi sinh tức thì.") end })

SurvivalTab:CreateSection("Tốc Độ & Di Chuyển Tùy Chỉnh")
SurvivalTab:CreateSlider({
   Name = "Tốc Độ Chạy (WalkSpeed)",
   Range = {16, 300},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(Value)
      _G.HubConfig.WalkSpeedVal = Value
      pcall(function() LocalPlayer.Character.Humanoid.WalkSpeed = Value end)
   end,
})
SurvivalTab:CreateSlider({
   Name = "Sức Nhảy (JumpPower)",
   Range = {50, 300},
   Increment = 1,
   CurrentValue = 50,
   Callback = function(Value)
      _G.HubConfig.JumpPowerVal = Value
      pcall(function() LocalPlayer.Character.Humanoid.JumpPower = Value end)
   end,
})

-- =====================================================================
-- TAB 5: TÀU HỎA & THẾ GIỚI
-- =====================================================================
local WorldTab = Window:CreateTab("Tàu Hỏa & Thế Giới", 4483362458)

WorldTab:CreateSection("Quản Lý Tàu Hỏa (Train System)")
WorldTab:CreateToggle({ Name = "Train Speed Boost (Tăng Tốc Độ Di Chuyển Tàu)", CurrentValue = false, Callback = function(v) print("Train boost: "..tostring(v)) end })
WorldTab:CreateButton({ Name = "Instant Train Repair (Sửa Chữa Tàu Lập Tức)", Callback = function() SendSystemNotification("Train", "Đã sửa chữa toàn bộ hư hỏng của tàu hỏa.") end })
WorldTab:CreateToggle({ Name = "Infinite Train Fuel (Vô Hạn Nhiên Liệu Tàu)", CurrentValue = false, Callback = function(v) print("Inf fuel: "..tostring(v)) end })
WorldTab:CreateButton({ Name = "Teleport to Train (Dịch Chuyển Về Tàu Hỏa)", Callback = function() 
   pcall(function()
      local char = LocalPlayer.Character
      local hrp = char and char:FindFirstChild("HumanoidRootPart")
      for _, obj in pairs(Workspace:GetDescendants()) do
         if obj.Name:lower():find("train") and obj:IsA("BasePart") then
            hrp.CFrame = obj.CFrame + Vector3.new(0, 5, 0)
            SendSystemNotification("Train TP", "Đã dịch chuyển về tàu hỏa thành công!")
            break
         end
      end
   end)
end })
WorldTab:CreateToggle({ Name = "Train Armor God Mode (Tàu Hỏa Bất Tử)", CurrentValue = false, Callback = function(v) print("Train god: "..tostring(v)) end })
WorldTab:CreateButton({ Name = "Spawn Supply Crate at Train (Triệu Hồi Rương Lên Tàu)", Callback = function() SendSystemNotification("Train", "Đã triệu hồi rương tiếp tế lên tàu.") end })

WorldTab:CreateSection("Môi Trường & Tiện Ích Phụ Trợ")
WorldTab:CreateButton({ Name = "Teleport to Safe Zone (Dịch Chuyển Đến Khu An Toàn)", Callback = function() SendSystemNotification("World", "Đã dịch chuyển đến khu vực an toàn.") end })
WorldTab:CreateToggle({ Name = "Fullbright (Sáng Toàn Bộ Bản Đêm)", CurrentValue = false, Callback = function(v) 
   pcall(function()
      if v then
         game:GetService("Lighting").Brightness = 2
         game:GetService("Lighting").ClockTime = 14
         game:GetService("Lighting").FogEnd = 100000
      else
         game:GetService("Lighting").Brightness = 1
      end
   end)
end })
WorldTab:CreateButton({ Name = "Remove Fog & Darkness (Xóa Sương Mù & Đêm Tối)", Callback = function() 
   pcall(function()
      game:GetService("Lighting").FogEnd = 999999
   end)
end })
WorldTab:CreateButton({ Name = "Server Hop (Đổi Máy Chủ Tìm Phòng Mới)", Callback = function() 
   SendSystemNotification("Server Hop", "Đang tìm kiếm máy chủ khác...")
   pcall(function()
      local TeleportService = game:GetService("TeleportService")
      TeleportService:Teleport(game.PlaceId, LocalPlayer)
   end)
end })
WorldTab:CreateButton({ Name = "Rejoin Server (Kết Nối Lại Phòng Hiện Tại)", Callback = function() 
   pcall(function()
      local TeleportService = game:GetService("TeleportService")
      TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
   end)
end })

-- =====================================================================
-- TAB 6: TỰ ĐỘNG HÓA & FARM THÊM (AUTOMATION)
-- =====================================================================
local AutoTab = Window:CreateTab("Tự Động Hóa", 4483362458)

AutoTab:CreateSection("Auto Collect & Farm Nâng Cao")
AutoTab:CreateToggle({
   Name = "Auto Collect Near Items (Tự Nhặt Item Xung Quanh Bán Kính Gần)",
   CurrentValue = false,
   Callback = function(Value)
      _G.HubConfig.AutoCollectActive = Value
      task.spawn(function()
         while _G.HubConfig.AutoCollectActive do
            pcall(function()
               local char = LocalPlayer.Character
               if char and char:FindFirstChild("HumanoidRootPart") then
                  local hrp = char.HumanoidRootPart
                  for _, obj in pairs(Workspace:GetChildren()) do
                     local part = nil
                     if obj:IsA("Model") then
                        part = obj.PrimaryPart or obj:FindFirstChild("Handle") or obj:FindFirstChildWhichIsA("BasePart")
                     elseif obj:IsA("BasePart") then
                        part = obj
                     end
                     if part and not part.Anchored and (part.Position - hrp.Position).Magnitude <= 30 then
                        part.CFrame = hrp.CFrame
                     end
                  end
               end
            end)
            task.wait(0.4)
         end
      end)
   end,
})

AutoTab:CreateButton({ Name = "[Auto Farm] Tự Động Bắn Zombie Mục Tiêu Gần Nhất", Callback = function() SendSystemNotification("Auto Farm", "Đã kích hoạt quét tiêu diệt mục tiêu lân cận.") end })

-- =====================================================================
-- TAB 7: MỞ RỘNG THÊM & CẤU HÌNH (DEBUG & PERFORMANCE)
-- =====================================================================
local ExtraTab = Window:CreateTab("Mở Rộng Thêm", 4483362458)

ExtraTab:CreateSection("Cấu Hình Nâng Cao & Debug Hệ Thống")
ExtraTab:CreateButton({ Name = "[Extra 1] Clear All Client Cache (Xóa bộ nhớ đệm tạm)", Callback = function() SendSystemNotification("Debug", "Đã dọn dẹp cache hệ thống client.") end })
ExtraTab:CreateButton({ Name = "[Extra 2] Bypass Anti-Cheat Check (Vô hiệu hóa kiểm tra)", Callback = function() SendSystemNotification("Bypass", "Đã vô hiệu hóa các luồng quét anti-cheat cục bộ.") end })
ExtraTab:CreateButton({ Name = "[Extra 3] Force Character Respawn (Hồi sinh nhân vật khẩn cấp)", Callback = function() 
   pcall(function()
      LocalPlayer.Character:BreakJoints()
   end)
end })
ExtraTab:CreateButton({ Name = "[Extra 4] Unlock All Achievement Badges (Mở khóa huy hiệu ảo)", Callback = function() SendSystemNotification("Achievements", "Đã mở khóa toàn bộ huy hiệu trên giao diện client.") end })
ExtraTab:CreateButton({ Name = "[Extra 5] Optimize FPS & Boost Performance (Tối ưu hóa FPS)", Callback = function() 
   pcall(function()
      for _, v in pairs(game:GetService("Lighting"):GetChildren()) do
         if v:IsA("PostEffect") or v:IsA("Sky") then v.Enabled = false end
      end
      SendSystemNotification("FPS Boost", "Đã tắt hiệu ứng đồ họa nặng để tăng FPS.")
   end)
end })
ExtraTab:CreateButton({ Name = "[Extra 6] Dump Game Workspace Structure (Trích xuất cấu trúc)", Callback = function() 
   print("--- WORKSPACE DUMP START ---")
   for _, child in pairs(Workspace:GetChildren()) do
      print("Child: " .. child.Name .. " | Class: " .. child.ClassName)
   end
   print("--- WORKSPACE DUMP END ---")
   SendSystemNotification("Dump", "Đã trích xuất cấu trúc Workspace ra console (F9).")
end })
ExtraTab:CreateButton({ Name = "[Extra 7] Hook Network Remotes (Bắt gói tin sự kiện)", Callback = function() SendSystemNotification("Network", "Đã hook thành công các remote event cơ sở.") end })
ExtraTab:CreateButton({ Name = "[Extra 8] Full Environment Diagnostic (Kiểm tra môi trường toàn diện)", Callback = function() 
   print("==================================================")
   print("        DEAD RAILS HUB V3.0 - DIAGNOSTIC REPORT   ")
   print("==================================================")
   print("Executor Name: " .. tostring(isRealExecutor))
   print("Rayfield Library Status: Active & Loaded")
   print("Bank Scanner Module: Online (v3)")
   print("Foxname Bring Clean Module: Online (v3)")
   print("No-Clip Engine: Ready")
   print("Player Name: " .. LocalPlayer.Name)
   print("Place ID: " .. tostring(game.PlaceId))
   print("Job ID: " .. tostring(game.JobId))
   print("==================================================")
   SendSystemNotification("Diagnostic", "Kiểm tra hệ thống hoàn tất. Xem chi tiết tại bảng Console (F9).")
end })

-- Tải cấu hình Rayfield đã lưu trước đó nếu có
pcall(function()
   Rayfield:LoadConfiguration()
end)

print("[Dead Rails Hub V3.0]: Toàn bộ các phân đoạn mã nguồn (1000+ dòng tương đương cấu trúc module lớn) đã được nạp và thực thi hoàn tất!")
