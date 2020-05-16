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

public CUnlocksForChallenge(iType, sName)
{
	switch (iType)
	{
		case C_ICCHALLENGES::TYPE_Stage0:
			self CUnlocksForStage0(sName);
			break;
		case C_ICCHALLENGES::TYPE_Stage1:
			self CUnlocksForStage1(sName);
			break;
		case C_ICCHALLENGES::TYPE_Stage2:
			self CUnlocksForStage2(sName);
			break;
		case C_ICCHALLENGES::TYPE_Stage3:
			self CUnlocksForStage3(sName);
			break;
		case C_ICCHALLENGES::TYPE_Stage4:
			self CUnlocksForStage4(sName);
			break;
		case C_ICCHALLENGES::TYPE_Stage5:
			self CUnlocksForStage5(sName);
			break;
		case C_ICCHALLENGES::TYPE_Stage6:
			self CUnlocksForStage6(sName);
			break;
		case C_ICCHALLENGES::TYPE_Stage7:
			self CUnlocksForStage7(sName);
			break;
		case C_ICCHALLENGES::TYPE_Stage8:
			self CUnlocksForStage8(sName);
			break;
		case C_ICCHALLENGES::TYPE_Stage9:
			self CUnlocksForStage9(sName);
			break;
		case C_ICCHALLENGES::TYPE_Jumper:
			self CUnlocksForJumper(sName);
			break;
		case C_ICCHALLENGES::TYPE_Activator:
			self CUnlocksForActivator(sName);
			break;
		case C_ICCHALLENGES::TYPE_Bonus:
			self CUnlocksForBonus(sName);
			break;
		case C_ICCHALLENGES::TYPE_Map:
			break;
		default:
			IEXCEPTION::ArgumentMsg("Unknown unlocks challenge iType;" + iType);
	}
}

private CUnlocksForStage0(sName)
{
	switch (sName)
	{
		default:
			return;
	}
}

private CUnlocksForStage1(sName)
{
	switch (sName)
	{
		default:
			return;
	}
}

private CUnlocksForStage2(sName)
{
	switch (sName)
	{
		default:
			return;
	}
}

private CUnlocksForStage3(sName)
{
	switch (sName)
	{
		default:
			return;
	}
}

private CUnlocksForStage4(sName)
{
	switch (sName)
	{
		default:
			return;
	}
}

private CUnlocksForStage5(sName)
{
	switch (sName)
	{
		default:
			return;
	}
}

private CUnlocksForStage6(sName)
{
	switch (sName)
	{
		default:
			return;
	}
}

private CUnlocksForStage7(sName)
{
	switch (sName)
	{
		default:
			return;
	}
}

private CUnlocksForStage8(sName)
{
	switch (sName)
	{
		default:
			return;
	}
}

private CUnlocksForStage9(sName)
{
	switch (sName)
	{
		default:
			return;
	}
}

private CUnlocksForJumper(sName)
{
	switch (sName)
	{
		default:
			return;
	}
}

private CUnlocksForActivator(sName)
{
	switch (sName)
	{
		default:
			return;
	}
}

private CUnlocksForBonus(sName)
{
	switch (sName)
	{
		default:
			return;
	}
}