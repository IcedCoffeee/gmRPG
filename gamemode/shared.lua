GM.Name = "gmRPG"
GM.Author = "Almighty Laxz"
GM.Email = "N/A"
GM.Website = "N/A"

DeriveGamemode("base")

function GM:Initialize()
    print("gmRPG Initialized")
end

function GM:SetupMove(ply, mv)
	mv:SetMoveAngles(Angle(0, 0, 0))
end
