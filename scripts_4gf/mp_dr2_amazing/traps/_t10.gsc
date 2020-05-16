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
	brushs = GetEntArray("t10_brush", "targetname");
	for (i = 0; i < brushs.size; i++)
		brushs[i].origin += (0, -112, 0);
	
	TrapActivator(10);
	
	for (i = 0; i < brushs.size; i++)
		thread MoveEnt(brushs[i]);
}

MoveEnt(brush)
{
	loops = RandomIntRange(2, 8);
	for (i = 0; i < loops; i++)
	{
		time = RandomFloatRange(0.2, 0.4);
		brush MoveY(112, time);
		brush waittill("movedone");
		
		time = RandomFloatRange(2, 5);
		brush MoveY(-112, time);
		brush waittill("movedone");
		
		wait RandomFloatRange(1, 3);
	}
}