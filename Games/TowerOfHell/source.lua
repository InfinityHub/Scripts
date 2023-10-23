local queue_on_teleport = queue_on_teleport or syn and syn.queue_on_teleport
queue_on_teleport[[
    repeat wait() until game:IsLoaded() print("ServerHoped or rejoined")
    wait(2)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/InfinityHub/Scripts/main/Games/TowerOfHell/source.lua",true))()
]]



-- Library --
getgenv().SecureMode = true
local ArrayField = loadstring(game:HttpGet('https://raw.githubusercontent.com/InfinityMercury/UiLibray/main/ArrayField/source.lua'))()
local Window = ArrayField:CreateWindow({
   Name = "Infinity Hub | "..game:GetService('MarketplaceService'):GetProductInfo(game.PlaceId).Name,
   LoadingTitle = "Infinity Hub",
   LoadingSubtitle = "by InfinityMercury",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Infinity Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "",
      RememberJoins = false
   },
   KeySystem = false,
   KeySettings = {
      Title = "Infinity Hub | Key System",
      Subtitle = "",
      Note = "thanks for use Infinity Hub, Have Fun",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Actions = {
            [1] = {
                	Text = 'Click here to copy the key <--',
                	OnPress = function()
                    	setclipboard([[Infinity Hub Loader]])
                	end,
                }
            },
      Key = {"Infinity Hub Loader"}
   }
})



-- code --
local scriptList = {'Script', 'shade', 'sectionorganizer'}
for _, v in pairs(workspace:GetChildren()) do if (v:IsA('Script')) and table.find(scriptList, v.Name) then v:Destroy() end end
local Tab = Window:CreateTab("Main", 10723424505)
local FarmingSection = Tab:CreateSection("[ Auto Farm ]", false)
local Button = Tab:CreateButton({
   Name = "Win",
   Interact = 'Click',
   SectionParent = FarmingSection,
   Callback = function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.tower.finishes.Finish.CFrame
   end,
})
local Button = Tab:CreateButton({
   Name = "Destroy Kill Wall",
   Interact = 'Click',
   SectionParent = FarmingSection,
   Callback = function()
      for _, v in pairs(workspace:GetDescendants()) do
         if (v:IsA('Part') and v.Name == 'killwall') then
            v:Destroy()
         end
      end
   end,
})
local Button = Tab:CreateButton({
   Name = "Destroy Kill Part",
   Interact = 'Click',
   SectionParent = FarmingSection,
   Callback = function()
      for _, v in pairs(workspace:GetDescendants()) do
         if (v:IsA('Part') and v.Name == 'killPart') then
            v:Destroy()
         end
      end
      for _, v in pairs(workspace:GetDescendants()) do
         if (v:IsA('Model') and v.Name == 'Killparts') then
            v:Destroy()
         end
      end
   end,
})
local PlayerSection = Tab:CreateSection("[ Local Player ]", false)
local Button = Tab:CreateButton({
   Name = "Infinite Jump",
   Interact = 'Click',
   SectionParent = PlayerSection,
   Callback = function()
      local Player = game:GetService'Players'.LocalPlayer;
      local UIS = game:GetService'UserInputService';
      _G.JumpHeight = 50
      
      function Action(Object, Function) if Object ~= nil then Function(Object); end end
      UIS.InputBegan:connect(function(UserInput)
          if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
              Action(Player.Character.Humanoid, function(self)
                  if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                      Action(self.Parent.HumanoidRootPart, function(self)
                          self.Velocity = Vector3.new(0, _G.JumpHeight, 0);
                      end)
                  end
              end)
          end
      end)
   end,
})
local Button = Tab:CreateButton({
   Name = "God Mode",
   Interact = 'Click',
   SectionParent = PlayerSection,
   Callback = function()
      game.Players.LocalPlayer.Character.KillScript.Enabled = false
   end,
})
local Button = Tab:CreateButton({
   Name = "Get All Tools",
   Interact = 'Click',
   SectionParent = PlayerSection,
   Callback = function()
      for _, v in pairs(game:GetService("ReplicatedStorage").Gear:GetChildren()) do
         if v:IsA('Tool') then
            local toolClone = v:Clone()
            toolClone.Parent = game.Players.LocalPlayer.Backpack
         end
      end
   end,
})
