local channel1 = game.Lighting.GameFiles.ChatChannels.World
local l5 = script.Parent.L5
local l4 = script.Parent.L4
local l3 = script.Parent.L3
local l2 = script.Parent.L2
local l1 = script.Parent.L1
channel1.Changed:connect(function (c)
l5.Text = l4.Text
l4.Text = l3.Text
l3.Text = l2.Text
l2.Text = l1.Text
l1.Text = channel1.Value
end)
