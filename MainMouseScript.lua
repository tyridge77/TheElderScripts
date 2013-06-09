wait(5)
local p = game.Players.LocalPlayer
local mouse = p:GetMouse()
local target;
local keys = {"z", "x", "c", "f", "r"}
local keyDeb = 0
local ebutton = script.Parent.EDisplay
local ecount = 0
local rDeb = 0
local lootgui = game.Lighting.LootMenu
local lpgui = game.Lighting.LockPicking
local cursor = p.PlayerGui.MouseDisplay.Cursor
local gbimg = "http://www.roblox.com/asset/?id=107313698"
local pimg = "http://www.roblox.com/asset/?id=116627910"

function checkdistance(obj)
  if (p.Character.Torso.Position - obj.Position).magnitude <= 7 then
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
	local sch = source:GetChildren()
	for q = 1, #sch do
		wait()
		local tloc = findemptyloot(d)
		tloc.Image = game.Lighting.Items.ArmorImages:FindFirstChild(sch[q].Img.Value).Texture
		tloc.info.Text = sch[q].Name
		tloc.Type.Value = sch[q].Type.Value
		if sch[q].Value ~= 0 then
			tloc.Amt.Value = sch[q].Value
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
	local tempchest = lootgui:clone()
	if t.Parent.Locked.Value == true then
		local temppick = lpgui:clone()
		temppick.Door.Value = t.Parent
		temppick.Difficulty.Value = t.Parent.Locked.DLock.Value
		temppick.Parent = p.PlayerGui
	else
		local lmt = lootgui:clone()
		populate(t.Parent.TChest, lmt.Main.background)
		lmt.Parent = p.PlayerGui
	end
	else
		ecount = 0
		error("I'm too far away!", 1)
	end
end

function door(var)
	if checkdistance(var) == true then
if var.Parent.Locked.Value == true then
local lpgui = game.Lighting.LockPicking:clone()
lpgui.Door.Value = var.Parent
lpgui.Difficulty.Value = var.Parent.Locked.DLock.Value
lpgui.Parent = p.PlayerGui
else
local goto = var.Parent:findFirstChild("Go To")
p.Character.Torso.CFrame = (goto.CFrame + Vector3.new(0,5,0))
--d = Instance.new("StringValue", p.Location)
p.Location.Value = var.Parent.Place.Value
end
	else
	ecount = 0
	error("I'm too far away!", 1)	
end
end

mouse.Button1Down:connect(function ()
	cursor.Visible = false
	if mouse.Target then
		if mouse.Target.Name == "Schmeh" then
--[[			mouse.Target.BrickColor = BrickColor.new("Really red")
			ecount = 0
			error("Button 1 Pressed", 1)]]
		end
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
--		if mouse.Target.Name == "Schmeh" then
--			mouse.Target.BrickColor = BrickColor.new("Black")
			if tgt.Parent:FindFirstChild("TChest") ~= nil then
				treasure(tgt)
			elseif tgt.Parent:FindFirstChild("Door") ~= nil then
				door(tgt)
			end
	end
end rDeb = 0 end)

mouse.KeyDown:connect(function (key)
	--print("Key = "..string.byte(key))
	if keyDeb ==0 then
		keyDeb = 1
	for z = 1, #keys do
		if key == keys[z] then
			local button = script.Parent.KeyBinds:findFirstChild(tostring(key))
			if button ~= nil then
			if button:findFirstChild("begin") ~= nil then
				button.begin.Disabled = false
			end
		end
	end
	end
	keyDeb = 0 
end end)

mouse.Move:connect(function ()
	if mouse.Target ~= nil then
		if mouse.Target.Parent:FindFirstChild("TChest") ~= nil then
			local temptarg = mouse.Target
			cursor.Image = gbimg
			cursor.Visible = true
			cursor.Display2.Visible = false
			--[[print("Mouse X:"..mouse.X)
			print("Mouse Y:"..mouse.Y)]]
			cursor.Position = UDim2.new(0,(mouse.X+40),0,(mouse.Y-10))
			cursor.Display.Text = temptarg.Parent.Name
		elseif mouse.Target.Parent:FindFirstChild("Humanoid") ~= nil then
			local tempplayer = game.Players:FindFirstChild(mouse.Target.Parent.Name)
			if tempplayer ~= nil then
			cursor.Image = pimg
			cursor.Visible = true
			cursor.Display2.Visible = true
			cursor.Position = UDim2.new(0,(mouse.X+40),0,(mouse.Y-10))
			cursor.Display.Text = tempplayer.Stats.CharacterName.Value..", Level "..tostring(tempplayer.Stats.Level.Value).." "..tempplayer.Stats.Class.Value
			cursor.Display2.Text = "Health: "..tostring(math.floor(tempplayer.Stats.Health.Value)).."/"..tostring(tempplayer.Stats.Health.MaxHealth.Value)
			else
			cursor.Visible = false
			end
		else
			cursor.Visible = false
end end end)
