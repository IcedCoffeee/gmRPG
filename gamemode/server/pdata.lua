/*/////////////////////////////////////////
            Money PData Functions
/////////////////////////////////////////*/

function setPlayerMoney(ply, money)
    ply:SetPData("gmrpg_money", ply:GetPData("gmrpg_money", 0) + money)
    ply:SetNWString("gmrpg_money", ply:GetPData("gmrpg_money", 0))
end

function getPlayerMoney(ply)
    return ply:GetPData("gmrpg_money", 0)
end

/*/////////////////////////////////////////
            Energy PData Functions
/////////////////////////////////////////*/

function setPlayerEnergy(ply, energy)
    ply:SetPData("gmrpg_energy", ply:GetPData("gmrpg_energy", 0) + energy)
    if tonumber(ply:GetPData("gmrpg_energy", 0)) > math.floor(tonumber(getPlayerStrength(ply))) then
        ply:SetPData("gmrpg_energy", math.floor(tonumber(getPlayerStrength(ply))))
    end
    ply:SetNWString("gmrpg_energy", ply:GetPData("gmrpg_energy", 0))
end

function getPlayerEnergy(ply)
    return ply:GetPData("gmrpg_energy", 0)
end


/*/////////////////////////////////////////
            Stats PData Functions
/////////////////////////////////////////*/

function setPlayerStrength(ply, strength)
    ply:SetPData("gmrpg_strength", ply:GetPData("gmrpg_strength", 5) + strength)
    ply:SetNWString("gmrpg_strength", ply:GetPData("gmrpg_strength", 5))
end

function getPlayerStrength(ply)
    return ply:GetPData("gmrpg_strength", 5)
end

function setPlayerIntelligence(ply, intelligence)
    ply:SetPData("gmrpg_intelligence", ply:GetPData("gmrpg_intelligence", 5) + intelligence)
    ply:SetNWString("gmrpg_intelligence", ply:GetPData("gmrpg_intelligence", 5))
end

function getPlayerIntelligence(ply)
    return ply:GetPData("gmrpg_intelligence", 5)
end

function resetPlayerStats(ply)
    ply:SetPData("gmrpg_strength", 5)
    ply:SetPData("gmrpg_intelligence", 5)
    ply:SetNWString("gmrpg_strength", ply:GetPData("gmrpg_strength", 5))
    ply:SetNWString("gmrpg_intelligence", ply:GetPData("gmrpg_intelligence", 5))
end

/*/////////////////////////////////////////
        Inventory PData Functions
/////////////////////////////////////////*/
util.AddNetworkString("rpgRequestInventory")
util.AddNetworkString("rpgSendInventory")

function getPlayerInventory(ply)
    return ply:GetPData("gmrpg_inventory")
end

function setPlayerInventory(ply, item)
    local newInv = util.JSONToTable(getPlayerInventory(ply))
    if newInv == nil then
        newInv = {}
    end
    table.insert(newInv, item)
    ply:SetPData("gmrpg_inventory", util.TableToJSON(newInv))
    ply:SetNWString("gmrpg_inventory", ply:GetPData("gmrpg_inventory"))
    updatePlayerInventory(ply)
end

function resetPlayerInventory(ply)
    ply:SetPData("gmrpg_inventory", util.TableToJSON({}))
    ply:SetNWString("gmrpg_inventory", ply:GetPData("gmrpg_inventory"))
    ply.invSize = 0
    updatePlayerInventory(ply)
end

function removePlayerItem(ply, item)
    local inv = util.JSONToTable(getPlayerInventory(ply))
    local foundit = false
    for k, v in pairs(inv) do
        if v == item && !foundit then
            local test = table.RemoveByValue(inv, v)
            foundit = true
            break
        end
    end
    ply:SetPData("gmrpg_inventory", util.TableToJSON(inv))
    ply:SetNWString("gmrpg_inventory", ply:GetPData("gmrpg_inventory"))
    updatePlayerInventory(ply)
end

function updatePlayerInventory(ply)
    net.Start("rpgSendInventory")
        net.WriteString(getPlayerInventory(ply))
    net.Send(ply)
end

net.Receive("rpgRequestInventory", function(len, ply)
    net.Start("rpgSendInventory")
        net.WriteString(getPlayerInventory(ply))
    net.Send(ply)
end)