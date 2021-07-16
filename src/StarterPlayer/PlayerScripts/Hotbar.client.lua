-- DISABLE THIS IN-GAME FOR NOW!

-- Services
local Players = game:GetService('Players')
local StarterGui = game:getService('StarterGui')
local ReplicatedStorage = game:GetService('ReplicatedStorage')

-- Disable core backpack gui
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)

local Hotbar = require(ReplicatedStorage.core.gui.Hotbar)
local Player = Players.LocalPlayer
local Backpack = Players.LocalPlayer:WaitForChild('Backpack')

Backpack.Changed:Connect(function(prop)
  print(prop)
end)

Backpack.ChildAdded:Connect(function(tool)
  print(tool)
end)

Backpack.DescendantAdded:Connect(function(tool)
  print(tool)
end)

Player.Character.ChildAdded:Connect(function(instance)
  
end)

-- Create Gui instance
-- Accepts:
-- Backpack
-- Number of slots
local Gui = Hotbar:new(Backpack, 6)

if Gui then
  Gui.Parent = Player.PlayerGui
  print(Gui.Name, 'Loaded')
end
