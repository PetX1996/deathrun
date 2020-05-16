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
	item.iPrestige = 8;
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
			return "activatorWinner";
		case 1:
			return "proFinisher";
		case 2:
			return "uninstallIt";
		case 3:
			return "hitman";
		case 4:
			return "mapKills";
		case 5:
			return "addiction";
		case 6:
			return "noGravity";
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
		case "activatorWinner":
			item = GetDefaultItem();
			item.sMenuName = "^1A - Activator Winner";
			item.sMenuDescription = "Win 40 rounds as an activator";
			item.iMaxValue = 40;
			item.iStatId = C_ICCHALLENGES::STATS_Stage8 + 0;
			return item;
		case "proFinisher":
			item = GetDefaultItem();
			item.sMenuName = "^2J - Pro Finisher";
			item.sMenuDescription = "Finish every round as a jumper in the map";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Stage8 + 1;
			return item;
		case "uninstallIt":
			item = GetDefaultItem();
			item.sMenuName = "^2J - Uninstall it";
			item.sMenuDescription = "Use all 4 lifes in one round";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Stage8 + 2;
			return item;
		case "hitman":
			item = GetDefaultItem();
			item.sMenuName = "^2J - Hitman";
			item.sMenuDescription = "Kill activators in first 40 seconds";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Stage8 + 3;
			return item;
		case "mapKills":
			item = GetDefaultItem();
			item.sMenuName = "Map Kills";
			item.sMenuDescription = "Have the most kills in the scoreboard";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Stage8 + 4;
			return item;
		case "addiction":
			item = GetDefaultItem();
			item.sMenuName = "Addiction";
			item.sMenuDescription = "Play for 20 hours";
			item.iMaxValue = 72000000;
			item.dToString = IDATETIME::ToInt_h;
			item.iStatId = C_ICCHALLENGES::STATS_Stage8 + 5;
			return item;
		case "noGravity":
			item = GetDefaultItem();
			item.sMenuName = "No Gravity";
			item.sMenuDescription = "Stay 10 seconds in the air";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Stage8 + 6;
			return item;
		default:
			return undefined;
	}
}