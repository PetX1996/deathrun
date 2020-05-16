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
	TrapActivator(13);
	
	RotateEnt();
}

RotateEnt()
{
	brush = GetEnt("t13_brush", "targetname");
	
	minTime = 0.5;
	maxTime = 1;
	
	time = RandomFloatRange(minTime * 0.5, maxTime * 0.5);
	brush RotateYaw(-45, time);
	brush waittill("rotatedone");
	
	dir = 1;
		
	while (true)
	{
		time = RandomFloatRange(minTime, maxTime);
		brush RotateYaw(90 * dir, time);
		brush waittill("rotatedone");
		
		dir *= -1;
	}
}