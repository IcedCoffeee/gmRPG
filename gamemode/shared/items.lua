gmRPG.items = {}

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
gmRPG.addItem("beer", "Beer", 10, "bar", "models/props_junk/garbage_glassbottle003a.mdl", useBeer)

local function useStrongBeer(ply, item)
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
gmRPG.addItem("strongbeer", "Strong Beer", 15, "bar", "models/props_junk/garbage_glassbottle001a.mdl", useStrongBeer)

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
gmRPG.addItem("caffeine", "Caffeine Pills", 10, "drug", "models/props_lab/jar01b.mdl", useCaffeinePills)

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
gmRPG.addItem("coffee", "Coffee", 5, "cafe", "models/props_junk/garbage_coffeemug001a.mdl", useCoffee)

local function useEnergyDrink(ply)
	ply:ChatPrint("You drink an Energy Drink")
	ply:EmitSound("npc/barnacle/barnacle_gulp1.wav")
	ply:setEnergy(1)
end
gmRPG.addItem("energydrink", "Energy Drink", 5, "cafe", "models/props_junk/PopCan01a.mdl", useEnergyDrink)

local function useNoodles(ply, item)
	ply:ChatPrint("You eat Noodles")
	ply:EmitSound("npc/barnacle/barnacle_gulp1.wav")
	if ply:Health() < 100 then ply:SetHealth(ply:Health() + 5) end
end
gmRPG.addItem("noodles", "Noodles", 5, "cafe", "models/props_junk/garbage_takeoutcarton001a.mdl", useNoodles)

local function useStrongCoffee(ply, item)
ply:ChatPrint("You drink Strong Coffee")
	ply:EmitSound("npc/barnacle/barnacle_gulp1.wav")
	ply:setEnergy(5)
	ply.coffeeDrank = ply.coffeeDrank + 1
	if ply.coffeeDrank >= 4 then
		ply:TakeDamage(10, game.GetWorld(), game.GetWorld())
		ply:ChatPrint("You are drinking too much coffee, sleep it off!")
	end
end
gmRPG.addItem("strongcoffee", "Strong Coffee", 5, "cafe", "models/props_junk/garbage_coffeemug001a.mdl", useStrongCoffee)
