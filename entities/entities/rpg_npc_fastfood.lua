AddCSLuaFile()

ENT.Base                            = "rpg_npc_employer_base"
ENT.Type                            = "ai"

ENT.PrintName                       = "NPC Fastfood Employer"
ENT.Author                          = "Almighty Laxz"
ENT.Contact                         = ""
ENT.Purpose                         = ""
ENT.Instructions                    = ""
ENT.Category                        = "gmRPG"

ENT.Spawnable                       = true

ENT.levels                          = {}

ENT.levels[1]                       = {}
ENT.levels[1].name                  = "Frycook"
ENT.levels[1].energyRequired        = 2
ENT.levels[1].intelligenceRequired  = 5
ENT.levels[1].strengthRequired      = 5
ENT.levels[1].experienceRequired    = 0
ENT.levels[1].wage                  = 12
ENT.levels[1].outcomeBonus          = {}
ENT.levels[1].outcomeBonus[0]       = 0
ENT.levels[1].outcomeBonus[1]       = 3
ENT.levels[1].outcomeBonus[2]       = 8
ENT.levels[1].outcomes              = {}
ENT.levels[1].outcomes[0]           = "You fry the fries." .. "\nMoney + " .. ENT.levels[1].wage * 3 .. "\nEnergy - " .. ENT.levels[1].energyRequired
ENT.levels[1].outcomes[1]           = "You fry fries with skill and finesse." .. "\nMoney + " .. ENT.levels[1].wage * 3 + ENT.levels[1].outcomeBonus[1] .. "\nEnergy - " .. ENT.levels[1].energyRequired
ENT.levels[1].outcomes[2]           = "The boss is impressed with your hard work." .. "\nMoney + " .. ENT.levels[1].wage * 3 + ENT.levels[1].outcomeBonus[2] .. "\nEnergy - " .. ENT.levels[1].energyRequired

ENT.levels[2]                       = {}
ENT.levels[2].name                  = "Patty Flipper"
ENT.levels[2].energyRequired        = 2
ENT.levels[2].intelligenceRequired  = 5
ENT.levels[2].strengthRequired      = 5
ENT.levels[2].experienceRequired    = 3
ENT.levels[2].wage                  = 14
ENT.levels[2].outcomeBonus          = {}
ENT.levels[2].outcomeBonus[0]       = 0
ENT.levels[2].outcomeBonus[1]       = 3
ENT.levels[2].outcomeBonus[2]       = 8
ENT.levels[2].outcomes              = {}
ENT.levels[2].outcomes[0]           = "You flip patties at an average pace." .. "\nMoney + " .. ENT.levels[2].wage * 3 .. "\nEnergy - " .. ENT.levels[2].energyRequired
ENT.levels[2].outcomes[1]           = "You flip patties like there's no tomorrrow." .. "\nMoney + " .. ENT.levels[2].wage * 3 + ENT.levels[2].outcomeBonus[1] .. "\nEnergy - " .. ENT.levels[2].energyRequired
ENT.levels[2].outcomes[2]           = "The boss is impressed with your hard work." .. "\nMoney + " .. ENT.levels[2].wage * 3 + ENT.levels[2].outcomeBonus[2] .. "\nEnergy - " .. ENT.levels[2].energyRequired

ENT.levels[3]                       = {}
ENT.levels[3].name                  = "Pickle Placer"
ENT.levels[3].energyRequired        = 2
ENT.levels[3].intelligenceRequired  = 5
ENT.levels[3].strengthRequired      = 5
ENT.levels[3].experienceRequired    = 6
ENT.levels[3].wage                  = 16
ENT.levels[3].outcomeBonus          = {}
ENT.levels[3].outcomeBonus[0]       = 0
ENT.levels[3].outcomeBonus[1]       = 3
ENT.levels[3].outcomeBonus[2]       = 8
ENT.levels[3].outcomes              = {}
ENT.levels[3].outcomes[0]           = "You place pickles real good." .. "\nMoney + " .. ENT.levels[3].wage * 3 .. "\nEnergy - " .. ENT.levels[3].energyRequired
ENT.levels[3].outcomes[1]           = "You place pickles to perfection." .. "\nMoney + " .. ENT.levels[3].wage * 3 + ENT.levels[3].outcomeBonus[1] .. "\nEnergy - " .. ENT.levels[3].energyRequired
ENT.levels[3].outcomes[2]           = "The boss is impressed with your hard work." .. "\nMoney + " .. ENT.levels[3].wage * 3 + ENT.levels[3].outcomeBonus[2] .. "\nEnergy - " .. ENT.levels[3].energyRequired

ENT.levels[4]                       = {}
ENT.levels[4].name                  = "Ingredient Integrator"
ENT.levels[4].energyRequired        = 2
ENT.levels[4].intelligenceRequired  = 5
ENT.levels[4].strengthRequired      = 5
ENT.levels[4].experienceRequired    = 9
ENT.levels[4].wage                  = 18
ENT.levels[4].outcomeBonus          = {}
ENT.levels[4].outcomeBonus[0]       = 0
ENT.levels[4].outcomeBonus[1]       = 3
ENT.levels[4].outcomeBonus[2]       = 8
ENT.levels[4].outcomes              = {}
ENT.levels[4].outcomes[0]           = "Many ingredients were integrated. Good job." .. "\nMoney + " .. ENT.levels[4].wage * 3 .. "\nEnergy - " .. ENT.levels[4].energyRequired
ENT.levels[4].outcomes[1]           = "Assortments of ingredients fly around, miraculously forming food." .. "\nMoney + " .. ENT.levels[4].wage * 3 + ENT.levels[4].outcomeBonus[1] .. "\nEnergy - " .. ENT.levels[4].energyRequired
ENT.levels[4].outcomes[2]           = "You make burgers super fast." .. "\nMoney + " .. ENT.levels[4].wage * 3 + ENT.levels[4].outcomeBonus[2] .. "\nEnergy - " .. ENT.levels[4].energyRequired

ENT.levels[5]                       = {}
ENT.levels[5].name                  = "Order Taker"
ENT.levels[5].energyRequired        = 2
ENT.levels[5].intelligenceRequired  = 5
ENT.levels[5].strengthRequired      = 5
ENT.levels[5].experienceRequired    = 12
ENT.levels[5].wage                  = 20
ENT.levels[5].outcomeBonus          = {}
ENT.levels[5].outcomeBonus[0]       = 0
ENT.levels[5].outcomeBonus[1]       = 3
ENT.levels[5].outcomeBonus[2]       = 8
ENT.levels[5].outcomes              = {}
ENT.levels[5].outcomes[0]           = "You take orders from fat people." .. "\nMoney + " .. ENT.levels[5].wage * 3 .. "\nEnergy - " .. ENT.levels[5].energyRequired
ENT.levels[5].outcomes[1]           = "Rush hour. You served many customers." .. "\nMoney + " .. ENT.levels[5].wage * 3 + ENT.levels[5].outcomeBonus[1] .. "\nEnergy - " .. ENT.levels[5].energyRequired
ENT.levels[5].outcomes[2]           = "Your order taking skills are unmatched." .. "\nMoney + " .. ENT.levels[5].wage * 3 + ENT.levels[5].outcomeBonus[2] .. "\nEnergy - " .. ENT.levels[5].energyRequired

// Text that will be passed to the client derma
ENT.employerText                    = "Hello, looking for work? \n\nWage: $" .. ENT.levels[1].wage .. "/hour"
ENT.returningText                   = "Hey, there's one of my many employees! Time to get to work? \n\nWage: $"
ENT.promotionText                   = "I guess you've been here long enough... Promotion for you."
ENT.promotionFailText               = "You gotta work here longer for a promotion."
ENT.acceptText                      = "Work"
ENT.titleText                       = "Fastfood Employer"
ENT.hiredText                       = "Congratulations, you meet our (non-existent) standards. You're hired. \n\nYou are now a: " .. ENT.levels[1].name

ENT.shortName                       = "fastfood"

if SERVER then
    function ENT:Initialize( )
    	self:SetModel( "models/breen.mdl" )
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
            if tonumber(Activator:getEmployment(self.shortName)) == 0 then
                net.Start("rpgDialogueDermaStart")
                    net.WriteString(self.titleText)
                    net.WriteString(self.employerText)
                    net.WriteString("Apply for job")
                    net.WriteString("No thanks")
                    net.WriteString("net.Start('requestEmployment') net.WriteEntity(npcEnt) net.SendToServer()")
                    net.WriteString("close")
                    net.WriteEntity(self)
                net.Send(Activator)
            else
    		    net.Start("rpgEmploymentDermaStart")
                    net.WriteString(self.returningText .. self.levels[tonumber(Activator:getEmployment(self.shortName))].wage ..
                        "\n\n Job: " .. self.levels[tonumber(Activator:getEmployment(self.shortName))].name)
                    net.WriteString(self.acceptText)
                    net.WriteString(self.titleText)
                    net.WriteEntity(self)
    		    net.Send(Activator)  
            end
            timer.Simple(1, function()
                Activator.cantUse = false
            end)
    	end
    end
end
