-- variables
local plr = game:GetService("Players").LocalPlayer
local plrId = plr.UserId
local mouse = plr:GetMouse()
local CheckSpeed = plr.Character.Humanoid.WalkSpeed
local CheckJump = plr.Character.Humanoid.JumpPower
local CheckHealth = plr.Character.Humanoid.Health
local hrp = plr.Character.HumanoidRootPart
local function CheckStand()
	for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
		if v:IsA("LocalScript") and v.Name ~= "ResetLighting" then
			print(v)
		end
	end
end
local ts = game:GetService("Lighting").TS
local function getWorkspaceTools()
	local wsTools = {}
	for i, v in pairs(game.Workspace:GetDescendants()) do
		if v:IsA("Tool") and game.Players:GetPlayerFromCharacter(v.Parent) == nil then
			if v:findFirstChild("Handle") or v:FindFirstChildOfClass("Part") or v:FindFirstChildOfClass("MeshPart") or v:findFirstChildOfClass("UnionOperation") then
				table.insert(wsTools, v)
			end
		end
	end
	return wsTools
end
local StandsFarmName = {
    "Anubis",
    "D4C",
    "OMT",
    "CrazyDiamond",
    "DoppioKingCrimson",
    "KillerQueen",
    "GoldExperience",
    "StarPlatinum",
    "StarPlatinumTW",
    "TheWorld",
    "HierophantGreen",
    "Whitesnake",
    "TheWorldAlternateUniverse",
    "WhitesnakeAU",
    "KingCrimsonAU",
    "SoftAndWetShiny",
    "StarPlatinumOVA",
    "TheWorldOVA",
    "NTWAU",
    "CreeperQueen",
    "SPTW",
    "StickyFingers",
    "SoftAndWet"
}
local function EquipTool(ToolName)
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA('Tool') and v.Name == ToolName then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v);
        end
    end
end
local function FireTool(ToolName)
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v.Name == ToolName then
            v.Parent = game.Players.LocalPlayer.Character
        end
     end
    for i,v in pairs (game.Players.LocalPlayer.Character:GetChildren()) do
        if v.Name == ToolName then
            v:Activate()
        end
    end
end



-- libray
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local Window = Fluent:CreateWindow({
    Title = "Infinity Hub | Stands Awakening",
    SubTitle = "by InfinityMercury",
    TabWidth = 90,
    Size = UDim2.fromOffset(462,382),
    Acrylic = false,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.J
})
local Options = Fluent.Options



-- tabs
local Tabs = {
    Stands = Window:AddTab({ Title = "Stands", Icon = "rbxassetid://14665259254" }),
    Combat = Window:AddTab({ Title = "Combat", Icon = "rbxassetid://14665357974" }),
    Farming = Window:AddTab({ Title = "Farming", Icon = "rbxassetid://14671431658" }),
    FeOptions = Window:AddTab({ Title = "FeOptions", Icon = "rbxassetid://7733774602" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}



-- code
Tabs.Stands:AddSection('15 seconds TS')
Tabs.Stands:AddButton({
    Title = "shadowdio",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Main.Timestop:FireServer(20, "shadowdio")
    end
})
Tabs.Stands:AddButton({
    Title = "jotaro",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Main.Timestop:FireServer(20, "jotaro")
    end
})
Tabs.Stands:AddButton({
    Title = "diooh",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Main.Timestop:FireServer(20, "diooh")
    end
})
Tabs.Stands:AddButton({
    Title = "diego",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Main.Timestop:FireServer(20, "diego")
    end
})
Tabs.Stands:AddButton({
    Title = "theworldnew",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Main.Timestop:FireServer(20, "theworldnew")
    end
})
Tabs.Stands:AddSection('Others Options')
Tabs.Stands:AddButton({
    Title = "Infinite Damage Reflect",
    Description = "",
    Callback = function()
        local ohString1 = "Alternate"
		local ohString2 = "RTZ"
		local ohBoolean3 = true
		game:GetService("ReplicatedStorage").Main.Input:FireServer(ohString1, ohString2, ohBoolean3)
    end
})
Tabs.Stands:AddButton({
    Title = "Shadow Dio H (inf)",
    Description = "",
    Callback = function()
        local args = {
            [1] = "Alternate",
            [2] = "STWRTZ",
            [3] = true
      }
      game:GetService("ReplicatedStorage").Main.Input:FireServer(unpack(args))
    end
})
Tabs.Stands:AddButton({
    Title = "STW 100 Kinifes ",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Alonebr/Sad-GuiV3/main/Shadow%20Inf%20Kinifes'))()
    end
})
Tabs.Stands:AddButton({
    Title = "Kill Player (Sans)",
    Description = "",
    Callback = function()
		local args = {
			[1] = "Alternate",
			[2] = "Teleport",
			[3] = false,
			[4] = Vector3.new(90000,90000,90000)
		}
		game:GetService("ReplicatedStorage").Main.Input:FireServer(unpack(args))
    end
})
Tabs.Stands:AddButton({
    Title = "Reset Universe (MIH)",
    Description = "",
    Callback = function()
        local args = {
	        [1] = "Alternate",
	        [2] = "UniverseReset"
        }
	    game:GetService("ReplicatedStorage").Main.Input:FireServer(unpack(args))
    end
})



local AutoBlockToggle = Tabs.Combat:AddToggle("AutoBlockValue", {Title = "Auto Block", Default = false })
AutoBlockToggle:OnChanged(function(bool)
    AutoBlockBool = bool
    while AutoBlockBool do task.wait()
        local args = {
            [1] = "Alternate",
            [2] = "Block"
        }
        game:GetService("ReplicatedStorage").Main.Input:FireServer(unpack(args))
    end
end)
local AntiTsToggle = Tabs.Combat:AddToggle("AntiTsValue", {Title = "Anti Time Stop", Default = false })
AntiTsToggle:OnChanged(function(bool)
    AntiTsBool = bool
    while AntiTsBool do task.wait()
        for i,v in pairs(game:GetService("Lighting"):GetChildren()) do
            if v:IsA("BoolValue") and v.Name == "TS" then
                if ts.Value == true then
                    wait(1)
                    ts.Value = false
                end
            end
        end
    end
end)
local AntiDiscToggle = Tabs.Combat:AddToggle("AntiDiscValue", {Title = "Anti Disc", Default = false })
AntiDiscToggle:OnChanged(function(bool)
    AntiDiscBool = bool
    while AntiDiscBool do task.wait()
        for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("BoolValue") and v.Name == "Disabled" then
                if v.Value == true then wait(.25)
                    v.Value = false
                end
            end
        end
    end
end)
Tabs.Combat:AddButton({
    Title = "Pose Effect",
    Description = "",
    Callback = function()
		local args = {
			[1] = true
		}
		game:GetService("ReplicatedStorage").Main.Menacing:FireServer(unpack(args))
    end
})
Tabs.Combat:AddSection('Others')
local Slider = Tabs.Combat:AddSlider("Slider", {
    Title = "WalkSpeed",
    Description = "WalkSpeed control",
    Default = 16,
    Min = 16,
    Max = 500,
    Rounding = 1,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
})
local Slider = Tabs.Combat:AddSlider("Slider", {
    Title = "JumpPower",
    Description = "JumpPower control",
    Default = 50,
    Min = 50,
    Max = 500,
    Rounding = 1,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
    end
})


Tabs.Farming:AddSection('Stand Farm')
getgenv().WantedStand = ""
getgenv().DelayInSeconds = 8
getgenv().Webhook = ""
local Input = Tabs.Farming:AddInput("Input", {
    Title = "Stand Wanted: ",
    Default = "",
    Placeholder = "...",
    Numeric = false,
    Finished = false,
    Callback = function(Value)
        getgenv().WantedStand = Value
    end
})
Tabs.Farming:AddButton({
    Title = "Start Farm",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/asdlkasndklsa/StandFarm/main/StandFarm'))()
    end
})
local StandNameFarm = Tabs.Farming:AddDropdown("Dropdown", {
    Title = "Stands Name:",
    Values = StandsFarmName,
    Multi = false,
    Default = 1,
})
StandNameFarm:OnChanged(function(Value)
    setclipboard(tostring(Value))
    Fluent:Notify({
        Title = "Copied!",
        Content = "",
        SubContent = "",
        Duration = 5
    })
end)
Tabs.Farming:AddSection('Item Farm')
local GrabToolsToggle = Tabs.Farming:AddToggle("GrabToolsBool", {Title = "Grab Tools", Default = false })
GrabToolsToggle:OnChanged(function(bool)
    GrabTools = bool
    while GrabTools do task.wait(1)
        for i,v in pairs(workspace:GetChildren()) do
            if v:IsA('Tool') then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
            end
        end
    end
end)


Tabs.FeOptions:AddButton({
    Title = "Fe Invisible",
    Description = "",
    Callback = function()
        local offset = 1100 --how far you are away from your camera when invisible
        local LocalPlayer = game.Players.LocalPlayer
        local Backpack = LocalPlayer.Backpack
        local Character = LocalPlayer.Character
        local invisible = false
        local grips = {}
        local heldTool
        local gripChanged
        local handle
        local weld
        function setDisplayDistance(distance)
           for _,player in pairs(game.Players:GetPlayers()) do if player.Character and player.Character:FindFirstChildWhichIsA("Humanoid") then player.Character:FindFirstChildWhichIsA("Humanoid").NameDisplayDistance = distance player.Character:FindFirstChildWhichIsA("Humanoid").HealthDisplayDistance = distance end end
        end
        local tool = Instance.new("Tool", Backpack)
        tool.Name = "Ghostify [Disabled]"
        tool.RequiresHandle = false
        tool.CanBeDropped = false
        tool.Equipped:Connect(function() wait()
           if not invisible then
               invisible = true
               tool.Name = "Ghostify [Enabled]"
               if handle then handle:Destroy() end if weld then weld:Destroy() end
               handle = Instance.new("Part", workspace) handle.Name = "Handle" handle.Transparency = 1 handle.CanCollide = false handle.Size = Vector3.new(2, 1, 1)
               weld = Instance.new("Weld", handle) weld.Part0 = handle weld.Part1 = Character.HumanoidRootPart weld.C0 = CFrame.new(0, offset-1.5, 0)
               setDisplayDistance(offset+100)
               workspace.CurrentCamera.CameraSubject = handle
               Character.HumanoidRootPart.CFrame = Character.HumanoidRootPart.CFrame * CFrame.new(0, offset, 0)
               Character.Humanoid.HipHeight = offset
               Character.Humanoid:ChangeState(11)
               for _,child in pairs(Backpack:GetChildren()) do if child:IsA("Tool") and child ~= tool then grips[child] = child.Grip end end
           elseif invisible then
               invisible = false
               tool.Name = "Ghostify [Disabled]"
               if handle then handle:Destroy() end if weld then weld:Destroy() end
               for _,child in pairs(Character:GetChildren()) do if child:IsA("Tool") then child.Parent = Backpack end end
               for tool,grip in pairs(grips) do if tool then tool.Grip = grip end end
               heldTool = nil
               setDisplayDistance(100)
               workspace.CurrentCamera.CameraSubject = Character.Humanoid
               Character.Animate.Disabled = false
               Character.HumanoidRootPart.CFrame = Character.HumanoidRootPart.CFrame * CFrame.new(0, -offset, 0)
               Character.Humanoid.HipHeight = 0
               Character.Humanoid:ChangeState(11)
           end
           tool.Parent = Backpack
        end)
        Character.ChildAdded:Connect(function(child) wait()
           if invisible and child:IsA("Tool") and child ~= heldTool and child ~= tool then
               heldTool = child
               local lastGrip = heldTool.Grip
               if not grips[heldTool] then grips[heldTool] = lastGrip end
               for _,track in pairs(Character.Humanoid:GetPlayingAnimationTracks()) do track:Stop() end
               Character.Animate.Disabled = true
               heldTool.Grip = heldTool.Grip*(CFrame.new(0, offset-1.5, 1.5) * CFrame.Angles(math.rad(-90), 0, 0))
               heldTool.Parent = Backpack
               heldTool.Parent = Character
               if gripChanged then gripChanged:Disconnect() end
               gripChanged = heldTool:GetPropertyChangedSignal("Grip"):Connect(function() wait()
                   if not invisible then gripChanged:Disconnect() end
                   if heldTool.Grip ~= lastGrip then
                       lastGrip = heldTool.Grip*(CFrame.new(0, offset-1.5, 1.5) * CFrame.Angles(math.rad(-90), 0, 0))
                       heldTool.Grip = lastGrip
                       heldTool.Parent = Backpack
                       heldTool.Parent = Character
                   end
               end)
           end
        end)
    end
})
Tabs.FeOptions:AddButton({
    Title = "Fe Get Farm Zone",
    Description = "",
    Callback = function()
        game:GetService("Players").LocalPlayer.Data.Ticket.Value = true
    end
})
