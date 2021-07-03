local TweenService = game:GetService("TweenService")

local Styles = {
  Font = {
    Black = Enum.Font.GothamBlack,
    Normal = Enum.Font.Gotham
  },
  FontSize = 14
}

local function Dialog(props)
  local Gui = Instance.new('ScreenGui')
  Gui.Name = 'Dialog'

  local Frame = Instance.new('Frame')
  Frame.AnchorPoint = Vector2.new(0.5, 0)
  Frame.AutomaticSize = Enum.AutomaticSize.XY
  Frame.BackgroundColor3 = Color3.fromRGB(36,36,36)
  Frame.Position = UDim2.new(0.5, 0, 0, 32)
  Frame.Parent = Gui

  local FramePadding = Instance.new('UIPadding')
  FramePadding.PaddingTop = UDim.new(0,24)
  FramePadding.PaddingLeft = UDim.new(0,24)
  FramePadding.PaddingRight = UDim.new(0,24)
  FramePadding.PaddingBottom = UDim.new(0,24)
  FramePadding.Parent = Frame

  local FrameBorderRadius = Instance.new('UICorner')
  FrameBorderRadius.CornerRadius = UDim.new(0,6)
  FrameBorderRadius.Parent = Frame

  local FrameListLayout = Instance.new('UIListLayout')
  FrameListLayout.Padding = UDim.new(0,18)
  FrameListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
  FrameListLayout.Parent = Frame

  local TextLabel = Instance.new('TextLabel')
  TextLabel.Name = 'A Title'
  TextLabel.AutomaticSize = Enum.AutomaticSize.XY
  TextLabel.BackgroundTransparency = 1
  TextLabel.Font = Styles.Font.Black
  TextLabel.Text = props.Title
  TextLabel.TextColor3 = Color3.new(1,1,1)
  TextLabel.TextSize = Styles.FontSize+4
  TextLabel.Parent = Frame

  local TextLabel = Instance.new('TextLabel')
  TextLabel.Name = 'B Message'
  TextLabel.AutomaticSize = Enum.AutomaticSize.XY
  TextLabel.BackgroundTransparency = 1
  TextLabel.Font = Styles.Font.Normal
  TextLabel.LineHeight = 1.6
  TextLabel.Text = props.Body
  TextLabel.TextColor3 = Color3.new(1,1,1)
  TextLabel.TextSize = Styles.FontSize
  TextLabel.Parent = Frame

  local CloseButton = Instance.new('TextButton')
  CloseButton.Name = 'C Close Button'
  CloseButton.AutoButtonColor = false
  CloseButton.AutomaticSize = Enum.AutomaticSize.XY
  CloseButton.BackgroundColor3 = Color3.fromRGB(204,204,204)
  CloseButton.Font = Styles.Font.Black
  CloseButton.Text = 'Aye'
  CloseButton.TextSize = Styles.FontSize
  CloseButton.Parent = Frame

  local CloseButtonPadding = Instance.new('UIPadding')
  CloseButtonPadding.PaddingTop = UDim.new(0,8)
  CloseButtonPadding.PaddingLeft = UDim.new(0,8)
  CloseButtonPadding.PaddingRight = UDim.new(0,8)
  CloseButtonPadding.PaddingBottom = UDim.new(0,8)
  CloseButtonPadding.Parent = CloseButton

  local CloseButtonRadius = Instance.new('UICorner')
  CloseButtonRadius.CornerRadius = UDim.new(0,8)
  CloseButtonRadius.Parent = CloseButton

  -- States
  local Timing = TweenInfo.new(0.15)
  local States = {
    [CloseButton] = {}
  }

  States[CloseButton].initial = TweenService:Create(CloseButton, Timing, {
    BackgroundColor3 = Color3.fromRGB(204,204,204),
    TextColor3 = Color3.new(0,0,0)
  })

  States[CloseButton].hover = TweenService:Create(CloseButton, Timing, {
    BackgroundColor3 = Color3.fromRGB(63,158,255), -- #3f9eff
    TextColor3 = Color3.new(1,1,1)
  })

  States[CloseButton].active = TweenService:Create(CloseButton, Timing, {
    BackgroundColor3 = Color3.fromRGB(121, 184, 255),
  })

  -- Events
  local Connections = {}

  Connections[#Connections+1] = CloseButton.MouseEnter:Connect(function()
    States[CloseButton].hover:Play()
  end)

  Connections[#Connections+1] = CloseButton.MouseLeave:Connect(function()
    States[CloseButton].initial:Play()
  end)

  Connections[#Connections+1] = CloseButton.MouseButton1Down:Connect(function()
    States[CloseButton].active:Play()
  end)

  Connections[#Connections+1] = CloseButton.MouseButton2Down:Connect(function()
    States[CloseButton].active:Play()
  end)

  Connections[#Connections+1] = CloseButton.MouseButton1Click:Connect(function()
    -- To-do: add Maid
    for _, conn in pairs(Connections) do
      conn:Disconnect()
    end

    Gui:Destroy()
  end)

  return Gui
end

return Dialog