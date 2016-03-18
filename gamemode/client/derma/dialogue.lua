net.Receive( "rpgDialogueDermaStart", function()
	local title = net.ReadString()
	local text = net.ReadString()
	local btext1 = net.ReadString()
	local btext2 = net.ReadString()
	local func1 = net.ReadString()
	local func2 = net.ReadString()
	npcEnt = net.ReadEntity()

	if !IsValid(npcEnt) then return false end

	local frame = vgui.Create( "DFrame" )
	frame:SetPos( 5, 5 )
	frame:SetSize( 400, 300 )
	frame:SetTitle(title)
	frame:SetVisible( true )
	frame:SetDraggable( true )
	frame:ShowCloseButton( false )
	frame.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 200 ) )
	end
	frame:MakePopup()
	frame:Center()

	local DLabel = vgui.Create( "DLabel", frame )
	DLabel:SetPos( 10, 10 )
	DLabel:SetText(text)
	DLabel:SetSize(300, 80)

	local button1 = vgui.Create( "DButton", frame )
	button1:SetPos( 10, 225 )
	button1:SetText(btext1)
	button1:SetSize( 250, 30 )
	button1.DoClick = function()
		RunString(func1)
		frame:Close()
	end

	local button2 = vgui.Create( "DButton", frame )
	button2:SetPos( 10, 260 )
	button2:SetText(btext2)
	button2:SetSize( 250, 30 )
	button2.DoClick = function()
		if (func2 == "close") then
			frame:Close()
		else
			RunString(func2)
		end
	end
end)

net.Receive( "rpgSingleDialogueDermaStart", function()

	local title = net.ReadString()
	local text = net.ReadString()
	local btext = net.ReadString()
	local npcEnt = net.ReadEntity()

	if !IsValid(npcEnt) then return false end

	local frame = vgui.Create( "DFrame")
	frame:SetPos( 5, 5 )
	frame:SetSize( 400, 300 )
	frame:SetTitle(title)
	frame:SetVisible( true )
	frame:SetDraggable( true )
	frame:ShowCloseButton( false )
	frame.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 200 ) )
	end
	frame:MakePopup()
	frame:Center()

	local DLabel = vgui.Create( "DLabel", frame )
	DLabel:SetPos( 10, 10 )
	DLabel:SetText(text)
	DLabel:SetSize(300, 80)
	DLabel:SetWrap(true)

	local closeButton = vgui.Create( "DButton", frame )
	closeButton:SetPos( 10, 260 )
	closeButton:SetText(btext)
	closeButton:SetSize( 250, 30 )
	closeButton.DoClick = function()
		frame:Close()
	end
end)