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

-- 4. CONTENIDO DE LA PESTAÑA "INICIO"
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

