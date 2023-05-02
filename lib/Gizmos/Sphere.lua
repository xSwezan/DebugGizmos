local Terrain = workspace:WaitForChild("Terrain")

local Gizmos = require(script.Parent)
local PubTypes = require(script.Parent.Parent.PubTypes)
local GetOutput = require(script.Parent.Parent.Util.GetOutput)
local GetVisible = require(script.Parent.Parent.Util.GetVisible)

return function(Props: {}): PubTypes.SphereGizmo
	local self: PubTypes.SphereGizmo = Gizmos.new{
		Position = Vector3.new();
		
		Radius = 1;

		Color = Color3.fromRGB();
		Transparency = .25;
	}

	self:Apply(Props)

	local Adornment: SphereHandleAdornment = Instance.new("SphereHandleAdornment")
	Adornment.Name = "Sphere"

	self.Janitor:Add(Adornment,"Destroy")
	self.Janitor:LinkToInstance(Adornment)
	
	function self:__render(Visible: boolean)
		Adornment.Color3 = self.Props.Color
		Adornment.Transparency = self.Props.Transparency

		Adornment.Radius = self.Props.Radius

		Adornment.CFrame = CFrame.new(self.Props.Position)

		Adornment.Visible = (Visible == true)

		Adornment.Adornee = Terrain
		Adornment.Parent = GetOutput()
	end

	self:__render(GetVisible())

	return self
end