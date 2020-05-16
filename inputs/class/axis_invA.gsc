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
	item.sPerkName = "";
	return item;
}

/// <summary>
/// Get number of items visible in the menu.
/// </summary>
/// <returns>Int</returns>
GetItemsCount()
{
	return 4;
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
			return "perk_bunnyhop";
		case 1:
			return "perk_speed";
		case 2:
			return "specialty_armorvest";
		case 3:
			return "perk_enemyhp";
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
		case "perk_bunnyhop":
			// BUNNY HOP
			item = GetDefaultItem();
			item.bIsFree = true;
			item.sMenuIcon = "specialty_fraggrenade";
			item.sPerkName = "perk_bunnyhop";
			item.sMenuName = "Bunny Hop";
			return item;
		case "perk_speed":
			// SPEED
			item = GetDefaultItem();
			item.iRankId = 10;
			//item.bIsFree = true;
			item.sMenuIcon = "specialty_longersprint";
			item.sPerkName = "perk_speed";
			item.sMenuName = "Speed";
			item.sMenuDescription = "Increases your speed";
			return item;
		case "specialty_armorvest":
			// VESTA
			item = GetDefaultItem();
			item.iRankId = 25;
			//item.bIsFree = true;
			item.sMenuIcon = "specialty_armorvest";
			item.sPerkName = "specialty_armorvest";
			item.sMenuName = "Bulletproof Vest";
			return item;
		case "perk_enemyhp":
			// ENEMY HP
			item = GetDefaultItem();
			item.iRankId = 45;
			//item.bIsFree = true;
			item.sMenuIcon = "specialty_parabolic";
			item.sPerkName = "perk_enemyhp";
			item.sMenuName = "Enemy HP";
			item.sMenuDescription = "Restores your health when you kill enemy";
			return item;

		/*case 2:
			// DMG KNIFE
			item = GetDefaultItem();
			item.bIsFree = true;
			item.sMenuIcon = "specialty_quieter";
			item.sPerkName = "perk_knifedmg";
			item.sMenuDescription = "Knife Damage - Increases your knife damage";
			return item;*/
		/*case 5:
			// REPELENT
			item = GetDefaultItem();
			item.bIsFree = true;
			item.sMenuIcon = "specialty_pistoldeath";
			item.sPerkName = "perk_repelent";
			return item;*/
		/*case 1:
			//STUNMORE
			item = GetDefaultItem();
			item.bIsFree = true;
			item.sMenuIcon = "specialty_weapon_claymore";
			item.sPerkName = "specialty_weapon_claymore";
			return item;*/
		/*case 6:
			//RPG
			item = GetDefaultItem();
			item.bIsFree = true;
			item.sMenuIcon = "specialty_weapon_rpg";
			item.sPerkName = "specialty_weapon_rpg";
			return item;*/
		/*case 16:
			//DECOY
			item = GetDefaultItem();
			item.bIsFree = true;
			item.sMenuIcon = "specialty_locked";
			item.sPerkName = "specialty_locked";
			return item;*/
		default:
			return undefined;			
	}
}