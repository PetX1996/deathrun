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
	/// perkName
	item.sPerkName = "";
	return item;
}

/// <summary>
/// Get number of items visible in the menu.
/// </summary>
/// <returns>Int</returns>
GetItemsCount()
{
	return 10;
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
			return "perk_nightvision";
		case 2:
			return "specialty_fastreload";
		case 3:
			return "specialty_rof";
		case 4:
			return "specialty_extraammo";
		case 5:
			return "specialty_bulletdamage";
		case 6:
			return "specialty_bulletaccuracy";
		case 7:
			return "perk_fastrun";
		case 8:
			return "perk_backstep";
		case 9:
			return "perk_rtd";
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
		case "perk_nightvision":
			// NIGHT VISION
			item = GetDefaultItem();
			item.iRankId = 5;
			//item.bIsFree = true;
			item.sMenuIcon = "specialty_weapon_c4";
			item.sPerkName = "perk_nightvision";
			item.sMenuName = "Night Vision";
			return item;
		case "specialty_fastreload":
			// SLEIGHT OF HAND (FAST RELOAD)
			item = GetDefaultItem();
			item.iRankId = 10;
			//item.bIsFree = true;
			item.sMenuIcon = "specialty_fastreload";
			item.sPerkName = "specialty_fastreload";
			item.sMenuName = "Fast Reload";
			return item;
		case "specialty_rof":
			// DOUBLE TAP (FASTER BULLETS)
			item = GetDefaultItem();
			item.iRankId = 15;
			//item.bIsFree = true;
			item.sMenuIcon = "specialty_rof";
			item.sPerkName = "specialty_rof";
			item.sMenuName = "Faster Bullets";
			return item;
		case "specialty_extraammo":
			// BANDOLIER (EXTRA AMMO)
			item = GetDefaultItem();
			item.iRankId = 20;
			//item.bIsFree = true;
			item.sMenuIcon = "specialty_extraammo";
			item.sPerkName = "specialty_extraammo";
			item.sMenuName = "Extra Ammo";
			return item;
		case "specialty_bulletdamage":
			// STOPPING POWER (BULLET DAMAGE)
			item = GetDefaultItem();
			item.iRankId = 25;
			//item.bIsFree = true;
			item.sMenuIcon = "specialty_bulletdamage";
			item.sPerkName = "specialty_bulletdamage";
			item.sMenuName = "Bullet Damage";
			return item;
		case "specialty_bulletaccuracy":
			// LASER
			item = GetDefaultItem();
			item.iRankId = 30;
			//item.bIsFree = true;
			item.sMenuIcon = "specialty_bulletaccuracy";
			item.sPerkName = "specialty_bulletaccuracy";
			item.sMenuName = "Bullet Accuracy + Laser";
			return item;
		case "perk_fastrun":
			// ADRENALINE (FAST RUN)
			item = GetDefaultItem();
			item.iRankId = 35;
			//item.bIsFree = true;
			item.sMenuIcon = "specialty_gpsjammer";
			item.sPerkName = "perk_fastrun";
			item.sMenuName = "Fast Run";
			item.sMenuDescription = "Increases your speed for 15 seconds";
			return item;
		case "perk_backstep":
			// BACK STEP
			item = GetDefaultItem();
			item.iRankId = 40;
			//item.bIsFree = true;
			item.sMenuIcon = "specialty_explosivedamage";
			item.sPerkName = "perk_backstep";
			item.sMenuName = "Back Step";
			item.sMenuDescription = "Teleports you to saved position";
			return item;
		case "perk_rtd":
			// ROLL THE DICE
			item = GetDefaultItem();
			item.iRankId = 50;
			//item.bIsFree = true;
			item.sMenuIcon = "specialty_bulletpenetration";
			item.sPerkName = "perk_rtd";
			item.sMenuName = "Roll The Dice";
			item.sMenuDescription = "Picks random perk";
			return item;
		/*case 8:
			//ODHALOVAC
			item = GetDefaultItem();
			item.bIsFree = true;
			item.sMenuIcon = "specialty_specialgrenade";
			item.sPerkName = "specialty_specialgrenade";
			return item;*/
		/*case 14:
			//DYMOVNICE
			item = GetDefaultItem();
			item.bIsFree = true;
			item.sMenuIcon = "specialty_grenadepulldeath";
			item.sPerkName = "specialty_grenadepulldeath";
			return item;*/
		/*case 15:
			//INVISIBLE
			item = GetDefaultItem();
			item.bIsFree = true;
			item.sMenuIcon = "specialty_holdbreath";
			item.sPerkName = "specialty_holdbreath";
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