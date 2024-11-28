local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")

-- Создаем GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 250, 0, 100)
Frame.Position = UDim2.new(0, 10, 0, 10)
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame.BorderSizePixel = 0
Frame.Active = true -- Делаем фрейм активным для перетаскивания
Frame.Draggable = true -- Включаем возможность перетаскивания
Frame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Text = "Ваши координаты"
Title.Size = UDim2.new(1, 0, 0.3, 0)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSans
Title.TextScaled = true
Title.Parent = Frame

local Coordinates = Instance.new("TextLabel")
Coordinates.Text = "X: 0, Y: 0, Z: 0"
Coordinates.Size = UDim2.new(1, 0, 0.4, 0)
Coordinates.Position = UDim2.new(0, 0, 0.3, 0)
Coordinates.BackgroundTransparency = 1
Coordinates.TextColor3 = Color3.fromRGB(200, 200, 200)
Coordinates.Font = Enum.Font.SourceSans
Coordinates.TextScaled = true
Coordinates.Parent = Frame

local CopyButton = Instance.new("TextButton")
CopyButton.Text = "Скопировать CFrame"
CopyButton.Size = UDim2.new(0.8, 0, 0.3, 0)
CopyButton.Position = UDim2.new(0.1, 0, 0.7, 0)
CopyButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyButton.Font = Enum.Font.SourceSans
CopyButton.TextScaled = true
CopyButton.Parent = Frame

-- Обновление координат
RunService.RenderStepped:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local pos = LocalPlayer.Character.HumanoidRootPart.Position
        Coordinates.Text = string.format("X: %.2f, Y: %.2f, Z: %.2f", pos.X, pos.Y, pos.Z)
    end
end)

-- Копирование CFrame в буфер обмена
CopyButton.MouseButton1Click:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local cframe = LocalPlayer.Character.HumanoidRootPart.CFrame
        setclipboard(tostring(cframe)) -- Копируем CFrame в буфер обмена
        StarterGui:SetCore("SendNotification", {
            Title = "Скопировано!";
            Text = "Ваш CFrame был скопирован.";
            Duration = 3;
        })
    end
end)
