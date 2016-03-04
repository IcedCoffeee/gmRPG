local Beer = { "models/props_junk/garbage_glassbottle003a.mdl", "$10", "print(\"laxz is a gaycunt\")", "Beer"}
local StrongBeer = { "models/props_junk/garbage_glassbottle001a.mdl", "$15", "print(\"xd\")", "Strong Beer"}
local Coffee = { "models/props_junk/garbage_coffeemug001a.mdl", "$10", "print(\"why is laxz so bad at life\")", "Coffee"}
local StrongCoffee = { "models/props_junk/garbage_coffeemug001a.mdl", "$15", "print(\"why is laxz so bad at life\")", "Strong Coffee"}

local BarItems = { Beer, StrongBeer, Coffee }
local CafeItems = { Coffee, StrongCoffee}

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
			RunString(func) -- lazy
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
net.Receive( "rpgBarDermaStart", BarMenu)

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