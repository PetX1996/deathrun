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

GetItem(sName)
{
	switch (sName)
	{
		case "kills":
			item = C_ISUMMARY::GetDefaultItem();
			item.sName = "Kills";
			item.iMinValue = 0;
			return item;		
		case "firstBlood":
			item = C_ISUMMARY::GetDefaultItem();
			item.sName = "First Blood";
			item.iMinValue = 0;
			item.dComparer = ICOMPARE::LessInt;
			item.dToString = IDATETIME::ToStr_mss;
			return item;
		case "endTime":
			item = C_ISUMMARY::GetDefaultItem();
			item.sName = "Time";
			item.iMinValue = 0;
			item.dComparer = ICOMPARE::LessInt;
			item.dToString = IDATETIME::ToStr_mss;
			return item;
		default:
			return undefined;
	}
}