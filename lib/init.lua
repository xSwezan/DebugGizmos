local PubTypes = require(script.PubTypes)
local Gizmos = script.Gizmos

local DebugGizmos: PubTypes.lib = {
	Line = require(Gizmos.Line);
	Cone = require(Gizmos.Cone);
	Sphere = require(Gizmos.Sphere);
}

return DebugGizmos :: PubTypes.lib