local function CollectionChest()
  local Gui = Instance.new('BillboardGui')
  Gui.Size = UDim2.new(10,0,5,0)
  Gui.MaxDistance = 10

  local Frame = Instance.new('Frame')
  Frame.AutomaticSize = Enum.AutomaticSize.XY
  Frame.AnchorPoint = Vector2.new(0.5, 0)
  Frame.BackgroundColor3 = Color3.fromRGB(36,36,36)
  Frame.Position = UDim2.new(0.5, 0, 0, 0)
  Frame.Parent = Gui

  local FrameCorner = Instance.new('UICorner')
  FrameCorner.CornerRadius = UDim.new(0,8)
  FrameCorner.Parent = Frame
  
  local FrameList = Instance.new('UIListLayout')
  FrameList.Padding = UDim.new(0,14)
  FrameList.HorizontalAlignment = Enum.HorizontalAlignment.Center
  FrameList.Parent = Frame

  local FramePadding = Instance.new('UIPadding')
  FramePadding.PaddingTop = UDim.new(0,14)
  FramePadding.PaddingLeft = UDim.new(0,14)
  FramePadding.PaddingRight = UDim.new(0,14)
  FramePadding.PaddingBottom = UDim.new(0,14)
  FramePadding.Parent = Frame

  local TitleLabel = Instance.new('TextLabel')
  TitleLabel.Name = 'A'
  TitleLabel.AutomaticSize = Enum.AutomaticSize.XY
  TitleLabel.BackgroundTransparency = 1
  TitleLabel.Font = Enum.Font.GothamBlack
  TitleLabel.Text = 'Dubloons Income'
  TitleLabel.TextSize = 16
  TitleLabel.TextColor3 = Color3.new(1,1,1)
  TitleLabel.Parent = Frame

  local IncomeLabel = Instance.new('TextLabel')
  IncomeLabel.Name = 'B'
  IncomeLabel.AutomaticSize = Enum.AutomaticSize.XY
  IncomeLabel.BackgroundTransparency = 1
  IncomeLabel.Font = Enum.Font.GothamBlack
  IncomeLabel.Text = '234'
  IncomeLabel.TextSize = 14
  IncomeLabel.TextColor3 = Color3.new(1,1,0)
  IncomeLabel.Parent = Frame

  return Gui
end

return CollectionChest