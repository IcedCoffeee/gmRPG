local mouseDown = false
hook.Add("Think", "gmrpg_mousestuff", function()
	if input.IsMouseDown(MOUSE_RIGHT) && !mouseDown then
		local lookingat = LocalPlayer():GetEyeTrace()
		if lookingat.StartPos:Distance(lookingat.HitPos) > 100 then return false end
		mouseLogic(lookingat.Entity)
		mouseDown = true
	end

	if !input.IsMouseDown(MOUSE_RIGHT) then
		mouseDown = false
	end
end)

function mouseLogic(ent)
	local pos = ent:GetPos():ToScreen()
	local mposx = gui.MouseX()
	local mposy = gui.MouseY()
	if !IsValid(ent) then return false end
	if math.Distance(pos.x, pos.y, mposx, mposy) > 100 then return false end
	if ent:GetClass() !=  "prop_door_rotating" then return false end
	local dmenu = vgui.Create("DMenu", item)
	local usebtn = dmenu:AddOption("Open")
	usebtn:SetIcon("icon16/bullet_go.png")
	dmenu:Open()
	usebtn.DoClick = function()
		net.Start("requestInteract")
			net.WriteEntity(ent)
		net.SendToServer()
	end
end