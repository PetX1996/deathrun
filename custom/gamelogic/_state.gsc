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
	
InSIniting(args)
{
	level._GL_iGS = [];
	level._GL_iGS["allies"] = C_IGLSTATE::iPRE_Waitting;
	level._GL_iGS["axis"] = C_IGLSTATE::iPRE_Waitting;
	
	level._GL_iGSTimes = [];
	level._GL_iGSTimes["allies"] = [];
	level._GL_iGSTimes["allies"][C_IGLSTATE::iPRE_Waitting] = GetTime();
	level._GL_iGSTimes["axis"] = [];
	level._GL_iGSTimes["axis"][C_IGLSTATE::iPRE_Waitting] = GetTime();
}