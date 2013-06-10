--UDim2 Variables
local UDim2_new = UDim2.new;

local deb = 0
local up = false
local clicked = false 
local l = script.Parent.lockpick
local ready = false
local anim = script.Parent.Animating
local player = game.Players.LocalPlayer
script.Parent.DLock.Text = "Difficulty: "..script.Parent.Parent.Difficulty.Value
local dtab = {}

player.LockPick.Changed:connect(function ()
  if player.LockPick.Value ~= 0 then
  	script.Parent.NumP.Text = "LockPicks: "..player.LockPick.Value
		else
		script.Parent.NumP.Text = "You have no LockPicks!"
		wait(1)
		game.Players.LocalPlayer.PlayerGui.LockPicking:Destroy()
	end
end)

local mouse = game.Players.LocalPlayer:GetMouse()
mouse.Move:connect(function ()
	if mouse.X >= 300 and mouse.X <= 615 then
		if script.Parent.Animating.Value == false then
			l.Position = UDim2_new(0,(mouse.X - 350),0,300)
end end end)

script.Parent.Parent.Num.Changed:connect(function()
	Door = script.Parent.Parent.Door.Value
	if script.Parent.Parent.Num.Value >= script.Parent.Parent.DNum.Value then
		Door.Locked.Value = false
		game.Players.LocalPlayer.PlayerGui.LockPicking:Destroy()
end end)

local function start(v, wat)
	local spos = v.Position
	local speed;
	local wt;
	local dpos;
	local spos;
	if script.Parent.Parent.Difficulty.Value == "Easy" then
		speed = 1
		wt = 1
		elseif script.Parent.Parent.Difficulty.Value == "Average" then
		speed = .6
		wt = .5
		elseif script.Parent.Parent.Difficulty.Value == "Hard" then
		speed = .3
		wt = .25
	end
	if deb == 0 then
		if up == false then
			up = true
			deb = 0
			spos = v.Position
			dpos = spos - UDim2_new(0,0,0,70)
			anim.Value = true
			l:TweenPosition(l.Position - UDim2_new(0,0,0,15), "Out", "Quad", .3, true, nil)
			wait(.3)
			v:TweenPosition(dpos, "Out", "Quad", speed)
			ready = true
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
				v.Parent.Parent.Num.Value = v.Parent.Parent.Num.Value + 1
				dtab[wat] = true
				else
				if game.Players.LocalPlayer.LockPick.Value > 0 then
					game.Players.LocalPlayer.LockPick.Value = game.Players.LocalPlayer.LockPick.Value - 1
				end
			end
		end
		else
		if game.Players.LocalPlayer.LockPick.Value > 0 then
			game.Players.LocalPlayer.LockPick.Value = game.Players.LocalPlayer.LockPick.Value - 1
		end
	end
end

for i,v in pairs(script.Parent:GetChildren()) do
	if v.ClassName == "ImageButton" or v.ClassName == "TextButton" then
		v.MouseButton1Down:connect(function ()
			if v.Name == "X" then
				script.Parent.Parent:Destroy()
			end
			if v.ClassName == "ImageButton" then
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
