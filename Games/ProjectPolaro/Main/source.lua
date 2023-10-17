-- Variables Settings
function PokePart()
    local pokePart = {};
    for _, v in pairs(game:GetService("Players").LocalPlayer.PokemonParty:GetChildren()) do
        if v:IsA('Configuration') then
            table.insert(pokePart, v.Name)
        end
    end
    return pokePart
end
function Teleport(Path, WorldPivot, PivotTo)
    local bool = WorldPivot
    local boolTwo = PivotTo
    if bool then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Path.WorldPivot
    end
    if boolTwo then
        game.Players.LocalPlayer.Character:PivotTo(Path:GetPivot())
    end
end
function GetOppPokemon()
	for _, v in pairs(game:GetService("Players").LocalPlayer.OppPokemon:GetChildren()) do
		return v
	end
end
local queue_on_teleport = queue_on_teleport or syn and syn.queue_on_teleport
queue_on_teleport[[
    repeat wait() until game:IsLoaded() print("ServerHoped or rejoined")
    wait(2)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/InfinityHub/Scripts/main/Games/ProjectPolaro/Main/source.lua",true))()
]]




-- Libray Settings
local ArrayField = loadstring(game:HttpGet('https://raw.githubusercontent.com/InfinityMercury/UiLibray/main/ArrayField/source.lua'))()
local Window = ArrayField:CreateWindow({
    Name = "Infinity Hub | version 1.8 | Project Polaro",
    LoadingTitle = "Infinity Hub",
    LoadingSubtitle = "by InfinityMercury",
    ConfigurationSaving = {
        Enabled = false,
        FolderName = nil,
        FileName = ""
    },
    Discord = {
        Enabled = false,
        Invite = "sirius",
        RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {
        Title = "",
        Subtitle = "",
        Note = "",
        FileName = "",
        SaveKey = false,
        GrabKeyFromSite = false,
        Key = {''},
        Actions = {
            [1] = {
                Text = '',
                OnPress = function()
                end,
            }
        },
    }
})



-- Tabs Settings
local welcomeTab = Window:CreateTab("Welcome", 4483362458)
local movesTab = Window:CreateTab("Moves", 4483362458)
local candyTab = Window:CreateTab("Candy", 4483362458)
local battleTab = Window:CreateTab("In Battle", 4483362458)
local moneyTab = Window:CreateTab("Money", 4483362458)
local teleportTab = Window:CreateTab("Teleport", 4483362458)



-- Code
local welcomeSection = welcomeTab:CreateSection("[ Welcome! ]", false)
local Paragraph = welcomeTab:CreateParagraph({Title = "Welcome to Infinity Hub "..game.Players.LocalPlayer.Name, Content = "Have fun"}, welcomeSection)
local Paragraph = welcomeTab:CreateParagraph({Title = "Discord Server", Content = "In dev..."}, welcomeSection)
local Label = welcomeTab:CreateLabel("Hub Keybind: K", welcomeSection)


local Section = movesTab:CreateSection("[ Move Replace Menu ]", false)
local Input = movesTab:CreateInput({
    Name = "Pokemon Name",
    PlaceholderText = "...",
    NumbersOnly = false,
    CharacterLimit = 15,
    OnEnter = false,
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        getgenv().PokePartSelected = Text
    end,
})
local Input = movesTab:CreateInput({
    Name = "Move to add",
    PlaceholderText = "...",
    NumbersOnly = false,
    CharacterLimit = 15,
    OnEnter = false,
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        getgenv().MoveToAdd = Text
    end,
})
local Input = movesTab:CreateInput({
    Name = "Move to replace",
    PlaceholderText = "...",
    NumbersOnly = false,
    CharacterLimit = 15,
    OnEnter = false,
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        getgenv().MoveToReplace = Text
    end,
})
local Button = movesTab:CreateButton({
    Name = "Replace",
    Interact = 'Click',
    Callback = function()
        local ohInstance1 = game:GetService("Players").LocalPlayer.PokemonParty[getgenv().PokePartSelected]
        local ohInstance2 = game:GetService("Players").LocalPlayer.PokemonParty[getgenv().PokePartSelected].Moves[getgenv().MoveToReplace]
        local ohString3 = getgenv().MoveToAdd
        game:GetService("ReplicatedStorage").REvents.Pokemon.TMLearn:InvokeServer(ohInstance1, ohInstance2, ohString3)
    end,
})


local Section = candyTab:CreateSection("[ Candy Farm Menu ]", false)
local Toggle = candyTab:CreateToggle({
    Name = "Unlock all spawn candy",
    CurrentValue = false,
    Flag = "",
    Callback = function(bool)
        autoSpawn = bool
        while autoSpawn do task.wait()
            for _, v in pairs(workspace.Candies:GetChildren()) do
                if (v:IsA('Part') and v.Name == 'spawn') then
                    game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                    wait(.15)
                end
            end
        end
    end,
})
local Button = candyTab:CreateButton({
    Name = "Collect all candies",
    Interact = 'Click',
    Callback = function()
        for _, v in pairs(workspace.Candies:GetChildren()) do
            if (v:IsA('MeshPart')) then
                fireclickdetector(v.ClickDetector)
                wait(1)
            end
        end
    end,
})
local Section = candyTab:CreateSection("[ Horseman Farm Menu ]", false)
local Toggle = candyTab:CreateToggle({
    Name = "Auto Find Horseman",
    CurrentValue = false,
    Flag = "",
    Callback = function(bool)
        horseman = bool
        while horseman do task.wait()
            for _, v in pairs(workspace:GetChildren()) do
                if v:IsA('Model') and v.Name == 'Horseman' then
                    Teleport(v, true, false) wait(2.5)
                end
            end
        end
    end,
})
local Toggle = candyTab:CreateToggle({
    Name = "Auto Get Recompense",
    CurrentValue = false,
    Flag = "",
    Callback = function(bool)
        autoRecompense = bool
        while autoRecompense do task.wait()
            game:GetService("ReplicatedStorage").Halloween:FireServer()
        end
    end,
})
local Section = candyTab:CreateSection("[ Misc ]", false)
local Toggle = candyTab:CreateToggle({
    Name = "Auro reload hub",
    CurrentValue = true,
    Flag = "",
    Callback = function(bool)
        print(bool)
    end,
})
local Toggle = candyTab:CreateToggle({
    Name = "Auto Save",
    CurrentValue = false,
    Flag = "",
    Callback = function(bool)
        autoSave = bool
        while autoSave do task.wait(.5)
            game:GetService("ReplicatedStorage").REvents.Internal.Save:InvokeServer()
        end
    end,
})
local Button = candyTab:CreateButton({
    Name = "Rejoin smallest server",
    Interact = 'Click',
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/InfinityMercury/Functions/main/Features/Rejoin.lua",true))()
    end,
})


local Section = battleTab:CreateSection("[ In Battle Menu ]", false)
local Button = battleTab:CreateButton({
    Name = "Heal your pokemon fully",
    Interact = 'Click',
    Callback = function()
        for _, v in pairs(game:GetService("Players").LocalPlayer.PokemonParty:GetChildren()) do
            if (v:IsA('Configuration')) then
                v.CurrentHP.Value = v.Stats.HPStat.Value
            end
        end
    end,
})
local Button = battleTab:CreateButton({
    Name = "Kill all enemy pokemons",
    Interact = 'Click',
    Callback = function()
        for _, v in pairs(game:GetService("Players").LocalPlayer.OppPokemon:GetDescendants()) do
            if (v:IsA('IntValue') and v.Name == 'CurrentHP') then
                v.Value = 0
            end
        end
    end,
})


local Section = moneyTab:CreateSection("[ Inf Money ]", false)
local Button = moneyTab:CreateButton({
    Name = "Start Generate Money",
    Interact = 'Click',
    Callback = function()
        repeat task.wait()
            local a1 = 'Gary'
            game:GetService("ReplicatedStorage").REvents.Internal.jxbf:InvokeServer(a1)
        until game.Players.LocalPlayer.Character.Humanoid.Health == 9e99
    end,
})
local Toggle = moneyTab:CreateToggle({
    Name = "Auto Save Money",
    CurrentValue = false,
    Flag = "",
    Callback = function(bool)
        autoSavemoney = bool
        while autoSavemoney do task.wait(.5)
            game:GetService("ReplicatedStorage").REvents.Internal.Save:InvokeServer()
        end
    end,
})


local Section = teleportTab:CreateSection("[ Teleport Menu ]", false)
local teleportNpc = {'Brock','Misty','Surge','Erika','Koga','Sabrina','Blaine','GiovanniBoss','Marie','Nicu','Leader Total','Leader Pop'}
for _, v in next, teleportNpc do
    local Button = teleportTab:CreateButton({
        Name = "Teleport to "..v,
        Interact = 'Click',
        Callback = function()
            Teleport(workspace[v], true, false)
        end,
    })
end
