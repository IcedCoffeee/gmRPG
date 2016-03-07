Beer = { "models/props_junk/garbage_glassbottle003a.mdl", "$10", "chat.AddText(\"You ask for a Beer\")", "Beer"}
StrongBeer = { "models/props_junk/garbage_glassbottle001a.mdl", "$15", "chat.AddText(\"You ask for a Strong Beer\")", "Strong Beer"}
Coffee = { "models/props_junk/garbage_coffeemug001a.mdl", "$10", "chat.AddText(\"You ask for a Coffee\")", "Coffee"}
StrongCoffee = { "models/props_junk/garbage_coffeemug001a.mdl", "$15", "chat.AddText(\"You ask for a Strong Coffee\")", "Strong Coffee"}
EnergyDrink = { "models/props_junk/PopCan01a.mdl", "$5", "chat.AddText(\"You ask for an Energy Drink\")", "Energy Drink"}
Noodles = { "models/props_junk/garbage_takeoutcarton001a.mdl", "$5", "chat.AddText(\"You ask for Noodles\")", "Noodles"}
CaffeinePills = { "models/props_lab/jar01b.mdl", "$30", "chat.AddText(\"You ask for Caffeine Pills\")", "Caffeine Pills"}

local BarItems = {Beer, StrongBeer}
local CafeItems = {Coffee, StrongCoffee, EnergyDrink, Noodles}
local DrugItems = {CaffeinePills}

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

	for k,v in pairs(BarItems) do

		local model   =   v[1]
		local tooltip =   v[2]
		local func    =   v[3]
		local text    =   v[4]

		local item = invlist:Add( "DModelPanel" )
		item:SetSize( 80, 80 )
		item:SetModel(model)
		item:SetTooltip(tooltip)
		item:SetLookAt(item.Entity:GetPos())
		item:SetFOV(10)
		item.DoClick = function()
			RunString(func)
			net.Start("requestPurchase")
				net.WriteString(text)
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

	local DLabel = vgui.Create( "DLabel", frame )
	DLabel:SetPos( 10, 10 )
	DLabel:SetText(cafeText)
	DLabel:SetSize(200, 80)

	local invlist	= vgui.Create( "DIconLayout", frame )
	invlist:SetSize( 340, 200 )
	invlist:SetPos( 50, 70 )
	invlist:SetSpaceY( 5 ) //Sets the space in between the panels on the X Axis by 5
	invlist:SetSpaceX( 5 ) //Sets the space in between the panels on the Y Axis by 5

	for k,v in pairs(CafeItems) do

		local model   =   v[1]
		local tooltip =   v[2]
		local func    =   v[3]
		local text    =   v[4]

		local item = invlist:Add( "DModelPanel" )
		item:SetSize( 80, 80 )
		item:SetModel(model)
		item:SetTooltip(tooltip)
		item:SetLookAt(item.Entity:GetPos())
		item:SetFOV(10)
		item.DoClick = function()
			RunString(func)
			net.Start("requestPurchase")
				net.WriteString(text)
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

	for k,v in pairs(DrugItems) do

		local model   =   v[1]
		local tooltip =   v[2]
		local func    =   v[3]
		local text    =   v[4]

		local item = invlist:Add( "DModelPanel" )
		item:SetSize( 80, 80 )
		item:SetModel(model)
		item:SetTooltip(tooltip)
		item:SetLookAt(item.Entity:GetPos())
		item:SetFOV(10)
		item.DoClick = function()
			RunString(func)
			net.Start("requestPurchase")
				net.WriteString(text)
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