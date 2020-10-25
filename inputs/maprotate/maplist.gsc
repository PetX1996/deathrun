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

#include custom\include\_usings;

GetCount()
{
	return 15;
}

GetItem(iIndex)
{
	switch (iIndex)
	{
		case 0:
			return "mp_deathrun_palm";
		case 1:
			return "mp_deathrun_city";
		case 2:
			return "mp_deathrun_dirt";
		case 3:
			return "mp_dr_indipyramid";
		case 4:
			return "mp_deathrun_clear";
		case 5:
			return "mp_deathrun_crazy";
		case 6:
			return "mp_dr_jurapark";
		case 7:
			return "mp_deathrun_easy";
		case 8:
			return "mp_deathrun_bangarang";
		case 9:
			return "mp_deathrun_scary";
		case 10:
			return "mp_dr_terror";
		case 11:
			return "mp_dr2_orangesky";
		case 12:
			return "mp_dr2_view";
		case 13:
			return "mp_dr2_simonsays";
		case 14:
			return "mp_dr2_amazing";
		default:
			return undefined;
	}
}