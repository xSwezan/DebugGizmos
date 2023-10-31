return function(): BillboardGui
	local floatingGizmo = Instance.new("BillboardGui")
	floatingGizmo.Name = "FloatingGizmo"
	floatingGizmo.Active = true
	floatingGizmo.AlwaysOnTop = true
	floatingGizmo.LightInfluence = 1
	floatingGizmo.Size = UDim2.fromScale(1,1)
	floatingGizmo.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	return floatingGizmo
end