local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local DebugGizmos = require(ReplicatedStorage.lib)

local RayLine = DebugGizmos.Line{}
local RayLine2 = DebugGizmos.Line{}
local RayLine3 = DebugGizmos.Line{}

local LastPoint1
local LastPoint2
local LastPoint3

task.wait(3)

local AllTime = 0
local DidLoop = false

local StartCos
local StartCosTimestamp

RunService.RenderStepped:Connect(function(DT: number)
	if (StartCos) then
		if (StartCos <= (math.cos(tick()) + .01)) and (StartCos >= (math.cos(tick()) - .01)) and not (DidLoop) and (StartCosTimestamp) and (tick() - StartCosTimestamp > 1) then
			DidLoop = true
		end
	else
		StartCos = math.cos(tick())
		StartCosTimestamp = tick()
	end

	AllTime += DT

	RayLine:Apply{
		To = Vector3.new(0,math.cos(tick()) * 3,math.sin(tick()) * 4);
	}
	RayLine2:Apply{
		From = Vector3.new(0,math.cos(tick()) * 3,math.sin(tick()) * 4);
		To = Vector3.new(0,math.cos(tick()) * 3,math.sin(tick()) * 4) + Vector3.new(0,math.cos(-tick()) * 5,math.sin(-tick()) * 5);
	}
	RayLine3:Apply{
		From = Vector3.new(0,math.cos(tick()) * 3,math.sin(tick()) * 4) + Vector3.new(0,math.cos(-tick()) * 5,math.sin(-tick()) * 5);
		To = Vector3.new(0,math.cos(tick()) * 3,math.sin(tick()) * 4) + Vector3.new(0,math.cos(-tick()) * 5,math.sin(-tick()) * 5) + Vector3.new(0,math.cos(tick()) * 8,math.sin(tick()) * 7);
	}

	if (LastPoint1) and (math.floor(AllTime * 4) % 2 == 0) and not (DidLoop) then
		DebugGizmos.Line{
			From = LastPoint1;
			To = Vector3.new(0,math.cos(tick()) * 3,math.sin(tick()) * 4) + Vector3.new(0,math.cos(-tick()) * 5,math.sin(-tick()) * 5);
			
			Color = Color3.fromRGB(0,255,0);
		}
	end
	if (LastPoint2) and (math.floor(AllTime * 4) % 2 == 0) and not (DidLoop) then
		DebugGizmos.Line{
			From = LastPoint2;
			To = Vector3.new(0,math.cos(tick()) * 3,math.sin(tick()) * 4);
			
			Color = Color3.fromRGB(0,0,255);
		}
	end
	if (LastPoint3) and (math.floor(AllTime * 4) % 2 == 0) and not (DidLoop) then
		DebugGizmos.Line{
			From = LastPoint3;
			To = Vector3.new(0,math.cos(tick()) * 3,math.sin(tick()) * 4) + Vector3.new(0,math.cos(-tick()) * 5,math.sin(-tick()) * 5) + Vector3.new(0,math.cos(tick()) * 8,math.sin(tick()) * 7);
			
			Color = Color3.fromRGB(255,0,0);
		}
	end

	LastPoint1 = Vector3.new(0,math.cos(tick()) * 3,math.sin(tick()) * 4) + Vector3.new(0,math.cos(-tick()) * 5,math.sin(-tick()) * 5)
	LastPoint2 = Vector3.new(0,math.cos(tick()) * 3,math.sin(tick()) * 4)
	LastPoint3 = Vector3.new(0,math.cos(tick()) * 3,math.sin(tick()) * 4) + Vector3.new(0,math.cos(-tick()) * 5,math.sin(-tick()) * 5) + Vector3.new(0,math.cos(tick()) * 8,math.sin(tick()) * 7)
end)