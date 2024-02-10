
function CreateLocalizationInfo()
	Strings = {};
	
	------------------------------------------------------------------------------------------
	-- datas for special character
	------------------------------------------------------------------------------------------
	-- ü = \195\188
	-- ä = \195\164
	-- ö = \195\182
	-- Ä = \195\132
	-- ß = \195\159
	-- à = \195\160
	-- é = \195\169
	-- è = \195\168

	if Turbine.Engine.GetLanguage() == Turbine.Language.German then
		Strings.PluginName = "PlopIamConnected";
		Strings.PluginText = "Von Homeopatix";
		Strings.PluginText1 = "Gib den Charakternamen ein";
		Strings.PluginText2 = "Hinzuf\195\188gen";
		Strings.PluginText3 = "Dein Freund";
		Strings.PluginText4 = "Bin gerade online gegangen bei ";
		Strings.PluginText5 = "Ein Sippenmitglied";
		Strings.PluginEscEnable = "Escape-Taste aktiviert";
		Strings.PluginEscDesable = "Escape-Taste deaktiviert";
		Strings.PluginAltEnable = "Alt-Taste aktiviert";
		Strings.PluginAltDesable = "Alt-Taste deaktiviert";
		Strings.PluginDelete = "gel\195\182scht";
		Strings.PluginDeleteAll = "Alle Freunde gel\195\182scht";
		Strings.PluginAdded = "hinzugef\195\188gt";
		Strings.PluginList = "Liste der Freunde";
		Strings.PluginWindowShow = "Fenster wird angezeigt";
		Strings.PluginWindowHide = "Fenster wird ausgeblendet";
		Strings.PluginHelp = " *** PlopIamConnected Hilfe ***\n\n" ..
		"/plop show - Zeigt das Fenster an.\n" ..
		"/plop hide - Blendet das Fenster aus.\n" ..
		"/plop list - Zeigt eine Liste der Freunde an.\n" ..
		"/plop clearall - L\195\182scht alle Freunde.\n" ..
		"/plop alt - Alt-Taste gedr\195\188ckt halten, um das Symbol zu verschieben.\n" ..
		"/plop esc - Aktiviert/Deaktiviert die Escape-Taste, um das Fenster zu schlie\195\159en.\n" ..
		"/plop clear <name> - L\195\182scht den entsprechenden Freund.\n" ..
		"/plop toggle - Fenster anzeigen/ausblenden.\n\n";

elseif Turbine.Engine.GetLanguage() == Turbine.Language.French then
		Strings.PluginName = "PlopIamConnected";
		Strings.PluginText = "Par Homeopatix";
		Strings.PluginText1 = "Entrer le nom du joueur";
		Strings.PluginText2 = "Entrer nouvel ami";
		Strings.PluginText3 = "Votre ami(e)";
		Strings.PluginText4 = "Vient de se connect\195\169(e) \195\160 ";
		Strings.PluginText5 = "Votre ami(e) de guilde";
		Strings.PluginEscEnable = "Touche Escape activ\195\169";
		Strings.PluginEscDesable = "Touche Escape desactiv\195\169";
		Strings.PluginAltEnable = "Touche Alt activ\195\169";
		Strings.PluginAltDesable = "Touche Alt desactiv\195\169";
		Strings.PluginDelete = "Supprim\195\169";
		Strings.PluginDeleteAll = "Tous les amis ont \195\169t\195\169 supprim\195\169";
		Strings.PluginAdded = "ajout\195\169";
		Strings.PluginList = "Liste des amis";
		Strings.PluginWindowShow = "Affiche la fen\195\168tre.";
		Strings.PluginWindowHide = "Cache la fen\195\168tre.";
		Strings.PluginHelp = " *** PlopIamConnected Aide ***\n\n" ..
		"/Plop show affiche La fen\195\170tre\n" ..
		"/Plop hide cache la fen\195\170tre\n" ..
		"/Plop list affiche tous les amis\n" ..
		"/Plop clearall Efface tous les amis\n" ..
		"/Plop esc - Active ou d\195\169sactive la touche Escape.\n" ..
		"/Plop alt - Active ou d\195\169sactive la touche alt pour le d\195\169placement de l'icon.\n" ..
		"/Plop clear <naomdelami> efface <naomdelami>\n" ..
		"/Plop toggle - Affiche ou cache la fenetre.\n\n";

elseif Turbine.Engine.GetLanguage() == Turbine.Language.English then
		Strings.PluginName = "PlopIamConnected";
		Strings.PluginText = "By Homeopatix";
		Strings.PluginText1 = "Enter the player name";
		Strings.PluginText2 = "Enter new friend";
		Strings.PluginText3 = "Your friend";
		Strings.PluginText4 = "Just got online at ";
		Strings.PluginText5 = "Your guild mate";
		Strings.PluginEscEnable = "Escape key Activated";
		Strings.PluginEscDesable = "Escape key Desactivated";
		Strings.PluginAltEnable = "Alt key Activated";
		Strings.PluginAltDesable = "Alt key Desactivated";
		Strings.PluginDelete = "Delete";
		Strings.PluginDeleteAll = "All friends deleted";
		Strings.PluginAdded = "added";
		Strings.PluginList = "List of friends";
		Strings.PluginWindowShow = "Show the window.";
		Strings.PluginWindowHide = "Hide the window.";
		Strings.PluginHelp = " *** PlopIamConnected Help ***\n\n" ..
		"/Plop show displays the window\n" ..
		"/Plop hide hide the window\n" ..
		"/Plop list show all friends\n" ..
		"/Plop clearall delete all the friends\n" ..
		"/Plop esc - Activate or deactivate the Escape key.\n" ..
		"/Plop alt - Activate or deactivate the alt key to move the icon.\n" ..
		"/Plop clear <friendname> delete friend <friendname>\n" ..
		"/Plop toggle - Display or hide the window.\n\n";
	end
end
