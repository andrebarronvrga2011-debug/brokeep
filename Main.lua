
local Sersoft = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local ToggleBtn = Instance.new("TextButton")
local Title = Instance.new("TextLabel")
local SpeedBtn = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")


Sersoft.Name = "Sersoft_Minimal"
Sersoft.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Sersoft.ResetOnSpawn = false


ToggleBtn.Name = "Toggle"
ToggleBtn.Parent = Sersoft
ToggleBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ToggleBtn.Position = UDim2.new(0.02, 0, 0.45, 0)
ToggleBtn.Size = UDim2.new(0, 45, 0, 45)
ToggleBtn.Text = "S" -- Letra de Sersoft
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.TextSize = 20
ToggleBtn.Font = Enum.Font.GothamBold

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 10)
BtnCorner.Parent = ToggleBtn


MainFrame.Name = "MainFrame"
MainFrame.Parent = Sersoft
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.Position = UDim2.new(0.5, -100, 0.5, -75)
MainFrame.Size = UDim2.new(0, 200, 0, 150)
MainFrame.Visible = false -- Empieza cerrado
MainFrame.BorderSizePixel = 0

local FrameCorner = Instance.new("UICorner")
FrameCorner.Parent = MainFrame


Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Font = Enum.Font.GothamBold
Title.Text = "SERSOFT"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18


SpeedBtn.Parent = MainFrame
SpeedBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SpeedBtn.Position = UDim2.new(0.1, 0, 0.4, 0)
SpeedBtn.Size = UDim2.new(0.8, 0, 0, 40)
SpeedBtn.Font = Enum.Font.Gotham
SpeedBtn.Text = "Velocidad: 100"
SpeedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedBtn.TextSize = 14

local SpeedCorner = Instance.new("UICorner")
SpeedCorner.Parent = SpeedBtn


ToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

SpeedBtn.MouseButton1Click:Connect(function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
end)


MainFrame.Active = true
MainFrame.Draggable = true
