function GM:PlayerSpawn(ply)
	ply:StripWeapons()
	ply:SetHealth(100)
	ply:SetJumpPower(250)
	//ply:Give("weapon_physgun")
	ply:SetModel(player_manager.TranslatePlayerModel(ply:GetInfo("cl_playermodel")))

	local col = ply:GetInfo("cl_playercolor")
	ply:SetPlayerColor(Vector(col))

	local wcol = ply:GetInfo("cl_weaponcolor")
	ply:SetWeaponColor(Vector(wcol))

	ply.coffeeDrank = 0
end

hook.Add("PlayerDeath", "gmrpg_stopSpammingSuicide", function(victim, inflictor, attacker )
    if tonumber(getPlayerMoney(victim)) > 20 then
        setPlayerMoney(victim, -20)
    end
	net.Start("rpgUndrunkify")
	net.Send(victim)
end)
