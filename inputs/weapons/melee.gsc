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

IsMeleeWeapon(sWeaponName)
{
    switch (sWeaponName)
	{
		case "gl_ak47_mp":
		case "gl_m4_mp":
		case "gl_g3_mp":
		case "gl_g36c_mp":
		case "gl_m14_mp":
		case "gl_m16_mp":
		case "gl_mp":
		case "tomahawk_mp":
		case "knife_mp":
		case "hind_ffar_mp":
			return true;
		default:
			return false;
	}
}