net.Receive("requestUse", function(len, ply)
    if !IsValid(ply) then return false end
    local requestedItem = net.ReadString()

    if ply:removeItem(requestedItem) then
        gmRPG.items[requestedItem]().itemfunc(ply)
     else
        ply:ChatPrint("Item does not exist in inventory.")
    end
end)

net.Receive("requestPurchase", function(len, ply)
    if !IsValid(ply) then return false end

    local requestedItem = net.ReadString()

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
end)