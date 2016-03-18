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

ENT.cost            = 10
ENT.winAmount       = 40
ENT.jackpot         = 100

ENT.winText         = "You win!"
ENT.jackpotText     = "Jackpot!"
ENT.loseText        = "Bad luck, you lose!"

ENT.titleText       = "Slot Machine"
local text          = "INSERT COINS\n\nWin Amount: " .. ENT.winAmount .. "\nJackpot: " .. ENT.jackpot
local btext1        = "Bet $" .. ENT.cost
local btext2        = "Close"
local func1         = "net.Start('requestSlots') net.WriteEntity(npcEnt) net.SendToServer()"
local func2         = "close"

if SERVER then
    function ENT:Initialize()
    	self:SetModel("models/props_lab/reciever_cart.mdl")
    	self:SetSolid(SOLID_BBOX)
    	self:SetUseType(SIMPLE_USE)
    	self:DropToFloor()
    end

    function ENT:AcceptInput( Name, Activator, Caller )

    	if !Activator.cantUse and Activator:IsPlayer() then
    		Activator.cantUse = true
            net.Start("rpgDialogueDermaStart")
                net.WriteString(self.titleText)
                net.WriteString(text)
                net.WriteString(btext1)
                net.WriteString(btext2)
                net.WriteString(func1)
                net.WriteString(func2)
                net.WriteEntity(self)
            net.Send(Activator)
    		timer.Simple(1, function()
    			Activator.cantUse = false
    		end)
    	end
    end
end
