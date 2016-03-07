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

function useCoffee(ply, item)
	removePlayerItem(ply, item)
    ply.invSize = ply.invSize - 1
    updatePlayerInventory(ply)
    //////////////////////////////////////////////

    ply:ChatPrint("You drink Coffee")
    ply:EmitSound("npc/barnacle/barnacle_gulp1.wav")
    setPlayerEnergy(ply, 3)
    ply.coffeeDrank = ply.coffeeDrank + 1
    if ply.coffeeDrank >= 4 then
        ply:TakeDamage(10, game.GetWorld(), game.GetWorld())
        ply:ChatPrint("You are drinking too much coffee, sleep it off!")
    end

    //////////////////////////////////////////////
end