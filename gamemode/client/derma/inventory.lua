net.Start("rpgRequestInventory")
net.SendToServer()

function displayInventory()
	inventoryVisible = true

	rpgInventory = {}

	local ply = LocalPlayer()
	local invFrame = vgui.Create("DFrame")
	invFrame:SetPos(ScrW() / 2 - 260, ScrH() - 110)
	invFrame:SetSize( 520, 100 )
	invFrame:SetTitle("")
	invFrame:SetVisible(true)
	invFrame:SetDraggable(false)
	invFrame:ShowCloseButton(false)
	invFrame:MakePopup()
	invFrame:SetKeyBoardInputEnabled(false)
	invFrame.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 150 ) )
	end

	invlist = vgui.Create("DIconLayout", invFrame)
	invlist:SetSize(600, 90)
	invlist:SetPos(5, 10)
	invlist:SetSpaceY(5)
	invlist:SetSpaceX(5)

	for _,v in pairs(rpgInventory) do
		local model   =   gmRPG.items[v]().model
		local text    =   gmRPG.items[v]().name
		local tooltip =   "$" .. gmRPG.items[v]().price
		local item 	  =   invlist:Add("DModelPanel")
		item:SetSize(80, 80)
		item:SetModel(model)
		item:SetTooltip(tooltip)
		item:SetLookAt(item.Entity:GetPos())
		item:SetFOV(10)
		item.DoClick = function()
			net.Start("requestUse")
				net.WriteString(v)
			net.SendToServer()
		end
		item.label = vgui.Create("DLabel", item)
		item.label:SetText(text)
		item.label:SizeToContents()
		item.label:SetPos(10, 60)
		item.label:SetContentAlignment(5)
	end
end

function updateInventory()
	rpgInventory = util.JSONToTable(net.ReadString())
	invlist:Clear()

	for _,v in pairs(rpgInventory) do
		local model   =   gmRPG.items[v]().model
		local text    =   gmRPG.items[v]().name
		local tooltip =   "$" .. gmRPG.items[v]().price
		local item 	  =   invlist:Add("DModelPanel")
		item:SetSize(80, 80)
		item:SetModel(model)
		item:SetTooltip(tooltip)
		item:SetLookAt(item.Entity:GetPos())
		item:SetFOV(10)
		item.DoClick = function()
			net.Start("requestUse")
				net.WriteString(v)
			net.SendToServer()
		end
		item.label = vgui.Create("DLabel", item)
		item.label:SetText(text)
		item.label:SizeToContents()
		item.label:SetPos(10, 60)
		item.label:SetContentAlignment(5)
	end
end

net.Receive("rpgSendInventory", updateInventory)