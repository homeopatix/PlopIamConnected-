-- Plugin's name --
pluginName = "PlopIamConnected";

-- File names --
settingsFileName = "PlopIamConnected_Settings";

-- Default settings --
settings = {
    windowPosition = { 
        xPos = 0, 
        yPos = 0 
    },
    nbrFriends = { 
        value = 0
    },
    friends = { 
        name1 = "", 
        name2 = "", 
        name3 = "", 
        name4 = "", 
        name5 = "", 
        name6 = "", 
        name7 = "", 
        name8 = "", 
        name9 = "", 
        name10 = "",
        name11 = "", 
        name12 = "", 
        name13 = "", 
        name14 = "", 
        name15 = "", 
        name16 = "", 
        name17 = "", 
        name18 = "", 
        name19 = "", 
        name20 = ""
    },
    IconPosition = { 
        xPosIcon = 100, 
        yPosIcon = 100 
    },
    isMinimizeEnabled = { 
        isMinimizeEnabled = true 
    },
    isWindowVisible = { 
        isWindowVisible = true 
    },
    escEnable = { 
        escEnable = true 
    },
    altEnable = { 
        altEnable = true 
    }
};

-- Resources settings --
ResourcePath = "Homeopatix/PlopIamConnected/Resources/";

Images = {
	MinimizedIcon = ResourcePath .. "PlopIamConnected.tga",
};

-- RGB color codes --
rgb = {
    start = "<rgb=#DAA520>",
    gold = "<rgb=#FFD700>",
    orange = "<rgb=#EE8F12>",
    white = "<rgb=#FFFFFF>",
    green = "<rgb=#1FE126>",
    blue = "<rgb=#1FCDE1>",
    purple = "<rgb=#9B41CE>",
    yellow = "<rgb=#FFFF00>",
    grey = "<rgb=#C7C7BE>",
    red = "<rgb=#FF0000>",
    error = "<rgb=#FF0000>",
    clear = "</rgb>"
};

-- Load settings --
LoadSettings();