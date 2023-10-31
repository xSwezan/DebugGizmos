local Terrain = workspace:WaitForChild("Terrain")

local Gizmos = require(script.Parent)
local PubTypes = require(script.Parent.Parent.PubTypes)
local GetOutput = require(script.Parent.Parent.Util.GetOutput)
local GetVisible = require(script.Parent.Parent.Util.GetVisible)

return function(Props: {}): PubTypes.BoxGizmo
	local self: PubTypes.BoxGizmo = Gizmos.new{
		CFrame = CFrame.new();
		Size = Vector3.new();
		
		Color = Color3.fromRGB();
		Transparency = .25;
		
		Adornee = nil;
		Visible = true;
	}

	self:Apply(Props)

	local Adornment: BoxHandleAdornment = Instance.new("BoxHandleAdornment")
	Adornment.Name = "Box"

	self.Janitor:Add(Adornment,"Destroy")
	self.Janitor:LinkToInstance(Adornment)
	
	function self:__render(Visible: boolean)
		Adornment.CFrame = self.Props.CFrame
		Adornment.Size = self.Props.Size

		Adornment.Color3 = self.Props.Color
		Adornment.Transparency = self.Props.Transparency

		Adornment.Visible = (Visible == true) and (self.Props.Visible)

		Adornment.Adornee = self.Props.Adornee or Terrain
		Adornment.Parent = GetOutput()
	end

	self:__render(GetVisible())

	return self
end