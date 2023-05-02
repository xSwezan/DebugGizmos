local Terrain = workspace:WaitForChild("Terrain")

return function()
	local Output: Folder = Terrain:FindFirstChild("DebugGizmos") or Instance.new("Folder")
	Output.Name = "DebugGizmos"
	Output.Parent = Terrain

	return Output
end