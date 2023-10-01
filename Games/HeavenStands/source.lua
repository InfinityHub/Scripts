--// Library
local plrName = game.Players.LocalPlayer.Name
local char = game.Players.LocalPlayer.Character
local UserInputService = game:GetService("UserInputService")
local IsOnMobile = table.find({Enum.Platform.IOS, Enum.Platform.Android}, UserInputService:GetPlatform())
Players = game.Players
IYMouse = Players.LocalPlayer:GetMouse()
FLYING = false
QEfly = true
iyflyspeed = 1
vehicleflyspeed = 1
function GetPlayers()
    for _, v in pairs(workspace.Enemies:GetChildren()) do
        if (v:IsA('Model') and v.Name == tostring(plrName)) then
            return v
        end
    end
end
function FireButton(ButtonPath)
    local events = { "MouseButton1Click", "MouseButton1Down", "MouseButton1Up", "Activated" }
    local Button = ButtonPath
    for i, v in next, events do firesignal(Button[v]) end
end
function getRoot(char)
	local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
	return rootPart
end
function splitString(str,delim)
	local broken = {}
	if delim == nil then delim = "," end
	for w in string.gmatch(str,"[^"..delim.."]+") do
		table.insert(broken,w)
	end
	return broken
end
function toTokens(str)
	local tokens = {}
	for op,name in string.gmatch(str,"([+-])([^+-]+)") do
		table.insert(tokens,{Operator = op,Name = name})
	end
	return tokens
end
function onlyIncludeInTable(tab,matches)
	local matchTable = {}
	local resultTable = {}
	for i,v in pairs(matches) do matchTable[v.Name] = true end
	for i,v in pairs(tab) do if matchTable[v.Name] then table.insert(resultTable,v) end end
	return resultTable
end

function removeTableMatches(tab,matches)
	local matchTable = {}
	local resultTable = {}
	for i,v in pairs(matches) do matchTable[v.Name] = true end
	for i,v in pairs(tab) do if not matchTable[v.Name] then table.insert(resultTable,v) end end
	return resultTable
end
function getPlayersByName(Name)
	local Name,Len,Found = string.lower(Name),#Name,{}
	for _,v in pairs(Players:GetPlayers()) do
		if Name:sub(0,1) == '@' then
			if string.sub(string.lower(v.Name),1,Len-1) == Name:sub(2) then
				table.insert(Found,v)
			end
		else
			if string.sub(string.lower(v.Name),1,Len) == Name or string.sub(string.lower(v.DisplayName),1,Len) == Name then
				table.insert(Found,v)
			end
		end
	end
	return Found
end
local WorldToScreen = function(Object)
	local ObjectVector = workspace.CurrentCamera:WorldToScreenPoint(Object.Position)
	return Vector2.new(ObjectVector.X, ObjectVector.Y)
end
local MousePositionToVector2 = function()
	return Vector2.new(IYMouse.X, IYMouse.Y)
end
local GetClosestPlayerFromCursor = function()
	local found = nil
	local ClosestDistance = math.huge
	for i, v in pairs(Players:GetPlayers()) do
		if v ~= Players.LocalPlayer and v.Character and v.Character:FindFirstChildOfClass("Humanoid") then
			for k, x in pairs(v.Character:GetChildren()) do
				if string.find(x.Name, "Torso") then
					local Distance = (WorldToScreen(x) - MousePositionToVector2()).Magnitude
					if Distance < ClosestDistance then
						ClosestDistance = Distance
						found = v
					end
				end
			end
		end
	end
	return found
end
SpecialPlayerCases = {
	["all"] = function(speaker) return Players:GetPlayers() end,
	["others"] = function(speaker)
		local plrs = {}
		for i,v in pairs(Players:GetPlayers()) do
			if v ~= speaker then
				table.insert(plrs,v)
			end
		end
		return plrs
	end,
	["me"] = function(speaker)return {speaker} end,
	["#(%d+)"] = function(speaker,args,currentList)
		local returns = {}
		local randAmount = tonumber(args[1])
		local players = {unpack(currentList)}
		for i = 1,randAmount do
			if #players == 0 then break end
			local randIndex = math.random(1,#players)
			table.insert(returns,players[randIndex])
			table.remove(players,randIndex)
		end
		return returns
	end,
	["random"] = function(speaker,args,currentList)
		local players = Players:GetPlayers()
		local localplayer = Players.LocalPlayer
		table.remove(players, table.find(players, localplayer))
		return {players[math.random(1,#players)]}
	end,
	["%%(.+)"] = function(speaker,args)
		local returns = {}
		local team = args[1]
		for _,plr in pairs(Players:GetPlayers()) do
			if plr.Team and string.sub(string.lower(plr.Team.Name),1,#team) == string.lower(team) then
				table.insert(returns,plr)
			end
		end
		return returns
	end,
	["allies"] = function(speaker)
		local returns = {}
		local team = speaker.Team
		for _,plr in pairs(Players:GetPlayers()) do
			if plr.Team == team then
				table.insert(returns,plr)
			end
		end
		return returns
	end,
	["enemies"] = function(speaker)
		local returns = {}
		local team = speaker.Team
		for _,plr in pairs(Players:GetPlayers()) do
			if plr.Team ~= team then
				table.insert(returns,plr)
			end
		end
		return returns
	end,
	["team"] = function(speaker)
		local returns = {}
		local team = speaker.Team
		for _,plr in pairs(Players:GetPlayers()) do
			if plr.Team == team then
				table.insert(returns,plr)
			end
		end
		return returns
	end,
	["nonteam"] = function(speaker)
		local returns = {}
		local team = speaker.Team
		for _,plr in pairs(Players:GetPlayers()) do
			if plr.Team ~= team then
				table.insert(returns,plr)
			end
		end
		return returns
	end,
	["friends"] = function(speaker,args)
		local returns = {}
		for _,plr in pairs(Players:GetPlayers()) do
			if plr:IsFriendsWith(speaker.UserId) and plr ~= speaker then
				table.insert(returns,plr)
			end
		end
		return returns
	end,
	["nonfriends"] = function(speaker,args)
		local returns = {}
		for _,plr in pairs(Players:GetPlayers()) do
			if not plr:IsFriendsWith(speaker.UserId) and plr ~= speaker then
				table.insert(returns,plr)
			end
		end
		return returns
	end,
	["guests"] = function(speaker,args)
		local returns = {}
		for _,plr in pairs(Players:GetPlayers()) do
			if plr.Guest then
				table.insert(returns,plr)
			end
		end
		return returns
	end,
	["bacons"] = function(speaker,args)
		local returns = {}
		for _,plr in pairs(Players:GetPlayers()) do
			if plr.Character:FindFirstChild('Pal Hair') or plr.Character:FindFirstChild('Kate Hair') then
				table.insert(returns,plr)
			end
		end
		return returns
	end,
	["age(%d+)"] = function(speaker,args)
		local returns = {}
		local age = tonumber(args[1])
		if not age == nil then return end
		for _,plr in pairs(Players:GetPlayers()) do
			if plr.AccountAge <= age then
				table.insert(returns,plr)
			end
		end
		return returns
	end,
	["nearest"] = function(speaker,args,currentList)
		local speakerChar = speaker.Character
		if not speakerChar or not getRoot(speakerChar) then return end
		local lowest = math.huge
		local NearestPlayer = nil
		for _,plr in pairs(currentList) do
			if plr ~= speaker and plr.Character then
				local distance = plr:DistanceFromCharacter(getRoot(speakerChar).Position)
				if distance < lowest then
					lowest = distance
					NearestPlayer = {plr}
				end
			end
		end
		return NearestPlayer
	end,
	["farthest"] = function(speaker,args,currentList)
		local speakerChar = speaker.Character
		if not speakerChar or not getRoot(speakerChar) then return end
		local highest = 0
		local Farthest = nil
		for _,plr in pairs(currentList) do
			if plr ~= speaker and plr.Character then
				local distance = plr:DistanceFromCharacter(getRoot(speakerChar).Position)
				if distance > highest then
					highest = distance
					Farthest = {plr}
				end
			end
		end
		return Farthest
	end,
	["group(%d+)"] = function(speaker,args)
		local returns = {}
		local groupID = tonumber(args[1])
		for _,plr in pairs(Players:GetPlayers()) do
			if plr:IsInGroup(groupID) then  
				table.insert(returns,plr)
			end
		end
		return returns
	end,
	["alive"] = function(speaker,args)
		local returns = {}
		for _,plr in pairs(Players:GetPlayers()) do
			if plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") and plr.Character:FindFirstChildOfClass("Humanoid").Health > 0 then
				table.insert(returns,plr)
			end
		end
		return returns
	end,
	["dead"] = function(speaker,args)
		local returns = {}
		for _,plr in pairs(Players:GetPlayers()) do
			if (not plr.Character or not plr.Character:FindFirstChildOfClass("Humanoid")) or plr.Character:FindFirstChildOfClass("Humanoid").Health <= 0 then
				table.insert(returns,plr)
			end
		end
		return returns
	end,
	["rad(%d+)"] = function(speaker,args)
		local returns = {}
		local radius = tonumber(args[1])
		local speakerChar = speaker.Character
		if not speakerChar or not getRoot(speakerChar) then return end
		for _,plr in pairs(Players:GetPlayers()) do
			if plr.Character and getRoot(plr.Character) then
				local magnitude = (getRoot(plr.Character).Position-getRoot(speakerChar).Position).magnitude
				if magnitude <= radius then table.insert(returns,plr) end
			end
		end
		return returns
	end,
	["cursor"] = function(speaker)
		local plrs = {}
		local v = GetClosestPlayerFromCursor()
		if v ~= nil then table.insert(plrs, v) end
		return plrs
	end,
    ["npcs"] = function(speaker,args)
		local returns = {}
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("Model") and getRoot(v) and v:FindFirstChildWhichIsA("Humanoid") and Players:GetPlayerFromCharacter(v) == nil then
                local clone = Instance.new("Player")
                clone.Name = v.Name .. " - " .. v:FindFirstChildWhichIsA("Humanoid").DisplayName
                clone.Character = v
                table.insert(returns, clone)
            end
        end
		return returns
	end,
}
function getPlayer(list,speaker)
	if list == nil then return {speaker.Name} end
	local nameList = splitString(list,",")

	local foundList = {}

	for _,name in pairs(nameList) do
		if string.sub(name,1,1) ~= "+" and string.sub(name,1,1) ~= "-" then name = "+"..name end
		local tokens = toTokens(name)
		local initialPlayers = Players:GetPlayers()

		for i,v in pairs(tokens) do
			if v.Operator == "+" then
				local tokenContent = v.Name
				local foundCase = false
				for regex,case in pairs(SpecialPlayerCases) do
					local matches = {string.match(tokenContent,"^"..regex.."$")}
					if #matches > 0 then
						foundCase = true
						initialPlayers = onlyIncludeInTable(initialPlayers,case(speaker,matches,initialPlayers))
					end
				end
				if not foundCase then
					initialPlayers = onlyIncludeInTable(initialPlayers,getPlayersByName(tokenContent))
				end
			else
				local tokenContent = v.Name
				local foundCase = false
				for regex,case in pairs(SpecialPlayerCases) do
					local matches = {string.match(tokenContent,"^"..regex.."$")}
					if #matches > 0 then
						foundCase = true
						initialPlayers = removeTableMatches(initialPlayers,case(speaker,matches,initialPlayers))
					end
				end
				if not foundCase then
					initialPlayers = removeTableMatches(initialPlayers,getPlayersByName(tokenContent))
				end
			end
		end

		for i,v in pairs(initialPlayers) do table.insert(foundList,v) end
	end

	local foundNames = {}
	for i,v in pairs(foundList) do table.insert(foundNames,v.Name) end

	return foundNames
end
function NOFLY()
	FLYING = false
	if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end
	if Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
		Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
	end
	pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Custom end)
end
function sFLY(vfly)
	repeat wait() until Players.LocalPlayer and Players.LocalPlayer.Character and getRoot(Players.LocalPlayer.Character) and Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	repeat wait() until IYMouse
	if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end

	local T = getRoot(Players.LocalPlayer.Character)
	local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local SPEED = 0

	local function FLY()
		FLYING = true
		local BG = Instance.new('BodyGyro')
		local BV = Instance.new('BodyVelocity')
		BG.P = 9e4
		BG.Parent = T
		BV.Parent = T
		BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		BG.cframe = T.CFrame
		BV.velocity = Vector3.new(0, 0, 0)
		BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
		task.spawn(function()
			repeat wait()
				if not vfly and Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
					Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
				end
				if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
					SPEED = 50
				elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
					SPEED = 0
				end
				if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
					lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
				elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
				else
					BV.velocity = Vector3.new(0, 0, 0)
				end
				BG.cframe = workspace.CurrentCamera.CoordinateFrame
			until not FLYING
			CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			SPEED = 0
			BG:Destroy()
			BV:Destroy()
			if Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
				Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
			end
		end)
	end
	flyKeyDown = IYMouse.KeyDown:Connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = (vfly and vehicleflyspeed or iyflyspeed)
		elseif KEY:lower() == 's' then
			CONTROL.B = - (vfly and vehicleflyspeed or iyflyspeed)
		elseif KEY:lower() == 'a' then
			CONTROL.L = - (vfly and vehicleflyspeed or iyflyspeed)
		elseif KEY:lower() == 'd' then 
			CONTROL.R = (vfly and vehicleflyspeed or iyflyspeed)
		elseif QEfly and KEY:lower() == 'e' then
			CONTROL.Q = (vfly and vehicleflyspeed or iyflyspeed)*2
		elseif QEfly and KEY:lower() == 'q' then
			CONTROL.E = -(vfly and vehicleflyspeed or iyflyspeed)*2
		end
		pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Track end)
	end)
	flyKeyUp = IYMouse.KeyUp:Connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = 0
		elseif KEY:lower() == 's' then
			CONTROL.B = 0
		elseif KEY:lower() == 'a' then
			CONTROL.L = 0
		elseif KEY:lower() == 'd' then
			CONTROL.R = 0
		elseif KEY:lower() == 'e' then
			CONTROL.Q = 0
		elseif KEY:lower() == 'q' then
			CONTROL.E = 0
		end
	end)
	FLY()
end
function isNumber(str)
	if tonumber(str) ~= nil or str == 'inf' then
		return true
	end
end
function Ability()
	for _, v in pairs(game.Players.LocalPlayer.Data:GetChildren()) do
		if (v:IsA('StringValue') and v.Name == 'Ability') then
			return v.Value
		end
	end
end




--// Library
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/VisualRoblox/Roblox/main/UI-Libraries/Visual%20Command%20UI%20Library/Source.lua', true))()
local Window = Library:CreateWindow({
    Name = 'Infinity Hub | Command Bar (-)',
    IntroText = 'Infinity Hub | '..game:GetService('MarketplaceService'):GetProductInfo(game.PlaceId).Name,
    IntroIcon = 'rbxassetid://10723415766',
    IntroBlur = true,
    IntroBlurIntensity = 15,
    Theme = Library.Themes.nordicdark,
    Position = 'bottom',
    Draggable = true,
    Prefix = "-"
})
Window:CreateNotification('Welcome to Infinity Hub', "Prefix: -", 5)
Window:CreateNotification('Infinity Hub | Version', "1.5", 5)



--// Code
Window:AddCommand('--[ - Game - ]--', {''}, '', function(Arguments) end)
Window:AddCommand('FarmBox', {}, 'Collect all box in map', function(Arguments)
    for _, v in pairs(workspace.Item_Spawnner.Box:GetChildren()) do
        if v:IsA("MeshPart") then
          for _, v in pairs(v:GetChildren()) do
            if v.Base then
              game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Base.CFrame wait(.25)
              fireclickdetector(v.Base.ClickDetector);
            end
          end
        end
    end
end)
Window:AddCommand('InstaKill', {'Mob Name'}, 'Insta kill mob selected', function(Arguments)
    for _, v in pairs(workspace.Enemies:GetChildren()) do
        if (v:IsA('Model') and v.Name == 'Silver Chariot Requiem') then
            v.Name = 'SilverChariotRequiem'
        end
    end wait(.25)

    local Mob = Arguments[1]
    task.spawn(function()
        repeat task.wait()
            Enemies = workspace.Enemies:GetChildren()
            for i = 1, #Enemies do
                local v = Enemies[i]
                if v.Name == Mob and v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChildOfClass("Humanoid").Health > 0 then
                    game.Players.LocalPlayer.Character.PrimaryPart.CFrame = CFrame.new(v.PrimaryPart.Position + Vector3.new(0, 7, 0), v.PrimaryPart.Position)
                end
            end
        until 1+1==2
    end)
    for i,v in pairs(workspace.Enemies[Arguments[1]]:GetDescendants()) do
        if (v:IsA('Highlight')) then
            v:Destroy()
        end
    end
	if (Ability() == 'Marisa Kirisame' or 'Itadori' or 'Yuta' or 'Gojo' or 'Gojo (Young)' or 'Sukuna') then
		local ohEnumItem1 = Enum.UserInputType.MouseButton1
		local ohBoolean2 = true
		game:GetService("ReplicatedStorage").Remotes.Input:FireServer(ohEnumItem1, ohBoolean2)
	else
		local ohString1 = "MouseButton1"
		game:GetService("ReplicatedStorage").Remote_Events.Input_Remote:InvokeServer(ohString1)
	end
    wait(.5)
    workspace.Enemies[Arguments[1]].Head:Destroy()
end)
Window:AddCommand('MobsName', {}, 'Notify all mobs name', function(Arguments)
    Window:CreateNotification('Infinity Hub | Mobs', 'DIO, Garou, Vergil, SilverChariotRequiem, Sakuya Izayoi', 12)
end)
Window:AddCommand('DisableCharacterFunctions', {}, 'Disable character functions', function(Arguments)
    local findScript = {'CharacterFunctions', 'Character_Functions'}
    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if (v:IsA('LocalScript') and table.find(findScript, v.Name)) then
            v.Enabled = false
        end
    end
    repeat task.wait() game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 30 until game.Players.LocalPlayer.Character.Humanoid.Health == 0
end)
Window:AddCommand('TakeDamage', {'true / false'}, 'Starts an automatic farm to farm take damage to complete tasks.', function(Arguments)
    method = Arguments[1]
    if (method == 'true') then
        task.spawn(function()
            repeat task.wait()
                for _, v in pairs(workspace.Enemies:GetChildren()) do
                    if (v:IsA('Model') and v.Name == tostring(plrName)) then
                        for _, x in pairs(v:GetChildren()) do
                            if (x:IsA('Part') and x.Name == 'HumanoidRootPart') then
                                x.CFrame = workspace.Enemies['just a dummy but attacking'].HumanoidRootPart.CFrame * CFrame.new(0, 0, -2.5)
                            end
                        end
                    end
                end
            until method == 'false'
        end)
    end
end)
Window:AddCommand('DealDamage', {'true / false / start'}, 'Starts an automatic farm to farm take damage to complete tasks.', function(Arguments)
    method = Arguments[1]
    if (method == 'true') then
        repeat task.wait()
            for _, v in pairs(workspace.Enemies:GetChildren()) do
                if (v:IsA('Model') and v.Name == tostring(plrName)) then
                    for _, x in pairs(v:GetChildren()) do
                        if (x:IsA('Part') and x.Name == 'HumanoidRootPart') then
                            x.CFrame = workspace.Enemies['just a dummy'].HumanoidRootPart.CFrame * CFrame.new(0, 0, 2.5)
                        end
                    end
                end
            end
        until method == 'false'
    end
    if (method == 'start') then
        repeat task.wait()
			if (Ability() == 'Marisa Kirisame' or 'Itadori' or 'Yuta' or 'Gojo' or 'Gojo (Young)' or 'Sukuna') then
				local ohEnumItem1 = Enum.UserInputType.MouseButton1
				local ohBoolean2 = true
				game:GetService("ReplicatedStorage").Remotes.Input:FireServer(ohEnumItem1, ohBoolean2)
			else
				local ohString1 = "MouseButton1"
				game:GetService("ReplicatedStorage").Remote_Events.Input_Remote:InvokeServer(ohString1)
			end
        until method == 'false'
    end
end)
Window:AddCommand('FakeStand', {'Stand Name'}, 'Get a fake stand', function(Arguments)
    standName = Arguments[1]
    game.Players.LocalPlayer.Data.Ability.Value = standName
end)
Window:AddCommand('--[ - Player - ]--', {''}, '', function(Arguments) end)
Window:AddCommand('Speed', {'Amount'}, 'Modify speed in player', function(Arguments)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Arguments[1]
end)
Window:AddCommand('Goto', {'Target'}, 'Teleport to player', function(args, speaker)
    Players = game:GetService("Players")
	local players = getPlayer(args[1], speaker)
	for i,v in pairs(players)do
		if Players[v].Character ~= nil then
			if speaker.Character:FindFirstChildOfClass('Humanoid') and speaker.Character:FindFirstChildOfClass('Humanoid').SeatPart then
				speaker.Character:FindFirstChildOfClass('Humanoid').Sit = false
				wait(.1)
			end
			getRoot(speaker.Character).CFrame = getRoot(Players[v].Character).CFrame + Vector3.new(3,1,0)
		end
	end
end)
Window:AddCommand('Fly', {}, 'Fly player', function(args, speaker)
	if not IsOnMobile then
		NOFLY()
		wait()
		sFLY()
    else
        Window:Notify('Infinity Hub | Error', 'Mobile detected. This fly dont work in mobile', 5)
	end
	if args[1] and isNumber(args[1]) then
		iyflyspeed = args[1]
	end
end)
Window:AddCommand('UnFly', {}, 'Disable unfly', function(args, speaker)
    if not IsOnMobile then NOFLY() end
end)
