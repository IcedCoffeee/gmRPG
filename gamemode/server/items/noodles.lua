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

function useNoodles(ply, item)
	removePlayerItem(ply, item)
    ply.invSize = ply.invSize - 1
    updatePlayerInventory(ply)
    //////////////////////////////////////////////

    ply:ChatPrint("You eat Noodles")
    ply:EmitSound("npc/barnacle/barnacle_gulp1.wav")
    if ply:Health() < 100 then ply:SetHealth(ply:Health() + 5) end

    //////////////////////////////////////////////
end