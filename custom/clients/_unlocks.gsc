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

// sName, iType, iIndex, item, stageList, sStageListName, bIsStageListCompleted
CH_OnCCompleted(args)
{
	// completed item
	self C_ICUNLOCKS::CUnlocksForChallenge(args.iType, args.sName);

	// completed stage list
	if (IsDefined(args.stageList)
		&& IsDefined(args.bIsStageListCompleted))
		self C_ICUNLOCKS::CUnlocksForChallenge(args.iType, args.sStageListName);
}

// iOldRankId, iNewRankId
RANK_OnCSetRankId(args)
{
	self C_ICUNLOCKS::CUnlocksForRankId(args.iNewRankId);
}

// iOldPrestige, iNewPrestige
RANK_OnCIncedPrestige(args)
{
	self C_ICUNLOCKS::CUnlocksForPrestige(args.iNewPrestige);
}