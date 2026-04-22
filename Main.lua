print("¡Spark Hub cargado correctamente!")
game.StarterGui:SetCore("SendNotification", {
    Title = "Spark Hub";
    Text = "Hola, " .. game.Players.LocalPlayer.Name .. ". El script está activo.";
    Duration = 5;
})
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
