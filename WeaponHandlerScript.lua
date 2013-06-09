wait(3)
local cost = 5
local sword;
local sword2;
local s;
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local Tool = script.Parent
local swingWithOut = nil
--[[local swingJump = nil
local swordThrust = nil]]
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
local bow = script.Bow
local fatigue = player.Stats.Fatigue
local mana = player.Stats.Mana
local pcf;
local pst;
local pcf2;
local pst2;
local equipped = false
local ecount = 0;
local ebutton = script.Parent.Parent.EDisplay
local equip = player.Character.Humanoid:LoadAnimation(Tool.Equip)
local range=400
local rate=1/30
local barreloffset=Vector3.new(-.05,.5,-1.5)
local windvec=Vector3.new(2,-1,1).unit
local debris = game:GetService("Debris")
local playsound = script:WaitForChild("PlaySound")
local deb = 0

function tagHumanoid(humanoid, player)
local tag = Instance.new("ObjectValue")
tag.Value = player
tag.Name = "creator"
tag.Parent = humanoid.Parent
end
function damagef(mon, player, what)
local block = game.Lighting.DamageDeal:clone()
local damage = math.random(script.Blade.Value.Damage.Value - 2, script.Blade.Value.Damage.Value + 2)
block.TextLabel.Text = tostring(damage) + player.Stats[what].Value
block.Parent = mon.Parent.Head
block.Adornee = mon.Parent.Head
mon.Health = mon.Health - (damage + player.Stats[what].Value)
debris:AddItem(block, .5)
end


function cframe(part, to, offset, on, nn)
local bad = part:findFirstChild(on)
if bad then
bad:Destroy()
end
local tw = Instance.new("Weld", part)
tw.Part0 = to
tw.Part1 = part
tw.Name = nn
if offset ~= nil then
tw.C0 = offset
end
end

function checkintangible(hit)
  if hit and hit~=nil then
		if hit:IsDescendantOf(sword.Parent) or hit.Transparency>.9 or hit.Name=="Handle" or hit.Name=="Effect" or hit.Name=="Bullet" or hit.Name=="Laser" or string.lower(hit.Name)=="water" or hit.Name=="Rail" or hit.Name=="Arrow" then
			return true
		end
	end
	return false
end

function castray(startpos,vec,length,ignore,delayifhit)
	local hit,endpos2=game.Workspace:FindPartOnRay(Ray.new(startpos,vec*length),ignore)
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
	local laser=Instance.new("Part")
	laser.Name="Effect"
	laser.Anchored=true
	laser.CanCollide=false
	laser.Shape="Block"
	laser.formFactor="Custom"
	laser.Size=Vector3.new(.2,.2,.2)
	laser.Transparency=5
	laser.Material=Enum.Material.Plastic
	laser.Locked=true
	laser.TopSurface=0
	laser.BottomSurface=0
	laser.BrickColor=clr
	laser.CFrame=CFrame.new(beamend,beamstart)*CFrame.new(0,0,-dist/2)*CFrame.Angles(math.pi/2,0,0)
	local m=Instance.new("SpecialMesh")
	m.Scale=Vector3.new(1,dist*5,1)
	m.Parent=laser
	debris:AddItem(laser,fadedelay*3)
	laser.Parent=game.Workspace

	local frames=math.floor(fadedelay/rate)
	for frame=1,frames do
		wait(rate)
		local percent=frame/frames
		laser.CFrame=laser.CFrame+windvec*rate
		laser.Transparency=.5+(percent*.5)
	end
	wait(1)
	laser:Destroy()
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

function go(targetpos,startpos,fadedelay)
enabled = false
wait()
print'go 1'
if bow.Value == false then
	print'no bow'
if script.Magic.Value == false then
	print'no magic'
local anim = math.random(1,7)
if anim == 1 then
--[[swingWithOut:Play()
print'swingwithout']]
leftSlash:Play()
wait(.5)
elseif anim == 2 then
--[[swordThrust:Play()
print'swordthrust']]
leftFast:Play()
wait(.5)
elseif anim == 3 then
--player.Character.Humanoid.Jump = true
--[[swingJump:Play()
print'swingjump']]
OHSwing:Play()
wait(0.5)
elseif anim == 4 then
	rightSlash:Play()
	wait(.5)
elseif anim == 5 then
	rightFast:Play()
	wait(.5)
elseif anim == 6 then
	stabone:Play()
	wait(.5)
elseif anim == 7 then
	stabtwo:Play()
	wait(.5)
end
enabled = true
end
elseif bow.Value == true then
	print'yes bow'
if script.Bow.Arrows.Value == true then
	print'arrows good'
ArrowAnim:Play()
sword.Arrow.Transparency = 0
wait(1.5)
--[[
	V OLD BOW V
	local arrow = sword.Arrow:clone()
local spawnPos = player.Character.Torso.Position
local direction = (mouse.Hit.p - spawnPos).unit
local spawnPos = spawnPos + direction.unit * 2.5
arrow.CFrame = CFrame.new(spawnPos, spawnPos + direction) * CFrame.Angles(0, math.pi/2, 0)
local arrowFloat = Instance.new("BodyForce")
arrowFloat.force =  Vector3.new(0.0, arrow:GetMass() * 196.1, 0.0)
arrowFloat.Parent = arrow
arrow.Velocity = direction.unit * 75.0
arrow.RotVelocity = Vector3.new(0.0, 0.0, 0.0)
arrow.Name ="arrow"
arrow.Parent = game.Workspace
local creatorTag = Instance.new("ObjectValue", arrow)
creatorTag.Name = "creator"
creatorTag.Value = player
local newScript = sword.OT:clone()
local newval2 = sword.Damage:clone()
newval2.Value = newval2.Value + player.Stats.Strength.Value
newval2.Parent = newScript
newScript.Parent = arrow
newScript.Disabled = false
newScript.remover.Disabled = false
sword.Arrow.Transparency = 1]]
	local fakestartpos=(sword.Handle.CFrame*CFrame.new(barreloffset)).p
	local vec=(targetpos-startpos).unit

	local p=Instance.new("Part")
	p.Name="Arrow"
	p.BrickColor=BrickColor.new("Black")
	p.CanCollide=false
	p.TopSurface="Smooth"
	p.BottomSurface="Smooth"
	p.formFactor="Custom"
	p.Size=Vector3.new(.3,.3,2.7)
	local m=Instance.new("SpecialMesh")
	m.MeshId="http://www.roblox.com/asset/?id=90708690"
	m.TextureId="http://www.roblox.com/asset/?id=90708422"
	m.Scale=Vector3.new(1,1,2)
	m.Parent=p

	local c=Instance.new("ObjectValue")
	c.Name="creator"
	c.Value=game.Players.LocalPlayer
	c.Parent=p

	local sound=Instance.new("Sound")
	sound.SoundId="http://www.roblox.com/asset/?id=16211030"
	sound.Volume=1
	sound.Parent=p
	sound:Play()

	local damagetag=Instance.new("IntValue")
	damagetag.Name="DamageTag"
	damagetag.Value=damage
	damagetag.Parent=p

	local s=script.Hurt:clone()
	s.Parent=p
	s.Disabled=false

	local hit,endpos=castray(startpos,vec,range,sword.Parent,false)
	local fakevec=(endpos-fakestartpos).unit
	if hit~=nil then
		local newcf=CFrame.new(endpos,endpos+fakevec)*CFrame.new(0,0,.9+(math.random(0,1)*.4))
		p.CFrame=newcf
		local w=Instance.new("Weld")
		w.Part0=hit
		w.Part1=p
		w.C0=hit.CFrame:inverse()*newcf
		w.C1=newcf:inverse()*newcf
		w.Parent=p
	else
		p.CFrame=CFrame.new(endpos,endpos+fakevec)
		p.Velocity=fakevec*300
		p.Parent=game.Workspace
	end

	debris:AddItem(p,10+(math.random()*10))
	p.Parent=game.Workspace

	delay(0,function()
		drawbeam(fakestartpos,endpos,BrickColor.new("Institutional white"),fadedelay)
	end)
	if hit.Parent:FindFirstChild("Monster") then
		damagef(hit.Parent.Monster, player, "Strength")
		tagHumanoid(hit.Parent.Monster, player)	
	end
	playsound.SoundName.Value="FireSound"
	playsound.Value=not playsound.Value
wait(1)
enabled = true
elseif bow.Arrows.Value == false then
ecount = 0
error("You do not have any Arrows equipped!", 1.5)
enabled = true
end	
end
if script.Magic.Value == true then
	print'yes magic'
swingWithOut:Play()
print'swingwithout'
wait(.5)
local fakestartpos=(sword.Handle.CFrame*CFrame.new(barreloffset)).p
	local vec=(targetpos-startpos).unit

	local p=Instance.new("Part")
	p.Name="Arrow"
	p.BrickColor=BrickColor.new("White")
	p.CanCollide=false
	p.TopSurface="Smooth"
	p.BottomSurface="Smooth"
	p.formFactor="Custom"
	p.Size=Vector3.new(1,1,1)
	script.SMesh:clone().Parent = p

	local c=Instance.new("ObjectValue")
	c.Name="creator"
	c.Value=game.Players.LocalPlayer
	c.Parent=p

	local sound=Instance.new("Sound")
	sound.SoundId="http://www.roblox.com/asset/?id=16211030"
	sound.Volume=1
	sound.Parent=p
	sound:Play()

	local damagetag=Instance.new("IntValue")
	damagetag.Name="DamageTag"
	damagetag.Value=damage
	damagetag.Parent=p

	local s=script.Hurt:clone()
	s.Parent=p
	s.Disabled=false

	local hit,endpos=castray(startpos,vec,range,sword.Parent,false)
	local fakevec=(endpos-fakestartpos).unit
	if hit~=nil then
		local newcf=CFrame.new(endpos,endpos+fakevec)*CFrame.new(0,0,.9+(math.random(0,1)*.4))
		p.CFrame=newcf
		local w=Instance.new("Weld")
		w.Part0=hit
		w.Part1=p
		w.C0=hit.CFrame:inverse()*newcf
		w.C1=newcf:inverse()*newcf
		w.Parent=p
	else
		p.CFrame=CFrame.new(endpos,endpos+fakevec)
		p.Velocity=fakevec*300
		p.Parent=game.Workspace
	end

	debris:AddItem(p,.7)
	p.Parent=game.Workspace

	delay(0,function()
		drawbeam(fakestartpos,endpos,BrickColor.new("Bright red"),fadedelay)
	end)
	if hit.Parent:FindFirstChild("Monster") then
		damagef(hit.Parent.Monster, player, "Magicka")
		tagHumanoid(hit.Parent.Monster, player)
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
if script.Magic.Value == false then
	print'nomagic'
local calc = fatigue.Value - cost
if calc >= 0 then
	print'calc1 good'
if equipped == true then
	print'equipped'
fatigue.Value = fatigue.Value - cost
go(mouse.hit.p, game.Players.LocalPlayer.Character.Head.Position, .25)
elseif script.Blade.Value then
	ecount = 0
	error("Your weapon is sheathed.", 1)
elseif script.Blade.Value == nil then
	ecount = 0
	error("You do not have a weapon equipped.", 1)
end
elseif calc < 0 then
		ecount = 0
		error("Not enough Fatigue!", 1)
end
elseif script.Magic.Value == true then
	print'yesmagic'
local calc = mana.Value - cost
if equipped == true then
	print'equipped'
if calc >= 0 then
	print'magic should go'
	mana.Value = mana.Value - cost
go(mouse.hit.p, game.Players.LocalPlayer.Character.Head.Position, .25)

end
else
ecount = 0
error("Not enough Mana!", 1)
end end end)

mouse.KeyDown:connect(function (key)
if key == "e" then
	if player.PlayerGui.CharMenu.Chatting.Value == false then
	if deb == 0 then
		deb = 1
	if equipped == false then
if script.Blade.Value ~= nil then
equipped = true
sword = script.Blade.Value
pcf = sword.Handle.Pre.C0
pst = sword.Handle.Pre.Part0
if sword:findFirstChild("Blade") then
equip:Play()
wait(.5)
cframe(sword.Handle, player.Character.HandSlot, nil, "Pre", "Post")
wait(1.5)
if sword.Blade:FindFirstChild("Script") ~= nil then
sword.Blade.Script.Disabled = false
end
script.Bow.Value = false
end
if script.Bow.Value == true then
cframe(sword.Handle, player.Character.HandSlot2, nil, "Pre", "Post")
end
-- offhand tiem!
if script.OffHand.Value then
	sword2 = script.OffHand.Value
	if sword2:FindFirstChild("Shield") then
		pcf2 = sword2.Handle.Pre.C0
		pst2 = sword2.Handle.Pre.Part0
		local offsetshield = CFrame.new(-.5,0,0) * CFrame.fromEulerAnglesXYZ(0,math.pi/2,math.pi/2)
		cframe(sword2.Handle, player.Character["Left Arm"], offsetshield, "Pre", "Post")	
	end
end
enabled = true
local humanoid = player.Character.Humanoid
swingWithOut = humanoid:LoadAnimation(Tool.twohandswordwithswingout)
--[[swingJump = humanoid:LoadAnimation(Tool.swordswingjump)
swordThrust = humanoid:LoadAnimation(Tool.swordthrust)]]
ArrowAnim = humanoid:LoadAnimation(Tool.ArrowAnim)
leftSlash = humanoid:LoadAnimation(Tool.LeftSlash)
leftFast = humanoid:LoadAnimation(Tool.LeftSwingFast)
OHSwing = humanoid:LoadAnimation(Tool.OverHeadSwing)
rightSlash = humanoid:LoadAnimation(Tool.RightSlash)
rightFast = humanoid:LoadAnimation(Tool.RightSwingFast)
stabone = humanoid:LoadAnimation(Tool.Stab1)
stabtwo = humanoid:LoadAnimation(Tool.Stab2)
end
	elseif equipped == true then
		equipped = false
		if sword then
		if sword.Parent ~= nil then
		if sword:findFirstChild("Blade") then
			if sword.Blade:FindFirstChild("Script") ~= nil then
		sword.Blade.Script.Disabled = true
		end
		script.Bow.Value = false
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
		swingWithOut:Destroy()
		--[[swingJump:Destroy()
		swordThrust:Destroy()]]
		ArrowAnim:Destroy()
		leftSlash:Destroy()
		OHSwing:Destroy()
		rightSlash:Destroy()
		rightFast:Destroy()
		leftFast:Destroy()
		stabone:Destroy()
		stabtwo:Destroy()
		end 
	end
	end
	deb = 0
	end
elseif key == "q" or key == "b" or key == "i" then
	if player.PlayerGui.CharMenu.Chatting.Value == false then
player.PlayerGui.CharMenu.Background.Visible = not player.PlayerGui.CharMenu.Background.Visible
end
end
end)
