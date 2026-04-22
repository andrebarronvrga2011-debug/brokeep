local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- 1. CREAR VENTANA (Orion pone el botón de abrir/cerrar automáticamente)
local Window = OrionLib:MakeWindow({
    Name = "Sersoft Professional", 
    HidePremium = false, 
    SaveConfig = true, 
    ConfigFolder = "SersoftData",
    IntroText = "Sersoft Suite" -- Texto que sale al cargar
})

-- 2. PESTAÑA PRINCIPAL
local Tab = Window:MakeTab({
	Name = "Principal",
	Icon = "rbxassetid://4483345906",
	PremiumOnly = false
})

Tab:AddSection({
	Name = "Controles de Jugador"
})

-- Slider de Velocidad
Tab:AddSlider({
	Name = "Velocidad Sersoft",
	Min = 16,
	Max = 500,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Speed",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end    
})

-- Botón para resetear todo
Tab:AddButton({
	Name = "Resetear Personaje",
	Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
	end    
})

-- 3. PESTAÑA DE AJUSTES
local ConfigTab = Window:MakeTab({
	Name = "Ajustes",
	Icon = "rbxassetid://4483345906",
	PremiumOnly = false
})

ConfigTab:AddButton({
	Name = "Destruir HUD",
	Callback = function()
        OrionLib:Destroy()
	end    
})

-- ESTO ES LO MÁS IMPORTANTE: Inicializa la librería
OrionLib:Init()
