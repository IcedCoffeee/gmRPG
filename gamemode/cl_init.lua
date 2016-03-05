include("shared.lua")
include("client/hud.lua")
include("client/derma.lua")
include("client/pp.lua")
include("client/merchants.lua")

hook.Add("ShouldDrawLocalPlayer", "ShouldDrawPlayer", function(ply)
		return true
end)

function GM:CreateMove( cmd )

	gui.EnableScreenClicker(true)

	local ang, v, w, x, y

	ang = cmd:GetViewAngles( )

	x, y = gui.MousePos( )

	v, w = ScrW( ) * .5, ScrH( ) * .5

	ang.y = math.deg( math.atan2( v - x, w - y ) )

	if !gui.IsGameUIVisible() then
		cmd:SetViewAngles( ang )
	end
end

zoom = 300
camPos = -60

hook.Add("CalcView","CameraViewAngles",function(ply, pos, angles, fov)

	if input.IsKeyDown(KEY_UP) && !gui.IsGameUIVisible() then
		zoom = zoom - 1
		camPos = camPos + 0.2
	elseif input.IsKeyDown(KEY_DOWN) && !gui.IsGameUIVisible() then
		zoom = zoom + 1
		camPos = camPos - 0.2
	end

	if input.IsKeyDown(KEY_LEFT) && !gui.IsGameUIVisible() then
		zoom = 300
		camPos = -60
	end

	if zoom > 400 then
		zoom = 400
	elseif zoom < 100 then
		zoom = 100
	end

	if camPos < -80 then
		camPos = -80
	elseif camPos > -20 then
		camPos = -20
	end

	local view = {}
	view.origin = pos + Vector(camPos,0,0) + (angles:Up() * zoom) + (angles:Forward() * 10)
	view.angles = Angle(80,0,0)
	view.fov = 90
	return view
end)

displayInventory()