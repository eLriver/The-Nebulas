local Nebulas = {}

local input = game:GetService("UserInputService")
local run = game:GetService("RunService")
local tween = game:GetService("TweenService")
local tweeninfo = TweenInfo.new
local mouse = game:GetService("Players").LocalPlayer:GetMouse()

local Utility = {}
local Objects = {}
function Nebulas:MakeDraggable(frame, parent)

	parent = parent or frame

	-- stolen from wally or kiriot, :>
	local dragging = false
	local dragInput, mousePos, framePos

	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			mousePos = input.Position
			framePos = parent.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			dragInput = input
		end
	end)

	input.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - mousePos
			parent.Position  = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
		end
	end)
end

function Utility:TweenObject(obj, properties, duration, ...)
	tween:Create(obj, tweeninfo(duration, ...), properties):Play()
end


local themeStyles = {
	DarkTheme = {
		Background = Color3.fromRGB(28, 28, 28), -- BG
		AColor = Color3.fromRGB(43, 43, 43), -- Line, BGofElement
		BColor = Color3.fromRGB(70, 70, 70), -- SliderButton, SliderValue
		CColor = Color3.fromRGB(170, 146, 250), -- TabOn, SelectedOption, BetweenSectionLine
		DColor = Color3.fromRGB(131, 131, 131), -- GameName, Label
		EColor = Color3.fromRGB(226, 226, 226), -- Every Other Text
		FColor = Color3.fromRGB(127, 110, 188), -- Button, SliderLiner
		GColor = Color3.fromRGB(35, 35, 35) -- ElementButtonColor
	},
}
local oldTheme = ""

local LibName = "The Nebulas"
--local numLetters = math.random(5,20) for i = 1,numLetters do LibName = string.char(math.random(97,122)) end

function Nebulas:ToggleUI()
	input.InputBegan:Connect(function (Input)
		if Input.KeyCode == Enum.KeyCode.RightControl and game.CoreGui[LibName]["Window"].Visible == true then
			game.CoreGui[LibName]["Window"].Visible = false
		elseif Input.KeyCode == Enum.KeyCode.RightControl and game.CoreGui[LibName]["Window"].Visible == false then
			game.CoreGui[LibName]["Window"].Visible = true
		end
	end)
end



function Nebulas:CreateWindow(gName)
	gName = gName or "Game"
	table.insert(Nebulas, gName)
	for i,v in pairs(game.CoreGui:GetChildren()) do
		if v:IsA("ScreenGui") and v.Name == LibName then
			v:Destroy()
		end
	end

	local ScreenGui = Instance.new("ScreenGui")
	local Window = Instance.new("Frame")
	local Background = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local HorizonLine = Instance.new("Frame")
	local VerticalLine = Instance.new("Frame")
	local TopBar = Instance.new("Frame")
	local NebulasLogo = Instance.new("ImageLabel")
	local UICorner_2 = Instance.new("UICorner")
	local Creator = Instance.new("TextLabel")
	local TabFrame = Instance.new("Frame")
	local GameName = Instance.new("TextLabel")
	local TabScrolling = Instance.new("ScrollingFrame")
	local UIListLayout = Instance.new("UIListLayout")
	local ContainerFrame = Instance.new("Frame")
	local NebulasLogo_2 = Instance.new("ImageButton")
	local UICorner_31 = Instance.new("UICorner")

	Nebulas:MakeDraggable(TopBar, Window)
	Nebulas:ToggleUI()

	ScreenGui.Name = LibName
	ScreenGui.Parent = game.CoreGui
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ScreenGui.ResetOnSpawn = false

	Window.Name = "Window"
	Window.Parent = ScreenGui
	Window.AnchorPoint = Vector2.new(0.5, 0.5)
	Window.BackgroundColor3 = Color3.fromRGB(217, 217, 217)
	Window.BackgroundTransparency = 1.000
	Window.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Window.BorderSizePixel = 0
	Window.Position = UDim2.new(0, 635, 0, 394)
	Window.Size = UDim2.new(0, 600, 0, 360)

	Background.Name = "Background"
	Background.Parent = Window
	Background.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
	Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Background.BorderSizePixel = 0
	Background.Size = UDim2.new(0, 600, 0, 360)

	UICorner.Parent = Background

	HorizonLine.Name = "Horizon Line"
	HorizonLine.Parent = Background
	HorizonLine.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
	HorizonLine.BorderColor3 = Color3.fromRGB(0, 0, 0)
	HorizonLine.BorderSizePixel = 0
	HorizonLine.Position = UDim2.new(0, 0, 0, 36)
	HorizonLine.Size = UDim2.new(0, 600, 0, 2)

	VerticalLine.Name = "Vertical Line"
	VerticalLine.Parent = Background
	VerticalLine.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
	VerticalLine.BorderColor3 = Color3.fromRGB(0, 0, 0)
	VerticalLine.BorderSizePixel = 0
	VerticalLine.Position = UDim2.new(0, 196, 0, 0)
	VerticalLine.Size = UDim2.new(0, 2, 0, 360)

	TopBar.Name = "TopBar"
	TopBar.Parent = Window
	TopBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TopBar.BackgroundTransparency = 1.000
	TopBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TopBar.BorderSizePixel = 0
	TopBar.Size = UDim2.new(0, 600, 0, 36)

	NebulasLogo.Name = "NebulasLogo"
	NebulasLogo.Parent = TopBar
	NebulasLogo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NebulasLogo.BackgroundTransparency = 1.000
	NebulasLogo.BorderColor3 = Color3.fromRGB(0, 0, 0)
	NebulasLogo.BorderSizePixel = 0
	NebulasLogo.Position = UDim2.new(0, 10, 0, 5)
	NebulasLogo.Size = UDim2.new(0, 25, 0, 25)
	NebulasLogo.Image = "rbxassetid://16818065507"

	UICorner_2.CornerRadius = UDim.new(1, 0)
	UICorner_2.Parent = NebulasLogo

	Creator.Name = "Creator"
	Creator.Parent = TopBar
	Creator.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
	Creator.BackgroundTransparency = 1.000
	Creator.BorderSizePixel = 0
	Creator.Position = UDim2.new(0, 45, 0, 7)
	Creator.Size = UDim2.new(0, 137, 0, 20)
	Creator.Font = Enum.Font.GothamBold
	Creator.Text = "The Nebulas"
	Creator.TextColor3 = Color3.fromRGB(226, 226, 226)
	Creator.TextSize = 18.000
	Creator.TextXAlignment = Enum.TextXAlignment.Left

	TabFrame.Name = "TabFrame"
	TabFrame.Parent = Window
	TabFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabFrame.BackgroundTransparency = 1.000
	TabFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabFrame.BorderSizePixel = 0
	TabFrame.Position = UDim2.new(0, 0, 0, 38)
	TabFrame.Size = UDim2.new(0, 196, 0, 322)

	GameName.Name = "GameName"
	GameName.Parent = TabFrame
	GameName.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
	GameName.BackgroundTransparency = 1.000
	GameName.BorderSizePixel = 0
	GameName.Position = UDim2.new(0, 15, 0, 11)
	GameName.Size = UDim2.new(0, 173, 0, 20)
	GameName.Font = Enum.Font.GothamBold
	GameName.Text = gName
	GameName.TextColor3 = Color3.fromRGB(131, 131, 131)
	GameName.TextSize = 14.000
	GameName.TextXAlignment = Enum.TextXAlignment.Left

	TabScrolling.Name = "TabScrolling"
	TabScrolling.Parent = TabFrame
	TabScrolling.Active = true
	TabScrolling.BackgroundColor3 = Color3.fromRGB(67, 67, 67)
	TabScrolling.BackgroundTransparency = 1.000
	TabScrolling.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabScrolling.BorderSizePixel = 0
	TabScrolling.Position = UDim2.new(0, 0, 0, 35)
	TabScrolling.Size = UDim2.new(0, 196, 0, 287)
	TabScrolling.CanvasSize = UDim2.new(0, 0, 0, 0)
	TabScrolling.ScrollBarThickness = 4

	UIListLayout.Parent = TabScrolling
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 5)

	ContainerFrame.Name = "ContainerFrame"
	ContainerFrame.Parent = Window
	ContainerFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ContainerFrame.BackgroundTransparency = 1.000
	ContainerFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ContainerFrame.BorderSizePixel = 0
	ContainerFrame.ClipsDescendants = true
	ContainerFrame.Position = UDim2.new(0, 198, 0, 50)
	ContainerFrame.Size = UDim2.new(0, 402, 0, 297)

	NebulasLogo_2.Name = "NebulasLogo"
	NebulasLogo_2.Parent = ScreenGui
	NebulasLogo_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NebulasLogo_2.BackgroundTransparency = 1.000
	NebulasLogo_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	NebulasLogo_2.BorderSizePixel = 0
	NebulasLogo_2.Position = UDim2.new(0.48037678, 0, 0.0634517968, 0)
	NebulasLogo_2.Size = UDim2.new(0, 50, 0, 50)
	NebulasLogo_2.Image = "rbxassetid://16818065507"
	local Holding = false
	local Dragging = false
	local lasPosX, lasPosY = mouse.X, mouse.Y
	NebulasLogo_2.MouseButton1Down:Connect(function()
		Holding = true
		Nebulas:MakeDraggable(NebulasLogo_2, NebulasLogo_2)
		mouse.Move:Connect(function()
			if Holding then
				Dragging = true
			end
		end)
		Dragging = false
	end)
	NebulasLogo_2.MouseButton1Up:Connect(function()
		Holding = false
		if not Dragging then
			if Window.Visible == true then
				Window.Visible = false
			else
				Window.Visible = true
			end
		end
	end)

	UICorner_31.CornerRadius = UDim.new(1, 0)
	UICorner_31.Parent = NebulasLogo_2

	local Tabs = {}

	local first = true

	function Tabs:CreateTab(tabName)
		tabName = tabName or "Tab"

		local OptionFrame = Instance.new("Frame")
		local TextButton = Instance.new("TextButton")
		local Selected = Instance.new("Frame")
		local UICorner_3 = Instance.new("UICorner")
		local ContainerScrolling = Instance.new("ScrollingFrame")
		local ContainingFrame = Instance.new("Frame")
		local UIListLayout_2 = Instance.new("UIListLayout")

		OptionFrame.Name = "OptionFrame"
		OptionFrame.Parent = TabScrolling
		OptionFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		OptionFrame.BackgroundTransparency = 1.000
		OptionFrame.BorderSizePixel = 0
		OptionFrame.Size = UDim2.new(0, 196, 0, 30)

		TextButton.Parent = OptionFrame
		TextButton.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
		TextButton.BackgroundTransparency = 1.000
		TextButton.BorderSizePixel = 0
		TextButton.Position = UDim2.new(0, 30, 0, 0)
		TextButton.Size = UDim2.new(0, 166, 0, 30)
		TextButton.AutoButtonColor = false
		TextButton.Font = Enum.Font.GothamBold
		TextButton.Text = tabName
		TextButton.TextColor3 = Color3.fromRGB(228, 228, 228) -- Color3.fromRGB(170, 146, 250)
		TextButton.TextSize = 16.000
		TextButton.TextXAlignment = Enum.TextXAlignment.Left

		Selected.Name = "Selected"
		Selected.Parent = OptionFrame
		Selected.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
		Selected.BackgroundTransparency = 1
		Selected.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Selected.BorderSizePixel = 0
		Selected.Position = UDim2.new(0, 16, 0, 0)
		Selected.Size = UDim2.new(0, 166, 0, 32)
		Selected.ZIndex = 0
		Selected.Visible = true

		UICorner_3.Parent = Selected

		ContainerScrolling.Name = "ContainerScrolling"
		ContainerScrolling.Parent = ContainerFrame
		ContainerScrolling.Active = true
		ContainerScrolling.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ContainerScrolling.BackgroundTransparency = 1.000
		ContainerScrolling.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ContainerScrolling.BorderSizePixel = 0
		ContainerScrolling.Size = UDim2.new(0, 402, 0, 297)
		ContainerScrolling.CanvasPosition = Vector2.new(0, 0)
		ContainerScrolling.CanvasSize = UDim2.new(0, 0, 0, 0)
		ContainerScrolling.ScrollBarThickness = 5
		ContainerScrolling.Visible = false

		ContainingFrame.Name = "ContainingFrame"
		ContainingFrame.Parent = ContainerScrolling
		ContainingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ContainingFrame.BackgroundTransparency = 1.000
		ContainingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ContainingFrame.BorderSizePixel = 0
		ContainingFrame.ClipsDescendants = true
		ContainingFrame.Position = UDim2.new(0, 17, 0, 0)
		ContainingFrame.Size = UDim2.new(0, 365, 0, 0)

		UIListLayout_2.Parent = ContainingFrame
		UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_2.Padding = UDim.new(0, 10)

		local function UpdateSize()
			-- Update ContainerScrolling - 3 and ContainingFrame
			local cS = UIListLayout_2.AbsoluteContentSize

			game.TweenService:Create(ContainerScrolling, tweeninfo(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				CanvasSize = UDim2.new(0, cS.X, 0, cS.Y - 3)
			}):Play()
			game.TweenService:Create(ContainingFrame, tweeninfo(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				Size = UDim2.new(0, cS.X, 0, cS.Y - 3)
			}):Play()
		end

		if first then
			first = false
			ContainerScrolling.Visible = true
			Selected.BackgroundTransparency = 0
			TextButton.TextColor3 = Color3.fromRGB(170, 146, 250)
			UpdateSize()
		else
			ContainerScrolling.Visible = false
			Selected.BackgroundTransparency = 1
			TextButton.TextColor3 = Color3.fromRGB(228, 228, 228)
		end

		table.insert(Tabs, tabName)

		UpdateSize()
		ContainerScrolling.ChildAdded:Connect(UpdateSize)
		ContainerScrolling.ChildRemoved:Connect(UpdateSize)

		TextButton.MouseButton1Click:Connect(function ()
			UpdateSize()
			for i,v in next, ContainerFrame:GetChildren() do
				v.Visible = false
			end
			ContainerScrolling.Visible = true
			for i,v in next, TabScrolling:GetChildren() do
				if v:IsA("Frame") and v.Selected and v.TextButton then
					Utility:TweenObject(v.TextButton, {TextColor3 = Color3.fromRGB(228, 228, 228)}, 0.2)
					Utility:TweenObject(v.Selected, {BackgroundTransparency = 1}, 0.2)
				end
			end
			Utility:TweenObject(TextButton, {TextColor3 = Color3.fromRGB(170, 146, 250)}, 0.2)
			Utility:TweenObject(Selected, {BackgroundTransparency = 0}, 0.2)
		end)

		local Sections = {}

		function Sections:CreateSection(secName)
			secName = secName or "Section"
			local sectionFrame = Instance.new("Frame")
			local TextLabel_13 = Instance.new("TextLabel")
			local inSection = Instance.new("Frame")
			local UIListLayout_3 = Instance.new("UIListLayout")
			local btwSectionLine = Instance.new("Frame")

			sectionFrame.Name = "sectionFrame"
			sectionFrame.Parent = ContainingFrame
			sectionFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			sectionFrame.BackgroundTransparency = 1.000
			sectionFrame.BorderSizePixel = 0
			sectionFrame.ClipsDescendants = false
			sectionFrame.Size = UDim2.new(0, 365, 0, 818)

			for i,v in pairs(inSection:GetChildren()) do
				while wait() do
					if v:IsA("Frame") then
						function size(pro)
							if pro == "Size" then
								UpdateSize()
								UpdateSectionFrame()
							end
						end
						v.Changed:Connect(size)
					end
				end
			end

			TextLabel_13.Parent = sectionFrame
			TextLabel_13.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_13.BackgroundTransparency = 1.000
			TextLabel_13.BorderSizePixel = 0
			TextLabel_13.Size = UDim2.new(0, 365, 0, 30)
			TextLabel_13.Font = Enum.Font.GothamBold
			TextLabel_13.Text = "Auto Farm"
			TextLabel_13.TextColor3 = Color3.fromRGB(226, 226, 226)
			TextLabel_13.TextSize = 16.000
			TextLabel_13.TextXAlignment = Enum.TextXAlignment.Left

			inSection.Name = "inSection"
			inSection.Parent = sectionFrame
			inSection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			inSection.BackgroundTransparency = 1.000
			inSection.BorderColor3 = Color3.fromRGB(0, 0, 0)
			inSection.BorderSizePixel = 0
			inSection.ClipsDescendants = true
			inSection.Position = UDim2.new(0, 0, 0, 30)
			inSection.Size = UDim2.new(0, 365, 0, 778)

			UIListLayout_3.Parent = inSection
			UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout_3.Padding = UDim.new(0, 5)

			btwSectionLine.Name = "btw Section Line"
			btwSectionLine.Parent = sectionFrame
			btwSectionLine.BackgroundColor3 = Color3.fromRGB(170, 146, 250)
			btwSectionLine.BorderColor3 = Color3.fromRGB(43, 43, 43)
			btwSectionLine.BorderSizePixel = 0
			btwSectionLine.Position = UDim2.new(0, -2, 0, 815)
			btwSectionLine.Size = UDim2.new(0, 370, 0, 3)

			local function UpdateSectionFrame()
				local inSec = UIListLayout_3.AbsoluteContentSize
				inSection.Size = UDim2.new(1, 0, 0, inSec.Y)
				sectionFrame.Size = UDim2.new(0, 365, 0, inSec.Y + 43)
				btwSectionLine.Position = UDim2.new(0, -2, 0, inSec.Y + 40)
			end
			UpdateSectionFrame()
			UpdateSize()
			local Elements = {}
			function Elements:CreateButton(bName, callback)
				local ButtonFunction = {}
				bName = bName or "Button"
				callback = callback or function() end

				local ButtonElement = Instance.new("Frame")
				local UICorner_7 = Instance.new("UICorner")
				local ButtoninfoElement = Instance.new("TextButton")
				local UICorner_8 = Instance.new("UICorner")
				local TextLabel_3 = Instance.new("TextLabel")
				local EffectFrame = Instance.new("ImageLabel")

				ButtonElement.Name = bName.."Element"
				ButtonElement.Parent = inSection
				ButtonElement.BackgroundColor3 = Color3.fromRGB(185, 171, 255)
				ButtonElement.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ButtonElement.BorderSizePixel = 0
				ButtonElement.Size = UDim2.new(0, 365, 0, 34)

				UICorner_7.CornerRadius = UDim.new(0, 5)
				UICorner_7.Parent = ButtonElement

				ButtoninfoElement.Name = bName
				ButtoninfoElement.Parent = ButtonElement
				ButtoninfoElement.BackgroundColor3 = Color3.fromRGB(127, 110, 188)
				ButtoninfoElement.BorderSizePixel = 0
				ButtoninfoElement.Position = UDim2.new(0, 2, 0, 2)
				ButtoninfoElement.Size = UDim2.new(0, 361, 0, 30)
				ButtoninfoElement.AutoButtonColor = false
				ButtoninfoElement.Font = Enum.Font.SourceSans
				ButtoninfoElement.Text = ""
				ButtoninfoElement.TextColor3 = Color3.fromRGB(0, 0, 0)
				ButtoninfoElement.TextSize = 14.000
				ButtoninfoElement.ClipsDescendants = true

				UICorner_8.CornerRadius = UDim.new(0, 4)
				UICorner_8.Parent = ButtoninfoElement

				TextLabel_3.Parent = ButtoninfoElement
				TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_3.BackgroundTransparency = 1.000
				TextLabel_3.BorderSizePixel = 0
				TextLabel_3.Position = UDim2.new(0, 10, 0, 0)
				TextLabel_3.Size = UDim2.new(0, 341, 0, 30)
				TextLabel_3.Font = Enum.Font.GothamBold
				TextLabel_3.Text = bName
				TextLabel_3.TextColor3 = Color3.fromRGB(226, 226, 226)
				TextLabel_3.TextSize = 15.000
				TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left
				TextLabel_3.TextWrapped = true

				EffectFrame.Name = "Effect"
				EffectFrame.Parent = ButtoninfoElement
				EffectFrame.BackgroundColor3 = Color3.fromRGB(107, 93, 159)
				EffectFrame.BackgroundTransparency = 1
				EffectFrame.Image = "http://www.roblox.com/asset/?id=4560909609"
				EffectFrame.ImageColor3 = Color3.fromRGB(203, 193, 255)
				EffectFrame.ImageTransparency = 0.600

				UpdateSectionFrame()
				UpdateSize()

				local sample = EffectFrame

				ButtoninfoElement.MouseButton1Click:Connect(function()
					callback()
					local c = sample:Clone()
					c.Parent = ButtoninfoElement
					local x, y = (mouse.X - c.AbsolutePosition.X), (mouse.Y - c.AbsolutePosition.Y)
					c.Position = UDim2.new(0, x, 0, y)
					local len, size = 0.35, nil
					if ButtoninfoElement.AbsoluteSize.X >= ButtoninfoElement.AbsoluteSize.Y then
						size = (ButtoninfoElement.AbsoluteSize.X * 1.5)
					else
						size = (ButtoninfoElement.AbsoluteSize.Y * 1.5)
					end
					c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
					for i = 1, 10 do
						c.ImageTransparency = c.ImageTransparency + 0.05
						wait(len / 12)
					end
					c:Destroy()
				end)

				function ButtonFunction:UpdateButton(newTitle)
					TextLabel_3.Text = newTitle
				end
				return ButtonFunction
			end
			function Elements:CreateToggle(tName, callback)
				local TogFunction = {}
				tName = tName or "Toggle"
				callback = callback or function() end
				local toggled = false

				local ToggleElement = Instance.new("Frame")
				local ToggleinfoElement = Instance.new("TextButton")
				local UICorner_5 = Instance.new("UICorner")
				local TextLabel_2 = Instance.new("TextLabel")
				local toggleOff = Instance.new("ImageLabel")
				local toggleOn = Instance.new("ImageLabel")
				local UICorner_6 = Instance.new("UICorner")
				local EffectFrame = Instance.new("ImageLabel")

				ToggleElement.Name = "ToggleElement"
				ToggleElement.Parent = inSection
				ToggleElement.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
				ToggleElement.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ToggleElement.BorderSizePixel = 0
				ToggleElement.Size = UDim2.new(0, 365, 0, 34)

				ToggleinfoElement.Name = "ToggleinfoElement"
				ToggleinfoElement.Parent = ToggleElement
				ToggleinfoElement.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				ToggleinfoElement.BorderSizePixel = 0
				ToggleinfoElement.ClipsDescendants = true
				ToggleinfoElement.Position = UDim2.new(0, 2, 0, 2)
				ToggleinfoElement.Size = UDim2.new(0, 361, 0, 30)
				ToggleinfoElement.AutoButtonColor = false
				ToggleinfoElement.Font = Enum.Font.GothamBold
				ToggleinfoElement.Text = ""
				ToggleinfoElement.TextColor3 = Color3.fromRGB(255, 255, 255)
				ToggleinfoElement.TextSize = 16.000
				ToggleinfoElement.TextWrapped = true

				UICorner_5.CornerRadius = UDim.new(0, 4)
				UICorner_5.Parent = ToggleinfoElement

				TextLabel_2.Parent = ToggleinfoElement
				TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_2.BackgroundTransparency = 1.000
				TextLabel_2.BorderSizePixel = 0
				TextLabel_2.Position = UDim2.new(0, 10, 0, 0)
				TextLabel_2.Size = UDim2.new(0, 315, 0, 30)
				TextLabel_2.Font = Enum.Font.GothamBold
				TextLabel_2.Text = tName
				TextLabel_2.TextColor3 = Color3.fromRGB(226, 226, 226)
				TextLabel_2.TextSize = 15.000
				TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

				toggleOff.Name = "toggleOff"
				toggleOff.Parent = ToggleinfoElement
				toggleOff.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				toggleOff.BackgroundTransparency = 1.000
				toggleOff.BorderSizePixel = 0
				toggleOff.Position = UDim2.new(0, 331, 0, 3)
				toggleOff.Size = UDim2.new(0, 24, 0, 24)
				toggleOff.Visible = true
				toggleOff.Image = "rbxassetid://16819641666"

				toggleOn.Name = "toggleOn"
				toggleOn.Parent = ToggleinfoElement
				toggleOn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				toggleOn.BackgroundTransparency = 1.000
				toggleOn.BorderSizePixel = 0
				toggleOn.Position = UDim2.new(0, 331, 0, 3)
				toggleOn.Size = UDim2.new(0, 24, 0, 24)
				toggleOn.Visible = true
				toggleOn.Image = "rbxassetid://16820596061"
				toggleOn.ImageTransparency = 1

				UICorner_6.CornerRadius = UDim.new(0, 5)
				UICorner_6.Parent = ToggleElement

				EffectFrame.Name = "Effect"
				EffectFrame.Parent = ButtoninfoElement
				EffectFrame.BackgroundColor3 = Color3.fromRGB(107, 93, 159)
				EffectFrame.BackgroundTransparency = 1
				EffectFrame.Image = "http://www.roblox.com/asset/?id=4560909609"
				EffectFrame.ImageColor3 = Color3.fromRGB(203, 193, 255)
				EffectFrame.ImageTransparency = 0.600

				local sample = EffectFrame

				UpdateSectionFrame()
				UpdateSize()

				ToggleinfoElement.MouseButton1Click:Connect(function()
					if toggled == false then
						game.TweenService:Create(toggleOn, TweenInfo.new(0.11, Enum.EasingStyle.Linear,Enum.EasingDirection.In), {
							ImageTransparency = 0
						}):Play()
                        --[[ Click Effect
                        local c = sample:Clone()
                        c.Parent = ToggleinfoElement
                        local x, y = (mouse.X - c.AbsolutePosition.X), (mouse.Y - c.AbsolutePosition.Y)
                        c.Position = UDim2.new(0, x, 0, y)
                        local len, size = 0.35, nil
                        if ToggleinfoElement.AbsoluteSize.X >= ToggleinfoElement.AbsoluteSize.Y then
                            size = (ToggleinfoElement.AbsoluteSize.X * 1.5)
                        else
                            size = (ToggleinfoElement.AbsoluteSize.Y * 1.5)
                        end
                        c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
                        for i = 1, 10 do
                            c.ImageTransparency = c.ImageTransparency + 0.05
                            wait(len / 12)
                        end
                        c:Destroy()
                        ]]
					else
						game.TweenService:Create(toggleOn, TweenInfo.new(0.11, Enum.EasingStyle.Linear,Enum.EasingDirection.In), {
							ImageTransparency = 1
						}):Play()
                        --[[ Click Effect
                        local c = sample:Clone()
                        c.Parent = ToggleinfoElement
                        local x, y = (mouse.X - c.AbsolutePosition.X), (mouse.Y - c.AbsolutePosition.Y)
                        c.Position = UDim2.new(0, x, 0, y)
                        local len, size = 0.35, nil
                        if ToggleinfoElement.AbsoluteSize.X >= ToggleinfoElement.AbsoluteSize.Y then
                            size = (ToggleinfoElement.AbsoluteSize.X * 1.5)
                        else
                            size = (ToggleinfoElement.AbsoluteSize.Y * 1.5)
                        end
                        c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
                        for i = 1, 10 do
                            c.ImageTransparency = c.ImageTransparency + 0.05
                            wait(len / 12)
                        end
                        c:Destroy()
                        ]]
					end
					toggled = not toggled
					pcall(callback, toggled)
				end)
				function TogFunction:UpdateToggle(newText, isTogOn)
					isTogOn = isTogOn or toggle
					if newText ~= nil then
						TextLabel_2.Text = newText
					end
					if isTogOn then
						toggled = true
						game.TweenService:Create(toggleOn, TweenInfo.new(0.11, Enum.EasingStyle.Linear,Enum.EasingDirection.In), {
							ImageTransparency = 0
						}):Play()
						pcall(callback, toggled)
					else
						toggled = false
						game.TweenService:Create(toggleOn, TweenInfo.new(0.11, Enum.EasingStyle.Linear,Enum.EasingDirection.In), {
							ImageTransparency = 1
						}):Play()
						pcall(callback, toggled)
					end
				end
				return TogFunction
			end
			function Elements:CreateSlider(sName, maxvalue, minvalue, callback)
				sName = sName or "Slider"
				maxvalue = maxvalue or 500
				minvalue = minvalue or 16
				callback = callback or function() end

				local SliderElement = Instance.new("Frame")
				local sliderinfoElement = Instance.new("TextButton")
				local sdName = Instance.new("TextLabel")
				local SlideBtn = Instance.new("TextButton")
				local UICorner_9 = Instance.new("UICorner")
				local Slideliner = Instance.new("Frame")
				local UICorner_10 = Instance.new("UICorner")
				local Val = Instance.new("TextBox")
				local UICorner_11 = Instance.new("UICorner")
				local UICorner_12 = Instance.new("UICorner")
				local UICorner_13 = Instance.new("UICorner")

				SliderElement.Name = "SliderElement"
				SliderElement.Parent = inSection
				SliderElement.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
				SliderElement.BorderColor3 = Color3.fromRGB(0, 0, 0)
				SliderElement.BorderSizePixel = 0
				SliderElement.Size = UDim2.new(0, 365, 0, 54)

				sliderinfoElement.Name = "sliderinfoElement"
				sliderinfoElement.Parent = SliderElement
				sliderinfoElement.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				sliderinfoElement.Position = UDim2.new(0, 2, 0, 2)
				sliderinfoElement.Size = UDim2.new(0, 361, 0, 50)
				sliderinfoElement.AutoButtonColor = false
				sliderinfoElement.Font = Enum.Font.SourceSans
				sliderinfoElement.Text = ""
				sliderinfoElement.TextColor3 = Color3.fromRGB(0, 0, 0)
				sliderinfoElement.TextSize = 14.000

				sdName.Name = "sdName"
				sdName.Parent = sliderinfoElement
				sdName.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
				sdName.BackgroundTransparency = 1.000
				sdName.BorderSizePixel = 0
				sdName.Position = UDim2.new(0, 10, 0, 4)
				sdName.Size = UDim2.new(0, 190, 0, 25)
				sdName.ZIndex = 14
				sdName.Font = Enum.Font.GothamBold
				sdName.Text = sName
				sdName.TextColor3 = Color3.fromRGB(226, 226, 226)
				sdName.TextSize = 15.000
				sdName.TextXAlignment = Enum.TextXAlignment.Left

				SlideBtn.Name = "SlideBtn"
				SlideBtn.Parent = sliderinfoElement
				SlideBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
				SlideBtn.Position = UDim2.new(0, 5, 0, 35)
				SlideBtn.Size = UDim2.new(0, 352, 0, 7)
				SlideBtn.AutoButtonColor = false
				SlideBtn.Font = Enum.Font.SourceSans
				SlideBtn.Text = ""
				SlideBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
				SlideBtn.TextSize = 14.000

				UICorner_9.CornerRadius = UDim.new(0, 5)
				UICorner_9.Parent = SlideBtn

				Slideliner.Name = "Slideliner"
				Slideliner.Parent = SlideBtn
				Slideliner.BackgroundColor3 = Color3.fromRGB(127, 110, 188)
				Slideliner.Size = UDim2.new(0, 0, 1, 0)

				UICorner_10.CornerRadius = UDim.new(0, 5)
				UICorner_10.Parent = Slideliner

				Val.Name = "Val"
				Val.Parent = sliderinfoElement
				Val.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
				Val.BorderSizePixel = 0
				Val.Position = UDim2.new(0, 207, 0, 4)
				Val.Size = UDim2.new(0, 150, 0, 25)
				Val.Font = Enum.Font.GothamBold
				Val.PlaceholderColor3 = Color3.fromRGB(226, 226, 226)
				Val.Text = minvalue
				Val.TextColor3 = Color3.fromRGB(226, 226, 226)
				Val.TextSize = 16.000

				UICorner_11.CornerRadius = UDim.new(0, 5)
				UICorner_11.Parent = Val

				UICorner_12.CornerRadius = UDim.new(0, 4)
				UICorner_12.Parent = sliderinfoElement

				UICorner_13.CornerRadius = UDim.new(0, 5)
				UICorner_13.Parent = SliderElement

				UpdateSectionFrame()
				UpdateSize()

				local Value

				Val.FocusLost:Connect(function (enterPressed)
					if not enterPressed then
						return
					elseif enterPressed then
						callback(Val.Text)
						local Pos = 370 / maxvalue
						local OpL = Pos * Val.Text
						Slideliner.Size = UDim2.new(0, OpL, 1, 0)
					end
				end)

				SlideBtn.MouseButton1Down:Connect(function()
					Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 352) * Slideliner.AbsoluteSize.X) + tonumber(minvalue)) or 0
					pcall(function()
						callback(Value)
					end)
					Slideliner:TweenSize(UDim2.new(0, math.clamp(mouse.X - Slideliner.AbsolutePosition.X, 0, 352), 0, 6), "InOut", "Linear", 0.05, true)
					moveconnection = mouse.Move:Connect(function()
						Val.Text = Value
						Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 352) * Slideliner.AbsoluteSize.X) + tonumber(minvalue))
						pcall(function()
							callback(Value)
						end)
						Slideliner:TweenSize(UDim2.new(0, math.clamp(mouse.X - Slideliner.AbsolutePosition.X, 0, 352), 0, 6), "InOut", "Linear", 0.05, true)
					end)
					releaseconnection = input.InputEnded:Connect(function(Mouse)
						if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
							Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 352) * Slideliner.AbsoluteSize.X) + tonumber(minvalue))
							pcall(function()
								callback(Value)
							end)
							Val.Text = Value
							Slideliner:TweenSize(UDim2.new(0, math.clamp(mouse.X - Slideliner.AbsolutePosition.X, 0, 352), 0, 6), "InOut", "Linear", 0.05, true)
							moveconnection:Disconnect()
							releaseconnection:Disconnect()
						end
					end)
				end)
			end

			function Elements:CreateDropdown(dName, list, callback)
				local DropFunctions = {}
				dName = dName or "Dropdown"
				list = list or {}
				callback = callback or function() end

				local DropDownElement = Instance.new("Frame")
				local UICorner_14 = Instance.new("UICorner")
				local DropDown = Instance.new("TextButton")
				local UICorner_15 = Instance.new("UICorner")
				local TextLabel_4 = Instance.new("TextLabel")
				local ScrollingFrame = Instance.new("Frame")
				local UICorner_16 = Instance.new("UICorner")
				local ScrollingDrop = Instance.new("ScrollingFrame")
				local DropFrame = Instance.new("Frame")
				local UIListLayout_4 = Instance.new("UIListLayout")
				local ImageLabel = Instance.new("ImageLabel")

				DropDownElement.Name = "DropDownElement"
				DropDownElement.Parent = inSection
				DropDownElement.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
				DropDownElement.BorderColor3 = Color3.fromRGB(0, 0, 0)
				DropDownElement.BorderSizePixel = 0
				DropDownElement.ClipsDescendants = true
				DropDownElement.Position = UDim2.new(0, 0, 0.259316772, 0)
				DropDownElement.Size = UDim2.new(0, 365, 0, 34) -- 192

				UICorner_14.CornerRadius = UDim.new(0, 5)
				UICorner_14.Parent = DropDownElement

				DropDown.Name = "DropDown"
				DropDown.Parent = DropDownElement
				DropDown.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				DropDown.BorderSizePixel = 0
				DropDown.Position = UDim2.new(0, 2, 0, 2)
				DropDown.Size = UDim2.new(0, 361, 0, 30)
				DropDown.ZIndex = 2
				DropDown.AutoButtonColor = false
				DropDown.Font = Enum.Font.SourceSans
				DropDown.Text = ""
				DropDown.TextColor3 = Color3.fromRGB(0, 0, 0)
				DropDown.TextSize = 14.000

				UICorner_15.CornerRadius = UDim.new(0, 5)
				UICorner_15.Parent = DropDown

				TextLabel_4.Parent = DropDown
				TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_4.BackgroundTransparency = 1.000
				TextLabel_4.BorderSizePixel = 0
				TextLabel_4.Position = UDim2.new(0, 10, 0, 0)
				TextLabel_4.Size = UDim2.new(0, 315, 0, 29)
				TextLabel_4.Font = Enum.Font.GothamBold
				TextLabel_4.Text = dName
				TextLabel_4.TextColor3 = Color3.fromRGB(131, 131, 131)
				TextLabel_4.TextSize = 15.000
				TextLabel_4.TextXAlignment = Enum.TextXAlignment.Left

				ScrollingFrame.Name = "ScrollingFrame"
				ScrollingFrame.Parent = DropDownElement
				ScrollingFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ScrollingFrame.BorderSizePixel = 0
				ScrollingFrame.ClipsDescendants = true
				ScrollingFrame.Position = UDim2.new(0, 2, 0, 27)
				ScrollingFrame.Size = UDim2.new(0, 361, 0, 163)
				ScrollingFrame.Visible = false

				UICorner_16.CornerRadius = UDim.new(0, 5)
				UICorner_16.Parent = ScrollingFrame

				ScrollingDrop.Name = "ScrollingDrop"
				ScrollingDrop.Parent = ScrollingFrame
				ScrollingDrop.Active = true
				ScrollingDrop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ScrollingDrop.BackgroundTransparency = 1.000
				ScrollingDrop.BorderSizePixel = 0
				ScrollingDrop.Position = UDim2.new(0, 0, 0, 7)
				ScrollingDrop.Size = UDim2.new(0, 361, 0, 154)
				ScrollingDrop.CanvasSize = UDim2.new(0, 0, 0, 0)
				ScrollingDrop.ScrollBarThickness = 5

				DropFrame.Name = "DropFrame"
				DropFrame.Parent = ScrollingDrop
				DropFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropFrame.BackgroundTransparency = 1.000
				DropFrame.ClipsDescendants = true
				DropFrame.Position = UDim2.new(0, 2, 0, 0)
				DropFrame.Size = UDim2.new(0, 353, 0, 153)

				UIListLayout_4.Parent = DropFrame
				UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout_4.Padding = UDim.new(0, 3)

				ImageLabel.Parent = DropDownElement
				ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ImageLabel.BackgroundTransparency = 1.000
				ImageLabel.BorderSizePixel = 0
				ImageLabel.Position = UDim2.new(0, 335, 0, 7)
				ImageLabel.Rotation = 90.000
				ImageLabel.Size = UDim2.new(0, 20, 0, 20)
				ImageLabel.ZIndex = 2
				ImageLabel.Image = "http://www.roblox.com/asset/?id=16820753105"

				UpdateSectionFrame()
				UpdateSize()

				local opened = false

				DropDown.MouseButton1Click:Connect(function()
					if opened then
						opened = false
						ScrollingDrop.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_4.AbsoluteContentSize.Y)
						tween:Create(ImageLabel, tweeninfo(0.08, Enum.EasingStyle.Linear,Enum.EasingDirection.In), {
							Rotation = 90
						}):Play()
						DropDownElement:TweenSize(UDim2.new(0, 365, 0, 34), "InOut", "Linear", 0.08)
						ScrollingFrame.Visible = false
						wait(0.1)
						UpdateSectionFrame()
						UpdateSize()
					else
						opened = true
						TextLabel_4.Text = dName
						ScrollingDrop.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_4.AbsoluteContentSize.Y)
						tween:Create(ImageLabel, tweeninfo(0.08, Enum.EasingStyle.Linear,Enum.EasingDirection.In), {
							Rotation = -90
						}):Play()
						DropDownElement:TweenSize(UDim2.new(0, 365, 0, 192), "InOut", "Linear", 0.08)
						ScrollingFrame.Visible = true
						wait(0.1)
						UpdateSectionFrame()
						UpdateSize()
					end
				end)

				for i,v in next, list do
					local Option1 = Instance.new("TextButton")
					local TextLabel_5 = Instance.new("TextLabel")
					local UICorner_17 = Instance.new("UICorner")

					Option1.Name = "Option 1"
					Option1.Parent = DropFrame
					Option1.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
					Option1.BackgroundTransparency = 1.000
					Option1.BorderSizePixel = 0
					Option1.Position = UDim2.new(0, 0, 0, 0)
					Option1.Size = UDim2.new(0, 353, 0, 25)
					Option1.ZIndex = 2
					Option1.AutoButtonColor = false
					Option1.Font = Enum.Font.GothamBold
					Option1.Text = ""
					Option1.TextColor3 = Color3.fromRGB(226, 226, 226)
					Option1.TextSize = 14.000
					Option1.TextXAlignment = Enum.TextXAlignment.Left

					TextLabel_5.Parent = Option1
					TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel_5.BackgroundTransparency = 1.000
					TextLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
					TextLabel_5.BorderSizePixel = 0
					TextLabel_5.Position = UDim2.new(0, 30, 0, 0)
					TextLabel_5.Size = UDim2.new(0, 318, 0, 25)
					TextLabel_5.Font = Enum.Font.GothamBold
					TextLabel_5.Text = v
					TextLabel_5.TextColor3 = Color3.fromRGB(226, 226, 226) -- 170, 146, 250
					TextLabel_5.TextSize = 14.000
					TextLabel_5.TextXAlignment = Enum.TextXAlignment.Left

					UICorner_17.Parent = Option1

					Option1.MouseButton1Click:Connect(function ()
						opened = false
						callback(v)
						TextLabel_4.Text = v
						for i,v in next, DropFrame:GetChildren() do
							if v:IsA("TextButton") then
								Utility:TweenObject(v.TextLabel, {TextColor3 = Color3.fromRGB(226, 226, 226)}, 0.2)
								Utility:TweenObject(v, {BackgroundTransparency = 1}, 0.2)
							end
						end
						Utility:TweenObject(TextLabel_5, {TextColor3 = Color3.fromRGB(170, 146, 250)}, 0.2)
						Utility:TweenObject(Option1, {BackgroundTransparency = 0}, 0.2)
						ScrollingDrop.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_4.AbsoluteContentSize.Y)
						tween:Create(ImageLabel, tweeninfo(0.08, Enum.EasingStyle.Linear,Enum.EasingDirection.In), {
							Rotation = 90
						}):Play()
						DropDownElement:TweenSize(UDim2.new(0, 365, 0, 34), "InOut", "Linear", 0.08)
						ScrollingFrame.Visible = false
						wait(0.1)
						UpdateSectionFrame()
						UpdateSize()
					end)
				end

				function DropFunctions:Refresh(newList)
					newList = newList or {}
					for i,v in next, DropFrame:GetChildren() do
						if v.Name == "Option 1" then
							v:Destroy()
						end
					end
					for i,v in next, newList do
						local Option1 = Instance.new("TextButton")
						local TextLabel_5 = Instance.new("TextLabel")
						local UICorner_17 = Instance.new("UICorner")

						Option1.Name = "Option 1"
						Option1.Parent = DropFrame
						Option1.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
						Option1.BackgroundTransparency = 1.000
						Option1.BorderSizePixel = 0
						Option1.Position = UDim2.new(0, 0, 0, 0)
						Option1.Size = UDim2.new(0, 353, 0, 25)
						Option1.ZIndex = 2
						Option1.AutoButtonColor = false
						Option1.Font = Enum.Font.GothamBold
						Option1.Text = ""
						Option1.TextColor3 = Color3.fromRGB(226, 226, 226)
						Option1.TextSize = 14.000
						Option1.TextXAlignment = Enum.TextXAlignment.Left

						TextLabel_5.Parent = Option1
						TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						TextLabel_5.BackgroundTransparency = 1.000
						TextLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
						TextLabel_5.BorderSizePixel = 0
						TextLabel_5.Position = UDim2.new(0, 30, 0, 0)
						TextLabel_5.Size = UDim2.new(0, 318, 0, 25)
						TextLabel_5.Font = Enum.Font.GothamBold
						TextLabel_5.Text = v
						TextLabel_5.TextColor3 = Color3.fromRGB(226, 226, 226) -- 170, 146, 250
						TextLabel_5.TextSize = 14.000
						TextLabel_5.TextXAlignment = Enum.TextXAlignment.Left

						UICorner_17.Parent = Option1

						Option1.MouseButton1Click:Connect(function ()
							opened = false
							callback(v)
							TextLabel_4.Text = v
							for i,v in next, DropFrame:GetChildren() do
								if v:IsA("TextButton") then
									Utility:TweenObject(v.TextLabel, {TextColor3 = Color3.fromRGB(226, 226, 226)}, 0.2)
									Utility:TweenObject(v, {BackgroundTransparency = 1}, 0.2)
								end
							end
							Utility:TweenObject(TextLabel_5, {TextColor3 = Color3.fromRGB(170, 146, 250)}, 0.2)
							Utility:TweenObject(Option1, {BackgroundTransparency = 0}, 0.2)
							ScrollingDrop.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_4.AbsoluteContentSize.Y)
							tween:Create(ImageLabel, tweeninfo(0.08, Enum.EasingStyle.Linear,Enum.EasingDirection.In), {
								Rotation = 90
							}):Play()
							DropDownElement:TweenSize(UDim2.new(0, 365, 0, 34), "InOut", "Linear", 0.08)
							ScrollingFrame.Visible = false
							wait(0.1)
							UpdateSectionFrame()
							UpdateSize()
						end)
						UpdateSectionFrame()
						UpdateSize()
					end
					if opened then
						ScrollingDrop.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_4.AbsoluteContentSize.Y)
						tween:Create(ImageLabel, tweeninfo(0.08, Enum.EasingStyle.Linear,Enum.EasingDirection.In), {
							Rotation = -90
						}):Play()
						DropDownElement:TweenSize(UDim2.new(0, 365, 0, 192), "InOut", "Linear", 0.08)
						ScrollingFrame.Visible = true
						wait(0.1)
						UpdateSectionFrame()
						UpdateSize()
					else
						ScrollingDrop.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_4.AbsoluteContentSize.Y)
						tween:Create(ImageLabel, tweeninfo(0.08, Enum.EasingStyle.Linear,Enum.EasingDirection.In), {
							Rotation = 90
						}):Play()
						DropDownElement:TweenSize(UDim2.new(0, 365, 0, 34), "InOut", "Linear", 0.08)
						ScrollingFrame.Visible = false
						wait(0.1)
						UpdateSectionFrame()
						UpdateSize()
					end
				end
				return DropFunctions
			end

			function Elements:CreateDropSearch(dsName, list, callback)
				local DropSearchFunction = {}
				dsName = dsName or "DropSearch"
				list = list or {}
				callback = callback or function() end

				local DropSearchElement = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local TextBox = Instance.new("TextBox")
				local ImageLabel = Instance.new("ImageLabel")
				local ScrollingFrame = Instance.new("Frame")
				local UICorner_3 = Instance.new("UICorner")
				local ScrollingDrop = Instance.new("ScrollingFrame")
				local DropFrame = Instance.new("Frame")
				local UIListLayout = Instance.new("UIListLayout")
				local DropDown = Instance.new("TextButton")
				local UICorner_6 = Instance.new("UICorner")
				local TextLabel_3 = Instance.new("TextLabel")

				DropSearchElement.Name = "DropSearchElement"
				DropSearchElement.Parent = inSection
				DropSearchElement.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
				DropSearchElement.BorderColor3 = Color3.fromRGB(0, 0, 0)
				DropSearchElement.BorderSizePixel = 0
				DropSearchElement.ClipsDescendants = true
				DropSearchElement.Position = UDim2.new(0, 0, 0.259316772, 0)
				DropSearchElement.Size = UDim2.new(0, 365, 0, 34)

				UICorner.CornerRadius = UDim.new(0, 5)
				UICorner.Parent = DropSearchElement

				TextBox.Parent = DropSearchElement
				TextBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				TextBox.BackgroundTransparency = 1.000
				TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextBox.BorderSizePixel = 0
				TextBox.Position = UDim2.new(0, 12, 0, 2)
				TextBox.Size = UDim2.new(0, 315, 0, 30)
				TextBox.Font = Enum.Font.GothamBold
				TextBox.Text = ""
				TextBox.TextColor3 = Color3.fromRGB(131, 131, 131)
				TextBox.TextSize = 15.000
				TextBox.Visible = false
				TextBox.TextXAlignment = Enum.TextXAlignment.Left
				TextBox.ZIndex = 1

				ImageLabel.Parent = DropSearchElement
				ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ImageLabel.BackgroundTransparency = 1.000
				ImageLabel.BorderSizePixel = 0
				ImageLabel.Position = UDim2.new(0, 335, 0, 7)
				ImageLabel.Rotation = 90.000
				ImageLabel.Size = UDim2.new(0, 20, 0, 20)
				ImageLabel.ZIndex = 2
				ImageLabel.Image = "http://www.roblox.com/asset/?id=16820753105"

				ScrollingFrame.Name = "ScrollingFrame"
				ScrollingFrame.Parent = DropSearchElement
				ScrollingFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ScrollingFrame.BorderSizePixel = 0
				ScrollingFrame.ClipsDescendants = true
				ScrollingFrame.Position = UDim2.new(0, 2, 0, 27)
				ScrollingFrame.Size = UDim2.new(0, 361, 0, 163)
				ScrollingFrame.Visible = false

				UICorner_3.CornerRadius = UDim.new(0, 5)
				UICorner_3.Parent = ScrollingFrame

				ScrollingDrop.Name = "ScrollingDrop"
				ScrollingDrop.Parent = ScrollingFrame
				ScrollingDrop.Active = true
				ScrollingDrop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ScrollingDrop.BackgroundTransparency = 1.000
				ScrollingDrop.BorderSizePixel = 0
				ScrollingDrop.Position = UDim2.new(0, 0, 0, 7)
				ScrollingDrop.Size = UDim2.new(0, 361, 0, 154)
				ScrollingDrop.CanvasSize = UDim2.new(0, 0, 0, 0)
				ScrollingDrop.ScrollBarThickness = 5

				DropFrame.Name = "DropFrame"
				DropFrame.Parent = ScrollingDrop
				DropFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropFrame.BackgroundTransparency = 1.000
				DropFrame.ClipsDescendants = true
				DropFrame.Position = UDim2.new(0, 2, 0, 0)
				DropFrame.Size = UDim2.new(0, 353, 0, 153)

				UIListLayout.Parent = DropFrame
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout.Padding = UDim.new(0, 3)

				DropDown.Name = "DropDown"
				DropDown.Parent = DropSearchElement
				DropDown.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				DropDown.BorderSizePixel = 0
				DropDown.Position = UDim2.new(0, 2, 0, 2)
				DropDown.Size = UDim2.new(0, 361, 0, 30)
				DropDown.AutoButtonColor = false
				DropDown.Font = Enum.Font.SourceSans
				DropDown.Text = ""
				DropDown.TextColor3 = Color3.fromRGB(0, 0, 0)
				DropDown.TextSize = 14.000

				UICorner_6.CornerRadius = UDim.new(0, 5)
				UICorner_6.Parent = DropDown

				TextLabel_3.Parent = DropDown
				TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_3.BackgroundTransparency = 1.000
				TextLabel_3.BorderSizePixel = 0
				TextLabel_3.Position = UDim2.new(0, 10, 0, 0)
				TextLabel_3.Size = UDim2.new(0, 315, 0, 29)
				TextLabel_3.Font = Enum.Font.GothamBold
				TextLabel_3.Text = dsName
				TextLabel_3.TextColor3 = Color3.fromRGB(131, 131, 131)
				TextLabel_3.TextSize = 15.000
				TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left

				UpdateSectionFrame()
				UpdateSize()

				local opened = false
				local TCHECK

				local function TextCheck()
					for _,v in pairs(inSection:GetChildren()) do
						if v.Name == "DropSearchElement" then
							for _,v1 in pairs(v:GetChildren()) do
								if v1.Name == "TextBox" then
									if v1.Text == "" and opened then
										TextLabel_3.Visible = true
										TextLabel_3.Text = dsName
									elseif v1.Text ~= "" and opened then
										TextLabel_3.Visible = false
									elseif v1.Text ~= "" and TCHECK == nil and not opened then
										TextLabel_3.Visible = true
										TextLabel_3.Text = dsName -- TextBox.Text to show recent search
									elseif v1.Text ~= "" and TCHECK ~= nil and not opened then
										TextLabel_3.Visible = true
										TextLabel_3.Text = TCHECK
									end
								end
							end
						end
					end
				end

				local function UpdateInputOfSearchText()
					local InputText = string.upper(TextBox.Text)
					for _,button in pairs(DropFrame:GetChildren()) do
						if button:IsA("TextButton") then
							if InputText == "" or string.find(string.upper(button.TextLabel.Text),InputText) ~= nil then
								button.Visible = true
							else
								button.Visible = false
							end
						end
					end
				end

				DropDown.MouseButton1Click:Connect(function ()
					if opened then
						opened = false
						ScrollingDrop.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
						tween:Create(ImageLabel, tweeninfo(0.08, Enum.EasingStyle.Linear,Enum.EasingDirection.In), {
							Rotation = 90
						}):Play()
						DropSearchElement:TweenSize(UDim2.new(0, 365, 0, 34), "InOut", "Linear", 0.08)
						ScrollingFrame.Visible = false
						TextBox.Visible = false
						TextBox.ZIndex = 1
						wait(0.1)
						UpdateSectionFrame()
						UpdateSize()
					else
						opened = true
						ScrollingDrop.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
						tween:Create(ImageLabel, tweeninfo(0.08, Enum.EasingStyle.Linear,Enum.EasingDirection.In), {
							Rotation = -90
						}):Play()
						DropSearchElement:TweenSize(UDim2.new(0, 365, 0, 192), "InOut", "Linear", 0.08)
						ScrollingFrame.Visible = true
						TextBox.Visible = true
						TextBox.ZIndex = 2
						if TextBox.Changed then
							TextBox.Changed:Connect(TextCheck)
							TextBox.Changed:Connect(UpdateInputOfSearchText)
						end
						wait(0.1)
						UpdateSectionFrame()
						UpdateSize()
					end
				end)

				for i,v in next, list do
					local Option1 = Instance.new("TextButton")
					local TextLabel_5 = Instance.new("TextLabel")
					local UICorner_17 = Instance.new("UICorner")

					Option1.Name = "Option 1"
					Option1.Parent = DropFrame
					Option1.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
					Option1.BackgroundTransparency = 1.000
					Option1.BorderSizePixel = 0
					Option1.Position = UDim2.new(0, 0, 0, 0)
					Option1.Size = UDim2.new(0, 353, 0, 25)
					Option1.ZIndex = 2
					Option1.AutoButtonColor = false
					Option1.Font = Enum.Font.GothamBold
					Option1.Text = ""
					Option1.TextColor3 = Color3.fromRGB(226, 226, 226)
					Option1.TextSize = 14.000
					Option1.TextXAlignment = Enum.TextXAlignment.Left

					TextLabel_5.Parent = Option1
					TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel_5.BackgroundTransparency = 1.000
					TextLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
					TextLabel_5.BorderSizePixel = 0
					TextLabel_5.Position = UDim2.new(0, 30, 0, 0)
					TextLabel_5.Size = UDim2.new(0, 318, 0, 25)
					TextLabel_5.Font = Enum.Font.GothamBold
					TextLabel_5.Text = v
					TextLabel_5.TextColor3 = Color3.fromRGB(226, 226, 226) -- 170, 146, 250
					TextLabel_5.TextSize = 14.000
					TextLabel_5.TextXAlignment = Enum.TextXAlignment.Left

					UICorner_17.Parent = Option1

					Option1.MouseButton1Click:Connect(function ()
						opened = false
						TCHECK = v
						callback(v)
						TextLabel_3.Text = v
						for i,v in next, DropFrame:GetChildren() do
							if v:IsA("TextButton") then
								Utility:TweenObject(v.TextLabel, {TextColor3 = Color3.fromRGB(226, 226, 226)}, 0.2)
								Utility:TweenObject(v, {BackgroundTransparency = 1}, 0.2)
							end
						end
						Utility:TweenObject(TextLabel_5, {TextColor3 = Color3.fromRGB(170, 146, 250)}, 0.2)
						Utility:TweenObject(Option1, {BackgroundTransparency = 0}, 0.2)
						ScrollingDrop.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
						tween:Create(ImageLabel, tweeninfo(0.08, Enum.EasingStyle.Linear,Enum.EasingDirection.In), {
							Rotation = 90
						}):Play()
						DropSearchElement:TweenSize(UDim2.new(0, 365, 0, 34), "InOut", "Linear", 0.08)
						ScrollingFrame.Visible = false
						TextBox.Visible = false
						TextBox.ZIndex = 1
						wait(0.1)
						UpdateSectionFrame()
						UpdateSize()
					end)
				end

				function DropSearchFunction:Refresh(newList)
					newList = newList or {}
					for i,v in next, DropFrame:GetChildren() do
						if v.Name == "Option 1" then
							v:Destroy()
						end
					end
					for i,v in next, newList do
						local Option1 = Instance.new("TextButton")
						local TextLabel_5 = Instance.new("TextLabel")
						local UICorner_17 = Instance.new("UICorner")

						Option1.Name = "Option 1"
						Option1.Parent = DropFrame
						Option1.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
						Option1.BackgroundTransparency = 1.000
						Option1.BorderSizePixel = 0
						Option1.Position = UDim2.new(0, 0, 0, 0)
						Option1.Size = UDim2.new(0, 353, 0, 25)
						Option1.ZIndex = 2
						Option1.AutoButtonColor = false
						Option1.Font = Enum.Font.GothamBold
						Option1.Text = ""
						Option1.TextColor3 = Color3.fromRGB(226, 226, 226)
						Option1.TextSize = 14.000
						Option1.TextXAlignment = Enum.TextXAlignment.Left

						TextLabel_5.Parent = Option1
						TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						TextLabel_5.BackgroundTransparency = 1.000
						TextLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
						TextLabel_5.BorderSizePixel = 0
						TextLabel_5.Position = UDim2.new(0, 30, 0, 0)
						TextLabel_5.Size = UDim2.new(0, 318, 0, 25)
						TextLabel_5.Font = Enum.Font.GothamBold
						TextLabel_5.Text = v
						TextLabel_5.TextColor3 = Color3.fromRGB(226, 226, 226) -- 170, 146, 250
						TextLabel_5.TextSize = 14.000
						TextLabel_5.TextXAlignment = Enum.TextXAlignment.Left

						UICorner_17.Parent = Option1

						Option1.MouseButton1Click:Connect(function ()
							opened = false
							TCHECK = v
							callback(v)
							TextLabel_3.Text = v
							for i,v in next, DropFrame:GetChildren() do
								if v:IsA("TextButton") then
									Utility:TweenObject(v.TextLabel, {TextColor3 = Color3.fromRGB(226, 226, 226)}, 0.2)
									Utility:TweenObject(v, {BackgroundTransparency = 1}, 0.2)
								end
							end
							Utility:TweenObject(TextLabel_5, {TextColor3 = Color3.fromRGB(170, 146, 250)}, 0.2)
							Utility:TweenObject(Option1, {BackgroundTransparency = 0}, 0.2)
							ScrollingDrop.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
							tween:Create(ImageLabel, tweeninfo(0.08, Enum.EasingStyle.Linear,Enum.EasingDirection.In), {
								Rotation = 90
							}):Play()
							DropSearchElement:TweenSize(UDim2.new(0, 365, 0, 34), "InOut", "Linear", 0.08)
							ScrollingFrame.Visible = false
							TextBox.Visible = false
							TextBox.ZIndex = 1
							wait(0.1)
							UpdateSectionFrame()
							UpdateSize()
						end)
						UpdateSectionFrame()
						UpdateSize()
					end
					if opened then
						ScrollingDrop.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
						tween:Create(ImageLabel, tweeninfo(0.08, Enum.EasingStyle.Linear,Enum.EasingDirection.In), {
							Rotation = -90
						}):Play()
						DropSearchElement:TweenSize(UDim2.new(0, 365, 0, 192), "InOut", "Linear", 0.08)
						ScrollingFrame.Visible = true
						TextBox.Visible = true
						TextBox.ZIndex = 2
						if TextBox.Changed then
							TextBox.Changed:Connect(TextCheck)
							TextBox.Changed:Connect(UpdateInputOfSearchText)
						end
						wait(0.1)
						UpdateSectionFrame()
						UpdateSize()
					else
						ScrollingDrop.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
						tween:Create(ImageLabel, tweeninfo(0.08, Enum.EasingStyle.Linear,Enum.EasingDirection.In), {
							Rotation = 90
						}):Play()
						DropSearchElement:TweenSize(UDim2.new(0, 365, 0, 34), "InOut", "Linear", 0.08)
						ScrollingFrame.Visible = false
						TextBox.Visible = false
						TextBox.ZIndex = 1
						wait(0.1)
						UpdateSectionFrame()
						UpdateSize()
					end
				end
				return DropSearchFunction
			end

			function Elements:CreateDropSelect(dSeName, list, callback)
				local SelectedOp = {}
				local DropSelectFunction = {}
				dSeName = dSeName or "DropSelect"
				list = list or {}
				callback = callback or function() end

				local DropSearchElement = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local TextBox = Instance.new("TextBox")
				local ImageLabel = Instance.new("ImageLabel")
				local ScrollingFrame = Instance.new("Frame")
				local UICorner_3 = Instance.new("UICorner")
				local ScrollingDrop = Instance.new("ScrollingFrame")
				local DropFrame = Instance.new("Frame")
				local UIListLayout = Instance.new("UIListLayout")
				local DropDown = Instance.new("TextButton")
				local UICorner_6 = Instance.new("UICorner")
				local TextLabel_3 = Instance.new("TextLabel")

				DropSearchElement.Name = "DropSearchElement"
				DropSearchElement.Parent = inSection
				DropSearchElement.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
				DropSearchElement.BorderColor3 = Color3.fromRGB(0, 0, 0)
				DropSearchElement.BorderSizePixel = 0
				DropSearchElement.ClipsDescendants = true
				DropSearchElement.Position = UDim2.new(0, 0, 0.259316772, 0)
				DropSearchElement.Size = UDim2.new(0, 365, 0, 34)

				UICorner.CornerRadius = UDim.new(0, 5)
				UICorner.Parent = DropSearchElement

				TextBox.Parent = DropSearchElement
				TextBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				TextBox.BackgroundTransparency = 1.000
				TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextBox.BorderSizePixel = 0
				TextBox.Position = UDim2.new(0, 12, 0, 2)
				TextBox.Size = UDim2.new(0, 315, 0, 30)
				TextBox.Font = Enum.Font.GothamBold
				TextBox.Text = ""
				TextBox.TextColor3 = Color3.fromRGB(131, 131, 131)
				TextBox.TextSize = 15.000
				TextBox.Visible = false
				TextBox.TextXAlignment = Enum.TextXAlignment.Left
				TextBox.ZIndex = 1

				ImageLabel.Parent = DropSearchElement
				ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ImageLabel.BackgroundTransparency = 1.000
				ImageLabel.BorderSizePixel = 0
				ImageLabel.Position = UDim2.new(0, 335, 0, 7)
				ImageLabel.Rotation = 90.000
				ImageLabel.Size = UDim2.new(0, 20, 0, 20)
				ImageLabel.ZIndex = 2
				ImageLabel.Image = "http://www.roblox.com/asset/?id=16820753105"

				ScrollingFrame.Name = "ScrollingFrame"
				ScrollingFrame.Parent = DropSearchElement
				ScrollingFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ScrollingFrame.BorderSizePixel = 0
				ScrollingFrame.ClipsDescendants = true
				ScrollingFrame.Position = UDim2.new(0, 2, 0, 27)
				ScrollingFrame.Size = UDim2.new(0, 361, 0, 163)
				ScrollingFrame.Visible = false

				UICorner_3.CornerRadius = UDim.new(0, 5)
				UICorner_3.Parent = ScrollingFrame

				ScrollingDrop.Name = "ScrollingDrop"
				ScrollingDrop.Parent = ScrollingFrame
				ScrollingDrop.Active = true
				ScrollingDrop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ScrollingDrop.BackgroundTransparency = 1.000
				ScrollingDrop.BorderSizePixel = 0
				ScrollingDrop.Position = UDim2.new(0, 0, 0, 7)
				ScrollingDrop.Size = UDim2.new(0, 361, 0, 154)
				ScrollingDrop.CanvasSize = UDim2.new(0, 0, 0, 0)
				ScrollingDrop.ScrollBarThickness = 5

				DropFrame.Name = "DropFrame"
				DropFrame.Parent = ScrollingDrop
				DropFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropFrame.BackgroundTransparency = 1.000
				DropFrame.ClipsDescendants = true
				DropFrame.Position = UDim2.new(0, 2, 0, 0)
				DropFrame.Size = UDim2.new(0, 353, 0, 153)

				UIListLayout.Parent = DropFrame
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout.Padding = UDim.new(0, 3)

				DropDown.Name = "DropDown"
				DropDown.Parent = DropSearchElement
				DropDown.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				DropDown.BorderSizePixel = 0
				DropDown.Position = UDim2.new(0, 2, 0, 2)
				DropDown.Size = UDim2.new(0, 361, 0, 30)
				DropDown.AutoButtonColor = false
				DropDown.Font = Enum.Font.SourceSans
				DropDown.Text = ""
				DropDown.TextColor3 = Color3.fromRGB(0, 0, 0)
				DropDown.TextSize = 14.000

				UICorner_6.CornerRadius = UDim.new(0, 5)
				UICorner_6.Parent = DropDown

				TextLabel_3.Parent = DropDown
				TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_3.BackgroundTransparency = 1.000
				TextLabel_3.BorderSizePixel = 0
				TextLabel_3.Position = UDim2.new(0, 10, 0, 0)
				TextLabel_3.Size = UDim2.new(0, 315, 0, 29)
				TextLabel_3.Font = Enum.Font.GothamBold
				TextLabel_3.Text = dSeName
				TextLabel_3.TextColor3 = Color3.fromRGB(131, 131, 131)
				TextLabel_3.TextSize = 15.000
				TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left

				UpdateSectionFrame()
				UpdateSize()

				local opened = false
				local TCHECK

				local function TextCheck()
					for _,v in pairs(inSection:GetChildren()) do
						if v.Name == "DropSearchElement" then
							for _,v1 in pairs(v:GetChildren()) do
								if v1.Name == "TextBox" then
									if v1.Text == "" and opened then
										TextLabel_3.Visible = true
										TextLabel_3.Text = dSeName
									elseif v1.Text ~= "" and opened then
										TextLabel_3.Visible = false
									elseif v1.Text ~= "" and TCHECK == nil and not opened then
										TextLabel_3.Visible = true
										TextLabel_3.Text = dSeName -- TextBox.Text to show recent search
									elseif v1.Text ~= "" and TCHECK ~= nil and not opened then
										TextLabel_3.Visible = true
										TextLabel_3.Text = TCHECK
									end
								end
							end
						end
					end
				end

				local function UpdateInputOfSearchText()
					local InputText = string.upper(TextBox.Text)
					for _,button in pairs(DropFrame:GetChildren()) do
						if button:IsA("TextButton") then
							if InputText == "" or string.find(string.upper(button.TextLabel.Text),InputText) ~= nil then
								button.Visible = true
							else
								button.Visible = false
							end
						end
					end
				end

				DropDown.MouseButton1Click:Connect(function ()
					if opened then
						opened = false
						ScrollingDrop.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
						tween:Create(ImageLabel, tweeninfo(0.08, Enum.EasingStyle.Linear,Enum.EasingDirection.In), {
							Rotation = 90
						}):Play()
						DropSearchElement:TweenSize(UDim2.new(0, 365, 0, 34), "InOut", "Linear", 0.08)
						ScrollingFrame.Visible = false
						TextBox.Visible = false
						TextBox.ZIndex = 1
						wait(0.1)
						UpdateSectionFrame()
						UpdateSize()
					else
						opened = true
						ScrollingDrop.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
						tween:Create(ImageLabel, tweeninfo(0.08, Enum.EasingStyle.Linear,Enum.EasingDirection.In), {
							Rotation = -90
						}):Play()
						DropSearchElement:TweenSize(UDim2.new(0, 365, 0, 192), "InOut", "Linear", 0.08)
						ScrollingFrame.Visible = true
						TextBox.Visible = true
						TextBox.ZIndex = 2
						if TextBox.Changed then
							TextBox.Changed:Connect(TextCheck)
							TextBox.Changed:Connect(UpdateInputOfSearchText)
						end
						wait(0.1)
						UpdateSectionFrame()
						UpdateSize()
					end
				end)

				for i,v in next, list do
					local Option1 = Instance.new("TextButton")
					local TextLabel_5 = Instance.new("TextLabel")
					local UICorner_17 = Instance.new("UICorner")

					Option1.Name = "Option 1"
					Option1.Parent = DropFrame
					Option1.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
					Option1.BackgroundTransparency = 1.000
					Option1.BorderSizePixel = 0
					Option1.Position = UDim2.new(0, 0, 0, 0)
					Option1.Size = UDim2.new(0, 353, 0, 25)
					Option1.ZIndex = 2
					Option1.AutoButtonColor = false
					Option1.Font = Enum.Font.GothamBold
					Option1.Text = ""
					Option1.TextColor3 = Color3.fromRGB(226, 226, 226)
					Option1.TextSize = 14.000
					Option1.TextXAlignment = Enum.TextXAlignment.Left

					TextLabel_5.Parent = Option1
					TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel_5.BackgroundTransparency = 1.000
					TextLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
					TextLabel_5.BorderSizePixel = 0
					TextLabel_5.Position = UDim2.new(0, 30, 0, 0)
					TextLabel_5.Size = UDim2.new(0, 318, 0, 25)
					TextLabel_5.Font = Enum.Font.GothamBold
					TextLabel_5.Text = v
					TextLabel_5.TextColor3 = Color3.fromRGB(226, 226, 226) -- 170, 146, 250
					TextLabel_5.TextSize = 14.000
					TextLabel_5.TextXAlignment = Enum.TextXAlignment.Left

					UICorner_17.Parent = Option1

					local function removeindex(array, index)
						for i,v in pairs(array) do
							if v == index then
								table.remove(array, i)
							end
						end
					end

					Option1.MouseButton1Click:Connect(function ()
						--TCHECK = v
						if Option1.BackgroundTransparency == 1 then
							Utility:TweenObject(TextLabel_5, {TextColor3 = Color3.fromRGB(170, 146, 250)}, 0.2)
							Utility:TweenObject(Option1, {BackgroundTransparency = 0}, 0.2)
							table.insert(SelectedOp, Option1.TextLabel.Text)
						else
							Utility:TweenObject(TextLabel_5, {TextColor3 = Color3.fromRGB(226, 226, 226)}, 0.2)
							Utility:TweenObject(Option1, {BackgroundTransparency = 1}, 0.2)
							removeindex(SelectedOp, Option1.TextLabel.Text)
						end
						callback(SelectedOp)
						wait(0.1)
						UpdateSectionFrame()
						UpdateSize()
						--TextLabel_3.Text = v
					end)
				end

                function DropSelectFunction:Refresh(newList)
					newList = newList or {}
					for i,v in next, DropFrame:GetChildren() do
						if v.Name == "Option 1" then
							v:Destroy()
						end
					end
					for i,v in next, newList do
						local Option1 = Instance.new("TextButton")
						local TextLabel_5 = Instance.new("TextLabel")
						local UICorner_17 = Instance.new("UICorner")

						Option1.Name = "Option 1"
						Option1.Parent = DropFrame
						Option1.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
						Option1.BackgroundTransparency = 1.000
						Option1.BorderSizePixel = 0
						Option1.Position = UDim2.new(0, 0, 0, 0)
						Option1.Size = UDim2.new(0, 353, 0, 25)
						Option1.ZIndex = 2
						Option1.AutoButtonColor = false
						Option1.Font = Enum.Font.GothamBold
						Option1.Text = ""
						Option1.TextColor3 = Color3.fromRGB(226, 226, 226)
						Option1.TextSize = 14.000
						Option1.TextXAlignment = Enum.TextXAlignment.Left

						TextLabel_5.Parent = Option1
						TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						TextLabel_5.BackgroundTransparency = 1.000
						TextLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
						TextLabel_5.BorderSizePixel = 0
						TextLabel_5.Position = UDim2.new(0, 30, 0, 0)
						TextLabel_5.Size = UDim2.new(0, 318, 0, 25)
						TextLabel_5.Font = Enum.Font.GothamBold
						TextLabel_5.Text = v
						TextLabel_5.TextColor3 = Color3.fromRGB(226, 226, 226) -- 170, 146, 250
						TextLabel_5.TextSize = 14.000
						TextLabel_5.TextXAlignment = Enum.TextXAlignment.Left

						UICorner_17.Parent = Option1

						Option1.MouseButton1Click:Connect(function ()
                            --TCHECK = v
                            if Option1.BackgroundTransparency == 1 then
                                Utility:TweenObject(TextLabel_5, {TextColor3 = Color3.fromRGB(170, 146, 250)}, 0.2)
                                Utility:TweenObject(Option1, {BackgroundTransparency = 0}, 0.2)
                                table.insert(SelectedOp, Option1.TextLabel.Text)
                            else
                                Utility:TweenObject(TextLabel_5, {TextColor3 = Color3.fromRGB(226, 226, 226)}, 0.2)
                                Utility:TweenObject(Option1, {BackgroundTransparency = 1}, 0.2)
                                removeindex(SelectedOp, Option1.TextLabel.Text)
                            end
                            callback(SelectedOp)
                            wait(0.1)
                            UpdateSectionFrame()
                            UpdateSize()
                            --TextLabel_3.Text = v
                        end)
						UpdateSectionFrame()
						UpdateSize()
					end
					if opened then
						ScrollingDrop.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
						tween:Create(ImageLabel, tweeninfo(0.08, Enum.EasingStyle.Linear,Enum.EasingDirection.In), {
							Rotation = -90
						}):Play()
						DropSearchElement:TweenSize(UDim2.new(0, 365, 0, 192), "InOut", "Linear", 0.08)
						ScrollingFrame.Visible = true
						TextBox.Visible = true
						TextBox.ZIndex = 2
						if TextBox.Changed then
							TextBox.Changed:Connect(TextCheck)
							TextBox.Changed:Connect(UpdateInputOfSearchText)
						end
						wait(0.1)
						UpdateSectionFrame()
						UpdateSize()
					else
						ScrollingDrop.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
						tween:Create(ImageLabel, tweeninfo(0.08, Enum.EasingStyle.Linear,Enum.EasingDirection.In), {
							Rotation = 90
						}):Play()
						DropSearchElement:TweenSize(UDim2.new(0, 365, 0, 34), "InOut", "Linear", 0.08)
						ScrollingFrame.Visible = false
						TextBox.Visible = false
						TextBox.ZIndex = 1
						wait(0.1)
						UpdateSectionFrame()
						UpdateSize()
					end
                end
                return DropSelectFunction
			end

			function Elements:CreateLabel(lName, Size)
				local LabelFunctions = {}
				lName = lName or "Label"
				Size = Size or 30

				local LabelElement = Instance.new("Frame")
				local TextLabel = Instance.new("TextLabel")

				LabelElement.Name = "LabelElement"
				LabelElement.Parent = inSection
				LabelElement.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
				LabelElement.BackgroundTransparency = 1.000
				LabelElement.BorderSizePixel = 0
				LabelElement.Position = UDim2.new(0, 0, 0.567375898, 0)
				LabelElement.Size = UDim2.new(0, 369, 0, Size)
				LabelElement.AutomaticSize = Enum.AutomaticSize.Y

				TextLabel.Parent = LabelElement
				TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.BackgroundTransparency = 1.000
				TextLabel.Position = UDim2.new(0, 10, 0, 0)
				TextLabel.Size = UDim2.new(0, 354, 0, Size)
				TextLabel.Font = Enum.Font.GothamBold
				TextLabel.Text = lName
				TextLabel.TextColor3 = Color3.fromRGB(131, 131, 131)
				TextLabel.TextSize = 15.000
				TextLabel.TextWrapped = true
				TextLabel.TextXAlignment = Enum.TextXAlignment.Left
				TextLabel.AutomaticSize = Enum.AutomaticSize.Y

				UpdateSectionFrame()
				UpdateSize()

				function LabelFunctions:UpdateLabel(newText)
					if lName.Text ~= newText then
						lName.Text = newText
					end
				end
				return LabelFunctions
			end

			return Elements
		end
		return Sections
	end
	return Tabs
end
return Nebulas