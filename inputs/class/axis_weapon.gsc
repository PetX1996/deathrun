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
			return "knife_mp";
		case 1:
			return "tomahawk_mp";
		case 2:
			return "gl_g3_mp";
		case 3:
			return "gl_ak47_mp";
		case 4:
			return "gl_m4_mp";
		case 5:
			return "gl_g36c_mp";
		case 6:
			return "gl_m16_mp";
		case 7:
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
			// knife 1
			item = GetDefaultItem();
			item.bIsFree = true;
			item.sMenuIcon = "weapon_ico_knife1";
			item.sWeaponName = "knife_mp";
			item.sMenuName = "Knife";
			return item;
		case "tomahawk_mp":
			// tomahawk
			item = GetDefaultItem();
			item.iRankId = 20;
			//item.bIsFree = true;
			item.sMenuIcon = "weapon_aks74u";
			item.sWeaponName = "tomahawk_mp";
			item.sMenuName = "Tomahawk";
			return item;
		case "gl_g3_mp":
			// shovel
			item = GetDefaultItem();
			item.iRankId = 40;
			//item.bIsFree = true;
			item.sMenuIcon = "weapon_attachment_suppressor";
			item.sWeaponName = "gl_g3_mp";
			item.sMenuName = "Shovel";
			return item;
		case "gl_ak47_mp":
			// axe
			item = GetDefaultItem();
			item.iRankId = 60;
			//item.bIsFree = true;
			item.sMenuIcon = "weapon_attachment_grip";
			item.sWeaponName = "gl_ak47_mp";
			item.sMenuName = "Axe";
			return item;
		case "gl_m4_mp":
			// katana
			item = GetDefaultItem();
			item.iRankId = 80;
			//item.bIsFree = true;
			item.sMenuIcon = "weapon_attachment_reflex";
			item.sWeaponName = "gl_m4_mp";
			item.sMenuName = "Katana";
			return item;
		case "gl_g36c_mp":
			item = GetDefaultItem();
			item.iRankId = 100;
			//item.bIsFree = true;
			item.sMenuIcon = "weapon_ak47";
			item.sWeaponName = "gl_g36c_mp";
			item.sMenuName = "Lightsaber Red";
			return item;
		case "gl_m16_mp":
			item = GetDefaultItem();
			//item.bIsFree = true;
			item.iRankId = 100;
			item.sMenuIcon = "weapon_attachment_acog";
			item.sWeaponName = "gl_m16_mp";
			item.sMenuName = "Ice Sword";
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