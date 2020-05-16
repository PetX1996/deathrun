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
	brush = GetEnt("t9_brush", "targetname");
	brush.origin += (0, 176, 0);
	
	TrapActivator(9);
	
	MoveEnt(brush);
}

MoveEnt(brush)
{
	brush MoveY(-192, RandomFloatRange(0.2, 0.5));
	brush waittill("movedone");
	
	trig = GetEnt("t9_trig", "targetname");
	KillPlayersInTrigger(trig);
	
	wait RandomFloatRange(3, 6);
	brush MoveY(192, RandomFloatRange(3, 6));
}