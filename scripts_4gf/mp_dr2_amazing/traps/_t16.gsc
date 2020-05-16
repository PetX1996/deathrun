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
	brush = GetEnt("t16_brush", "targetname");
	brush.origin += (0, -180, 0);
	
	TrapActivator(16);
	
	MoveEnt(brush);
}

MoveEnt(brush)
{
	brush MoveY(180, RandomFloatRange(0.1, 0.4));
	brush waittill("movedone");
	
	wait RandomFloatRange(2, 4);
	
	brush MoveY(-180, RandomFloatRange(2, 4));
}