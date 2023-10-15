-- Get Spawn --
for _, v in pairs(workspace.Candies:GetChildren()) do
	if (v:IsA('Part') and v.Name == 'spawn') then
		game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
        wait(.25)
	end
end

-- Collect Candy --
for _, v in pairs(workspace.Candies:GetChildren()) do
	if (v:IsA('MeshPart') and v.Name == 'candy') then
		fireclickdetector(v.ClickDetector)
	end
end

-- Save Dava --
wait(2.5)
game:GetService("ReplicatedStorage").REvents.Internal.Save:InvokeServer()
