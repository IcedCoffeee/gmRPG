AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
	self:SetModel( "models/props/de_inferno/bed.mdl" )
	self:PhysicsInit( SOLID_NONE )
	self:SetMoveType( MOVETYPE_NONE )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetColor( Color(255, 255, 255, 255) )
	self:SetUseType( SIMPLE_USE )
end

<<<<<<< HEAD
if SERVER then
	function ENT:Use( Activator, Caller )
		if !Activator.cantUseBed and Activator:IsPlayer() and !Activator.cantSleep then
			Activator.cantUseBed = true
			//Activator.cantSleep = true
			setPlayerEnergy(Activator, 10)
			Activator:Lock()
			Activator:ScreenFade(SCREENFADE.OUT, Color(0,0,0), 1, 3 )
			timer.Simple(3, function()
				Activator.cantUseBed = false
				Activator:ChatPrint("You awake feeling well rested")
				if Activator:Health() < 100 then Activator:SetHealth(Activator:Health() + 10) end
				Activator:UnLock()
				Activator.coffeeDrank = 0
			end)
			/*timer.Simple(120, function()
				Activator.cantSleep = false
			end)
		else
			Activator:ChatPrint("You can't sleep yet!")*/
		end
=======
function ENT:Use( Activator, Caller )
	if !Activator.cantUseBed and Activator:IsPlayer() and !Activator.cantSleep then
		Activator.cantUseBed = true
		//Activator.cantSleep = true
		Activator:setEnergy(10)
		Activator:Lock()
		Activator:ScreenFade(SCREENFADE.OUT, Color(0,0,0), 1, 3 )
		timer.Simple(3, function()
			Activator.cantUseBed = false
			Activator:ChatPrint("You awake feeling well rested")
			if Activator:Health() < 100 then Activator:SetHealth(Activator:Health() + 10) end
			Activator:UnLock()
			Activator.coffeeDrank = 0
		end)
		/*timer.Simple(120, function()
			Activator.cantSleep = false
		end)
	else
		Activator:ChatPrint("You can't sleep yet!")*/
>>>>>>> refs/remotes/origin/pr/10
	end
end
