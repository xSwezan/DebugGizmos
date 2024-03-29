local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local DebugGizmos = require(ReplicatedStorage.lib)

local RayLine = DebugGizmos.Line{}
local RayLine2 = DebugGizmos.Line{}
local RayLine3 = DebugGizmos.Line{}

local TextGizmoPart = workspace:WaitForChild("TextGizmo")

local TextGizmo = DebugGizmos.Text{
	Adornee = TextGizmoPart;

	Text = tostring(TextGizmoPart.Position);
	Size = 30;
	Color = Color3.fromRGB(0,255,0);
}

local BoxCF = CFrame.new()
local Box = DebugGizmos.Box{
	Adornee = TextGizmoPart;
	CFrame = BoxCF;
	Size = Vector3.new(1,1,1);
}

local LastPoint1
local LastPoint2
local LastPoint3

task.wait(3)

local AllTime = 0
local DidLoop = false

RunService.RenderStepped:Connect(function(DT: number)
	AllTime += DT

	BoxCF *= CFrame.Angles(math.rad(DT * math.random(90)), math.rad(DT * math.random(90)), math.rad(DT * math.random(90)))
	Box:Apply{
		CFrame = BoxCF;
	}
	TextGizmo:Apply{
		Text = tostring(TextGizmoPart.Position);
		Visible = (math.floor(AllTime) % 2 == 1);
	}

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

	DebugGizmos.Line{
		From = LastPoint1;
		To = Vector3.new(0,math.cos(tick()) * 3,math.sin(tick()) * 4) + Vector3.new(0,math.cos(-tick()) * 5,math.sin(-tick()) * 5);
		
		Color = Color3.fromRGB(0,255,0);
	}
	DebugGizmos.Line{
		From = LastPoint2;
		To = Vector3.new(0,math.cos(tick()) * 3,math.sin(tick()) * 4);
		
		Color = Color3.fromRGB(0,0,255);
	}
	DebugGizmos.Line{
		From = LastPoint3;
		To = Vector3.new(0,math.cos(tick()) * 3,math.sin(tick()) * 4) + Vector3.new(0,math.cos(-tick()) * 5,math.sin(-tick()) * 5) + Vector3.new(0,math.cos(tick()) * 8,math.sin(tick()) * 7);
		
		Color = Color3.fromRGB(255,0,0);
	}

	LastPoint1 = Vector3.new(0,math.cos(tick()) * 3,math.sin(tick()) * 4) + Vector3.new(0,math.cos(-tick()) * 5,math.sin(-tick()) * 5)
	LastPoint2 = Vector3.new(0,math.cos(tick()) * 3,math.sin(tick()) * 4)
	LastPoint3 = Vector3.new(0,math.cos(tick()) * 3,math.sin(tick()) * 4) + Vector3.new(0,math.cos(-tick()) * 5,math.sin(-tick()) * 5) + Vector3.new(0,math.cos(tick()) * 8,math.sin(tick()) * 7)
end)