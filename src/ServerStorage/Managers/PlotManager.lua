-- Services
local CollectionService = game:GetService('CollectionService')
-- Tables
local Manager = {}

function Manager:FindUnoccupiedPlot()
  local Owner = nil

  for _, plot in pairs(self.Collection.Items) do
    Owner = plot:WaitForChild('Owner')

    if not Owner.Value then
      return plot
    end
  end

  return nil
end

function Manager:AssignPlot(player)
  local plot = self:FindUnoccupiedPlot()

  if plot then
    plot:WaitForChild('Owner').Value = player
    plot:WaitForChild('IsOccupied').Value = true
    player.RespawnLocation = plot:WaitForChild('Spawn')

    return true
  end

  return false
end

function Manager.Load(collection)
  Manager.Collection = collection
end

return Manager