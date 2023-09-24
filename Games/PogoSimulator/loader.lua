--// Variables
function FixLabel()
    for _, v in pairs(game:GetService('CoreGui'):GetDescendants()) do
        if v:IsA('ScreenGui') and v.Name == 'Rayfield' then
            for _, x in pairs(v:GetDescendants()) do
                if x:IsA('Frame') and x.Name == 'Label' then
                    x.UIStroke.Color = Color3.fromRGB(6, 134, 138)
                end
            end
        end
    end
end
function FixTopBar()
    for _, v in pairs(game:GetService('CoreGui'):GetDescendants()) do
        if v:IsA('ScreenGui') and v.Name == 'Rayfield' then
            v.Main.Topbar.BackgroundColor3 = Color3.fromRGB(0, 63, 63)
            wait(.1)
            v.Main.Topbar.CornerRepair.BackgroundColor3 = Color3.fromRGB(0, 63, 63)
            wait(.1) v.Main.Topbar.Divider.BackgroundColor3 = Color3.fromRGB(4, 141, 149)
            wait(.25)
        end
    end
end
local MarketplaceService = game:GetService("MarketplaceService")



--// Library
getgenv().SecureMode = true
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/InfinityMercury/UiLibray/main/Rayfield/Remake.lua'))()
local Window = Rayfield:CreateWindow({
   Name = "Infinity Hub | v1.0 "..MarketplaceService:GetProductInfo(game.PlaceId).Name,
   LoadingTitle = "Infinity Hub | "..MarketplaceService:GetProductInfo(game.PlaceId).Name,
   LoadingSubtitle = "by InfinityMercury",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = 'InfHub',
      FileName = "InfHub N_CD"
   },
   Discord = {
      Enabled = false,
      Invite = "",
      RememberJoins = false
   },
   KeySystem = false,
   KeySettings = {
      Title = "",
      Subtitle = "",
      Note = "",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"cum"}
   }
}) wait(.5) FixLabel() FixTopBar()



--// Code
local Farming = Window:CreateTab("Auto Farm", 10709811110)
local Label = Farming:CreateLabel("Main Farm")
local Toggle = Farming:CreateToggle({
    Name = "Farm Money",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(bool)
        coins = bool
        while coins do task.wait()
            for _, v in pairs(workspace.earth.collectables:GetChildren()) do
                if (v:IsA('MeshPart')) then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 0)
                    wait(0.01)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 1)
                end
            end
        end
    end,
})
local Toggle = Farming:CreateToggle({
    Name = "Auto rebirth",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(bool)
        rebirth = bool
        while rebirth do task.wait()
            game:GetService("ReplicatedStorage").rebirth:FireServer()
        end
    end,
})
local Toggle = Farming:CreateToggle({
    Name = "Auto convert",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(bool)
        convert = bool
        while convert do task.wait()
            local ohNumber1 = 1
            game:GetService("ReplicatedStorage").power:FireServer(ohNumber1)
        end
    end,
})

local Sections = Farming:CreateSection('')
local Label = Farming:CreateLabel("Pogo")
local Input = Farming:CreateInput({
    Name = "Set JumPower: ",
    PlaceholderText = "...",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        jumpValue = Text
    end,
})
local Input = Farming:CreateInput({
    Name = "Set Speed: ",
    PlaceholderText = "...",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        speedValue = Text
    end,
})
local Button = Farming:CreateButton({
    Name = "Set JumPower to pogo",
    Callback = function()
     for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA('Tool') then
            v.jumpPower.Value = jumpValue
        end
     end
    end,
})
local Button = Farming:CreateButton({
    Name = "Set Speed to pogo",
    Callback = function()
     for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA('Tool') then
            v.speed.Value = speedValue
        end
     end
    end,
})
