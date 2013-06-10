--CFrame Variables

local CFrame_new = CFrame.new;

--Instancing

local Instance_new = Instance.new;

wait(5)
local c = script.Parent.Parent.Parent.UI:GetChildren()
local sp = script.Parent.LastClicked
local p = game.Players.LocalPlayer
local t = "Double click an Item to use it!"
local type = 0
local bow = false
local magic = false
local class = p.Stats.Class
local check;
local good = false

function checkprof(thing)
  local pro = game.Lighting.GameFiles:FindFirstChild(class.Value)
	print(class.Value)
	local c = pro.WeaponProf:GetChildren()
	for z = 1, #c do
		if c[z].Name == thing.Type.Value then
			good = true
			print(c[z].Name)
		end
	end
	if good == true then
		return true
		else
		script.Parent.Parent.Background.Info.Text = "Your class can't use that."
		magic = false
		bow = false
		return false
	end
	good = false
end

function dothatbro()
	if script.Parent.Class.Value == "Weapon" then
		local item = game.Lighting.Items.Weapons:findFirstChild(script.Parent.Item.Value)
		local place = p.PlayerGui.CharMenu.Background.Equip.UI:findFirstChild(script.Parent.Slot.Value)
		if item ~= nil then
			if item:findFirstChild("Bow") then
				bow = true
				elseif item:FindFirstChild("Magic") then
				magic = true
			end
			if place.Text.Value == "" then
				check = checkprof(item)
				if check == true then
					good = false
					local prebutton = script.Parent.Parent.Parent.UI:findFirstChild(script.Parent.Referer.Value)
					--
					weld = Instance_new("Weld")
					obj = item:clone()
					obj.Parent = p.Character
					weld.Parent = obj.Handle
					weld.Part0 = p.Character[item.Slot.Value]
					weld.Part1 = obj.Handle
					weld.C0 = item.OS.Value
					weld.Name = "Pre"
					--
					place.Text.Value = item.Name
					place.Stats.Value = item.Stats.Value
					place.Image = game.Lighting.Items.ArmorImages:findFirstChild(script.Parent.Type.Value).Texture
					place.Type.Value = script.Parent.Type.Value
					p.PlayerGui.Scripts.Blade.Value = obj
					script.Parent.Parent.Info.Text = t
					script.Parent.Slot.Value = ""
					script.Parent.Item.Value = ""
					script.Parent.Type.Value = ""
					prebutton.Slot.Value = ""
					prebutton.Item.Value = ""
					prebutton.Type.Value = ""
					prebutton.Class.Value = ""
					prebutton.Image = ""
					script.Parent.Referer.Value = ""
					print(tostring(bow))
					if bow == true then
						p.PlayerGui.Scripts.Bow.Value = true	
						elseif magic == true then
						p.PlayerGui.Scripts.Magic.Value = true
					end
				end
				--script.Parent.Parent.Parent.Space.Value = script.Parent.Parent.Parent.Space.Value - 1
				else
				script.Parent.Parent.Info.Text = "You already have a ["..script.Parent.Slot.Value.."] item equipped!"
				bow = false
			end
		end
		elseif script.Parent.Class.Value == "Secondary" then
		local item = game.Lighting.Items.Weapons:findFirstChild(script.Parent.Item.Value)
		local place = p.PlayerGui.CharMenu.Background.Equip.UI:findFirstChild(script.Parent.Slot.Value)
		if item ~= nil then
			if place.Text.Value == "" then
				local prebutton = script.Parent.Parent.Parent.UI:findFirstChild(script.Parent.Referer.Value)
				--
				weld = Instance_new("Weld")
				obj = item:clone()
				obj.Parent = p.Character
				weld.Parent = obj.Handle
				weld.Part0 = p.Character[item.Slot.Value]
				weld.Part1 = obj.Handle
				weld.C0 = item.OS.Value
				weld.Name = "Pre"
				--
				place.Text.Value = item.Name
				place.Stats.Value = item.Stats.Value
				place.Image = game.Lighting.Items.ArmorImages:findFirstChild(script.Parent.Type.Value).Texture
				place.Type.Value = script.Parent.Type.Value
				script.Parent.Parent.Info.Text = t
				script.Parent.Slot.Value = ""
				script.Parent.Item.Value = ""
				script.Parent.Type.Value = ""
				prebutton.Slot.Value = ""
				prebutton.Item.Value = ""
				prebutton.Type.Value = ""
				prebutton.Class.Value = ""
				prebutton.Image = ""
				script.Parent.Referer.Value = ""
				if obj:FindFirstChild("Quiver") == nil then
					p.PlayerGui.Scripts.OffHand.Value = obj
					else
					p.PlayerGui.Scripts.Bow.Arrows.Value = true
				end
				--script.Parent.Parent.Parent.Space.Value = script.Parent.Parent.Parent.Space.Value - 1
				else
				script.Parent.Parent.Info.Text = "You already have a ["..script.Parent.Slot.Value.."] item equipped!"
			end
		end
		
		elseif script.Parent.Class.Value == "Potion" then
		local item = game.Lighting.Items.Potions:findFirstChild(script.Parent.Item.Value)
		if item ~= nil then
			local stat = game.Players.LocalPlayer.Stats:FindFirstChild(item.Value.Value)
			if stat ~= nil then
				if stat.Value <= stat["Max"..stat.Name].Value then
					if stat.Value + item.Amount.Value <= stat["Max"..stat.Name].Value	then
						stat.Value = stat.Value + item.Amount.Value
						local prebutton = script.Parent.Parent.Parent.UI:findFirstChild(script.Parent.Referer.Value)
						script.Parent.Parent.Info.Text = t
						script.Parent.Slot.Value = ""
						script.Parent.Item.Value = ""
						script.Parent.Type.Value = ""
						prebutton.Slot.Value = ""
						prebutton.Item.Value = ""
						prebutton.Type.Value = ""
						prebutton.Class.Value = ""
						prebutton.Image = ""
						script.Parent.Referer.Value = ""
						--script.Parent.Parent.Parent.Space.Value = script.Parent.Parent.Parent.Space.Value - 1
					end
				end
			end
		end
		elseif script.Parent.Class.Value == "Food" then
		local item = game.Lighting.Items.Food:findFirstChild(script.Parent.Item.Value)
		if item ~= nil then	
			local addb = game.Lighting.Items.Food.stat:clone()
			addb.Name = script.Parent.Item.Value
			addb.Duration.Value = item.Duration.Value
			addb.OT.Value = true
			addb.Type.Value = 4
			addb.Value = item.Amount.Value
			addb.Parent = game.Players.LocalPlayer.Stats.Buffs
			local prebutton = script.Parent.Parent.Parent.UI:findFirstChild(script.Parent.Referer.Value)
			script.Parent.Parent.Info.Text = t
			script.Parent.Slot.Value = ""
			script.Parent.Item.Value = ""
			script.Parent.Type.Value = ""
			prebutton.Slot.Value = ""
			prebutton.Item.Value = ""
			prebutton.Type.Value = ""
			prebutton.Class.Value = ""
			prebutton.Image = ""
			script.Parent.Referer.Value = ""
			--script.Parent.Parent.Parent.Space.Value = script.Parent.Parent.Parent.Space.Value - 1
		end
		elseif script.Parent.Class.Value == "Armor" then print("Armor")
		local item = game.Lighting.Items.Armor:findFirstChild(script.Parent.Item.Value)
		local place = p.PlayerGui.CharMenu.Background.Equip.UI:findFirstChild(script.Parent.Slot.Value)
		local prebutton = script.Parent.Parent.Parent.UI:findFirstChild(script.Parent.Referer.Value) print("Test")
		if item ~= nil then
			if place.Text.Value == "" then
				weld = Instance_new("Weld")
				obj = item:clone()
				obj.Parent = p.Character
				weld = Instance_new("Weld", obj)
				if item.Slot.Value == "Legs" then
					weld.Part0 = p.Character["Left Leg"]
					weld.Part1 = obj.Main
					obj2 = item:clone()
					obj2.Parent = obj
					weld2 = Instance_new("Weld", obj2)
					weld2.Part0 = p.Character["Right Leg"]
					weld2.Part1 = obj2.Main
					elseif item.Slot.Value == "Torso" then
					weld.Part0 = p.Character.Torso
					weld.Part1 = obj.Main
					elseif item.Slot.Value == "Head" then
					weld.Part0 = p.Character.Head
					weld.Part1 = obj.Main
					weld.C0 = CFrame_new(0,.32,0)
				end print("Test2")
				place.Text.Value = item.Name
				place.Stats.Value = item.Stats.Value
				place.Image = game.Lighting.Items.ArmorImages:findFirstChild(script.Parent.Type.Value).Texture
				place.Type.Value = script.Parent.Type.Value
				script.Parent.Parent.Info.Text = t
				script.Parent.Slot.Value = ""
				script.Parent.Item.Value = ""
				script.Parent.Type.Value = ""
				prebutton.Slot.Value = ""
				prebutton.Item.Value = ""
				prebutton.Type.Value = ""
				prebutton.Class.Value = ""
				prebutton.Image = ""
				script.Parent.Referer.Value = ""
			end print("Test3")
		end print("Test4")
		elseif item == nil then
		script.Parent.Parent.Info.Text = "You have nothing selected!"
		wait(1)
		script.Parent.Parent.Info.Text = t
	end 
	bow = false
end

function addstuff(child)
	if child.Item.Value ~= "" then
		script.Parent.Parent.Info.Text = child.Item.Value
	end
	script.Parent.Item.Value = child.Item.Value
	script.Parent.Slot.Value = child.Slot.Value
	script.Parent.Type.Value = child.Type.Value
	script.Parent.Class.Value = child.Class.Value
	script.Parent.Referer.Value = child.Name	
end

for a = 1, #c do
	local ch = c[a]
	ch.MouseButton1Down:connect(function ()
		addstuff(ch)
		if sp.Value == ch.Name then
			-- #########################
			dothatbro()
			-- #########################
			else
			if sp.Value ~= "" then
				script.Parent.Parent.Parent.UI:FindFirstChild(sp.Value).BorderSizePixel = 0
			end
			sp.Value = ch.Name
			ch.BorderSizePixel = 1
		end
	end)
end
