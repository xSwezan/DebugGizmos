local Types = {}

export type lib = {
	Line: (Props: LineProps) -> LineGizmo;
	Cone: (Props: ConeProps) -> ConeGizmo;
	Sphere: (Props: SphereProps) -> SphereGizmo;
	Text: (Props: TextProps) -> TextGizmo;
	Box: (Props: BoxProps) -> BoxGizmo;
}

export type Gizmo<Class,Props> = Class & {
	Props: DefaultProps & Props;
	Apply: (self: Gizmo<Class,Props>, Props: DefaultProps & Props) -> nil;
}

-- Props

export type DefaultProps = {
	Color: Color3?;
	Transparency: number?;

	Adornee: Instance?;
	Visible: boolean?;
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

export type TextProps = {
	Position: Vector3?;
	Offset: Vector3?;

	MaxDistance: number?;
	
	Text: string?;
	Size: number?;
}
export type TextGizmo = Gizmo<{},TextProps>

export type BoxProps = {
	CFrame: CFrame?;
	Size: Vector3?;
}
export type BoxGizmo = Gizmo<{},BoxProps>

return Types