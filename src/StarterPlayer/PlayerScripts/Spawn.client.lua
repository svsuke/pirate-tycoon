-- The main script that runs when the player spawns

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local Dialog = require(ReplicatedStorage.core.gui.Dialog)

local Gui = Dialog({
  Title = 'YARRGH! Welcome to Pirate Tycoon',
  Body  = 'To become a captain, claim a new port along the docks\nand enter the leagues of piracy!'
})
Gui.Parent = player.PlayerGui

print("Gui Loaded")