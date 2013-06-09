wait(1)--UDim2 variables

local UDim2_new = UDim2.new;
local OriginalTween = UDim2_new(0,0,0,0)
local NegativeTween = UDim2_new(-1.5,0,0,0);

--Mathematical Variables

local math_random = math.random;
local math_abs = math.abs;
local math_rad = math.rad;
local math_cos = math.cos;
local math_sin = math.sin;

-- Coroutines
local coroutine_resume = coroutine.resume;
local coroutine_create = coroutine.create;

--Table Manipulation

local table_insert = table.insert;

--Instancing

local Instance_new = Instance.new;

--Vector3 Variables

local Vector3_new = Vector3.new;

--Mathematical Variables

local math_min = math.min;

--CFrame Variables

local CFrame_new = CFrame.new;

--Rays

local Ray_new = Ray.new;


-- Bools


local frozen = false;





--Color

local Color3_new = Color3.new;
------------------------------------------------Client Variables

-------------------------------------- NULL Variables


local Player = game.Players.LocalPlayer;
local mouse = Player:GetMouse();
local gui = script.Parent;
local cam = Workspace.CurrentCamera;
local char = Player.Character
wait(1)
local human,torso,head = char:WaitForChild("Humanoid"),char:WaitForChild("Torso"),char:WaitForChild("Head");










----------------------------------------------- String Variables



local pat = "(.-)%s"
local FootStep = 'Terrain_Grass'
local soundbase = {
['Terrain_Grass'] = 'http://www.roblox.com/asset/?id=17385522',
['Terrain_Wood'] = 'http://www.roblox.com/asset/?id=12814239',
['Terrain_Tile'] = 'http://www.roblox.com/asset/?id=25641879',
['Terrain_Wind'] = '',
['Terrain_Carpet'] = 'http://www.roblox.com/asset/?id=16720281',
['Terrain_Metal'] = 'http://www.roblox.com/asset/?id=11450310'
}
local pitchbase = {
['Terrain_Wood'] = {.4,.45,.5,.55,.6,.65},
['Terrain_Grass'] = {2,2.25,2.5,2.55,2.6,2.65},
['Terrain_Tile'] = {0.45,0.5,0.55,0.6,0.66,0.7,0.75},
['Terrain_Carpet'] = {2,2.1,2.2,2.3,2.4,2.5},
['Terrain_Metal'] = {2,2.01,2.02,2.03,2.04,2.05}
}
local volumebase = {
['Terrain_Grass'] = .2,
['Terrain_Wood'] = .1,
['Terrain_Tile'] = .05,
['Terrain_Wind'] = .3,
['Terrain_Carpet'] = .3,
['Terrain_Metal'] = 1
}
local volumebaseorig = volumebase;
local volumebasesprint = 
{
['Terrain_Grass'] = .5,
['Terrain_Wood'] = .3,
['Terrain_Tile'] = .5,
['Terrain_Wind'] = .5,
['Terrain_Carpet'] = .5,
['Terrain_Metal'] = 1
}
local freqnote = [=[

Cricket frequency:
18.5
  
DarkForest frequency:

51.5


ogre frequency:

8


choir frequency:

90.5

tuba frequency: 


20.5



flute frequency:


16.5

]=]
local FrequencyBase = {
["cricket"] ={[0.3] = 18,[0.35] = 15.5,[0.4] = 14.5};	
}
local SoundDatabase = {
["cricket"] = 'http://www.roblox.com/Asset?ID=86300687        .3-.35-.4-.45-.5-.55-.',
["darkforest"] = 'http://www.roblox.com/Asset?ID=86300687     .1-.',
["ogre"] = 'rbxasset://sounds/uuhhh.wav                       .15-.2-.25-.3-.',
["choir"] = 'http://www.roblox.com/asset/?id=1372258          .7-.-.75-.8',
["fightmusic"] = 'http://www.roblox.com/asset?id=58479849    .7-.',
["thememusic"] = 'http://www.roblox.com/asset/?id=5985787    1-.',
["tuba"] = 'http://www.roblox.com/asset/?id=47697530         1-.',
["flute"] = 'http://www.roblox.com/asset/?id=52155103        .6-.65-.7-.75-.8-.',
["crowd1"] = 'http://www.roblox.com/asset/?id=15632562       .65-.7-.75-.8-.',
["crowd2"] = 'http://www.roblox.com/asset/?id=15632569       .65-.7-.75-.8-.',
["crowd3"] = 'http://www.roblox.com/asset/?id=15632575       .65-.7-.75-.8-.',
["crowd4"] = 'http://www.roblox.com/asset/?id=15632575       .65-.7-.75-.8-.',
["crow"] = 'http://www.roblox.com/asset/?id=64488575         .9-.95-1-.'
}
local ids = {
'http://www.roblox.com/Asset?ID=86300687',
'http://www.roblox.com/Asset?ID=86300687',
'rbxasset://sounds/uuhhh.wav',
'http://www.roblox.com/asset/?id=1372258',
'http://www.roblox.com/asset?id=58479849',
'http://www.roblox.com/asset/?id=5985787',
'http://www.roblox.com/asset/?id=47697530',
'http://www.roblox.com/asset/?id=52155103',
'http://www.roblox.com/asset/?id=15632562',
'http://www.roblox.com/asset/?id=15632569',
'http://www.roblox.com/asset/?id=15632575',
'http://www.roblox.com/asset/?id=15632575',
'http://www.roblox.com/asset/?id=17385522',
'http://www.roblox.com/asset/?id=12814239',
'http://www.roblox.com/asset/?id=25641879',
'http://www.roblox.com/asset/?id=16720281',
'http://www.roblox.com/asset/?id=11450310'
}


------------------------------------------------ NULL Variables






local Scanner = nil;
local touching = nil;
local PreparedSound = nil;














------------------------------------------------ Integer variables





local pitch = .7;
local vol = .3;
local O_S_R = .45;
local I_S_R = .25;
local O_W_S = '7';
local I_W_S = '18';
local Speed_Render = O_S_R;
local laststep = 0;
local maxchance = 5;



----------------------------------------------- Instancing variables










local Sound = Instance_new('Sound',gui);
Sound.Volume = .3;
Sound.Name = Player.Name..' Sound Animation';
local Last_Part = Workspace:WaitForChild("Terrain_Grass");















--------------------------------------------------MAIN FUNCTIONS 







-- UI related functions






local scrgui = script:WaitForChild("ScreenGui");
local cover = scrgui:WaitForChild("Cover");
function StartLoadingAnimation()
	cover:TweenPosition(OriginalTween,'Out','Linear',.5,true,nil);
	Spawn(function()
		LoadingStop = true
		local function SubtractColor3(a, b) 
			local R = a.r + b.r
			local G = a.g + b.g
			local B = a.b + b.b
			return Color3_new(R, G, B)
		end
		local function MultiplyColor3(Num, Color) 
			local R = Color.r * Num
			local G = Color.g * Num
			local B = Color.b * Num
			return Color3_new(R, G, B)
		end
		local function InverseColor3(Color)   
			return Color3_new(1-Color.r, 1-Color.g, 1-Color.b)
		end
		local function StartRing(Color, Radius, StartPos, Size)  
			Color = InverseColor3(Color)
			Spawn(function()
				while LoadingStop do
					local EndNum = StartPos+360
					local IncreaseVal = 8
					for i=StartPos, EndNum, IncreaseVal do
						if LoadingStop then
							local XPos = ((math_cos(math_rad(i))) * Radius)
							local YPos = ((math_sin(math_rad(i))) * Radius)
							local f = Instance_new("Frame", scrgui.LoadingFrame)
							f.Position = UDim2_new(0.5, XPos, 0.5, YPos)
							f.Name = "Pixel"
							f.Size = UDim2_new(0,Size,0,Size)
							f.BackgroundTransparency = 0
							f.BorderSizePixel = 0
							f.ZIndex = 8
							f.BackgroundColor3 = Color3_new(1,1,1)
							f:TweenSize(UDim2_new(0,0,0,0), "Out", "Sine",1.5, true)
							Spawn(function()
								for i=0, 1, 0.025 do
									i = math_sin(math_rad(90)*i)
									if LoadingStop then
										f.Transparency = i
										f.BackgroundColor3 = SubtractColor3(Color3_new(1,1,1), MultiplyColor3(1-i, Color))
									end
									wait()
								end
								wait()
								f:Destroy()
							end)
							wait()
						end
					end 
				end
			end)
		end
			
		local function TransistLoadingFrame(Start, End, reverse, Color)
			Color = InverseColor3(Color)
			if not reverse then
				for i=Start, End, 0.01 do 
					if LoadingStop then
						i = math_sin(math_rad(90)*i)
						scrgui.LoadingFrame.Loading.TextColor3 = SubtractColor3(Color3_new(1,1,1), MultiplyColor3(1-i, Color))
						wait()
					end
				end
				else
				for i=End, Start, -0.01 do 
					if LoadingStop then
						i = math_sin(math_rad(90)*i)
						scrgui.LoadingFrame.Loading.TextColor3 = SubtractColor3(Color3_new(1,1,1), MultiplyColor3(1-i, Color))
						wait()
					end
				end
			end
		end
		StartRing(Color3_new(0.0666667, 0.0666667, 0.0666667), 90, 360,12)
		StartRing(Color3_new(0.0666667, 0.0666667, 0.0666667), 110, 120,12)
		StartRing(Color3_new(0.0666667, 0.0666667, 0.0666667), 100, 240,12)
		scrgui.LoadingFrame.Loading.TextTransparency = 1
		scrgui.LoadingFrame.Loading.TextColor3 = Color3_new(1,1,1)
		scrgui.LoadingFrame.Visible = true
		for i=1, 0, -0.01 do
			i = math_sin(math_rad(90)*i)
			scrgui.LoadingFrame.Loading.TextTransparency = i
			wait()
		end
		Spawn(function()
			while LoadingStop do
				TransistLoadingFrame(0, 0.7, false, Color3_new(1,0,0))
				TransistLoadingFrame(0, 0.7, true, Color3_new(1,0,0)) 
				wait(1)
				TransistLoadingFrame(0, 0.7, false, Color3_new(0,1,0))
				TransistLoadingFrame(0, 0.7, true, Color3_new(0,1,0))
				wait(1)
				TransistLoadingFrame(0, 0.7, false, Color3_new(0,0,1)) 
				TransistLoadingFrame(0, 0.7, true, Color3_new(0,0,1))
				wait(1)
			end
		end)
		repeat wait() until not LoadingStop
		for i=0, 1, 0.03 do
			i = math_sin(math_rad(90)*i)
			scrgui.LoadingFrame.Loading.TextTransparency = i
			wait()
		end 
			cover:TweenPosition(NegativeTween,'Out','Elastic',.5,true,nil);
	end)
end
StartLoadingAnimation()
for i = 1,#ids do wait(.1)
	game:GetService("ContentProvider"):Preload(ids[i]);
end
repeat wait(1) until Workspace:FindFirstChild(Player.Name);
LoadingStop = false;
human.WalkSpeed = O_W_S;











-- World Space UI







function PlayDialog(event,perpetrator)
	human.WalkSpeed = 0;
	Player.CameraMode = 'LockFirstPerson';
	wait(.5)
	LerpCamera(head,perpetrator.Head);
end





--- Character related functions







function WaitForDistance(part,radius)
	repeat wait(0.1) until (torso.Position-part.Position).Magnitude <= radius;
end 
local DynamicFunctions = {
["Sound"] = function(partt)   
	local running = true;
	local pos = torso.Position;
	local quitest,name,closest = 0,partt.Name,10000000
	local freq = 0;
	local a, b, c, d, e, f, g = name:match("^(.-)|(.-)|(.-)|(.-)|(.-)|(.-)|(.-)|?$");
	local loudest,Radius,frequency = tonumber(e),tonumber(f),tonumber(g)
	local s = Instance_new("Sound",gui); 	s.Name = d;
	local id = SoundDatabase[d:lower()]:lower()
	local pitch_data = {};
	local remainder = id:gsub(pat,"");
	for w in remainder:gmatch("(%.?%d+)-") do
		table_insert(pitch_data,tonumber(w));
	end
	local function setfrequency()
		local randompitch = pitch_data[math_random(1,#pitch_data)]
		local delimiter = math_min(unpack(pitch_data));
		local increase = 0;
		for index,value in pairs(pitch_data) do
			increase = index > 1 and increase + .5 or 0;
			if value == randompitch then
				return frequency+increase;   
			end
		end
	end
	s.SoundId = id:match(pat);
	s.Volume = 0;
	s.Pitch = pitch_data[math_random(1,#pitch_data)];
	freq = setfrequency();
	wait(.5)
	s:Play(); 
	local clopart = nil;
	local part, hitpoint = 
	Workspace:FindPartOnRay(Ray_new(pos, CFrame_new(pos, partt.Position).lookVector * (pos - partt.Position).magnitude),char)
	coroutine_resume(coroutine_create(function()
		while(running) do wait(freq) 
			print("Freq for "..s.Name.." is "..freq)
			s.Pitch = pitch_data[math_random(1,#pitch_data)];
			freq = setfrequency();
			s:Play(); 
		end
	end))        
	while(running) do wait(0)    
		local pos = torso.Position             
		local dist = (pos - partt.Position).magnitude
		if dist < closest then
			clopart = partt
			closest = dist
		end
		if partt then
			local percentile = (dist/Radius) - .3
			if Radius - dist < -20 then 
				s:Stop()
				wait()
				s:Destroy()
				running = false;
				else
				s.Volume = 1-percentile  >= loudest and s.Volume or 1-percentile;
			end
		end
	end
end,
["RandomEvent"] = function(partt)
	print("RandomEvent")
	local name = partt.Name;               --part contains randomevent event perpetrator radius chance
	local a, b, c, d, e, f, g = name:match("^(.-)|(.-)|(.-)|(.-)|(.-)|(.-)|(.-)|?$");
    local chance,radius = tonumber(g),tonumber(f);
    local perpetrator = Workspace:findFirstChild(e);
	if (math_random(chance,maxchance)) ~= chance then return end
	WaitForDistance(partt,radius);
	PlayDialog(d,perpetrator);
end
}
function WalkSound()
	--if Beat_Adjust and Is_Adjusting == false then coroutine_resume(coroutine_create(Beat_Adjust)) end 
	local pitches = pitchbase[FootStep] ~= nil and pitchbase[FootStep] or pitchbase['Terrain_Grass']
	Sound.SoundId,Sound.Volume = soundbase[FootStep],volumebase[FootStep];
	Sound.Pitch = pitches[math_random(1,#pitches)]
	Sound:Play()
end

















-- Camera related functions
















function LerpCamera(Part1, Part2)
	Chatting = true
	cam.CameraType="Scriptable"
	local camPart=Instance.new("Part", game.Workspace)
	camPart.Name, camPart.Anchored, camPart.Transparency,camPart.CanCollide="StartPart", true, 1,false
	camPart.CFrame= CFrame_new(Part1.Position + (Part1.CFrame.lookVector * 2))
	local dist=(camPart.Position-Part2.Position).magnitude
	for i=0.5, dist, 0.5 do
		local pos=camPart.Position:Lerp(Part2.Position, i/dist)
		cam.CoordinateFrame=CFrame_new(camPart.Position, pos)
		Wait(0.03)
	end
	game.Debris:AddItem(camPart,1)
end
function TweenCam(Status)
	local Add_Tab = {
	CFrame_new(0.02,.02,0),
	CFrame_new(0,.02,0.02)
	}
	local Minus_Tab = {
	CFrame_new(-.02,-.02,0),
	CFrame_new(0,-.02,-.02)
	}
	for i = 1, 3 do wait(0)
		CF = Status == 'Minus' and cam.CoordinateFrame * Minus_Tab[math_random(1,2)] or
		cam.CoordinateFrame * Add_Tab[math_random(1,2)]
		cam.CoordinateFrame = CF;
	end
end





--------------------------------------------------------- EVENT HANDLING










 game:GetService("RunService").Stepped:connect(function()
	local pos = torso.Position
	local offvel = torso.Velocity*1/15
	local hit,ray = workspace:FindPartOnRay(Ray_new(pos+offvel,Vector3_new(0,-3.1,0)),char)
	if hit and soundbase[hit.Name] then
		FootStep = hit.Name
	end
	local moving = math_abs(torso["Right Shoulder"].CurrentAngle-torso["Right Shoulder"].DesiredAngle) > .1
	if tick()-laststep > Speed_Render and torso.Velocity.magnitude > 5 and hit and moving then
		laststep = tick()
		WalkSound()
	end
end)
mouse.KeyDown:connect(function(key)
	local time = 100;
	if key == "\48" and frozen == false and torso.Velocity.magnitude > 5 then
		IsSprinting = true;
		Speed_Render,volumebase = I_S_R,volumebasesprint;
		human.WalkSpeed = I_W_S;
		repeat wait(.1) time = time - 1;
			TweenCam("Minus")
			wait(.1)
			TweenCam("Add")
		until IsSprinting == false or time <=0 
		Speed_Render,volumebase = O_S_R,volumebaseorig;
		human.WalkSpeed = O_W_S
	end
end)
 mouse.KeyUp:connect(function(key)
	if  key == "\48"  and frozen == false then
		IsSprinting = false
	end
end)
 char.Head.Touched:connect(function(hit)
	if touching or frozen == true then return end 
	touching = true
	local passed = hit.Name;
		if(passed:match("%w+|%w+|(%w+)|%w+|%w+|%w+|%w+|?")) then
			DynamicFunctions[passed:match("%w+|%w+|(%w+)|%w+|%w+|%w+|%w+|?")](hit)
		end
	wait(.1)
	touching = false  
end)
local changing = false;
