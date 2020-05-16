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
	item.iPrestige = 1;
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
			return "jumperKiller";
		case 1:
			return "trapsActivated";
		case 2:
			return "activatorWinner";
		case 3:
			return "finishes";
		case 4:
			return "respawns";
		case 5:
			return "graffiter";
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
		case "jumperKiller":
			item = GetDefaultItem();
			item.sMenuName = "^1A - Jumper Killer";
			item.sMenuDescription = "Kill 5 jumpers with your weapon";
			item.iMaxValue = 5;
			item.iStatId = C_ICCHALLENGES::STATS_Stage1 + 0;
			return item;
		case "trapsActivated":
			item = GetDefaultItem();
			item.sMenuName = "^1A - Traps Activated";
			item.sMenuDescription = "Activate 50 traps totally";
			item.iMaxValue = 50;
			item.iStatId = C_ICCHALLENGES::STATS_Stage1 + 1;
			return item;
		case "activatorWinner":
			item = GetDefaultItem();
			item.sMenuName = "^1A - Activator Winner";
			item.sMenuDescription = "Win 10 rounds as an activator";
			item.iMaxValue = 10;
			item.iStatId = C_ICCHALLENGES::STATS_Stage1 + 2;
			return item;
		case "finishes":
			item = GetDefaultItem();
			item.sMenuName = "^2J - Finishes";
			item.sMenuDescription = "Finish the map 15 times";
			item.iMaxValue = 15;
			item.iStatId = C_ICCHALLENGES::STATS_Stage1 + 3;
			return item;
		case "respawns":
			item = GetDefaultItem();
			item.sMenuName = "^2J - Respawns";
			item.sMenuDescription = "Use 1 life";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Stage1 + 4;
			return item;
		case "graffiter":
			item = GetDefaultItem();
			item.sMenuName = "Graffiter";
			item.sMenuDescription = "Spray 20 times";
			item.iMaxValue = 20;
			item.iStatId = C_ICCHALLENGES::STATS_Stage1 + 5;
			return item;
		default:
			return undefined;
	}
}