------------------------------------------------------------------------------------------
-- create or load the settings
------------------------------------------------------------------------------------------
function LoadSettings()
	local _settings = PatchDataLoad(Turbine.DataScope.Account, "PlopIamConnected_Settings", settings);
    if (_settings ~= nil) then 
		settings = _settings; 
	end

	if (not settings.altEnable)then
		settings = {
            windowPosition = { 
                xPos = settings["windowPosition"]["xPos"], 
                yPos = settings["windowPosition"]["yPos"] 
            },
            nbrFriends = { 
                value = settings["nbrFriends"]["value"]
            },
            friends = { 
                name1 = settings["friends"]["name1"], 
                name2 = settings["friends"]["name2"], 
                name3 = settings["friends"]["name3"], 
                name4 = settings["friends"]["name4"], 
                name5 = settings["friends"]["name5"], 
                name6 = settings["friends"]["name6"], 
                name7 = settings["friends"]["name7"], 
                name8 = settings["friends"]["name8"], 
                name9 = settings["friends"]["name9"], 
                name10 = settings["friends"]["name10"],
                name11 = settings["friends"]["name11"], 
                name12 = settings["friends"]["name12"], 
                name13 = settings["friends"]["name13"], 
                name14 = settings["friends"]["name14"], 
                name15 = settings["friends"]["name15"], 
                name16 = settings["friends"]["name16"], 
                name17 = settings["friends"]["name17"], 
                name18 = settings["friends"]["name18"], 
                name19 = settings["friends"]["name19"], 
                name20 = settings["friends"]["name20"] 
            },
            IconPosition = { 
                xPosIcon = settings["IconPosition"]["xPosIcon"], 
                yPosIcon = settings["IconPosition"]["yPosIcon"] 
            },
            isMinimizeEnabled = { 
                isMinimizeEnabled = settings["isMinimizeEnabled"]["isMinimizeEnabled"] 
            },
            isWindowVisible = { 
                isWindowVisible = settings["isWindowVisible"]["isWindowVisible"] 
            },
            escEnable = { 
                escEnable = settings["escEnable"]["escEnable"] 
            },
            altEnable = { 
                altEnable = true 
            }
        };
	end
end
------------------------------------------------------------------------------------------
-- create the save settings
------------------------------------------------------------------------------------------
function SaveSettings()
	settings["windowPosition"]["xPos"] = tostring(PlopIamConnectedWindow:GetLeft());
    settings["windowPosition"]["yPos"] = tostring(PlopIamConnectedWindow:GetTop());
    settings["IconPosition"]["xPosIcon"] = tostring(MainMinimizedIcon:GetLeft());
   	settings["IconPosition"]["yPosIcon"] = tostring(MainMinimizedIcon:GetTop());
	settings["isMinimizeEnabled"]["isMinimizeEnabled"] = settings["isMinimizeEnabled"]["isMinimizeEnabled"];
	settings["isWindowVisible"]["isWindowVisible"] = settings["isWindowVisible"]["isWindowVisible"];
	settings["escEnable"]["escEnable"] = settings["escEnable"]["escEnable"];
	settings["altEnable"]["altEnable"] = settings["altEnable"]["altEnable"];
	settings["nbrFriends"]["value"] = tonumber(settings["nbrFriends"]["value"]);

	for i=1, tonumber(settings["nbrFriends"]["value"]) do
		settings["friends"]["name" .. i] = tostring(settings["friends"]["name" .. i]);
	end
   
   -- save the settings
	PatchDataSave( Turbine.DataScope.Account, "PlopIamConnected_Settings", settings);
end
