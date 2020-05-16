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
	item.iRankId = 100;
	return item;
}

/// <summary>
/// Get number of items visible in the menu.
/// </summary>
/// <returns>Int</returns>
GetItemsCount()
{
	return 13;
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
			return "looserOfLoosers";
		case 1:
			return "cooperation";
		case 2:
			return "iAmNewbie";
		case 3:
			return "activatorSerialKiller";
		case 4:
			return "fasterThanActivator";
		case 5:
			return "trapsSucceeded";
		case 6:
			return "unstoppable";
		case 7:
			return "soClose";
		case 8:
			return "iAmFirst";
		case 9:
			return "falls";
		case 10:
			return "deaths";
		case 11:
			return "badDay";
		case 12:
			return "noDelays";
		/*case 13:
			return "badBoy";*/
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
		case "looserOfLoosers":
			item = GetDefaultItem();
			item.sMenuName = "^1A - Looser of Loosers";
			item.sMenuDescription = "Fall down and die as an activator";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Bonus + 0;
			return item;
		case "cooperation":
			item = GetDefaultItem();
			item.sMenuName = "^1A - Cooperation";
			item.sMenuDescription = "Kill together all jumpers (on the map have to be more activators)";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Bonus + 1;
			return item;
		case "iAmNewbie":
			item = GetDefaultItem();
			item.sMenuName = "^2J - I Am Newbie";
			item.sMenuDescription = "Die when is free run";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Bonus + 2;
			return item;
		case "activatorSerialKiller":
			item = GetDefaultItem();
			item.sMenuName = "^2J - Activator Serial Killer";
			item.sMenuDescription = "Kill 2 activators in one round";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Bonus + 3;
			return item;
		case "fasterThanActivator":
			item = GetDefaultItem();
			item.sMenuName = "^2J - Faster Than Activator";
			item.sMenuDescription = "Succeed all traps before an activator activates traps";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Bonus + 4;
			return item;
		case "trapsSucceeded":
			item = GetDefaultItem();
			item.sMenuName = "^2J - Traps Succeeded";
			item.sMenuDescription = "Succeed 500 traps totally";
			item.iMaxValue = 500;
			item.iStatId = C_ICCHALLENGES::STATS_Bonus + 5;
			return item;
		case "unstoppable":
			item = GetDefaultItem();
			item.sMenuName = "^2J - Unstoppable";
			item.sMenuDescription = "Succeed all traps";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Bonus + 6;
			return item;
		case "soClose":
			item = GetDefaultItem();
			item.sMenuName = "^2J - So Close";
			item.sMenuDescription = "Succeed all traps but wont finish the map";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Bonus + 7;
			return item;
		case "iAmFirst":
			item = GetDefaultItem();
			item.sMenuName = "^2J - I Am First";
			item.sMenuDescription = "Succeed all traps as first (10 times)";
			item.iMaxValue = 10;
			item.iStatId = C_ICCHALLENGES::STATS_Bonus + 8;
			return item;
		case "falls":
			item = GetDefaultItem();
			item.sMenuName = "Falls";
			item.sMenuDescription = "Fall 500 times";
			item.iMaxValue = 500;
			item.iStatId = C_ICCHALLENGES::STATS_Bonus + 9;
			return item;
		case "deaths":
			item = GetDefaultItem();
			item.sMenuName = "Deaths";
			item.sMenuDescription = "Die 500 times";
			item.iMaxValue = 500;
			item.iStatId = C_ICCHALLENGES::STATS_Bonus + 10;
			return item;
		case "badDay":
			item = GetDefaultItem();
			item.sMenuName = "Bad Day";
			item.sMenuDescription = "Die every round as first";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Bonus + 11;
			return item;
		case "noDelays":
			item = GetDefaultItem();
			item.sMenuName = "No Delays";
			item.sMenuDescription = "Kill 10 people while they are stuck or afk";
			item.iMaxValue = 10;
			item.iStatId = C_ICCHALLENGES::STATS_Bonus + 12;
			return item;
		/*case "badBoy":
			item = GetDefaultItem();
			item.sMenuName = "Bad Boy";
			item.sMenuDescription = "Get the slain from the admin";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Bonus + 13;
			return item;*/
		default:
			return undefined;
	}
}