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

public POP_Get(sMapName)
{
	pop = SpawnStruct();
	pop.iRateSum = 0;
	pop.iRateTimes = 0;
	pop.iPlayedTimes = 0;
	
	// value: iRateSum;iRateTimes;iPlayedTimes
	sPopInfo = C_IMAPVARS::Get(sMapName, "pop");
	if (IsDefined(sPopInfo) && sPopInfo != "")
	{
		sToks = StrTok(sPopInfo, ";");
		if (sToks.size >= 2)
		{
			pop.iRateSum = Int(sToks[0]);
			pop.iRateTimes = Int(sToks[1]);
		}
		
		if (sToks.size >= 3)
			pop.iPlayedTimes = Int(sToks[2]);
	}
		
	return pop;
}

public POP_Set(sMapName)
{
	C_IMAPVARS::Set(sMapName, "pop", self.iRateSum + ";" + self.iRateTimes + ";" + self.iPlayedTimes);
}

public POP_GetPopularity()
{
	if (self.iRateTimes == 0)
		return 0;

	return self.iRateSum / self.iRateTimes;
}

public POP_GetRateSum()
{
	return self.iRateSum;
}

public POP_IncRateSum(iVotes)
{
	self.iRateSum += iVotes;
}

public POP_GetRateTimes()
{
	return self.iRateTimes;
}

public POP_IncRateTimes(iTimes)
{
	self.iRateTimes += iTimes;
}

public POP_GetPlayedTimes()
{
	return self.iPlayedTimes;
}

public POP_IncPlayedTimes(iTimes)
{
	self.iPlayedTimes += iTimes;
}

public RateMap(sMapName, iStarsCount)
{
	IncRateMap(sMapName, iStarsCount, 1);
}

public IncRateMap(sMapName, iRateSumInc, iRateTimesInc, [iPlayedTimesInc])
{
	if (iRateTimesInc <= 0) // did anybody rate?
		return;

	lastInfo = POP_Get(sMapName);
	lastInfo POP_IncRateSum(iRateSumInc);
	lastInfo POP_IncRateTimes(iRateTimesInc);
	if (IsDefined(iPlayedTimesInc) && iPlayedTimesInc > 0)
		lastInfo POP_IncPlayedTimes(iPlayedTimesInc);
		
	lastInfo POP_Set(sMapName);
}

// ========================================================================== //
#region CurrentMap

// game["iMapPopSum"]
// game["iMapPopSumInc"]
// game["iMapPopRateTimes"]
// game["iMapPopRateTimesInc"]

public GetCurMapRateSum()
{
	return game["iMapPopSum"] + game["iMapPopSumInc"];
}

public GetCurMapRateSumInc()
{
	return game["iMapPopSumInc"];
}

public GetCurMapRateTimes()
{
	return game["iMapPopRateTimes"] + game["iMapPopRateTimesInc"];	
}

public GetCurMapRateTimesInc()
{
	return game["iMapPopRateTimesInc"];	
}

public GetCurMapPopularity()
{
	iRateTimes = GetCurMapRateTimes();
	if (iRateTimes == 0)
		return 0;
		
	return GetCurMapRateSum() / iRateTimes;
}

public RateCurMap(iStarsCount)
{
	IncRateCurMap(iStarsCount, 1);
}

public IncRateCurMap(iRateSumInc, iRateTimesInc)
{
	game["iMapPopSumInc"] += iRateSumInc;
	game["iMapPopRateTimesInc"] += iRateTimesInc;
}

#endregion
// ========================================================================== //