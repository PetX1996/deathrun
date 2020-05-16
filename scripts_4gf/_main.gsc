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

Main()
{
	RunScriptsByMapName();
}

RunScriptsByMapName()
{
	switch (IGAME::GetMap())
	{
		case "mp_dr2_amazing":
			scripts_4gf\mp_dr2_amazing\_main::Main();
			break;
		case "mp_dr2_orangesky":
			scripts_4gf\mp_dr2_orangesky\_main::Main();
			break;
		case "mp_dr2_view":
			scripts_4gf\mp_dr2_view\_main::Main();
			break;
		case "mp_dr2_simonsays":
			scripts_4gf\mp_dr2_simonsays\_main::Main();
			break;
		default:
			break;
	}
}