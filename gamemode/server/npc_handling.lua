util.AddNetworkString("rpgEmploymentDermaStart")
util.AddNetworkString("rpgGymDermaStart")
util.AddNetworkString("rpgSchoolDermaStart")
util.AddNetworkString("rpgBarDermaStart")
util.AddNetworkString("rpgCafeDermaStart")
util.AddNetworkString("rpgCivilianDermaStart")
util.AddNetworkString("rpgDrugDermaStart")

util.AddNetworkString("requestEmployment")
util.AddNetworkString("requestGym")
util.AddNetworkString("requestSchool")

util.AddNetworkString("rpgEmploymentResultDermaStart")

net.Receive("requestEmployment", function(len, ply)
    local npcEnt = net.ReadEntity()

    local selectedOutcome = math.random(0, 2)

    if !IsValid(ply) || !IsValid(npcEnt) || ply:GetPos():Distance(npcEnt:GetPos()) > 128 then return false end

    if tonumber(ply:getIntelligence()) < npcEnt.intRequired then
        ply:ChatPrint( "You don't have the required intelligence!" )
        return false
    end

    if tonumber(ply:getEnergy()) >= npcEnt.energyRequired && !ply.isDrunk then
        ply:Lock()
        ply:ScreenFade(SCREENFADE.OUT, Color(0,0,0), 1, 1 )
        timer.Simple(1, function()
        ply:UnLock()
        ply:setMoney(npcEnt.outcomePay[selectedOutcome])
        ply:setEnergy(-npcEnt.energyRequired)

        net.Start("rpgEmploymentResultDermaStart")
            net.WriteString(npcEnt.outcomes[selectedOutcome])
        net.Send(ply)
        ply:EmitSound("ambient/office/coinslot1.wav")
        return true
        end)
        else if tonumber(ply:getEnergy()) < npcEnt.energyRequired then
            ply:ChatPrint( "You don't have enough energy for that!" )
            return false
        else
            ply:ChatPrint( "You can't work while drunk!" )
            return false
        end
    end
end)

net.Receive("requestGym", function(len, ply)

    local npcEnt = net.ReadEntity()

    if !IsValid(ply) || !IsValid(npcEnt) || ply:GetPos():Distance(npcEnt:GetPos()) > 128 then return false end
    if tonumber(ply:getEnergy()) >= 5 && tonumber(ply:getMoney()) > 50 then
        ply:setMoney(-50)
        ply:setEnergy(-5)
        ply:setStrength(1)
        ply:ChatPrint("You work out, losing 5 energy and $50")
        ply:ChatPrint("Strength + 1")
        else if tonumber(ply:getEnergy()) < 5 then
            ply:ChatPrint( "You don't have enough energy for that!" )
        else
            ply:ChatPrint( "You don't have enough money for that!" )
        end
    end
end)

net.Receive("requestSchool", function(len, ply)

    local npcEnt = net.ReadEntity()

    if !IsValid(ply) || !IsValid(npcEnt) || ply:GetPos():Distance(npcEnt:GetPos()) > 128 then return false end
    if tonumber(ply:getEnergy()) >= 2 && tonumber(ply:getMoney()) > 50 then
        ply:setMoney(-50)
        ply:setEnergy(-2)
        ply:setIntelligence(1)
        ply:ChatPrint("You study hard, losing $50")
        ply:ChatPrint("Intelligence + 1")
    else if tonumber(ply:getEnergy()) < 2 then
            ply:ChatPrint( "You don't have enough energy for that!" )
        else
            ply:ChatPrint( "You don't have enough money for that!" )
        end
    end
end)
