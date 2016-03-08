local meta = FindMetaTable("Player")

/*/////////////////////////////////////////
            Money PData Functions
/////////////////////////////////////////*/

function meta:setMoney(money)
    self:SetPData("gmrpg_money", self:GetPData("gmrpg_money", 0) + money)
    self:SetNWString("gmrpg_money", self:GetPData("gmrpg_money", 0))
end

function meta:getMoney()
    return self:GetPData("gmrpg_money", 0)
end

/*/////////////////////////////////////////
            Energy PData Functions
/////////////////////////////////////////*/

function meta:setEnergy(energy)
    self:SetPData("gmrpg_energy", self:GetPData("gmrpg_energy", 0) + energy)
    if tonumber(self:GetPData("gmrpg_energy", 0)) > math.floor(tonumber(self:getStrength())) then
        self:SetPData("gmrpg_energy", math.floor(tonumber(self:getStrength())))
    end
    self:SetNWString("gmrpg_energy", self:GetPData("gmrpg_energy", 0))
end

function meta:getEnergy()
    return self:GetPData("gmrpg_energy", 0)
end


/*/////////////////////////////////////////
            Stats PData Functions
/////////////////////////////////////////*/

function meta:setStrength(strength)
    self:SetPData("gmrpg_strength", self:GetPData("gmrpg_strength", 5) + strength)
    self:SetNWString("gmrpg_strength", self:GetPData("gmrpg_strength", 5))
end

function meta:getStrength()
    return self:GetPData("gmrpg_strength", 5)
end

function meta:setIntelligence(intelligence)
    self:SetPData("gmrpg_intelligence", self:GetPData("gmrpg_intelligence", 5) + intelligence)
    self:SetNWString("gmrpg_intelligence", self:GetPData("gmrpg_intelligence", 5))
end

function meta:getIntelligence()
    return self:GetPData("gmrpg_intelligence", 5)
end

function meta:resetStats()
    self:SetPData("gmrpg_strength", 5)
    self:SetPData("gmrpg_intelligence", 5)
    self:SetNWString("gmrpg_strength", self:GetPData("gmrpg_strength", 5))
    self:SetNWString("gmrpg_intelligence", self:GetPData("gmrpg_intelligence", 5))
end

/*/////////////////////////////////////////
        Inventory PData Functions
/////////////////////////////////////////*/
util.AddNetworkString("rpgRequestInventory")
util.AddNetworkString("rpgSendInventory")

<<<<<<< HEAD
function getPlayerInventory(ply)
    return ply:GetPData("gmrpg_inventory")
end

function setPlayerInventory(ply, item)
    local newInv = util.JSONToTable(getPlayerInventory(ply))
=======
function meta:getInventory()
    return util.JSONToTable(self:GetPData("gmrpg_inventory"))
end

function meta:addInventory(item)
    local newInv = self:getInventory()
>>>>>>> refs/remotes/origin/pr/10
    if newInv == nil then
        newInv = {}
    end
    table.insert(newInv, item)
<<<<<<< HEAD
    ply:SetPData("gmrpg_inventory", util.TableToJSON(newInv))
    ply:SetNWString("gmrpg_inventory", ply:GetPData("gmrpg_inventory"))
    updatePlayerInventory(ply)
end

function resetPlayerInventory(ply)
    ply:SetPData("gmrpg_inventory", util.TableToJSON({}))
    ply:SetNWString("gmrpg_inventory", ply:GetPData("gmrpg_inventory"))
    ply.invSize = 0
    updatePlayerInventory(ply)
=======
    self:SetPData("gmrpg_inventory", util.TableToJSON(newInv))
    self:updateInventory()
end

function meta:resetInventory()
    self:SetPData("gmrpg_inventory", util.TableToJSON({}))
    self:updateInventory()
>>>>>>> refs/remotes/origin/pr/10
end

function meta:removeItem(item)
    local inv = self:getInventory()

    local remove = table.RemoveByValue(inv, item)
    if remove != false then
        self:SetPData("gmrpg_inventory", util.TableToJSON(inv))
        self:updateInventory()
    end
<<<<<<< HEAD
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
=======

    
end

function meta:updateInventory()
    net.Start("rpgSendInventory")
        net.WriteString(util.TableToJSON(self:getInventory()))
    net.Send(self)
end

net.Receive("rpgRequestInventory", function(len, ply)
    net.Start("rpgSendInventory")
        net.WriteString(util.TableToJSON(self:getInventory()))
    net.Send(self)
>>>>>>> refs/remotes/origin/pr/10
end)