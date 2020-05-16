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
	item.iPrestige = 3;
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
			return "massTrapKiller";
		case 1:
			return "knifeKiller";
		case 2:
			return "jumperWinner";
		case 3:
			return "pistols";
		case 4:
			return "closeShot";
		case 5:
			return "secondChance";
		case 6:
			return "crouchKill";
		case 7:
			return "upsideDown";
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
			item.sMenuDescription = "Kill 4 jumpers with one trap";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Stage3 + 0;
			return item;
		case "knifeKiller":
			item = GetDefaultItem();
			item.sMenuName = "^1A - Knife Killer";
			item.sMenuDescription = "Kill 20 people with knife as an activator";
			item.iMaxValue = 20;
			item.iStatId = C_ICCHALLENGES::STATS_Stage3 + 1;
			return item;
		case "jumperWinner":
			item = GetDefaultItem();
			item.sMenuName = "^2J - Jumper Winner";
			item.sMenuDescription = "Win 7 rounds as a jumper";
			item.iMaxValue = 7;
			item.iStatId = C_ICCHALLENGES::STATS_Stage3 + 2;
			return item;
		case "pistols":
			item = GetDefaultItem();
			item.sMenuName = "^2J - Pistols";
			item.sMenuDescription = "Kill 40 people with pistols";
			item.iMaxValue = 40;
			item.iStatId = C_ICCHALLENGES::STATS_Stage3 + 3;
			return item;
		case "closeShot":
			item = GetDefaultItem();
			item.sMenuName = "^2J - Close Shot";
			item.sMenuDescription = "Kill acivator with a gun from a short distance";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Stage3 + 4;
			return item;
		case "secondChance":
			item = GetDefaultItem();
			item.sMenuName = "^2J - Second Chance";
			item.sMenuDescription = "Use a life and finish the map";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Stage3 + 5;
			return item;
		case "crouchKill":
			item = GetDefaultItem();
			item.sMenuName = "Crouch Kill";
			item.sMenuDescription = "Kill 10 people in the crouch";
			item.iMaxValue = 10;
			item.iStatId = C_ICCHALLENGES::STATS_Stage3 + 6;
			return item;
		case "upsideDown":
			item = GetDefaultItem();
			item.sMenuName = "Upside Down";
			item.sMenuDescription = "Spray to ceiling";
			item.iMaxValue = 1;
			item.iStatId = C_ICCHALLENGES::STATS_Stage3 + 7;
			return item;
		default:
			return undefined;
	}
}