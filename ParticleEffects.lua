local p = Workspace.Center;
local bf = p:WaitForChild("BodyPosition");
local moving = true;
local mr = math.random;
local startingpoint = p.Position;
local cr = coroutine.resume;
local cc = coroutine.create;
cr(cc(function()
  wait(10)
	moving = nil;
end))
local parts = {};
for i = 1, 50 do wait(0) 
	local newpart = p:Clone()
	newpart.Position = startingpoint
	newpart.Anchored = false;
	newpart.Parent = Workspace;
	newpart.Name = 'NewPart'
	bf:Clone().Parent = newpart;
	pcall(function() newpart.NewPart:Destroy() end)
	parts[#parts+1] = newpart;
end
while(moving) do 
	for _,v in pairs(parts) do
		local bf = v.BodyPosition;
		bf.position = startingpoint
		+
		Vector3.new(mr(-15,15),mr(-15,15),mr(-15,15));
	end
	wait(5)
end
wait(3)
for _,v in pairs(parts) do wait(.1) v:Destroy() end
