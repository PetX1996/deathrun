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
// Mod      : Core
// Website  : http://www.4gf.cz/
//I========================================================================I
// Script by: PetX
//I========================================================================I

#include core\include\_usings;

ToStr_mss(milliseconds)
{
	minutes = Floor(milliseconds / 60000);
	seconds = Floor((milliseconds / 1000) - (minutes * 60));
	return minutes + ":" + ISTRING::PadLeft(ITYPE::IntToStr(seconds), 2, "0");
}

ToInt_h(iMilliseconds)
{
	return Int(iMilliseconds / 3600000);
}