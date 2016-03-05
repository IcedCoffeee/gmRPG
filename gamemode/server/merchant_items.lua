util.AddNetworkString("requestPurchase")

util.AddNetworkString("rpgDrunkify")
util.AddNetworkString("rpgUndrunkify")
util.AddNetworkString("rpgUpdateInventory")

local Beer = { "models/props_junk/garbage_glassbottle003a.mdl", "Beer"}
local StrongBeer = { "models/props_junk/garbage_glassbottle001a.mdl", "Strong Beer"}
local Coffee = { "models/props_junk/garbage_coffeemug001a.mdl", "Strong Coffee"}
local EnergyDrink = { "models/props_junk/PopCan01a.mdl", "Energy Drink"}
local Noodles = { "models/props_junk/garbage_takeoutcarton001a.mdl", "Noodles"}

net.Receive("requestPurchase", function(len, ply)
    if !IsValid(ply) then return false end

    local requestedItem = net.ReadString()

    if requestedItem == "Beer" then
        grantBeer(ply)
    elseif requestedItem == "Strong Beer" then
        grantStrongBeer(ply)
    elseif requestedItem == "Coffee" then
        grantCoffee(ply)
    elseif requestedItem == "Strong Coffee" then
        grantStrongCoffee(ply)
    elseif requestedItem == "Energy Drink" then
        grantEnergyDrink(ply)
    elseif requestedItem == "Noodles" then
        grantNoodles(ply)
    end

end)

function grantBeer(ply)
    if !IsValid(ply) then return false end

    if tonumber(getPlayerMoney(ply)) >= 10 then
        setPlayerMoney(ply, -10)
        ply:ChatPrint("You buy Beer for $10")
        setPlayerInventory(ply, Beer)
        net.Start("rpgUpdateInventory")
        net.Send(ply)
        else
            ply:ChatPrint("You don't have enough money for that!")
        end
end

function grantStrongBeer(ply)
    if !IsValid(ply) then return false end

    if tonumber(getPlayerMoney(ply)) >= 15 then
        setPlayerMoney(ply, -15)
        ply:ChatPrint("You buy Strong Beer for $15")
        ply:EmitSound("npc/barnacle/barnacle_gulp1.wav")
        net.Start("rpgDrunkify")
        net.Send(ply)
        ply.isDrunk = true

        if ply:Health() < 100 then ply:SetHealth(ply:Health() + 10) end

            timer.Simple(60, function()
                net.Start("rpgUndrunkify")
                net.Send(ply)
                ply.isDrunk = false
            end)
    else
        ply:ChatPrint("You don't have enough money for that!")
    end
end

function grantCoffee(ply)
    if !IsValid(ply) then return false end

    if tonumber(getPlayerMoney(ply)) >= 10 then
        setPlayerMoney(ply, -10)
        ply:ChatPrint("You buy Coffee for $10")
        ply:EmitSound("npc/barnacle/barnacle_gulp1.wav")
        setPlayerEnergy(ply, 3)
        ply.coffeeDrank = ply.coffeeDrank + 1
        if ply.coffeeDrank >= 4 then
            ply:TakeDamage(10, game.GetWorld(), game.GetWorld())
            ply:ChatPrint("You are drinking too much coffee, sleep it off!")
        end
    else
        ply:ChatPrint("You don't have enough money for that!")
    end
end

function grantStrongCoffee(ply)
    if !IsValid(ply) then return false end

    if tonumber(getPlayerMoney(ply)) >= 15 then
        setPlayerMoney(ply, -15)
        ply:ChatPrint("You buy Strong Coffee for $15")
        ply:EmitSound("npc/barnacle/barnacle_gulp1.wav")
        setPlayerEnergy(ply, 5)
        ply.coffeeDrank = ply.coffeeDrank + 1
        if ply.coffeeDrank >= 4 then
            ply:TakeDamage(10, game.GetWorld(), game.GetWorld())
            ply:ChatPrint("You are drinking too much coffee, sleep it off!")
        end
    else
        ply:ChatPrint("You don't have enough money for that!")
    end
end

function grantEnergyDrink(ply)
    if !IsValid(ply) then return false end

    if tonumber(getPlayerMoney(ply)) >= 5 then
        setPlayerMoney(ply, -5)
        ply:ChatPrint("You buy an Energy Drink for $5")
        ply:EmitSound("npc/barnacle/barnacle_gulp1.wav")
        setPlayerEnergy(ply, 1)
    else
        ply:ChatPrint("You don't have enough money for that!")
    end
end

function grantNoodles(ply)
    if !IsValid(ply) then return false end

    if tonumber(getPlayerMoney(ply)) >= 5 then
        setPlayerMoney(ply, -5)
        ply:ChatPrint("You buy Noodles for $5")
        ply:EmitSound("npc/barnacle/barnacle_gulp1.wav")
        if ply:Health() < 100 then ply:SetHealth(ply:Health() + 5) end
    else
        ply:ChatPrint("You don't have enough money for that!")
    end
end
