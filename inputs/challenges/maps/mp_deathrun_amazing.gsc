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
	return item;
}

/// <summary>
/// Get number of items visible in the menu.
/// </summary>
/// <returns>Int</returns>
GetItemsCount()
{
	return 0; 
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
		/*case 0:
			return "papyrus";
		case 1:
			return "paranormal";*/
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
		/*case "papyrus":
			item = C_ICCHALLENGES::GetDefaultStageList();
			item.iStatId = C_ICCHALLENGES::STATS_Map + 1;
			item C_ICCHALLENGES::StageList_AddStage("papyrusI");
			item C_ICCHALLENGES::StageList_AddStage("papyrusII");
			item C_ICCHALLENGES::StageList_AddStage("papyrusIII");
			return item;
			case "papyrusI":
				item = GetDefaultItem();
				item.sMenuName = "Papyrus I";
				item.sMenuDescription = "Collect 5 papyruses.";
				item.iMaxValue = 5;
				item.iStatId = C_ICCHALLENGES::STATS_Map + 2;
				item.bIsFree = true;
				return item;
			case "papyrusII":
				item = GetDefaultItem();
				item.sMenuName = "Papyrus II";
				item.sMenuDescription = "Collect 10 papyruses.";
				item.iMaxValue = 10;
				item.iStatId = C_ICCHALLENGES::STATS_Map + 3;
				item.bIsFree = true;
				return item;
			case "papyrusIII":
				item = GetDefaultItem();
				item.sMenuName = "Papyrus III";
				item.sMenuDescription = "Collect 20 papyruses.";
				item.iMaxValue = 20;
				item.iStatId = C_ICCHALLENGES::STATS_Map + 4;
				item.bIsFree = true;
				return item;
		case "paranormal":
			item = GetDefaultItem();
			item.sMenuName = "Paranormal";
			item.sMenuDescription = "Run all paranormals.";
			item.iMaxValue = 20;
			item.iStatId = C_ICCHALLENGES::STATS_Map + 5;
			item.bIsFree = true;
			return item;*/
		default:
			return undefined;
	}
}