function grantCaffeinePills(ply)
    if !IsValid(ply) then return false end

    if tonumber(getPlayerMoney(ply)) >= 10 then
        setPlayerMoney(ply, -10)
        ply:ChatPrint("You buy Caffeine Pills for $10")
        setPlayerInventory(ply, "CaffeinePills")
    else
        ply:ChatPrint("You don't have enough money for that!")
    end
end

function useCaffeinePills(ply, item)
	removePlayerItem(ply, item)
    ply.invSize = ply.invSize - 1
    updatePlayerInventory(ply)
    //////////////////////////////////////////////

    ply:ChatPrint("You swallow Caffeine Pills")
    ply:EmitSound("npc/barnacle/barnacle_gulp1.wav")
    setPlayerEnergy(ply, 6)
    ply.coffeeDrank = ply.coffeeDrank + 1
    if ply.coffeeDrank >= 4 then
        ply:TakeDamage(20, game.GetWorld(), game.GetWorld())
        ply:ChatPrint("You are intaking too much caffeine, sleep it off!")
    end

    //////////////////////////////////////////////
end