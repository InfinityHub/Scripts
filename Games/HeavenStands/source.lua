--// Library
local plrName = game.Players.LocalPlayer.Name
function GetPlayers()
    for _, v in pairs(workspace.Enemies:GetChildren()) do
        if (v:IsA('Model') and v.Name == tostring(plrName)) then
            return v
        end
    end
end



--// Library
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/VisualRoblox/Roblox/main/UI-Libraries/Visual%20Command%20UI%20Library/Source.lua', true))()
local Window = Library:CreateWindow({
    Name = 'Infinity Hub | Command Bar (-)',
    IntroText = 'Infinity Hub | '..game:GetService('MarketplaceService'):GetProductInfo(game.PlaceId).Name,
    IntroIcon = 'rbxassetid://10723415766',
    IntroBlur = true,
    IntroBlurIntensity = 15,
    Theme = Library.Themes.nordicdark,
    Position = 'bottom',
    Draggable = true,
    Prefix = "-"
})
Window:CreateNotification('Welcome to Infinity Hub', "Prefix: -", 5)



--// Code
Window:AddCommand('FarmBox', {}, 'Collect all box in map', function(Arguments)
    for _, v in pairs(workspace.Item_Spawnner.Box:GetChildren()) do
        if v:IsA("MeshPart") then
          for _, v in pairs(v:GetChildren()) do
            if v.Base then
              game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Base.CFrame wait(.25)
              fireclickdetector(v.Base.ClickDetector);
            end
          end
        end
    end
end)
Window:AddCommand('InstaKill', {'Mob Name'}, 'Insta kill mob selected', function(Arguments)
    for _, v in pairs(workspace.Enemies:GetChildren()) do
        if (v:IsA('Model') and v.Name == 'Silver Chariot Requiem') then
            v.Name = 'SilverChariotRequiem'
        end
    end wait(.25)

    local Mob = Arguments[1]
    task.spawn(function()
        repeat task.wait()
            Enemies = workspace.Enemies:GetChildren()
            for i = 1, #Enemies do
                local v = Enemies[i]
                if v.Name == Mob and v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChildOfClass("Humanoid").Health > 0 then
                    game.Players.LocalPlayer.Character.PrimaryPart.CFrame = CFrame.new(v.PrimaryPart.Position + Vector3.new(0, 7, 0), v.PrimaryPart.Position)
                end
            end
        until 1+1==2
    end)
    for i,v in pairs(workspace.Enemies[Arguments[1]]:GetDescendants()) do
        if (v:IsA('Highlight')) then
            v:Destroy()
        end
    end
    local ohString1 = "MouseButton1"
    game:GetService("ReplicatedStorage").Remote_Events.Input_Remote:InvokeServer(ohString1)
    wait(.25)
    workspace.Enemies[Arguments[1]].Head:Destroy()
end)
Window:AddCommand('MobsName', {}, 'Notify all mobs name', function(Arguments)
    Window:CreateNotification('Infinity Hub | Mobs', 'DIO, Garou, Vergil, SilverChariotRequiem, Sakuya Izayoi', 12)
end)
Window:AddCommand('DisableCharacterFunctions', {}, 'Disable character functions', function(Arguments)
    game.Players.LocalPlayer.Character.Character_Functions.Enabled = false
end)
Window:AddCommand('TakeDamage', {'true / false'}, 'Starts an automatic farm to farm take damage to complete tasks.', function(Arguments)
    method = Arguments[1]
    if (method == 'true') then
        task.spawn(function()
            repeat task.wait()
                for _, v in pairs(workspace.Enemies:GetChildren()) do
                    if (v:IsA('Model') and v.Name == tostring(plrName)) then
                        for _, x in pairs(v:GetChildren()) do
                            if (x:IsA('Part') and x.Name == 'HumanoidRootPart') then
                                x.CFrame = workspace.Enemies['S:Diavolo Attacking'].HumanoidRootPart.CFrame * CFrame.new(0, 0, -2.5)
                            end
                        end
                    end
                end
            until method == 'false'
        end)
    end
end)
Window:AddCommand('DealDamage', {'true / false / start'}, 'Starts an automatic farm to farm take damage to complete tasks.', function(Arguments)
    method = Arguments[1]
    if (method == 'true') then
        repeat task.wait()
            Enemies = workspace.Enemies:GetChildren()
            for i = 1, #Enemies do
                local v = Enemies[i]
                if v.Name == 'S:Diavolo Dummy' and v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChildOfClass("Humanoid").Health > 0 then
                    game.Players.LocalPlayer.Character.PrimaryPart.CFrame = CFrame.new(v.PrimaryPart.Position + Vector3.new(0, 7, 0), v.PrimaryPart.Position)
                end
            end
        until method == 'false'
    end
    if (method == 'start') then
        repeat task.wait()
            local ohString1 = "MouseButton1"
            game:GetService("ReplicatedStorage").Remote_Events.Input_Remote:InvokeServer(ohString1)
        until method == 'false'
    end
end)
