------------------------------------------------------------------------------------------
-- create the Alarm window
------------------------------------------------------------------------------------------
function CreateAlarmWindowAmi(namePlayer, HeureToDisplay)

	AlarmWindow=Turbine.UI.Extensions.SimpleWindow();
	AlarmWindow:SetSize(600,450); 
	AlarmWindow:SetZOrder(1000);
	AlarmWindow:SetBackColor(Turbine.UI.Color( .01, .5, .7, .5));
	AlarmWindow:SetVisible(false);
	AlarmWindow:SetWantsUpdates(true);

	AlarmWindow:SetPosition((Turbine.UI.Display:GetWidth()-AlarmWindow:GetWidth())/2,(Turbine.UI.Display:GetHeight()-AlarmWindow:GetHeight())/2 - 200);

	AlarmWindow.Message3=Turbine.UI.Label(); 
	AlarmWindow.Message3:SetParent(AlarmWindow); 
	AlarmWindow.Message3:SetSize(598,50); 
	AlarmWindow.Message3:SetPosition(AlarmWindow:GetWidth()/2 - 299, AlarmWindow:GetHeight()/2 - 200); 
	AlarmWindow.Message3:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	AlarmWindow.Message3:SetForeColor(Turbine.UI.Color.Red); 
	AlarmWindow.Message3:SetFont(Turbine.UI.Lotro.Font.TrajanProBold36);
	AlarmWindow.Message3:SetText( Strings.PluginText3  );
	AlarmWindow.Message3:SetZOrder(10000);
	AlarmWindow.Message3:SetMouseVisible(true);
	AlarmWindow.Message3:SetBackColor(Turbine.UI.Color( .8, .5, .7, .5));

	AlarmWindow.Message1=Turbine.UI.Label(); 
	AlarmWindow.Message1:SetParent(AlarmWindow); 
	AlarmWindow.Message1:SetSize(598,50); 
	AlarmWindow.Message1:SetPosition(AlarmWindow:GetWidth()/2 - 299, AlarmWindow:GetHeight()/2 - 150); 
	AlarmWindow.Message1:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	AlarmWindow.Message1:SetForeColor(Turbine.UI.Color.Red); 
	AlarmWindow.Message1:SetFont(Turbine.UI.Lotro.Font.TrajanProBold36);
	AlarmWindow.Message1:SetText( namePlayer  ); 
	AlarmWindow.Message1:SetZOrder(10000);
	AlarmWindow.Message1:SetMouseVisible(true);
	AlarmWindow.Message1:SetBackColor(Turbine.UI.Color( .8, .5, .7, .5));


	AlarmWindow.Message2=Turbine.UI.Label(); 
	AlarmWindow.Message2:SetParent(AlarmWindow); 
	AlarmWindow.Message2:SetSize(600,50); 
	AlarmWindow.Message2:SetPosition(AlarmWindow:GetWidth()/2 - 300, AlarmWindow:GetHeight()/2 - 100); 
	AlarmWindow.Message2:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	AlarmWindow.Message2:SetForeColor(Turbine.UI.Color.Red); 
	AlarmWindow.Message2:SetFont(Turbine.UI.Lotro.Font.TrajanProBold36);
	AlarmWindow.Message2:SetText(Strings.PluginText4 .. HeureToDisplay); 
	AlarmWindow.Message2:SetZOrder(10000);
	AlarmWindow.Message2:SetMouseVisible(true);
	AlarmWindow.Message2:SetBackColor(Turbine.UI.Color( .8, .5, .7, .5));


	AlarmWindow.Message4=Turbine.UI.Label(); 
	AlarmWindow.Message4:SetParent(AlarmWindow); 
	AlarmWindow.Message4:SetSize(604,154); 
	AlarmWindow.Message4:SetPosition(AlarmWindow:GetWidth()/2 - 302, AlarmWindow:GetHeight()/2 - 204); 
	AlarmWindow.Message4:SetText(""); 
	AlarmWindow.Message4:SetZOrder(-1);
	AlarmWindow.Message4:SetBackColor(Turbine.UI.Color( 1, 0.3, 0.3, 0.3 ));

	AlarmWindow.Message4.MouseClick = function()
		AlarmWindow:SetVisible(false);
	end

	AlarmWindow.Message1.MouseClick = function()
		AlarmWindow:SetVisible(false);
	end

	AlarmWindow.Message2.MouseClick = function()
		AlarmWindow:SetVisible(false);
	end
end