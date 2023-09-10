-- start
game.StarterGui:SetCore("ChatMakeSystemMessage", {
    Text = "[InfinityHub] Welcome "..game.Players.LocalPlayer.Name..' to infinity hub', Color = BrickColor.new("Really white").Color
})




-- variables
function Attack()
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA('Tool') and v.Name == 'Combat' then
            v:Activate()
        end
    end
end
function GetPlayers()
    local plrsName = {}
    for i,v in pairs(game.Players:GetChildren()) do
        if v.Name ~= game.Players.LocalPlayer.Name then
            table.insert(plrsName,v.Name)
        end
    end
    return plrsName
end



-- libray
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local Window = Fluent:CreateWindow({
    Title = 'Infinity Hub | 1.5 | '..game:GetService('MarketplaceService'):GetProductInfo(game.PlaceId).Name,
    SubTitle = "by InfinityMercury",
    TabWidth = 100,
    Size = UDim2.fromOffset(600, 500),
    Acrylic = false,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.J
})
local Tabs = {
    Farming = Window:AddTab({ Title = "Farming", Icon = "rbxassetid://7743866529" }),
    Player = Window:AddTab({ Title = "Player", Icon = "rbxassetid://10747373176" }),
    Points = Window:AddTab({ Title = "Points", Icon = "rbxassetid://14711767549" }),
    Spin = Window:AddTab({ Title = "Spin", Icon = "rbxassetid://14734182939" }),
    Raid = Window:AddTab({ Title = "Raid", Icon = "rbxassetid://14734245043" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}
local Options = Fluent.Options



-- code
Tabs.Farming:AddSection('- Farm options')
local mob = {'Buggy Attack Doges  [Lvl ?]','Buggy Hungry Wolves  [Lvl ?]','CHAINSAWMAN [Lvl. ???]','Fire King  [Drop!?]','Fisherman Guy [Lvl ?]','Frank [Lvl ?]','Fro Guy  [Lvl ?]','Fro Snowman  [Lvl ?]','Frost  [Drop!?]','Luffy Da Monkey [Lvl ?]','Marine Soldier [Lvl ?]','Shanks [???]','Skeleton [Lvl BONUS]','Thug Cat [Lvl 1]','Trained Bandit [Lvl 1K]','WhiteBeard [Drop!?]','Winged Wolve [Lvl 10MHEALTH]','Zru [Lvl ?]'}
local Dropdown = Tabs.Farming:AddDropdown("MobDropdown", {
    Title = "Select Mob:",
    Values = mob,
    Multi = false,
    Default = 1,
})
local FastAutoFarmLevelToggle = Tabs.Farming:AddToggle("FarmToggle", {Title = "AutoFarm Level (Insta Kill)", Default = false })
FastAutoFarmLevelToggle:OnChanged(function(bool)
    Autolevel = bool
    if Autolevel then
        local Mob = Options.MobDropdown.Value
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA('Tool') and v.Name == 'Combat' then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
            end
        end

        while Autolevel do task.wait()
            game.Players.LocalPlayer.Character:PivotTo(workspace.NPCS[Mob]:GetPivot())
            Attack()
            wait(.2)
            for i,v in pairs(workspace.NPCS:GetChildren()) do
                if v:IsA('Model') and v.Name == Mob then
                    v.Head:Destroy()
                end
            end
        end
    end
end)
Tabs.Farming:AddButton({
    Title = "Grab Fruits",
    Description = "",
    Callback = function()
        for i,v in pairs(workspace:GetChildren()) do
            if v:IsA('Tool') then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
            end
        end
    end
})
Tabs.Farming:AddSection('')
Tabs.Farming:AddSection('- Player Farm')
local Dropdown = Tabs.Farming:AddDropdown("PlayerDropdown", {
    Title = "Select Player: ",
    Values = GetPlayers(),
    Multi = false,
    Default = 1,
})
local PlayerFarmToggle = Tabs.Farming:AddToggle("", {Title = "Start", Default = false })
PlayerFarmToggle:OnChanged(function(bool)
    StartPF = bool
    while StartPF do task.wait()
        game.Players.LocalPlayer.Character:PivotTo(game.Players[Options.PlayerDropdown.Value].Character.HumanoidRootPart:GetPivot())
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA('Tool') and v.Name == 'Combat' then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
            end
        end
    end
end)
Tabs.Farming:AddButton({
    Title = "Refresh Dropdown",
    Description = "",
    Callback = function()
        Options.PlayerDropdown:SetValue(GetPlayers())
    end
})
Tabs.Farming:AddButton({
    Title = "Big Hit Box",
    Description = "",
    Callback = function()
        _G.HeadSize = 50
        _G.Disabled = true
        game:GetService('RunService').RenderStepped:connect(function()
            if _G.Disabled then
                for i,v in next, game:GetService('Players'):GetPlayers() do
                    if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                        pcall(function()
                            v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
                            v.Character.HumanoidRootPart.Transparency = 0.7
                            v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really red")
                            v.Character.HumanoidRootPart.Material = "Neon"
                            v.Character.HumanoidRootPart.CanCollide = false
                        end)
                    end
                end
            end
        end)
    end
})


Tabs.Player:AddButton({
    Title = "Reset Status (Free)",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").BonusFolderFX.SHANKSSECRETREVEALEDGG:FireServer()
    end
})
Tabs.Player:AddButton({
    Title = "Get All Accessory",
    Description = "",
    Callback = function()
        for i,v in pairs(game:GetService("Players").LocalPlayer.AccessoryInventoryList:GetChildren()) do
            if v:IsA('BoolValue') then
                v.Value = true
            end
        end
    end
})
Tabs.Player:AddButton({
    Title = "Get All Swords",
    Description = "",
    Callback = function()
        for i,v in pairs(game:GetService("Players").LocalPlayer.InventoryList:GetChildren()) do
            if v:IsA('BoolValue') then
                v.Value = true
            end
        end
    end
})
Tabs.Player:AddButton({
    Title = "No Water Damage",
    Description = "",
    Callback = function()
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA('LocalScript') and v.Name == 'Water Damage' then
                if v then
                    v.Disabled = true
                end
            end
        end
    end
})
Tabs.Player:AddButton({
    Title = "Infinite Geli",
    Description = "",
    Callback = function()
        local number_1 = 1000000000000000000
        local string_1 = "Code2";
        local Target = game:GetService("ReplicatedStorage").EnterCode;
        Target:FireServer(number_1, string_1);
    end
})
Tabs.Player:AddButton({
    Title = "Infinite Diamonds",
    Description = "",
    Callback = function()
		local ohNumber1 = 1000000000000000000
		local ohString2 = "Code17"
		game:GetService("ReplicatedStorage").BonusFolderFX.DiamondCodes:FireServer(ohNumber1, ohString2)
    end
})


local MeleeToggle = Tabs.Points:AddToggle("", {Title = "Melee", Default = false })
MeleeToggle:OnChanged(function(bool)
    Melee = bool
    while Melee do task.wait()
        local ohString1 = "Melee"
        game:GetService("ReplicatedStorage").StatSystem.Points:FireServer(ohString1)
    end
end)
local MaxHealthToggle = Tabs.Points:AddToggle("", {Title = "Durability", Default = false })
MaxHealthToggle:OnChanged(function(bool)
    MaxHealth = bool
    while MaxHealth do task.wait()
        local ohString1 = "MaxHealth"
        game:GetService("ReplicatedStorage").StatSystem.Points:FireServer(ohString1)
    end
end)
local DevilFruitToggle = Tabs.Points:AddToggle("", {Title = "Devil Fruit", Default = false })
DevilFruitToggle:OnChanged(function(bool)
    DevilFruit = bool
    while DevilFruit do task.wait()
        local ohString1 = "DevilFruit"
        game:GetService("ReplicatedStorage").StatSystem.Points:FireServer(ohString1)
    end
end)
local SwordToggle = Tabs.Points:AddToggle("", {Title = "Sword", Default = false })
SwordToggle:OnChanged(function(bool)
    Sword = bool
    while Sword do task.wait()
        local ohString1 = "Sword"
        game:GetService("ReplicatedStorage").StatSystem.Points:FireServer(ohString1)
    end
end)


local InfSpinToggle = Tabs.Spin:AddToggle("", {Title = "Get inf Gems To Spin", Default = false })
InfSpinToggle:OnChanged(function(bool)
    Spin = bool
    while Spin do task.wait()
        game:GetService("Players").LocalPlayer.Stat.Gem.Value = 9e9
    end
end)


Tabs.Raid:AddButton({
    Title = "Teleport To Raid",
    Description = "",
    Callback = function()
        game.Players.LocalPlayer.Character:PivotTo(workspace.Raid_Areas.RaidArea:GetPivot())
    end
})
Tabs.Raid:AddButton({
    Title = "Kill All Mobs",
    Description = "",
    Callback = function()
        if game.PlaceId == 10598963932 then
            if game:GetService("Workspace").FilteringEnabled == true then
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = " Invalid Place Id ";
                    Text = "";
                })
            end
        elseif game.PlaceId == 10598963932 then
            for _, v in pairs(workspace.MobsFolder:GetChildren()) do
                if v:IsA('Model') then
                    v.Head:Destroy()
                end
            end
        end
    end
})
