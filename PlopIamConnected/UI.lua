------------------------------------------------------------------------------------------
-- create the main window
------------------------------------------------------------------------------------------
function CreateMainWindow()
	local windowWidth = 400;
	local windowHeight = 300;
	local buttonDelete = {};
	local ButtonPlusVoc = {}; 
	local centerLabelBVoc = {};


	PlopIamConnectedWindow=Turbine.UI.Lotro.GoldWindow(); 
	PlopIamConnectedWindow:SetSize(windowWidth,windowHeight); 
	PlopIamConnectedWindow:SetText(Strings.PluginName); 
	PlopIamConnectedWindow.Message=Turbine.UI.Label(); 
	PlopIamConnectedWindow.Message:SetParent(PlopIamConnectedWindow); 
	PlopIamConnectedWindow.Message:SetSize(150,10); 
	PlopIamConnectedWindow.Message:SetPosition(PlopIamConnectedWindow:GetWidth()/2 - 75, PlopIamConnectedWindow:GetHeight() - 18); 
	PlopIamConnectedWindow.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	PlopIamConnectedWindow.Message:SetText(Strings.PluginText); 
	PlopIamConnectedWindow:SetZOrder(0);
	PlopIamConnectedWindow:SetWantsKeyEvents(true);

	PlopIamConnectedWindow:SetPosition((Turbine.UI.Display:GetWidth()-PlopIamConnectedWindow:GetWidth())/2,(Turbine.UI.Display:GetHeight()-PlopIamConnectedWindow:GetHeight())/2);

	FriendChecker();
	--GuildeChecker();
	------------------------------------------------------------------------------------------
	-- center window
	------------------------------------------------------------------------------------------
	PlopIamConnectedWindow.Message=Turbine.UI.Label(); 
	PlopIamConnectedWindow.Message:SetParent(PlopIamConnectedWindow); 
	PlopIamConnectedWindow.Message:SetSize(300, 20); 
	PlopIamConnectedWindow.Message:SetPosition(50, 40); 
	PlopIamConnectedWindow.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	PlopIamConnectedWindow.Message:SetFont(Turbine.UI.Lotro.Font.Verdana18);
	PlopIamConnectedWindow.Message:SetText(Strings.PluginText1); 
  
	textBoxLines = Turbine.UI.Lotro.TextBox();
	textBoxLines:SetParent( PlopIamConnectedWindow );
	textBoxLines:SetSize(300, 30); 
	textBoxLines:SetText(""); 
	textBoxLines:SetPosition(50, 65);
	textBoxLines:SetVisible(true);
	textBoxLines:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	textBoxLines:SetForeColor( Turbine.UI.Color( 0.7, 0.6, 0.2 ));
	textBoxLines:SetBackColor( Turbine.UI.Color( .9, .5, .7, .5));

	buttonValider = Turbine.UI.Lotro.GoldButton();
	buttonValider:SetParent( PlopIamConnectedWindow );
	buttonValider:SetPosition(75, 110);
	buttonValider:SetSize( 300, 20 );
	buttonValider:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	buttonValider:SetText( Strings.PluginText2 );
	buttonValider:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
	buttonValider:SetVisible(true);
	buttonValider:SetMouseVisible(true);


	------------------------------------------------------------------------------------
	-- display the ^name of the friends
	------------------------------------------------------------------------------------

	------------------------------------------------------------------------------------------
	--- scrollbar handler
	------------------------------------------------------------------------------------------
	local SizeOfMap = settings["nbrFriends"]["value"] * 20;
	local posx = 0;
	local posy = 0;

	if(SizeOfMap < 101)then
		SizeOfMap = 100;
		posx = posx + 5;
	end

	PlopIamConnectedWindow.Message=Turbine.UI.Label(); 
	PlopIamConnectedWindow.Message:SetParent(PlopIamConnectedWindow); 
	PlopIamConnectedWindow.Message:SetSize(windowWidth, 20); 
	PlopIamConnectedWindow.Message:SetPosition(0, 145); 
	PlopIamConnectedWindow.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	PlopIamConnectedWindow.Message:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold19);
	PlopIamConnectedWindow.Message:SetText( Strings.PluginList .. " : " .. tostring(settings["nbrFriends"]["value"]) ); 

	-- create the viewport control all it needs is size and position as it is simply used to create viewable bounds for our map
	viewport1=Turbine.UI.Control();
	viewport1:SetParent(PlopIamConnectedWindow);
	viewport1:SetSize(windowWidth - 45, windowHeight - 200);
	viewport1:SetPosition(posx + 20, 170);
	viewport1:SetBackColor(Turbine.UI.Color( 0.05, 0.05, 0.05 ));
	viewport1:SetZOrder(1);

	viewportBackGround=Turbine.UI.Control();
	viewportBackGround:SetParent(PlopIamConnectedWindow);
	viewportBackGround:SetSize(windowWidth - 41, windowHeight - 196);
	viewportBackGround:SetPosition(posx + 18, 168);
	viewportBackGround:SetBackColor(Turbine.UI.Color( 0.4, 0.4, 0.4 ));
	viewportBackGround:SetZOrder(-1);


	-- create the map content for our viewport, again, it only needs size and position as it is just a container for the grid of images
	viewport1.map=Turbine.UI.Control();
	viewport1.map:SetParent(viewport1); -- set the map as a child of the viewport so that it will be bounded by it for drawing purposes
	viewport1.map:SetSize(windowWidth - 45, SizeOfMap); -- we'll use a 5x4 grid but this obviously could be expanded, or even set up as a recycled array of controls
	viewport1.map:SetPosition(0,0); -- we'll start off in the upper left


	for i=1, tonumber(settings["nbrFriends"]["value"]) do
		PlopIamConnectedWindow.Message=Turbine.UI.Label(); 
		PlopIamConnectedWindow.Message:SetParent(viewport1.map); 
		PlopIamConnectedWindow.Message:SetSize(windowWidth - 45, 20); 
		PlopIamConnectedWindow.Message:SetPosition(posx + 2, posy); 
		PlopIamConnectedWindow.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleLeft); 
		PlopIamConnectedWindow.Message:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold18);
		PlopIamConnectedWindow.Message:SetText( i .. " : "); 

		PlopIamConnectedWindow.Message=Turbine.UI.Label(); 
		PlopIamConnectedWindow.Message:SetParent(viewport1.map); 
		PlopIamConnectedWindow.Message:SetSize(windowWidth - 45, 20); 
		PlopIamConnectedWindow.Message:SetPosition(posx, posy); 
		PlopIamConnectedWindow.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
		PlopIamConnectedWindow.Message:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold22);
		PlopIamConnectedWindow.Message:SetForeColor(Turbine.UI.Color.Gold);
		PlopIamConnectedWindow.Message:SetText(tostring(settings["friends"]["name" .. i])); 

		-----------------------------------------------------------------
		-- button delete
		-----------------------------------------------------------------
		buttonDelete[i] = Turbine.UI.Control();
		buttonDelete[i]:SetParent( viewport1.map );
		buttonDelete[i]:SetPosition(windowWidth - 65, posy + 3);
		buttonDelete[i]:SetSize( 16, 16 );
		buttonDelete[i]:SetVisible(true);
		buttonDelete[i]:SetZOrder(19);
		buttonDelete[i]:SetBackground(0x410001C5);
		buttonDelete[i]:SetBlendMode(Turbine.UI.BlendMode.Overlay);

		ButtonPlusVoc[i] = Turbine.UI.Extensions.SimpleWindow();
		ButtonPlusVoc[i]:SetParent( viewport1.map );
		ButtonPlusVoc[i]:SetPosition(windowWidth - 45 , posy - 15 );
		ButtonPlusVoc[i]:SetSize( 180, 30 );
		ButtonPlusVoc[i]:SetVisible(false);
		ButtonPlusVoc[i]:SetZOrder(100);
		ButtonPlusVoc[i]:SetBackground(ResourcePath .. "/Cadre_180_30.tga");

		centerLabelBVoc[i] = Turbine.UI.Label();
		centerLabelBVoc[i]:SetParent(ButtonPlusVoc[i]);
		centerLabelBVoc[i]:SetPosition( 2, 2 );
		centerLabelBVoc[i]:SetSize( 176, 26  );
		centerLabelBVoc[i]:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold18);
		centerLabelBVoc[i]:SetText(Strings.PluginDelete .. " " .. tostring(settings["friends"]["name" .. i]));
		centerLabelBVoc[i]:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
		centerLabelBVoc[i]:SetZOrder(101);
		centerLabelBVoc[i]:SetForeColor(Turbine.UI.Color.Gold);
		centerLabelBVoc[i]:SetBackColor( Turbine.UI.Color( .8, .1, .4, .9) );

		buttonDelete[i].MouseEnter = function()
			ButtonPlusVoc[i]:SetVisible(true);
		end

		buttonDelete[i].MouseLeave = function()
			ButtonPlusVoc[i]:SetVisible(false);
		end

		buttonDelete[i].MouseClick = function()
			ClearFriend(settings["friends"]["name" .. i]);
			PlopIamConnectedWindow:SetVisible(false);
			SaveSettings();
			CreateMainWindow();
			PlopIamConnectedWindow:SetVisible(true);
		end



		posy = posy + 20;
	end


	------------------------------------------------------------------------------------------
	--- scrollbar handler
	------------------------------------------------------------------------------------------
	if(SizeOfMap >= viewport1:GetHeight() and SizeOfMap > 100)then
		-- create the vertical scrollbar for our viewport
		vscroll1=Turbine.UI.Lotro.ScrollBar();
		vscroll1:SetParent(PlopIamConnectedWindow);
		vscroll1:SetOrientation(Turbine.UI.Orientation.Vertical);
		vscroll1:SetPosition(windowWidth - 20, 170);
		vscroll1:SetSize(12,viewport1:GetHeight()); -- set width to 12 since it's a "Lotro" style scrollbar and the height is set to match the control that we will be scrolling
		vscroll1:SetBackColor(Turbine.UI.Color(.1,.1,.2)); -- just to give it a little style
		vscroll1:SetMinimum(0);
		vscroll1:SetMaximum(viewport1.map:GetHeight()-viewport1:GetHeight()); -- we will allow scrolling the height of the map-the viewport height
		vscroll1:SetValue(0); -- set the initial value
		-- set the ValueChanged event handler to take an action when our value changes, in this case, change the map position relative to the viewport
		vscroll1.ValueChanged=function()
			viewport1.map:SetTop(0-vscroll1:GetValue());
		end
	end

	ValidateChanges();

	PlopIamConnectedWindow.KeyDown=function(sender, args)
		if ( args.Action == Turbine.UI.Lotro.Action.Escape ) then
			PlopIamConnectedWindow:SetVisible(false);
		end
	
		-- https://www.lotro.com/forums/showthread.php?493466-How-to-hide-a-window-on-F12&p=6581962#post6581962
		if ( args.Action == 268435635 ) then
			hudVisible=not hudVisible;
			if hudVisible then
				PlopIamConnectedWindow:SetVisible(false);
				MainMinimizedIcon:SetVisible(false);
			else
				MainMinimizedIcon:SetVisible(true);
			end
		end
	end
end


function ValidateChanges()
	buttonValider.MouseClick = function(sender, args)
		local valToAdd = textBoxLines:GetText();
		if(valToAdd ~= nil and valToAdd ~= "")then
			if(settings["nbrFriends"]["value"] == nil or settings["nbrFriends"]["value"] == 0)then
				settings["nbrFriends"]["value"] = 1;
			else
				settings["nbrFriends"]["value"] = settings["nbrFriends"]["value"] + 1;
			end

			settings["friends"]["name" .. tonumber(settings["nbrFriends"]["value"])] = textBoxLines:GetText();
			Turbine.Shell.WriteLine(rgb["start"] .. Strings.PluginName .. rgb["clear"] .. " : " .. 
			settings["friends"]["name" .. tonumber(settings["nbrFriends"]["value"])] .. " " .. Strings.PluginAdded);

			PlopIamConnectedWindow:SetVisible(false);
			SaveSettings();
			CreateMainWindow();
			PlopIamConnectedWindow:SetVisible(true);
		end
	end
end