local TweenService = game:GetService('TweenService')
local UserInputService = game:GetService('UserInputService')
local Players = game:GetService('Players')

local Player = Players.LocalPlayer

local Component = {
  States = {},
  Connections = {},
  Slots = {},
  Selected = nil
}

function Component:HighlightSlot(n)
  if self.Selected then
    self.States[self.Selected].Initial:Play()
  end

  for _, Slot in pairs(self.Slots) do
    if Slot.Name == 'Slot'..n then
      self.States[Slot].Selected:Play()
      self.Selected = Slot
    end
  end
end

function Component:GenerateSlots(container, count)
  local Timing = TweenInfo.new(0.15)

  for i=1, count do
    local Slot = Instance.new('Frame')
    Slot.Name = 'Slot'..i
    Slot.BackgroundColor3 = Color3.fromRGB(70,70,70)
    Slot.BorderColor3 = Color3.new(0,0,0)
    -- Slot.BorderMode = Enum.BorderMode.Inset
    Slot.BorderSizePixel = 1
    Slot.Size = UDim2.new(0,48,0,48)
    Slot.Parent = container
    table.insert(self.Slots, Slot)
    
    local SlotCorner = Instance.new('UICorner')
    SlotCorner.CornerRadius = UDim.new(0,6)
    -- SlotCorner.Parent = Slot

    local SlotKeyBindLabel = Instance.new('TextLabel')
    SlotKeyBindLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    SlotKeyBindLabel.AutomaticSize = Enum.AutomaticSize.XY
    SlotKeyBindLabel.BackgroundTransparency = 1
    SlotKeyBindLabel.Font = Enum.Font.GothamBlack
    SlotKeyBindLabel.Position = UDim2.new(-0.1, 0, -0.1, 0)
    SlotKeyBindLabel.Text = 'A'
    SlotKeyBindLabel.TextColor3 = Color3.new(1,1,0)
    SlotKeyBindLabel.TextSize = 14
    -- TextLabel breaks Hotbar's automaticsize for unknown reason
    -- SlotKeyBindLabel.Parent = Slot

    -- Update states
    self.States[Slot] = {}
    
    self.States[Slot].Initial = TweenService:Create(Slot, Timing, {
      BorderColor3 = Color3.new(0,0,0)
    })

    self.States[Slot].Hover = TweenService:Create(Slot, Timing, {
      BorderColor3 = Color3.new(1,1,0)
    })

    self.States[Slot].Selected = TweenService:Create(Slot, Timing, {
      BorderColor3 = Color3.fromRGB(255, 150, 0)
    })

    -- Update connections
    self.Connections[Slot] = {}

    self.Connections[Slot].MouseEnter = Slot.MouseEnter:Connect(function()
      self.States[Slot].Hover:Play()
    end)

    self.Connections[Slot].MouseLeave = Slot.MouseLeave:Connect(function()
      self.States[Slot].Initial:Play()
    end)
  end
end

function Component:new(backpack, slotCount)
-- Hotbar is useless otherwise
  if not backpack then
    print('Backpack not found')
    return nil
  end

  local Gui = Instance.new('ScreenGui')
  Gui.Name = 'Hotbar'
  
  local Frame = Instance.new('Frame')
  Frame.AnchorPoint = Vector2.new(0.5, 1)
  Frame.AutomaticSize = Enum.AutomaticSize.XY
  Frame.BackgroundColor3 = Color3.fromRGB(36,36,36)
  Frame.Position = UDim2.new(0.5, 0, 1, -24)
  Frame.Parent = Gui

  local PaddingVal = 10

  local FramePadding = Instance.new('UIPadding')
  FramePadding.PaddingTop = UDim.new(0,PaddingVal)
  FramePadding.PaddingLeft = UDim.new(0,PaddingVal)
  FramePadding.PaddingRight = UDim.new(0,PaddingVal)
  FramePadding.PaddingBottom = UDim.new(0,PaddingVal)
  FramePadding.Parent = Frame

  local FrameBorderRadius = Instance.new('UICorner')
  FrameBorderRadius.CornerRadius = UDim.new(0,6)
  FrameBorderRadius.Parent = Frame

  local FrameListLayout = Instance.new('UIListLayout')
  FrameListLayout.FillDirection = Enum.FillDirection.Horizontal
  FrameListLayout.Padding = UDim.new(0,PaddingVal)
  FrameListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
  FrameListLayout.Parent = Frame

  self:GenerateSlots(Frame, slotCount)

  UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed then
      if input.UserInputType == Enum.UserInputType.MouseButton1 then
        local item = game.Players.LocalPlayer.Backpack:GetChildren()[1]
        print(item)
        if item then
          print(item.TextureId)
        end

      elseif input.UserInputType == Enum.UserInputType.Keyboard then
        local key = input.KeyCode
        local code = key.Value
        local first = Enum.KeyCode.One.Value
        local last = first + slotCount-1
        
        if code >= first and code <= last then
          self:HighlightSlot(code-48)
        end
      end
    else
      print('ignore')
    end
  end)

  return Gui
end

return Component