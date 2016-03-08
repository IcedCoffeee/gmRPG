function grantEnergyDrink(ply)
    if !IsValid(ply) then return false end

    if tonumber(getPlayerMoney(ply)) >= 5 then
        setPlayerMoney(ply, -5)
        ply:ChatPrint("You buy an Energy Drink for $5")
        setPlayerInventory(ply, "EnergyDrink")
    else
        ply:ChatPrint("You don't have enough money for that!")
    end
end

function useEnergyDrink(ply, item)
	removePlayerItem(ply, item)
    ply.invSize = ply.invSize - 1
    updatePlayerInventory(ply)
    //////////////////////////////////////////////

    ply:ChatPrint("You drink an Energy Drink")
    ply:EmitSound("npc/barnacle/barnacle_gulp1.wav")
    setPlayerEnergy(ply, 1)

    //////////////////////////////////////////////
end