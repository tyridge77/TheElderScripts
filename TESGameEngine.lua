-- Essentials
wait(1)

local Lighting = game:GetService("Lighting");
local debris = game:GetService("Debris");
local GameFiles = Lighting:WaitForChild("GameFiles");
local ChatChannels = GameFiles:WaitForChild("ChatChannels");
local channel1 = ChatChannels:WaitForChild("World");
local Items = Lighting:WaitForChild("Items");
local Weapons = Items:WaitForChild("Weapons");

local ArmorImages = Items:WaitForChild("ArmorImages");
local Players = game:GetService("Players");
local Player = Players.LocalPlayer
local Char = Player.Character;
local Head,Torso,Human = Char:WaitForChild("Head"),Char:WaitForChild("Torso"),Char:WaitForChild("Humanoid");
local PlayerGui = Player.PlayerGui;
local mouse = Player:GetMouse()



repeat wait() until Player:FindFirstChild("Stats")
local Stats = Player.Stats;
local fatigue = Stats.Fatigue
local mana = Stats.Mana
local Location = Player:WaitForChild("Location");
local LockPick = Player:WaitForChild("LockPick")


-- GUI Variables



local LootMenu = Lighting:WaitForChild("LootMenu"):clone()
LootMenu.Parent = PlayerGui;
local LootMain = LootMenu.Main;

local LootExit = LootMain.Exit;
local LootBackground = LootMain.background;


local LockPickGui = Lighting:WaitForChild("LockPicking"):clone();
local LockSucceed = Instance.new("Sound",LockPickGui)
LockSucceed.SoundId = 'http://roblox.com/asset/?id=10209834'
LockSucceed.Volume = 1;
LockSucceed.Pitch = .1;
local anim = LockPickGui.Frame.Animating

LockPickGui.Parent = PlayerGui;
local LockPickBackground = LockPickGui.background;
local LockPickFrame = LockPickGui.Frame;
local l = LockPickFrame.lockpick

local CastBar = PlayerGui:WaitForChild("CastBar");
local CastBarHB = CastBar:WaitForChild("HB");
local CastBarMain = CastBar:WaitForChild("Main");
local CastBarBar = CastBarMain:WaitForChild("Bar");
local vals = CastBar:WaitForChild("CastTime").Value;

--local LoadingGui = PlayerGui:WaitForChild("LoadingGui");


local CharMenu = PlayerGui:WaitForChild("CharMenu")
local CharMenuActionBar = CharMenu.ActionBar;

local CharMenuBackground = CharMenu.Background
local CharMenuBackpack = CharMenuBackground.Backpack;
local CharMenuInfoWindow = CharMenuBackpack.Background:WaitForChild("InfoWindow");
print(CharMenuInfoWindow)
local CharMenuUI = CharMenuBackpack.UI;
local Gold = CharMenuBackpack.Background.Gold
local GoldAmt = Gold.Amt;
local CharMenuChatting = CharMenu.Chatting;




local ChatGui = PlayerGui:WaitForChild("ChatGui");
local ChatGuiMove = ChatGui.Move;
local ChatGuiBackground = ChatGuiMove.Background;
local ChatGuiEnter = ChatGuiBackground.Enter;

local l5 = ChatGuiBackground:WaitForChild("L5")
local l4 = ChatGuiBackground:WaitForChild("L4")
local l3 = ChatGuiBackground:WaitForChild("L3")
local l2 = ChatGuiBackground:WaitForChild("L2")
local l1 = ChatGuiBackground:WaitForChild("L1")

local Scripts = PlayerGui:WaitForChild("Scripts");
local playsound = Scripts.PlaySound;
local KeyBinds = Scripts.KeyBinds;

local Bow = Scripts.Bow
local Magic = Scripts.Magic;

local Arrows = Bow.Arrows;

local ebutton = Scripts.EDisplay;
local Blade = Scripts.Blade

local MouseDisplay = PlayerGui:WaitForChild("MouseDisplay");
local cursor = MouseDisplay.Cursor;


local lpgui = Lighting.LockPicking



--UDim2 Variables




local UDim2_new = UDim2.new;

wait(0)




--CFrame Variables





local CFrame_new = CFrame.new;
local CFrame_fromEulerAnglesXYZ = CFrame.fromEulerAnglesXYZ;
local CFrame_Angles = CFrame.Angles;






--Math Variables





local math_pi = math.pi;
local math_random = math.random;
local math_floor = math.floor;







--Instancing




local Instance_new = Instance.new;





--BrickColor Variables




local BrickColor_new = BrickColor.new;





-- Ray



local Ray_new = Ray.new;





--String Manipulation




local string_byte = string.byte;
local string_lower = string.lower;





--Vector3 Variables





local Vector3_new = Vector3.new;
local barreloffset=Vector3_new(-.05,.5,-1.5)
local windvec=Vector3_new(2,-1,1).unit






--Mathematical Variables




local math_floor = math.floor;



--UDim2 Variables



local UDim2_new = UDim2.new;
local LootSize = UDim2.new(0,245,0,360);
local Zerod = UDim2.new(0,0,0,0);
local Zerod2 = UDim2.new(0,-1000,0,0)
local Zerod3 = UDim2.new(0,-1000,0,25)
local LockFramePosition = UDim2.new(0,300,0,150);
local LockBackgroundPosition = UDim2.new(0,320,0,175);
local TumblerPositions = {
[LockPickFrame.P1] = LockPickFrame.P1.Position,
[LockPickFrame.P2]=LockPickFrame.P2.Position,
[LockPickFrame.P3] = LockPickFrame.P3.Position
}
--BrickColor Variables




local BrickColor_new = BrickColor.new;





--String variables

local string_byte = string.byte;
local gbimg = "http://www.roblox.com/asset/?id=107313698"
local pimg = "http://www.roblox.com/asset/?id=116627910"
local keys = {"z", "x", "c", "f", "r"}

	
local swinganims = {
[1] = Human:LoadAnimation(Scripts.LeftSlash),
[2] = Human:LoadAnimation(Scripts.LeftSwingFast),
[3] = Human:LoadAnimation(Scripts.OverHeadSwing),
[4] = Human:LoadAnimation(Scripts.RightSlash),
[5] = Human:LoadAnimation(Scripts.RightSwingFast),
[6] = Human:LoadAnimation(Scripts.Stab1),
[7] = Human:LoadAnimation(Scripts.Stab2)	
}

-- Integer variables


local ChatDeb = 0;
local keyDeb = 0;
local ecount = 0;
local rDeb = 0;
local cost = 5
local ecount = 0;
local range=400
local rate=1/30
local deb = 0


--null



local sword;
local sword2;
local s;
local swingWithOut = nil
local ArrowAnim = nil
local leftSlash = nil
local leftFast = nil
local OHSwing = nil
local rightSlash = nil
local rightFast = nil
local stabone = nil
local stabtwo = nil
local humanoid = nil
local enabled = false
local pcf;
local pst;
local pcf2;
local pst2;
local equipped = false
local up = false
local clicked = false 
local dtab = {};
local pickevents = {};
local pickmove;
local speed;	local wt;
local dpos;
local spos;
--Animations






local swingWithOut = Human:LoadAnimation(Scripts.twohandswordwithswingout);
local equip = Human:LoadAnimation(Scripts.Equip);
local ArrowAnim = Human:LoadAnimation(Scripts.ArrowAnim);	



--Treasure






function CloseLock()
	up = false;
	deb = 0;
	ready = false;
	clicked = false;
	anim.Value = false;
	if pickmove ~= nil then pickmove:disconnect(); end
	if not pickevents == {} then for _,v in pairs(pickevents) do v:disconnect() end end
	print("Disconnected events")
	pickevents = {}
	dtab = {}
	LockPickGui.Num.Value = 0 -- Resetting the # of completed pins
	LockPickFrame:TweenPosition(Zerod2,'Out','Linear',.5,true,nil);
	LockPickBackground:TweenPosition(Zerod3,'Out','Linear',.5,true,nil);
	for _,v in pairs(LockPickFrame:GetChildren()) do
		if v:isA("ImageButton") then
			v.Position = TumblerPositions[v];
		end
	end
print("Closing") end;

function start(v, wat)
	spos = v.Position	
	if anim.Value == false then
		if up == false then
			up = true
			deb = 0
			spos = v.Position
			dpos = spos - UDim2_new(0,0,0,70)
			anim.Value = true
			l:TweenPosition(l.Position - UDim2_new(0,0,0,15), "Out", "Quad", .3, true, nil)
			wait(.3)
			ready = true
			v:TweenPosition(dpos, "Out", "Quad", speed,true,nil)
			l:TweenPosition(l.Position + UDim2_new(0,0,0,15), "Out", "Quad", .3, true, nil)
			anim.Value = false
			wait(speed + wt)
			if clicked == false then
				deb = 1
				up = false
				v:TweenPosition(spos, "Out", "Quad", speed/2, true, nil)
				wait(speed + wt)
				deb = 0
			end
			ready = false
			elseif up == true then
			if ready then
				clicked = true
				LockPickGui.Num.Value = LockPickGui.Num.Value + 1
				LockSucceed:Play();
				for i = 1, 50 do wait(0) LockSucceed.Pitch = LockSucceed.Pitch + .5 end
				wait(1)
				LockSucceed.Pitch = .1;
				dtab[wat] = true
				else
				if LockPick.Value > 0 then
					LockPick.Value = LockPick.Value - 1
				end
			end
		end
		else
		if  LockPick.Value > 0 then
			LockPick.Value = LockPick.Value - 1
		end
	end
end

local function RunLockpick(doorhere,difficultyval)
	LockPickFrame:TweenPosition(LockFramePosition,'Out','Linear',.5,true,nil);
	LockPickBackground:TweenPosition(LockBackgroundPosition,'Out','Linear',.5,true,nil);
	print("Passed tween")
	LockPickGui.Door.Value = doorhere;
	LockPickGui.Difficulty.Value = difficultyval;
	if LockPickGui.Difficulty.Value == "Easy" then
		speed = 1
		wt = 1
		elseif LockPickGui.Difficulty.Value == "Average" then
		speed = .6
		wt = .5
		elseif LockPickGui.Difficulty.Value == "Hard" then
		speed = .3
		wt = .25
	end
	local ready = false
	LockPickFrame.DLock.Text = "Difficulty: "..LockPickGui.Difficulty.Value;
	LockPickFrame.NumP.Text = "LockPicks: "..LockPick.Value;
	pickmove = mouse.Move:connect(function ()
		if mouse.X >= 300 and mouse.X <= 615 then
			if anim.Value == false then
				l.Position = UDim2_new(0,(mouse.X - 350),0,300)
			end
		end
	end)
	-- Make events~
	dtab = {}
	for i,v in pairs(LockPickFrame:GetChildren()) do
		if v.ClassName == "ImageButton" or v.ClassName == "TextButton" then
			print'NEW EVENT ADDED'
			--pickevents[#pickevents+1]=v.MouseButton1Down:connect(function ()
				v.MouseButton1Down:connect(function ()
					if v.Name == "X" then
						CloseLock()
					end
					if v.ClassName == "ImageButton" then
						print(v.Name)
						print'image button clicked'
						if v.Name == "P1" then
							if dtab["P1"] == nil then
								start(v, "P1")
							end
							elseif v.Name == "P2" then
							if dtab["P2"] == nil then
								start(v, "P2")
							end
							elseif v.Name == "P3" then
							if dtab["P3"] == nil then
								start(v, "P3")
							end	
						end
					end
					up = false
					deb = 0
				end)
			end
		end
	end
	pickevents[#pickevents+1]=LockPickGui.Num.Changed:connect(function()
		local Door = LockPickGui.Door.Value
		if LockPickGui.Num.Value >= LockPickGui.DNum.Value then
			Door.Locked.Value = false
			CloseLock()
		end
	end)
		
	function Loot()
		LootMain:TweenSize(LootSize,'Out','Elastic',.5,true,nil);
		wait(.6)
		for _,v in pairs(LootBackground:GetChildren()) do if v.ClassName ~= "LocalScript" then v.Visible = true end end
		LootExit.Visible = true
		local p1 = nil;
		function createobject(a, wat)
			if a ~= "Gold" then
				print'notgold'
				local tempitem = Items[wat]:FindFirstChild(a)
				print(tempitem.Name)
				p1 = Instance_new("BoolValue")
				p1.Name = a
				local p2 = Instance_new("StringValue", p1)
				p2.Name = "Class"
				local p3 = Instance_new("StringValue", p1)
				p3.Name = "Slot"
				local p4 = Instance_new("StringValue", p1)
				p4.Name = "Type"
				if tempitem:FindFirstChild("Damage") ~= nil then
					p2.Value = "Weapon"
					p3.Value = "Hand"
					p4.Value = tempitem.Type.Value
					elseif tempitem:FindFirstChild("Shield") or tempitem:FindFirstChild("Quiver") then
					p2.Value = "Secondary"
					p3.Value = "OffHand"
					p4.Value = tempitem.Type.Value
					elseif tempitem:FindFirstChild("Duration") then
					print"FOOD"
					p2.Value = "Food"
					elseif tempitem:FindFirstChild("Amount") then
					print"POTION"
					p2.Value = "Potion"
						
					else
					p2.Value = "Armor"
					p3.Value = tempitem.Slot.Value
					p4.Value = tempitem.CreateRef.Value
				end
			end
			if a == "Gold" then
				print'gold'
				GoldAmt.Value = GoldAmt.Value + wat
				Gold.Text = tostring(GoldAmt.Value)
			end
			if p1 ~= nil then
				print"P1"
				p1.Parent = CharMenuBackpack.Looting
			end
		end
		wait()
		for _,v in pairs(LootBackground:GetChildren()) do 
			if v:isA("ImageButton") then
				local vinfo = v.info
				local vamt = v.Amt;
				local vtype = v.Type
				ButtonKey = v.MouseButton1Down:connect(function ()
					if v.Image ~= "" and vinfo.Text == 'Gold' then
						createobject(vinfo.Text, vamt.Value)
						v:TweenSizeAndPosition(Zerod, Zerod)
						wait(1)
						vinfo.Text = ""
						v.Visible = false;
						vamt.Value = 0;
						vtype.Value = "";
						else
						createobject(vinfo.Text, vtype.Value)
						v:TweenSizeAndPosition(Zerod, Zerod)
						wait(1)
						vinfo.Text = ""
						v.Visible = false
						vamt.Value = 0
						vtype.Value = ""
					end
					ButtonKey:disconnect();
				end)
			end
		end
	end
	LootExit.MouseButton1Down:connect(function()
		for _,v in pairs(LootBackground:GetChildren()) do if v.ClassName ~= "LocalScript" then v.Visible = false; end end
		LootMain:TweenSize(Zerod,'Out','Linear',.5,true,nil);
	end)
		
		
		
		
		
		
		
		
	--Inventory
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	--Combat
		
		
		
	function Cast()
		local NumOf = 0;
		local tempmath = vals*10;
		local color = CastBarGuiBar.BackgroundColor3;
		for i=1, tempmath do
			wait(vals/(10*vals) -.05)
			NumOf = NumOf + 1
			CastBarGuiBar.Size = UDim2_new(NumOf/tempmath, 0, 1, 0)
		end 
		CastBarGuiBar.BackgroundColor3 = CastBarGuiBar.BorderColor3
		CastBarGuiMain.Visible = false 
		wait(.05)
		CastBarGuiBar.Size = UDim2_new(0,0,0,0)
		CastBarGuiBar.BackgroundColor3 = color;
		if CastBarGuiHB.Value["_magic"] then
			CastBarGuiHB.Value["_magic"].Casted.Value = true 
			else
			CastBarGuiHB.Value["_ability"].Casted.Value = true 
		end 
	end
		
	function checkdistance(obj)
		if (Torso.Position - obj.Position).magnitude <= 7 then
			return true
			else
			return false
		end
	end
		
	function findemptyloot(d)
		for z = 1, 6 do
			local tfind = d:FindFirstChild("B"..tostring(z))
			if tfind.info.Text == "" then
				return tfind
			end
		end
	end
		
	function populate(source, d)
		for _,v  in pairs(source:GetChildren()) do 
			wait()
			local tloc = findemptyloot(d);
			tloc.Image = ArmorImages:FindFirstChild(v.Img.Value).Texture
			tloc.info.Text = v.Name
			tloc.Type.Value = v.Type.Value
			if v.Value ~= 0 then
				tloc.Amt.Value = v.Value
			end
		end
	end
		
	function error(text, duration)
		local precount = 0
		ebutton.Visible = true
		ebutton.Text = text
		ebutton.TextTransparency = 0
		wait(duration)
		repeat
			wait(.1)
			ebutton.TextTransparency = ecount
			ecount = ecount + 0.1
			precount = ecount
			if precount > ecount then
				break
			end
			print(tostring(ecount))
		until	ecount >= 1
		if ecount > 1 then
			ecount = 1
		end
		ebutton.Visible = false
	end
		
	function treasure(t)
		if checkdistance(t) == true then
			if t.Parent.Locked.Value == true then
				RunLockpick(t.Parent,t.Parent.Locked.DLock.Value)
				else
				populate(t.Parent.TChest, LootBackground)
				Loot()
			end
			else
			ecount = 0
			error("I'm too far away!", 1)
		end
	end
		
	function door(var)
		if checkdistance(var) == true then
			if var.Parent.Locked.Value == true then
				RunLockpick(var.Parent,var.Parent.Locked.DLock.Value);
				else
				local goto = var.Parent:findFirstChild("Go To")
				Torso.CFrame = (goto.CFrame + Vector3_new(0,5,0))
				--d = Instance_new("StringValue", p.Location)
				Location.Value = var.Parent.Place.Value
			end
			else
			ecount = 0
			error("I'm too far away!", 1)	
		end
	end
		
		
	function tagHumanoid(humanoid, Player)
		local tag = Instance_new("ObjectValue")
		tag.Value = Player
		tag.Name = "creator"
		tag.Parent = Human.Parent
	end
		
	function damagef(mon, Player, what)
		local block = game.Lighting.DamageDeal:clone()
		local wep = Blade.Value.Damage;
		local damage = math_random(wep.Value - 2, wep.Value + 2)
		block.TextLabel.Text = tostring(damage) + Stats[what].Value
		block.Parent = mon.Parent.Head
		block.Adornee = mon.Parent.Head
		mon.Health = mon.Health - (damage + Stats[what].Value)
		debris:AddItem(block, .5)
	end
		
	function cframe(part, to, offset, on, nn)
		local bad = part:findFirstChild(on)
		if bad then
			bad:Destroy()
		end
		local tw = Instance_new("Weld", part)
		tw.Part0 = to
		tw.Part1 = part
		tw.Name = nn
		if offset ~= nil then
			tw.C0 = offset
		end
	end
		
	function checkintangible(hit)
		if hit and hit~=nil then
			if hit:IsDescendantOf(sword.Parent) or hit.Transparency>.9 or hit.Name=="Handle" or hit.Name=="Effect" or hit.Name=="Bullet" or hit.Name=="Laser" or string_lower(hit.Name)=="water" or hit.Name=="Rail" or hit.Name=="Arrow" then
				return true
			end
		end
		return false
	end
		
	function castray(startpos,vec,length,ignore,delayifhit)
		local hit,endpos2=Workspace:FindPartOnRay(Ray_new(startpos,vec*length),ignore)
		if hit~=nil then
			if checkintangible(hit) then
				if delayifhit then
					wait()
				end
				hit,endpos2=castray(endpos2+(vec*.01),vec,length-((startpos-endpos2).magnitude),ignore,delayifhit)
			end
		end
		return hit,endpos2
	end
		
	function drawbeam(beamstart,beamend,clr,fadedelay)
		local dist=(beamstart-beamend).magnitude
		local laser=Instance_new("Part")
		laser.Name="Effect"
		laser.Anchored=true
		laser.CanCollide=false
		laser.Shape="Block"
		laser.formFactor="Custom"
		laser.Size=Vector3_new(.2,.2,.2)
		laser.Transparency=5
		laser.Material=Enum.Material.Plastic
		laser.Locked=true
		laser.TopSurface=0
		laser.BottomSurface=0
		laser.BrickColor=clr
		laser.CFrame=CFrame_new(beamend,beamstart)*CFrame_new(0,0,-dist/2)*CFrame_Angles(math_pi/2,0,0)
		local m=Instance_new("SpecialMesh")
		m.Scale=Vector3_new(1,dist*5,1)
		m.Parent=laser
		debris:AddItem(laser,fadedelay*3)
		laser.Parent=Workspace		
		local frames=math_floor(fadedelay/rate)
		for frame=1,frames do
			wait(rate)
			local percent=frame/frames
			laser.CFrame=laser.CFrame+windvec*rate
			laser.Transparency=.5+(percent*.5)
		end
		wait(1)
		laser:Destroy()
	end
	function go(targetpos,startpos,fadedelay)
		enabled = false
		wait()
		print'go 1'
		if Bow.Value == false and Magic.Value == false then
			print'no Bow'
			print'no magic'
			local anim = math_random(1,7)
			swinganims[anim]:Play();
			wait(.5);
			enabled = true
			elseif Bow.Value == true and Arrows.Value == true then
			print'yes Bow'
			print'arrows good'
			ArrowAnim:Play()
			sword.Arrow.Transparency = 0
			wait(1.5)
			local fakestartpos=(sword.Handle.CFrame*CFrame_new(barreloffset)).p
			local vec=(targetpos-startpos).unit
			local p=Instance_new("Part")
			p.Name="Arrow"
			p.BrickColor=BrickColor_new("Black")
			p.CanCollide=false
			p.TopSurface="Smooth"
			p.BottomSurface="Smooth"
			p.formFactor="Custom"
			p.Size=Vector3_new(.3,.3,2.7)
			local m=Instance_new("SpecialMesh")
			m.MeshId="http://www.roblox.com/asset/?id=90708690"
			m.TextureId="http://www.roblox.com/asset/?id=90708422"
			m.Scale=Vector3_new(1,1,2)
			m.Parent=p
				
			local c=Instance_new("ObjectValue")
			c.Name="creator"
			c.Value=Player;
			c.Parent=p
			local sound=Instance_new("Sound")
			sound.SoundId="http://www.roblox.com/asset/?id=16211030"
			sound.Volume=1
			sound.Parent=p
			sound:Play()
			local damagetag=Instance_new("IntValue")
			damagetag.Name="DamageTag"
			damagetag.Value=damage
			damagetag.Parent=p
			local s=Scripts.Hurt:clone()
			s.Parent=p
			s.Disabled=false
			local hit,endpos=castray(startpos,vec,range,sword.Parent,false)
			local fakevec=(endpos-fakestartpos).unit
			if hit~=nil then
				local newcf=CFrame_new(endpos,endpos+fakevec)*CFrame_new(0,0,.9+(math_random(0,1)*.4))
				p.CFrame=newcf
				local w=Instance_new("Weld")
				w.Part0=hit
				w.Part1=p
				w.C0=hit.CFrame:inverse()*newcf
				w.C1=newcf:inverse()*newcf
				w.Parent=p
				else
				p.CFrame=CFrame_new(endpos,endpos+fakevec)
				p.Velocity=fakevec*300
				p.Parent=Workspace
			end	
			debris:AddItem(p,10+(math_random()*10))
			p.Parent=Workspace
				
			delay(0,function()
				drawbeam(fakestartpos,endpos,BrickColor_new("Institutional white"),fadedelay)
			end)
			if hit.Parent:FindFirstChild("Monster") then
				damagef(hit.Parent.Monster, Player, "Strength")
				tagHumanoid(hit.Parent.Monster, Player)	
			end
			playsound.SoundName.Value="FireSound"
			playsound.Value=not playsound.Value
			wait(1)
			enabled = true
			elseif Bow.Value == true and Arrows.Value == false then
			ecount = 0
			error("You do not have any Arrows equipped!", 1.5)
				enabled = true
				elseif Magic.Value == true then
				print'yes magic'
				swingWithOut:Play()
				print'swingwithout'
				wait(.5)
				local fakestartpos=(sword.Handle.CFrame*CFrame_new(barreloffset)).p
				local vec=(targetpos-startpos).unit
					
				local p=Instance_new("Part")
				p.Name="Arrow"
				p.BrickColor=BrickColor_new("White")
				p.CanCollide=false
				p.TopSurface="Smooth"
				p.BottomSurface="Smooth"
				p.formFactor="Custom"
				p.Size=Vector3_new(1,1,1)
				Scripts.SMesh:clone().Parent = p
					
				local c=Instance_new("ObjectValue")
				c.Name="creator"
				c.Value=Player
				c.Parent=p
					
				local sound=Instance_new("Sound")
				sound.SoundId="http://www.roblox.com/asset/?id=16211030"
				sound.Volume=1
				sound.Parent=p
				sound:Play()
					
				local damagetag=Instance_new("IntValue")
				damagetag.Name="DamageTag"
				damagetag.Value=damage
				damagetag.Parent=p
					
				local s=Scripts.Hurt:clone()
				s.Parent=p
				s.Disabled=false
					
				local hit,endpos=castray(startpos,vec,range,sword.Parent,false)
				local fakevec=(endpos-fakestartpos).unit
				if hit~=nil then
					local newcf=CFrame_new(endpos,endpos+fakevec)*CFrame_new(0,0,.9+(math_random(0,1)*.4))
					p.CFrame=newcf
					local w=Instance_new("Weld")
					w.Part0=hit
					w.Part1=p
					w.C0=hit.CFrame:inverse()*newcf
					w.C1=newcf:inverse()*newcf
					w.Parent=p
					else
					p.CFrame=CFrame_new(endpos,endpos+fakevec)
					p.Velocity=fakevec*300
					p.Parent=Workspace
				end
					
				debris:AddItem(p,.7)
				p.Parent=Workspace
					
				delay(0,function()
					drawbeam(fakestartpos,endpos,BrickColor_new("Bright red"),fadedelay)
				end)
				if hit.Parent:FindFirstChild("Monster") then
					damagef(hit.Parent.Monster, Player, "Magicka")
					tagHumanoid(hit.Parent.Monster, Player)
				end
				playsound.SoundName.Value="FireSound"
				playsound.Value=not playsound.Value
					
				wait(1)
				enabled = true
			end 
		end
		mouse.Button1Down:connect(function ()
			if not enabled then
				return
			end
			if Scripts.Magic.Value == false then
				print'nomagic'
				local calc = fatigue.Value - cost
				if calc >= 0 then
					print'calc1 good'
					if equipped == true then
						print'equipped'
						fatigue.Value = fatigue.Value - cost
						go(mouse.hit.p, Head.Position, .25)
						elseif Scripts.Blade.Value then
						ecount = 0
						error("Your weapon is sheathed.", 1)
						elseif Scripts.Blade.Value == nil then
						ecount = 0
						error("You do not have a weapon equipped.", 1)
						end
						elseif calc < 0 then
						ecount = 0
						error("Not enough Fatigue!", 1)
					end
					elseif Scripts.Magic.Value == true then
					print'yesmagic'
					local calc = mana.Value - cost
					if equipped == true then
						print'equipped'
						if calc >= 0 then
							print'magic should go'
							mana.Value = mana.Value - cost
							go(mouse.hit.p, Head.Position, .25)
								
						end
						else
						ecount = 0
						error("Not enough Mana!", 1)
			end end end)
				
				
				
				
				
				
				
				
				
				
				
				
			-- UI Event Handling 
				
				
				
				
				
				
				





			local UIchildren = CharMenuUI:GetChildren()
			
			function addrare(name)
				for _,v in pairs(CharMenuInfoWindow.Rarity:GetChildren()) do 
					if v.Name == name then
						v.Visible = true
						else
						v.Visible = false	
					end
				end
			end
			function rarity(itemname, what, bf)
				if what == "Weapon" or what == "Secondary" then
					stats = Weapons:FindFirstChild(itemname).Stats
					addrare(stats.Rarity.Value)
					CharMenuInfoWindow.Stats.Armor.Text = "+"..tostring(stats.Armor.Value).." Armor"
					CharMenuInfoWindow.Stats.Fatigue.Text = "+"..tostring(stats.Fatigue.Value).." Fatigue"
					CharMenuInfoWindow.Stats.Health.Text = "+"..tostring(stats.Health.Value).." Health"
					CharMenuInfoWindow.Stats.Magicka.Text = "+"..tostring(stats.Magicka.Value).." Magicka"
					CharMenuInfoWindow.Stats.Mana.Text = "+"..tostring(stats.Mana.Value).." Mana"
					CharMenuInfoWindow.Stats.Strength.Text = "+"..tostring(stats.Strength.Value).." Strength"
					CharMenuInfoWindow.Type.Thing.Text = tostring(bf)
					elseif what == "Potion" then
					local stats = game.Lighting.Items.Potions:FindFirstChild(itemname).Stats
					addrare(stats.Rarity.Value)
					CharMenuInfoWindow.Stats.Armor.Text = "+"..tostring(stats.Armor.Value).." Armor"
					CharMenuInfoWindow.Stats.Fatigue.Text = "+"..tostring(stats.Fatigue.Value).." Fatigue"
					CharMenuInfoWindow.Stats.Health.Text = "+"..tostring(stats.Health.Value).." Health"
					CharMenuInfoWindow.Stats.Magicka.Text = "+"..tostring(stats.Magicka.Value).." Magicka"
					CharMenuInfoWindow.Stats.Mana.Text = "+"..tostring(stats.Mana.Value).." Mana"
					CharMenuInfoWindow.Stats.Strength.Text = "+"..tostring(stats.Strength.Value).." Strength"
					CharMenuInfoWindow.Type.Thing.Text = "Potion"
					elseif what == "Food" then
					local stats = game.Lighting.Items.Food:FindFirstChild(itemname).Stats
					addrare(stats.Rarity.Value)
					CharMenuInfoWindow.Stats.Armor.Text = "+"..tostring(stats.Armor.Value).." Armor"
					CharMenuInfoWindow.Stats.Fatigue.Text = "+"..tostring(stats.Fatigue.Value).." Fatigue"
					CharMenuInfoWindow.Stats.Health.Text = "+"..tostring(stats.Health.Value).." Health"
					CharMenuInfoWindow.Stats.Magicka.Text = "+"..tostring(stats.Magicka.Value).." Magicka"
					CharMenuInfoWindow.Stats.Mana.Text = "+"..tostring(stats.Mana.Value).." Mana"
					CharMenuInfoWindow.Stats.Strength.Text = "+"..tostring(stats.Strength.Value).." Strength"
					CharMenuInfoWindow.Type.Thing.Text = "Food"
					elseif what == "Armor" then
					stats = game.Lighting.Items.Armor:FindFirstChild(itemname).Stats
					addrare(stats.Rarity.Value)
					CharMenuInfoWindow.Stats.Armor.Text = "+"..tostring(stats.Armor.Value).." Armor"
					CharMenuInfoWindow.Stats.Fatigue.Text = "+"..tostring(stats.Fatigue.Value).." Fatigue"
					CharMenuInfoWindow.Stats.Health.Text = "+"..tostring(stats.Health.Value).." Health"
					CharMenuInfoWindow.Stats.Magicka.Text = "+"..tostring(stats.Magicka.Value).." Magicka"
					CharMenuInfoWindow.Stats.Mana.Text = "+"..tostring(stats.Mana.Value).." Mana"
					CharMenuInfoWindow.Stats.Strength.Text = "+"..tostring(stats.Strength.Value).." Strength"
					CharMenuInfoWindow.Type.Thing.Text = tostring(bf)
				end
			end
			for _,v in pairs(CharMenuUI:GetChildren()) do 
				if v:isA("ImageButton") then print(v.Name)
					v.MouseEnter:connect(function()
						if v.Item.Value ~= "" then
							CharMenuInfoWindow.Visible = true
							CharMenuInfoWindow.Position = v.Position + UDim2_new(0,63,0,0)
							rarity(v.Item.Value, v.Class.Value, v.Type.Value)
						end
					end)
					v.MouseLeave:connect(function()
						CharMenuInfoWindow.Visible = false
					end)
				end
			end

	
			for _,v in pairs(CharMenuBackground:GetChildren()) do 
				if v:isA("TextButton") then
					v.MouseButton1Down:connect(function ()
						if d == 0 then
							d = 1
							CharMenuBackground:findFirstChild(v.Text).Visible = true
							if v.Text ~= "Backpack" then
								CharMenuBackground.Backpack.Visible = false
							end
							if v.Text ~= "Equip" then
								CharMenuBackground.Equip.Visible = false
							end
							if v.Text ~= "Questlog" then
								CharMenuBackground.Questlog.Visible = false
							end
						end 
						d = 0
					end)
				end
			end
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
			--  MOUSE Event Handling
				
				
				
				
				
				
				
				
				
			mouse.Button1Down:connect(function ()
				cursor.Visible = false
				if mouse.Target then
					--[[if mouse.Target.Name == "Schmeh" then
						mouse.Target.BrickColor = BrickColor_new("Really red")
						ecount = 0
						error("Button 1 Pressed", 1)
					end]]
				end
			end)
			mouse.Button2Down:connect(function ()
				cursor.Visible = false
				--[[ecount = 0
				error("Button 2 Pressed", 1)]]
				if rDeb == 0 then
					rDeb = 1
					if mouse.Target then
						local tgt = mouse.Target
						print(mouse.Target.Name)
						if tgt.Parent:FindFirstChild("TChest") ~= nil then
							treasure(tgt)
							elseif tgt.Parent:FindFirstChild("Door") ~= nil then
							door(tgt)
						end
					end
			end rDeb = 0 end)
				
			local mousemove = 
			mouse.Move:connect(function ()
				if mouse.Target ~= nil then
					if mouse.Target.Parent:FindFirstChild("TChest") ~= nil then
						local temptarg = mouse.Target
						cursor.Image = gbimg
						cursor.Visible = true
						cursor.Display2.Visible = false
						--[[print("Mouse X:"..mouse.X)
						print("Mouse Y:"..mouse.Y)]]
						cursor.Position = UDim2_new(0,(mouse.X+40),0,(mouse.Y-10))
						cursor.Display.Text = temptarg.Parent.Name
						elseif mouse.Target.Parent:FindFirstChild("Humanoid") ~= nil then
						local tempplayer = game.Players:FindFirstChild(mouse.Target.Parent.Name)
						if tempplayer ~= nil then
							cursor.Image = pimg
							cursor.Visible = true
							cursor.Display2.Visible = true
							cursor.Position = UDim2_new(0,(mouse.X+40),0,(mouse.Y-10))
							cursor.Display.Text = tempplayer.Stats.CharacterName.Value..", Level "..tostring(tempplayer.Stats.Level.Value).." "..tempplayer.Stats.Class.Value
							cursor.Display2.Text = "Health: "..tostring(math_floor(tempplayer.Stats.Health.Value)).."/"..tostring(tempplayer.Stats.Health.MaxHealth.Value)
							else
							cursor.Visible = false
						end
						else
						cursor.Visible = false
					end
				end
			end)
				
			local ChatGuiEnterDown = 
			ChatGuiEnter.MouseButton1Down:connect(function ()
				channel1.Value = Stats.CharacterName.Value..": "..ChatGuiBackground.Input.Text
			end)
				
			local channel1changed = 
			channel1.Changed:connect(function (c)
				l5.Text = l4.Text
				l4.Text = l3.Text
				l3.Text = l2.Text
				l2.Text = l1.Text
				l1.Text = channel1.Value
			end)
			local keydown =
			mouse.KeyDown:connect(function (key)
				if keydeb == 1 then return end 
				keyDeb = 1
				for _,v in pairs(keys) do
					if key == v then
						local button = KeyBinds:findFirstChild(tostring(key))
						if button:findFirstChild("begin")  then
							button.begin.Disabled = false
						end
					end
				end
				if string_byte(key) == 13 then
					if CharMenuChatting.Value == true then
						if ChatDeb == 0 then
							ChatDeb = 1
							channel1.Value = Stats.CharacterName.Value..": "..CharGuiMove.Input.Text
							wait(5)
						end
						ChatDeb = 0
					end
					elseif string_byte(key) == 92 then
					ChatGuiMove.Visible = not ChatGuiMove.Visible
					if ChatGuiMove.Visible == true then
						print'visible'
						CharMenuChatting.Value = true
						else
						print'not visible'
						--Scripts.Parent.BackgroundTransparency = 0.5
						CharMenuChatting.Value = false
					end
					elseif key == "e" then
					if CharMenuChatting.Value == false then
						if equipped == false then
							if Blade.Value ~= nil then
								equipped = true
								sword = Blade.Value
								pcf = sword.Handle.Pre.C0
								pst = sword.Handle.Pre.Part0
								if sword:findFirstChild("Blade") then
									equip:Play()
									wait(.5)
									cframe(sword.Handle, Char.HandSlot, nil, "Pre", "Post")
									wait(1.5)
									if Blade:FindFirstChild("Script") ~= nil then
										Blade.Script.Disabled = false
									end
									Bow.Value = false
								end
								if Bow.Value == true then
									cframe(sword.Handle, Char.HandSlot2, nil, "Pre", "Post")
								end
								-- offhand tiem!
								if Scripts.OffHand.Value then
									sword2 = Scripts.OffHand.Value
									if sword2:FindFirstChild("Shield") then
										pcf2 = sword2.Handle.Pre.C0
										pst2 = sword2.Handle.Pre.Part0
										local offsetshield = CFrame_new(-.5,0,0) * CFrame_fromEulerAnglesXYZ(0,math_pi/2,math_pi/2)
										cframe(sword2.Handle, Char["Left Arm"], offsetshield, "Pre", "Post")	
									end
								end
								enabled = true			
							end
							elseif equipped == true then
							equipped = false
							if sword then
								if sword.Parent ~= nil then
									if sword:findFirstChild("Blade") then
										if sword.Blade:FindFirstChild("Script") ~= nil then
											sword.Blade.Script.Disabled = true
										end
										Scripts.Bow.Value = false
									end
									cframe(sword.Handle, pst, pcf, "Post", "Pre")
								end
							end
							if sword2 then
								if sword2:FindFirstChild("Shield") then
									cframe(sword2.Handle, pst2, pcf2, "Post", "Pre")
								end
							end
							if swingWithOut then
								for _,v in pairs(swinganims) do v = nil; end 
							end 
						end
					end
					elseif key == "q" or key == "b" or key == "i" then
					if Player.PlayerGui.CharMenu.Chatting.Value == false then
						Player.PlayerGui.CharMenu.Background.Visible = not Player.PlayerGui.CharMenu.Background.Visible
					end
				end
				keyDeb = 0 
			end)
