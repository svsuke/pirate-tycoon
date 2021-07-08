-- Services
local CollectionService = game:GetService('CollectionService')
-- Tables
local Manager = {}

function Manager:FindUnoccupiedPlot()
  local Owner = nil

  for _, plot in pairs(Manager.Collection.Items) do
    print(plot)
    Owner = plot:WaitForChild('Owner')

    if Owner.Value == nil then
      return plot
    end
  end

  return nil
end

function Manager:AssignPlot(player)
  local plot = Manager:FindUnoccupiedPlot()

  if plot then
    plot:WaitForChild('Owner').Value = player
    plot:WaitForChild('IsOccupied').Value = true

    return true
  end

  return false
end

function Manager.Load(collection)
  Manager.Collection = collection
end

return Manager