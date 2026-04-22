local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Sersoft | Professional Edition",
    SubTitle = "by papita kawaii123",
    TabWidth = 160, 
    Size = UDim2.fromOffset(580, 460), 
    Acrylic = false, 
    Theme = "Dark", 
    MinimizeKey = Enum.KeyCode.RightControl 
})

local Tabs = {
    Home = Window:AddTab({ Title = "Inicio", Icon = "home" }),
    Main = Window:AddTab({ Title = "Principal", Icon = "box" }), 
    Combat = Window:AddTab({ Title = "Combate Pro", Icon = "swords" }), 
    Automation = Window:AddTab({ Title = "Automatización", Icon = "zap" }),
    Settings = Window:AddTab({ Title = "Ajustes", Icon = "settings" })
}


local bypassSpeed = false
local speedValue = 1
local killAuraActivo = false
local rangoAura = 12
local spamAbilities = false
local habilidadSeleccionada = "2"


Tabs.Home:AddParagraph({
    Title = "Bienvenido a Sersoft",
    Content = "Menú optimizado para Battlegrounds. Creado por papita kawaii123."
})


Tabs.Main:AddSection("Mejoras de Jugador")

Tabs.Main:AddSlider("VelocidadNormal", {
    Title = "Velocidad Normal",
    Description = "Cambia el WalkSpeed (Cuidado con Anticheat)",
    Default = 16,
    Min = 16,
    Max = 150,
    Rounding = 0,
    Callback = function(Value)
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end
    end
})

Tabs.Main:AddToggle("BypassToggle", {
    Title = "Bypass Speed (CFrame)",
    Description = "Moverse rápido sin cambiar WalkSpeed",
    Default = false,
    Callback = function(Value)
        bypassSpeed = Value
    end
})


Tabs.Combat:AddSection("Combate Automático")

Tabs.Combat:AddToggle("KillAuraToggle", {
    Title = "Kill Aura Inteligente",
    Description = "Ataca enemigos cercanos (Rango 12)",
    Default = false,
    Callback = function(Value)
        killAuraActivo = Value
    end
})

Tabs.Combat:AddSection("Spam de Habilidades")

Tabs.Combat:AddToggle("SpamAbilityToggle", {
    Title = "Activar Spam de Habilidades",
    Description = "Spamea la tecla seleccionada evitando el baneo",
    Default = false,
    Callback = function(Value)
        spamAbilities = Value
    end
})

local KeyDropdown = Tabs.Combat:AddDropdown("KeySelect", {
    Title = "Tecla a Spamear",
    Values = {"1", "2", "3", "4", "E", "Q", "R", "F"},
    Multi = false,
    Default = "2",
    Callback = function(Value)
        habilidadSeleccionada = Value
    end
})


game:GetService("RunService").RenderStepped:Connect(function()
    if bypassSpeed then
        local char = game.Players.LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        local hum = char and char:FindFirstChild("Humanoid")
        if root and hum and hum.MoveDirection.Magnitude > 0 then
            root.CFrame = root.CFrame + (hum.MoveDirection * speedValue)
        end
    end
end)


local function atacarCercano()
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then return end

    for _, v in pairs(game.Workspace:GetChildren()) do
        local targetHum = v:FindFirstChildOfClass("Humanoid")
        local targetRoot = v:FindFirstChild("HumanoidRootPart")
        
        if targetHum and targetRoot and v.Name ~= player.Name and targetHum.Health > 0 then
            local distancia = (character.HumanoidRootPart.Position - targetRoot.Position).Magnitude
            if distancia <= rangoAura then
                local tool = character:FindFirstChildOfClass("Tool")
                if tool then
                    tool:Activate()
                end
            end
        end
    end
end

task.spawn(function()
    while task.wait(0.3) do 
        if killAuraActivo then
            atacarCercano()
        end
    end
end)


task.spawn(function()
    local VIM = game:GetService("VirtualInputManager")
    while task.wait(0.2) do 
        if spamAbilities then
            local char = game.Players.LocalPlayer.Character
            local hum = char and char:FindFirstChild("Humanoid")
            
            
            if hum and hum:GetState() ~= Enum.HumanoidStateType.Physics then
                VIM:SendKeyEvent(true, Enum.KeyCode[habilidadSeleccionada], false, game)
                task.wait(0.02)
                VIM:SendKeyEvent(false, Enum.KeyCode[habilidadSeleccionada], false, game)
            end
        end
    end
end)


Tabs.Automation:AddButton({
    Title = "Recolección Automática",
    Callback = function()
        print("Sersoft: Recolección iniciada.")
    end
})

Window:SelectTab(1)
