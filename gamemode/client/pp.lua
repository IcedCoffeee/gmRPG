net.Receive("rpgDrunkify", function(len, ply)
    hook.Add("HUDPaint", "rpgDrunkFX", function() DrawMotionBlur(0.4, 0.8, 0.01) end)
end)

net.Receive("rpgUndrunkify", function(len, ply)
    hook.Remove("HUDPaint", "rpgDrunkFX")
end)
