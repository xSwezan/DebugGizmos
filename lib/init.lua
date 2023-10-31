local PubTypes = require(script.PubTypes)
local Gizmos = script.Gizmos

local DebugGizmos: PubTypes.lib = {
	Line = require(Gizmos.Line);
	Cone = require(Gizmos.Cone);
	Sphere = require(Gizmos.Sphere);
	Text = require(Gizmos.Text);
	Box = require(Gizmos.Box);
}

return DebugGizmos :: PubTypes.lib