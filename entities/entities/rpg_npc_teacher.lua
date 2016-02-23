AddCSLuaFile()

ENT.Base            = "rpg_npc_employer_base"
ENT.Type            = "ai"

ENT.PrintName       = "NPC Teacher"
ENT.Author          = "Almighty Laxz"
ENT.Contact         = ""
ENT.Purpose         = ""
ENT.Instructions    = ""
ENT.Category        = "gmRPG"

ENT.Spawnable       = true

local teacherText = "Looking to further your knowledge? \n\n Money - 50 \n Energy - 2"
local acceptText = "Study"

if SERVER then
    function ENT:Initialize( )
    	self:SetModel( "models/mossman.mdl" )
    	self:SetHullType( HULL_HUMAN )
    	self:SetHullSizeNormal( )
    	self:SetNPCState( NPC_STATE_SCRIPT )
    	self:SetSolid(  SOLID_BBOX )
    	self:CapabilitiesAdd( CAP_ANIMATEDFACE, CAP_TURN_HEAD )
    	self:SetUseType( SIMPLE_USE )
    	self:DropToFloor()
    end

    function ENT:AcceptInput( Name, Activator, Caller )

    	if !Activator.cantUse and Activator:IsPlayer() then
    		Activator.cantUse = true
    		net.Start( "rpgSchoolDermaStart" )
                net.WriteString(teacherText)
                net.WriteString(acceptText)
                net.WriteEntity(self)
    		net.Send( Activator )
    		timer.Simple(1, function()
    			Activator.cantUse = false
    		end)
    	end
    end
end
