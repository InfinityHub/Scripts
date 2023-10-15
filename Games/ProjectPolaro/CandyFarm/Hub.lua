-- Variables
local queue_on_teleport = queue_on_teleport or syn and syn.queue_on_teleport
queue_on_teleport[[
    repeat wait() until game:IsLoaded() print("ServerHoped or rejoined")
    wait(2)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/InfinityHub/Scripts/main/Games/ProjectPolaro/CandyFarm/Hub.lua",true))()
]]



-- Library Settings
local uiLoader = loadstring(game:HttpGet('https://raw.githubusercontent.com/topitbopit/dollarware/main/library.lua'))
local ui = uiLoader({
    rounding = false,
    theme = 'blueberry',
    smoothDragging = false
})
local window = ui.newWindow({
    text = 'Infinity Hub | Project Polaro (Auto Candy)',
    resize = false,
    size = Vector2.new(500, 300),
    position = nil
})
ui.autoDisableToggles = true



-- Tabs Settings
local candyTab = window:addMenu({
    text = 'Auto Candy'
})
local creditsTab = window:addMenu({
    text = 'Credits'
})



-- Codes
local CandyFarmSection = candyTab:addSection({
    text = 'Auto Farm Candy',
    side = 'auto',
    showMinButton = false,
})
local CandySpawnToggle = CandyFarmSection:addToggle({
    text = 'Unlock all candy spawn',
    state = false,
})
local CollectAllCandiesToggle = CandyFarmSection:addToggle({
    text = 'Collect all candies',
    state = false,
})
local button = CandyFarmSection:addButton({text = 'Rejoin smallest servers', style = 'large'}, function()
    ui.notify({
        title = 'Infinity Hub | Rejoin',
        message = 'Wait a second...',
        duration = 4
    })
    wait(1.5)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/InfinityMercury/Functions/main/Features/Rejoin.lua",true))()
end)
local SettingsSection = candyTab:addSection({
    text = 'Settings',
    side = 'Right',
    showMinButton = false,
})
local AutoReloadGuiToggle = SettingsSection:addToggle({
    text = 'Auto Reload Hub',
    state = true,
})
local AutoSaveToggle = SettingsSection:addToggle({
    text = 'Auto Save',
    state = false,
})


local CreditsSection = creditsTab:addSection({
    text = 'Credits',
    side = 'auto',
    showMinButton = false,
})
local CreditsLabel = CreditsSection:addLabel({
    text = 'Made by InfinityMercury'
})


-- Toggles Settings
CandySpawnToggle:bindToEvent('onToggle', function(bool)
    autoSpawn = bool
    while autoSpawn do task.wait()
        for _, v in pairs(workspace.Candies:GetChildren()) do
            if (v:IsA('Part') and v.Name == 'spawn') then
                game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                wait(.15)
            end
        end
    end
end)
CollectAllCandiesToggle:bindToEvent('onToggle', function(bool)
    autoCandy = bool
    while autoCandy do task.wait()
        for _, v in pairs(workspace.Candies:GetChildren()) do
            if (v:IsA('MeshPart')) then
                fireclickdetector(v.ClickDetector)
            end
        end
    end
end)
AutoReloadGuiToggle:bindToEvent('onToggle', function(bool)
    print('.')
end)
AutoSaveToggle:bindToEvent('onToggle', function(bool)
    autoSave = bool
    while autoSave do task.wait(.5)
        game:GetService("ReplicatedStorage").REvents.Internal.Save:InvokeServer()
    end
end)
