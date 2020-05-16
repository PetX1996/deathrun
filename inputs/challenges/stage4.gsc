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
	item.iPrestige = 4;
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
			return "trapsActivated";
		case 1:
			return "niceTry";
		case 2:
			return "almostKills";
		case 3:
			return "headshots";
		/*case 4:
			return "finishHim";*/
		case 4:
			return "proneKill";
		case 5:
			return "airSprayer";
		case 6:
			return "flyer";
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
			item.sMenuDescription = "Activate 150 traps totally";
			item.iMaxValue = 150;
			item.iStatId = C_ICCHALLENGES::STATS_Stage4 + 0;
			return item;
		case "niceTry":
			item = GetDefaultItem();
			item.sMenuName = "^1A - Nice Try";
			item.sMenuDescription = "Knife jumper immediately after he shot you";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Stage4 + 1;
			return item;
		case "almostKills":
			item = GetDefaultItem();
			item.sMenuName = "^2J - Almost Kills";
			item.sMenuDescription = "Get 10 assists";
			item.iMaxValue = 10;
			item.iStatId = C_ICCHALLENGES::STATS_Stage4 + 2;
			return item;
		case "headshots":
			item = GetDefaultItem();
			item.sMenuName = "^2J - Headshots";
			item.sMenuDescription = "Kill 10 people with headshots";
			item.iMaxValue = 10;
			item.iStatId = C_ICCHALLENGES::STATS_Stage4 + 3;
			return item;
		/*case "finishHim":
			item = GetDefaultItem();
			item.sMenuName = "^2J - Finish Him";
			item.sMenuDescription = "Kill an activator when he has at most 5 HP";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Stage4 + 4;
			return item;*/
		case "proneKill":
			item = GetDefaultItem();
			item.sMenuName = "Prone Kill";
			item.sMenuDescription = "Kill 10 people in the prone";
			item.iMaxValue = 10;
			item.iStatId = C_ICCHALLENGES::STATS_Stage4 + 5;
			return item;
		case "airSprayer":
			item = GetDefaultItem();
			item.sMenuName = "Air Sprayer";
			item.sMenuDescription = "Spray while you are in the air";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Stage4 + 6;
			return item;
		case "flyer":
			item = GetDefaultItem();
			item.sMenuName = "Flyer";
			item.sMenuDescription = "Flight 4 seconds";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Stage4 + 7;
			return item;
		default:
			return undefined;
	}
}