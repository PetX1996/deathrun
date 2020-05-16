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

DMG_OnCKilled(args)
{
	if (C_ICDAMAGE::IsSuicideSilent(args)
		|| C_ICDAMAGE::IsAFK(args))
		return;

	if (!C_IGLSTATE::IsINReleased() 
		|| C_IGLTYPE::IsTrainingRound()
		|| C_IGLTYPE::IsSinglePlayer())
		return;
		
	if (C_ICDAMAGE::IsEnemy(args))
	{
		if (C_ICDAMAGE::IsHeadShot(args))
			args.eAttacker C_ICRANK::CGiveScoreRankXPType("KillHeadshot");
		else
			args.eAttacker C_ICRANK::CGiveScoreRankXPType("Kill");
	}
	
	// score for jumper's death
	if (C_ICDAMAGE::IsTrap(args))
	{
		pActivators = ICLIST::GetAllAxis(true);
		foreach (pActiv in pActivators)
		{
			if (!pActiv C_ICAFK::CIsAFK())
				pActiv C_ICRANK::CGiveScoreRankXPType("AJumperDied");
		}
	}
}

DMG_OnCAssisted(args)
{
	if (!C_IGLSTATE::IsINReleased() 
		|| C_IGLTYPE::IsTrainingRound()
		|| C_IGLTYPE::IsSinglePlayer())
		return;	

	self C_ICRANK::CGiveScoreRankXPType("Assist");
}

ML_OnCTouchedTT(args)
{
	if (!C_IGLSTATE::IsIN()
		|| C_IGLTYPE::IsTrainingRound()
		|| C_IGLTYPE::IsSinglePlayer())
		return;

	if (IsDefined(args.bIsTouchedAuto) && args.bIsTouchedAuto)
		return;
		
	if (self.pers["team"] == "axis")
		self C_ICRANK::CGiveScoreRankXPType("ATrapActivate");
}

ML_OnCTouchedTJ(args)
{
	if (!C_IGLSTATE::IsIN()
		|| C_IGLTYPE::IsTrainingRound()
		|| C_IGLTYPE::IsSinglePlayer())
		return;

	if (IsDefined(args.bIsTouchedAuto) && args.bIsTouchedAuto)
		return;
		
	// if TJ is connected with TT, TT must be active!
	iTouchedTTs = args.TJ C_IMLTJ::TJ_GetTouchedTTsCount();
	if ((args.TJ C_IMLTJ::TJ_GetAssignedTTsList()).iCount <= 0
		|| iTouchedTTs > 0)
		self C_ICRANK::CGiveScoreRankXPType("JTrapSucceed", iTouchedTTs);
}

ML_OnCTouchedEM(args)
{
	if (!C_IGLSTATE::IsIN()
		|| C_IGLTYPE::IsTrainingRound()
		|| C_IGLTYPE::IsSinglePlayer())
		return;
		
	if (IsDefined(args.bIsTouchedAuto) && args.bIsTouchedAuto)
		return;
		
	switch (args.iPlace)
	{
		case 0:
			self C_ICRANK::CGiveScoreRankXPType("JFinishedFirst");
			break;
		case 1:
			self C_ICRANK::CGiveScoreRankXPType("JFinishedSecond");
			break;
		case 2:
			self C_ICRANK::CGiveScoreRankXPType("JFinishedThird");
			break;
		default:
			self C_ICRANK::CGiveScoreRankXPType("JFinishedNext");
			break;
	}
}