util.AddNetworkString("requestPurchase")
util.AddNetworkString("requestUse")

util.AddNetworkString("rpgDrunkify")
util.AddNetworkString("rpgUndrunkify")
util.AddNetworkString("rpgUpdateInventory")

// Include all items
local files = file.Find("gmrpg/gamemode/server/items/*", "LUA")
for k, v in pairs(files) do
    include("items/" .. v)
end

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
    ply:EmitSound("ambient/office/coinslot1.wav")
end)

net.Receive("requestUse", function(len, ply)
    if !IsValid(ply) then return false end

    local requestedItem = net.ReadString()
    local inv = util.JSONToTable(getPlayerInventory(ply))

    for k, v in pairs(inv) do
        if requestedItem == "Beer" && requestedItem == v then
            useBeer(ply, v)
            break
        elseif requestedItem == "StrongBeer" && requestedItem == v then
            useStrongBeer(ply, v)
            break
        elseif requestedItem == "Coffee" && requestedItem == v then
            useCoffee(ply, v)
            break
        elseif requestedItem == "StrongCoffee" && requestedItem == v then
            useStrongCoffee(ply, v)
            break
        elseif requestedItem == "EnergyDrink" && requestedItem == v then
            useEnergyDrink(ply, v)
            break
        elseif requestedItem == "Noodles" && requestedItem == v then
            useNoodles(ply, v)
            break
        end
    end
end)