local UserInputService = game:GetService("UserInputService")
local IsOnMobile = table.find({Enum.Platform.IOS, Enum.Platform.Android}, UserInputService:GetPlatform())

if IsOnMobile then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/InfinityHub/Scripts/main/Games/WeirdStrictDad/MobileSupport.lua",true))()
else
    loadstring(game:HttpGet("https://raw.githubusercontent.com/InfinityHub/Scripts/main/Games/WeirdStrictDad/source.lua",true))()
end
