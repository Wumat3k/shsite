for _, v in pairs(game:GetService("CoreGui"):GetChildren()) do
	if v:FindFirstChild("MainFrame") then
		v:Destroy()
	end
end

game:GetService("UserInputService").InputBegan:connect(
    function(key, gpe)
        if key.KeyCode == Enum.KeyCode.RightShift then
            pcall(
                function()
                    for i, v in pairs(game.CoreGui.SnowHub:GetChildren()) do
                        v.Visible = not v.Visible
                    end
                end
            )
        end
    end
)
local lib = {}
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local ContentProvider = game:GetService("ContentProvider")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local function GetXY(obj)
	local Max, May = obj.AbsoluteSize.X,obj.AbsoluteSize.Y
	local Px, Py = math.clamp(Mouse.X - obj.AbsolutePosition.X, 0, Max), math.clamp(Mouse.Y - obj.AbsolutePosition.Y, 0, May)
	return Px/Max, Py/May
end

function Ripple(obj)
	spawn(function()
		local PX, PY = GetXY(obj)
		local Circle = Instance.new("ImageLabel")
		Circle.Name = "Circle"
		Circle.Parent = obj
		Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Circle.BackgroundTransparency = 1.000
		Circle.ZIndex = 10
		Circle.Image = "rbxassetid://266543268"
		Circle.ImageColor3 = Color3.fromRGB(210,210,210)
		Circle.ImageTransparency = 0.6
		local NewX, NewY = Mouse.X - Circle.AbsolutePosition.X, Mouse.Y - Circle.AbsolutePosition.Y
		Circle.Position = UDim2.new(0, NewX, 0, NewY)
		local Size = obj.AbsoluteSize.X
		TweenService:Create(Circle, TweenInfo.new(1), {Position = UDim2.fromScale(PX,PY) - UDim2.fromOffset(Size/2,Size/2), ImageTransparency = 1, Size = UDim2.fromOffset(Size,Size)}):Play()
		spawn(function()
			wait(1.2)
			Circle:Destroy()
		end)
	end)
end

local assets = {
	"http://www.roblox.com/asset/?id=5576439039",
	"http://www.roblox.com/asset/?id=6035047377",
	"http://www.roblox.com/asset/?id=6031094678",
	"http://www.roblox.com/asset/?id=6023426926"
}

spawn(function()
	ContentProvider:PreloadAsync(assets)
end)

local function MakeDraggable(topbarobject, object) 
	pcall(function()
		local dragging = false
		local dragInput, mousePos, framePos

		topbarobject.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				dragging = true
				mousePos = input.Position
				framePos = object.Position

				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragging = false
					end
				end)
			end
		end)

		topbarobject.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement then
				dragInput = input
			end
		end)

		UserInputService.InputChanged:Connect(function(input)
			if input == dragInput and dragging then
				local delta = input.Position - mousePos
				object.Position  = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
			end
		end)
	end)
end

function genStr(l) local output = ''; local chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+-={}|[]`~';  math.randomseed(os.time());  local charTable = {};   for c in chars:gmatch"." do  table.insert(charTable, c)  end;  for i = 1, l do  output = output .. charTable[math.random(1, #charTable)] end; return output end

function lib:Window(gametxt)
	local fs = false
	local tablisttoggled = false
	local winminimized = false
	
	local SnowHub = Instance.new("ScreenGui")
	local MainFrame = Instance.new("Frame")
	local MainFrameCorner = Instance.new("UICorner")
	local MainFrameGlow = Instance.new("ImageLabel")
	local TopFrame = Instance.new("Frame")
	local TopFrameCorner = Instance.new("UICorner")
	local TopFrameLine1 = Instance.new("Frame")
	local TopFrameTitle = Instance.new("TextLabel")
	local TopFrameLine2 = Instance.new("Frame")
	local TabListBtn = Instance.new("ImageButton")
	local ContainerFolderFrame = Instance.new("Frame")
	local ContainerFolderFrameCorner = Instance.new("UICorner")
	local LoadFrame = Instance.new("Frame")
	local LoadFrameCorner = Instance.new("UICorner")
	local LoadGameText = Instance.new("TextLabel")
	local LoadProgressFrame = Instance.new("Frame")
	local LoadProgressFrameCorner = Instance.new("UICorner")
	local LoadProgress = Instance.new("Frame")
	local LoadProgressCorner = Instance.new("UICorner")
	local TabListHolder = Instance.new("Frame")
	local TabListHolderCorner = Instance.new("UICorner")
	local TabListFrame = Instance.new("Frame")
	local TabListFrameCorner = Instance.new("UICorner")
	local TabListLine2 = Instance.new("Frame")
	local TabListLine1 = Instance.new("Frame")
	local TabList = Instance.new("Frame")
	local TabListPadding = Instance.new("UIPadding")
	local TabListLayout = Instance.new("UIListLayout")

	SnowHub.Name = genStr(20)
	SnowHub.Parent = game.CoreGui
	SnowHub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	

	MainFrame.Name = "MainFrame"
	MainFrame.Parent = SnowHub
	MainFrame.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
	MainFrame.ClipsDescendants = true
	MainFrame.Position = UDim2.fromScale(0.5,0.5) - UDim2.fromOffset(410/2,280/2)
	MainFrame.Size = UDim2.new(0, 410, 0, 280)

	MainFrameCorner.CornerRadius = UDim.new(0, 4)
	MainFrameCorner.Name = "MainFrameCorner"
	MainFrameCorner.Parent = MainFrame

	MainFrameGlow.Name = "MainFrameGlow"
	MainFrameGlow.Parent = MainFrame
	MainFrameGlow.AnchorPoint = Vector2.new(0.5, 0.5)
	MainFrameGlow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MainFrameGlow.BackgroundTransparency = 1.000
	MainFrameGlow.BorderSizePixel = 0
	MainFrameGlow.Position = UDim2.new(0.5, 0, 0.5, 0)
	MainFrameGlow.Size = UDim2.new(1, 28, 1, 28)
	MainFrameGlow.ZIndex = 0
	MainFrameGlow.Image = "rbxassetid://4996891970"
	MainFrameGlow.ImageColor3 = Color3.fromRGB(15, 15, 15)
	MainFrameGlow.ScaleType = Enum.ScaleType.Slice
	MainFrameGlow.SliceCenter = Rect.new(20, 20, 280, 280)

	TopFrame.Name = "TopFrame"
	TopFrame.Parent = MainFrame
	TopFrame.AnchorPoint = Vector2.new(0, 1)
	TopFrame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
	TopFrame.Size = UDim2.new(1, 0, 0, 33)

	TopFrameCorner.CornerRadius = UDim.new(0, 7)
	TopFrameCorner.Name = "TopFrameCorner"
	TopFrameCorner.Parent = TopFrame

	TopFrameLine1.Name = "TopFrameLine1"
	TopFrameLine1.Parent = TopFrame
	TopFrameLine1.AnchorPoint = Vector2.new(0.5, 1)
	TopFrameLine1.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
	TopFrameLine1.BorderSizePixel = 0
	TopFrameLine1.Position = UDim2.new(0.5, 0, 1, 0)
	TopFrameLine1.Size = UDim2.new(1, 0, 0, 10)

	TopFrameTitle.Name = "TopFrameTitle"
	TopFrameTitle.Parent = TopFrame
	TopFrameTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TopFrameTitle.BackgroundTransparency = 1.000
	TopFrameTitle.Position = UDim2.new(0, 31, 0, 0)
	TopFrameTitle.Size = UDim2.new(1, -10, 1, 0)
	TopFrameTitle.Font = Enum.Font.Gotham
	TopFrameTitle.Text = "<font color=\"rgb(200,200,200)\">Something</font><font color=\"rgb(230,230,230)\"> Hub</font>"
	TopFrameTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	TopFrameTitle.TextSize = 14.000
	TopFrameTitle.TextXAlignment = Enum.TextXAlignment.Left
	TopFrameTitle.RichText = true

	TopFrameLine2.Name = "TopFrameLine2"
	TopFrameLine2.Parent = TopFrame
	TopFrameLine2.AnchorPoint = Vector2.new(0.5, 1)
	TopFrameLine2.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
	TopFrameLine2.BorderSizePixel = 0
	TopFrameLine2.Position = UDim2.new(0.5, 0, 1, 0)
	TopFrameLine2.Size = UDim2.new(1, 0, 0, 1)

	TabListBtn.Name = "TabListBtn"
	TabListBtn.Parent = TopFrame
	TabListBtn.AnchorPoint = Vector2.new(0, 0.5)
	TabListBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabListBtn.BackgroundTransparency = 1.000
	TabListBtn.Position = UDim2.new(0, 7, 0.5, 0)
	TabListBtn.Size = UDim2.new(0, 20, 0, 20)
	TabListBtn.Image = "http://www.roblox.com/asset/?id=5576439039"

	ContainerFolderFrame.Name = "ContainerFolderFrame"
	ContainerFolderFrame.Parent = MainFrame
	ContainerFolderFrame.AnchorPoint = Vector2.new(0.5, 0)
	ContainerFolderFrame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
	ContainerFolderFrame.Position = UDim2.new(0.5, 0, 0, 44)
	ContainerFolderFrame.Size = UDim2.new(0,442,0,275)

	ContainerFolderFrameCorner.CornerRadius = UDim.new(0, 4)
	ContainerFolderFrameCorner.Name = "ContainerFolderFrameCorner"
	ContainerFolderFrameCorner.Parent = ContainerFolderFrame

	LoadFrame.Name = "LoadFrame"
	LoadFrame.Parent = MainFrame
	LoadFrame.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
	LoadFrame.BorderSizePixel = 0
	LoadFrame.ClipsDescendants = true
	LoadFrame.Size = UDim2.new(1, 0, 1, -33)
	LoadFrame.Position = UDim2.new(0,0,0,33)

	LoadFrameCorner.CornerRadius = UDim.new(0, 4)
	LoadFrameCorner.Name = "LoadFrameCorner"
	LoadFrameCorner.Parent = LoadFrame

	LoadGameText.Name = "LoadGameText"
	LoadGameText.Parent = LoadFrame
	LoadGameText.AnchorPoint = Vector2.new(0.5, 0.5)
	LoadGameText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LoadGameText.BackgroundTransparency = 1.000
	LoadGameText.Position = UDim2.new(0.5, 0, 0.5, -14)
	LoadGameText.Size = UDim2.new(0, 68, 0, 15)
	LoadGameText.Font = Enum.Font.Gotham
	LoadGameText.Text = "Loading..."
	LoadGameText.TextColor3 = Color3.fromRGB(255, 255, 255)
	LoadGameText.TextSize = 14.000
	LoadGameText.TextTransparency = 1.000

	LoadProgressFrame.Name = "LoadProgressFrame"
	LoadProgressFrame.Parent = LoadFrame
	LoadProgressFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	LoadProgressFrame.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
	LoadProgressFrame.BackgroundTransparency = 1.000
	LoadProgressFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	LoadProgressFrame.Size = UDim2.new(0, 150, 0, 4)

	LoadProgressFrameCorner.Name = "LoadProgressFrameCorner"
	LoadProgressFrameCorner.Parent = LoadProgressFrame

	LoadProgress.Name = "LoadProgress"
	LoadProgress.Parent = LoadProgressFrame
	LoadProgress.AnchorPoint = Vector2.new(0, 0.5)
	LoadProgress.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
	LoadProgress.BackgroundTransparency = 1.000
	LoadProgress.BorderSizePixel = 0
	LoadProgress.Position = UDim2.new(0, 0, 0.5, 0)
	LoadProgress.Size = UDim2.new(0, 0, 0, 4)

	LoadProgressCorner.Name = "LoadProgressCorner"
	LoadProgressCorner.Parent = LoadProgress

	TabListHolder.Name = "TabListHolder"
	TabListHolder.Parent = MainFrame
	TabListHolder.BackgroundColor3 = Color3.fromRGB(0,0,0)
	TabListHolder.BackgroundTransparency = 1.000
	TabListHolder.BorderSizePixel = 0
	TabListHolder.ClipsDescendants = true
	TabListHolder.Position = UDim2.new(0, 0, 0, 33)
	TabListHolder.Size = UDim2.new(1, 0, 1, -33)

	TabListHolderCorner.CornerRadius = UDim.new(0, 4)
	TabListHolderCorner.Name = "TabListHolderCorner"
	TabListHolderCorner.Parent = TabListHolder

	TabListFrame.Name = "TabListFrame"
	TabListFrame.Parent = TabListHolder
	TabListFrame.AnchorPoint = Vector2.new(1, 0)
	TabListFrame.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
	TabListFrame.Size = UDim2.new(0.38, 0, 1, 0)

	TabListFrameCorner.CornerRadius = UDim.new(0, 7)
	TabListFrameCorner.Name = "TabListFrameCorner"
	TabListFrameCorner.Parent = TabListFrame

	TabListLine2.Name = "TabListLine2"
	TabListLine2.Parent = TabListFrame
	TabListLine2.AnchorPoint = Vector2.new(1, 0)
	TabListLine2.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
	TabListLine2.BorderSizePixel = 0
	TabListLine2.Position = UDim2.new(1, 0, 0, 0)
	TabListLine2.Size = UDim2.new(0, 10, 1, 0)

	TabListLine1.Name = "TabListLine1"
	TabListLine1.Parent = TabListFrame
	TabListLine1.AnchorPoint = Vector2.new(1, 1)
	TabListLine1.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
	TabListLine1.BorderSizePixel = 0
	TabListLine1.Position = UDim2.new(1, 1, 1, 0)
	TabListLine1.Size = UDim2.new(0, 1, 1, 0)

	TabList.Name = "TabList"
	TabList.Parent = TabListFrame
	TabList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabList.BackgroundTransparency = 1.000
	TabList.Size = UDim2.new(1, 0, 1, 0)

	TabListPadding.Name = "TabListPadding"
	TabListPadding.Parent = TabList
	TabListPadding.PaddingTop = UDim.new(0, 12)

	TabListLayout.Name = "TabListLayout"
	TabListLayout.Parent = TabList
	TabListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	TabListLayout.Padding = UDim.new(0, 2)
	MakeDraggable(TopFrame,MainFrame)
	
	local ContainerFolder = Instance.new("Folder")
	ContainerFolder.Parent = ContainerFolderFrame
	

	local MinimizeBtn = Instance.new("TextButton")
	local MinimizeBtnCorner = Instance.new("UICorner")
	local MinimizeBtnIco = Instance.new("ImageLabel")

	MinimizeBtn.Name = "MinimizeBtn"
	MinimizeBtn.Parent = TopFrame
	MinimizeBtn.AnchorPoint = Vector2.new(1, 0.5)
	MinimizeBtn.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
	MinimizeBtn.Position = UDim2.new(1, -8, 0.5, 0)
	MinimizeBtn.Size = UDim2.new(0, 21, 0, 21)
	MinimizeBtn.AutoButtonColor = false
	MinimizeBtn.Font = Enum.Font.SourceSans
	MinimizeBtn.Text = ""
	MinimizeBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
	MinimizeBtn.TextSize = 14.000

	MinimizeBtnCorner.CornerRadius = UDim.new(0, 4)
	MinimizeBtnCorner.Name = "MinimizeBtnCorner"
	MinimizeBtnCorner.Parent = MinimizeBtn

	MinimizeBtnIco.Name = "MinimizeBtnIco"
	MinimizeBtnIco.Parent = MinimizeBtn
	MinimizeBtnIco.AnchorPoint = Vector2.new(0.5, 0.5)
	MinimizeBtnIco.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MinimizeBtnIco.BackgroundTransparency = 1.000
	MinimizeBtnIco.Position = UDim2.new(0.5, 0, 0.5, 0)
	MinimizeBtnIco.Size = UDim2.new(1, -2, 1, -2)
	MinimizeBtnIco.Image = "http://www.roblox.com/asset/?id=6035067836"
	
	function lib:Notify(text)
		spawn(function()
			local NotificationHolder = Instance.new("TextButton")
			local NotificationHolderCorner = Instance.new("UICorner")


			NotificationHolder.Name = "NotificationHolder"
			NotificationHolder.Parent = MainFrame
			NotificationHolder.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			NotificationHolder.BackgroundTransparency = 1.000
			NotificationHolder.Position = UDim2.new(0, 0, 0, 33)
			NotificationHolder.Size = UDim2.new(1, 0, 1, -33)
			NotificationHolder.AutoButtonColor = false
			NotificationHolder.Font = Enum.Font.SourceSans
			NotificationHolder.Text = ""
			NotificationHolder.TextColor3 = Color3.fromRGB(0, 0, 0)
			NotificationHolder.TextSize = 14.000

			NotificationHolderCorner.CornerRadius = UDim.new(0, 4)
			NotificationHolderCorner.Name = "NotificationHolderCorner"
			NotificationHolderCorner.Parent = NotificationHolder

			local Notification = Instance.new("Frame")
			local NotificationText = Instance.new("TextLabel")
			local NotificationGlow = Instance.new("ImageLabel")
			local NotificationBtn = Instance.new("TextButton")
			local NotificationBtnCorner = Instance.new("UICorner")
			local NotificationCorner = Instance.new("UICorner")


			Notification.Name = "Notification"
			Notification.Parent = NotificationHolder
			Notification.AnchorPoint = Vector2.new(0.5, 0.5)
			Notification.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
			Notification.BackgroundTransparency = 1.000
			Notification.ClipsDescendants = true
			Notification.Position = UDim2.new(0.5, 0, 0.5, 0)
			Notification.Size = UDim2.new(0, 400, 0, 0)

			NotificationText.Name = "NotificationText"
			NotificationText.Parent = Notification
			NotificationText.AnchorPoint = Vector2.new(0.5, 0)
			NotificationText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			NotificationText.BackgroundTransparency = 1.000
			NotificationText.Position = UDim2.new(0.5, 0, 0, 9)
			NotificationText.Size = UDim2.new(1, -18, 1, -48)
			NotificationText.Font = Enum.Font.Gotham
			NotificationText.Text = text
			NotificationText.TextColor3 = Color3.fromRGB(255, 255, 255)
			NotificationText.TextSize = 14.000
			NotificationText.TextTransparency = 1.000
			NotificationText.TextWrapped = true
			NotificationText.TextXAlignment = Enum.TextXAlignment.Left
			NotificationText.TextYAlignment = Enum.TextYAlignment.Top

			NotificationGlow.Name = "NotificationGlow"
			NotificationGlow.Parent = Notification
			NotificationGlow.AnchorPoint = Vector2.new(0.5, 0.5)
			NotificationGlow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			NotificationGlow.BackgroundTransparency = 1.000
			NotificationGlow.BorderSizePixel = 0
			NotificationGlow.Position = UDim2.new(0.5, 0, 0.5, 0)
			NotificationGlow.Size = UDim2.new(1, 28, 1, 28)
			NotificationGlow.ZIndex = 0
			NotificationGlow.Image = "rbxassetid://4996891970"
			NotificationGlow.ImageColor3 = Color3.fromRGB(15, 15, 15)
			NotificationGlow.ImageTransparency = 1.000
			NotificationGlow.ScaleType = Enum.ScaleType.Slice
			NotificationGlow.SliceCenter = Rect.new(20, 20, 280, 280)

			NotificationBtn.Name = "NotificationBtn"
			NotificationBtn.Parent = Notification
			NotificationBtn.AnchorPoint = Vector2.new(1, 1)
			NotificationBtn.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
			NotificationBtn.BackgroundTransparency = 1.000
			NotificationBtn.Position = UDim2.new(1, -10, 1, -10)
			NotificationBtn.Size = UDim2.new(0, 50, 0, 27)
			NotificationBtn.Font = Enum.Font.Gotham
			NotificationBtn.Text = "Okay"
			NotificationBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
			NotificationBtn.TextSize = 14.000
			NotificationBtn.TextTransparency = 1.000
			NotificationBtn.AutoButtonColor = false

			NotificationBtnCorner.CornerRadius = UDim.new(0, 4)
			NotificationBtnCorner.Name = "NotificationBtnCorner"
			NotificationBtnCorner.Parent = NotificationBtn

			NotificationCorner.CornerRadius = UDim.new(0, 4)
			NotificationCorner.Name = "NotificationCorner"
			NotificationCorner.Parent = Notification
			
			Notification.Size = UDim2.new(0, 400, 0, NotificationText.TextBounds.Y + 52)			
			
			TweenService:Create(NotificationHolder,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 0.75}):Play()
			wait(.3)
			TweenService:Create(Notification,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
			TweenService:Create(NotificationBtn,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
			TweenService:Create(NotificationBtn,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
			TweenService:Create(NotificationGlow,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 0}):Play()
			TweenService:Create(NotificationText,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
			
			NotificationBtn.MouseButton1Click:Connect(function()
				TweenService:Create(Notification,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
				TweenService:Create(NotificationBtn,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
				TweenService:Create(NotificationBtn,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
				TweenService:Create(NotificationGlow,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 1}):Play()
				TweenService:Create(NotificationText,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
				wait(.15)
				TweenService:Create(NotificationHolder,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
				wait(.15)
				NotificationHolder:Destroy()
			end)
			
		end)
	end
	
	MinimizeBtn.MouseButton1Click:Connect(function()
		winminimized = not winminimized
		MainFrame:TweenSize(winminimized and UDim2.new(0, 460, 0, 33) or UDim2.new(0, 460, 0, 330), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
		MinimizeBtnIco.Image = winminimized and "http://www.roblox.com/asset/?id=6035047377" or "http://www.roblox.com/asset/?id=6035067836"
		if winminimized then
			MainFrame.ClipsDescendants = true
		else
			wait(.3)
			MainFrame.ClipsDescendants = false
		end
		
	end)
	
	
	TabListBtn.MouseButton1Click:Connect(function()
		tablisttoggled = not tablisttoggled
		TweenService:Create(TabListHolder,TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = tablisttoggled and 0.75 or 1}):Play()
		TweenService:Create(TabListFrame,TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{AnchorPoint = tablisttoggled and Vector2.new(0, 0) or Vector2.new(1, 0)}):Play()
	end)
	
	MainFrame:TweenSize(UDim2.new(0, 460, 0, 330), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
	TweenService:Create(MainFrame,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
	wait(.4)
	TweenService:Create(LoadProgress,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
	TweenService:Create(LoadProgressFrame,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
	TweenService:Create(LoadGameText,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
	
	wait(1)
	LoadProgress:TweenSize(UDim2.new(0.5, 0, 0, 4), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
	LoadGameText.Text = "Fetching Scripts..."
	wait(1.5)
	LoadProgress:TweenSize(UDim2.new(0.75, 0, 0, 4), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
	LoadGameText.Text = "Game detected - " .. gametxt
	wait(0.75)
	LoadProgress:TweenSize(UDim2.new(1, 0, 0, 4), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
	LoadGameText.Text = "Welcome to Something Hub!"
	wait(1)
	TweenService:Create(LoadProgress,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
	TweenService:Create(LoadProgressFrame,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
	TweenService:Create(LoadGameText,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
	TweenService:Create(TopFrame,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{AnchorPoint = Vector2.new(0, 0)}):Play()
	TweenService:Create(LoadFrame,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
	wait(.3)
	LoadFrame:Destroy()
	MainFrame.ClipsDescendants = false
	local tabhold = {}
	function tabhold:Tab(text)
		local Tab = Instance.new("TextButton")
		local TabText = Instance.new("TextLabel")
		local TabCorner = Instance.new("UICorner")

		Tab.Name = "Tab"
		Tab.Parent = TabList
		Tab.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
		Tab.BackgroundTransparency = 1.000
		Tab.Size = UDim2.new(1, -24, 0, 30)
		Tab.AutoButtonColor = false
		Tab.Font = Enum.Font.SourceSans
		Tab.Text = ""
		Tab.TextColor3 = Color3.fromRGB(0, 0, 0)
		Tab.TextSize = 14.000

		TabText.Name = "TabText"
		TabText.Parent = Tab
		TabText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabText.BackgroundTransparency = 1.000
		TabText.Position = UDim2.new(0, 7, 0, 0)
		TabText.Size = UDim2.new(1, -10, 1, 0)
		TabText.Font = Enum.Font.Gotham
		TabText.Text = text
		TabText.TextColor3 = Color3.fromRGB(200,200,200)
		TabText.TextSize = 14.000
		TabText.TextXAlignment = Enum.TextXAlignment.Left

		TabCorner.CornerRadius = UDim.new(0, 4)
		TabCorner.Name = "TabCorner"
		TabCorner.Parent = Tab

		local ContainerFrame = Instance.new("ScrollingFrame")
		local ContainerFrameLayout = Instance.new("UIListLayout")

		ContainerFrame.Name = "ContainerFrame"
		ContainerFrame.Parent = ContainerFolder
		ContainerFrame.Active = true
		ContainerFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		ContainerFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ContainerFrame.BackgroundTransparency = 1.000
		ContainerFrame.BorderSizePixel = 0
		ContainerFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
		ContainerFrame.Size = UDim2.new(1, -18, 1, -18)
		ContainerFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
		ContainerFrame.ScrollBarThickness = 0
		ContainerFrame.Visible = false

		ContainerFrameLayout.Name = "ContainerFrameLayout"
		ContainerFrameLayout.Parent = ContainerFrame
		ContainerFrameLayout.SortOrder = Enum.SortOrder.LayoutOrder
		ContainerFrameLayout.Padding = UDim.new(0,6)
		
		Tab.MouseButton1Click:Connect(function()
			for i,v in next, TabList:GetChildren() do
				if v.Name == "Tab" then
					v.BackgroundTransparency = 1
					v.TabText.TextColor3 = Color3.fromRGB(200,200,200)
				end
				Tab.BackgroundTransparency = 0
				TabText.TextColor3 = Color3.fromRGB(255,255,255)
			end
			for i,v in next, ContainerFolder:GetChildren() do
				if v:IsA("ScrollingFrame") then
					v.Visible = false
				end
				ContainerFrame.Visible = true
			end
		end)
		
		if fs == false then
			fs = true
			Tab.BackgroundTransparency = 0
			TabText.TextColor3 = Color3.fromRGB(255,255,255)
			ContainerFrame.Visible = true
		end
		local containerhold = {}
		function containerhold:Button(text,callback)
			local Button = Instance.new("TextButton")
			local ButtonCorner = Instance.new("UICorner")
			local ButtonText = Instance.new("TextLabel")

			Button.Name = "Button"
			Button.Parent = ContainerFrame
			Button.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
			Button.Size = UDim2.new(1, 0, 0, 32)
			Button.Font = Enum.Font.SourceSans
			Button.Text = ""
			Button.TextColor3 = Color3.fromRGB(0, 0, 0)
			Button.TextSize = 14.000
			Button.AutoButtonColor = false
			Button.ClipsDescendants = true

			ButtonCorner.CornerRadius = UDim.new(0, 4)
			ButtonCorner.Name = "ButtonCorner"
			ButtonCorner.Parent = Button

			ButtonText.Name = "ButtonText"
			ButtonText.Parent = Button
			ButtonText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ButtonText.BackgroundTransparency = 1.000
			ButtonText.Position = UDim2.new(0, 10, 0, 0)
			ButtonText.Size = UDim2.new(0, 1, 1, 0)
			ButtonText.Font = Enum.Font.Gotham
			ButtonText.Text = text
			ButtonText.TextColor3 = Color3.fromRGB(255, 255, 255)
			ButtonText.TextSize = 14.000
			ButtonText.TextXAlignment = Enum.TextXAlignment.Left
			
			Button.MouseButton1Click:Connect(function()
				Ripple(Button)
				pcall(callback)
			end)
			
			Button.MouseEnter:Connect(function()
				TweenService:Create(Button,TweenInfo.new(.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(45,45,45)}):Play()
			end)
			
			Button.MouseLeave:Connect(function()
				TweenService:Create(Button,TweenInfo.new(.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(42, 42, 42)}):Play()
			end)
			ContainerFrame.CanvasSize = UDim2.new(0, 0, 0, ContainerFrameLayout.AbsoluteContentSize.Y)
		end
		function containerhold:Toggle(text,def,callback)
			local toggled = def or false
			local Toggle = Instance.new("TextButton")
			local ToggleCorner = Instance.new("UICorner")
			local ToggleText = Instance.new("TextLabel")
			local ToggleLine = Instance.new("Frame")
			local ToggleIco = Instance.new("ImageLabel")

			Toggle.Name = "Toggle"
			Toggle.Parent = ContainerFrame
			Toggle.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
			Toggle.Size = UDim2.new(1, 0, 0, 32)
			Toggle.AutoButtonColor = false
			Toggle.Font = Enum.Font.SourceSans
			Toggle.Text = ""
			Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
			Toggle.TextSize = 14.000

			ToggleCorner.CornerRadius = UDim.new(0, 4)
			ToggleCorner.Name = "ToggleCorner"
			ToggleCorner.Parent = Toggle

			ToggleText.Name = "ToggleText"
			ToggleText.Parent = Toggle
			ToggleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToggleText.BackgroundTransparency = 1.000
			ToggleText.Position = UDim2.new(0, 38, 0, 0)
			ToggleText.Size = UDim2.new(0, 1, 1, 0)
			ToggleText.Font = Enum.Font.Gotham
			ToggleText.Text = text
			ToggleText.TextColor3 = Color3.fromRGB(255, 255, 255)
			ToggleText.TextSize = 14.000
			ToggleText.TextXAlignment = Enum.TextXAlignment.Left

			ToggleLine.Name = "ToggleLine"
			ToggleLine.Parent = Toggle
			ToggleLine.AnchorPoint = Vector2.new(0, 0.5)
			ToggleLine.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
			ToggleLine.BorderSizePixel = 0
			ToggleLine.Position = UDim2.new(0, 28, 0.5, 0)
			ToggleLine.Size = UDim2.new(0, 1, 1, -18)

			ToggleIco.Name = "ToggleIco"
			ToggleIco.Parent = Toggle
			ToggleIco.AnchorPoint = Vector2.new(0.5, 0.5)
			ToggleIco.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToggleIco.BackgroundTransparency = 1.000
			ToggleIco.Position = UDim2.new(0, 15, 0.5, 0)
			ToggleIco.Size = UDim2.new(0, 18, 0, 18)
			ToggleIco.Image = "http://www.roblox.com/asset/?id=6031094678"
			
			Toggle.MouseButton1Click:Connect(function()
				toggled = not toggled
				spawn(function()
					ToggleIco:TweenSize(UDim2.new(0,14,0,14), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
					TweenService:Create(ToggleIco,TweenInfo.new(.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 1}):Play()
					wait(.1)
					ToggleIco.Image = toggled and "http://www.roblox.com/asset/?id=6023426926" or "http://www.roblox.com/asset/?id=6031094678"
					TweenService:Create(ToggleIco,TweenInfo.new(.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageColor3 = toggled and Color3.fromRGB(80, 255, 80) or Color3.fromRGB(255,255,255)}):Play()
					wait(.1)
					TweenService:Create(ToggleIco,TweenInfo.new(.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 0}):Play()
					ToggleIco:TweenSize(UDim2.new(0,18,0,18), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
				end)
				
				pcall(callback,toggled)
			end)
			
			Toggle.MouseEnter:Connect(function()
				TweenService:Create(Toggle,TweenInfo.new(.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(45,45,45)}):Play()
			end)

			Toggle.MouseLeave:Connect(function()
				TweenService:Create(Toggle,TweenInfo.new(.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(42, 42, 42)}):Play()
			end)
			ContainerFrame.CanvasSize = UDim2.new(0, 0, 0, ContainerFrameLayout.AbsoluteContentSize.Y)
		end
		function containerhold:Slider(text,min,max,start,inc,callback)
			local dragging = false
			local Slider = Instance.new("Frame")
			local SliderCorner = Instance.new("UICorner")
			local SliderText = Instance.new("TextLabel")
			local SliderFrame = Instance.new("Frame")
			local SliderFrameCorner = Instance.new("UICorner")
			local SliderCurrentFrame = Instance.new("Frame")
			local SliderCurrentFrameCorner = Instance.new("UICorner")
			local Value = Instance.new("TextLabel")

			Slider.Name = "Slider"
			Slider.Parent = ContainerFrame
			Slider.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
			Slider.Size = UDim2.new(1, 0, 0, 44)

			SliderCorner.CornerRadius = UDim.new(0, 4)
			SliderCorner.Name = "SliderCorner"
			SliderCorner.Parent = Slider

			SliderText.Name = "SliderText"
			SliderText.Parent = Slider
			SliderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderText.BackgroundTransparency = 1.000
			SliderText.Position = UDim2.new(0, 10, 0, 0)
			SliderText.Size = UDim2.new(0, 1, 0, 32)
			SliderText.Font = Enum.Font.Gotham
			SliderText.Text = text
			SliderText.TextColor3 = Color3.fromRGB(255, 255, 255)
			SliderText.TextSize = 14.000
			SliderText.TextXAlignment = Enum.TextXAlignment.Left

			SliderFrame.Name = "SliderFrame"
			SliderFrame.Parent = Slider
			SliderFrame.AnchorPoint = Vector2.new(0.5, 0)
			SliderFrame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
			SliderFrame.Position = UDim2.new(0.5, 0, 0, 30)
			SliderFrame.Size = UDim2.new(1, -20, 0, 5)

			SliderFrameCorner.CornerRadius = UDim.new(0, 4)
			SliderFrameCorner.Name = "SliderFrameCorner"
			SliderFrameCorner.Parent = SliderFrame

			SliderCurrentFrame.Name = "SliderCurrentFrame"
			SliderCurrentFrame.Parent = SliderFrame
			SliderCurrentFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
			SliderCurrentFrame.Size = UDim2.new((start or 0) / max, 0, 1, 0)
			SliderCurrentFrame.BorderSizePixel = 0

			SliderCurrentFrameCorner.CornerRadius = UDim.new(0, 4)
			SliderCurrentFrameCorner.Name = "SliderCurrentFrameCorner"
			SliderCurrentFrameCorner.Parent = SliderCurrentFrame

			Value.Name = "Value"
			Value.Parent = Slider
			Value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Value.BackgroundTransparency = 1.000
			Value.Position = UDim2.new(1, -10, 0, 0)
			Value.Size = UDim2.new(0, 1, 0, 32)
			Value.Font = Enum.Font.Gotham
			Value.Text = tostring(start and math.floor((start / max) * (max - min) + min) or 0)
			Value.TextColor3 = Color3.fromRGB(255, 255, 255)
			Value.TextSize = 14.000
			Value.TextXAlignment = Enum.TextXAlignment.Right
			
			local function move(Input)
				local XSize = math.clamp((Input.Position.X - SliderFrame.AbsolutePosition.X) / SliderFrame.AbsoluteSize.X, 0, 1)
				local Increment = inc and (max / ((max - min) / (inc * 4))) or 
					(max >= 50 and max / ((max - min) / 4)) or 
					(max >= 25 and max / ((max - min) / 2)) or 
					(max / (max - min))

				local SizeRounded = UDim2.new((math.round(XSize * ((max / Increment) * 4)) / ((max / Increment) * 4)), 0, 1, 0)
				SliderCurrentFrame:TweenSize(SizeRounded, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)

				local Val = math.round((((SizeRounded.X.Scale * max) / max) * (max - min) + min) * 20) / 20
				Value.Text = tostring(Val)
				pcall(callback, tonumber(Val))
			end
			SliderFrame.InputBegan:Connect(
				function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging = true
					end
				end
			)
			SliderFrame.InputEnded:Connect(
				function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging = false
					end
				end
			)
			game:GetService("UserInputService").InputChanged:Connect(
			function(input)
				if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
					move(input)
				end
			end
			)
			ContainerFrame.CanvasSize = UDim2.new(0, 0, 0, ContainerFrameLayout.AbsoluteContentSize.Y)
		end
		function containerhold:Dropdown(text,list,callback)
			local dropfunc = {}
			local droptoggled = false
			
			local Dropdown = Instance.new("Frame")
			local DropdownBtn = Instance.new("TextButton")
			local DropdownBtnCorner = Instance.new("UICorner")
			local DropdownBtnIcoFrame = Instance.new("Frame")
			local DropdownBtnIcoFrameCorner = Instance.new("UICorner")
			local DropdownBtnIco = Instance.new("ImageLabel")
			local DropdownBtnText = Instance.new("TextLabel")
			local DropdownItemHolder = Instance.new("Frame")
			local DropdownItemHolderLayout = Instance.new("UIListLayout")

			Dropdown.Name = "Dropdown"
			Dropdown.Parent = ContainerFrame
			Dropdown.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
			Dropdown.BackgroundTransparency = 1.000
			Dropdown.ClipsDescendants = true
			Dropdown.Position = UDim2.new(0, 0, 0.490272373, 0)
			Dropdown.Size = UDim2.new(1, 0, 0, 32)

			DropdownBtn.Name = "DropdownBtn"
			DropdownBtn.Parent = Dropdown
			DropdownBtn.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
			DropdownBtn.Size = UDim2.new(1, 0, 0, 32)
			DropdownBtn.Font = Enum.Font.SourceSans
			DropdownBtn.Text = ""
			DropdownBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
			DropdownBtn.TextSize = 14.000
			DropdownBtn.AutoButtonColor = false

			DropdownBtnCorner.CornerRadius = UDim.new(0, 4)
			DropdownBtnCorner.Name = "DropdownBtnCorner"
			DropdownBtnCorner.Parent = DropdownBtn

			DropdownBtnIcoFrame.Name = "DropdownBtnIcoFrame"
			DropdownBtnIcoFrame.Parent = DropdownBtn
			DropdownBtnIcoFrame.AnchorPoint = Vector2.new(1, 0.5)
			DropdownBtnIcoFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
			DropdownBtnIcoFrame.Position = UDim2.new(1, -8, 0.5, 0)
			DropdownBtnIcoFrame.Size = UDim2.new(0, 21, 0, 21)

			DropdownBtnIcoFrameCorner.CornerRadius = UDim.new(0, 4)
			DropdownBtnIcoFrameCorner.Name = "DropdownBtnIcoFrameCorner"
			DropdownBtnIcoFrameCorner.Parent = DropdownBtnIcoFrame

			DropdownBtnIco.Name = "DropdownBtnIco"
			DropdownBtnIco.Parent = DropdownBtnIcoFrame
			DropdownBtnIco.AnchorPoint = Vector2.new(0.5, 0.5)
			DropdownBtnIco.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropdownBtnIco.BackgroundTransparency = 1.000
			DropdownBtnIco.Position = UDim2.new(0.5, 0, 0.5, 0)
			DropdownBtnIco.Size = UDim2.new(1, -2, 1, -2)
			DropdownBtnIco.Image = "http://www.roblox.com/asset/?id=6035047377"

			DropdownBtnText.Name = "DropdownBtnText"
			DropdownBtnText.Parent = DropdownBtn
			DropdownBtnText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropdownBtnText.BackgroundTransparency = 1.000
			DropdownBtnText.Position = UDim2.new(0, 10, 0, 0)
			DropdownBtnText.Size = UDim2.new(0, 1, 0, 32)
			DropdownBtnText.Font = Enum.Font.Gotham
			DropdownBtnText.Text = text
			DropdownBtnText.TextColor3 = Color3.fromRGB(255, 255, 255)
			DropdownBtnText.TextSize = 14.000
			DropdownBtnText.TextXAlignment = Enum.TextXAlignment.Left

			DropdownItemHolder.Name = "DropdownItemHolder"
			DropdownItemHolder.Parent = Dropdown
			DropdownItemHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropdownItemHolder.BackgroundTransparency = 1.000
			DropdownItemHolder.Position = UDim2.new(0, 0, 0, 38)
			DropdownItemHolder.Size = UDim2.new(1, 0, 0, 0)

			DropdownItemHolderLayout.Name = "DropdownItemHolderLayout"
			DropdownItemHolderLayout.Parent = DropdownItemHolder
			DropdownItemHolderLayout.SortOrder = Enum.SortOrder.LayoutOrder
			DropdownItemHolderLayout.Padding = UDim.new(0, 4)
			
			local function toggledrop(t)
				spawn(function()
					droptoggled = t
					Dropdown:TweenSize(droptoggled and UDim2.new(1, 0, 0, 38 + DropdownItemHolderLayout.AbsoluteContentSize.Y) or UDim2.new(1, 0, 0, 32), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .1, true)
					DropdownBtnIco.Image = droptoggled and "http://www.roblox.com/asset/?id=6035067836" or "http://www.roblox.com/asset/?id=6035047377"
					wait(.1)
					ContainerFrame.CanvasSize = UDim2.new(0, 0, 0, ContainerFrameLayout.AbsoluteContentSize.Y)
				end)
			end
			
			DropdownBtn.MouseButton1Click:Connect(function()
				toggledrop(not droptoggled)
			end)
			
			for i,v in next, list do
				local Item = Instance.new("TextButton")
				local ItemCorner = Instance.new("UICorner")
				local ItemText = Instance.new("TextLabel")

				Item.Name = "Item"
				Item.Parent = DropdownItemHolder
				Item.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
				Item.Size = UDim2.new(1, 0, 0, 20)
				Item.Font = Enum.Font.SourceSans
				Item.Text = ""
				Item.TextColor3 = Color3.fromRGB(0, 0, 0)
				Item.TextSize = 14.000
				Item.AutoButtonColor = false

				ItemCorner.CornerRadius = UDim.new(0, 4)
				ItemCorner.Name = "ItemCorner"
				ItemCorner.Parent = Item

				ItemText.Name = "ItemText"
				ItemText.Parent = Item
				ItemText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ItemText.BackgroundTransparency = 1.000
				ItemText.Position = UDim2.new(0, 5, 0, 0)
				ItemText.Size = UDim2.new(0, 1, 1, 0)
				ItemText.Font = Enum.Font.Gotham
				ItemText.Text = v
				ItemText.TextColor3 = Color3.fromRGB(255, 255, 255)
				ItemText.TextSize = 13.000
				ItemText.TextXAlignment = Enum.TextXAlignment.Left
				
				Item.MouseButton1Click:Connect(function()
					DropdownBtnText.Text = text .. " - " .. v
					toggledrop()
					pcall(callback, v)
				end)
			end
			
			function dropfunc:Clear()
				for i,v in next, DropdownItemHolder:GetChildren() do
					if v.Name == "Item" then
						v:Destroy()
					end
				end
				DropdownBtnText.Text = text
				toggledrop(false)
			end
			
			function dropfunc:Add(toadd)
				if typeof(toadd) == "string" then
					local Item = Instance.new("TextButton")
					local ItemCorner = Instance.new("UICorner")
					local ItemText = Instance.new("TextLabel")

					Item.Name = "Item"
					Item.Parent = DropdownItemHolder
					Item.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
					Item.Size = UDim2.new(1, 0, 0, 20)
					Item.Font = Enum.Font.SourceSans
					Item.Text = ""
					Item.TextColor3 = Color3.fromRGB(0, 0, 0)
					Item.TextSize = 14.000
					Item.AutoButtonColor = false

					ItemCorner.CornerRadius = UDim.new(0, 4)
					ItemCorner.Name = "ItemCorner"
					ItemCorner.Parent = Item

					ItemText.Name = "ItemText"
					ItemText.Parent = Item
					ItemText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ItemText.BackgroundTransparency = 1.000
					ItemText.Position = UDim2.new(0, 5, 0, 0)
					ItemText.Size = UDim2.new(0, 1, 1, 0)
					ItemText.Font = Enum.Font.Gotham
					ItemText.Text = toadd
					ItemText.TextColor3 = Color3.fromRGB(255, 255, 255)
					ItemText.TextSize = 13.000
					ItemText.TextXAlignment = Enum.TextXAlignment.Left

					Item.MouseButton1Click:Connect(function()
						DropdownBtnText.Text = text .. " - " .. toadd
						toggledrop()
						pcall(callback, toadd)
					end)
				else 
					for i,v in next, toadd do
						local Item = Instance.new("TextButton")
						local ItemCorner = Instance.new("UICorner")
						local ItemText = Instance.new("TextLabel")

						Item.Name = "Item"
						Item.Parent = DropdownItemHolder
						Item.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
						Item.Size = UDim2.new(1, 0, 0, 20)
						Item.Font = Enum.Font.SourceSans
						Item.Text = ""
						Item.TextColor3 = Color3.fromRGB(0, 0, 0)
						Item.TextSize = 14.000
						Item.AutoButtonColor = false

						ItemCorner.CornerRadius = UDim.new(0, 4)
						ItemCorner.Name = "ItemCorner"
						ItemCorner.Parent = Item

						ItemText.Name = "ItemText"
						ItemText.Parent = Item
						ItemText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						ItemText.BackgroundTransparency = 1.000
						ItemText.Position = UDim2.new(0, 5, 0, 0)
						ItemText.Size = UDim2.new(0, 1, 1, 0)
						ItemText.Font = Enum.Font.Gotham
						ItemText.Text = v
						ItemText.TextColor3 = Color3.fromRGB(255, 255, 255)
						ItemText.TextSize = 13.000
						ItemText.TextXAlignment = Enum.TextXAlignment.Left

						Item.MouseButton1Click:Connect(function()
							DropdownBtnText.Text = text .. " - " .. v
							toggledrop()
							pcall(callback, v)
						end)
					end
				end
			end
			
			function dropfunc:Remove(toremove)
				if typeof(toremove) == "string" then
					for i,v in next, DropdownItemHolder:GetChildren() do
						if v.Name == "Item" and v.Text == toremove then
							v:Destroy()
						end
					end
				else 
					for a,b in next, DropdownItemHolder:GetChildren() do
						for i,v in next, toremove do
							if b.Name == "Item" and b.Text == v then
								b:Destroy()
							end
						end
					end
				end
			end
			ContainerFrame.CanvasSize = UDim2.new(0, 0, 0, ContainerFrameLayout.AbsoluteContentSize.Y)
			return dropfunc
		end
		function containerhold:Colorpicker(text,preset,callback)
			local cptoggled = false
			local OldToggleColor = Color3.fromRGB(0, 0, 0)
			local OldColor = Color3.fromRGB(0, 0, 0)
			local OldColorSelectionPosition = nil
			local OldHueSelectionPosition = nil
			local ColorH, ColorS, ColorV = 1, 1, 1
			local RainbowColorPicker = false
			local ColorPickerInput = nil
			local ColorInput = nil
			local HueInput = nil
			
			local Colorpicker = Instance.new("Frame")
			local ColorpickerBtn = Instance.new("TextButton")
			local ColorpickerBtnCorner = Instance.new("UICorner")
			local BoxColor = Instance.new("Frame")
			local BoxColorCorner = Instance.new("UICorner")
			local ColorpickerBtnText = Instance.new("TextLabel")
			local DropdownBtnIcoFrameCorner = Instance.new("UICorner")
			local Color = Instance.new("ImageLabel")
			local ColorCorner = Instance.new("UICorner")
			local ColorSelection = Instance.new("ImageLabel")
			local Hue = Instance.new("ImageLabel")
			local HueCorner = Instance.new("UICorner")
			local HueGradient = Instance.new("UIGradient")
			local HueSelection = Instance.new("ImageLabel")

			Colorpicker.Name = "Colorpicker"
			Colorpicker.Parent = ContainerFrame
			Colorpicker.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
			Colorpicker.ClipsDescendants = true
			Colorpicker.Position = UDim2.new(0, 0, 0.638132274, 0)
			Colorpicker.Size = UDim2.new(1, 0, 0, 32)

			ColorpickerBtn.Name = "ColorpickerBtn"
			ColorpickerBtn.Parent = Colorpicker
			ColorpickerBtn.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
			ColorpickerBtn.BackgroundTransparency = 1.000
			ColorpickerBtn.Size = UDim2.new(1, 0, 0, 32)
			ColorpickerBtn.Font = Enum.Font.SourceSans
			ColorpickerBtn.Text = ""
			ColorpickerBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
			ColorpickerBtn.TextSize = 14.000

			ColorpickerBtnCorner.CornerRadius = UDim.new(0, 4)
			ColorpickerBtnCorner.Name = "ColorpickerBtnCorner"
			ColorpickerBtnCorner.Parent = ColorpickerBtn

			BoxColor.Name = "BoxColor"
			BoxColor.Parent = ColorpickerBtn
			BoxColor.AnchorPoint = Vector2.new(1, 0.5)
			BoxColor.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
			BoxColor.Position = UDim2.new(1, -8, 0.5, 0)
			BoxColor.Size = UDim2.new(0, 51, 0, 21)

			BoxColorCorner.CornerRadius = UDim.new(0, 4)
			BoxColorCorner.Name = "BoxColorCorner"
			BoxColorCorner.Parent = BoxColor

			ColorpickerBtnText.Name = "ColorpickerBtnText"
			ColorpickerBtnText.Parent = ColorpickerBtn
			ColorpickerBtnText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ColorpickerBtnText.BackgroundTransparency = 1.000
			ColorpickerBtnText.Position = UDim2.new(0, 10, 0, 0)
			ColorpickerBtnText.Size = UDim2.new(0, 1, 0, 32)
			ColorpickerBtnText.Font = Enum.Font.Gotham
			ColorpickerBtnText.Text = text
			ColorpickerBtnText.TextColor3 = Color3.fromRGB(255, 255, 255)
			ColorpickerBtnText.TextSize = 14.000
			ColorpickerBtnText.TextXAlignment = Enum.TextXAlignment.Left

			DropdownBtnIcoFrameCorner.CornerRadius = UDim.new(0, 4)
			DropdownBtnIcoFrameCorner.Name = "DropdownBtnIcoFrameCorner"
			DropdownBtnIcoFrameCorner.Parent = Colorpicker

			Color.Name = "Color"
			Color.Parent = Colorpicker
			Color.AnchorPoint = Vector2.new(0.5, 0)
			Color.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
			Color.Position = UDim2.new(0.5, -27, 0, 33)
			Color.Size = UDim2.new(0, 246, 0, 80)
			Color.ZIndex = 10
			Color.Image = "rbxassetid://4155801252"

			ColorCorner.CornerRadius = UDim.new(0, 3)
			ColorCorner.Name = "ColorCorner"
			ColorCorner.Parent = Color

			ColorSelection.Name = "ColorSelection"
			ColorSelection.Parent = Color
			ColorSelection.AnchorPoint = Vector2.new(0.5, 0.5)
			ColorSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ColorSelection.BackgroundTransparency = 1.000
			ColorSelection.Position = UDim2.new(preset and select(3, Color3.toHSV(preset)))
			ColorSelection.Size = UDim2.new(0, 18, 0, 18)
			ColorSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
			ColorSelection.ScaleType = Enum.ScaleType.Fit
			ColorSelection.Visible = false

			Hue.Name = "Hue"
			Hue.Parent = Colorpicker
			Hue.AnchorPoint = Vector2.new(0.5, 0)
			Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Hue.Position = UDim2.new(0.5, 117, 0, 33)
			Hue.Size = UDim2.new(0, 25, 0, 80)

			HueCorner.CornerRadius = UDim.new(0, 3)
			HueCorner.Name = "HueCorner"
			HueCorner.Parent = Hue

			HueGradient.Color = ColorSequence.new {
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
				ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)),
				ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)),
				ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)),
				ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)),
				ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))
			}
			HueGradient.Rotation = 270
			HueGradient.Name = "HueGradient"
			HueGradient.Parent = Hue

			HueSelection.Name = "HueSelection"
			HueSelection.Parent = Hue
			HueSelection.AnchorPoint = Vector2.new(0.5, 0.5)
			HueSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			HueSelection.BackgroundTransparency = 1.000
			HueSelection.Position = UDim2.new(0.48, 0, 1 - select(1, Color3.toHSV(preset)))
			HueSelection.Size = UDim2.new(0, 18, 0, 18)
			HueSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
			HueSelection.Visible = false
			
			local function UpdateColorPicker(nope)
				BoxColor.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
				Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)

				pcall(callback, BoxColor.BackgroundColor3)
			end

			ColorH =
				1 -
				(math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
					Hue.AbsoluteSize.Y)
			ColorS =
				(math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
					Color.AbsoluteSize.X)
			ColorV =
				1 -
				(math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
					Color.AbsoluteSize.Y)

			BoxColor.BackgroundColor3 = preset
			Color.BackgroundColor3 = preset
			pcall(callback, BoxColor.BackgroundColor3)

			Color.InputBegan:Connect(
				function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then


						if ColorInput then
							ColorInput:Disconnect()
						end

						ColorInput =
							RunService.RenderStepped:Connect(
								function()
								local ColorX =
									(math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
										Color.AbsoluteSize.X)
								local ColorY =
									(math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
										Color.AbsoluteSize.Y)

								ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
								ColorS = ColorX
								ColorV = 1 - ColorY

								UpdateColorPicker(true)
							end
							)
					end
				end
			)

			Color.InputEnded:Connect(
				function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if ColorInput then
							ColorInput:Disconnect()
						end
					end
				end
			)

			Hue.InputBegan:Connect(
				function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then


						if HueInput then
							HueInput:Disconnect()
						end

						HueInput =
							RunService.RenderStepped:Connect(
								function()
								local HueY =
									(math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
										Hue.AbsoluteSize.Y)

								HueSelection.Position = UDim2.new(0.48, 0, HueY, 0)
								ColorH = 1 - HueY

								UpdateColorPicker(true)
							end
							)
					end
				end
			)

			Hue.InputEnded:Connect(
				function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if HueInput then
							HueInput:Disconnect()
						end
					end
				end
			)
			
			ColorpickerBtn.MouseButton1Click:Connect(function()
				cptoggled = not cptoggled
				Colorpicker:TweenSize(cptoggled and UDim2.new(1, 0, 0, 122) or UDim2.new(1, 0, 0, 32), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .1, true)
				HueSelection.Visible = cptoggled
				ColorSelection.Visible = cptoggled
				wait(.1)
				ContainerFrame.CanvasSize = UDim2.new(0, 0, 0, ContainerFrameLayout.AbsoluteContentSize.Y)
			end)
			ContainerFrame.CanvasSize = UDim2.new(0, 0, 0, ContainerFrameLayout.AbsoluteContentSize.Y)
		end
		function containerhold:Textbox(text, numonly,disapper, callback)
			local Textbox = Instance.new("Frame")
			local TextboxCorner = Instance.new("UICorner")
			local TextboxText = Instance.new("TextLabel")
			local TextBox = Instance.new("TextBox")
			local TextBoxCorner = Instance.new("UICorner")

			Textbox.Name = "Textbox"
			Textbox.Parent = ContainerFrame
			Textbox.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
			Textbox.ClipsDescendants = true
			Textbox.Position = UDim2.new(0, 0, 0.490272373, 0)
			Textbox.Size = UDim2.new(1, 0, 0, 32)

			TextboxCorner.CornerRadius = UDim.new(0, 4)
			TextboxCorner.Name = "TextboxCorner"
			TextboxCorner.Parent = Textbox

			TextboxText.Name = "TextboxText"
			TextboxText.Parent = Textbox
			TextboxText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextboxText.BackgroundTransparency = 1.000
			TextboxText.Position = UDim2.new(0, 10, 0, 0)
			TextboxText.Size = UDim2.new(0, 1, 0, 32)
			TextboxText.Font = Enum.Font.Gotham
			TextboxText.Text = text
			TextboxText.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextboxText.TextSize = 14.000
			TextboxText.TextXAlignment = Enum.TextXAlignment.Left

			TextBox.Parent = Textbox
			TextBox.AnchorPoint = Vector2.new(1, 0.5)
			TextBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
			TextBox.Position = UDim2.new(1, -4, 0.5, 0)
			TextBox.Size = UDim2.new(0, 121, 0, 24)
			TextBox.Font = Enum.Font.Gotham
			TextBox.PlaceholderText = "      "
			TextBox.Text = ""
			TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextBox.TextSize = 14.000

			TextBoxCorner.CornerRadius = UDim.new(0, 4)
			TextBoxCorner.Name = "TextBoxCorner"
			TextBoxCorner.Parent = TextBox
			
			TextBox.Changed:Connect(function(ep)
				if ep then
					TextBox:TweenSize(UDim2.new(0, TextBox.TextBounds.X + 18, 0, 24), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
				end
			end)

			TextBox.FocusLost:Connect(function(ep)
				if ep then
					if #TextBox.Text > 0 then
					    pcall(callback, TextBox.Text)
						if disapper then
							TextBox.Text = ""
						end
					end
				end
			end)

			TextBox:GetPropertyChangedSignal("Text"):Connect(function()
				if numonly == true then
					TextBox.Text = TextBox.Text:gsub("%D+", "")
				end
			end)
			
			ContainerFrame.CanvasSize = UDim2.new(0, 0, 0, ContainerFrameLayout.AbsoluteContentSize.Y)
		end
		function containerhold:Label(text)
			local Label = Instance.new("Frame")
			local LabelCorner = Instance.new("UICorner")
			local LabelText = Instance.new("TextLabel")

			Label.Name = "Label"
			Label.Parent = ContainerFrame
			Label.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
			Label.ClipsDescendants = true
			Label.Position = UDim2.new(0, 0, 0.490272373, 0)
			Label.Size = UDim2.new(1, 0, 0, 32)

			LabelCorner.CornerRadius = UDim.new(0, 4)
			LabelCorner.Name = "LabelCorner"
			LabelCorner.Parent = Label

			LabelText.Name = "LabelText"
			LabelText.Parent = Label
			LabelText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			LabelText.BackgroundTransparency = 1.000
			LabelText.Position = UDim2.new(0, 10, 0, 0)
			LabelText.Size = UDim2.new(0, 1, 0, 32)
			LabelText.Font = Enum.Font.Gotham
			LabelText.Text = text
			LabelText.TextColor3 = Color3.fromRGB(255, 255, 255)
			LabelText.TextSize = 14.000
			LabelText.TextXAlignment = Enum.TextXAlignment.Left
			
			ContainerFrame.CanvasSize = UDim2.new(0, 0, 0, ContainerFrameLayout.AbsoluteContentSize.Y)
		end
		return containerhold
	end
	return tabhold
end

return lib