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
	return 24;
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
			return "body_complete_mp_price_woodland";
		case 1:
			return "body_complete_mp_russian_farmer";
		case 2:
			return "body_complete_mp_zakhaev";
		case 3:
			return "body_complete_mp_spetsnaz_boris";
		case 4:
			return "playermodel_dnf_duke";
		case 5:
			return "playermodel_fifty_cent";
		case 6:
			return "playermodel_deluca_bo2";
		case 7:
			return "playermodel_handsome_bo2";
		case 8:
			return "playermodel_oleary_bo2";
		case 9:
			return "Yuusha";
		case 10:
			return "playermodel_aot_novak_00_heavy";
		case 11:
			return "body_rosco_heavy";
		case 12:
			return "Eo";
		case 13:
			return "playermodel_aot_rosco_93_armor";
		case 14:
			return "playermodel_mw3_exp_juggernaunt";
		case 15:
			return "Yuusha_2";
		case 16:
			return "playermodel_GTA_IV_NICO";
		case 17:
			return "playermodel_briggs_bo2";
		case 18:
			return "playermodel_AoT_alice";
		case 19:
			return "playermodel_aot_novak_93";
		case 20:
			return "playermodel_ghost_recon";
		case 21:
			return "playermodel_vin_diesel";
		case 22:
			return "playermodel_cdc_bo2";
		case 23:
			return "Elysium_SC5";
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
		case "body_complete_mp_price_woodland":
			item = GetDefaultItem();
			//item.iRankId = 30;
			item.bIsFree = true;
			item.sMenuIcon = "head_ico_price";
			item.sBodyModel = "body_complete_mp_price_woodland";
			item.sViewHands = "viewmodel_hands_zombie";
			item.sMenuName = "Cpt. Price";
			return item;
		case "body_complete_mp_russian_farmer":
			item = GetDefaultItem();
			item.iRankId = 3;
			//item.bIsFree = true;
			item.sMenuIcon = "head_ico_farmer";
			item.sBodyModel = "body_complete_mp_russian_farmer";
			item.sViewHands = "viewmodel_hands_zombie";
			item.sMenuName = "Farmer";
			return item;
		case "body_complete_mp_zakhaev":
			item = GetDefaultItem();
			item.iRankId = 7;
			//item.bIsFree = true;
			item.sMenuIcon = "head_ico_zakhaev";
			item.sBodyModel = "body_complete_mp_zakhaev";
			item.sViewHands = "viewmodel_hands_zombie";
			item.sMenuName = "Zakhaev";
			return item;
		case "body_complete_mp_spetsnaz_boris":
			item = GetDefaultItem();
			item.iRankId = 11;
			//item.bIsFree = true;
			item.sMenuIcon = "head_ico_boris";
			item.sBodyModel = "body_complete_mp_spetsnaz_boris";
			item.sViewHands = "viewmodel_hands_zombie";
			item.sMenuName = "Boris";
			return item;
		case "playermodel_dnf_duke":
			item = GetDefaultItem();
			item.iRankId = 15;
			//item.bIsFree = true;
			item.sMenuIcon = "head_ico_duke";
			item.sBodyModel = "playermodel_dnf_duke";
			item.sViewHands = "viewmodel_hands_zombie";
			item.sMenuName = "Duke Nuken";
			return item;
		case "playermodel_fifty_cent":
			item = GetDefaultItem();
			item.iRankId = 19;
			//item.bIsFree = true;
			item.sMenuIcon = "head_ico_50cent";
			item.sBodyModel = "playermodel_fifty_cent";
			item.sViewHands = "viewmodel_hands_zombie";
			item.sMenuName = "50 Cent";
			return item;
		case "playermodel_deluca_bo2":
			item = GetDefaultItem();
			item.iRankId = 24;
			//item.bIsFree = true;
			item.sMenuIcon = "head_ico_deluca";
			item.sBodyModel = "playermodel_deluca_bo2";
			item.sViewHands = "viewmodel_hands_zombie";
			item.sMenuName = "Deluca";
			return item;
		case "playermodel_handsome_bo2":
			item = GetDefaultItem();
			item.iRankId = 29;
			//item.bIsFree = true;
			item.sMenuIcon = "head_ico_handsome";
			item.sBodyModel = "playermodel_handsome_bo2";
			item.sViewHands = "viewmodel_hands_zombie";
			item.sMenuName = "Handsome";
			return item;
		case "playermodel_oleary_bo2":
			item = GetDefaultItem();
			item.iRankId = 33;
			//item.bIsFree = true;
			item.sMenuIcon = "head_ico_oleary";
			item.sBodyModel = "playermodel_oleary_bo2";
			item.sViewHands = "viewmodel_hands_zombie";
			item.sMenuName = "Oleary";
			return item;
		case "Yuusha":
			item = GetDefaultItem();
			item.iRankId = 38;
			//item.bIsFree = true;
			item.sMenuIcon = "head_ico_yuusha";
			item.sBodyModel = "Yuusha";
			item.sViewHands = "viewmodel_hands_zombie";
			item.sMenuName = "Yuusha";
			return item;
		case "playermodel_aot_novak_00_heavy":
			item = GetDefaultItem();
			item.iRankId = 42;
			//item.bIsFree = true;
			item.sMenuIcon = "head_ico_novak_heavy";
			item.sBodyModel = "playermodel_aot_novak_00_heavy";
			item.sViewHands = "viewmodel_hands_zombie";
			item.sMenuName = "Novak";
			return item;
		case "body_rosco_heavy":
			item = GetDefaultItem();
			item.iRankId = 47;
			//item.bIsFree = true;
			item.sMenuIcon = "head_ico_rosco_heavy";
			item.sBodyModel = "body_rosco_heavy";
			item.sViewHands = "viewmodel_hands_zombie";
			item.sMenuName = "Rosco";
			return item;	
		case "Eo":
			item = GetDefaultItem();
			item.iRankId = 51;
			//item.bIsFree = true;
			item.sMenuIcon = "head_ico_eo";
			item.sBodyModel = "Eo";
			item.sViewHands = "viewmodel_hands_zombie";
			item.sMenuName = "Eo";
			return item;
		case "playermodel_aot_rosco_93_armor":
			item = GetDefaultItem();
			item.iRankId = 55;
			//item.bIsFree = true;
			item.sMenuIcon = "head_ico_rosco_arm";
			item.sBodyModel = "playermodel_aot_rosco_93_armor";
			item.sViewHands = "viewmodel_hands_zombie";
			item.sMenuName = "Rosco 93";
			return item;
		case "playermodel_mw3_exp_juggernaunt":
			item = GetDefaultItem();
			item.iRankId = 59;
			//item.bIsFree = true;
			item.sMenuIcon = "head_ico_jugger";
			item.sBodyModel = "playermodel_mw3_exp_juggernaunt";
			item.sViewHands = "viewmodel_hands_zombie";
			item.sMenuName = "Juggernaunt";
			return item;
		case "Yuusha_2":
			item = GetDefaultItem();
			item.iRankId = 64;
			//item.bIsFree = true;
			item.sMenuIcon = "head_ico_yuusha2";
			item.sBodyModel = "Yuusha_2";
			item.sViewHands = "viewmodel_hands_zombie";
			item.sMenuName = "Yuusha 2";
			return item;
		case "playermodel_GTA_IV_NICO":
			item = GetDefaultItem();
			item.iRankId = 68;
			//item.bIsFree = true;
			item.sMenuIcon = "head_ico_nico";
			item.sBodyModel = "playermodel_GTA_IV_NICO";
			item.sViewHands = "viewmodel_hands_zombie";
			item.sMenuName = "Nico";
			return item;
		case "playermodel_briggs_bo2":
			item = GetDefaultItem();
			item.iRankId = 73;
			//item.bIsFree = true;
			item.sMenuIcon = "head_ico_brigs";
			item.sBodyModel = "playermodel_briggs_bo2";
			item.sViewHands = "viewmodel_hands_zombie";
			item.sMenuName = "Briggs";
			return item;
		case "playermodel_AoT_alice":
			item = GetDefaultItem();
			item.iRankId = 77;
			//item.bIsFree = true;
			item.sMenuIcon = "head_ico_alice";
			item.sBodyModel = "playermodel_AoT_alice";
			item.sViewHands = "viewmodel_hands_zombie";
			item.sMenuName = "Alice";
			return item;
		case "playermodel_aot_novak_93":
			item = GetDefaultItem();
			item.iRankId = 82;
			//item.bIsFree = true;
			item.sMenuIcon = "head_ico_novak";
			item.sBodyModel = "playermodel_aot_novak_93";
			item.sViewHands = "viewmodel_hands_zombie";
			item.sMenuName = "Novak 93";
			return item;	
		case "playermodel_ghost_recon":
			item = GetDefaultItem();
			item.iRankId = 86;
			//item.bIsFree = true;
			item.sMenuIcon = "head_ico_ghost";
			item.sBodyModel = "playermodel_ghost_recon";
			item.sViewHands = "viewmodel_hands_zombie";
			item.sMenuName = "Ghost Recon";
			return item;
		case "playermodel_vin_diesel":
			item = GetDefaultItem();
			item.iRankId = 91;
			//item.bIsFree = true;
			item.sMenuIcon = "head_ico_vin";
			item.sBodyModel = "playermodel_vin_diesel";
			item.sViewHands = "viewmodel_hands_zombie";
			item.sMenuName = "Vin Diesel";
			return item;
		case "playermodel_cdc_bo2":
			item = GetDefaultItem();
			item.iRankId = 95;
			//item.bIsFree = true;
			item.sMenuIcon = "head_ico_cdc";
			item.sBodyModel = "playermodel_cdc_bo2";
			item.sViewHands = "viewmodel_hands_zombie";
			item.sMenuName = "CDC";
			return item;
		case "Elysium_SC5":
			item = GetDefaultItem();
			item.iRankId = 100;
			//item.bIsFree = true;
			item.sMenuIcon = "head_ico_elysium";
			item.sBodyModel = "Elysium_SC5";
			item.sViewHands = "viewmodel_hands_zombie";
			item.sMenuName = "SC5";
			return item;		
		default:
			return undefined;			
	}
}