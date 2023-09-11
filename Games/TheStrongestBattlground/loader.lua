--// Variables
local GetPlayers = function()
    local plrsName = {}
    for i,v in pairs(game:GetService('Players'):GetChildren()) do
        if v.Name ~= game:GetService('Players').LocalPlayer.Name then
            table.insert(plrsName,v.Name)
        end
    end
    return plrsName
end
local KeyPress = function(v)
    return game:GetService("VirtualInputManager"):SendKeyEvent(true, v, false, game)
end



--// Library
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local Window = Fluent:CreateWindow({
    Title = "Infinity Hub | "..game:GetService('MarketplaceService'):GetProductInfo(game.PlaceId).Name..' | KillPlayer BETA',
    SubTitle = "by blackaham2266",
    TabWidth = 125,
    Size = UDim2.fromOffset(600, 500),
    Acrylic = false,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.J
})
local Tabs = {
    KillPlayer = Window:AddTab({
        Title = "Kill Player (Beta)",
        Icon = "rbxassetid://7734058599"
    }),
}
local Options = Fluent.Options



--// Code
Tabs.KillPlayer:AddSection('- Kill Player Options')
local Dropdown = Tabs.KillPlayer:AddDropdown("PlayerDropdown", {
    Title = "Select Player: ",
    Values = GetPlayers(),
    Multi = false,
    Default = 1,
})
local Input = Tabs.KillPlayer:AddInput("PositionsSaved", {
    Title = "Positions Saved (dont touch)",
    Default = "",
    Numeric = false,
    Finished = false,
    Placeholder = "",
    Callback = function(Value)
    end
})
local StartKillPlayerToggle = Tabs.KillPlayer:AddToggle("", {Title = "Start", Default = false })
StartKillPlayerToggle:OnChanged(function(bool)
    StartKill = bool
    if StartKill then
        KeyPress("One")
        wait(.2)
        game.Players.LocalPlayer.Character:PivotTo(workspace.Live[Options.PlayerDropdown.Value]:GetPivot())
        wait(1)
        local CFrameEnd = CFrame.new(90000,90000,9000)
        local Time = 5
        local tween =  game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Time), {CFrame = CFrameEnd})
        tween:Play()

        wait(1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(tostring(Options.PlayerDropdown.Value))
    end
end)
Tabs.KillPlayer:AddButton({
    Title = "Save Position",
    Description = "saves the position the player will return to after killing the target",
    Callback = function()
        Options.PositionsSaved:SetValue(tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.Position))
    end
})
Tabs.KillPlayer:AddButton({
    Title = "Refresh Dropdown",
    Description = "",
    Callback = function()
        Options.PlayerDropdown:SetValue(GetPlayers())
    end
})

Tabs.KillPlayer:AddSection('')
Tabs.KillPlayer:AddSection('- Normal Player Options')
local NoSlowToggle = Tabs.KillPlayer:AddToggle("", {Title = "No Slow", Default = false })
NoSlowToggle:OnChanged(function(bool)
    NoSlowValue = bool
    while NoSlowValue do task.wait()
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA('Accessory') and v.Name == 'Freeze' or v.Name == 'Slowed' or v.Name == 'NoJump' then
                v:Destroy()
            end
        end
    end
end)
local NoRagdollToggle = Tabs.KillPlayer:AddToggle("", {Title = "No Ragdoll", Default = false })
NoRagdollToggle:OnChanged(function(bool)
    NoRagValue = bool
    while NoRagValue do task.wait()
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA('Accessory') and v.Name == 'Ragdoll' or v.Name == 'RagdollSim' then
                v:Destroy()
            end
        end
    end
end)
