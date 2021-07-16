-- Services
local CollectionService = game:GetService('CollectionService')
local ServerStorage = game:GetService('ServerStorage')
-- Billboards
local BillboardGui = require(ServerStorage.BillboardGuis.CollectionChest)

-- Module
local TAG_NAME = 'Plot'
local module = {}
module.Items = {}

function LoadProperties(instance)
  local Owner = Instance.new('ObjectValue')
  Owner.Name = 'Owner'
  Owner.Value = nil
  Owner.Parent = instance

  local IsOccupied = Instance.new('BoolValue')
  IsOccupied.Name = 'IsOccupied'
  IsOccupied.Value = false
  IsOccupied.Parent = instance
end

function LoadChest(instance)
  local Chest = instance:WaitForChild('Chest')

  if not Chest then
    return print('CHEST NOT LOADED!', instance.Name)
  end

  BillboardGui.new().Parent = Chest
end

function module.Load()
  for _, instance in pairs(CollectionService:GetTagged(TAG_NAME)) do
    LoadProperties(instance)
    LoadChest(instance)

    module.Items[#module.Items+1] = instance
  end
end

return module