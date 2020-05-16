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
	item = C_ICCLASS::GetDefaultItem();
	/// player's body xModel
	item.sBodyModel = "";
	/// player's head xModel attached on his body
	item.sBodyHead = undefined;
	/// player's hands xModel visible in first person
	item.sViewHands = "";
	/// player has always this weapon...
	item.sForcedWeapon = undefined;
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
			return "body_complete_mp_al_asad";
		case 1:
			return "plr_bo_zom_mil_police";
		case 2:
			return "playermodel_css_badass_terrorist";
		case 3:
			return "playermodel_castro_bo";
		case 4:
			return "playermodel_savimbi_bo2";
		case 5:
			return "Tourrette";
		case 6:
			return "playermodel_baa_joker";
		case 7:
			return "playermodel_terminator";
		default:
			return undefined;
	}
}

/// <summary>
/// Get item for each name got by GetNameByIndex
/// </summary>
/// <returns>Item</returns>
/// <param name="sName">String</param>
GetItemByName(sName)
{
	switch (sName)
	{
		case "body_complete_mp_al_asad":
			item = GetDefaultItem();
			//item.iRankId = 30;
			item.bIsFree = true;
			item.sMenuIcon = "head_ico_alasad";
			item.sBodyModel = "body_complete_mp_al_asad";
			item.sViewHands = "viewmodel_hands_zombie";
			item.sMenuName = "Al Asad";
			return item;
		case "plr_bo_zom_mil_police":
			item = GetDefaultItem();
			item.iRankId = 12;
			//item.bIsFree = true;
			item.sMenuIcon = "head_ico_zom";
			item.sBodyModel = "plr_bo_zom_mil_police";
			item.sViewHands = "viewmodel_hands_zombie";
			item.sMenuName = "Zom Police";
			return item;
		case "playermodel_css_badass_terrorist":
			item = GetDefaultItem();
			item.iRankId = 25;
			//item.bIsFree = true;
			item.sMenuIcon = "head_ico_terrorist";
			item.sBodyModel = "playermodel_css_badass_terrorist";
			item.sViewHands = "viewmodel_hands_zombie";
			item.sMenuName = "Terrorist";
			return item;
		case "playermodel_castro_bo":
			item = GetDefaultItem();
			item.iRankId = 40;
			//item.bIsFree = true;
			item.sMenuIcon = "head_ico_castro";
			item.sBodyModel = "playermodel_castro_bo";
			item.sViewHands = "viewmodel_hands_zombie";
			item.sMenuName = "Castro";
			return item;
		case "playermodel_savimbi_bo2":
			item = GetDefaultItem();
			item.iRankId = 55;
			//item.bIsFree = true;
			item.sMenuIcon = "head_ico_savimbi";
			item.sBodyModel = "playermodel_savimbi_bo2";
			item.sViewHands = "viewmodel_hands_zombie";
			item.sMenuName = "Savimbi";
			return item;
		case "Tourrette":
			item = GetDefaultItem();
			item.iRankId = 70;
			//item.bIsFree = true;
			item.sMenuIcon = "head_ico_tourrette";
			item.sBodyModel = "Tourrette";
			item.sViewHands = "viewmodel_hands_zombie";
			item.sMenuName = "Tourrette";
			return item;
		case "playermodel_baa_joker":
			item = GetDefaultItem();
			item.iRankId = 85;
			//item.bIsFree = true;
			item.sMenuIcon = "head_ico_joker";
			item.sBodyModel = "playermodel_baa_joker";
			item.sViewHands = "viewmodel_hands_zombie";
			item.sMenuName = "Joker";
			return item;
		case "playermodel_terminator":
			item = GetDefaultItem();
			item.iRankId = 100;
			//item.bIsFree = true;
			item.sMenuIcon = "head_ico_t800";
			item.sBodyModel = "playermodel_terminator";
			item.sViewHands = "viewmodel_hands_zombie";
			item.sMenuName = "Terminator";
			return item;
		default:
			return undefined;			
	}
}