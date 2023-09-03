local Button = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local UIStroke = Instance.new("UIStroke")
local UICorner = Instance.new("UICorner")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local HitBox = Instance.new("ImageButton")
local UICorner_2 = Instance.new("UICorner")


Button.Name = "Button"
Button.Parent = (game:GetService("CoreGui") or gethui())
Button.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = Button
Main.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.478066564, 0, 0.0479292981, 0)
Main.Size = UDim2.new(0, 33, 0, 32)

UIStroke.Thickness = 0.000
UIStroke.Parent = Main

UICorner.CornerRadius = UDim.new(1, 8)
UICorner.Parent = Main

UIAspectRatioConstraint.Parent = Main
UIAspectRatioConstraint.AspectRatio = 1.015

HitBox.Name = "HitBox"
HitBox.Parent = Main
HitBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HitBox.BackgroundTransparency = 1.000
HitBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
HitBox.BorderSizePixel = 0
HitBox.Position = UDim2.new(0.0923507512, 0, 0.218749762, -3)
HitBox.Size = UDim2.new(0, 26, 0, 24)
HitBox.Image = "rbxassetid://7733964640"

UICorner_2.CornerRadius = UDim.new(1, 8)
UICorner_2.Parent = HitBox


local function OABZ_fake_script()
	local script = Instance.new('LocalScript', HitBox)

	local a = script.Parent
	local KeyPress = function(v)
		return game:GetService("VirtualInputManager"):SendKeyEvent(true, v, false, game)
	end
	
	a.MouseButton1Click:Connect(function ()
		KeyPress('J')
	end)
end
coroutine.wrap(OABZ_fake_script)()
