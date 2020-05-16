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
	InitCurMap();
}

private InitCurMap()
{
	if (!IsDefined(game["iMapPopSum"]))
	{
		popInfo = C_IMAPPOP::POP_Get(IGAME::GetMap());
		game["iMapPopSum"] = popInfo C_IMAPPOP::POP_GetRateSum();
		game["iMapPopSumInc"] = 0;
		game["iMapPopRateTimes"] = popInfo C_IMAPPOP::POP_GetRateTimes();
		game["iMapPopRateTimesInc"] = 0;	
	}
}

GL_InSTerminatingMap(args)
{
	SaveCurMap();
}

private SaveCurMap()
{
	C_IMAPPOP::IncRateMap(IGAME::GetMap(), game["iMapPopSumInc"], game["iMapPopRateTimesInc"], 1);
}

InCPreConnecting(args)
{
	iStars = self.pers["iMapPopularitySelected"];
	if (!IsDefined(iStars))
		iStars = 0;
		
	args.DvarDic IDIC::Add("ui_mapMyRate", iStars);
}

MENU_OnCResponded(args)
{
	if (IsDefined(self.pers["iMapPopularitySelected"]))
		return;

	if (args.sResponse == "lgRate")
		self RateLeave(Int(args.ResponseArgs[1]));
	else if (args.sResponse == "vmRate")
		self RateVote(Int(args.ResponseArgs[1]));
}

private RateLeave(iStars)
{
	self.pers["iMapPopularitySelected"] = iStars;
	C_IMAPPOP::RateCurMap(iStars);
		
	args = IECALLBACK::Args_Create();
	args.iStars = iStars;
	self C_INIT::MPOP_RunOnCRatedLeave(args);
}

private RateVote(iStars)
{
	self.pers["iMapPopularitySelected"] = iStars;
	C_IMAPPOP::RateCurMap(iStars);
		
	args = IECALLBACK::Args_Create();
	args.iStars = iStars;
	self C_INIT::MPOP_RunOnCRatedVote(args);
}