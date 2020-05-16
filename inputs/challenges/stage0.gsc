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
	item.bIsFree = true;
	return item;
}

/// <summary>
/// Get number of items visible in the menu.
/// </summary>
/// <returns>Int</returns>
GetItemsCount()
{
	return 3; 
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
			return "activatorKiller";
		case 2:
			return "inMemoryOf";
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
			item.sMenuDescription = "Kill 20 jumpers by traps";
			item.iMaxValue = 20;
			item.iStatId = C_ICCHALLENGES::STATS_Stage0 + 0;
			return item;
		case "activatorKiller":
			item = GetDefaultItem();
			item.sMenuName = "^2J - Activator Killer";
			item.sMenuDescription = "Kill 2 activators";
			item.iMaxValue = 2;
			item.iStatId = C_ICCHALLENGES::STATS_Stage0 + 1;
			return item;
		case "inMemoryOf":
			item = GetDefaultItem();
			item.sMenuName = "In Memory Of";
			item.sMenuDescription = "Spray in near to dead body";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Stage0 + 2;
			return item;
		default:
			return undefined;
	}
}