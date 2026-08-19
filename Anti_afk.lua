-- Kiểm tra xem dịch vụ và người chơi đã sẵn sàng chưa
local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

-- Thông báo khi script bắt đầu được nạp
print("--------------------------------------------------")
print("[Anti-AFK] Đang khởi tạo hệ thống chống treo máy...")
print("[Anti-AFK] Người chơi: " .. LocalPlayer.Name)

-- Biến lưu trữ kết nối sự kiện
local afkConnection = nil

-- Hàm kích hoạt tín hiệu giả lập chuột để tránh bị kick
local function bypassAfk()
    pcall(function()
        VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        task.wait(1)
        VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        print("[Anti-AFK] Đã gửi tín hiệu giữ kết nối thành công.")
    end)
end

-- Thiết lập kết nối sự kiện Idled của Roblox
local function initializeAntiAfk()
    if afkConnection then
        afkConnection:Disconnect()
    end
    
    afkConnection = LocalPlayer.Idled:Connect(function()
        print("[Anti-AFK] Phát hiện không hoạt động, đang tiến hành né kick...")
        bypassAfk()
    end)
    
    print("[Anti-AFK] Hệ thống đã hoạt động hoàn tất!")
    print("--------------------------------------------------")
end

-- Thực thi khởi động
initializeAntiAfk()
