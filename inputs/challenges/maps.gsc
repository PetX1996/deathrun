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

GetMapFuncs(sMapFullName)
{
	switch (sMapFullName)
	{
		case "mp_dr2_orangesky": // stats 0 - 1
			funcs = {	dGetItemsCount 	= inputs\challenges\maps\mp_dr2_orangesky::GetItemsCount,
						dGetNameByIndex = inputs\challenges\maps\mp_dr2_orangesky::GetNameByIndex,
						dGetItemOrStageListByName 	= inputs\challenges\maps\mp_dr2_orangesky::GetItemOrStageListByName };
			return funcs;
		/*case "mp_deathrun_amazing": // stats 1 - 6
			funcs = {	dGetItemsCount 	= inputs\challenges\maps\mp_deathrun_amazing::GetItemsCount,
						dGetNameByIndex = inputs\challenges\maps\mp_deathrun_amazing::GetNameByIndex,
						dGetItemOrStageListByName 	= inputs\challenges\maps\mp_deathrun_amazing::GetItemOrStageListByName };
			return funcs;*/
		default:
			return undefined;
	}
}