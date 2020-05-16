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

InSPreCaching(args)
{
	C_ICMENU::AddMenu("team", "team_marinesopfor");
	C_ICMENU::AddMenu("controls", "ingame_controls");
	C_ICMENU::AddMenu("options", "ingame_options");
	
	C_ICMENU::AddMenu("clientcmd", "clientcmd");
	C_ICMENU::AddMenu("scoreboard", "scoreboard");
	
	C_ICMENU::AddMenu("vg", "vg");
	
	C_ICMENU::AddMenu("quickcommands", "quickcommands");
	C_ICMENU::AddMenu("quickstatements", "quickstatements");
	C_ICMENU::AddMenu("quickresponses", "quickresponses");
	C_ICMENU::AddMenu("quickplayer", "quickplayer");
	C_ICMENU::AddMenu("quickgraphics", "quickgraphics");
	
	C_ICMENU::AddMenu("class_allies", "class_allies");
	C_ICMENU::AddMenu("class_axis", "class_axis");
	
	C_ICMENU::AddMenu("rank", "rank");
	C_ICMENU::AddMenu("challenges", "challenges");
	
	C_ICMENU::AddMenu("info", "info");
	
	//C_ICMENU::AddMenu("victory_marines", "victory_marines");
	//C_ICMENU::AddMenu("victory_none", "victory_none");
	//C_ICMENU::AddMenu("victory_opfor", "victory_opfor");
	
	C_ICMENU::AddMenu("endofgame", "endofgame");
	
	C_ICMENU::AddMenu("votemap", "votemap");
}

OnCConnected(args)
{
	self thread MonitorMenuResponses();
}

private MonitorMenuResponses()
{
	self endon("disconnect");
	
	while (true)
	{
		self waittill("menuresponse", sMenuName, sResponse);
		self ProcessMenuResponse(sMenuName, sResponse);
	}
}

private ProcessMenuResponse(sMenuName, sResponse)
{
	responseArgs = StrTok(sResponse, ",");
	sResponse = responseArgs[0];
	
	C_IDEBUG::Debug("sMenuName;" + sMenuName + ";sResponse;" + sResponse + ";Args;" + ISTRING::Join(",", responseArgs));
	
	if (sResponse == "onOpen")
	{
		self C_ICMENU::SetOpenedMenu(sMenuName, sResponse, responseArgs);
		return;
	}
	
	if (self CheckGameLogicResponses(sResponse))
		return;
	
	if (self CheckLeavingGame(sResponse))
		return;
	
	args = IECALLBACK::Args_Create();
	args.sMenuName = sMenuName;
	args.sResponse = sResponse;
	args.ResponseArgs = responseArgs;
	self C_INIT::MENU_RunOnCResponded(args);
}

private CheckGameLogicResponses(sResponse)
{
	switch (sResponse)
	{
		case "joinAny":
			self C_IGLLOGIC::CJoinTeam();
			return true;
		case "joinSpectators":
			self C_IGLLOGIC::CJoinSpectators();
			return true;
		default:
			return false;
	}
}

private CheckLeavingGame(sResponse)
{
	if (sResponse == "leaving")
	{
		args = IECALLBACK::Args_Create();
		args.bCancel = undefined;
		self C_INIT::RunInCLeaving(args);
		if (!IsDefined(args.bCancel))
			self C_ICCMD::Command("disconnect;");
		
		return true;
	}
	return false;
}