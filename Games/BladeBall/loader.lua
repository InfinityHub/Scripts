-- variables
local AntiCheater = "https://raw.githubusercontent.com/InfinityMercury/Scripts/main/ShindoLife/AntiCheater.lua"
loadstring(game:HttpGetAsync(AntiCheater))()
local MarketplaceService = game:GetService("MarketplaceService")
local workspace = game:GetService("Workspace")
local players = game:GetService("Players")
local runService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local localPlayer = game.Players.LocalPlayer
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local abilitiesFolder = character:WaitForChild("Abilities")
local upgrades = localPlayer.Upgrades
localPlayer.CharacterAdded:Connect(onCharacterAdded)
local TruValue = Instance.new("StringValue")
if workspace:FindFirstChild("AbilityThingyk1212") then
    workspace:FindFirstChild("AbilityThingyk1212"):Remove()
    task.wait(0.1)
    TruValue.Parent = game:GetService("Workspace")
    TruValue.Name = "AbilityThingyk1212"
    TruValue.Value = "Dash" --Change to Use other ability
else
    TruValue.Parent = game:GetService("Workspace")
    TruValue.Name = "AbilityThingyk1212"
    TruValue.Value = "Dash" --Change to Use other ability
end
local function GetAnyAbility(name)
    local args = {
        [1] = name
    }
    game:GetService("ReplicatedStorage").Remotes.Store.RequestEquipAbility:InvokeServer(unpack(args))
    game:GetService("ReplicatedStorage").Remotes.Store.GetOwnedAbilities:InvokeServer()
    game:GetService("ReplicatedStorage").Remotes.kebaind:FireServer()
    local function AbilityValue2()
    local TruValue = Instance.new("StringValue")
    workspace:FindFirstChild("AbilityThingyk1212"):Remove()
        TruValue.Parent = game:GetService("Workspace")
        TruValue.Name = "AbilityThingyk1212"
        TruValue.Value = name
    end
    for i,v in pairs(abilitiesFolder:GetChildren()) do
        for i,b in pairs(abilitiesFolder:GetChildren()) do
            local Ability = b
            if v.Enabled == true then
                local EquippedAbility = v
                local ChosenAbility = {}
                spawn(function()
                    ChosenAbility = AbilityValue2()
            end)
            task.wait(0.05)
                local AbilityValue = workspace.AbilityThingyk1212
                if b.Name == AbilityValue.Value then
                    v.Enabled = false
                    b.Enabled = true
                end
            end
        end
    end
end



-- libray
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local Window = Fluent:CreateWindow({
    Title = 'Infinity Hub (UPDATE) | 1.5 | '..MarketplaceService:GetProductInfo(game.PlaceId).Name,
    SubTitle = "by InfinityMercury",
    TabWidth = 120,
    Size = UDim2.fromOffset(600, 500),
    Acrylic = false,
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.J
})
local Tabs = {
    Main = Window:AddTab({
        Title = "Main",
        Icon = "rbxassetid://10723424505"
    }),
    User = Window:AddTab({
        Title = "Player",
        Icon = "rbxassetid://10747373176"
    }),
    Server = Window:AddTab({
        Title = "Server",
        Icon = "rbxassetid://9692125126"
    }),
    Case = Window:AddTab({
        Title = "Open Case",
        Icon = "rbxassetid://14761896057"
    }),
}
local Options = Fluent.Options



-- code
Tabs.Main:AddSection('- Get Any Skill')
Tabs.Main:AddButton({
    Title = "Get Dash",
    Description = "",
    Callback = function()
        GetAnyAbility('Dash')
    end
})
Tabs.Main:AddButton({
    Title = "Get Forcefield",
    Description = "",
    Callback = function()
        GetAnyAbility('Forcefield')
    end
})
Tabs.Main:AddButton({
    Title = "Get Invisibility",
    Description = "",
    Callback = function()
        GetAnyAbility('Invisibility')
    end
})
Tabs.Main:AddButton({
    Title = "Get Platform",
    Description = "",
    Callback = function()
        GetAnyAbility('Platform')
    end
})
Tabs.Main:AddButton({
    Title = "Get Deflection",
    Description = "",
    Callback = function()
        GetAnyAbility('Deflection')
    end
})
Tabs.Main:AddButton({
    Title = "Get Shadow Step",
    Description = "",
    Callback = function()
        GetAnyAbility('Shadow Step')
    end
})
Tabs.Main:AddButton({
    Title = "Get Super Jump",
    Description = "",
    Callback = function()
        GetAnyAbility('Super Jump')
    end
})
Tabs.Main:AddButton({
    Title = "Get Telekinesis",
    Description = "",
    Callback = function()
        GetAnyAbility('Telekinesis')
    end
})
Tabs.Main:AddButton({
    Title = "Get Thunder Dash",
    Description = "",
    Callback = function()
        GetAnyAbility('Thunder Dash')
    end
})
Tabs.Main:AddButton({
    Title = "Get Rapture",
    Description = "",
    Callback = function()
        GetAnyAbility('Rapture')
    end
})
Tabs.Main:AddSection('')
Tabs.Main:AddSection('- Skill Settings')
Tabs.Main:AddButton({
    Title = "Inf Dash",
    Description = "",
    Callback = function()
        upgrades:WaitForChild("Dash").Value = 999999999999999999
    end
})
Tabs.Main:AddButton({
    Title = "Inf Forcefield",
    Description = "",
    Callback = function()
        upgrades:WaitForChild("Forcefield").Value = 999999999999999999
    end
})
Tabs.Main:AddButton({
    Title = "Inf Invisibility",
    Description = "",
    Callback = function()
        upgrades:WaitForChild("Invisibility").Value = 999999999999999999
    end
})
Tabs.Main:AddButton({
    Title = "Inf Platform",
    Description = "",
    Callback = function()
        upgrades:WaitForChild("Platform").Value = 999999999999999999
    end
})
Tabs.Main:AddButton({
    Title = "Inf Shadow Step (Speed)",
    Description = "",
    Callback = function()
        upgrades:WaitForChild("Shadow Step").Value = 999999999999999999
    end
})
Tabs.Main:AddButton({
    Title = "Inf Super Jump",
    Description = "",
    Callback = function()
        upgrades:WaitForChild("Super Jump").Value = 999999999999999999
    end
})
Tabs.Main:AddButton({
    Title = "Inf Thunder Dash",
    Description = "",
    Callback = function()
        upgrades:WaitForChild("Thunder Dash").Value = 999999999999999999
    end
})
Tabs.Main:AddButton({
    Title = "Inf Raging Deflection",
    Description = "",
    Callback = function()
        upgrades:WaitForChild("Raging Deflection").Value = 999999999999999999
    end
})
Tabs.Main:AddButton({
    Title = "Inf Telekinesis",
    Description = "",
    Callback = function()
        upgrades:WaitForChild("Telekinesis").Value = 999999999999999999
    end
})
Tabs.Main:AddButton({
    Title = "Inf Rapture",
    Description = "",
    Callback = function()
        upgrades:WaitForChild("Rapture").Value = 999999999999999999
    end
})


Tabs.User:AddButton({
    Title = "Auto Parry (Recommended)",
    Description = "",
    Callback = function()
        local player = game.Players.LocalPlayer
        local replicatedStorage = game:GetService("ReplicatedStorage")
        local parryButtonPress = replicatedStorage.Remotes.ParryButtonPress
        local ballsFolder = workspace:WaitForChild("Balls")


        local function onCharacterAdded(newCharacter)
            character = newCharacter
        end
        player.CharacterAdded:Connect(onCharacterAdded)
        local focusedBall = nil 
        local function chooseNewFocusedBall()
            local balls = ballsFolder:GetChildren()
            focusedBall = nil
            for _, ball in ipairs(balls) do
                if ball:GetAttribute("realBall") == true then
                    focusedBall = ball
                    break
                end
            end
        end
        chooseNewFocusedBall()
        local function timeUntilImpact(ballVelocity, distanceToPlayer, playerVelocity)
            local directionToPlayer = (character.HumanoidRootPart.Position - focusedBall.Position).Unit
            local velocityTowardsPlayer = ballVelocity:Dot(directionToPlayer) - playerVelocity:Dot(directionToPlayer)
            if velocityTowardsPlayer <= 0 then
                return math.huge
            end
            local distanceToBeCovered = distanceToPlayer - 40
            return distanceToBeCovered / velocityTowardsPlayer
        end
        local BASE_THRESHOLD = 0.15
        local VELOCITY_SCALING_FACTOR = 0.002
        local function getDynamicThreshold(ballVelocityMagnitude)
            local adjustedThreshold = BASE_THRESHOLD - (ballVelocityMagnitude * VELOCITY_SCALING_FACTOR)
            return math.max(0.12, adjustedThreshold)
        end
        local function checkBallDistance()
            if not character:FindFirstChild("Highlight") then return end
            local charPos = character.PrimaryPart.Position
            local charVel = character.PrimaryPart.Velocity
            if focusedBall and not focusedBall.Parent then
                chooseNewFocusedBall()
            end
            if not focusedBall then return end
            local ball = focusedBall
            local distanceToPlayer = (ball.Position - charPos).Magnitude
            if distanceToPlayer < 10 then
                parryButtonPress:Fire()
                return
            end
            local timeToImpact = timeUntilImpact(ball.Velocity, distanceToPlayer, charVel)
            local dynamicThreshold = getDynamicThreshold(ball.Velocity.Magnitude)
            if timeToImpact < dynamicThreshold then
                parryButtonPress:Fire()
            end
        end
        runService.Heartbeat:Connect(function()
            checkBallDistance()
        end)
    end
})
Tabs.User:AddButton({
    Title = "Auto Parry (Red Line)",
    Description = "Keybind: X",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/Circle"))()
    end
})
local AutoParryToggle = Tabs.User:AddToggle("MyToggle", {Title = "Auto Parry (better, more risk of denunciation)", Default = false })
AutoParryToggle:OnChanged(function(bool)
    getgenv().god = bool
    while getgenv().god and task.wait() do
        for _,ball in next, workspace.Balls:GetChildren() do
            if ball then
                if game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, ball.Position)
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Highlight") then
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = ball.CFrame * CFrame.new(0, 0, (ball.Velocity).Magnitude * -0.5)
                        game:GetService("ReplicatedStorage").Remotes.ParryButtonPress:Fire()
                    end
                end
            end
        end
    end
end)
Tabs.User:AddButton({
    Title = "Gamepass Emote Effect + Music",
    Description = "",
    Callback = function()
        local args = {[1] = true,[2] = "Empyrean"}game:GetService("ReplicatedStorage").Remotes.CustomEmote:FireServer(unpack(args))
    end
})
Tabs.User:AddButton({
    Title = "Gamepass Emote (Press R, after pressing button)",
    Description = "",
    Callback = function()
        character:FindFirstChildOfClass("Model").Name = "Empyrean Greatblade"
    end
})
Tabs.User:AddSection('')
Tabs.User:AddSection('- Normal Options')
local Slider = Tabs.User:AddSlider("Slider", {
    Title = "WalkSpeed",
    Description = "",
    Default = 30,
    Min = 30,
    Max = 500,
    Rounding = 0,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed=Value
    end
})
local Slider = Tabs.User:AddSlider("Slider", {
    Title = "JumpPower",
    Description = "",
    Default = 50,
    Min = 50,
    Max = 500,
    Rounding = 0,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower=Value
    end
})
local FlyToogle = Tabs.User:AddToggle("MyToggle", {Title = "H Fly", Default = false })
FlyToogle:OnChanged(function(bool)
    Sex = bool
    local Max = 0
    local LP = Players.LocalPlayer
    local Mouse = LP:GetMouse()
    Mouse.KeyDown:connect(
        function(k)
            if k:lower() == "h" and Sex then
                Max = Max + 1
                getgenv().Fly = false
                if Sex then
                    local T = LP.Character:FindFirstChild("UpperTorso",true) or LP.Character:FindFirstChild("HumanoidRootPart",true)
                    local S = {
                        F = 0,
                        B = 0,
                        L = 0,
                        R = 0
                    }
                    local S2 = {
                        F = 0,
                        B = 0,
                        L = 0,
                        R = 0
                    }
                    local SPEED = 5
                    local function FLY()
                        getgenv().Fly = true
                        local BodyGyro = Instance.new("BodyGyro", T)
                        local BodyVelocity = Instance.new("BodyVelocity", T)
                        BodyGyro.P = 9e4
                        BodyGyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
                        BodyGyro.cframe = T.CFrame
                        BodyVelocity.velocity = Vector3.new(0, 0, 0)
                        BodyVelocity.maxForce = Vector3.new(9e9, 9e9, 9e9)
                        spawn(
                            function()
                                repeat
                                    wait()
                                    LP.Character.Humanoid.PlatformStand = true
                                    if S.L + S.R ~= 0 or S.F + S.B ~= 0 then
                                        SPEED = 500
                                    elseif not (S.L + S.R ~= 0 or S.F + S.B ~= 0) and SPEED ~= 0 then
                                        SPEED = 0
                                    end
                                    if (S.L + S.R) ~= 0 or (S.F + S.B) ~= 0 then
                                        BodyVelocity.velocity =
                                            ((Workspace.CurrentCamera.CoordinateFrame.lookVector * (S.F + S.B)) +
                                            ((Workspace.CurrentCamera.CoordinateFrame *
                                                CFrame.new(S.L + S.R, (S.F + S.B) * 0.2, 0).p) -
                                                Workspace.CurrentCamera.CoordinateFrame.p)) *
                                            SPEED
                                        S2 = {
                                            F = S.F,
                                            B = S.B,
                                            L = S.L,
                                            R = S.R
                                        }
                                    elseif (S.L + S.R) == 0 and (S.F + S.B) == 0 and SPEED ~= 0 then
                                        BodyVelocity.velocity =
                                            ((Workspace.CurrentCamera.CoordinateFrame.lookVector * (S2.F + S2.B)) +
                                            ((Workspace.CurrentCamera.CoordinateFrame *
                                                CFrame.new(S2.L + S2.R, (S2.F + S2.B) * 0.2, 0).p) -
                                                Workspace.CurrentCamera.CoordinateFrame.p)) *
                                            SPEED
                                    else
                                        BodyVelocity.velocity = Vector3.new(0, 0.1, 0)
                                    end
                                    BodyGyro.cframe = Workspace.CurrentCamera.CoordinateFrame
                                until not getgenv().Fly
                                S = {
                                    F = 0,
                                    B = 0,
                                    L = 0,
                                    R = 0
                                }
                                S2 = {
                                    F = 0,
                                    B = 0,
                                    L = 0,
                                    R = 0
                                }
                                SPEED = 0
                                BodyGyro:destroy()
                                BodyVelocity:destroy()
                                LP.Character.Humanoid.PlatformStand = false
                            end
                        )
                    end
                    Mouse.KeyDown:connect(
                        function(k)
                            if k:lower() == "w" then
                                S.F = 1
                            elseif k:lower() == "s" then
                                S.B = -1
                            elseif k:lower() == "a" then
                                S.L = -1
                            elseif k:lower() == "d" then
                                S.R = 1
                            end
                        end
                    )
                    Mouse.KeyUp:connect(
                        function(k)
                            if k:lower() == "w" then
                                S.F = 0
                            elseif k:lower() == "s" then
                                S.B = 0
                            elseif k:lower() == "a" then
                                S.L = 0
                            elseif k:lower() == "d" then
                                S.R = 0
                            end
                        end
                    )
                    FLY()
                    if Max == 2 then
                        getgenv().Fly = false
                        Max = 0
                    end
                end
            end
        end
    )
end)


Tabs.Server:AddButton({
    Title = "Crash Server",
    Description = "",
    Callback = function()
        for i=1, 1000000 do
            local Ae = Instance.new("BoolValue")
            Ae.Parent = workspace
            Ae.Name = "Crasher"
        end
    end
})
Tabs.Server:AddButton({
    Title = "Crash Server 2",
    Description = "",
    Callback = function()
        while true do task.wait()
            for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                local args = {
                    [1] = true,
                    [2] = "Empyrean"
                }
                game:GetService("ReplicatedStorage").Remotes.CustomEmote:FireServer(unpack(args))
            end
        end
    end
})
Tabs.Server:AddButton({
    Title = "Break Ball",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.Telekinesis:FireServer()
    end
})


local Dropdown = Tabs.Case:AddDropdown("CaseDropdown", {
    Title = "Select Case: ",
    Values = {'Sword Skin', 'Explosion'},
    Multi = false,
    Default = 1,
})
local AutoCaseToggle = Tabs.Case:AddToggle("CaseValue", {Title = "Open", Default = false })
AutoCaseToggle:OnChanged(function(bool)
    Case = bool
    while Case do task.wait()
        if Options.CaseDropdown.Value == 'Sword Skin' then
            game:GetService("ReplicatedStorage").Remotes.Store.RequestOpenSwordBox:InvokeServer()
        end
        if Options.CaseDropdown.Value == 'Explosion' then
            game:GetService("ReplicatedStorage").Remotes.Store.RequestOpenExplosionBox:InvokeServer()
        end
    end
end)



Window:SelectTab(1)
