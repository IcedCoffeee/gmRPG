net.Receive("requestUse", function(len, ply)
    if !IsValid(ply) then return false end
    local item = net.ReadString()
    local requestedItem = gmRPG.items[item]()

    if ply:removeItem(item) then
        requestedItem.itemfunc(ply)
     else
        ply:ChatPrint("Item does not exist in inventory.")
    end
end)

net.Receive("requestPurchase", function(len, ply)
    if !IsValid(ply) then return false end
    local item = net.ReadString()
    local requestedItem = gmRPG.items[item]()

    if tonumber(ply:getMoney()) < requestedItem.price then
        ply:ChatPrint("You don't have enough money for that.")
    else
        if ply:addInventory(item) then
            ply:setMoney(-requestedItem.price)
            ply:EmitSound("ambient/office/coinslot1.wav")
        end
    end
end)