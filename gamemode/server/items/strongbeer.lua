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

function useStrongBeer(ply, item)
	removePlayerItem(ply, item)
    ply.invSize = ply.invSize - 1
    updatePlayerInventory(ply)
    //////////////////////////////////////////////

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
    
    //////////////////////////////////////////////
end