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

ENT.levels                          = {}

ENT.levels[1]                       = {}
ENT.levels[1].name                  = "Lab Rat"
ENT.levels[1].energyRequired        = 3
ENT.levels[1].intelligenceRequired  = 20
ENT.levels[1].strengthRequired      = 5
ENT.levels[1].experienceRequired    = 0
ENT.levels[1].wage                  = 40
ENT.levels[1].outcomeBonus          = {}
ENT.levels[1].outcomeBonus[0]       = 0
ENT.levels[1].outcomeBonus[1]       = 3
ENT.levels[1].outcomeBonus[2]       = 8
ENT.levels[1].outcomes              = {}
ENT.levels[1].outcomes[0]           = "You are experimented on. No lasting effects... Probably." .. "\nMoney + " .. ENT.levels[1].wage * 3 .. "\nEnergy - " .. ENT.levels[1].energyRequired
ENT.levels[1].outcomes[1]           = "You extensively researched." .. "\nMoney + " .. ENT.levels[1].wage * 3 + ENT.levels[1].outcomeBonus[1] .. "\nEnergy - " .. ENT.levels[1].energyRequired
ENT.levels[1].outcomes[2]           = "You take an experimental drug. It's probably harmless." .. "\nMoney + " .. ENT.levels[1].wage * 3 + ENT.levels[1].outcomeBonus[2] .. "\nEnergy - " .. ENT.levels[1].energyRequired

ENT.levels[2]                       = {}
ENT.levels[2].name                  = "Lab Assistant"
ENT.levels[2].energyRequired        = 3
ENT.levels[2].intelligenceRequired  = 25
ENT.levels[2].strengthRequired      = 5
ENT.levels[2].experienceRequired    = 3
ENT.levels[2].wage                  = 45
ENT.levels[2].outcomeBonus          = {}
ENT.levels[2].outcomeBonus[0]       = 0
ENT.levels[2].outcomeBonus[1]       = 3
ENT.levels[2].outcomeBonus[2]       = 8
ENT.levels[2].outcomes              = {}
ENT.levels[2].outcomes[0]           = "You pay close attention and assist." .. "\nMoney + " .. ENT.levels[2].wage * 3 .. "\nEnergy - " .. ENT.levels[2].energyRequired
ENT.levels[2].outcomes[1]           = "You gather many materials." .. "\nMoney + " .. ENT.levels[2].wage * 3 + ENT.levels[2].outcomeBonus[1] .. "\nEnergy - " .. ENT.levels[2].energyRequired
ENT.levels[2].outcomes[2]           = "You're a dream assistant." .. "\nMoney + " .. ENT.levels[2].wage * 3 + ENT.levels[2].outcomeBonus[2] .. "\nEnergy - " .. ENT.levels[2].energyRequired

ENT.levels[3]                       = {}
ENT.levels[3].name                  = "Researcher"
ENT.levels[3].energyRequired        = 3
ENT.levels[3].intelligenceRequired  = 30
ENT.levels[3].strengthRequired      = 5
ENT.levels[3].experienceRequired    = 6
ENT.levels[3].wage                  = 50
ENT.levels[3].outcomeBonus          = {}
ENT.levels[3].outcomeBonus[0]       = 0
ENT.levels[3].outcomeBonus[1]       = 3
ENT.levels[3].outcomeBonus[2]       = 8
ENT.levels[3].outcomes              = {}
ENT.levels[3].outcomes[0]           = "You write a boring (but important!) document." .. "\nMoney + " .. ENT.levels[3].wage * 3 .. "\nEnergy - " .. ENT.levels[3].energyRequired
ENT.levels[3].outcomes[1]           = "You write a long report on a theory." .. "\nMoney + " .. ENT.levels[3].wage * 3 + ENT.levels[3].outcomeBonus[1] .. "\nEnergy - " .. ENT.levels[3].energyRequired
ENT.levels[3].outcomes[2]           = "One of your reports gets published." .. "\nMoney + " .. ENT.levels[3].wage * 3 + ENT.levels[3].outcomeBonus[2] .. "\nEnergy - " .. ENT.levels[3].energyRequired

ENT.levels[4]                       = {}
ENT.levels[4].name                  = "Junior Scientist"
ENT.levels[4].energyRequired        = 3
ENT.levels[4].intelligenceRequired  = 35
ENT.levels[4].strengthRequired      = 5
ENT.levels[4].experienceRequired    = 9
ENT.levels[4].wage                  = 55
ENT.levels[4].outcomeBonus          = {}
ENT.levels[4].outcomeBonus[0]       = 0
ENT.levels[4].outcomeBonus[1]       = 3
ENT.levels[4].outcomeBonus[2]       = 8
ENT.levels[4].outcomes              = {}
ENT.levels[4].outcomes[0]           = "An experiment is done. Money is made." .. "\nMoney + " .. ENT.levels[4].wage * 3 .. "\nEnergy - " .. ENT.levels[4].energyRequired
ENT.levels[4].outcomes[1]           = "A successful experiment." .. "\nMoney + " .. ENT.levels[4].wage * 3 + ENT.levels[4].outcomeBonus[1] .. "\nEnergy - " .. ENT.levels[4].energyRequired
ENT.levels[4].outcomes[2]           = "A very informative experiment is done." .. "\nMoney + " .. ENT.levels[4].wage * 3 + ENT.levels[4].outcomeBonus[2] .. "\nEnergy - " .. ENT.levels[4].energyRequired

ENT.levels[5]                       = {}
ENT.levels[5].name                  = "Senior Scientist"
ENT.levels[5].energyRequired        = 3
ENT.levels[5].intelligenceRequired  = 40
ENT.levels[5].strengthRequired      = 5
ENT.levels[5].experienceRequired    = 12
ENT.levels[5].wage                  = 60
ENT.levels[5].outcomeBonus          = {}
ENT.levels[5].outcomeBonus[0]       = 0
ENT.levels[5].outcomeBonus[1]       = 3
ENT.levels[5].outcomeBonus[2]       = 8
ENT.levels[5].outcomes              = {}
ENT.levels[5].outcomes[0]           = "You run an experiment for upcoming scientists." .. "\nMoney + " .. ENT.levels[5].wage * 3 .. "\nEnergy - " .. ENT.levels[5].energyRequired
ENT.levels[5].outcomes[1]           = "You invent a new experiment." .. "\nMoney + " .. ENT.levels[5].wage * 3 + ENT.levels[5].outcomeBonus[1] .. "\nEnergy - " .. ENT.levels[5].energyRequired
ENT.levels[5].outcomes[2]           = "You are published in 'GMod Science Weekly'." .. "\nMoney + " .. ENT.levels[5].wage * 3 + ENT.levels[5].outcomeBonus[2] .. "\nEnergy - " .. ENT.levels[5].energyRequired

// Text that will be passed to the client derma
ENT.employerText                    = "Looking to become a scientist? \n\nWage: $" .. ENT.levels[1].wage .. "/hour\nRequires " .. ENT.levels[1].intelligenceRequired .. " Intelligence"
ENT.returningText                   = "Want to do an experiment? \n\nWage: $"
ENT.promotionText                   = "You have earned it. Keep it up."
ENT.promotionFailText               = "Not yet. You need more intelligence and experience."
ENT.acceptText                      = "Get to work"
ENT.titleText                       = "Lab Scientist"
ENT.hiredText                       = "Seems you're qualified. Welcome to the lab. \n\nYou are now a: " .. ENT.levels[1].name

ENT.shortName                       = "scientist"

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
