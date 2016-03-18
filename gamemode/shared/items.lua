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
        merchant = "vending",
        model = "models/props_junk/PopCan01a.mdl",
        itemfunc = useEnergyDrink
    }
    return itemdata
end

function gmRPG.items:noodles()
    local function useNoodles(ply)
    	ply:ChatPrint("You eat Noodles")
    	ply:EmitSound("eating_and_drinking/eating.wav")
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

function gmRPG.items:fries()
    local function useFries(ply)
        ply:ChatPrint("You eat Fries")
        ply:EmitSound("eating_and_drinking/eating.wav")
        if ply:Health() < 100 then ply:SetHealth(ply:Health() + 5) end
    end
    local itemdata = {
        name = "Fries",
        price = 2,
        merchant = "fastfood",
        model = "models/foodnhouseholditems/mcdfrenchfries.mdl",
        itemfunc = useFries
    }
    return itemdata
end

function gmRPG.items:chickenwing()
    local function useChickenWing(ply)
        ply:ChatPrint("You eat Chicken Wing")
        ply:EmitSound("eating_and_drinking/eating.wav")
        if ply:Health() < 100 then ply:SetHealth(ply:Health() + 5) end
    end
    local itemdata = {
        name = "Chicken Wing",
        price = 2,
        merchant = "fastfood",
        model = "models/foodnhouseholditems/mcdfriedchickenleg.mdl",
        itemfunc = useChickenWing
    }
    return itemdata
end

function gmRPG.items:cheeseburger()
    local function useCheeseburger(ply)
        ply:ChatPrint("You eat Cheeseburger")
        ply:EmitSound("eating_and_drinking/eating_long.wav")
        if ply:Health() < 100 then ply:SetHealth(ply:Health() + 5) end
    end
    local itemdata = {
        name = "Cheeseburger",
        price = 2,
        merchant = "fastfood",
        model = "models/foodnhouseholditems/burgersims2.mdl",
        itemfunc = useCheeseburger
    }
    return itemdata
end

function gmRPG.items:doublecheeseburger()
    local function useDoubleCheeseburger(ply)
        ply:ChatPrint("You eat Double Cheeseburger")
        ply:EmitSound("eating_and_drinking/eating_long.wav")
        if ply:Health() < 100 then ply:SetHealth(ply:Health() + 10) end
    end
    local itemdata = {
        name = "Double Cheeseburger",
        price = 4,
        merchant = "fastfood",
        model = "models/foodnhouseholditems/mcdburger.mdl",
        itemfunc = useDoubleCheeseburger
    }
    return itemdata
end

function gmRPG.items:shake()
    local function useShake(ply)
        ply:ChatPrint("You drink Shake")
        ply:EmitSound("eating_and_drinking/straw.wav")
        if ply:Health() < 100 then ply:SetHealth(ply:Health() + 5) end
    end
    local itemdata = {
        name = "Shake",
        price = 2,
        merchant = "fastfood",
        model = "models/foodnhouseholditems/mcddrink.mdl",
        itemfunc = useShake
    }
    return itemdata
end

function gmRPG.items:cola()
    local function useCola(ply)
        ply:ChatPrint("You drink Cola")
        ply:EmitSound("eating_and_drinking/soda.wav")
        if ply:Health() < 100 then ply:SetHealth(ply:Health() + 5) end
    end
    local itemdata = {
        name = "Cola",
        price = 1,
        merchant = "vending",
        model = "models/foodnhouseholditems/cola.mdl",
        itemfunc = useCola
    }
    return itemdata
end

function gmRPG.items:largecola()
    local function useLargeCola(ply)
        ply:ChatPrint("You drink Large Cola")
        ply:EmitSound("eating_and_drinking/soda.wav")
        if ply:Health() < 100 then ply:SetHealth(ply:Health() + 10) end
    end
    local itemdata = {
        name = "Large Cola",
        price = 2,
        merchant = "vending",
        model = "models/foodnhouseholditems/colabig.mdl",
        itemfunc = useLargeCola
    }
    return itemdata
end

function gmRPG.items:id()
    local function useID(ply)
    end
    local itemdata = {
        name = "ID",
        price = 150,
        merchant = "police",
        model = "models/props_c17/paper01.mdl",
    }
    return itemdata
end