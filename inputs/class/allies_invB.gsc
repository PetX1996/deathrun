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
	item.sSprayFX = "";
	return item;
}

/// <summary>
/// Get number of items visible in the menu.
/// </summary>
/// <returns>Int</returns>
GetItemsCount()
{
	return 50;
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
			return "spray14";
		case 1:
			return "spray8";
		case 2:
			return "spray9";
		case 3:
			return "spray10";
		case 4:
			return "spray11";
		case 5:
			return "spray2";
		case 6:
			return "spray6";
		case 7:
			return "spray7";
		case 8:
			return "spray1";
		case 9:
			return "spray3";
		case 10:
			return "spray5";
		case 11:
			return "spray4";
		case 12:
			return "spray0";
		case 13:
			return "spray23";
		case 14:
			return "spray12";
		case 15:
			return "spray13";
		case 16:
			return "spray15";
		case 17:
			return "spray16";
		case 18:
			return "spray17";
		case 19:
			return "spray18";
		case 20:
			return "spray19";
		case 21:
			return "spray20";
		case 22:
			return "spray21";
		case 23:
			return "spray22";
		case 24:
			return "sprayanim0";
		case 25:
			return "sprayanim1";
		case 26:
			return "sprayanim2";
		case 27:
			return "sprayanim3";
		case 28:
			return "sprayanim4";
		case 29:
			return "sprayanim5";
		case 30:
			return "sprayanim6";
		case 31:
			return "sprayanim7";
		case 32:
			return "sprayanim8";
		case 33:
			return "sprayanim9";
		case 34:
			return "sprayanim10";
		case 35:
			return "sprayanim11";
		case 36:
			return "sprayanim12";
		case 37:
			return "sprayanim13";
		case 38:
			return "sprayanim14";
		case 39:
			return "sprayanim15";
		case 40:
			return "sprayanim16";
		case 41:
			return "sprayanim17";
		case 42:
			return "sprayanim18";
		case 43:
			return "sprayanim19";
		case 44:
			return "sprayanim20";
		case 45:
			return "sprayanim21";
		case 46:
			return "sprayanim22";
		case 47:
			return "sprayanim23";
		case 48:
			return "sprayanim24";
		case 49:
			return "sprayanim25";	
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
		case "spray14":
			item = GetDefaultItem();
			item.bIsFree = true;
			item.sMenuIcon = "ico_spray14";
			item.sSprayFX = "sprays/spray14";
			return item;
		case "spray8":
			item = GetDefaultItem();
			item.iRankId = 5;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_spray8";
			item.sSprayFX = "sprays/spray8";
			return item;
		case "spray9":
			item = GetDefaultItem();
			item.iRankId = 9;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_spray9";
			item.sSprayFX = "sprays/spray9";
			return item;
		case "spray10":
			item = GetDefaultItem();
			item.iRankId = 12;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_spray10";
			item.sSprayFX = "sprays/spray10";
			return item;
		case "spray11":
			item = GetDefaultItem();
			item.iRankId = 14;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_spray11";
			item.sSprayFX = "sprays/spray11";
			return item;
		case "spray2":
			item = GetDefaultItem();
			item.iRankId = 16;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_spray2";
			item.sSprayFX = "sprays/spray2";
			return item;
		case "spray6":
			item = GetDefaultItem();
			item.iRankId = 18;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_spray6";
			item.sSprayFX = "sprays/spray6";
			return item;
		case "spray7":
			item = GetDefaultItem();
			item.iRankId = 20;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_spray7";
			item.sSprayFX = "sprays/spray7";
			return item;
		case "spray1":
			item = GetDefaultItem();
			item.iRankId = 22;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_spray1";
			item.sSprayFX = "sprays/spray1";
			return item;
		case "spray3":
			item = GetDefaultItem();
			item.iRankId = 24;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_spray3";
			item.sSprayFX = "sprays/spray3";
			return item;	
		case "spray5":
			item = GetDefaultItem();
			item.iRankId = 26;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_spray5";
			item.sSprayFX = "sprays/spray5";
			return item;			
		case "spray4":
			item = GetDefaultItem();
			item.iRankId = 28;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_spray4";
			item.sSprayFX = "sprays/spray4";
			return item;
		case "spray0":
			item = GetDefaultItem();
			item.iRankId = 30;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_spray0";
			item.sSprayFX = "sprays/spray0";
			return item;
		case "spray23":
			item = GetDefaultItem();
			item.iRankId = 32;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_spray23";
			item.sSprayFX = "sprays/spray23";
			return item;
		case "spray12":
			item = GetDefaultItem();
			item.iRankId = 34;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_spray12";
			item.sSprayFX = "sprays/spray12";
			return item;
		case "spray13":
			item = GetDefaultItem();
			item.iRankId = 36;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_spray13";
			item.sSprayFX = "sprays/spray13";
			return item;
		case "spray15":
			item = GetDefaultItem();
			item.iRankId = 38;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_spray15";
			item.sSprayFX = "sprays/spray15";
			return item;
		case "spray16":
			item = GetDefaultItem();
			item.iRankId = 40;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_spray16";
			item.sSprayFX = "sprays/spray16";
			return item;
		case "spray17":
			item = GetDefaultItem();
			item.iRankId = 42;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_spray17";
			item.sSprayFX = "sprays/spray17";
			return item;
		case "spray18":
			item = GetDefaultItem();
			item.iRankId = 44;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_spray18";
			item.sSprayFX = "sprays/spray18";
			return item;
		case "spray19":
			item = GetDefaultItem();
			item.iRankId = 46;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_spray19";
			item.sSprayFX = "sprays/spray19";
			return item;
		case "spray20":
			item = GetDefaultItem();
			item.iRankId = 48;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_spray20";
			item.sSprayFX = "sprays/spray20";
			return item;
		case "spray21":
			item = GetDefaultItem();
			item.iRankId = 50;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_spray21";
			item.sSprayFX = "sprays/spray21";
			return item;
		case "spray22":
			item = GetDefaultItem();
			item.iRankId = 52;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_spray22";
			item.sSprayFX = "sprays/spray22";
			return item;
		case "sprayanim0":
			item = GetDefaultItem();
			item.iRankId = 54;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_sprayanim0";
			item.sSprayFX = "sprays/sprayanim0";
			return item;
		case "sprayanim1":
			item = GetDefaultItem();
			item.iRankId = 56;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_sprayanim1";
			item.sSprayFX = "sprays/sprayanim1";
			return item;
		case "sprayanim2":
			item = GetDefaultItem();
			item.iRankId = 58;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_sprayanim2";
			item.sSprayFX = "sprays/sprayanim2";
			return item;
		case "sprayanim3":
			item = GetDefaultItem();
			item.iRankId = 60;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_sprayanim3";
			item.sSprayFX = "sprays/sprayanim3";
			return item;
		case "sprayanim4":
			item = GetDefaultItem();
			item.iRankId = 62;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_sprayanim4";
			item.sSprayFX = "sprays/sprayanim4";
			return item;
		case "sprayanim5":
			item = GetDefaultItem();
			item.iRankId = 64;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_sprayanim5";
			item.sSprayFX = "sprays/sprayanim5";
			return item;
		case "sprayanim6":
			item = GetDefaultItem();
			item.iRankId = 66;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_sprayanim6";
			item.sSprayFX = "sprays/sprayanim6";
			return item;
		case "sprayanim7":
			item = GetDefaultItem();
			item.iRankId = 68;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_sprayanim7";
			item.sSprayFX = "sprays/sprayanim7";
			return item;
		case "sprayanim8":
			item = GetDefaultItem();
			item.iRankId = 70;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_sprayanim8";
			item.sSprayFX = "sprays/sprayanim8";
			return item;
		case "sprayanim9":
			item = GetDefaultItem();
			item.iRankId = 72;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_sprayanim9";
			item.sSprayFX = "sprays/sprayanim9";
			return item;
		case "sprayanim10":
			item = GetDefaultItem();
			item.iRankId = 74;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_sprayanim10";
			item.sSprayFX = "sprays/sprayanim10";
			return item;
		case "sprayanim11":
			item = GetDefaultItem();
			item.iRankId = 76;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_sprayanim11";
			item.sSprayFX = "sprays/sprayanim11";
			return item;
		case "sprayanim12":
			item = GetDefaultItem();
			item.iRankId = 78;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_sprayanim12";
			item.sSprayFX = "sprays/sprayanim12";
			return item;
		case "sprayanim13":
			item = GetDefaultItem();
			item.iRankId = 80;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_sprayanim13";
			item.sSprayFX = "sprays/sprayanim13";
			return item;
		case "sprayanim14":
			item = GetDefaultItem();
			item.iRankId = 82;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_sprayanim14";
			item.sSprayFX = "sprays/sprayanim14";
			return item;
		case "sprayanim15":
			item = GetDefaultItem();
			item.iRankId = 84;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_sprayanim15";
			item.sSprayFX = "sprays/sprayanim15";
			return item;
		case "sprayanim16":
			item = GetDefaultItem();
			item.iRankId = 86;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_sprayanim16";
			item.sSprayFX = "sprays/sprayanim16";
			return item;
		case "sprayanim17":
			item = GetDefaultItem();
			item.iRankId = 88;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_sprayanim17";
			item.sSprayFX = "sprays/sprayanim17";
			return item;
		case "sprayanim18":
			item = GetDefaultItem();
			item.iRankId = 90;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_sprayanim18";
			item.sSprayFX = "sprays/sprayanim18";
			return item;
		case "sprayanim19":
			item = GetDefaultItem();
			item.iRankId = 92;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_sprayanim19";
			item.sSprayFX = "sprays/sprayanim19";
			return item;
		case "sprayanim20":
			item = GetDefaultItem();
			item.iRankId = 94;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_sprayanim20";
			item.sSprayFX = "sprays/sprayanim20";
			return item;
		case "sprayanim21":
			item = GetDefaultItem();
			item.iRankId = 96;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_sprayanim21";
			item.sSprayFX = "sprays/sprayanim21";
			return item;
		case "sprayanim22":
			item = GetDefaultItem();
			item.iRankId = 98;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_sprayanim22";
			item.sSprayFX = "sprays/sprayanim22";
			return item;
		case "sprayanim23":
			item = GetDefaultItem();
			item.iRankId = 100;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_sprayanim23";
			item.sSprayFX = "sprays/sprayanim23";
			return item;
		case "sprayanim24":
			item = GetDefaultItem();
			item.iRankId = 100;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_sprayanim24";
			item.sSprayFX = "sprays/sprayanim24";
			return item;
		case "sprayanim25":
			item = GetDefaultItem();
			item.iRankId = 100;
			//item.bIsFree = true;
			item.sMenuIcon = "ico_sprayanim25";
			item.sSprayFX = "sprays/sprayanim25";
			return item;
		default:
			return undefined;			
	}
}