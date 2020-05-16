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
	brush = GetEnt("t6_brush", "targetname");
	brush.origin += (0, 0, 144);
	
	TrapActivator(6);
	
	MoveEnt(brush);
}

MoveEnt(brush)
{
	trig = GetEnt("t6_trig", "targetname");
	
	for (i = 0; i < 3; i++)
	{
		time = RandomFloatRange(0.1, 0.5);
		brush MoveZ(-160, time, time * 0.33, 0);
		
		KillPlayersInTrigger(trig);
		brush waittill("movedone");
		Earthquake(1.5, 1, brush.origin, 1024);
		
		time = RandomFloatRange(4, 10);
		brush MoveZ(160, time, time * 0.33, time * 0.33);
		brush waittill("movedone");
	}
}