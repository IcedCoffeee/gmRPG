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

function getPlayerInventory(ply)
    return ply:GetPData("gmrpg_inventory", {})
end

function setPlayerInventory(ply, item)
    local newInv = util.JSONToTable(getPlayerInventory(ply))
    table.insert(newInv, item)
    ply:SetPData("gmrpg_inventory", util.TableToJSON(newInv))
    ply:SetNWString("gmrpg_inventory", ply:GetPData("gmrpg_inventory", {}))
end

function resetPlayerInventory(ply)
    ply:SetPData("gmrpg_inventory", util.TableToJSON({}))
    ply:SetNWString("gmrpg_inventory", util.TableToJSON(ply:GetPData("gmrpg_inventory", {})))
end

function removePlayerItem(ply, item)
    local inv = util.JSONToTable(getPlayerInventory(ply))
    local foundit = false
    for k,v in pairs(inv) do
        if !foundit then
            for x,y in pairs(v) do
                if y == item then
                    local test = table.RemoveByValue(inv, v)
                    foundit = true
                    break
                end
            end
        end
    end
    ply:SetPData("gmrpg_inventory", util.TableToJSON(inv))
    ply:SetNWString("gmrpg_inventory", ply:GetPData("gmrpg_inventory", {}))
end

function updatePlayerInventory(ply)
    // 3 times because slow connections will not recieve updated inventory in time
    timer.Simple(0.1, function()
            net.Start("rpgUpdateInventory")
            net.Send(ply)
    end)
    timer.Simple(0.1, function()
            net.Start("rpgUpdateInventory")
            net.Send(ply)
    end)
    timer.Simple(0.1, function()
            net.Start("rpgUpdateInventory")
            net.Send(ply)
    end)
end