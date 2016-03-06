util.AddNetworkString("requestPurchase")
util.AddNetworkString("requestUse")

util.AddNetworkString("rpgDrunkify")
util.AddNetworkString("rpgUndrunkify")
util.AddNetworkString("rpgUpdateInventory")

net.Receive("requestPurchase", function(len, ply)
    if !IsValid(ply) then return false end

    local requestedItem = net.ReadString()

    // Players cannot have more than 6 items
    if ply.invSize > 5 then
        ply:ChatPrint("You are carrying too much!")
        return false
    end

    if requestedItem == "Beer" then
        grantBeer(ply)
        ply.invSize = ply.invSize + 1
        updatePlayerInventory(ply)
    elseif requestedItem == "Strong Beer" then
        grantStrongBeer(ply)
        ply.invSize = ply.invSize + 1
    elseif requestedItem == "Coffee" then
        grantCoffee(ply)
        ply.invSize = ply.invSize + 1
    elseif requestedItem == "Strong Coffee" then
        grantStrongCoffee(ply)
        ply.invSize = ply.invSize + 1
    elseif requestedItem == "Energy Drink" then
        grantEnergyDrink(ply)
        ply.invSize = ply.invSize + 1
    elseif requestedItem == "Noodles" then
        grantNoodles(ply)
        ply.invSize = ply.invSize + 1
    end
end)

function grantBeer(ply)
    if !IsValid(ply) then return false end

    if tonumber(getPlayerMoney(ply)) >= 10 then
        setPlayerMoney(ply, -10)
        ply:ChatPrint("You buy Beer for $10")
        setPlayerInventory(ply, "Beer")
        else
            ply:ChatPrint("You don't have enough money for that!")
        end
end

function grantStrongBeer(ply)
    if !IsValid(ply) then return false end

    if tonumber(getPlayerMoney(ply)) >= 15 then
        setPlayerMoney(ply, -15)
        ply:ChatPrint("You buy Strong Beer for $15")
        setPlayerInventory(ply, "StrongBeer")
    else
        ply:ChatPrint("You don't have enough money for that!")
    end
end

function grantCoffee(ply)
    if !IsValid(ply) then return false end

    if tonumber(getPlayerMoney(ply)) >= 10 then
        setPlayerMoney(ply, -10)
        ply:ChatPrint("You buy Coffee for $10")
        setPlayerInventory(ply, "Coffee")
    else
        ply:ChatPrint("You don't have enough money for that!")
    end
end

function grantStrongCoffee(ply)
    if !IsValid(ply) then return false end

    if tonumber(getPlayerMoney(ply)) >= 15 then
        setPlayerMoney(ply, -15)
        ply:ChatPrint("You buy Strong Coffee for $15")
        setPlayerInventory(ply, "StrongCoffee")
    else
        ply:ChatPrint("You don't have enough money for that!")
    end
end

function grantEnergyDrink(ply)
    if !IsValid(ply) then return false end

    if tonumber(getPlayerMoney(ply)) >= 5 then
        setPlayerMoney(ply, -5)
        ply:ChatPrint("You buy an Energy Drink for $5")
        setPlayerInventory(ply, "EnergyDrink")
    else
        ply:ChatPrint("You don't have enough money for that!")
    end
end

function grantNoodles(ply)
    if !IsValid(ply) then return false end

    if tonumber(getPlayerMoney(ply)) >= 5 then
        setPlayerMoney(ply, -5)
        ply:ChatPrint("You buy Noodles for $5")
        setPlayerInventory(ply, "Noodles")
    else
        ply:ChatPrint("You don't have enough money for that!")
    end
end

net.Receive("requestUse", function(len, ply)
    if !IsValid(ply) then return false end

    local requestedItem = net.ReadString()
    local inv = util.JSONToTable(getPlayerInventory(ply))

    for k, v in pairs(inv) do
        if requestedItem == "Beer" && requestedItem == v then
            removePlayerItem(ply, v)
            ply.invSize = ply.invSize - 1
            updatePlayerInventory(ply)

            ply:ChatPrint("You drink Beer")
            ply:EmitSound("npc/barnacle/barnacle_gulp1.wav")
            net.Start("rpgDrunkify")
            net.Send(ply)
            ply.isDrunk = true
            if ply:Health() < 100 then ply:SetHealth(ply:Health() + 5) end
            timer.Simple(60, function()
                net.Start("rpgUndrunkify")
                net.Send(ply)
                ply.isDrunk = false
            end)
            break
        elseif requestedItem == "StrongBeer" && requestedItem == v then
            removePlayerItem(ply, v)
            ply.invSize = ply.invSize - 1
            updatePlayerInventory(ply)

            ply:ChatPrint("You drink Strong Beer")
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
            break
        elseif requestedItem == "Coffee" && requestedItem == v then
            removePlayerItem(ply, v)
            ply.invSize = ply.invSize - 1
            updatePlayerInventory(ply)

            ply:ChatPrint("You drink Coffee")
            ply:EmitSound("npc/barnacle/barnacle_gulp1.wav")
            setPlayerEnergy(ply, 3)
            ply.coffeeDrank = ply.coffeeDrank + 1
            if ply.coffeeDrank >= 4 then
                ply:TakeDamage(10, game.GetWorld(), game.GetWorld())
                ply:ChatPrint("You are drinking too much coffee, sleep it off!")
            end
            break
        elseif requestedItem == "StrongCoffee" && requestedItem == v then
            removePlayerItem(ply, v)
            ply.invSize = ply.invSize - 1
            updatePlayerInventory(ply)

            ply:ChatPrint("You drink Strong Coffee")
            ply:EmitSound("npc/barnacle/barnacle_gulp1.wav")
            setPlayerEnergy(ply, 5)
            ply.coffeeDrank = ply.coffeeDrank + 1
            if ply.coffeeDrank >= 4 then
                ply:TakeDamage(10, game.GetWorld(), game.GetWorld())
                ply:ChatPrint("You are drinking too much coffee, sleep it off!")
            end
            break
        elseif requestedItem == "EnergyDrink" && requestedItem == v then
            removePlayerItem(ply, v)
            ply.invSize = ply.invSize - 1
            updatePlayerInventory(ply)

            ply:ChatPrint("You drink an Energy Drink")
            ply:EmitSound("npc/barnacle/barnacle_gulp1.wav")
            setPlayerEnergy(ply, 1)
            break
        elseif requestedItem == v then
            removePlayerItem(ply, v)
            ply.invSize = ply.invSize - 1
            updatePlayerInventory(ply)

            ply:ChatPrint("You eat Noodles")
            ply:EmitSound("npc/barnacle/barnacle_gulp1.wav")
            if ply:Health() < 100 then ply:SetHealth(ply:Health() + 5) end
            break
        end
    end
end)