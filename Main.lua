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
    Combat = Window:AddTab({ Title = "Combate Pro", Icon = "swords" }),
    Settings = Window:AddTab({ Title = "Ajustes", Icon = "settings" })
}


local bypassSpeed = false
local killAura = false
local spamAbilities = false
local selectedKey = "2"


Tabs.Combat:AddSection("Auto-Combo (Bypass)")

Tabs.Combat:AddToggle("Killaura", {
    Title = "Kill Aura Seguro",
    Description = "Ataca con delay para evitar el 'Invalid Action'",
    Default = false,
    Callback = function(Value) killAura = Value end
})

Tabs.Combat:AddToggle("Spam", {
    Title = "Spam Ability (Smart)",
    Description = "Spamea sin ser incapacitado",
    Default = false,
    Callback = function(Value) spamAbilities = Value end
})

Tabs.Combat:AddDropdown("Key", {
    Title = "Tecla",
    Values = {"1", "2", "3", "4", "E", "R"},
    Default = "2",
    Callback = function(Value) selectedKey = Value end
})


task.spawn(function()
    local VIM = game:GetService("VirtualInputManager")
    while task.wait() do
        if killAura or spamAbilities then
            local char = game.Players.LocalPlayer.Character
            local hum = char and char:FindFirstChild("Humanoid")
            
            
            if hum and hum.Health > 0 and hum:GetState() ~= Enum.HumanoidStateType.Physics then
                
                if killAura then
                    
                    local tool = char:FindFirstChildOfClass("Tool")
                    if tool then
                        tool:Activate()
                        task.wait(0.3) 
                    end
                end
                
                if spamAbilities then
                    
                    VIM:SendKeyEvent(true, Enum.KeyCode[selectedKey], false, game)
                    task.wait(0.05)
                    VIM:SendKeyEvent(false, Enum.KeyCode[selectedKey], false, game)
                    task.wait(0.4) 
                end
            end
        end
    end
end)


local function CreateToggle()
    local sg = Instance.new("ScreenGui", game.CoreGui)
    local btn = Instance.new("TextButton", sg)
    btn.Size = UDim2.new(0, 50, 0, 50)
    btn.Position = UDim2.new(0, 10, 0.5, 0)
    btn.Text = "S"
    btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    btn.TextColor3 = Color3.new(1,1,1)
    local corner = Instance.new("UICorner", btn)
    
    btn.MouseButton1Click:Connect(function()
        if game.CoreGui:FindFirstChild("Fluent") then
            game.CoreGui.Fluent.Enabled = not game.CoreGui.Fluent.Enabled
        end
    end)
end
CreateToggle()

Window:SelectTab(1)
