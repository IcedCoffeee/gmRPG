gmRPG.items = gmRPG.items or {}

function gmRPG.items:beer()
    local function useBeer(ply)
    	ply:ChatPrint("You drink Beer")
    	ply:EmitSound("npc/barnacle/barnacle_gulp1.wav")
    	ply.isDrunk = true

    	net.Start("rpgDrunkify")
    	net.Send(ply)

    	if ply:Health() < 100 then ply:SetHealth(ply:Health() + 5) end
    	timer.Simple(60, function()
    		net.Start("rpgUndrunkify")
    		net.Send(ply)
    		ply.isDrunk = false
    	end)
    end
	local itemdata = {
		name = "Beer",
		price = 10,
		merchant = "bar",
		model = "models/props_junk/garbage_glassbottle003a.mdl",
        itemfunc = useBeer
	}
	return itemdata
end

function gmRPG.items:strongbeer()
    function useStrongBeer(ply)
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
    end
    local itemdata = {
        name = "Strong Beer",
        price = 15,
        merchant = "bar",
        model = "models/props_junk/garbage_glassbottle001a.mdl",
        itemfunc = useStrongBeer
    }
    return itemdata
end
function gmRPG.items:caffeine()
    local function useCaffeinePills(ply)
    	ply:ChatPrint("You swallow Caffeine Pills")
    	ply:EmitSound("npc/barnacle/barnacle_gulp1.wav")
    	ply:setEnergy(6)
    	ply.caffeine = ply.caffeine + 1
    	if ply.caffeine >= 4 then
    		ply:TakeDamage(20, game.GetWorld(), game.GetWorld())
    		ply:ChatPrint("You are intaking too much caffeine, sleep it off!")
    	end
    end
    local itemdata = {
        name = "Caffeine Pills",
        price = 10,
        merchant = "drug",
        model = "models/props_lab/jar01b.mdl",
        itemfunc = useCaffeinePills
    }
    return itemdata
end

function gmRPG.items:coffee()
    local function useCoffee(ply)
    	ply:ChatPrint("You drink Coffee")
    	ply:EmitSound("npc/barnacle/barnacle_gulp1.wav")
    	ply:setEnergy(3)
    	ply.coffeeDrank = ply.coffeeDrank + 1
    	if ply.coffeeDrank >= 4 then
    		ply:TakeDamage(10, game.GetWorld(), game.GetWorld())
    		ply:ChatPrint("You are drinking too much coffee, sleep it off!")
    	end
    end
    local itemdata = {
        name = "Coffee",
        price = 5,
        merchant =  "cafe",
        model = "models/props_junk/garbage_coffeemug001a.mdl",
        itemfunc = useCoffee
    }
    return itemdata
end

function gmRPG.items:energydrink()
    local function useEnergyDrink(ply)
    	ply:ChatPrint("You drink an Energy Drink")
    	ply:EmitSound("npc/barnacle/barnacle_gulp1.wav")
    	ply:setEnergy(1)
    end
    local itemdata = {
        name = "Energy Drink",
        price = 5,
        merchant = "cafe",
        model = "models/props_junk/PopCan01a.mdl",
        itemfunc = useEnergyDrink
    }
    return itemdata
end

function gmRPG.items:noodles()
    local function useNoodles(ply)
    	ply:ChatPrint("You eat Noodles")
    	ply:EmitSound("npc/barnacle/barnacle_gulp1.wav")
    	if ply:Health() < 100 then ply:SetHealth(ply:Health() + 5) end
    end
    local itemdata = {
        name = "Noodles",
        price = 5,
        merchant = "cafe",
        model = "models/props_junk/garbage_takeoutcarton001a.mdl",
        itemfunc = useNoodles
    }
    return itemdata
end

function gmRPG.items:strongcoffee()
    local function useStrongCoffee(ply)
        ply:ChatPrint("You drink Strong Coffee")
    	ply:EmitSound("npc/barnacle/barnacle_gulp1.wav")
    	ply:setEnergy(5)
    	ply.coffeeDrank = ply.coffeeDrank + 1
    	if ply.coffeeDrank >= 4 then
    		ply:TakeDamage(10, game.GetWorld(), game.GetWorld())
    		ply:ChatPrint("You are drinking too much coffee, sleep it off!")
    	end
    end
    local itemdata = {
        name = "Strong Coffee",
        price = 5,
        merchant = "cafe",
        model = "models/props_junk/garbage_coffeemug001a.mdl",
        itemfunc = useStrongCoffee
    }
    return itemdata
end
