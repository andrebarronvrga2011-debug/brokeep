local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- 1. CONFIGURACIÓN DEL MENÚ (Identidad de Sersoft)
local Window = Fluent:CreateWindow({
    Title = "Sersoft | Professional Edition",
    SubTitle = "by papita kawaii123",
    TabWidth = 160, -- El ancho de la barra lateral como en la imagen
    Size = UDim2.fromOffset(580, 460), -- Tamaño similar a la imagen
    Acrylic = false, -- Desactiva la transparencia borrosa para un color sólido
    Theme = "Dark", -- Tema oscuro
    MinimizeKey = Enum.KeyCode.RightControl -- Tecla alternativa para minimizar
})

-- 2. BOTÓN FLOTANTE (Para abrir/cerrar)
-- Fluent crea automáticamente un botón flotante pequeño para móviles y PC.
-- Si prefieres usar una tecla, la configuramos arriba (por defecto es Right Control).

-- 3. PESTAÑAS (La barra lateral lateral)
-- Fluent incluye los iconos que ves en la imagen (Lucide Icons)
local Tabs = {
    Home = Window:AddTab({ Title = "Inicio", Icon = "home" }),
    Main = Window:AddTab({ Title = "Principal", Icon = "box" }), -- Icono similar a la imagen
    Automation = Window:AddTab({ Title = "Automatización", Icon = "zap" }),
    Settings = Window:AddTab({ Title = "Ajustes", Icon = "settings" })
}

-- 4. CONTENIDO DE LA PESTAÑA "INICIO"
Tabs.Home:AddParagraph({
    Title = "Bienvenido a Sersoft",
    Content = "Menú optimizado. Usa la barra lateral para navegar."
})

-- 5. CONTENIDO DE LA PESTAÑA "PRINCIPAL" (Replicando los botones)
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

-- 6. CONTENIDO DE LA PESTAÑA "AUTOMATIZACIÓN" (Replicando la lista)
Tabs.Automation:AddSection("Automatizaciones Activas")

-- Ejemplo de un botón que simula el de la imagen
Tabs.Automation:AddButton({
    Title = "Recolección Automática",
    Description = "Recoge objetos cercanos",
    Callback = function()
        print("Sersoft: Recolección automática iniciada.")
        -- Aquí iría la lógica de tu script
    end
})

-- 7. INICIALIZACIÓN
Window:SelectTab(1) -- Empieza en la pestaña Inicio

-- Configuración del botón flotante para que sea un cuadro negro minimalista
-- Fluent lo maneja por defecto, pero puedes configurarlo en los ajustes.
