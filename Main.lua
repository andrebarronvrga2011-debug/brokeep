local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Sersoft | Pro Edition",
    SubTitle = "by papita kawaii123",
    TabWidth = 160, 
    Size = UDim2.fromOffset(580, 460), 
    Acrylic = false, 
    Theme = "Dark", 
    MinimizeKey = Enum.KeyCode.RightControl 
})

local Tabs = {
    Main = Window:AddTab({ Title = "Principal", Icon = "box" }),
    Combat = Window:AddTab({ Title = "Combate", Icon = "swords" }),
    Settings = Window:AddTab({ Title = "Ajustes", Icon = "settings" })
}

local bypassSpeed = false
local speedValue = 0.8 -- Valor optimizado para evitar "Signal not found"
local killAura = false
local spamAbilities = false
local selectedKey = "2"

Tabs.Main:AddSection("Movimiento")

Tabs.Main:AddSlider("WalkSpeed", {
    Title = "Velocidad Normal",
    Min = 16, Max = 200, Default = 16, Rounding = 0,
    Callback = function(Value)
        if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end
    end
})

Tabs.Main:AddToggle("Bypass", {
    Title = "Bypass Speed (Safe)",
    Default = false,
    Callback = function(Value) bypassSpeed = Value end
})

Tabs.Combat:AddSection("Ataque (Anti-Signal Error)")

Tabs.Combat:AddToggle("Killaura", {
    Title = "Kill Aura (Legit Mode)",
    Default = false,
    Callback = function(Value) killAura = Value end
})

Tabs.Combat:AddToggle("Spam", {
    Title = "Spam Abilities (Smart)",
    Default = false,
    Callback = function(Value) spamAbilities = Value end
})

Tabs.Combat:AddDropdown("Key", {
    Title = "Tecla",
    Values = {"1", "2", "3", "4", "E", "R", "F"},
    Default = "2",
    Callback = function(Value) selectedKey = Value end
})

local function CreateButton()
    if game:GetService("CoreGui"):FindFirstChild("Sersoft_Fix") then
        game:GetService("CoreGui")["Sersoft_Fix"]:Destroy()
    end

    local sg = Instance.new("ScreenGui", game:GetService("CoreGui"))
    local btn = Instance.new("TextButton", sg)
    sg.Name = "Sersoft_Fix"
    sg.DisplayOrder = 999
    
    btn.Size = UDim2.new(0, 50, 0, 50)
    btn.Position = UDim2.new(0, 10, 0.4, 0)
    btn.Text = "S"
    btn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 25
    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 12)
    
    btn.Active = true
    btn.Draggable = true

    btn.MouseButton1Click:Connect(function()
        local coreGui = game:GetService("CoreGui")
        local playerGui = game.Players.LocalPlayer.PlayerGui
        local mainGui = coreGui:FindFirstChild("Fluent") or playerGui:FindFirstChild("Fluent")
        
        if mainGui then
            mainGui.Enabled = not mainGui.Enabled
        else
            Window:Minimize()
        end
    end)
end
CreateButton()

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

task.spawn(function()
    local VIM = game:GetService("VirtualInputManager")
    while task.wait(0.4) do 
        if killAura then
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                for _, v in pairs(game.Workspace:GetChildren()) do
                    local tHum = v:FindFirstChildOfClass("Humanoid")
                    local tRoot = v:FindFirstChild("HumanoidRootPart")
                    if tHum and tRoot and v.Name ~= game.Players.LocalPlayer.Name and tHum.Health > 0 then
                  
                        if (char.HumanoidRootPart.Position - tRoot.Position).Magnitude <= 7 then
                            local tool = char:FindFirstChildOfClass("Tool")
                            if tool then tool:Activate() end
                            
                            
                            local remotes = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes") or game:GetService("ReplicatedStorage"):FindFirstChild("Events")
                            if remotes then
                                for _, r in pairs(remotes:GetDescendants()) do
                                    if r:IsA("RemoteEvent") and (r.Name:find("VFX") or r.Name:find("Hit") or r.Name:find("Damage")) then
                                        r:FireServer(v)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        
        if spamAbilities then
            local char = game.Players.LocalPlayer.Character
            local hum = char and char:FindFirstChild("Humanoid")
            
            if hum and hum:GetState() ~= Enum.HumanoidStateType.Physics then
                VIM:SendKeyEvent(true, Enum.KeyCode[selectedKey], false, game)
                task.wait(0.05)
                VIM:SendKeyEvent(false, Enum.KeyCode[selectedKey], false, game)
            end
        end
    end
end)

Window:SelectTab(1)
