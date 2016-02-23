AddCSLuaFile()

ENT.Base            = "rpg_npc_base"
ENT.Type            = "ai"

ENT.PrintName       = "NPC Civilian"
ENT.Author          = "Almighty Laxz"
ENT.Contact         = ""
ENT.Purpose         = ""
ENT.Instructions    = ""
ENT.Category        = "gmRPG"

ENT.Spawnable       = true

randText = {}
randText[0] = "Hello, what's up?"
randText[1] = "Can I help you?"
randText[2] = "Do I know you?"
randText[3] = "Do you need something?"
randText[4] = "What do you want?"

civModels = {}
civModels[0] = "models/humans/group01/female_01.mdl"
civModels[1] = "models/humans/group01/female_02.mdl"
civModels[2] = "models/humans/group01/female_03.mdl"
civModels[3] = "models/humans/group01/female_04.mdl"
civModels[4] = "models/humans/group01/female_06.mdl"
civModels[5] = "models/humans/group01/female_07.mdl"
civModels[6] = "models/humans/group01/male_01.mdl"
civModels[7] = "models/humans/group01/male_02.mdl"
civModels[8] = "models/humans/group01/male_03.mdl"
civModels[9] = "models/humans/group01/male_04.mdl"
civModels[10] = "models/humans/group01/male_05.mdl"
civModels[11] = "models/humans/group01/male_06.mdl"
civModels[12] = "models/humans/group01/male_07.mdl"
civModels[13] = "models/humans/group01/male_08.mdl"
civModels[14] = "models/humans/group01/male_09.mdl"

if SERVER then
    function ENT:Initialize( )
    	self:SetModel(civModels[math.random(0, 14)])
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
    		net.Start("rpgCivilianDermaStart")
                local civText = randText[math.random(0, 4)]
                net.WriteString(civText)
    		net.Send(Activator)
    		timer.Simple(1, function()
    			Activator.cantUse = false
    		end)
    	end
    end
end
