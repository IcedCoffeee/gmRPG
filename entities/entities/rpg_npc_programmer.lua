AddCSLuaFile()

ENT.Base            = "rpg_npc_employer_base"
ENT.Type            = "ai"

ENT.PrintName       = "NPC Programmer Employer"
ENT.Author          = "Almighty Laxz"
ENT.Contact         = ""
ENT.Purpose         = ""
ENT.Instructions    = ""
ENT.Category        = "gmRPG"

ENT.Spawnable       = true

ENT.levels                          = {}

ENT.levels[1]                       = {}
ENT.levels[1].name                  = "Scrub"
ENT.levels[1].energyRequired        = 2
ENT.levels[1].intelligenceRequired  = 10
ENT.levels[1].strengthRequired      = 5
ENT.levels[1].experienceRequired    = 0
ENT.levels[1].wage                  = 20
ENT.levels[1].outcomeBonus          = {}
ENT.levels[1].outcomeBonus[0]       = 0
ENT.levels[1].outcomeBonus[1]       = 3
ENT.levels[1].outcomeBonus[2]       = 8
ENT.levels[1].outcomes              = {}
ENT.levels[1].outcomes[0]           = "You copypaste code from the internet." .. "\nMoney + " .. ENT.levels[1].wage * 3 .. "\nEnergy - " .. ENT.levels[1].energyRequired
ENT.levels[1].outcomes[1]           = "Copypaste copypaste copypaste. It's almost impressive." .. "\nMoney + " .. ENT.levels[1].wage * 3 + ENT.levels[1].outcomeBonus[1] .. "\nEnergy - " .. ENT.levels[1].energyRequired
ENT.levels[1].outcomes[2]           = "You copypaste your way into the boss's good books." .. "\nMoney + " .. ENT.levels[1].wage * 3 + ENT.levels[1].outcomeBonus[2] .. "\nEnergy - " .. ENT.levels[1].energyRequired

ENT.levels[2]                       = {}
ENT.levels[2].name                  = "Amateur"
ENT.levels[2].energyRequired        = 2
ENT.levels[2].intelligenceRequired  = 15
ENT.levels[2].strengthRequired      = 5
ENT.levels[2].experienceRequired    = 3
ENT.levels[2].wage                  = 22
ENT.levels[2].outcomeBonus          = {}
ENT.levels[2].outcomeBonus[0]       = 0
ENT.levels[2].outcomeBonus[1]       = 3
ENT.levels[2].outcomeBonus[2]       = 8
ENT.levels[2].outcomes              = {}
ENT.levels[2].outcomes[0]           = "You write code. (half) copypasted." .. "\nMoney + " .. ENT.levels[2].wage * 3 .. "\nEnergy - " .. ENT.levels[2].energyRequired
ENT.levels[2].outcomes[1]           = "Your project is going well." .. "\nMoney + " .. ENT.levels[2].wage * 3 + ENT.levels[2].outcomeBonus[1] .. "\nEnergy - " .. ENT.levels[2].energyRequired
ENT.levels[2].outcomes[2]           = "Wow. You didn't even copypaste" .. "\nMoney + " .. ENT.levels[2].wage * 3 + ENT.levels[2].outcomeBonus[2] .. "\nEnergy - " .. ENT.levels[2].energyRequired

ENT.levels[3]                       = {}
ENT.levels[3].name                  = "Adept Coder"
ENT.levels[3].energyRequired        = 2
ENT.levels[3].intelligenceRequired  = 20
ENT.levels[3].strengthRequired      = 5
ENT.levels[3].experienceRequired    = 6
ENT.levels[3].wage                  = 24
ENT.levels[3].outcomeBonus          = {}
ENT.levels[3].outcomeBonus[0]       = 0
ENT.levels[3].outcomeBonus[1]       = 3
ENT.levels[3].outcomeBonus[2]       = 8
ENT.levels[3].outcomes              = {}
ENT.levels[3].outcomes[0]           = "Code is written, money is made." .. "\nMoney + " .. ENT.levels[3].wage * 3 .. "\nEnergy - " .. ENT.levels[3].energyRequired
ENT.levels[3].outcomes[1]           = "A very productive shift." .. "\nMoney + " .. ENT.levels[3].wage * 3 + ENT.levels[3].outcomeBonus[1] .. "\nEnergy - " .. ENT.levels[3].energyRequired
ENT.levels[3].outcomes[2]           = "You finished a project. Good work." .. "\nMoney + " .. ENT.levels[3].wage * 3 + ENT.levels[3].outcomeBonus[2] .. "\nEnergy - " .. ENT.levels[3].energyRequired

ENT.levels[4]                       = {}
ENT.levels[4].name                  = "Code Creator"
ENT.levels[4].energyRequired        = 2
ENT.levels[4].intelligenceRequired  = 25
ENT.levels[4].strengthRequired      = 5
ENT.levels[4].experienceRequired    = 9
ENT.levels[4].wage                  = 26
ENT.levels[4].outcomeBonus          = {}
ENT.levels[4].outcomeBonus[0]       = 0
ENT.levels[4].outcomeBonus[1]       = 3
ENT.levels[4].outcomeBonus[2]       = 8
ENT.levels[4].outcomes              = {}
ENT.levels[4].outcomes[0]           = "You created code. Role forfilled." .. "\nMoney + " .. ENT.levels[4].wage * 3 .. "\nEnergy - " .. ENT.levels[4].energyRequired
ENT.levels[4].outcomes[1]           = "You help a collegue because you have spare time." .. "\nMoney + " .. ENT.levels[4].wage * 3 + ENT.levels[4].outcomeBonus[1] .. "\nEnergy - " .. ENT.levels[4].energyRequired
ENT.levels[4].outcomes[2]           = "A final product is released." .. "\nMoney + " .. ENT.levels[4].wage * 3 + ENT.levels[4].outcomeBonus[2] .. "\nEnergy - " .. ENT.levels[4].energyRequired

ENT.levels[5]                       = {}
ENT.levels[5].name                  = "Expert Programmer"
ENT.levels[5].energyRequired        = 2
ENT.levels[5].intelligenceRequired  = 30
ENT.levels[5].strengthRequired      = 5
ENT.levels[5].experienceRequired    = 12
ENT.levels[5].wage                  = 28
ENT.levels[5].outcomeBonus          = {}
ENT.levels[5].outcomeBonus[0]       = 0
ENT.levels[5].outcomeBonus[1]       = 3
ENT.levels[5].outcomeBonus[2]       = 8
ENT.levels[5].outcomes              = {}
ENT.levels[5].outcomes[0]           = "You write code at a great pace." .. "\nMoney + " .. ENT.levels[5].wage * 3 .. "\nEnergy - " .. ENT.levels[5].energyRequired
ENT.levels[5].outcomes[1]           = "You program... Expertly." .. "\nMoney + " .. ENT.levels[5].wage * 3 + ENT.levels[5].outcomeBonus[1] .. "\nEnergy - " .. ENT.levels[5].energyRequired
ENT.levels[5].outcomes[2]           = "A major product is released. It sells well." .. "\nMoney + " .. ENT.levels[5].wage * 3 + ENT.levels[5].outcomeBonus[2] .. "\nEnergy - " .. ENT.levels[5].energyRequired

// Text that will be passed to the client derma
ENT.employerText                    = "Greetings, looking for a coding job? \n\nWage: $" .. ENT.levels[1].wage .. "/hour\nRequires " .. ENT.levels[1].intelligenceRequired .. " Intelligence"
ENT.returningText                   = "Hello fellow coder! Ready to work? \n\nWage: $"
ENT.promotionText                   = "You have been doing a great job. Promoted."
ENT.promotionFailText               = "Not yet. You need more intelligence and experience."
ENT.acceptText                      = "Program"
ENT.titleText                       = "Programmer Employer"
ENT.hiredText                       = "You're hired. Congratulations, don't disappoint. \n\nYou are now a: " .. ENT.levels[1].name

ENT.shortName                       = "programmer"

if SERVER then
    function ENT:Initialize( )
    	self:SetModel( "models/Characters/Hostage_01.mdl" )
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
                print(self.levels[tonumber(Activator:getEmployment(self.shortName))].wage)
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
