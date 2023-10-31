local Terrain = workspace:WaitForChild("Terrain")

local Gizmos = require(script.Parent)
local PubTypes = require(script.Parent.Parent.PubTypes)
local GetOutput = require(script.Parent.Parent.Util.GetOutput)
local GetVisible = require(script.Parent.Parent.Util.GetVisible)
local FloatingGizmo = require(script.Parent.FloatingGizmo)

return function(Props: {}): PubTypes.TextGizmo
	local self: PubTypes.TextGizmo = Gizmos.new{
		Position = Vector3.new();
		Offset = Vector3.new();
		Adornee = nil;
		
		MaxDistance = 100;

		Text = "Text";
		Color = Color3.fromRGB(255,255,255);
		Size = 30;

		Visible = true;
	}

	self:Apply(Props)

	local FloatingGizmo: BillboardGui = FloatingGizmo()
	FloatingGizmo.Name = "Text"
	FloatingGizmo.MaxDistance = Props.MaxDistance

	local Label: TextLabel = Instance.new("TextLabel")
	Label.Name = "TextLabel"
	Label.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
	Label.Text = Props.Text
	Label.TextColor3 = Props.Color
	Label.TextSize = Props.Size
	Label.RichText = true
	Label.AnchorPoint = Vector2.new(.5,.5)
	Label.AutomaticSize = Enum.AutomaticSize.XY
	Label.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Label.BackgroundTransparency = 1
	Label.BorderColor3 = Color3.fromRGB(0,0,0)
	Label.BorderSizePixel = 0
	Label.Position = UDim2.fromScale(.5,.5)
	Label.Parent = FloatingGizmo

	self.Janitor:Add(FloatingGizmo,"Destroy")
	self.Janitor:LinkToInstance(Label)
	
	function self:__render(Visible: boolean)
		FloatingGizmo.MaxDistance = self.Props.MaxDistance
		FloatingGizmo.StudsOffsetWorldSpace = self.Props.Position
		FloatingGizmo.StudsOffset = self.Props.Offset

		FloatingGizmo.Adornee = self.Props.Adornee

		Label.Text = self.Props.Text
		Label.TextColor3 = self.Props.Color
		Label.TextSize = self.Props.Size

		FloatingGizmo.Enabled = (Visible == true) and (self.Props.Visible)
		FloatingGizmo.Parent = GetOutput()
	end

	self:__render(GetVisible())

	return self
end