function grantStrongCoffee(ply)
    if !IsValid(ply) then return false end

    if tonumber(getPlayerMoney(ply)) >= 15 then
        setPlayerMoney(ply, -15)
        ply:ChatPrint("You buy Strong Coffee for $15")
        setPlayerInventory(ply, "StrongCoffee")
    else
        ply:ChatPrint("You don't have enough money for that!")
    end
end

function useStrongCoffee(ply, item)
	removePlayerItem(ply, item)
    ply.invSize = ply.invSize - 1
    updatePlayerInventory(ply)
    //////////////////////////////////////////////

    ply:ChatPrint("You drink Strong Coffee")
    ply:EmitSound("npc/barnacle/barnacle_gulp1.wav")
    setPlayerEnergy(ply, 5)
    ply.coffeeDrank = ply.coffeeDrank + 1
    if ply.coffeeDrank >= 4 then
        ply:TakeDamage(10, game.GetWorld(), game.GetWorld())
        ply:ChatPrint("You are drinking too much coffee, sleep it off!")
    end

    //////////////////////////////////////////////
end