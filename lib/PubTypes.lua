local ProximityPromptService = game:GetService("ProximityPromptService")
local Types = {}

export type lib = {
	Line: (Props: LineProps) -> LineGizmo;
	Cone: (Props: ConeProps) -> ConeGizmo;
	Sphere: (Props: SphereProps) -> SphereGizmo;
}

export type Gizmo<Class,Props> = Class & {
	Props: DefaultProps & Props;
	Apply: (self: Gizmo<Class,Props>, Props: DefaultProps & Props) -> nil;
}

-- Props

export type DefaultProps = {
	Color: Color3?;
	Transparency: number?;
}

-- Gizmos

export type LineProps = {
	From: Vector3?;
	To: Vector3?;

	Radius: number?;
}
export type LineGizmo = Gizmo<{},LineProps>

export type ConeProps = {
	From: Vector3?;
	To: Vector3?;

	Radius: number?;
}
export type ConeGizmo = Gizmo<{},ConeProps>

export type SphereProps = {
	Position: Vector3?;
	
	Radius: number?;
}
export type SphereGizmo = Gizmo<{},SphereProps>

return Types