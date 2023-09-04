-- notification
local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()
local hi = Instance.new("Sound")  hi.Name = "Notification_Sound"  hi.SoundId = "http://www.roblox.com/asset/?id=6026984224"  hi.Volume = 5  hi.archivable = false  hi.Parent = game.Workspace hi:Play() wait(.46)
Notification:Notify(
    {Title = "Script Executed", Description = [[
- Infinity Hub Executed,
- made by InfinityMercury and Darkzin
    ]]},
    {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 6, Type = "image"},
    {Image = "http://www.roblox.com/asset/?id=13780014144", ImageColor = Color3.fromRGB(255, 255, 255)}
) wait(2)




-- libray
local repo = 'https://raw.githubusercontent.com/InfinityHubTwo/InfinityHubScripts/main/Ui%20Libray/Linoria/'
local Libray = loadstring(game:HttpGet(repo .. 'Loader.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'ThemeMenager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'SaveMenager.lua'))()
local Window = Library:CreateWindow({
    Title = 'Infinity Hub | Stands Awakening',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})




-- tabs
local Tabs = {
    AutoBoss = Window:AddTab('Auto Boss'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}




-- code
local BossOptionsBox = Tabs.AutoBoss:AddLeftGroupbox('Boss Options')
local Button = BossOptionsBox:AddButton({
    Text = 'Start Auto Boss',
    Func = function()
        local hi = Instance.new("Sound")  hi.Name = "Notification_Sound"  hi.SoundId = "http://www.roblox.com/asset/?id=6026984224"  hi.Volume = 5  hi.archivable = false  hi.Parent = game.Workspace hi:Play() wait(.46)
        Notification:Notify(
            {Title = "Auto Boss", Description = "auto boss modded by InfinityMercury, have fun :>"},
            {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 6, Type = "image"},
            {Image = "http://www.roblox.com/asset/?id=13780014144", ImageColor = Color3.fromRGB(255, 255, 255)}
        )
  	    getgenv().WaitTime = 240
	    loadstring(game:HttpGet("https://raw.githubusercontent.com/sunexn/standsawakening/main/uncanny.lua",true))()
    end,
    DoubleClick = false,
    Tooltip = 'Click to start auto boss'
})
local Button = BossOptionsBox:AddButton({
    Text = 'Sword no cooldown',
    Func = function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/itsyouranya/free/main/Anya%20Stands%20Awakening%20Helper.lua'),true))()
    end,
    DoubleClick = false,
    Tooltip = 'Click to start sword no cooldown'
})
BossOptionsBox:AddToggle('AB', {
    Text = 'Boss Esp',
    Default = false,
    Tooltip = 'Turn on to be esp boss',

    Callback = function(state)
        settings = state
        if settings then
            local Esp = Instance.new("Highlight")
            Esp.Name = "EspPart"
            Esp.FillColor = Color3.new(255, 255, 255)
            Esp.Parent = game:GetService("Workspace").TrollPrism

        else

            game:GetService("Workspace").TrollPrism.EspPart:Destroy()
        end
    end
})




-- libray settings
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')
MenuGroup:AddButton('Unload', function() Library:Unload() end)
