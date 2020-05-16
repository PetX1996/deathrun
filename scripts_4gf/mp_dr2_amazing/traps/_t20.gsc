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
	TrapActivator(20);
	
	PrepareEnts();
}

PrepareEnts()
{
	brush0 = GetEnt("t20_brush_0", "targetname");
	model0 = GetEnt("t20_model_0", "targetname");
	
	brush1 = GetEnt("t20_brush_1", "targetname");
	model1 = GetEnt("t20_model_1", "targetname");
	
	thread MoveEnts(brush0, model0);
	thread MoveEnts(brush1, model1);
}

MoveEnts(ent0, ent1)
{
	wait RandomFloat(1);

	time = RandomFloatRange(1, 3);
	ent0 MoveZ(-40, time);
	ent1 MoveZ(-40, time);
}