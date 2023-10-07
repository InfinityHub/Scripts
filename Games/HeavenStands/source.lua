--[ Variables ]--
local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()
local plrName = game.Players.LocalPlayer.Name
function Ability()
	for _, v in pairs(game.Players.LocalPlayer.Data:GetChildren()) do
		if (v:IsA('StringValue') and v.Name == 'Ability') then
			return v.Value
		end
	end
end



--[ Library ]--
local DevTools = loadstring(game:HttpGet("https://raw.githubusercontent.com/05-4/DevTools/main/index.lua"))()
local Window = DevTools:Init({
    Name = "Infinity Hub | v1.8 | Heaven Stands",
    Title = "Infinity Hub",
    Subtitle = "by InfinityMercury",
    Icon = "rbxassetid://10723415766",
    LoadingBackgroundImage = "rbxassetid://14980847307",
    Options = {
        KillYourself = false,
        FOVAnimations = false,
    }
})



--[ Tabs ]--
local farmingTab = Window:CreateTab({
    Name = "Farming",
    Icon = ""
})
local bossTab = Window:CreateTab({
    Name = "Boss",
    Icon = ""
})
local itemsTab = Window:CreateTab({
    Name = "Items",
    Icon = ""
})
local playerTab = Window:CreateTab({
    Name = "Player",
    Icon = ""
})



--[ Script ]--
farmingTab:CreateSection("[ Farm Options ]")
farmingTab:CreateButton({
    Name = "AutoFarm Box",
    Callback = function()
        for _, v in pairs(workspace.Item_Spawnner.Box:GetChildren()) do
            if v:IsA("MeshPart") then
              for _, v in pairs(v:GetChildren()) do
                if v.Base then
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Base.CFrame wait(.25)
                  fireclickdetector(v.Base.ClickDetector); wait(.12)
                end
              end
            end
        end
    end,
})
farmingTab:CreateToggle({
    Name = "AutoFarm Take Damage",
    Callback = function(bool)
		takeDamage = bool
		while takeDamage do task.wait()
			for _, v in pairs(workspace.Enemies:GetChildren()) do
				if (v:IsA('Model') and v.Name == tostring(plrName)) then
					for _, x in pairs(v:GetChildren()) do
						if (x:IsA('Part') and x.Name == 'HumanoidRootPart') then
							x.CFrame = workspace.Enemies['just a dummy but attacking'].HumanoidRootPart.CFrame * CFrame.new(0, 0, -2.5)
						end
					end
				end
			end
		end
    end,
})
farmingTab:CreateToggle({
    Name = "AutoFarm Deal Damage",
    Callback = function(bool)
		DealDamage = bool
		while DealDamage do task.wait()
            for _, v in pairs(workspace.Enemies:GetChildren()) do
                if (v:IsA('Model') and v.Name == tostring(plrName)) then
                    for _, x in pairs(v:GetChildren()) do
                        if (x:IsA('Part') and x.Name == 'HumanoidRootPart') then
                            x.CFrame = workspace.Enemies['just a dummy'].HumanoidRootPart.CFrame * CFrame.new(0, 0, 2.5)
                        end
                    end
                end
            end
		end
    end,
})
farmingTab:CreateToggle({
    Name = "Auto Attack",
    Callback = function(bool)
		attack = bool
		while attack do task.wait()
			if (Ability() == 'Marisa Kirisame' or 'Itadori' or 'Yuta' or 'Toji' or 'Sukuna') then
				local ohEnumItem1 = Enum.UserInputType.MouseButton1
				local ohBoolean2 = true
				game:GetService("ReplicatedStorage").Remotes.Input:FireServer(ohEnumItem1, ohBoolean2)
			else
				local ohString1 = "MouseButton1"
				game:GetService("ReplicatedStorage").Remote_Events.Input_Remote:InvokeServer(ohString1)
			end
		end
    end,
})
farmingTab:CreateSection("[ Player Farm Options ]")
local playerName = '';
farmingTab:CreateLargeInput({
	Name = "Enter Player Name",
	Callback = function(text)
		playerName = text
	end,
})
farmingTab:CreateToggle({
    Name = "Ability",
    Callback = function(bool)
        getgenv().UseAbility = bool
		print(getgenv().UseAbility)
    end,
})
farmingTab:CreateToggle({
    Name = "Start Farming Player",
    Callback = function(bool)
		farmPlayer = bool
		while farmPlayer do task.wait()
			for _, v in pairs(game:GetService('Players'):GetChildren()) do
				if (v.Name ~= game:GetService('Players').LocalPlayer.Name) then
					if (v.Name == tostring(playerName)) then
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,2.2)
						if getgenv().UseAbility then
							local ohString1 = "MouseButton1"			
							game:GetService("ReplicatedStorage").Remote_Events.Input_Remote:InvokeServer(ohString1)

							local ohEnumItem1 = Enum.UserInputType.MouseButton1
							local ohBoolean2 = true
							game:GetService("ReplicatedStorage").Remotes.Input:FireServer(ohEnumItem1, ohBoolean2)
						end
					end
				end
			end
		end
    end,
})
farmingTab:CreateButton({
    Name = "Get Players Name",
    Callback = function()
		local players = game:GetService('Players'):GetChildren()
		for _, v in next, players do
			if (v.Name ~= tostring(plrName)) then
				Notification:Notify({
					Title = "Infinity Hub | Players Name", Description = v.Name},
					{OutlineColor = Color3.fromRGB(80, 80, 80),Time = 20, Type = "option"},
					{Image = "http://www.roblox.com/asset/?id=7072706001", ImageColor = Color3.fromRGB(255, 84, 84), Callback = function(State)
						 if (State) then
							setclipboard(tostring(v.Name))
						 end
					end
				})
			end
		end
	end,
})


bossTab:CreateSection('[ Boss Farm Options ]')
local bossesName = {'Garou', 'Silver Chariot Requiem', 'DIO'}
for _, v in next, bossesName do
	bossTab:CreateButton({
		Name = 'InstaKill '..v,
		Callback = function()
			local Mob = v
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
			for i,v in pairs(workspace.Enemies[v]:GetDescendants()) do
				if (v:IsA('Highlight')) then
					v:Destroy()
				end
			end
			local ohString1 = "MouseButton1"
			game:GetService("ReplicatedStorage").Remote_Events.Input_Remote:InvokeServer(ohString1)

			local ohEnumItem1 = Enum.UserInputType.MouseButton1
			local ohBoolean2 = true
			game:GetService("ReplicatedStorage").Remotes.Input:FireServer(ohEnumItem1, ohBoolean2)
			wait(.5)
			workspace.Enemies[v].Head:Destroy()
		end,
	})
end


itemsTab:CreateSection('[ Items Sell Options ]')
local items = {'Arrow', 'Rokakaka', "Eye's of Saint's Corpse", 'Hamon Technics', 'Mystery Arrow', 'Stone Mask'}
for _, v in next, items do
	itemsTab:CreateToggle({
		Name = "Sell "..v,
		Callback = function(bool)
			if bool then
				Notification:Notify(
					{Title = "Infinity Hub | Error", Description = "Sell item in soon... item: "..v},
					{OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "image"},
					{Image = "http://www.roblox.com/asset/?id=7072706001", ImageColor = Color3.fromRGB(255, 255, 255)}
				)
			end
		end,
	})
end


playerTab:CreateSection('[ Player Options ]')
playerTab:CreateToggle({
	Name = "Disable Character Functions",
	Callback = function(bool)
		dcf = bool
		while dcf do task.wait()
			local findScript = {'CharacterFunctions', 'Character_Functions'}
			for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
				if (v:IsA('LocalScript') and table.find(findScript, v.Name)) then
					v.Enabled = false
				end
			end
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 30
		end
	end,
})
playerTab:CreateButton({
	Name = 'Kill Yourself',
	Callback = function()
		game:GetService('Players').LocalPlayer.Character.Head:Destroy()
	end,
})
playerTab:CreateSlider({
	Name = "WalkSpeed",
	Suffix = "Speed",
	Range = {16, 500},
	Interval = 1,
	Default = 16,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end,
})
playerTab:CreateSlider({
	Name = "JumPower",
	Suffix = "Jump",
	Range = {50, 500},
	Interval = 1,
	Default = 50,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end,
})
