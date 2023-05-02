local Terrain = workspace:WaitForChild("Terrain")

local Gizmos = require(script.Parent)
local PubTypes = require(script.Parent.Parent.PubTypes)
local GetOutput = require(script.Parent.Parent.Util.GetOutput)
local GetVisible = require(script.Parent.Parent.Util.GetVisible)

return function(Props: {}): PubTypes.LineGizmo
	local self: PubTypes.LineGizmo = Gizmos.new{
		From = Vector3.new();
		To = Vector3.new();

		Radius = .1;

		Color = Color3.fromRGB();
		Transparency = .25;
	}

	self:Apply(Props)

	local Adornment: CylinderHandleAdornment = Instance.new("CylinderHandleAdornment")
	Adornment.Name = "Line"

	self.Janitor:Add(Adornment,"Destroy")
	self.Janitor:LinkToInstance(Adornment)
	
	function self:__render(Visible: boolean)
		Adornment.Color3 = self.Props.Color
		Adornment.Transparency = self.Props.Transparency

		Adornment.Radius = self.Props.Radius
		Adornment.Height = (self.Props.From - self.Props.To).Magnitude

		Adornment.CFrame = CFrame.lookAt(self.Props.From:Lerp(self.Props.To, .5), self.Props.To)

		Adornment.Visible = (Visible == true)

		Adornment.Adornee = Terrain
		Adornment.Parent = GetOutput()
	end

	self:__render(GetVisible())

	return self
end