local Players = game:GetService('Players')
local ReplicatedStorage = game:GetService('ReplicatedStorage')

local player = Players.LocalPlayer
local Hotbar = require(ReplicatedStorage.core.gui.Hotbar)

local Gui = Hotbar:new(6) -- number of slots
Gui.Parent = player.PlayerGui

print(Gui.Name, 'Loaded')