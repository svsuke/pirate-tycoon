-- Services
local ServerStorage  = game:GetService("ServerStorage")
local PlayersService = game:GetService("Players")
-- Modules
local PlotManager   = require(ServerStorage.PlotManager)
local IncomeManager = require(ServerStorage.IncomeManager)

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