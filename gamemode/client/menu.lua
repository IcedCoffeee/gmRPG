local MENU = { }

function MENU:Open()
	if (g_Menu:IsVisible()) then
		g_Menu:Close()
	end

	self:MakePopup()
	self:SetVisible(true)
end

function MENU:Close()
	self:SetVisible(false)
end

function MENU:PerformLayout()
	self:SetPos(ScrW() / 2, ScrH() / 2)
	self:SetSize(600, 300)
end

vgui.Register("Menu", MENU, "DFrame")

function CreateMenu()
	g_Menu = vgui.Create("Menu")
	g_Menu:SetVisible(false)
end
hook.Add("OnGamemodeLoaded", "CreateMenu", CreateMenu)

function GM:OnContextMenuOpen()
	g_Menu:Open()
end

function GM:OnContextMenuClose()
	g_Menu:Close()
end
