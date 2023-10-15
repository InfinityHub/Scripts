-- Variables
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local last
local File = pcall(function()
   AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
end)
local queue_on_teleport = queue_on_teleport or syn and syn.queue_on_teleport
queue_on_teleport[[
    repeat wait() until game:IsLoaded() print("ServerHoped or rejoined")
    wait(2)
    
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
    showMinButton = true,
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
    if not File then
       table.insert(AllIDs, actualHour)
       writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
    end
    function TPReturner()
       local Site;
       if foundAnything == "" then
           Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
       else
           Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
       end
       local ID = ""
       if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
           foundAnything = Site.nextPageCursor
       end
       local num = 0;
       local extranum = 0
       for i,v in pairs(Site.data) do
           extranum += 1
           local Possible = true
           ID = tostring(v.id)
           if tonumber(v.maxPlayers) > tonumber(v.playing) then
               if extranum ~= 1 and tonumber(v.playing) < last or extranum == 1 then
                   last = tonumber(v.playing)
               elseif extranum ~= 1 then
                   continue
               end
               for _,Existing in pairs(AllIDs) do
                   if num ~= 0 then
                       if ID == tostring(Existing) then
                           Possible = false
                       end
                   else
                       if tonumber(actualHour) ~= tonumber(Existing) then
                           local delFile = pcall(function()
                               delfile("NotSameServers.json")
                               AllIDs = {}
                               table.insert(AllIDs, actualHour)
                           end)
                       end
                   end
                   num = num + 1
               end
               if Possible == true then
                   table.insert(AllIDs, ID)
                   wait()
                   pcall(function()
                       writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                       wait()
                       game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                   end)
                   wait(4)
               end
           end
       end
    end
    function Teleport()
       while wait() do
           pcall(function()
               TPReturner()
               if foundAnything ~= "" then
                   TPReturner()
               end
           end)
       end
    end
    Teleport()
end)
local SettingsSection = candyTab:addSection({
    text = 'Settings',
    side = 'Right',
    showMinButton = true,
})
local AutoReloadGuiToggle = SettingsSection:addToggle({
    text = 'Auto Reload Hub',
    state = true,
})
local AutoSaveToggle = SettingsSection:addToggle({
    text = 'Auto Save',
    state = false,
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
    autoReload = bool
    while autoReload do task.wait()
        
    end
end)
AutoSaveToggle:bindToEvent('onToggle', function(bool)
    autoSave = bool
    while autoSave do task.wait()
        
    end
end)
