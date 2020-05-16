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

/// <summary>
/// Get default item's values for a whole category.
/// </summary>
/// <returns>Item</returns>
GetDefaultItem()
{
	item = C_ICCHALLENGES::GetDefaultItem();
	item.iPrestige = 2;
	return item;
}

/// <summary>
/// Get number of items visible in the menu.
/// </summary>
/// <returns>Int</returns>
GetItemsCount()
{
	return 7; 
}

/// <summary>
/// Get name for each item visible in the menu.
/// </summary>
/// <returns>String</returns>
/// <param name="iIndex">Int</param>
GetNameByIndex(iIndex)
{
	switch (iIndex)
	{
		case 0:
			return "trapKiller";
		case 1:
			return "turnOnAll";
		case 2:
			return "hitAndKill";
		case 3:
			return "lifes";
		case 4:
			return "noShame";
		case 5:
			return "headshots";
		case 6:
			return "lucker";
		default:
			return undefined;
	}
}

/// <summary>
/// Get item for each name got by GetNameByIndex
/// </summary>
/// <returns>Item</returns>
/// <param name="sName">String</param>
GetItemOrStageListByName(sName)
{
	switch (sName)
	{
		case "trapKiller":
			item = GetDefaultItem();
			item.sMenuName = "^1A - Trap Killer";
			item.sMenuDescription = "Kill 100 jumpers by traps";
			item.iMaxValue = 100;
			item.iStatId = C_ICCHALLENGES::STATS_Stage2 + 0;
			return item;
		case "turnOnAll":
			item = GetDefaultItem();
			item.sMenuName = "^1A - Turn On All";
			item.sMenuDescription = "Activate all traps 5 times";
			item.iMaxValue = 5;
			item.iStatId = C_ICCHALLENGES::STATS_Stage2 + 1;
			return item;
		case "hitAndKill":
			item = GetDefaultItem();
			item.sMenuName = "^2J - Hit & Kill";
			item.sMenuDescription = "Hit activator and finish him with knife 5 times";
			item.iMaxValue = 5;
			item.iStatId = C_ICCHALLENGES::STATS_Stage2 + 2;
			return item;
		case "lifes":
			item = GetDefaultItem();
			item.sMenuName = "^2J - Lifes";
			item.sMenuDescription = "Collect 2 lifes";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Stage2 + 3;
			return item;
		case "noShame":
			item = GetDefaultItem();
			item.sMenuName = "No Shame";
			item.sMenuDescription = "Spray in near to an activator dead body";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Stage2 + 4;
			return item;
		case "headshots":
			item = GetDefaultItem();
			item.sMenuName = "Headshots";
			item.sMenuDescription = "Give 5 headshots";
			item.iMaxValue = 5;
			item.iStatId = C_ICCHALLENGES::STATS_Stage2 + 5;
			return item;
		case "lucker":
			item = GetDefaultItem();
			item.sMenuName = "Lucker";
			item.sMenuDescription = "Fall down and survive 5 times";
			item.iMaxValue = 5;
			item.iStatId = C_ICCHALLENGES::STATS_Stage2 + 6;
			return item;
		default:
			return undefined;
	}
}