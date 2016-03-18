AddCSLuaFile()

ENT.Base                         = "rpg_npc_employer_base"
ENT.Type                         = "ai"

ENT.PrintName                    = "NPC Teacher"
ENT.Author                       = "Almighty Laxz"
ENT.Contact                      = ""
ENT.Purpose                      = ""
ENT.Instructions                 = ""
ENT.Category                     = "gmRPG"

ENT.Spawnable                    = true

ENT.energyRequired               = 1

ENT.cost                         = 50

ENT.outcomeIntelligence          = {}
ENT.outcomeIntelligence[0]       = 1
ENT.outcomeIntelligence[1]       = 2
ENT.outcomeIntelligence[2]       = 3

ENT.outcomes                     = {}
ENT.outcomes[0]                  = "You study at an average pace." .. "\nMoney - " .. ENT.cost .. "\nEnergy - " .. ENT.energyRequired .. "\nIntelligence + " .. ENT.outcomeIntelligence[0]
ENT.outcomes[1]                  = "You study hard." .. "\nMoney - " .. ENT.cost .. "\nEnergy - " .. ENT.energyRequired.. "\nIntelligence + " .. ENT.outcomeIntelligence[1]
ENT.outcomes[2]                  = "The teacher praises your hard work." .. "\nMoney - " .. ENT.cost .. "\nEnergy - " .. ENT.energyRequired.. "\nIntelligence + " .. ENT.outcomeIntelligence[2]

ENT.teacherText = "Looking to further your knowledge? \n\n Money - " .. ENT.cost .. " \n Energy - " .. ENT.energyRequired
ENT.acceptText = "Study"
ENT.titleText = "Teacher"

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
            net.Start("rpgDialogueDermaStart")
                net.WriteString(self.titleText)
                net.WriteString(self.teacherText)
                net.WriteString(self.acceptText)
                net.WriteString("No thanks")
                net.WriteString("net.Start('requestSchool') net.WriteEntity(npcEnt) net.SendToServer()")
                net.WriteString("close")
                net.WriteEntity(self)
            net.Send(Activator)
    		timer.Simple(1, function()
    			Activator.cantUse = false
    		end)
    	end
    end
end
