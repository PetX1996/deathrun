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
	brushs = GetEntArray("t7_brush", "targetname");
	for (i = 0; i < brushs.size; i++)
		brushs[i].origin += (0, 0, 132);
	
	TrapActivator(7);
	
	MoveEnt(brushs);
}

MoveEnt(brushs)
{
	firstI = RandomInt(brushs.size);
	secondI = RandomInt(brushs.size);
	while (secondI == firstI)
		secondI = RandomInt(brushs.size);
	
	first = brushs[firstI];
	second = brushs[secondI];
	
	time = RandomFloatRange(0.5, 1);
	first MoveZ(-132, time);
	second MoveZ(-132, time);
	
	// TODO: trigger proti blokovaniu?
}