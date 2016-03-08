function gmRPG.addItem(itemid, name, price, merchant, model, itemfunc)
    local newitem = {}

    newitem.id = itemid
    newitem.name = name
    newitem.merchant = merchant
    newitem.model = model
    newitem.price = price
    newitem.itemfunc = itemfunc
    table.insert(gmRPG.items, newitem)
end

<<<<<<< HEAD
// Include all items
local files = file.Find("gmrpg/gamemode/server/items/*", "LUA")
for k, v in pairs(files) do
    include("items/" .. v)
end

net.Receive("requestPurchase", function(len, ply)
=======
net.Receive("requestUse", function(len, ply)
>>>>>>> refs/remotes/origin/pr/10
    if !IsValid(ply) then return false end
    local requestedItem = net.ReadString()

<<<<<<< HEAD
    // Players cannot have more than 6 items
    if ply.invSize > 5 then
        ply:ChatPrint("You are carrying too much!")
        return false
    end

    ply.invSize = ply.invSize + 1

    if requestedItem == "Beer" then
        grantBeer(ply)
        updatePlayerInventory(ply)
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
    elseif requestedItem == "Caffeine Pills" then
        grantCaffeinePills(ply)
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
        elseif requestedItem == "CaffeinePills" && requestedItem == v then
            useCaffeinePills(ply, v)
            break
=======
    for i=1, #gmRPG.items do
        if requestedItem == gmRPG.items[i].id then
           gmRPG.items[i].itemfunc(ply)
           ply:removeItem(gmRPG.items[i].id)
        end
    end
end)

net.Receive("requestPurchase", function(len, ply)
    if !IsValid(ply) then return false end

    local requestedItem = net.ReadString()

    for i=1, #gmRPG.items do
        if requestedItem == gmRPG.items[i].id then
            if tonumber(ply:getMoney()) < gmRPG.items[i].price then
                ply:ChatPrint("You don't have enough money for that.")
            elseif #ply:getInventory() >= 6 then
                ply:ChatPrint("Your inventory is full.")
            else
                ply:setMoney(-gmRPG.items[i].price)
                ply:addInventory(gmRPG.items[i].id)
                ply:EmitSound("ambient/office/coinslot1.wav")
            end
>>>>>>> refs/remotes/origin/pr/10
        end
    end

end)
