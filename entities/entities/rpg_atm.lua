AddCSLuaFile()

ENT.Base            = "rpg_npc_merchant_base"
ENT.Type            = "ai"

ENT.PrintName       = "Slot Machine"
ENT.Author          = "Almighty Laxz"
ENT.Contact         = ""
ENT.Purpose         = ""
ENT.Instructions    = ""
ENT.Category        = "gmRPG"

ENT.Spawnable       = true

ENT.titleText       = "ATM"

if SERVER then
    function ENT:Initialize()
    	self:SetModel("models/perp2/bank_atm/bank_atm.mdl")
    	self:SetSolid(SOLID_BBOX)
    	self:SetUseType(SIMPLE_USE)
    	self:DropToFloor()
    end

    function ENT:AcceptInput( Name, Activator, Caller )

    	if !Activator.cantUse and Activator:IsPlayer() then
    		Activator.cantUse = true
            net.Start("rpgATMDermaStart")
                net.WriteEntity(self)
            net.Send(Activator)
    		timer.Simple(1, function()
    			Activator.cantUse = false
    		end)
    	end
    end
end
