// +========================================================================+
// I                    ___  _____  _____                                   I
// I                   /   !!  __ \!  ___!                                  I
// I                  / /! !! !  \/! !_          ___  ____                  I
// I                 / /_! !! ! __ !  _!        / __!!_  /                  I
// I                 \___  !! !_\ \! !      _  ! (__  / /                   I
// I                     !_/ \____/\_!     (_)  \___!/___!                  I
// I                                                                        I
// I========================================================================I
// I                           mp_dr2_amazing                               I
// I========================================================================I
// I                      mapped by:  R3MIEN, Col!ar      		            I
// I                    scripted by:  PetX                                  I
// I                        website:  www.4GF.cz                            I
// I========================================================================I
// I                           DEATHRUN 2 MOD                               I
// I========================================================================I

#include scripts_4gf\mp_dr2_amazing\traps\_utility;

Main()
{
	TrapActivator(11);
	
	MoveEnt();
}

MoveEnt()
{
	brush = GetEnt("t11_brush", "targetname");
	trig = GetEnt("t11_trig", "targetname");
	
	trig EnableLinkTo();
	trig LinkTo(brush);
	
	raiseTime = 10;
	lowerTime = 5;
	duration = 5;
	
	brush MoveZ(304, raiseTime, raiseTime * 0.33, raiseTime * 0.33);
	wait raiseTime + duration;
	
	brush MoveZ(-304, lowerTime, lowerTime * 0.33, lowerTime * 0.33);
	wait lowerTime;
	
	trig UnLink();
}