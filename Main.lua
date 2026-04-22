local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- 1. CONFIGURACIÓN DE LA VENTANA
local Window = Fluent:CreateWindow({
    Title = "Sersoft Professional",
    SubTitle = "by papita kawaii123",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false, 
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightControl
})

-- 2. CREACIÓN DEL BOTÓN FLOTANTE PERSONALIZADO
local ScreenGui = Instance.new("ScreenGui")
local ToggleButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

ScreenGui.Name = "SersoftToggle"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = ScreenGui
ToggleButton.BackgroundColor3 = Color3.fromRGB(10, 10, 10) -- Negro puro
ToggleButton.Position = UDim2.new(0.05, 0, 0.2, 0) -- Posición inicial
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Text = "S"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 24
ToggleButton.Draggable = true -- Para que puedas mover el botón donde quieras

UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = ToggleButton

-- Lógica para abrir/cerrar
ToggleButton.MouseButton1Click:Connect(function()
    Window:Minimize() -- Esto alterna entre abierto y cerrado en Fluent
end)

-- 3. PESTAÑAS (Estilo Speed Hub X)
local Tabs = {
    Main = Window:AddTab({ Title = "Principal", Icon = "box" }),
    Settings = Window:AddTab({ Title = "Ajustes", Icon = "settings" })
}

-- Contenido de la pestaña Principal
Tabs.Main:AddSection("Movimiento")

Tabs.Main:AddSlider("SpeedSlider", {
    Title = "Velocidad",
    Description = "Ajusta tu velocidad de caminado",
    Default = 16,
    Min = 16,
    Max = 250,
    Rounding = 0,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
})

Tabs.Main:AddButton({
    Title = "Resetear Velocidad",
    Description = "Vuelve a la velocidad normal (16)",
    Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
    end
})

-- 4. FINALIZACIÓN
Window:SelectTab(1)
