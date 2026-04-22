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
    Automation = Window:AddTab({ Title = "Automatización", Icon = "zap" }),
    Settings = Window:AddTab({ Title = "Ajustes", Icon = "settings" })
}


Tabs.Home:AddParagraph({
    Title = "Bienvenido a Sersoft",
    Content = "Menú optimizado. Usa la barra lateral para navegar."
})


Tabs.Main:AddSection("Mejoras de Jugador")

Tabs.Main:AddSlider("Velocidad", {
    Title = "Velocidad de Caminado",
    Description = "Ajusta tu velocidad",
    Default = 16,
    Min = 16,
    Max = 300,
    Rounding = 0,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
})


Tabs.Automation:AddSection("Automatizaciones Activas")


Tabs.Automation:AddButton({
    Title = "Recolección Automática",
    Description = "Recoge objetos cercanos",
    Callback = function()
        print("Sersoft: Recolección automática iniciada.")
    end
})


Window:SelectTab(1) 

local bypassSpeed = false
local speedValue = 1 

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


Tab:AddToggle({
	Name = "Bypass Speed (CFrame)",
	Default = false,
	Callback = function(Value)
		bypassSpeed = Value
	end    
})

local killAuraActivo = false
local rangoAura = 15


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

-- Bucle de ejecución
task.spawn(function()
    while task.wait(0.1) do -- Revisa 10 veces por segundo
        if killAuraActivo then
            atacarCercano()
        end
    end
end)


Tab:AddToggle({
    Name = "Kill Aura (Sersoft Combat)",
    Default = false,
    Callback = function(Value)
        killAuraActivo = Value
    end
})
