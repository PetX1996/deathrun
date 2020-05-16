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
	item.iPrestige = 7;
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
			return "massTrapKiller";
		case 1:
			return "jumperSerialKiller";
		case 2:
			return "longShot";
		case 3:
			return "lifeWaster";
		case 4:
			return "goodTime";
		case 5:
			return "airKill";
		case 6:
			return "vandalism";
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
		case "massTrapKiller":
			item = GetDefaultItem();
			item.sMenuName = "^1A - Mass Trap Killer";
			item.sMenuDescription = "Kill 6 jumpers with one trap";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Stage7 + 0;
			return item;
		case "jumperSerialKiller":
			item = GetDefaultItem();
			item.sMenuName = "^1A - Jumper Serial Killer";
			item.sMenuDescription = "Kill 4 jumpers with your weapon in one round";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Stage7 + 1;
			return item;
		case "longShot":
			item = GetDefaultItem();
			item.sMenuName = "^2J - Long Shot";
			item.sMenuDescription = "Kill activator from long distance";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Stage7 + 2;
			return item;
		case "lifeWaster":
			item = GetDefaultItem();
			item.sMenuName = "^2J - Life Waster";
			item.sMenuDescription = "Have all 4 lifes and won't use anything";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Stage7 + 3;
			return item;
		case "goodTime":
			item = GetDefaultItem();
			item.sMenuName = "^2J - Good Time";
			item.sMenuDescription = "Finish the map in first 35 seconds";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Stage7 + 4;
			return item;
		case "airKill":
			item = GetDefaultItem();
			item.sMenuName = "Air Kill";
			item.sMenuDescription = "Kill 5 people in the air";
			item.iMaxValue = 5;
			item.iStatId = C_ICCHALLENGES::STATS_Stage7 + 5;
			return item;
		case "vandalism":
			item = GetDefaultItem();
			item.sMenuName = "Vandalism";
			item.sMenuDescription = "Spray 15 times in one round";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Stage7 + 6;
			return item;
		default:
			return undefined;
	}
}