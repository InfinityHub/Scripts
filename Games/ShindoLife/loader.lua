-- variables
local esp = loadstring(game:HttpGet('https://raw.githubusercontent.com/0f76/seere_v3/main/ESP/v3_esp.lua'))()
local AntiCheater = "https://raw.githubusercontent.com/InfinityMercury/Scripts/main/ShindoLife/AntiCheater.lua"
loadstring(game:HttpGetAsync(AntiCheater))()
local Shindo = {4616652839,4601350214,4601350394,4601350656,4601350809,5431071837,5447073001,5084678830,5431069982,4601350760,6341670805,6505734854,6901575446,6984568732,6986372023,5451398863,7214033433,5451401540,5307141034,7534339269,5451410109,6593187011,6593188260,5743370338,5664805984,5664803952,8184506020,8472733618,7923764447,9310522814,5451405681,7524809704,7524811367,6602058266,5255237254,6602103757,5824792748,4616652839,4601350214,4601350394,4601350656,4601350809,5431071837,5447073001,5431069982,4601350760,6341670805,6505734854,6901575446,6984568732,6986372023,5451398863,7214033433,5451401540,5307141034,7534339269,5451410109,6593187011,6593188260,5743370338,5664805984,5664803952,8184506020,8472733618,7923764447,9310522814,5451405681,7524809704,7524811367,6602058266,5255237254,6602103757,5824792748}
local npc = Workspace.npc
repeat wait() until Player:FindFirstChild("statz",true)
local Stat = Player.statz
local Keys = {}
local Delete = {"CCoff","custo","conquer","narutoshadowclone"}
local Pcall = pcall(function()
    for i,v in pairs(Delete) do
        Workspace:FindFirstChild(v,true):Destroy()
    end 
end)
local For = function(E)
    return Stat.main[tostring(E)]
end
local Key = function(Key)
    return VirtualInputManager:SendKeyEvent(true,tostring(Key),true) and VirtualInputManager:SendKeyEvent(false,tostring(Key),false)
end
local NoClip = function()
    for i,v in next, Player.Character:GetChildren() do
		if v:IsA("BasePart") then
			v.CanCollide = false
			v.Velocity = Vector3.new(0, 0, 0)
		end
	end
end
for i,v in pairs(Stat.presetkeys:GetChildren()) do
    if not table.find(Keys,v.Name) then
        table.insert(Keys,v.Name)
    end
end
local Old = pcall(function()
    local Dungons = {}
    for i=1,15 do 
        table.insert(Dungons,"dungeon" .. i)
    end
end)
local ETable = {"element1", "element2", "element3", "element4"}
local FTable = {"kg1", "kg2", "kg3", "kg4"}
local Keys = {"R","T", "Y", "F", "G", "H", "Q", "E", "V", "B", "N"}
local Teleport = function (A)
	Player.Character:FindFirstChild("HumanoidRootPart", true).CFrame = A 
end
RunService.Stepped:Connect(function()
	sethiddenproperty(Player, "SimulationRadius", 1000)
end)
local Quests = {}
for i,v in next, Workspace:GetDescendants() do
    if v:IsA("Model") and v.Name == "missiongiver" and v:FindFirstChild("loggys") then
        table.insert(Quests, v.timer.time.boss.Text)
        warn(v.timer.time.boss.Text)
    end
end
if not table.find(Shindo, game.PlaceId) then
    return
end
local function GetPlayersString()
    local plrsName = {}
    for i,v in pairs(game:GetService('Players'):GetChildren()) do
        if v.Name ~= game.Players.LocalPlayer.Name then
            table.insert(plrsName,v.Name)
        end
    end
    return plrsName
end;



-- libray
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local Window = Fluent:CreateWindow({
    Title = 'Infinity Hub | 1.8 | '..game:GetService('MarketplaceService'):GetProductInfo(game.PlaceId).Name,
    SubTitle = "by InfinityMercury",
    TabWidth = 100,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.J
})
local Tabs = {
    Farming = Window:AddTab({ Title = "Farming", Icon = "rbxassetid://7743866529" }),
    Points = Window:AddTab({ Title = "Points", Icon = "rbxassetid://14711767549" }),
    Player = Window:AddTab({ Title = "Player", Icon = "rbxassetid://14709912924" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}
local Options = Fluent.Options



-- code
local AutoMobsToggle = Tabs.Farming:AddToggle("MyToggle", {Title = "AutoFarm Mobs", Default = false })
AutoMobsToggle:OnChanged(function(bool)
    AutoMobs = bool
	RunService.Stepped:Connect(function()
		if AutoMobs then
			NoClip()
		end
	end)
	spawn(function()
		while AutoMobs and wait(0.1) do
			pcall(function()
                local Nig = Player.PlayerGui:FindFirstChild("Main"):FindFirstChild("ingame"):FindFirstChild("Missionstory")
				if not Nig.Visible then
					for i, v in next, Workspace.missiongivers:GetChildren() do
						if v:FindFirstChild("Head") and v.Head:FindFirstChild("givemission") and v.Head.givemission.Enabled and v.Head.givemission:FindFirstChild("color").Image == "http://www.roblox.com/asset/?id=5459241648" then
							Teleport(CFrame.new(v.HumanoidRootPart.Position) * CFrame.new(0, -7, 3))
							v:FindFirstChild("CLIENTTALK"):FireServer()
							v:FindFirstChild("CLIENTTALK"):FireServer("accept")
							break
						end
					end
				end
				if Nig.Visible then
					for i, v in next, npc:GetChildren() do
						if v:IsA("Model") and v:FindFirstChild("npctype") and string.find(Nig.bg.name.Text,v.Head.mob.fram.name.info.Text) and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Head.CFrame.Y > -1000 then
							Teleport(CFrame.new(v.HumanoidRootPart.Position + Vector3.new(0,0,3)))
							Player.Character.combat.update:FireServer("mouse1", true)
                            Player.Character.combat.update:FireServer("mouse1", false)
                            local Anti = v:FindFirstChild("antiexploit", true)
                            if Anti then 
                                Anti:Destroy()
                            end
                            local Humanoid = v:FindFirstChildWhichIsA("Humanoid")
                            if Humanoid.Health then
                                Humanoid.Health = -9e9
                            end 
                            local fakehealth = v:FindFirstChild("fakehealth", true)
                            if fakehealth then
                                fakehealth.Value = -9e9
                            end
                            wait(0.5)
						end
					end
				end
			end)
		end
	end)
end)
local AutoBossToggle = Tabs.Farming:AddToggle("MyToggle", {Title = "AutoFarm Boss", Default = false })
AutoBossToggle:OnChanged(function(bool)
    Boss = bool
    spawn(function()
        while wait() and Boss do
            pcall(function()
                local Nig = Player.PlayerGui:FindFirstChild("Main"):FindFirstChild("ingame"):FindFirstChild("Missionstory")
                if not Nig.Visible then
                    for i,v in next, Workspace.bossdropmission.missions:GetChildren() do
                        for i,v in next, v:GetChildren() do
                            if v:IsA("Model") and v:FindFirstChild("loggys") and not Nig.Visible then
                                Teleport(CFrame.new(v.HumanoidRootPart.Position + Vector3.new(0,-7,0)))
                                v:FindFirstChild("CLIENTTALK"):FireServer()
							    v:FindFirstChild("CLIENTTALK"):FireServer("accept")
                                wait(0.5)
                            end
                        end
                    end
                end
                if Nig.Visible then
                    for i,v in next, Workspace.npc:GetChildren() do
                        if v:IsA("Model") and v:FindFirstChild("npctype") and not v.Head.mob.fram.name.info.Text:find("Spirit") and not v:FindFirstChild("rpaw") and string.find(Nig.bg.name.Text, v.Head.mob.fram.name.info.Text) and v.Head.CFrame.Y > -1000 then
                            Teleport(CFrame.new(v.HumanoidRootPart.Position + Vector3.new(0,0,-3)))
                            Player.Character.combat.update:FireServer("mouse1", true)  
                            Player.Character.combat.update:FireServer("mouse1", false)
                            local Anti = v:FindFirstChild("antiexploit", true)
                            if Anti then
                                Anti:Destroy()
                            end
                            local Humanoid = v:FindFirstChildWhichIsA("Humanoid")
                            if Humanoid.Health then
                                Humanoid.Health = -9e9
                            end
                            local fakehealth = v:FindFirstChild("fakehealth", true)
                            if fakehealth then
                                fakehealth.Value = -9e9
                            end
                            wait(0.5)
                        end
                    end
                end
            end)
        end
    end)
end)
local SemiToggle = Tabs.Farming:AddToggle("MyToggle", {Title = "Semi Kill Aura", Default = false })
SemiToggle:OnChanged(function(bool)
	Kill = bool
    spawn(function()
		while Kill do wait()
			pcall(function()
				for i,v in next, npc:GetChildren() do
					if v:IsA("Model") and v:FindFirstChildWhichIsA("Humanoid") then
						local Anti = v:FindFirstChild("antiexploit", true)
						if Anti then
							Anti:Destroy()
						end
						local Humanoid = v:FindFirstChildWhichIsA("Humanoid")
						if Humanoid.Health then
							Humanoid.Health = 0
						end 
						local fakehealth = v:FindFirstChild("fakehealth", true)
						if fakehealth then
							fakehealth.Value = 0
						end
					end
				end
			end)
		end
	end)
end)
local AutoMaruToggle = Tabs.Farming:AddToggle("MyToggle", {Title = "AutoFarm Maru", Default = false })
AutoMaruToggle:OnChanged(function(bool)
	Bosses2 = bool
	RunService.Stepped:Connect(function()
		if Bosses3 then
			NoClip()
		end
    end)
    spawn(function()
        while Bosses2 and wait() do
            pcall(function()
                local Nig = Player.PlayerGui:WaitForChild("Main"):WaitForChild("ingame"):WaitForChild("Missionstory")
                if not Nig.Visible then
                    for i, v in next, Workspace.MARUmission.missions:GetChildren() do
                        if v:IsA("Model") then
                            Teleport(CFrame.new(v.HumanoidRootPart.Position) * CFrame.new(0, -5, 3))
                            wait(1)
                            v:FindFirstChild("CLIENTTALK"):FireServer()
                            v:FindFirstChild("CLIENTTALK"):FireServer("accept")
                        end
                    end
                elseif Nig.Visible then
                    for i, v in next, npc:GetChildren() do
                        if v:IsA("Model") and v:FindFirstChild("npctype") and v.Head.CFrame.Y > -1000 then
                            Teleport(CFrame.new(v.HumanoidRootPart.Position) * CFrame.new(0, -7, 3))
                            wait(0.5)
                            Player.Character.combat.update:FireServer("mouse1", true)
                        end
                    end
                end
            end)
        end
    end)
end)
local B2Toggle = Tabs.Farming:AddToggle("MyToggle", {Title = "Happy Event Farm Gen 3", Default = false })
B2Toggle:OnChanged(function(bool)
    boo = bool
    RunService.Stepped:Connect(function()
        if boo then
            NoClip()
        end
    end)
    spawn(function()
        while wait() and boo do
           pcall(function()
                local Nig = Player.PlayerGui:WaitForChild("Main"):WaitForChild("ingame"):WaitForChild("Missionstory")
                if not Nig.Visible then
                    for i,v in next, workspace.HAPPYmission.missions.Hollow4:GetChildren() do
                        if v:IsA("Model") and v:FindFirstChild("loggys") and v:FindFirstChild("timer") then
                            Teleport(CFrame.new(v:FindFirstChild("HumanoidRootPart").Position + Vector3.new(0,-7,0)))
                            v:FindFirstChild("CLIENTTALK"):FireServer()
                            v:FindFirstChild("CLIENTTALK"):FireServer("accept")
                            wait(.5)
                        end
                    end
                end
                if Nig.Visible then
                    for i,v in next, Workspace.npc:GetChildren() do
                        if v:IsA("Model") and v:FindFirstChild("npctype") and v:FindFirstChild("bossdrop") and (string.find(v.Head.mob.fram.name.info.Text, "Happy")) and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Head.CFrame.Y > -1000 then
                            Teleport(CFrame.new(v.HumanoidRootPart.Position + Vector3.new(0, -7, 3)))
                            Player.Character.combat.update:FireServer("mouse1", true)
                            Player.Character.combat.update:FireServer("mouse1", false)
                            local Anti = v:FindFirstChild("antiexploit", true)
                            if Anti then 
                                Anti:Destroy()
                            end
                            local Humanoid = v:FindFirstChildWhichIsA("Humanoid")
                            if Humanoid.Health then
                                Humanoid.Health = -9e9
                            end 
                            local fakehealth = v:FindFirstChild("fakehealth", true)
                            if fakehealth then
                                fakehealth.Value = -9e9 
                            end
                            wait(0.5)
                        end
                    end
                end
            end)
        end
    end)
end)
local BeastFarmToggle = Tabs.Farming:AddToggle("TailBeastFarm", {Title = "Tail Beast Farm", Default = false })
BeastFarmToggle:OnChanged(function(bool)
	Bosses3 = A
	RunService.Stepped:Connect(function()
		if Bosses3 then
			NoClip()
		end
    end)
    spawn(function()
        while Bosses2 and wait() do
            pcall(function()
                local Nig = Player.PlayerGui:WaitForChild("Main"):WaitForChild("ingame"):WaitForChild("Missionstory")
                if not Nig.Visible then
                    for i, v in next, Workspace.MARUmission.missions:GetChildren() do
                        if v:IsA("Model") then
                            Teleport(CFrame.new(v.HumanoidRootPart.Position) * CFrame.new(0, -5, 3))
                            wait(1)
                            v:FindFirstChild("CLIENTTALK"):FireServer()
                            v:FindFirstChild("CLIENTTALK"):FireServer("accept")
                        end
                    end
                elseif Nig.Visible then
                    for i, v in next, Workspace.npc:GetChildren() do
                        if v:IsA("Model") and v:FindFirstChild("npctype") and v.Head.CFrame.Y > -1000 then
                            Teleport(CFrame.new(v.HumanoidRootPart.Position) * CFrame.new(0, -7, 3))
                            wait(0.5)
                            Player.Character.combat.update:FireServer("mouse1", true)
                        end
                    end
                end
            end)
        end
    end)

    Bosses3 = Options.TailBeastFarm.Value
end)
local AutoPressKeysToggle = Tabs.Farming:AddToggle("MyToggle", {Title = "Auto Press Keybinds", Default = false })
AutoPressKeysToggle:OnChanged(function(bool)
    D = bool
    spawn(function()
        while wait() and D do
            for i,v in next, Keys do wait()
                game:GetService("VirtualInputManager"):SendKeyEvent(true, v, false, game)
            end
        end
    end)
end)
local AutoRebirthToggle = Tabs.Farming:AddToggle("MyToggle", {Title = "Auto Rebirth", Default = false })
AutoRebirthToggle:OnChanged(function(bool)
    Rebirth = bool
    spawn(function()
        while wait() and Rebirth do
            if Player.statz.lvl:FindFirstChild("lvl").Value == 1000 and wait(1) then
                Player.startevent:FireServer("rankup")
            end
        end
    end)
end)
Tabs.Farming:AddSection('')
Tabs.Farming:AddSection('Player Farm')
local Dropdown = Tabs.Farming:AddDropdown("PlayerFarmDropdown", {
    Title = "Select Player: ",
    Values = GetPlayersString(),
    Multi = false,
    Default = 1,
})
local AutoFarmPlayerToggle = Tabs.Farming:AddToggle("MyToggle", {Title = "AutoFarm Player", Default = false })
AutoFarmPlayerToggle:OnChanged(function(bool)
    AutoPlayer = bool
    while AutoPlayer do task.wait()
        for i,v in pairs(game:GetService('Players'):GetChildren()) do
            if v.Name == tostring(Options.PlayerFarmDropdown.Value) then
                game.Players.LocalPlayer.Character:PivotTo(v.Character:GetPivot())
                game.Players.LocalPlayer.Character.combat.update:FireServer("mouse1", true)
                for i,v in next, Keys do wait()
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, v, false, game)
                end
            end
        end
    end
end)
local EspAllPlayersToggle = Tabs.Farming:AddToggle("MyToggle", {Title = "Esp All Players (beta)", Default = false })
EspAllPlayersToggle:OnChanged(function(bool)
    EspAll = bool
    if EspAll then
        esp.enabled = true
        esp.teamcheck = true

        esp.outlines = true
        esp.shortnames = true
        esp.team_boxes = {true,Color3.fromRGB(255,255,255),Color3.fromRGB(1,1,1),0}
        esp.team_chams = {true,Color3.fromRGB(138, 139, 194),Color3.fromRGB(138, 139, 194),.25,.75,true}
        esp.team_names = {true,Color3.fromRGB(255,255,255)}
        esp.team_weapon = { true, Color3.fromRGB(255,255,255)}
        esp.team_distance = true
        esp.team_health = true
    else
        esp.enabled = false
    end
end)
Tabs.Farming:AddButton({
    Title = "Refresh Dropdown",
    Description = "",
    Callback = function()
        Options.PlayerFarmDropdown:SetValues(GetPlayersString())
    end
})


local AutochakraToggle = Tabs.Points:AddToggle("ChakraValue", {Title = "Chakra", Default = false })
AutochakraToggle:OnChanged(function(bool)
    chakra = bool
    while ninjutsu do task.wait()
        local A_1 = "addstat"
        local A_2 = "chakra"
        local A_3 = 1
        local Event = game:GetService("Players").LocalPlayer.startevent
        Event:FireServer(A_1, A_2, A_3)
    end
end)
local AutoninjutsuToggle = Tabs.Points:AddToggle("NinjutsuValue", {Title = "Ninjutsu", Default = false })
AutoninjutsuToggle:OnChanged(function(bool)
    ninjutsu = bool
    while ninjutsu do task.wait()
        local A_1 = "addstat"
        local A_2 = "ninjutsu"
        local A_3 = 1
        local Event = game:GetService("Players").LocalPlayer.startevent
        Event:FireServer(A_1, A_2, A_3)
    end
end)
local AutoTaiToggle = Tabs.Points:AddToggle("TaijutsuValue", {Title = "Taijutsu", Default = false })
AutoTaiToggle:OnChanged(function(bool)
    taijutsu = bool
    while taijutsu do task.wait()
        local A_1 = "addstat"
        local A_2 = "taijutsu"
        local A_3 = 1
        local Event = game:GetService("Players").LocalPlayer.startevent
        Event:FireServer(A_1, A_2, A_3)
    end
end)
local AutoHpToggle = Tabs.Points:AddToggle("HealthValue", {Title = "Health", Default = false })
AutoHpToggle:OnChanged(function(bool)
    health = bool
    while health do task.wait()
        local A_1 = "addstat"
        local A_2 = "health"
        local A_3 = 1
        local Event = game:GetService("Players").LocalPlayer.startevent
        Event:FireServer(A_1, A_2, A_3)
    end
end)
local AutoAllPointsToggle = Tabs.Points:AddToggle("HealthValue", {Title = "Up All", Default = false })
AutoAllPointsToggle:OnChanged(function(bool)
    AutoAll = bool
    while AutoAll do task.wait()
        local A_1 = "addstat"
        local A_2 = "health"
        local A_3 = 1
        local Event0 = game:GetService("Players").LocalPlayer.startevent
        Event0:FireServer(A_1, A_2, A_3)
        local A_4 = "addstat"
        local A_5 = "taijutsu"
        local A_6 = 1
        local Event1 = game:GetService("Players").LocalPlayer.startevent
        Event1:FireServer(A_4, A_5, A_6)
        local A_7 = "addstat"
        local A_8 = "ninjutsu"
        local A_9 = 1
        local Event2 = game:GetService("Players").LocalPlayer.startevent
        Event2:FireServer(A_7, A_8, A_9)
        local A_10 = "addstat"
        local A_12 = "chakra"
        local A_13 = 1
        local Event3 = game:GetService("Players").LocalPlayer.startevent
        Event3:FireServer(A_10, A_12, A_13)
    end
end)


local InfJumpToggle = Tabs.Player:AddToggle("ChakraValue", {Title = "Infinite Jump", Default = false })
InfJumpToggle:OnChanged(function(bool)
    InfiniteJump = bool
    UserInputService.JumpRequest:connect(function()
        if InfiniteJump then
            Player.Character:FindFirstChildWhichIsA("Humanoid"):ChangeState("Jumping")
        end
    end)
end)
local NoclipToggle = Tabs.Player:AddToggle("ChakraValue", {Title = "Noclip", Default = false })
NoclipToggle:OnChanged(function(bool)
    Noclip = bool
    if bool then
        for i,v in pairs(workspace:GetDescendants()) do
            if v.ClassName == 'Part' or v.ClassName == 'MeshPart' then
                v.CanCollide = false
            end
        end
    else
        for i,v in pairs(workspace:GetDescendants()) do
            if v.ClassName == 'Part' or v.ClassName == 'MeshPart' then
                v.CanCollide = true
            end
        end
    end
end)
local FlyToggle = Tabs.Player:AddToggle("ChakraValue", {Title = "H Fly", Default = false })
FlyToggle:OnChanged(function(bool)
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
