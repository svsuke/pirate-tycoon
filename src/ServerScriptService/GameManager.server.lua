-- Services
local ServerStorage  = game:GetService("ServerStorage")
local PlayersService = game:GetService("Players")
-- Aliases
local Managers    = ServerStorage.Managers
local Collections = ServerStorage.Collections
-- Managers
local PlotManager   = require(Managers.PlotManager)
local IncomeManager = require(Managers.IncomeManager)
-- Collections
local PlotCollection = require(Collections.PlotCollection)
local SpawnPointCollection = require(Collections.SpawnPointCollection)

-- Load Collections
PlotCollection.Load()
SpawnPointCollection.Load()
-- Load Managers
PlotManager.Load(PlotCollection)

-- Event listeners
PlayersService.PlayerAdded:Connect(function(player)
  local assigned = PlotManager.AssignPlot(player)

  if assigned then
    print('Assigned a plot to', player.Name)
  end
end)