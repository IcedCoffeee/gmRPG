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

net.Receive("requestUse", function(len, ply)
    if !IsValid(ply) then return false end
    local requestedItem = net.ReadString()

    for k,v in pairs(gmRPG.items) do
        if requestedItem == k then
            if ply:removeItem(k) then
                v().itemfunc(ply)
            else
                ply:ChatPrint("Item does not exist in inventory.")
            end
        end
    end
end)

net.Receive("requestPurchase", function(len, ply)
    if !IsValid(ply) then return false end

    local requestedItem = net.ReadString()

    for k,v in pairs(gmRPG.items) do
        if requestedItem == k then
            if tonumber(ply:getMoney()) < v().price then
                ply:ChatPrint("You don't have enough money for that.")
            elseif #ply:getInventory() >= 6 then
                ply:ChatPrint("Your inventory is full.")
            else
                ply:setMoney(-v().price)
                ply:addInventory(k)
                ply:EmitSound("ambient/office/coinslot1.wav")
            end
        end
    end

end)

--[[
net.Receive("requestUse", function(len, ply)
    if !IsValid(ply) then return false end
    local requestedItem = net.ReadString()

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
        end
    end
end)]]