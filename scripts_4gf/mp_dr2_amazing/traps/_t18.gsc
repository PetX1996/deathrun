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
	TrapActivator(18);
	
	StartEnts();
}

StartEnts()
{
	brushs = GetEntArray("t18_brush", "targetname");
	for (i = 0; i < brushs.size; i++)
	{
		thread RotateEnt(brushs[i]);
		wait RandomFloatRange(0.3, 1);
	}
}

RotateEnt(brush)
{	
	startTime = 2;
	endTime = RandomFloatRange(0.5, 0.7);
	accelTime = 0.5;
		
	time = startTime;
		
	dir = 1;
	if (RandomInt(99) % 2)
		dir = -1;
		
	brush RotateRoll(15 * dir, time * 0.5);
	brush waittill("rotatedone");
	
	while (true)
	{
		if (time > endTime)
			time -= accelTime;
			
		if (time < endTime)
			time = endTime;
			
		dir *= -1;
	
		brush RotateRoll(30 * dir, time);
		brush waittill("rotatedone");
	}
}