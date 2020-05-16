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
	TrapActivator(17);
	
	StartEnts();
}

StartEnts()
{
	brushs = GetEntArray("t17_brush", "targetname");
	for (i = 0; i < brushs.size; i++)
		thread MoveEnt(brushs[i]);
}

MoveEnt(brush)
{
	centerPos = brush.origin;
	maxZ = 96;
	
	dir = 1;
	if (RandomInt(99) % 2)
		dir = -1;
	
	while (true)
	{
		newPos = brush.origin + (0, 0, RandomFloat(maxZ) * dir);
		if (Abs((newPos - centerPos)[2]) > maxZ)
			newPos = centerPos;
		
		brush MoveTo(newPos, RandomFloatRange(1, 4));
		brush waittill("movedone");
		
		dir *= -1;
		wait RandomFloat(3);
	}
}