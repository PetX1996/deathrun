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

InCPreConnecting(args)
{
	iCurPrestige = self ICSTAT::GetByName("plevel");
	self C_ICPRESTIGE::CUpdatePrestige(iCurPrestige);
}

RANK_InCGivingRankXP(args)
{
	if (self C_ICPRESTIGE::CIsRankFreezed())
	{
		if (self C_ICPRESTIGE::CIsCollectingXPDone())
			args.bCancel = true;
		else if (args.iValue >= self C_ICRANK::CGetLeftXP())
		{
			args.iValue = self C_ICRANK::CGetLeftXP();
			self thread FinishXPCollectingAfterFrame();
		}
	}
}

private FinishXPCollectingAfterFrame()
{
	self endon("disconnect");

	// wait until xp has been increased in current frame...
	waittillframeend;

	self C_ICPRESTIGE::CFinishCollectingXP();
}

RANK_InCSettingRankId(args)
{
	// calling CIncRankId()...
	if (self C_ICPRESTIGE::CIsRankFreezed()
		&& (!self C_ICPRESTIGE::CIsCollectingXPDone() 
			|| !self C_ICPRESTIGE::CIsCompletingChDone()))
	{
		args.bCancel = true;
		return;
	}	
	
	// inc more than 1 lvl...
	if (args.iNewRankId - args.iOldRankId > 1)
	{
		for (i = (args.iOldRankId + 1); i <= args.iNewRankId; i++)
		{
			if (self C_ICPRESTIGE::CIsRankFreezed(i))
			{
				args.iNewRankId = i;
				return;
			}
		}
	}
}

// sName, iType, iIndex, item, stageList
CH_OnCCompleted(args)
{
	if (self C_ICRANK::CGetRankId() == C_ICRANK::MaxRankId)
		return;

	if (C_ICPRESTIGE::IsChTypeAssignToPrestige(args.iType, self C_ICPRESTIGE::CGetPrestige()))
	{
		if (IsDefined(args.stageList) && !IsDefined(args.bIsStageListCompleted))
			return;
		
		self C_ICPRESTIGE::CIncChCur();
		self thread CheckChCompletedAfterFrame();
	}
}

private CheckChCompletedAfterFrame()
{
	self endon("disconnect");
	self notify("CheckChCompletedAfterFrame");
	self endon("CheckChCompletedAfterFrame");

	// wait until all challenges in current frame proceed...
	waittillframeend;
	
	if (self C_ICPRESTIGE::CGetChCur() >= self C_ICPRESTIGE::CGetChMax())
		self C_ICPRESTIGE::CFinishCompletingCh();
}
