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
	/// weaponFile name
	item.sWeaponName = "";
	return item;
}

/// <summary>
/// Get number of items visible in the menu.
/// </summary>
/// <returns>Int</returns>
GetItemsCount()
{
	return 19;
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
			return "knife_mp";
		case 1:
			return "beretta_mp";
		case 2:
			return "usp_mp";
		case 3:
			return "colt45_mp";
		case 4:
			return "deserteagle_mp";
		case 5:
			return "deserteaglegold_mp";
		case 6:
			return "usp_silencer_mp";
		case 7:
			return "beretta_silencer_mp";
		case 8:
			return "colt45_silencer_mp";
		case 9:
			return "colt44_mp";
		case 10:
			return "ak47_gl_mp";
		case 11:
			return "m40a3_acog_mp";
		case 12:
			return "remington700_acog_mp";
		case 13:
			return "m40a3_mp";
		case 14:
			return "remington700_mp";
		case 15:
			return "mp5_acog_mp";
		case 16:
			return "gl_m14_mp";
		case 17:
			return "gl_m16_mp";
		case 18:
			return "tomahawk_mp";
		case 19:
			return "hind_ffar_mp";
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
		case "knife_mp":
			item = GetDefaultItem();
			item.bIsFree = true;
			item.sMenuIcon = "weapon_ico_knife1";
			item.sWeaponName = "knife_mp";
			item.sMenuName = "Knife";
			return item;
		case "beretta_mp":
			item = GetDefaultItem();
			//item.bIsFree = true;
			item.iRankId = 2;
			item.sMenuIcon = "weapon_m9beretta";
			item.sWeaponName = "beretta_mp";
			item.sMenuName = "M9";
			return item;
		case "usp_mp":
			item = GetDefaultItem();
			//item.bIsFree = true;
			item.iRankId = 8;
			item.sMenuIcon = "weapon_usp_45";
			item.sWeaponName = "usp_mp";
			item.sMenuName = "USP .45";
			return item;
		case "colt45_mp":
			item = GetDefaultItem();
			//item.bIsFree = true;
			item.iRankId = 14;
			item.sMenuIcon = "weapon_colt_45";
			item.sWeaponName = "colt45_mp";
			item.sMenuName = "M1911 .45";
			return item;
		case "deserteagle_mp":
			item = GetDefaultItem();
			//item.bIsFree = true;
			item.iRankId = 20;
			item.sMenuIcon = "weapon_desert_eagle";
			item.sWeaponName = "deserteagle_mp";
			item.sMenuName = "Desert Eagle";
			return item;
		case "deserteaglegold_mp":
			item = GetDefaultItem();
			//item.bIsFree = true;
			item.iRankId = 26;
			item.sMenuIcon = "weapon_desert_eagle_gold";
			item.sWeaponName = "deserteaglegold_mp";
			item.sMenuName = "Gold Desert Eagle";
			return item;
		case "usp_silencer_mp":
			item = GetDefaultItem();
			//item.bIsFree = true;
			item.iRankId = 32;
			item.sMenuIcon = "weapon_ico_mk22";
			item.sWeaponName = "usp_silencer_mp";
			item.sMenuName = "M.K. 22";
			return item;				
		case "beretta_silencer_mp":
			item = GetDefaultItem();
			//item.bIsFree = true;
			item.iRankId = 38;
			item.sMenuIcon = "weapon_ico_fs";
			item.sWeaponName = "beretta_silencer_mp";
			item.sMenuName = "FN Five-seven";
			return item;
		case "colt45_silencer_mp":
			item = GetDefaultItem();
			//item.bIsFree = true;
			item.iRankId = 44;
			item.sMenuIcon = "weapon_ico_kimber";
			item.sWeaponName = "colt45_silencer_mp";
			item.sMenuName = "Kimber";
			return item;
		case "colt44_mp":
			item = GetDefaultItem();
			//item.bIsFree = true;
			item.iRankId = 50;
			item.sMenuIcon = "weapon_ico_colt44";
			item.sWeaponName = "colt44_mp";
			item.sMenuName = "Colt Anaconda";
			return item;
		case "ak47_gl_mp":
			item = GetDefaultItem();
			//item.bIsFree = true;
			item.iRankId = 56;
			item.sMenuIcon = "weapon_ico_t850";
			item.sWeaponName = "ak47_gl_mp";
			item.sMenuName = "Taurus 850 .38";
			return item;
		case "m40a3_acog_mp":
			item = GetDefaultItem();
			//item.bIsFree = true;
			item.iRankId = 62;
			item.sMenuIcon = "weapon_m40a3_acog";
			item.sWeaponName = "m40a3_acog_mp";
			item.sMenuName = "M40A3 Acog";
			return item;
		case "remington700_acog_mp":
			item = GetDefaultItem();
			//item.bIsFree = true;
			item.iRankId = 68;
			item.sMenuIcon = "weapon_remington700_acog";
			item.sWeaponName = "remington700_acog_mp";
			item.sMenuName = "R700 Acog";
			return item;
		case "m40a3_mp":
			item = GetDefaultItem();
			//item.bIsFree = true;
			item.iRankId = 74;
			item.sMenuIcon = "weapon_m40a3";
			item.sWeaponName = "m40a3_mp";
			item.sMenuName = "M40A3";
			return item;
		case "remington700_mp":
			item = GetDefaultItem();
			//item.bIsFree = true;
			item.iRankId = 82;
			item.sMenuIcon = "weapon_remington700";
			item.sWeaponName = "remington700_mp";
			item.sMenuName = "R700";
			return item;
		case "mp5_acog_mp":
			item = GetDefaultItem();
			//item.bIsFree = true;
			item.iRankId = 91;
			item.sMenuIcon = "weapon_g3";
			item.sWeaponName = "mp5_acog_mp";
			item.sMenuName = "Karabiner 98k";
			return item;
		case "gl_m14_mp":
			item = GetDefaultItem();
			//item.bIsFree = true;
			item.iRankId = 100;
			item.sMenuIcon = "weapon_benelli_m4";
			item.sWeaponName = "gl_m14_mp";
			item.sMenuName = "Lightsaber Blue";
			return item;
		case "gl_m16_mp":
			item = GetDefaultItem();
			//item.bIsFree = true;
			item.iRankId = 100;
			item.sMenuIcon = "weapon_attachment_acog";
			item.sWeaponName = "gl_m16_mp";
			item.sMenuName = "Ice Sword";
			return item;
		case "tomahawk_mp":
			item = GetDefaultItem();
			//item.bIsFree = true;
			item.iRankId = 100;
			item.sMenuIcon = "weapon_aks74u";
			item.sWeaponName = "tomahawk_mp";
			item.sMenuName = "Tomahawk";
			return item;
		case "hind_ffar_mp":
			item = GetDefaultItem();
			item.bIsFree = false;
			//item.iAccessFlag = 128;
			item.sMenuIcon = "weapon_ico_dark_sword";
			item.sWeaponName = "hind_ffar_mp";
			item.sMenuName = "Dark Sword";
			return item;
		default:
			return undefined;			
	}
}