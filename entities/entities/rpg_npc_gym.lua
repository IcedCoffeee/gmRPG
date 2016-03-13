AddCSLuaFile()

ENT.Base            = "rpg_npc_employer_base"
ENT.Type            = "ai"

ENT.PrintName       = "NPC Gym Owner"
ENT.Author          = "Almighty Laxz"
ENT.Contact         = ""
ENT.Purpose         = ""
ENT.Instructions    = ""
ENT.Category        = "gmRPG"

ENT.Spawnable       = true

ENT.energyRequired               = 2

ENT.cost                         = 50

ENT.outcomeStrength          = {}
ENT.outcomeStrength[0]       = 1
ENT.outcomeStrength[1]       = 2
ENT.outcomeStrength[2]       = 3

ENT.outcomes                 = {}
ENT.outcomes[0]              = "You lift weights." .. "\nMoney - " .. ENT.cost .. "\nEnergy - " .. ENT.energyRequired .. "\nStrength + " .. ENT.outcomeStrength[0]
ENT.outcomes[1]              = "You can feel the burn." .. "\nMoney - " .. ENT.cost .. "\nEnergy - " .. ENT.energyRequired.. "\nStrength + " .. ENT.outcomeStrength[1]
ENT.outcomes[2]              = "You are put through vigarous training." .. "\nMoney - " .. ENT.cost .. "\nEnergy - " .. ENT.energyRequired.. "\nStrength + " .. ENT.outcomeStrength[2]

ENT.teacherText              = "Wanna muscle up? \n\n Money - " .. ENT.cost .. " \n Energy - " .. ENT.energyRequired
ENT.acceptText               = "Work out"
ENT.titleText                = "Gym Owner"

if SERVER then
    function ENT:Initialize( )
    	self:SetModel( "models/odessa.mdl" )
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
            net.Start("rpgDialogueDermaStart")
                net.WriteString(self.titleText)
                net.WriteString(self.teacherText)
                net.WriteString(self.acceptText)
                net.WriteString("No thanks")
                net.WriteString("net.Start('requestGym') net.WriteEntity(npcEnt) net.SendToServer()")
                net.WriteString("close")
                net.WriteEntity(self)
            net.Send(Activator)
    		net.Send( Activator )
    		timer.Simple(1, function()
    			Activator.cantUse = false
    		end)
    	end
    end
end
