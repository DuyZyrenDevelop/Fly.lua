-- BD Fly Premium 2026 + Key System - By Nguyễn Văn Bảo Duy
-- Key: Tuankiet (hardcode, đổi nếu muốn)

local keyRequired = "Tuankiet"  -- Đổi key ở đây nếu cần

-- Key System GUI
local sgKey = Instance.new("ScreenGui")
sgKey.Name = "KeySystemBD"
sgKey.ResetOnSpawn = false
sgKey.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frameKey = Instance.new("Frame")
frameKey.Size = UDim2.new(0, 300, 0, 180)
frameKey.Position = UDim2.new(0.5, -150, 0.5, -90)
frameKey.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
frameKey.BorderSizePixel = 0
frameKey.Parent = sgKey

local uiCornerKey = Instance.new("UICorner")
uiCornerKey.CornerRadius = UDim.new(0,12)
uiCornerKey.Parent = frameKey

local titleKey = Instance.new("TextLabel")
titleKey.Size = UDim2.new(1,0,0,50)
titleKey.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
titleKey.Text = "BD Fly Premium - Key System"
titleKey.TextColor3 = Color3.new(1,1,1)
titleKey.Font = Enum.Font.GothamBlack
titleKey.TextSize = 24
titleKey.Parent = frameKey

local inputKey = Instance.new("TextBox")
inputKey.Size = UDim2.new(0.9,0,0,50)
inputKey.Position = UDim2.new(0.05,0,0.35,0)
inputKey.BackgroundColor3 = Color3.fromRGB(40,40,60)
inputKey.Text = ""
inputKey.PlaceholderText = "Nhập key (ví dụ: Tuankiet)"
inputKey.TextColor3 = Color3.new(1,1,1)
inputKey.Font = Enum.Font.GothamSemibold
inputKey.TextSize = 20
inputKey.Parent = frameKey

local submitBtn = Instance.new("TextButton")
submitBtn.Size = UDim2.new(0.9,0,0,50)
submitBtn.Position = UDim2.new(0.05,0,0.65,0)
submitBtn.BackgroundColor3 = Color3.fromRGB(0,170,255)
submitBtn.Text = "Xác nhận"
submitBtn.TextColor3 = Color3.new(1,1,1)
submitBtn.Font = Enum.Font.GothamBold
submitBtn.TextSize = 26
submitBtn.Parent = frameKey

-- Check key function
local function checkKey()
    if inputKey.Text == keyRequired then
        sgKey:Destroy()  -- Xóa key GUI
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "BD Fly Premium",
            Text = "Key đúng! Loading hack...",
            Duration = 5
        })
        -- Bắt đầu load script chính (toàn bộ code fly + intro + logo bên dưới)
        loadMainScript()
    else
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Lỗi Key",
            Text = "Key sai! Thử lại nhé bro.",
            Duration = 5
        })
        inputKey.Text = ""  -- Xóa input để nhập lại
    end
end

submitBtn.MouseButton1Click:Connect(checkKey)
inputKey.FocusLost:Connect(function(enterPressed)
    if enterPressed then checkKey() end
end)

-- Hàm load script chính (tách riêng để chỉ chạy khi key đúng)
function loadMainScript()
    -- Từ đây là code cũ: Intro + Logo + GUI Fly + Features
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")

    local player = Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")
    local char = player.Character or player.CharacterAdded:Wait()
    local humanoid = char:WaitForChild("Humanoid")
    local root = char:WaitForChild("HumanoidRootPart")

    local flying = false
    local speed = 50
    local noclip = false
    local infjump = false

    local bodyVel, bodyGyro

    -- Splash Intro
    local introGui = Instance.new("ScreenGui")
    introGui.Name = "IntroBD"
    introGui.ResetOnSpawn = false
    introGui.Parent = playerGui

    local introFrame = Instance.new("Frame")
    introFrame.Size = UDim2.new(1,0,1,0)
    introFrame.BackgroundColor3 = Color3.fromRGB(10,10,20)
    introFrame.BorderSizePixel = 0
    introFrame.Parent = introGui

    local introText = Instance.new("TextLabel")
    introText.Size = UDim2.new(0.8,0,0.3,0)
    introText.Position = UDim2.new(0.1,0,0.35,0)
    introText.BackgroundTransparency = 1
    introText.Text = "Nguyễn Văn Bảo Duy\nPremium Fly Hack 2026"
    introText.TextColor3 = Color3.fromRGB(0, 255, 200)
    introText.Font = Enum.Font.GothamBlack
    introText.TextSize = 45
    introText.TextStrokeTransparency = 0.7
    introText.TextStrokeColor3 = Color3.new(0,0,0)
    introText.Parent = introFrame

    wait(3)
    TweenService:Create(introFrame, TweenInfo.new(1.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
    for _, child in pairs(introFrame:GetChildren()) do
        if child:IsA("GuiObject") then
            TweenService:Create(child, TweenInfo.new(1.2), {TextTransparency = 1, TextStrokeTransparency = 1}):Play()
        end
    end
    wait(1.3)
    introGui:Destroy()

    -- Main GUI & Logo (giống code cũ)
    local sg = Instance.new("ScreenGui")
    sg.Name = "BDFlyPremium"
    sg.ResetOnSpawn = false
    sg.Parent = playerGui

    -- Logo Button
    local logoBtn = Instance.new("ImageButton")
    logoBtn.Size = UDim2.new(0, 80, 0, 80)
    logoBtn.Position = UDim2.new(0.02, 0, 0.85, 0)
    logoBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 255)
    logoBtn.BackgroundTransparency = 0.3
    logoBtn.Image = "rbxassetid://7072721032"
    logoBtn.ImageTransparency = 0.1
    logoBtn.AutoButtonColor = false
    logoBtn.Parent = sg

    local logoCorner = Instance.new("UICorner")
    logoCorner.CornerRadius = UDim.new(1,0)
    logoCorner.Parent = logoBtn

    local logoText = Instance.new("TextLabel")
    logoText.Size = UDim2.new(1,0,0.3,0)
    logoText.Position = UDim2.new(0,0,0.7,0)
    logoText.BackgroundTransparency = 1
    logoText.Text = "BD Fly"
    logoText.TextColor3 = Color3.new(1,1,1)
    logoText.Font = Enum.Font.GothamBold
    logoText.TextSize = 18
    logoText.Parent = logoBtn

    -- Main Frame (code GUI fly giống trước, mình rút gọn để script ngắn hơn, bạn copy phần GUI cũ nếu cần đầy đủ)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 260, 0, 380)
    frame.Position = UDim2.new(0.5, -130, 0.5, -190)
    frame.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
    frame.Active = true
    frame.Draggable = true
    frame.Parent = sg

    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0,12)
    uiCorner.Parent = frame

    -- ... (thêm title, closeBtn, toggleFly, speedLabel, plus/minus, noclipBtn, jumpBtn, upBtn, downBtn giống code cũ)

    -- Fly Engine, Noclip, InfJump, Speed hack... (copy nguyên từ code cũ vào đây)
    -- Ví dụ ngắn gọn:
    local function startFly() -- code startFly như cũ end
    local function stopFly() -- code stopFly như cũ end
    -- RunService.RenderStepped cho fly, Stepped cho noclip, JumpRequest cho infjump, spawn cho ground speed...

    print("BD Fly Premium loaded với key! - Key: Tuankiet")
end

-- Script dừng ở đây, chờ nhập key đúng mới loadMainScript()
