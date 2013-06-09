local channel1 = game.Lighting.GameFiles.ChatChannels.World
local mouse = game.Players.LocalPlayer:GetMouse()
local deb = 0

mouse.KeyDown:connect(function (k)
  if string.byte(k) == 13 then
	if game.Players.LocalPlayer.PlayerGui.CharMenu.Chatting.Value == true then
		if deb == 0 then
			deb = 1
channel1.Value = game.Players.LocalPlayer.Stats.CharacterName.Value..": "..script.Parent.Parent.Input.Text
wait(5)
end
deb = 0
end
	elseif string.byte(k) == 92 then
		if game.Players.LocalPlayer.PlayerGui:FindFirstChild("CharMenu") then
	script.Parent.Parent.Parent.Visible = not script.Parent.Parent.Parent.Visible
	if script.Parent.Parent.Parent.Visible == true then
		print'visible'
	game.Players.LocalPlayer.PlayerGui.CharMenu.Chatting.Value = true
	else
		print'not visible'
		--script.Parent.Parent.BackgroundTransparency = 0.5
	game.Players.LocalPlayer.PlayerGui.CharMenu.Chatting.Value = false
	end end end end)
