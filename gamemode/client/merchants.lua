function gmRPG.addItem(itemid, name, price, merchant, model, itemfunc)
	local newitem = {}
	newitem.id = itemid
	newitem.name = name
	newitem.merchant = merchant
	newitem.model = model
	newitem.price = price
	table.insert(gmRPG.items, newitem)

end

function BarMenu()
	local barText = net.ReadString()
	local npcEnt  = net.ReadEntity()

	local frame = vgui.Create( "DFrame" )
	frame:SetPos( 5, 5 )
	frame:SetSize( 500, 300 )
	frame:SetTitle( "Bar Tender" )
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
	DLabel:SetText(barText)
	DLabel:SetSize(200, 80)

	local invlist	= vgui.Create( "DIconLayout", frame )
	invlist:SetSize( 340, 200 )
	invlist:SetPos( 50, 70 )
	invlist:SetSpaceY( 5 )
	invlist:SetSpaceX( 5 )

	local closeButton = vgui.Create( "DButton", frame )
	closeButton:SetPos( 200, 250 )
	closeButton:SetText( "Close" )
	closeButton:SetSize( 120, 40 )
	closeButton.DoClick = function()
		frame:Close()
	end

	for k,v in pairs(gmRPG.items) do
		if v().merchant != "bar" then continue end
		local model   =		v().model
		local tooltip =		"$" .. v().price
		local text	=		v().name

		local item = invlist:Add( "DModelPanel" )
		item:SetSize( 80, 80 )
		item:SetModel(model)
		item:SetTooltip(tooltip)
		item:SetLookAt(item.Entity:GetPos())
		item:SetFOV(10)
		item.DoClick = function()
			net.Start("requestPurchase")
				net.WriteString(k)
			net.SendToServer()
		end

		item.label = vgui.Create("DLabel", item)
		item.label:SetText(text)
		item.label:SizeToContents()
		item.label:Center()
		item.label:SetContentAlignment(5)
	end
end

net.Receive("rpgBarDermaStart", BarMenu)

function CafeMenu()
	local cafeText = net.ReadString()
	local npcEnt = net.ReadEntity()

	local frame = vgui.Create( "DFrame" )
	frame:SetPos( 5, 5 )
	frame:SetSize( 500, 300 )
	frame:SetTitle( "Cafe Worker" )
	frame:SetVisible( true )
	frame:SetDraggable( true )
	frame:ShowCloseButton( false )
	frame.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 200 ) )
	end
	frame:MakePopup()
	frame:Center()

	local closeButton = vgui.Create( "DButton", frame )
	closeButton:SetPos( 200, 250 )
	closeButton:SetText( "Close" )
	closeButton:SetSize( 120, 40 )
	closeButton.DoClick = function()
		frame:Close()
	end

	local DLabel = vgui.Create( "DLabel", frame )
	DLabel:SetPos( 10, 10 )
	DLabel:SetText(cafeText)
	DLabel:SetSize(200, 80)

	local invlist	= vgui.Create( "DIconLayout", frame )
	invlist:SetSize( 340, 200 )
	invlist:SetPos( 50, 70 )
	invlist:SetSpaceY( 5 ) //Sets the space in between the panels on the X Axis by 5
	invlist:SetSpaceX( 5 ) //Sets the space in between the panels on the Y Axis by 5

	for k,v in pairs(gmRPG.items) do
		if v().merchant != "cafe" then continue end
		local model   =		v().model
		local tooltip =		"$" .. v().price
		local text	=		v().name

		local item = invlist:Add( "DModelPanel" )
		item:SetSize( 80, 80 )
		item:SetModel(model)
		item:SetTooltip(tooltip)
		item:SetLookAt(item.Entity:GetPos())
		item:SetFOV(10)
		item.DoClick = function()
			net.Start("requestPurchase")
				net.WriteString(k)
			net.SendToServer()
		end

		item.label = vgui.Create("DLabel", item)
		item.label:SetText(text)
		item.label:SizeToContents()
		item.label:Center()
		item.label:SetContentAlignment(5)
	end

end

net.Receive( "rpgCafeDermaStart", CafeMenu)

function DrugMenu()
	local drugText = net.ReadString()
	local npcEnt = net.ReadEntity()

	local frame = vgui.Create( "DFrame" )
	frame:SetPos( 5, 5 )
	frame:SetSize( 500, 300 )
	frame:SetTitle( "Drug Dealer" )
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
	DLabel:SetText(drugText)
	DLabel:SetSize(200, 80)

	local invlist	= vgui.Create( "DIconLayout", frame )
	invlist:SetSize( 340, 200 )
	invlist:SetPos( 50, 70 )
	invlist:SetSpaceY( 5 ) //Sets the space in between the panels on the X Axis by 5
	invlist:SetSpaceX( 5 ) //Sets the space in between the panels on the Y Axis by 5

	for k,v in pairs(gmRPG.items) do
		if v().merchant != "drug" then continue end
		local model   =		v().model
		local tooltip =		"$" .. v().price
		local text	=		v().name

		local item = invlist:Add( "DModelPanel" )
		item:SetSize( 80, 80 )
		item:SetModel(model)
		item:SetTooltip(tooltip)
		item:SetLookAt(item.Entity:GetPos())
		item:SetFOV(10)
		item.DoClick = function()
			net.Start("requestPurchase")
				net.WriteString(k)
			net.SendToServer()
		end

		item.label = vgui.Create("DLabel", item)
		item.label:SetText(text)
		item.label:SizeToContents()
		item.label:Center()
		item.label:SetContentAlignment(5)
	end

	local closeButton = vgui.Create( "DButton", frame )
	closeButton:SetPos( 200, 250 )
	closeButton:SetText( "Close" )
	closeButton:SetSize( 120, 40 )
	closeButton.DoClick = function()
		frame:Close()
	end
end

net.Receive( "rpgDrugDermaStart", DrugMenu)