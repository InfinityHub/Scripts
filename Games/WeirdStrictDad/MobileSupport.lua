-- Library Settings
local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()
local w = library:CreateWindow("Weird Strict Dad")


-- Code
local farm = w:CreateFolder("Farming")
farm:Toggle("Inf Stamina",function(bool)
    infStamina = bool
    while infStamina do task.wait()
        game:GetService("Players").LocalPlayer.PlayerGui.Time.Frame.stamina.Value = 250
    end
end)
farm:Toggle("Inf Oxygen",function(bool)
    infOxygen = bool
    while infOxygen do task.wait()
        game:GetService("Players").LocalPlayer.Oxygen.Value = 100
    end
end)
farm:Toggle("Inf Hunger",function(bool)
    infHunger = bool
    while infHunger do task.wait()
        game:GetService("Players").LocalPlayer.Hunger.Value = 100
    end
end)
farm:Slider("WalkSpeed",{min = 16, max = 500, precise = true}, function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)
farm:Slider("JumpPower",{min = 16, max = 500, precise = true}, function(value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
end)


local quest = w:CreateFolder("Quest Solo")
quest:Button("Auto Trashes",function()
    for _, v in pairs(workspace:GetDescendants()) do
        if (v:IsA('ProximityPrompt')) then
            v.HoldDuration = 0
        end
    end
    for _, v in pairs(workspace.Game.trashes:GetChildren()) do
        if (v:IsA('Part')) then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame wait(.2)
            fireproximityprompt(v.ProximityPrompt)
            wait(.5)
        end
    end
end)
quest:Button("Auto Noddle",function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
    for _, v in pairs(workspace:GetDescendants()) do
        if (v:IsA('ProximityPrompt')) then
            v.HoldDuration = 0
        end
    end wait(.2)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-123.446777, 5.25002289, 16.9941177, 0.98541224, -2.90156059e-08, -0.17018424, 2.89211322e-08, 1, -3.03417025e-09, 0.17018424, -1.93201255e-09, 0.98541224) wait(.2)
    fireproximityprompt(workspace.House.Rooms.Kitchen.FridgeNoodles.Primary.ProximityPrompt)
    wait(.5)
    for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if (v:IsA('Tool') and v.Name == 'Raw Noodle') then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v);
        end
    end
    wait(.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-111.192451, 5.25002193, 16.7079735, 0.996420801, -4.88962426e-09, 0.0845316201, -2.75688639e-10, 1, 6.10934237e-08, -0.0845316201, -6.0898067e-08, 0.996420801) wait(.2)
    fireproximityprompt(workspace.House.Rooms.Kitchen.Stove.Primary.ProximityPrompt)
    wait(.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-103.8825, 5.25002193, 27.8194599, -0.0570342243, 6.15510629e-08, 0.998372197, 7.97950861e-08, 1, -5.70929473e-08, -0.998372197, 7.64089449e-08, -0.0570342243) wait(.2)
    fireproximityprompt(workspace.House.Rooms.Kitchen.DiningTable.Noodles.DadPlate.Plate.ProximityPrompt)

    wait(.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-123.446777, 5.25002289, 16.9941177, 0.98541224, -2.90156059e-08, -0.17018424, 2.89211322e-08, 1, -3.03417025e-09, 0.17018424, -1.93201255e-09, 0.98541224) wait(.2)
    fireproximityprompt(workspace.House.Rooms.Kitchen.FridgeNoodles.Primary.ProximityPrompt)
    wait(.5)
    for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if (v:IsA('Tool') and v.Name == 'Raw Noodle') then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v);
        end
    end
    wait(.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-111.192451, 5.25002193, 16.7079735, 0.996420801, -4.88962426e-09, 0.0845316201, -2.75688639e-10, 1, 6.10934237e-08, -0.0845316201, -6.0898067e-08, 0.996420801) wait(.2)
    fireproximityprompt(workspace.House.Rooms.Kitchen.Stove.Primary.ProximityPrompt)
    wait(.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-122.881134, 5.25002289, 28.5118713, 0.00392936496, 1.03396616e-08, -0.999992251, -8.66304362e-09, 1, 1.03057003e-08, 0.999992251, 8.62248228e-09, 0.00392936496) wait(.2)
    fireproximityprompt(workspace.House.Rooms.Kitchen.DiningTable.Noodles.Plate.Plate.ProximityPrompt)
    wait(.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-120.030167, 5.29257011, 28.4466801, 0, 0, -1, 0, 1, 0, 1, 0, 0)
    wait(.2) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed=16
end)
quest:Button("Auto Refill",function()
    for _, v in pairs(workspace:GetDescendants()) do
        if (v:IsA('ProximityPrompt')) then
            v.HoldDuration = 0
        end
    end
    for _, v in pairs(workspace.House.GasCans:GetChildren()) do
        if (v:IsA('Model') and v.Name == 'GasCan') then
            for _, x in pairs(v:GetDescendants()) do
                if (x:IsA('ProximityPrompt')) then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = x.Parent.CFrame wait(.25)
                    fireproximityprompt(x) wait(.5)
                    for _, Tool in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if Tool:IsA('Tool') and Tool.Name == 'gas can' then
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool)
                        end
                    end wait(.5)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(
                        -157.453751, 5.25002289, 48.3504066, 0.0231024306, 1.21808286e-09, 0.99973309, -4.12855394e-09, 1, -1.12300291e-09, -0.99973309, -4.10150802e-09, 0.0231024306
                    ) fireproximityprompt(workspace.House.Generator.Button.ProximityPrompt) return
                end
            end
        end
    end
end)
quest:Button("Auto Bedroom",function()
    for _, v in pairs(workspace:GetDescendants()) do
        if (v:IsA('ProximityPrompt')) then
            v.HoldDuration = 0
        end
    end
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-127.453239, 18.859787, 41.2493134, 0.0207649581, 3.62811114e-08, 0.99978441, -6.9179471e-08, 1, -3.48521176e-08, -0.99978441, -6.84408477e-08, 0.0207649581)
    wait(1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-138.76326, 18.2500038, 46.5630074, -0.0316168889, -4.31394476e-08, 0.999500036, 8.45435508e-08, 1, 4.58353675e-08, -0.999500036, 8.59504539e-08, -0.0316168889) wait(.2)
    for _, v in pairs(workspace.House.Rooms.Bedroom.Remote:GetDescendants()) do
        if (v:IsA('ProximityPrompt')) then
            fireproximityprompt(v)
        end
    end
end)
quest:Button("Auto Lights",function()
    for _, v in pairs(workspace:GetDescendants()) do
        if (v:IsA('ProximityPrompt')) then
            v.HoldDuration = 0
        end
    end
    for _, v in pairs(workspace.House.Lights:GetDescendants()) do
        if (v:IsA('BoolValue') and v.Name == 'Active') then
            if (v.Value == true) then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.Switch.Prompt.CFrame wait(.5)
                fireproximityprompt(v.Parent.Switch.Prompt.ProximityPrompt)
                wait(1)
            end
        end
    end
end)
quest:Button("Auto Tv",function()
    for _, v in pairs(workspace:GetDescendants()) do
        if (v:IsA('ProximityPrompt')) then
            v.HoldDuration = 0
        end
    end
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Game.Remote.CFrame wait(.2)
    fireproximityprompt(workspace.Game.Remote.ProximityPrompt)
end)
quest:Button("Auto Check Dad",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-103.160576, 5.35102463, 40.1684914, 0.00236101169, -4.79200111e-08, -0.999997199, 7.12295645e-08, 1, -4.77519713e-08, 0.999997199, -7.11166237e-08, 0.00236101169) wait(.2)
    fireproximityprompt(workspace.House.Doors.FrontDoor.Door.Door1.ProximityPrompt) wait(.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-118, 19, 53) wait(.2)
    fireproximityprompt(workspace.House.Rooms.Bedroom.Computer.Monitor.ProximityPrompt)
end)


local Survival = w:CreateFolder("Survival")
Survival:Toggle("Auto Sleep",function(bool)
    sleep = bool
    while sleep do task.wait()
        for _, v in pairs(workspace.Game.dad:GetChildren()) do
            if (v:IsA('Model') and v.Name == 'PossesedDad') then
                local notify = v.ChaseDoor
                if (notify.Value == true) then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-113, 21, 38) wait(.2)
                    fireproximityprompt(workspace.House.Rooms.Bedroom.Beds.Bed.Primary.ProximityPrompt)
                end
            end
        end
    end
end)
Survival:Toggle("Auto Feed",function(bool)
    feed = bool
    while feed do task.wait()
        local hungerValue = game:GetService("Players").LocalPlayer.Hunger.Value
        if (hungerValue <= 10) then
            for _, v in pairs(workspace:GetDescendants()) do
                if (v:IsA('ProximityPrompt')) then
                    v.HoldDuration = 0
                end
            end wait(.2)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-123.446777, 5.25002289, 16.9941177, 0.98541224, -2.90156059e-08, -0.17018424, 2.89211322e-08, 1, -3.03417025e-09, 0.17018424, -1.93201255e-09, 0.98541224) wait(.2)
            fireproximityprompt(workspace.House.Rooms.Kitchen.FridgeNoodles.Primary.ProximityPrompt)
            wait(.5)
            for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if (v:IsA('Tool') and v.Name == 'Raw Noodle') then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v);
                end
            end
            wait(.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-111.192451, 5.25002193, 16.7079735, 0.996420801, -4.88962426e-09, 0.0845316201, -2.75688639e-10, 1, 6.10934237e-08, -0.0845316201, -6.0898067e-08, 0.996420801) wait(.2)
            fireproximityprompt(workspace.House.Rooms.Kitchen.Stove.Primary.ProximityPrompt)
            wait(.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-122.881134, 5.25002289, 28.5118713, 0.00392936496, 1.03396616e-08, -0.999992251, -8.66304362e-09, 1, 1.03057003e-08, 0.999992251, 8.62248228e-09, 0.00392936496) wait(.2)
            fireproximityprompt(workspace.House.Rooms.Kitchen.DiningTable.Noodles.Plate.Plate.ProximityPrompt)
            wait(.5)
            fireproximityprompt(workspace.House.Rooms.Kitchen.DiningTable.Noodles.Plate.Plate.ProximityPrompt)
            wait(5)
        end
    end
end)
Survival:Toggle("Esp Dad",function(bool)
    espDad = bool
    if (espDad) then
        local esp = Instance.new('Highlight')
        esp.Name = 'Infhub_ESP'
        esp.Parent = workspace.Game.dad.PossesedDad
    else
        for _, v in pairs(workspace:GetDescendants()) do
            if (v:IsA('Highlight') and v.Name == 'Infhub_ESP') then
                v:Destroy()
            end
        end
    end
end)
Survival:Button("Refil generator",function()
    for _, v in pairs(workspace.House.GasCans:GetChildren()) do
        if (v:IsA('Model') and v.Name == 'GasCan') then
            for _, x in pairs(v:GetDescendants()) do
                if (x:IsA('ProximityPrompt')) then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = x.Parent.CFrame
                    fireproximityprompt(x) wait(.2)
                    for _, Tool in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if Tool:IsA('Tool') and Tool.Name == 'gas can' then
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool)
                        end
                    end wait(.2)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-157.453751, 5.25002289, 48.3504066, 0.0231024306, 1.21808286e-09, 0.99973309, -4.12855394e-09, 1, -1.12300291e-09, -0.99973309, -4.10150802e-09, 0.0231024306) wait(.2)
                    fireproximityprompt(workspace.House.Generator.Button.ProximityPrompt) wait(.2)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-127.453239, 18.859787, 41.2493134, 0.0207649581, 3.62811114e-08, 0.99978441, -6.9179471e-08, 1, -3.48521176e-08, -0.99978441, -6.84408477e-08, 0.0207649581) wait(.2)
                    return
                end
            end
        end
    end
end)
