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
	/// FX path/fileName
	item.sTrailFX = "";
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
			return "";
		case 1:
			return "trail_blue_geo";
		case 2:
			return "trail_gold_geo";
		case 3:
			return "trail_green_geo";
		case 4:
			return "trail_red_geo";
		case 5:
			return "trail_white_geo";
		case 6:
			return "trail_blue_pulse";
		case 7:
			return "trail_gold_pulse";
		case 8:
			return "trail_green_pulse";
		case 9:
			return "trail_red_pulse";
		case 10:
			return "trail_white_pulse";
		case 11:
			return "trail_blue_spark";
		case 12:
			return "trail_color_geo";
		case 13:
			return "trail_red_h_pulse";
		case 14:
			return "trail_white_rotor";
		case 15:
			return "trail_teddy";
		case 16:
			return "trail_geo_s0";
		case 17:
			return "trail_geo_s1";
		case 18:
			return "trail_geo_s2";
		case 19:
			return "trail_geo_s3";
		case 20:
			return "trail_geo_s4";
		case 21:
			return "trail_geo_s5";
		case 22:
			return "trail_geo_s6";
		case 23:
			return "trail_geo_s7";
		//case 20:
			//return "trail_geo"; //test trail geo
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
		case "trail_blue_geo":
			item = GetDefaultItem();
			item.iRankId = 4;
			//item.bIsFree = true;
			item.sMenuIcon = "icon_trail_blue";
			item.sTrailFX = "trails/trail_blue_geo";
			return item;	
		case "trail_gold_geo":
			item = GetDefaultItem();
			item.iRankId = 8;
			//item.bIsFree = true;
			item.sMenuIcon = "icon_trail_gold";
			item.sTrailFX = "trails/trail_gold_geo";
			return item;	
		case "trail_green_geo":
			item = GetDefaultItem();
			item.iRankId = 12;
			//item.bIsFree = true;
			item.sMenuIcon = "icon_trail_green";
			item.sTrailFX = "trails/trail_green_geo";
			return item;
		case "trail_red_geo":
			item = GetDefaultItem();
			item.iRankId = 16;
			//item.bIsFree = true;
			item.sMenuIcon = "icon_trail_red";
			item.sTrailFX = "trails/trail_red_geo";
			return item;
		case "trail_white_geo":
			item = GetDefaultItem();
			item.iRankId = 20;
			//item.bIsFree = true;
			item.sMenuIcon = "icon_trail_white";
			item.sTrailFX = "trails/trail_white_geo";
			return item;
		case "trail_blue_pulse":
			item = GetDefaultItem();
			item.iRankId = 28;
			//item.bIsFree = true;
			item.sMenuIcon = "icon_trail_pulse_blue";
			item.sTrailFX = "trails/trail_blue_pulse";
			return item;
		case "trail_gold_pulse":
			item = GetDefaultItem();
			item.iRankId = 36;
			//item.bIsFree = true;
			item.sMenuIcon = "icon_trail_pulse_gold";
			item.sTrailFX = "trails/trail_gold_pulse";
			return item;
		case "trail_green_pulse":
			item = GetDefaultItem();
			item.iRankId = 44;
			//item.bIsFree = true;
			item.sMenuIcon = "icon_trail_pulse_green";
			item.sTrailFX = "trails/trail_green_pulse";
			return item;
		case "trail_red_pulse":
			item = GetDefaultItem();
			item.iRankId = 52;
			//item.bIsFree = true;
			item.sMenuIcon = "icon_trail_pulse_red";
			item.sTrailFX = "trails/trail_red_pulse";
			return item;
		case "trail_white_pulse":
			item = GetDefaultItem();
			item.iRankId = 60;
			//item.bIsFree = true;
			item.sMenuIcon = "icon_trail_pulse_white";
			item.sTrailFX = "trails/trail_white_pulse";
			return item;
		case "trail_blue_spark":
			item = GetDefaultItem();
			item.iRankId = 68;
			//item.bIsFree = true;
			item.sMenuIcon = "icon_trail_special_spark";
			item.sTrailFX = "trails/trail_blue_spark";
			return item;			
		case "trail_color_geo":
			item = GetDefaultItem();
			item.iRankId = 76;
			//item.bIsFree = true;
			item.sMenuIcon = "icon_trail_color";
			item.sTrailFX = "trails/trail_color_geo";
			return item;						
		case "trail_red_h_pulse":
			item = GetDefaultItem();
			item.iRankId = 84;
			//item.bIsFree = true;
			item.sMenuIcon = "icon_trail_special_hpulse";
			item.sTrailFX = "trails/trail_red_h_pulse";
			return item;
		case "trail_white_rotor":
			item = GetDefaultItem();
			item.iRankId = 92;
			//item.bIsFree = true;
			item.sMenuIcon = "icon_trail_special_wrotor";
			item.sTrailFX = "trails/trail_white_rotor";
			return item;
		case "trail_teddy":
			item = GetDefaultItem();
			item.iRankId = 100;
			//item.bIsFree = true;
			item.sMenuIcon = "icon_trail_special_teddy";
			item.sTrailFX = "trails/trail_teddy";
			return item;
			/*
		case "trail_geo":
			item = GetDefaultItem();
			//item.iRankId = 100;
			item.bIsFree = true;
			item.sMenuIcon = "icon_life";
			item.sTrailFX = "trails/geo";
			return item;
			*/
		case "trail_geo_s0":
			item = GetDefaultItem();
			item.iRankId = 100;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_trail_geo_s0";
			item.sTrailFX = "trails/trail_geo_s0";
			return item;
		case "trail_geo_s1":
			item = GetDefaultItem();
			item.iRankId = 100;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_trail_geo_s1";
			item.sTrailFX = "trails/trail_geo_s1";
			return item;
		case "trail_geo_s2":
			item = GetDefaultItem();
			item.iRankId = 100;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_trail_geo_s2";
			item.sTrailFX = "trails/trail_geo_s2";
			return item;
		case "trail_geo_s3":
			item = GetDefaultItem();
			item.iRankId = 100;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_trail_geo_s3";
			item.sTrailFX = "trails/trail_geo_s3";
			return item;
		case "trail_geo_s4":
			item = GetDefaultItem();
			item.iRankId = 100;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_trail_geo_s4";
			item.sTrailFX = "trails/trail_geo_s4";
			return item;
		case "trail_geo_s5":
			item = GetDefaultItem();
			item.iRankId = 100;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_trail_geo_s5";
			item.sTrailFX = "trails/trail_geo_s5";
			return item;
		case "trail_geo_s6":
			item = GetDefaultItem();
			item.iRankId = 100;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_trail_geo_s6";
			item.sTrailFX = "trails/trail_geo_s6";
			return item;
		case "trail_geo_s7":
			item = GetDefaultItem();
			item.iRankId = 100;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_trail_geo_s7";
			item.sTrailFX = "trails/trail_geo_s7";
			return item;
		default:
			return undefined;			
	}
}