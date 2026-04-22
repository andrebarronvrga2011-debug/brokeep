local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Sersoft | Premium Suite",
   LoadingTitle = "Sersoft Executor v1.0",
   LoadingSubtitle = "by papita kawaii123",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "SersoftConfig", 
      FileName = "SersoftMain"
   },
   KeySystem = false 
})


local MainTab = Window:CreateTab("Jugador", 4483362458) 

local Section = MainTab:CreateSection("Movimiento")

MainTab:CreateSlider({
   Name = "Velocidad de Caminado",
   Range = {16, 300},
   Increment = 1,
   Suffix = " Speed",
   CurrentValue = 16,
   Flag = "Slider1", 
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

MainTab:CreateButton({
   Name = "Resetear Velocidad",
   Callback = function()
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
      Rayfield:Notify({
         Title = "Sersoft Notificación",
         Content = "Velocidad restaurada a la normalidad",
         Duration = 3,
         Image = 4483362458,
      })
   end,
})


local CreditsTab = Window:CreateTab("Créditos", 4483345906)
CreditsTab:CreateLabel("Creado por: papita kawaii123")
CreditsTab:CreateLabel("Versión: 1.0 Alpha")
