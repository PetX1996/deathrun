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
	item.iPrestige = 6;
	return item;
}

/// <summary>
/// Get number of items visible in the menu.
/// </summary>
/// <returns>Int</returns>
GetItemsCount()
{
	return 8; 
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
			return "noTimeForMercy";
		case 1:
			return "trapKiller";
		case 2:
			return "fastEnd";
		case 3:
			return "automatic";
		case 4:
			return "lifesCollector";
		case 5:
			return "mapScore";
		case 6:
			return "connections";
		case 7:
			return "necrophile";
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
		case "noTimeForMercy":
			item = GetDefaultItem();
			item.sMenuName = "^1A - No Time For Mercy";
			item.sMenuDescription = "Kill them all in first 10 seconds as activator";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Stage6 + 0;
			return item;
		case "trapKiller":
			item = GetDefaultItem();
			item.sMenuName = "^1A - Trap Killer";
			item.sMenuDescription = "Kill 100 jumpers with traps";
			item.iMaxValue = 100;
			item.iStatId = C_ICCHALLENGES::STATS_Stage6 + 1;
			return item;
		case "fastEnd":
			item = GetDefaultItem();
			item.sMenuName = "^2J - Fast End";
			item.sMenuDescription = "Kill activators in 5 seconds after you finished the map";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Stage6 + 2;
			return item;
		case "automatic":
			item = GetDefaultItem();
			item.sMenuName = "^2J - Automatic";
			item.sMenuDescription = "Kill 10 people with automatic or semi-automatic rifle";
			item.iMaxValue = 10;
			item.iStatId = C_ICCHALLENGES::STATS_Stage6 + 3;
			return item;
		case "lifesCollector":
			item = GetDefaultItem();
			item.sMenuName = "^2J - Lifes Collector";
			item.sMenuDescription = "Have all 4 lifes in a same time";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Stage6 + 4;
			return item;
		case "mapScore":
			item = GetDefaultItem();
			item.sMenuName = "Map Score";
			item.sMenuDescription = "Be the best in a scoreboard";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Stage6 + 5;
			return item;
		case "connections":
			item = GetDefaultItem();
			item.sMenuName = "Connections";
			item.sMenuDescription = "Connect 100 times";
			item.iMaxValue = 100;
			item.iStatId = C_ICCHALLENGES::STATS_Stage6 + 6;
			return item;
		case "necrophile":
			item = GetDefaultItem();
			item.sMenuName = "Necrophile";
			item.sMenuDescription = "Have sex with an activator corpse";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Stage6 + 7;
			return item;
		default:
			return undefined;
	}
}