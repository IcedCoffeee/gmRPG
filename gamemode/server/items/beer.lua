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

function useBeer(ply, item)
	removePlayerItem(ply, item)
    ply.invSize = ply.invSize - 1
    updatePlayerInventory(ply)
    //////////////////////////////////////////////

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

    //////////////////////////////////////////////
end