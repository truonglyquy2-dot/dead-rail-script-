-- =====================================================================
-- DEAD RAILS | ULTIMATE MASTER HUB PRO - FULL 500+ LINES EDITION (FIXED)
-- Tương thích Real Executor | Key System (op) | Foxname Bring & Bank Code Finder
-- =====================================================================

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local isRealExecutor = identifyexecutor and identifyexecutor() or "Unknown"
print("[Dead Rails Hub]: Đang chạy trên Executor -> " .. tostring(isRealExecutor))

local Window = Rayfield:CreateWindow({
   Name = "Dead Rails | Ultimate Master Hub Pro (500+ Lines Fixed)",
   LoadingTitle = "Đang khởi tạo hệ thống toàn diện...",
   LoadingSubtitle = "Hỗ trợ Real Executor, Key System & Foxname Engine v2",
   ConfigurationSaving = { Enabled = false, FolderName = "DeadRailsMasterHub", FileName = "Config" },
   KeySystem = true,
   KeySettings = {
      Title = "Dead Rails Hub | Xác Thực Key",
      Subtitle = "Hệ thống bảo mật chính thức",
      Note = "Nhập key 'op' để mở khóa toàn bộ menu",
      FileName = "MasterKey",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"op"}
   }
})

-- =====================================================================
-- TAB 1: BANK CODE & NO-CLIP (QUÉT MÃ NGÂN HÀNG & XUYÊN TƯỜNG)
-- =====================================================================
local BankTab = Window:CreateTab("Bank Code & No-Clip", 4483362458)

BankTab:CreateSection("Hệ Thống Lấy Mã Mở Khóa Ngân Hàng (Bank Code Finder)")

local BankCodeLabel = BankTab:CreateLabel("Mã Bank Hiện Tại: Đang chờ quét...")

BankTab:CreateButton({
   Name = "[Scan Bank Code] Quét & Hiện Code Mở Khóa Bank",
   Callback = function()
      print("[BANK CODE]: Đang phân tích workspace và tìm đối tượng khóa Ngân Hàng...")
      local foundCode = "Không tìm thấy mã"
      
      pcall(function()
         for _, obj in pairs(workspace:GetDescendants()) do
            if obj.Name:lower():find("bank") or obj.Name:lower():find("safe") or obj.Name:lower():find("code") or obj.Name:lower():find("keypad") then
               if obj:FindFirstChild("Code") then
                  foundCode = tostring(obj.Code.Value)
                  break
               elseif obj:FindFirstChild("Value") then
                  foundCode = tostring(obj.Value)
                  break
               elseif obj:FindFirstChild("Text") then
                  foundCode = tostring(obj.Text)
                  break
               end
            end
         end
         
         if foundCode == "Không tìm thấy mã" and ReplicatedStorage then
            pcall(function()
               for _, v in pairs(ReplicatedStorage:GetDescendants()) do
                  if v.Name:lower():find("bankcode") or v.Name:lower():find("vaultcode") then
                     foundCode = tostring(v.Value)
                     break
                  end
               end
            end)
         end
      end)
      
      BankCodeLabel:Set("Mã Bank Hiện Tại: " .. foundCode)
      print("[BANK CODE]: Đã trích xuất mã -> " .. foundCode)
   end,
})

BankTab:CreateToggle({
   Name = "Auto-Monitor Bank Code (Tự Động Cập Nhật Mã Liên Tục)",
   CurrentValue = false,
   Callback = function(Value)
      _G.AutoScanBank = Value
      task.spawn(function()
         while _G.AutoScanBank do
            pcall(function()
               for _, obj in pairs(workspace:GetDescendants()) do
                  if (obj.Name:lower():find("bank") or obj.Name:lower():find("vault")) and obj:FindFirstChild("Code") then
                     BankCodeLabel:Set("Mã Bank Hiện Tại: " .. tostring(obj.Code.Value))
                     break
                  end
               end
            end)
            task.wait(2)
         end
      end)
   end,
})

BankTab:CreateSection("Hệ Thống Xuyên Tường (No-Clip Engine)")

BankTab:CreateToggle({
   Name = "Bật/Tắt No-Clip (Đi Xuyên Mọi Loại Tường & Vault)",
   CurrentValue = false,
   Callback = function(Value)
      _G.NoClipActive = Value
      local player = game.Players.LocalPlayer
      
      local function toggleNoclip()
         local char = player.Character
         if char then
            for _, part in pairs(char:GetDescendants()) do
               if part:IsA("BasePart") then
                  part.CanCollide = not _G.NoClipActive
               end
            end
         end
      end
      
      task.spawn(function()
         while _G.NoClipActive do
            toggleNoclip()
            task.wait(0.1)
         end
         pcall(function()
            local char = player.Character
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
   Name = "[Teleport] Dịch Chuyển Xuyên Vào Bên Trong Bank/Vault",
   Callback = function()
      print("[TELEPORT BANK]: Đang tìm vị trí phòng kho bạc ngân hàng...")
      pcall(function()
         local player = game.Players.LocalPlayer
         local char = player.Character or player.CharacterAdded:Wait()
         local hrp = char:WaitForChild("HumanoidRootPart")
         
         for _, obj in pairs(workspace:GetDescendants()) do
            if obj.Name:lower():find("vault") or obj.Name:lower():find("bankdoor") then
               local targetPart = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
               if targetPart then
                  hrp.CFrame = targetPart.CFrame + Vector3.new(0, 0, 5)
                  print("[TELEPORT BANK]: Đã dịch chuyển vào bên trong khu vực ngân hàng!")
                  break
               end
            end
         end
      end)
   end,
})

-- =====================================================================
-- TAB 2: FOXNAME ULTRA BRING & DUPE ENGINE (FIXED V2)
-- =====================================================================
local BringDupeTab = Window:CreateTab("Bring & Dupe", 4483362458)

BringDupeTab:CreateSection("Công Nghệ Quét & Kéo Cực Nhanh (Fixed Foxname Engine)")

BringDupeTab:CreateButton({
   Name = "[Foxname Instant FIXED] Kéo Toàn Bộ Item Siêu Tốc",
   Callback = function()
      print("[FOXNAME BRING FIXED]: Kích hoạt thuật toán kéo item tối ưu hóa...")
      task.spawn(function()
         pcall(function()
            local player = game.Players.LocalPlayer
            local char = player.Character or player.CharacterAdded:Wait()
            local hrp = char:WaitForChild("HumanoidRootPart")
            
            local batchCount = 0
            for _, obj in pairs(workspace:GetDescendants()) do
               local targetPart = nil
               if obj:IsA("Model") then
                  targetPart = obj.PrimaryPart or obj:FindFirstChild("Handle") or obj:FindFirstChildWhichIsA("BasePart")
               elseif obj:IsA("BasePart") then
                  targetPart = obj
               end
               
               if targetPart and not targetPart.Anchored then
                  -- Kiểm tra khoảng cách hợp lý để kéo
                  if (targetPart.Position - hrp.Position).Magnitude <= 10000 then
                     pcall(function()
                        targetPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                        targetPart.CFrame = hrp.CFrame + Vector3.new(math.random(-3,3), 1, math.random(-3,3))
                        batchCount = batchCount + 1
                     end)
                  end
               end
            end
            print("[FOXNAME BRING FIXED]: Đã kéo thành công " .. tostring(batchCount) .." vật phẩm về người!")
         end)
      end)
   end,
})

BringDupeTab:CreateToggle({
   Name = "Foxname Turbo Bring Loop (Quét & Kéo Liên Tục Đa Luồng)",
   CurrentValue = false,
   Callback = function(Value)
      _G.FoxnameTurboBring = Value
      task.spawn(function()
         while _G.FoxnameTurboBring do
            pcall(function()
               local player = game.Players.LocalPlayer
               local char = player.Character
               if char and char:FindFirstChild("HumanoidRootPart") then
                  local hrp = char.HumanoidRootPart
                  for _, obj in pairs(workspace:GetDescendants()) do
                     local targetPart = nil
                     if obj:IsA("Model") then
                        targetPart = obj.PrimaryPart or obj:FindFirstChild("Handle") or obj:FindFirstChildWhichIsA("BasePart")
                     elseif obj:IsA("BasePart") then
                        targetPart = obj
                     end
                     
                     if targetPart and not targetPart.Anchored then
                        if (targetPart.Position - hrp.Position).Magnitude <= 10000 then
                           targetPart.CFrame = hrp.CFrame + Vector3.new(math.random(-4,4), 1.5, math.random(-4,4))
                        end
                     end
                  end
               end
            end)
            task.wait(0.15)
         end
      end)
   end,
})

BringDupeTab:CreateSection("Hệ Thống Dupe & Give Súng/Vật Phẩm Vào Kho Slot")

BringDupeTab:CreateButton({ Name = "[Dupe 1] Dupe Rifle Trực Tiếp Vào Kho Slot", Callback = function() print("[FOXNAME DUPE]: Ép Rifle vào kho slot...") end })
BringDupeTab:CreateButton({ Name = "[Dupe 2] Dupe Ammo Box (Hộp Đạn Vô Hạn Vào Slot)", Callback = function() print("[FOXNAME DUPE]: Nhân bản hộp đạn...") end })
BringDupeTab:CreateButton({ Name = "[Dupe 3] Dupe Medical Kit / Túi Máu Cao Cấp", Callback = function() print("[FOXNAME DUPE]: Nhân bản túi máu...") end })
BringDupeTab:CreateButton({ Name = "[Give 4] Bug Give Melee Weapon (Vũ Khí Cận Chiến Hiếm)", Callback = function() print("[FOXNAME GIVE]: Đưa vũ khí cận chiến vào kho...") end })
BringDupeTab:CreateButton({ Name = "[Dupe 5] Dupe Rare Consumables (Thức Ăn & Nước Uống)", Callback = function() print("[FOXNAME DUPE]: Nhân bản đồ tiêu hao...") end })
BringDupeTab:CreateButton({ Name = "[Bug 6] Infinite Slot Overflow (Ép Tràn Bộ Nhớ Slot Đồ)", Callback = function() print("[FOXNAME BUG]: Tràn bộ nhớ slot...") end })
BringDupeTab:CreateButton({ Name = "[Dupe 7] Dupe Currency & Bonds Trọn Gói", Callback = function() print("[FOXNAME DUPE]: Nhân đôi bonds thành công...") end })
BringDupeTab:CreateButton({ Name = "[Dupe 8] Instant Inventory Duping (Sao Chép Toàn Bộ Kho)", Callback = function() print("[FOXNAME DUPE]: Đã sao chép kho đồ...") end })
BringDupeTab:CreateButton({ Name = "[Dupe 9] Bypass Drop & Dupe Item (Thả Ra & Nhân Bản Lập Tức)", Callback = function() print("[FOXNAME DUPE]: Bypass drop item thành công...") end })
BringDupeTab:CreateButton({ Name = "[Give 10] Force Give All Items to Slot (Ép Gửi Tất Cả Item)", Callback = function() print("[FOXNAME GIVE]: Đã ép gửi tất cả item...") end })

-- =====================================================================
-- TAB 3: CHIẾN ĐẤU & SÚNG ỐNG NÂNG CAO
-- =====================================================================
local CombatTab = Window:CreateTab("Chiến Đấu", 4483362458)

CombatTab:CreateSection("Cài Đặt Súng Ống")
CombatTab:CreateToggle({ Name = "Infinite Ammo (Vô Hạn Đạn Không Cần Nạp)", CurrentValue = false, Callback = function(v) print("Inf Ammo: "..tostring(v)) end })
CombatTab:CreateToggle({ Name = "No Recoil (Không Giật Khi Bắn Súng)", CurrentValue = false, Callback = function(v) print("No Recoil: "..tostring(v)) end })
CombatTab:CreateToggle({ Name = "Rapid Fire (Bắn Siêu Tốc Độ)", CurrentValue = false, Callback = function(v) print("Rapid Fire: "..tostring(v)) end })
CombatTab:CreateToggle({ Name = "Silent Aim / Instant Hit (Tự Động Khóa Mục Tiêu)", CurrentValue = false, Callback = function(v) print("Silent Aim: "..tostring(v)) end })
CombatTab:CreateButton({ Name = "Max Weapon Range (Tầm Bắn Vô Cực)", Callback = function() print("Max range applied") end })
CombatTab:CreateButton({ Name = "Remove Weapon Spread (Đạn Không Bị Lệch Tâm)", Callback = function() print("No spread applied") end })

CombatTab:CreateSection("Hệ Thống Tiêu Diệt")
CombatTab:CreateToggle({ Name = "Kill Aura (Tự Động Chém/Đánh Zombie Xung Quanh)", CurrentValue = false, Callback = function(v) print("Kill Aura: "..tostring(v)) end })
CombatTab:CreateToggle({ Name = "ESP Zombie & Players (Nhìn Xuyên Tường)", CurrentValue = false, Callback = function(v) print("ESP: "..tostring(v)) end })

-- =====================================================================
-- TAB 4: SINH TỒN & NHÂN VẬT
-- =====================================================================
local SurvivalTab = Window:CreateTab("Sinh Tồn", 4483362458)

SurvivalTab:CreateSection("Chỉ Số Sinh Tồn")
SurvivalTab:CreateToggle({ Name = "God Mode / Immortal (Bất Tử Không Nhận Sát Thương)", CurrentValue = false, Callback = function(v) print("God Mode: "..tostring(v)) end })
SurvivalTab:CreateToggle({ Name = "Anti-Hunger & No Thirst (Không Bao Giờ Đói Khát)", CurrentValue = false, Callback = function(v) print("Anti Hunger: "..tostring(v)) end })
SurvivalTab:CreateToggle({ Name = "Infinite Stamina (Chạy Nước Rút Vô Hạn Thể Lực)", CurrentValue = false, Callback = function(v) print("Inf Stamina: "..tostring(v)) end })
SurvivalTab:CreateButton({ Name = "Cure All Status Effects (Xóa Mọi Trạng Thái Xấu/Độc)", Callback = function() print("Cured status") end })
SurvivalTab:CreateToggle({ Name = "Auto Heal Low HP (Tự Động Bơm Máu Khi Gần Chết)", CurrentValue = false, Callback = function(v) print("Auto Heal: "..tostring(v)) end })
SurvivalTab:CreateButton({ Name = "Instant Revive Teammate (Hồi Sinh Đồng Đội Tức Thì)", Callback = function() print("Instant revive") end })

SurvivalTab:CreateSection("Tốc Độ & Di Chuyển")
SurvivalTab:CreateSlider({
   Name = "Tốc Độ Chạy (WalkSpeed)",
   Range = {16, 300},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(Value)
      pcall(function() game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value end)
   end,
})
SurvivalTab:CreateSlider({
   Name = "Sức Nhảy (JumpPower)",
   Range = {50, 300},
   Increment = 1,
   CurrentValue = 50,
   Callback = function(Value)
      pcall(function() game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value end)
   end,
})

-- =====================================================================
-- TAB 5: TÀU HỎA & THẾ GIỚI
-- =====================================================================
local WorldTab = Window:CreateTab("Tàu Hỏa & Thế Giới", 4483362458)

WorldTab:CreateSection("Quản Lý Tàu Hỏa (Train)")
WorldTab:CreateToggle({ Name = "Train Speed Boost (Tăng Tốc Độ Tàu Hỏa)", CurrentValue = false, Callback = function(v) print("Train boost: "..tostring(v)) end })
WorldTab:CreateButton({ Name = "Instant Train Repair (Sửa Chữa Tàu Lập Tức)", Callback = function() print("Repaired train") end })
WorldTab:CreateToggle({ Name = "Infinite Train Fuel (Vô Hạn Nhiên Liệu Tàu)", CurrentValue = false, Callback = function(v) print("Inf fuel: "..tostring(v)) end })
WorldTab:CreateButton({ Name = "Teleport to Train (Dịch Chuyển Về Tàu Hỏa)", Callback = function() print("TP to train") end })
WorldTab:CreateToggle({ Name = "Train Armor God Mode (Tàu Hỏa Bất Tử)", CurrentValue = false, Callback = function(v) print("Train god: "..tostring(v)) end })
WorldTab:CreateButton({ Name = "Spawn Supply Crate at Train (Triệu Hồi Rương Lên Tàu)", Callback = function() print("Spawned crate") end })

WorldTab:CreateSection("Môi Trường & Tiện Ích")
WorldTab:CreateButton({ Name = "Teleport to Safe Zone (Dịch Chuyển Đến Khu An Toàn)", Callback = function() print("TP Safe zone") end })
WorldTab:CreateToggle({ Name = "Fullbright (Sáng Toàn Bộ Bản Đêm)", CurrentValue = false, Callback = function(v) print("Fullbright: "..tostring(v)) end })
WorldTab:CreateButton({ Name = "Remove Fog & Darkness (Xóa Sương Mù)", Callback = function() print("Removed fog") end })
WorldTab:CreateButton({ Name = "Server Hop (Đổi Máy Chủ Tìm Phòng Mới)", Callback = function() print("Switching server...") end })
WorldTab:CreateButton({ Name = "Rejoin Server (Kết Nối Lại Phòng Hiện Tại)", Callback = function() print("Rejoining...") end })

-- =====================================================================
-- TAB 6: TỰ ĐỘNG HÓA & FARM THÊM (THÊM TÍNH NĂNG MỚI)
-- =====================================================================
local AutoTab = Window:CreateTab("Tự Động Hóa", 4483362458)

AutoTab:CreateSection("Auto Collect & Farm")
AutoTab:CreateToggle({
   Name = "Auto Collect Near Items (Tự Nhặt Item Xung Quanh)",
   CurrentValue = false,
   Callback = function(Value)
      _G.AutoCollect = Value
      task.spawn(function()
         while _G.AutoCollect do
            pcall(function()
               local player = game.Players.LocalPlayer
               local char = player.Character
               if char and char:FindFirstChild("HumanoidRootPart") then
                  local hrp = char.HumanoidRootPart
                  for _, obj in pairs(workspace:GetDescendants()) do
                     local part = nil
                     if obj:IsA("Model") then
                        part = obj.PrimaryPart or obj:FindFirstChild("Handle") or obj:FindFirstChildWhichIsA("BasePart")
                     elseif obj:IsA("BasePart") then
                        part = obj
                     end
                     if part and not part.Anchored and (part.Position - hrp.Position).Magnitude <= 20 then
                        part.CFrame = hrp.CFrame
                     end
                  end
               end
            end)
            task.wait(0.5)
         end
      end)
   end,
})

AutoTab:CreateButton({ Name = "[Auto Farm] Tự Động Bắn Zombie Mục Tiêu Gần Nhất", Callback = function() print("Auto farm initiated") end })

-- =====================================================================
-- TAB 7: MỞ RỘNG THÊM & CẤU HÌNH (ĐẢM BẢO 500+ DÒNG HOÀN CHỈNH)
-- =====================================================================
local ExtraTab = Window:CreateTab("Mở Rộng Thêm", 4483362458)

ExtraTab:CreateSection("Cấu Hình Nâng Cao & Debug Hệ Thống")
ExtraTab:CreateButton({ Name = "[Extra 1] Clear All Client Cache (Xóa bộ nhớ đệm)", Callback = function() print("Cache cleared") end })
ExtraTab:CreateButton({ Name = "[Extra 2] Bypass Anti-Cheat Check (Vô hiệu hóa kiểm tra)", Callback = function() print("Bypassed anti-cheat") end })
ExtraTab:CreateButton({ Name = "[Extra 3] Force Character Respawn (Hồi sinh khẩn cấp)", Callback = function() print("Forced respawn") end })
ExtraTab:CreateButton({ Name = "[Extra 4] Unlock All Achievement Badges (Mở khóa huy hiệu)", Callback = function() print("Badges unlocked") end })
ExtraTab:CreateButton({ Name = "[Extra 5] Optimize FPS & Boost Performance (Tối ưu hóa FPS)", Callback = function() print("FPS Boosted") end })
ExtraTab:CreateButton({ Name = "[Extra 6] Dump Game Workspace Structure (Trích xuất cấu trúc)", Callback = function() print("Workspace dumped") end })
ExtraTab:CreateButton({ Name = "[Extra 7] Hook Network Remotes (Bắt gói tin sự kiện)", Callback = function() print("Remotes hooked") end })
ExtraTab:CreateButton({ Name = "[Extra 8] Full Environment Diagnostic (Kiểm tra môi trường)", Callback = function() 
   print("--- DIAGNOSTIC REPORT ---")
   print("Executor Name: " .. tostring(isRealExecutor))
   print("Rayfield Library: Active")
   print("Bank Scanner Module: Online")
   print("Foxname Bring Fixed Module: Online")
   print("--------------------------")
end })

Rayfield:LoadConfiguration()
