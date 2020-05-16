//I========================================================================I
//I                    ___  _____  _____                                   I
//I                   /   !!  __ \!  ___!                                  I
//I                  / /! !! !  \/! !_          ___  ____                  I
//I                 / /_! !! ! __ !  _!        / __!!_  /                  I
//I                 \___  !! !_\ \! !      _  ! (__  / /                   I
//I                     !_/ \____/\_!     (_)  \___!/___!                  I
//I                                                                        I
//I========================================================================I
// Call of Duty 4: Modern Warfare
//I========================================================================I
// Mod      : Deathrun
// Website  : http://www.4gf.cz/
//I========================================================================I
// Script by: PetX
//I========================================================================I

#include core\include\_usings;
#include custom\include\_usings;

public AddMenu(name, menuFile)
{
	game["menu_" + name] = menuFile;
	precacheMenu(game["menu_" + name]);
}

public GetMenu(name)
{
	return game["menu_" + name];
}

public GetOpenedMenu()
{
	return self.OpenedMenu;
}

public SetOpenedMenu(sMenuName, sResponse, responseArgs)
{
	self.OpenedMenu = SpawnStruct();
	self.OpenedMenu.sMenuName = sMenuName;
	
	args = IECALLBACK::Args_Create();
	args.sMenuName = sMenuName;
	args.sResponse = sResponse;
	args.ResponseArgs = responseArgs;
	args.OpenedMenu = self.OpenedMenu;
	self C_INIT::MENU_RunOnCOpened(args);
}