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

-- 2. BOTÓN FLOTANTE "FORZADO" (Este no puede fallar)
local function CreateMobileButton()
    local ScreenGui = Instance.new("ScreenGui")
    local Button = Instance.new("TextButton")
    local UICorner = Instance.new("UICorner")

    -- Propiedades del ScreenGui (Asegura que se vea sobre todo)
    ScreenGui.Name = "Sersoft_Toggle_UI"
    ScreenGui.Parent = game:GetService("CoreGui") or game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.DisplayOrder = 999 -- Máxima prioridad visual

    -- Propiedades del Botón
    Button.Name = "SersoftBtn"
    Button.Parent = ScreenGui
    Button.BackgroundColor3 = Color3.fromRGB(15, 15, 15) -- Negro Sersoft
    Button.BorderSizePixel = 0
    Button.Position = UDim2.new(0.05, 0, 0.15, 0) -- Aparece arriba a la izquierda
    Button.Size = UDim2.new(0, 50, 0, 50)
    Button.Font = Enum.Font.GothamBold
    Button.Text = "S"
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextSize = 25
    Button.Draggable = true -- Lo puedes mover con el mouse
    Button.Active = true

    UICorner.CornerRadius = UDim.new(0, 15)
    UICorner.Parent = Button

    -- Lógica de apertura/cierre
    Button.MouseButton1Click:Connect(function()
        -- Fluent usa una función específica para alternar el menú
        if game:GetService("CoreGui"):FindFirstChild("Fluent") then
            game:GetService("CoreGui").Fluent.Enabled = not game:GetService("CoreGui").Fluent.Enabled
        else
            -- Si no está en CoreGui, buscamos en PlayerGui
            local gui = game.Players.LocalPlayer.PlayerGui:FindFirstChild("Fluent")
            if gui then gui.Enabled = not gui.Enabled end
        end
    end)
end

-- Ejecutamos la creación del botón
CreateMobileButton()

-- 3. PESTAÑAS Y FUNCIONES
local Tabs = {
    Main = Window:AddTab({ Title = "Principal", Icon = "box" }),
    Settings = Window:AddTab({ Title = "Ajustes", Icon = "settings" })
}

Tabs.Main:AddSlider("Speed", {
    Title = "Velocidad Sersoft",
    Default = 16,
    Min = 16,
    Max = 300,
    Rounding = 0,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
})

Window:SelectTab(1)
