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

GetPrestigeName(iPrestige)
{
	switch (iPrestige)
	{
		case 0:
			return "I";
		case 1:
			return "II";
		case 2:
			return "III";
		case 3:
			return "IV";
		case 4:
			return "V";
		case 5:
			return "VI";
		case 6:
			return "VII";
		case 7:
			return "VIII";
		case 8:
			return "IX";
		case 9:
			return "X";
		case 10:
			return "PRO";
		default:
			IEXCEPTION::ArgumentMsg("Unknown iPrestige;" + iPrestige);
	}
}


public CGetPrestige()
{
	return self ICPERS::GetPersStat("plevel");
}

private CSetPrestige(iPrestige)
{
	self C_IDEBUG::Debug("CSetPrestige");
	self thread CUpdatePrestige(iPrestige);
}

public CIncPrestige()
{
	self C_IDEBUG::Debug("CIncPrestige");

	iOldPrestige = self CGetPrestige();
	
	// lvl 99 -> collect XP & complete prestige CH -> next prestige -> complete all CH -> next LVL
	if (iOldPrestige == 10)
		self C_ICRANK::CIncRankId();
	else if (iOldPrestige == 9)
	{
		//self CSetPrestige(iOldPrestige + 1);	
	}
	else
		self C_ICRANK::CIncRankId();
	
	self CSetPrestige(iOldPrestige + 1);
	
	args = IECALLBACK::Args_Create();
	args.iOldPrestige = iOldPrestige;
	args.iNewPrestige = self CGetPrestige();
	self C_INIT::RANK_RunOnCIncedPrestige(args);
}

public CUpdatePrestige(iPrestige)
{
	self C_IDEBUG::Debug("CUpdatePrestige(" + iPrestige + ");iRankId;" + self C_ICRANK::CGetRankId());

	self endon("disconnect");

	iRankId = self C_ICRANK::CGetRankId();
	iNewPrestige = Int(iRankId / 10);
	if (iPrestige == 10 && iRankId == 99) // lvl 99, but stage challenges has been done
		iNewPrestige = 10; // -> next prestige for completing all challenges
	else if (iRankId == 100)
		iNewPrestige = 11; // all done
	
	self ICPERS::SetPersStat("plevel", iNewPrestige);
	
	if (iRankId != C_ICRANK::MaxRankId)
	{
		// challenges counters
		// set some values until it gets real values...
		self ICPERS::SetPersStat("chcur", 0);
		self ICPERS::SetPersStat("chmax", 1);
		
		iChCur = self CCountChCur(iNewPrestige);
		iChMax = CountChMax(iNewPrestige);
		
		self ICPERS::SetPersStat("chcur", iChCur);
		self ICPERS::SetPersStat("chmax", iChMax);
		
		if (iChCur >= iChMax)
			self CFinishCompletingCh();
	}
}

public CGetChMax()
{
	return self ICPERS::GetPersStat("chmax");
}

public CSetChMax(iChMax)
{
	self ICPERS::SetPersStat("chmax", iChMax);
}


public CGetChCur()
{
	return self ICPERS::GetPersStat("chcur");
}

public CSetChCur(iChCur)
{
	self ICPERS::SetPersStat("chcur", iChCur);
}

public CIncChCur()
{
	self CSetChCur(self CGetChCur() + 1);
}




public CIsRankFreezed([iRankId])
{
	if (!IsDefined(iRankId))
		iRankId = self C_ICRANK::CGetRankId();
		
	return (iRankId % 10 == 9);
}

public CIsCollectingXPDone()
{
	return (self C_ICRANK::CGetLeftXP() == 0);
}

public CFinishCollectingXP()
{
	self C_IDEBUG::Debug("CFinishCollectingXP");
	
	if (self CIsCompletingChDone())
		self CIncPrestige();
}

public CIsCompletingChDone()
{
	return (self CGetChCur() >= self CGetChMax());
}

public CFinishCompletingCh()
{
	self C_IDEBUG::Debug("CFinishCompletingCh");

	if (self CIsCollectingXPDone())
		self CIncPrestige();
}


public IsChTypeAssignToPrestige(iChType, iPrestige)
{
	return (iPrestige == 10 && (iChType == C_ICCHALLENGES::TYPE_Jumper 
			|| iChType == C_ICCHALLENGES::TYPE_Activator))
		|| (iPrestige < 10 && iChType == iPrestige);
}

public CountChMax(iPrestige)
{
	iCount = 0;
	if (iPrestige == 10)
	{
		iCount = C_ICCHALLENGES::GetItemsCount(C_ICCHALLENGES::TYPE_Jumper);
		iCount += C_ICCHALLENGES::GetItemsCount(C_ICCHALLENGES::TYPE_Activator);
	}
	else
		iCount = C_ICCHALLENGES::GetItemsCount(iPrestige);
		
	return iCount;
}

public CCountChCur(iPrestige)
{
	iCur = 0;
	if (iPrestige == 10)
	{
		iCur = self C_ICCHALLENGES::CGetTypeCompletedCurCount(C_ICCHALLENGES::TYPE_Jumper);
		wait 0.05;
		iCur += self C_ICCHALLENGES::CGetTypeCompletedCurCount(C_ICCHALLENGES::TYPE_Activator);
	}
	else
	{
		iCur = self C_ICCHALLENGES::CGetTypeCompletedCurCount(iPrestige);
	}
	
	return iCur;
}


public CGetMaxRankIdForPrestige([iPrestige])
{
	if (!IsDefined(iPrestige))
		iPrestige = self C_ICPRESTIGE::CGetPrestige();
		
	if (iPrestige < 10)
		return (iPrestige * 10) + 9;
	else if (iPrestige == 10)
		return 99;
	else
		return 100;
}

public CGetMaxRankXPForPrestige([iPrestige])
{
	iRankId = self CGetMaxRankIdForPrestige(iPrestige);
	return C_ICRANK::GetRankIdMaxXP(iRankId);
}