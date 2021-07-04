local module = {
  playersWithPlots = {}
}

function attachLeaderstats(player)
  local Leaderstats = Instance.new('Folder')
  Leaderstats.Name = "leaderstats"
  Leaderstats.Parent = player

  local Dubloons = Instance.new('IntValue')
  Dubloons.Name  = 'Dubloons'
  Dubloons.Value = 0
  Dubloons.Parent = Leaderstats
end

-- To-do: check datastore if player has plot
function updatePlots(player, character)
  -- temporary
  local hasPlotFlag = Instance.new('BoolValue')
  hasPlotFlag.Name = 'HasPlot'
  hasPlotFlag.Value = true
  hasPlotFlag.Parent = player.Character

  table.insert(module.playersWithPlots, player)
end

module.PlayerAdded = function(player)
  attachLeaderstats(player)

  if player.Character then
    updatePlots(player, player.Character)
  end

  player.CharacterAdded:Connect(function(character)
    updatePlots(player, character)
  end)
end

module.getPlayersWithPlots = function()
  return module.playersWithPlots
end

return module