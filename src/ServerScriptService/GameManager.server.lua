-- Services
local ServerStorage  = game:GetService("ServerStorage")
local PlayersService = game:GetService("Players")
-- Modules
local Managers      = ServerStorage.Managers
local PlotManager   = require(Managers.PlotManager)
local IncomeManager = require(Managers.IncomeManager)

-- Event listeners
PlayersService.PlayerAdded:Connect(PlotManager.PlayerAdded)

local prevTime = os.time()

while wait() do
  local currTime = os.time()

  if (currTime - prevTime) >= 2 then
    local playersWithPlots = PlotManager.getPlayersWithPlots()
    
    for _, player in pairs(playersWithPlots) do
      IncomeManager.calculateIncome(player)
    end

    prevTime = currTime
  end
end