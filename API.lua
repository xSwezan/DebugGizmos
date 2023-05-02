local RunService = game:GetService("RunService")
local DebugGizmos = require(path.to.module)

local RayLine = DebugGizmos.Line{}
RayLine:Apply{
	From = Vector3.new(0,0,0);
	To = Vector3.new(0,4,4);

	Color = Color3.fromRGB(0,255,0);
}

RunService.RenderStepped:Connect(function(deltaTime)
	RayLine:Apply{
		To = Vector3.new(0,math.cos(tick()),math.sin(tick()));
	}
end)