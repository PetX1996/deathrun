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
	item.iPrestige = 5;
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
			return "impatient";
		case 2:
			return "snipers";
		case 3:
			return "activatorKiller";
		case 4:
			return "vendetta";
		case 5:
			return "proneKnifer";
		case 6:
			return "environmentalist";
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
			item.sMenuDescription = "Win 30 rounds as activator";
			item.iMaxValue = 30;
			item.iStatId = C_ICCHALLENGES::STATS_Stage5 + 0;
			return item;
		case "impatient":
			item = GetDefaultItem();
			item.sMenuName = "^1A - Impatient";
			item.sMenuDescription = "Activate all traps in first 25 seconds";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Stage5 + 1;
			return item;
		case "snipers":
			item = GetDefaultItem();
			item.sMenuName = "^2J - Snipers";
			item.sMenuDescription = "Kill 40 people with snipers";
			item.iMaxValue = 40;
			item.iStatId = C_ICCHALLENGES::STATS_Stage5 + 2;
			return item;
		case "activatorKiller":
			item = GetDefaultItem();
			item.sMenuName = "^2J - Activator Killer";
			item.sMenuDescription = "Kill 50 activators";
			item.iMaxValue = 50;
			item.iStatId = C_ICCHALLENGES::STATS_Stage5 + 3;
			return item;
		case "vendetta":
			item = GetDefaultItem();
			item.sMenuName = "^2J - Vendetta";
			item.sMenuDescription = "Use your life and kill an activator in the same round";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Stage5 + 4;
			return item;
		case "proneKnifer":
			item = GetDefaultItem();
			item.sMenuName = "Prone Knifer";
			item.sMenuDescription = "Knife 15 people in the prone";
			item.iMaxValue = 15;
			item.iStatId = C_ICCHALLENGES::STATS_Stage5 + 5;
			return item;
		case "environmentalist":
			item = GetDefaultItem();
			item.sMenuName = "Environmentalist";
			item.sMenuDescription = "Spray to the grass";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Stage5 + 6;
			return item;
		default:
			return undefined;
	}
}