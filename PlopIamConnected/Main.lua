------------------------------------------------------------------------------------------
-- import librarys
------------------------------------------------------------------------------------------
import "Homeopatix.PlopIamConnected.Librarys";

Player = Turbine.Gameplay.LocalPlayer.GetInstance();
PlayerName = Player:GetName();

CreateLocalizationInfo();
------------------------------------------------------------------------------------------
-- create the main window
------------------------------------------------------------------------------------------
CreateMainWindow();
------------------------------------------------------------------------------------------
-- Closing window handler
------------------------------------------------------------------------------------------
ClosingTheWindow();
CreateAlarmWindowGuilde("", "");
------------------------------------------------------------------------------------------
-- handle minimizeIcon
------------------------------------------------------------------------------------------
if(settings["isWindowVisible"]["isWindowVisible"] == true)then
	MainMinimizedIcon = MinimizedIcon(Images.MinimizedIcon, 32, 32, PlopIamConnectedWindow:SetVisible(true));
else
	MainMinimizedIcon = MinimizedIcon(Images.MinimizedIcon, 32, 32, PlopIamConnectedWindow:SetVisible(false));
end

MainMinimizedIcon:SetPosition(settings["IconPosition"]["xPosIcon"], settings["IconPosition"]["yPosIcon"]);
MainMinimizedIcon:SetZOrder(0);
MainMinimizedIcon.PositionChanged = function()
	settings["IconPosition"]["xPosIcon"] = MainMinimizedIcon:GetLeft();
	settings["IconPosition"]["yPosIcon"] = MainMinimizedIcon:GetTop();
	SaveSettings();
end

------------------------------------------------------------------------------------------
-- event handling
------------------------------------------------------------------------------------------
PlopIamConnectedWindow.KeyDown=function(sender, args)
	if ( args.Action == Turbine.UI.Lotro.Action.Escape ) then
		if(settings["escEnable"]["escEnable"] == true) then
			PlopIamConnectedWindow:SetVisible(false);
			settings["isWindowVisible"]["isWindowVisible"] = false;
			SaveSettings();
		end
	end
	
	-- https://www.lotro.com/forums/showthread.php?493466-How-to-hide-a-window-on-F12&p=6581962#post6581962
	if ( args.Action == 268435635 ) then
		hudVisible=not hudVisible;
		if hudVisible then
			PlopIamConnectedWindow:SetVisible(false);
			MainMinimizedIcon:SetVisible(false);
		else
			PlopIamConnectedWindow:SetVisible(settings["isWindowVisible"]["isWindowVisible"]);
			MainMinimizedIcon:SetVisible(true);
		end
	end
end
------------------------------------------------------------------------------------------
-- if the position changes, save the new window location
------------------------------------------------------------------------------------------
	PlopIamConnectedWindow.PositionChanged = function( sender, args )
    	local x,y = PlopIamConnectedWindow:GetPosition();
    	settings["windowPosition"]["xPos"] = x;
    	settings["windowPosition"]["yPos"] = y;
		SaveSettings();
	end