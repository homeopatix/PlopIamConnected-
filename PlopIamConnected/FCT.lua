------------------------------------------------------------------------------------------
-- Closing window handler
------------------------------------------------------------------------------------------
function ClosingTheWindow()
	function PlopIamConnectedWindow:Closing(sender, args)
		settings["isWindowVisible"]["isWindowVisible"] = false;
		SaveSettings();
	end
end
------------------------------------------------------------------------------------------
-- friend checker from chat
------------------------------------------------------------------------------------------
function FriendChecker()
	local GLocale = "";
	if Turbine.Engine.GetLanguage() == Turbine.Language.German then
		GLocale = "de";
	elseif Turbine.Engine.GetLanguage() == Turbine.Language.French then
		GLocale = "fr";
	elseif Turbine.Engine.GetLanguage() == Turbine.Language.English then
		GLocale = "en";
	end

	Turbine.Chat.Received = function(sender, args)
        local rpMess = args.Message;
		local rpName = "";

		local cdate = Turbine.Engine.GetDate();
		local nowtime = Turbine.Engine.GetLocalTime();
		local chour = cdate.Hour;
		local cminute = cdate.Minute;
		local csecond = cdate.Second;

		if(chour < 10)then
			chour = "0" .. chour;
		end
		if(cminute < 10)then
			cminute = "0" .. cminute;
		end
		if(csecond < 10)then
			csecond = "0" .. csecond;
		end

				local paternName;

                if rpMess ~= nil then
                -- Check string, Reputation Name and Reputation Point pattern
                    if GLocale == "en" then
                        paternName = "([%a%p%u%l%s]*) has come online.";
						rpName = string.match( rpMess, paternName );
                    elseif GLocale == "fr" then
						paternName = ", ([%a%p%u%l%s]*), s'est connect\195\169";
						rpName = string.match( rpMess, paternName );
                    elseif GLocale == "de" then
                        paternName = "([%a%p%u%l%s]*) ist jetzt online.";
						rpName = string.match( rpMess, paternName );
                    end
				end

				if(rpName ~= nil)then
					for i=1, tonumber(settings["nbrFriends"]["value"]) do
						if(rpName == settings["friends"]["name" .. i])then

							local HeureToDisplay = chour .. ":" .. cminute .. ":" .. csecond;

							CreateAlarmWindowAmi(settings["friends"]["name" .. i], HeureToDisplay);
							AlarmWindow:SetVisible(true);
							--Turbine.Shell.WriteLine("1 : " .. rgb["start"] .. 
							--pluginName .. rgb["clear"] .. " : " .. HeureToDisplay .. " : " .. 
							--rpName .. " Vient de se connecter !!!!");
						end
					end
				end
		----------------------------------------------------------------------------
		-- check for guild friend
		----------------------------------------------------------------------------
		local rpMess2 = args.Message;
		local rpNameGuild = "";

		cdate = Turbine.Engine.GetDate();
		nowtime = Turbine.Engine.GetLocalTime();
		chour = cdate.Hour;
		cminute = cdate.Minute;
		csecond = cdate.Second;

		if(chour < 10)then
			chour = "0" .. chour;
		end
		if(cminute < 10)then
			cminute = "0" .. cminute;
		end
		if(csecond < 10)then
			csecond = "0" .. csecond;
		end

				local paternNameGuild;

                if rpMess2 ~= nil then
                -- Check string, Reputation Name and Reputation Point pattern
                    if GLocale == "en" then
						paternNameGuild = "([%a%p%u%l%s]*) has come online.";
						rpNameGuild = string.match( rpMess2, paternNameGuild );
                    elseif GLocale == "fr" then
						paternNameGuild = "([%a%p%u%l%s]*) est en ligne.";
						rpNameGuild = string.match( rpMess2, paternNameGuild );
                    elseif GLocale == "de" then
						paternNameGuild = "([%a%p%u%l%s]*) ist jetzt online.";
						rpNameGuild = string.match( rpMess2, paternNameGuild );
                    end
				end
				if(rpNameGuild ~= nil)then
					for i=1, tonumber(settings["nbrFriends"]["value"]) do
						if(rpNameGuild == settings["friends"]["name" .. i])then

							local HeureToDisplay = chour .. ":" .. cminute .. ":" .. csecond;

							CreateAlarmWindowGuilde(settings["friends"]["name" .. i], HeureToDisplay);
							AlarmWindowGuild:SetVisible(true);
							--Turbine.Shell.WriteLine("1 : " .. rgb["start"] .. 
							--pluginName .. rgb["clear"] .. " : " .. HeureToDisplay .. " : " .. 
							--rpName .. " Vient de se connecter !!!!");
						end
					end
				end
	end
end
------------------------------------------------------------------------------------------
-- clear special friend
------------------------------------------------------------------------------------------
function ClearFriend(value)
	listTmp = {};

	for i=1, tonumber(settings["nbrFriends"]["value"]) do
		table.insert(listTmp, settings["friends"]["name" .. i]);
		if(value == settings["friends"]["name" .. i])then
			itemToremove = i;
			settings["nbrFriends"]["value"] = settings["nbrFriends"]["value"] - 1;
			Turbine.Shell.WriteLine(rgb["start"] .. Strings.PluginName .. rgb["clear"] .. " : " .. value .. " " .. Strings.PluginDelete);
		end
	end

	table.remove(listTmp, itemToremove);

	for i=1, tonumber(settings["nbrFriends"]["value"] + 1) do
		settings["friends"]["name" .. i] = "";
	end

	for i=1, tonumber(settings["nbrFriends"]["value"]) do
		settings["friends"]["name" .. i] = listTmp[i];
	end

	SaveSettings();
end