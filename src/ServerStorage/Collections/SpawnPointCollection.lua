local CollectionService = game:GetService('CollectionService')

local TAG_NAME = 'SpawnPoint'
local module = {}
module.Items = {}

function module.Load()
  for _, instance in pairs(CollectionService:GetTagged(TAG_NAME)) do
    instance.CanCollide = false
    instance.Transparency = 1
    instance:WaitForChild('Decal'):Destroy()
    -- Insert to collection
    module.Items[#module.Items+1] = instance
  end
end

return module
