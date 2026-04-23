
PlopIamConnectedCommand = Turbine.ShellCommand();

------------------------------------------------------------------------------------------
-- commands
------------------------------------------------------------------------------------------
function PlopIamConnectedCommand:Execute( command, arguments )

-- Turn arguments to lower case characters --
	local args, value = arguments:match "(clear) (.*)";

	arguments = string.lower(arguments);

	-- Help command--
	if ( arguments == "help" ) then
		Turbine.Shell.WriteLine(Strings.PluginHelp);
	elseif ( arguments == "show" ) then
		--Turbine.Shell.WriteLine("Show the PlopIamConnected Window");
		PlopIamConnectedWindow:SetVisible(true);
		settings["isWindowVisible"]["isWindowVisible"] = true;
		SaveSettings();
	elseif ( arguments == "hide" ) then
		--Turbine.Shell.WriteLine("Hide the PlopIamConnected Window");
		PlopIamConnectedWindow:SetVisible(false);
		settings["isWindowVisible"]["isWindowVisible"] = false;
		SaveSettings();
------------------------------------------------------------------------------------------
-- alt command--
------------------------------------------------------------------------------------------
	elseif ( arguments == "alt" ) then
		if(settings["altEnable"]["altEnable"] == true) then
			Turbine.Shell.WriteLine(rgb["start"] .. Strings.PluginName .. rgb["clear"] .. " - " .. Strings.PluginAltDesable);
			settings["altEnable"]["altEnable"] = false;
		else
			Turbine.Shell.WriteLine(rgb["start"] .. Strings.PluginName .. rgb["clear"] .. " - " .. Strings.PluginAltEnable);
			settings["altEnable"]["altEnable"] = true;
		end
		SaveSettings();
------------------------------------------------------------------------------------------
-- esc command--
------------------------------------------------------------------------------------------
	elseif ( arguments == "esc" ) then
		if(settings["escEnable"]["escEnable"] == true) then
			Turbine.Shell.WriteLine(rgb["start"] .. Strings.PluginName .. rgb["clear"] .. " - " .. Strings.PluginEscDesable);
			settings["escEnable"]["escEnable"] = false;
		else
			Turbine.Shell.WriteLine(rgb["start"] .. Strings.PluginName .. rgb["clear"] .. " - " .. Strings.PluginEscEnable);
			settings["escEnable"]["escEnable"] = true;
		end
		SaveSettings();
------------------------------------------------------------------------------------------
-- toggle command--
------------------------------------------------------------------------------------------
	elseif ( arguments == "toggle" ) then
		if(settings["isWindowVisible"]["isWindowVisible"] == true)then
			Turbine.Shell.WriteLine(rgb["start"] .. Strings.PluginName .. rgb["clear"] .. " - " .. Strings.PluginWindowHide);
			PlopIamConnectedWindow:SetVisible(false);
			settings["isWindowVisible"]["isWindowVisible"] = false;
		else
			Turbine.Shell.WriteLine(rgb["start"] .. Strings.PluginName .. rgb["clear"] .. " - " .. Strings.PluginWindowShow);
			PlopIamConnectedWindow:SetVisible(true);
			settings["isWindowVisible"]["isWindowVisible"] = true;
		end
		SaveSettings();
	elseif ( arguments == "clearall" ) then
		--Turbine.Shell.WriteLine("clear the PlopIamConnected Window");
		Turbine.Shell.WriteLine(rgb["start"] .. Strings.PluginName .. rgb["clear"] .. " : " .. Strings.PluginDeleteAll);
		for i=1, tonumber(settings["nbrFriends"]["value"]) do
			settings["friends"]["name" .. i] = "";
		end
		settings["nbrFriends"]["value"] = 0;
		SaveSettings();
	elseif ( arguments == "list" ) then
		--Turbine.Shell.WriteLine("clear the PlopIamConnected Window");
		Turbine.Shell.WriteLine(rgb["start"] .. Strings.PluginName .. rgb["clear"] .. " : " .. Strings.PluginList .. " : " .. tostring(settings["nbrFriends"]["value"]));
		for i=1, tonumber(settings["nbrFriends"]["value"]) do
			Turbine.Shell.WriteLine(tostring(settings["friends"]["name" .. i]));
		end
	elseif ( args == "clear" ) then
		--Turbine.Shell.WriteLine("clear the PlopIamConnected Window");
		if(value ~= nil)then
			ClearFriend(value);
		end
	elseif ( arguments ~= "help" or 
			arguments ~= "show" or 
			arguments ~= "hide" or 
			arguments ~= "alt" or 
			arguments ~= "esc" or 
			arguments ~= "toggle" or 
			arguments ~= "clearall" or 
			arguments ~= "list") then
			-- nothing found, so display the help
		Turbine.Shell.WriteLine(Strings.PluginHelp);
	end
end

Turbine.Shell.AddCommand( "Plop;PlopIamConnected", PlopIamConnectedCommand );