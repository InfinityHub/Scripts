warn('Script Loaded!')
local UserInputService = game:GetService("UserInputService")
local PlaceId = game.PlaceId


if PlaceId == 5780309044 then
    if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled then
        warn('Mobile Service')
        loadstring(game:HttpGet("https://raw.githubusercontent.com/InfinityHub/Scripts/main/Games/StandsAwakening/Mobile/Button.lua",true))()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/InfinityHub/Scripts/main/Games/StandsAwakening/Mobile/loader.lua",true))()
    else
        warn('Computer Service')
        loadstring(game:HttpGet("https://raw.githubusercontent.com/InfinityHub/Scripts/main/Games/StandsAwakening/Computer/loader.lua",true))()
    end
end
if PlaceId == 11423467063 then
    if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled then
        warn('Mobile Service')
        loadstring(game:HttpGet("https://raw.githubusercontent.com/InfinityHub/Scripts/main/Games/StandsAwakening/Mobile/Button.lua",true))()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/InfinityHub/Scripts/main/Games/StandsAwakening/Mobile/Boss.lua",true))()
    else
        warn('Computer Service')
        loadstring(game:HttpGet("https://raw.githubusercontent.com/InfinityHub/Scripts/main/Games/StandsAwakening/Computer/Boss.lua",true))()
    end
end
