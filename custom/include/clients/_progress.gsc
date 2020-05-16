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

public CSaveProgress()
{
	self.Progress = SpawnStruct();
	self.Progress.iLastXP = self C_ICRANK::CGetRankXP();
	
	self.Progress.Challenges = [];
	//self.Progress.Challenges[iType][iIndex] = iValue;
	
	iPrestige = self C_ICPRESTIGE::CGetPrestige();
	if (iPrestige < 10)
		self CSaveChallengesForType(iPrestige);
	else if (iPrestige == 10)
	{
		self CSaveChallengesForType(C_ICCHALLENGES::TYPE_Jumper);
		wait 0.05;
		self CSaveChallengesForType(C_ICCHALLENGES::TYPE_Activator);
	}
	else
	{
		self CSaveChallengesForType(C_ICCHALLENGES::TYPE_Bonus);
		wait 0.05;
		self CSaveChallengesForType(C_ICCHALLENGES::TYPE_Map);
	}
}

private CSaveChallengesForType(iType)
{
	iCount = C_ICCHALLENGES::GetItemsCount(iType);
	self.Progress.Challenges[iType] = [];
	for (iIndex = 0; iIndex < iCount; iIndex++)
	{
		item = self C_ICCHALLENGES::CGetItemByIndex(iType, iIndex);
		self.Progress.Challenges[iType][iIndex] = item C_ICCHALLENGES::Item_GetProceeding(self);
		
		//if (iIndex % 10 == 9) // use this if it is too laggy :)
		//	wait 0.05;
	}
}

public CGetSavedLastXP()
{
	IEXCEPTION::InvalidOperation(IsDefined(self.Progress), "Progress has not been initialized yet");

	return self.Progress.iLastXP;
}

public CGetSavedChallenges(iType)
{
	IEXCEPTION::InvalidOperation(IsDefined(self.Progress), "Progress has not been initialized yet");

	return self.Progress.Challenges[iType];
}