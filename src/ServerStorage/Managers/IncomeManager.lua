local module = {}

module.calculateIncome = function(player)
  -- To-do: add this to chest capacity
  -- then when chest is collected, update leaderstats
  -- (IncomeCollectorManager)
  local Leaderstats = player.leaderstats
  local Dubloons = Leaderstats and Leaderstats:FindFirstChild('Dubloons')

  if Dubloons then
    Dubloons.Value += 2
  end
end

return module