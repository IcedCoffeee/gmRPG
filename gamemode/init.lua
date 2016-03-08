gmRPG = gmRPG or {}

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("client/hud.lua")
AddCSLuaFile("client/derma.lua")
AddCSLuaFile("client/pp.lua")
AddCSLuaFile("client/merchants.lua")
AddCSLuaFile("shared/items.lua")

include("shared.lua")
include("server/pdata.lua")
include("server/player.lua")
include("server/npc_handling.lua")
include("server/merchant_items.lua")
include("shared/items.lua")

util.AddNetworkString("requestPurchase")
util.AddNetworkString("requestUse")
util.AddNetworkString("rpgDrunkify")
util.AddNetworkString("rpgUndrunkify")
util.AddNetworkString("rpgUpdateInventory")

function GM:PlayerInitialSpawn(ply)
    // Set the player stats etc. to set NW Strings
    ply:setMoney(0)
    ply:setEnergy(0)
    ply:setStrength(0)
    ply:setIntelligence(0)
    ply:resetInventory()

end

function GM:PlayerSpray(ply)
	return true
end