
/*
// be careful with stats!
// don't use same StatID for more fields...
// you can increase or decrease MaxValue or Stages, 
// 	increase MaxValue -> player can finish this challenge more times
// 	increase MaxValue -> player can go to higher stage without done previous

// don't assign StatID for some challenge and than assign same StatID to different challenge!
// neither if one of these challenges has been removed

GetItem(sName)
{
	switch (sName)
	{
		// JUMPERS
		case "killedActivatorsStageList":
			item = C_ICCHALLENGES::GetDefaultStageList();
			item.iStatId = STATS_JUMPER + 0;
			item C_ICCHALLENGES::StageList_AddStage("killedActivatorsI");
			item C_ICCHALLENGES::StageList_AddStage("killedActivatorsII");
			item C_ICCHALLENGES::StageList_AddStage("killedActivatorsIII");
			return item;
			case "killedActivatorsI":
				item = C_ICCHALLENGES::GetDefaultItem();
				item.sMenuName = "Killed Activators I";
				item.sMenuDescription = "Kill 100 activators totally.";
				item.iMaxValue = 100;
				item.iStatId = STATS_JUMPER + 1;
				item.bIsFree = true;
				return item;
			case "killedActivatorsII":
				item = C_ICCHALLENGES::GetDefaultItem();
				item.sMenuName = "Killed Activators II";
				item.sMenuDescription = "Kill 500 activators totally.";
				item.iMaxValue = 500;
				item.iStatId = STATS_JUMPER + 2;
				item.bIsFree = true;
				return item;
			case "killedActivatorsIII":
				item = C_ICCHALLENGES::GetDefaultItem();
				item.sMenuName = "Killed Activators III";
				item.sMenuDescription = "Kill 1000 activators totally.";
				item.iMaxValue = 1000;
				item.iStatId = STATS_JUMPER + 3;
				item.bIsFree = true;
				return item;
		
		
		// ACTIVATORS
		case "killedJumpersStageList":
			item = C_ICCHALLENGES::GetDefaultStageList();
			item.iStatId = STATS_ACTIVATOR + 0;
			item C_ICCHALLENGES::StageList_AddStage("killedJumpersI");
			item C_ICCHALLENGES::StageList_AddStage("killedJumpersII");
			item C_ICCHALLENGES::StageList_AddStage("killedJumpersIII");
			return item;
			case "killedJumpersI":
				item = C_ICCHALLENGES::GetDefaultItem();
				item.sMenuName = "Killed Jumpers I";
				item.sMenuDescription = "Kill 100 jumpers totally.";
				item.iMaxValue = 100;
				item.iStatId = STATS_ACTIVATOR + 1;
				item.bIsFree = true;
				return item;
			case "killedJumpersII":
				item = C_ICCHALLENGES::GetDefaultItem();
				item.sMenuName = "Killed Jumpers II";
				item.sMenuDescription = "Kill 500 jumpers totally.";
				item.iMaxValue = 500;
				item.iStatId = STATS_ACTIVATOR + 2;
				item.bIsFree = true;
				return item;
			case "killedJumpersIII":
				item = C_ICCHALLENGES::GetDefaultItem();
				item.sMenuName = "Killed Jumpers III";
				item.sMenuDescription = "Kill 1000 jumpers totally.";
				item.iMaxValue = 1000;
				item.iStatId = STATS_ACTIVATOR + 3;
				item.bIsFree = true;
				return item;
				
				
		// OTHER
		case "fallsStageList":
			item = C_ICCHALLENGES::GetDefaultStageList();
			item.iStatId = STATS_OTHER + 0;
			item C_ICCHALLENGES::StageList_AddStage("fallsI");
			item C_ICCHALLENGES::StageList_AddStage("fallsII");
			item C_ICCHALLENGES::StageList_AddStage("fallsIII");
			return item;
			case "fallsI":
				item = C_ICCHALLENGES::GetDefaultItem();
				item.sMenuName = "Falls I";
				item.sMenuDescription = "Fall 2 times.";
				item.iMaxValue = 2;
				item.iStatId = STATS_OTHER + 1;
				item.bIsFree = true;
				return item;
			case "fallsII":
				item = C_ICCHALLENGES::GetDefaultItem();
				item.sMenuName = "Falls II";
				item.sMenuDescription = "Fall 4 times.";
				item.iMaxValue = 4;
				item.iStatId = STATS_OTHER + 2;
				item.bIsFree = true;
				return item;
			case "fallsIII":
				item = C_ICCHALLENGES::GetDefaultItem();
				item.sMenuName = "Falls III";
				item.sMenuDescription = "Fall 6 times.";
				item.iMaxValue = 6;
				item.iStatId = STATS_OTHER + 3;
				item.bIsFree = true;
				return item;
		
		// STAGES TEST
		case "fallsStageList0":
				item = C_ICCHALLENGES::GetDefaultItem();
				item.sMenuName = "Falls 0";
				item.sMenuDescription = "Fall 1 times.";
				item.iMaxValue = 1;
				item.iStatId = C_ICCHALLENGES::STATS_Stage0 + 0;
				item.iRankId = 0;
				//item.bIsFree = true;
				return item;
		case "fallsStageList1":
				item = C_ICCHALLENGES::GetDefaultItem();
				item.sMenuName = "Falls 1";
				item.sMenuDescription = "Fall 1 times.";
				item.iMaxValue = 1;
				item.iStatId = C_ICCHALLENGES::STATS_Stage1 + 0;
				item.iRankId = 10;
				//item.bIsFree = true;
				return item;
		case "fallsStageList2":
				item = C_ICCHALLENGES::GetDefaultItem();
				item.sMenuName = "Falls 2";
				item.sMenuDescription = "Fall 1 times.";
				item.iMaxValue = 1;
				item.iStatId = C_ICCHALLENGES::STATS_Stage2 + 0;
				item.iRankId = 20;
				//item.bIsFree = true;
				return item;
		case "fallsStageList3":
				item = C_ICCHALLENGES::GetDefaultItem();
				item.sMenuName = "Falls 3";
				item.sMenuDescription = "Fall 1 times.";
				item.iMaxValue = 1;
				item.iStatId = C_ICCHALLENGES::STATS_Stage3 + 0;
				item.iRankId = 30;
				//item.bIsFree = true;
				return item;
		case "fallsStageList4":
				item = C_ICCHALLENGES::GetDefaultItem();
				item.sMenuName = "Falls 4";
				item.sMenuDescription = "Fall 1 times.";
				item.iMaxValue = 1;
				item.iStatId = C_ICCHALLENGES::STATS_Stage4 + 0;
				item.iRankId = 40;
				//item.bIsFree = true;
				return item;
		case "fallsStageList5":
				item = C_ICCHALLENGES::GetDefaultItem();
				item.sMenuName = "Falls 5";
				item.sMenuDescription = "Fall 1 times.";
				item.iMaxValue = 1;
				item.iStatId = C_ICCHALLENGES::STATS_Stage5 + 0;
				item.iRankId = 50;
				//item.bIsFree = true;
				return item;
		case "fallsStageList6":
				item = C_ICCHALLENGES::GetDefaultItem();
				item.sMenuName = "Falls 6";
				item.sMenuDescription = "Fall 1 times.";
				item.iMaxValue = 1;
				item.iStatId = C_ICCHALLENGES::STATS_Stage6 + 0;
				item.iRankId = 60;
				//item.bIsFree = true;
				return item;
		case "fallsStageList7":
				item = C_ICCHALLENGES::GetDefaultItem();
				item.sMenuName = "Falls 7";
				item.sMenuDescription = "Fall 1 times.";
				item.iMaxValue = 1;
				item.iStatId = C_ICCHALLENGES::STATS_Stage7 + 0;
				item.iRankId = 70;
				//item.bIsFree = true;
				return item;
		case "fallsStageList8":
				item = C_ICCHALLENGES::GetDefaultItem();
				item.sMenuName = "Falls 8";
				item.sMenuDescription = "Fall 1 times.";
				item.iMaxValue = 1;
				item.iStatId = C_ICCHALLENGES::STATS_Stage8 + 0;
				item.iRankId = 80;
				//item.bIsFree = true;
				return item;
		case "fallsStageList9":
				item = C_ICCHALLENGES::GetDefaultItem();
				item.sMenuName = "Falls 9";
				item.sMenuDescription = "Fall 1 times.";
				item.iMaxValue = 1;
				item.iStatId = C_ICCHALLENGES::STATS_Stage9 + 0;
				item.iRankId = 90;
				//item.bIsFree = true;
				return item;
				
		case "fallsStageListJ":
				item = C_ICCHALLENGES::GetDefaultItem();
				item.sMenuName = "Falls Jumper";
				item.sMenuDescription = "Fall 1 times.";
				item.iMaxValue = 1;
				item.iStatId = C_ICCHALLENGES::STATS_Jumper + 0;
				item.iRankId = 99;
				//item.bIsFree = true;
				return item;
		case "fallsStageListA":
				item = C_ICCHALLENGES::GetDefaultItem();
				item.sMenuName = "Falls Activator";
				item.sMenuDescription = "Fall 2 times.";
				item.iMaxValue = 2;
				item.iStatId = C_ICCHALLENGES::STATS_Activator + 0;
				item.iRankId = 99;
				//item.bIsFree = true;
				return item;
		case "fallsStageListO":
				item = C_ICCHALLENGES::GetDefaultItem();
				item.sMenuName = "Falls Other";
				item.sMenuDescription = "Fall 3 times.";
				item.iMaxValue = 3;
				item.iStatId = C_ICCHALLENGES::STATS_Other + 0;
				item.iRankId = 99;
				//item.bIsFree = true;
				return item;
		case "fallsStageListB":
				item = C_ICCHALLENGES::GetDefaultItem();
				item.sMenuName = "Falls Bonus";
				item.sMenuDescription = "Fall 4 times.";
				item.iMaxValue = 4;
				item.iStatId = C_ICCHALLENGES::STATS_Bonus + 0;
				item.iRankId = 99;
				//item.bIsFree = true;
				return item;
				
		default:
			return undefined;			
	}
}
*/

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
	return 6; 
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
			return "fastReload";
		case 1:
			return "bulletDamage";
		case 2:
			return "fastRun";
		case 3:
			return "rollTheDice";
		case 4:
			return "bunnyHop";
		case 5:
			return "backStep";
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
		case "fastReload":
			item = GetDefaultItem();
			item.sMenuName = "^2J - Fast Reload";
			item.sMenuDescription = "Reload 100 times with Fast reload";
			item.iMaxValue = 100;
			item.iStatId = C_ICCHALLENGES::STATS_Jumper + 0;
			return item;
		case "bulletDamage":
			item = GetDefaultItem();
			item.sMenuName = "^2J - Bullet Damage";
			item.sMenuDescription = "Hit 100 people with Bullet damage";
			item.iMaxValue = 100;
			item.iStatId = C_ICCHALLENGES::STATS_Jumper + 1;
			return item;
		case "fastRun":
			item = GetDefaultItem();
			item.sMenuName = "^2J - Fast Run";
			item.sMenuDescription = "Use Fast run 100 times";
			item.iMaxValue = 100;
			item.iStatId = C_ICCHALLENGES::STATS_Jumper + 2;
			return item;
		case "rollTheDice":
			item = GetDefaultItem();
			item.sMenuName = "^2J - Roll The Dice";
			item.sMenuDescription = "Use Roll the dice 100 times";
			item.iMaxValue = 100;
			item.iStatId = C_ICCHALLENGES::STATS_Jumper + 3;
			return item;
		case "bunnyHop":
			item = GetDefaultItem();
			item.sMenuName = "^2J - Bunny Hop";
			item.sMenuDescription = "Use Bunny hop 100 times";
			item.iMaxValue = 100;
			item.iStatId = C_ICCHALLENGES::STATS_Jumper + 4;
			return item;
		case "backStep":
			item = GetDefaultItem();
			item.sMenuName = "^2J - Back Step";
			item.sMenuDescription = "Use Back step 100 times";
			item.iMaxValue = 100;
			item.iStatId = C_ICCHALLENGES::STATS_Jumper + 5;
			return item;
		default:
			return undefined;
	}
}