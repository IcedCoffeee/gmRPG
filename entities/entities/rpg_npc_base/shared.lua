ENT.Type = "ai"
ENT.Base = "base_ai"
ENT.AutomaticFrameAdvance = true

ENT.PrintName = "NPC Base"
ENT.Author = "Almighty Laxz"
ENT.Contact = ""
ENT.Purpose = ""
ENT.Instructions = ""
ENT.Category = "gmRPG"

ENT.Spawnable = false

function ENT:SetAutomaticFrameAdvance( bUsingAnim )
	self.AutomaticFrameAdvance = bUsingAnim
end
