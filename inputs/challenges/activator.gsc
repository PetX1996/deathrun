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
	item.iPrestige = 10;
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
			return "vest";
		case 1:
			return "enemyHP";
		case 2:
			return "speed";
		/*case 3:
			return "repelent";*/
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
		case "vest":
			item = GetDefaultItem();
			item.sMenuName = "^1A - Vest";
			item.sMenuDescription = "Get 50 hits to the Vest";
			item.iMaxValue = 50;
			item.iStatId = C_ICCHALLENGES::STATS_Activator + 0;
			return item;
		case "enemyHP":
			item = GetDefaultItem();
			item.sMenuName = "^1A - Enemy HP";
			item.sMenuDescription = "Use Enemy HP 50 times";
			item.iMaxValue = 50;
			item.iStatId = C_ICCHALLENGES::STATS_Activator + 1;
			return item;
		case "speed":
			item = GetDefaultItem();
			item.sMenuName = "^1A - Speed";
			item.sMenuDescription = "Travel 6000 metres with speed";
			item.iMaxValue = 6000;
			item.iStatId = C_ICCHALLENGES::STATS_Activator + 2;
			return item;
		/*case "repelent":
			item = GetDefaultItem();
			item.sMenuName = "^1A - Repelent";
			item.sMenuDescription = "Use Repelent 50 times";
			item.iMaxValue = 50;
			item.iStatId = C_ICCHALLENGES::STATS_Activator + 3;
			return item;*/
		default:
			return undefined;
	}
}