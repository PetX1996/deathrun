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
	item.iPrestige = 9;
	return item;
}

/// <summary>
/// Get number of items visible in the menu.
/// </summary>
/// <returns>Int</returns>
GetItemsCount()
{
	return 6; 
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
			return "trapsActivated";
		case 1:
			return "freeForLamas";
		case 2:
			return "activatorHater";
		case 3:
			return "lastTry";
		case 4:
			return "airLover";
		case 5:
			return "survival";
		//case 6:
			//return "recordBreaker";
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
		case "trapsActivated":
			item = GetDefaultItem();
			item.sMenuName = "^1A - Traps Activated";
			item.sMenuDescription = "Activate 300 traps totally";
			item.iMaxValue = 300;
			item.iStatId = C_ICCHALLENGES::STATS_Stage9 + 0;
			return item;
		case "freeForLamas":
			item = GetDefaultItem();
			item.sMenuName = "^1A - Free For Lamas";
			item.sMenuDescription = "Kill them all with your weapon in Free Round";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Stage9 + 1;
			return item;
		case "activatorHater":
			item = GetDefaultItem();
			item.sMenuName = "^2J - Activator Hater";
			item.sMenuDescription = "Kill an activator every round as jumper";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Stage9 + 2;
			return item;
		case "lastTry":
			item = GetDefaultItem();
			item.sMenuName = "^2J - Last Try";
			item.sMenuDescription = "Use all 4 lifes in one round and kill an activator";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Stage9 + 3;
			return item;
		case "airLover":
			item = GetDefaultItem();
			item.sMenuName = "Air Lover";
			item.sMenuDescription = "Kill somebody in the air while you are both in the air";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Stage9 + 4;
			return item;
		case "survival":
			item = GetDefaultItem();
			item.sMenuName = "Survival";
			item.sMenuDescription = "Survive all rounds on the map";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Stage9 + 5;
			return item;
		/*case "recordBreaker":
			item = GetDefaultItem();
			item.sMenuName = "Record Breaker";
			item.sMenuDescription = "Break all records on the map";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Stage9 + 6;
			return item;*/
		default:
			return undefined;
	}
}