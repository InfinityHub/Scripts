-- libray
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local Window = Fluent:CreateWindow({
    Title = "Infinity Hub | Stands Awakening : Boss",
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
    Boss = Window:AddTab({ Title = "AutoBoss", Icon = "rbxassetid://14671431658" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}



-- code
Tabs.Boss:AddButton({
    Title = "Start Auto Boss",
    Description = "",
    Callback = function()
        getgenv().WaitTime = 240
	    loadstring(game:HttpGet("https://raw.githubusercontent.com/sunexn/standsawakening/main/uncanny.lua",true))()
    end
})
Tabs.Boss:AddButton({
    Title = "Sword No Cooldown",
    Description = "",
    Callback = function()
        getgenv().WaitTime = 240
	    loadstring(game:HttpGet(('https://raw.githubusercontent.com/itsyouranya/free/main/Anya%20Stands%20Awakening%20Helper.lua'),true))()
    end
})
local BossEspToggle = Tabs.Boss:AddToggle("GrabToolsBool", {Title = "Boss Esp", Default = false })
BossEspToggle:OnChanged(function(bool)
    GrabTools = bool
    if GrabTools then
        local Esp = Instance.new("Highlight")
        Esp.Name = "EspPart"
        Esp.FillColor = Color3.new(255, 255, 255)
        Esp.Parent = game:GetService("Workspace").TrollPrism
    else
        game:GetService("Workspace").TrollPrism.EspPart:Destroy()
    end
end)
