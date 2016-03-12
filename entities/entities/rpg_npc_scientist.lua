AddCSLuaFile()

ENT.Base            = "rpg_npc_employer_base"
ENT.Type            = "ai"

ENT.PrintName       = "NPC Lab Employer"
ENT.Author          = "Almighty Laxz"
ENT.Contact         = ""
ENT.Purpose         = ""
ENT.Instructions    = ""
ENT.Category        = "gmRPG"

ENT.Spawnable       = true

// How much money is given for working
ENT.energyRequired  = 3
ENT.intRequired     = 20

ENT.wage            = 80

ENT.outcomeBonus      = {}
ENT.outcomeBonus[0]   = 0
ENT.outcomeBonus[1]   = 10
ENT.outcomeBonus[2]   = 20

ENT.outcomes        = {}
ENT.outcomes[0]     = "You do some average experiments." .. "\nMoney + " .. ENT.wage * 3 .. "\nEnergy - " .. ENT.energyRequired
ENT.outcomes[1]     = "You test a scientific theory." .. "\nMoney + " .. ENT.wage * 3 + ENT.outcomeBonus[1] .. "\nEnergy - " .. ENT.energyRequired
ENT.outcomes[2]     = "You make a breakthrough in your research." .. "\nMoney + " .. ENT.wage * 3 + ENT.outcomeBonus[2] .. "\nEnergy - " .. ENT.energyRequired

// Text that will be passed to the client derma
local employerText = "Want to do an experiment? \nRequires 15 Intelligence\nWage: $80/hour"
local acceptText = "Get to work"
local titleText = "Lab Scientist"

if SERVER then
    function ENT:Initialize( )
    	self:SetModel( "models/Kleiner.mdl" )
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
    		net.Start("rpgEmploymentDermaStart")
                net.WriteString(employerText)
                net.WriteString(acceptText)
                net.WriteString(titleText)
                net.WriteEntity(self)
    		net.Send(Activator)
    		timer.Simple(1, function()
    			Activator.cantUse = false
    		end)
    	end
    end
end
