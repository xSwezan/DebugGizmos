local Janitor = require(script.Parent.Parent.Janitor)
local GetVisible = require(script.Parent.Util.GetVisible)
local GizmoClass = {}
GizmoClass.__index = GizmoClass

function GizmoClass.new(DefaultProps: table?)
	local self = setmetatable({
		Props = DefaultProps or {};
	},GizmoClass)

	if (workspace:GetAttribute("DebugGizmosEnabled") == nil) then
		workspace:SetAttribute("DebugGizmosEnabled", true)
	end

	self.Janitor = Janitor.new()
	
	self.Janitor:Add(workspace:GetAttributeChangedSignal("DebugGizmosEnabled"):Connect(function()
		self:__render(GetVisible())
	end),"Disconnect")

	return self
end

function GizmoClass:Apply<T>(Props: T)
	assert(type(Props) == "table", "Expected Props to be a table!")

	for k, v in Props do
		self.Props[k] = v
	end

	if (typeof(self.__render) == "function") then
		self:__render(GetVisible())
	end
end

function GizmoClass:Destroy()
	self.Janitor:Destroy()
end

return GizmoClass