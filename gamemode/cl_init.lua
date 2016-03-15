gmRPG = gmRPG or {}

include("shared.lua")
include("client/hud.lua")
include("client/derma/derma.lua")
include("client/derma/dialogue.lua")
include("client/derma/merchants.lua")
include("client/derma/inventory.lua")
include("client/pp.lua")
include("client/mouse.lua")
include("shared/items.lua")


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
		rpgZoomIn()
	elseif input.IsKeyDown(KEY_DOWN) && !gui.IsGameUIVisible() then
		rpgZoomOut()
	end

	if input.IsKeyDown(KEY_LEFT) && !gui.IsGameUIVisible() then
		rpgZoomReset()
	end

	if input.IsMouseDown(MOUSE_WHEEL_UP) && !gui.IsGameUIVisible() then
		rpgZoomIn()
	elseif input.IsMouseDown(MOUSE_WHEEL_DOWN) && !gui.IsGameUIVisible() then
		rpgZoomOut()
	end

	local view = {}
	view.origin = pos + Vector(camPos,0,0) + (angles:Up() * zoom) + (angles:Forward() * 10)
	view.angles = Angle(80,0,0)
	view.fov = 90
	return view
end)

// stops overlapping inventory frames when screwing with derma file
if !inventoryVisible then
	displayInventory()
	displayControls()
end

function rpgZoomIn()
	zoom = math.Clamp(zoom - 1, 100, 400)
	camPos = math.Clamp(camPos + 0.2, -80, -20)
end

function rpgZoomOut()
	zoom = math.Clamp(zoom + 1, 100, 400)
	camPos = math.Clamp(camPos - 0.2, -80, -20)
end

function rpgZoomReset()
	zoom = 300
	camPos = -60
end

/*/////////////////////////////////////////
            Building Roof Fading
/////////////////////////////////////////*/

hook.Add("InitPostEntity", "rpgAddRoof", function()
	roofTable = {}
	for k,v in pairs(ents.GetAll()) do
		if v:GetClass() == "func_brush" then
			v:SetRenderMode(RENDERMODE_TRANSALPHA)
			table.insert(roofTable, v)
		end
	end
end)

hook.Add("Think", "rpgRoofAlpha", function()
	for _,v in pairs(roofTable) do
		local trans = 0
		if LocalPlayer():GetPos():Distance(v:GetPos()) < 700 then trans = 120 end
		local newAlpha = math.Clamp(LocalPlayer():GetPos():Distance(v:GetPos()) / 2 - trans, 0, 255)
		// gets rid of low alpha roof
		if newAlpha < 50 then newAlpha = 0 end
		v:SetColor(Color(255, 255, 255, newAlpha))
	end
end)