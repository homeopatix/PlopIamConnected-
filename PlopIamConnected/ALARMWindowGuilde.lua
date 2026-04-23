------------------------------------------------------------------------------------------
-- create the Alarm window
------------------------------------------------------------------------------------------
function CreateAlarmWindowGuilde(namePlayer, HeureToDisplay)

	AlarmWindowGuild=Turbine.UI.Extensions.SimpleWindow();
	AlarmWindowGuild:SetSize(600,450); 
	AlarmWindowGuild:SetZOrder(1000);
	AlarmWindowGuild:SetBackColor(Turbine.UI.Color( .01, .5, .7, .5));
	AlarmWindowGuild:SetVisible(false);
	AlarmWindowGuild:SetWantsUpdates(true);

	AlarmWindowGuild:SetPosition((Turbine.UI.Display:GetWidth()-AlarmWindowGuild:GetWidth())/2,(Turbine.UI.Display:GetHeight()-AlarmWindowGuild:GetHeight())/2 - 450);

	AlarmWindowGuild.Message3=Turbine.UI.Label(); 
	AlarmWindowGuild.Message3:SetParent(AlarmWindowGuild); 
	AlarmWindowGuild.Message3:SetSize(600,50); 
	AlarmWindowGuild.Message3:SetPosition(AlarmWindowGuild:GetWidth()/2 - 300, AlarmWindowGuild:GetHeight()/2 - 150); 
	AlarmWindowGuild.Message3:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	AlarmWindowGuild.Message3:SetForeColor(Turbine.UI.Color.Red); 
	AlarmWindowGuild.Message3:SetFont(Turbine.UI.Lotro.Font.TrajanProBold36);
	AlarmWindowGuild.Message3:SetText( Strings.PluginText5  );
	AlarmWindowGuild.Message3:SetZOrder(10000);
	AlarmWindowGuild.Message3:SetMouseVisible(true);
	AlarmWindowGuild.Message3:SetBackColor(Turbine.UI.Color(.8, 0, .8, 1));

	AlarmWindowGuild.Message1=Turbine.UI.Label(); 
	AlarmWindowGuild.Message1:SetParent(AlarmWindowGuild); 
	AlarmWindowGuild.Message1:SetSize(600,50); 
	AlarmWindowGuild.Message1:SetPosition(AlarmWindowGuild:GetWidth()/2 - 300, AlarmWindowGuild:GetHeight()/2 - 100); 
	AlarmWindowGuild.Message1:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	AlarmWindowGuild.Message1:SetForeColor(Turbine.UI.Color.Red); 
	AlarmWindowGuild.Message1:SetFont(Turbine.UI.Lotro.Font.TrajanProBold36);
	AlarmWindowGuild.Message1:SetText( namePlayer  ); 
	AlarmWindowGuild.Message1:SetZOrder(10000);
	AlarmWindowGuild.Message1:SetMouseVisible(true);
	AlarmWindowGuild.Message1:SetBackColor(Turbine.UI.Color(.8, 0, .8, 1));

	AlarmWindowGuild.Message2=Turbine.UI.Label(); 
	AlarmWindowGuild.Message2:SetParent(AlarmWindowGuild); 
	AlarmWindowGuild.Message2:SetSize(600,50); 
	AlarmWindowGuild.Message2:SetPosition(AlarmWindowGuild:GetWidth()/2 - 300, AlarmWindowGuild:GetHeight()/2 - 50); 
	AlarmWindowGuild.Message2:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	AlarmWindowGuild.Message2:SetForeColor(Turbine.UI.Color.Red); 
	AlarmWindowGuild.Message2:SetFont(Turbine.UI.Lotro.Font.TrajanProBold36);
	AlarmWindowGuild.Message2:SetText(Strings.PluginText4 .. HeureToDisplay); 
	AlarmWindowGuild.Message2:SetZOrder(10000);
	AlarmWindowGuild.Message2:SetMouseVisible(true);
	AlarmWindowGuild.Message2:SetBackColor(Turbine.UI.Color(.8, 0, .8, 1));

	AlarmWindowGuild.Message4=Turbine.UI.Label(); 
	AlarmWindowGuild.Message4:SetParent(AlarmWindowGuild); 
	AlarmWindowGuild.Message4:SetSize(604,154); 
	AlarmWindowGuild.Message4:SetPosition(AlarmWindowGuild:GetWidth()/2 - 302, AlarmWindowGuild:GetHeight()/2 - 154); 
	AlarmWindowGuild.Message4:SetText(""); 
	AlarmWindowGuild.Message4:SetZOrder(-1);
	AlarmWindowGuild.Message4:SetBackColor(Turbine.UI.Color( 1, 0.3, 0.3, 0.3 ));

	AlarmWindowGuild.Message3.MouseClick = function()
		AlarmWindowGuild:SetVisible(false);
	end

	AlarmWindowGuild.Message1.MouseClick = function()
		AlarmWindowGuild:SetVisible(false);
	end

	AlarmWindowGuild.Message2.MouseClick = function()
		AlarmWindowGuild:SetVisible(false);
	end
end