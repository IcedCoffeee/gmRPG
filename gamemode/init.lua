AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("client/hud.lua")
AddCSLuaFile("client/derma.lua")
AddCSLuaFile("client/pp.lua")
AddCSLuaFile("client/merchants.lua")

include("shared.lua")
include("server/pdata.lua")
include("server/player.lua")
include("server/npc_handling.lua")
include("server/merchant_items.lua")
include("server/merchant_items.lua")

gmRPG = gmRPG or {}

hook.Add("PlayerInitialSpawn", "gmrpg_firstspawn", function(ply)
    // Set the player stats etc. to set NW Strings
    setPlayerMoney(ply, 0)
    setPlayerEnergy(ply, 0)
    setPlayerStrength(ply, 0)
    setPlayerIntelligence(ply, 0)
end)

hook.Add( "PlayerSpray", "DisablePlayerSpray", function(ply)
	return true
end )
