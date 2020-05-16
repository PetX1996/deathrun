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
	TrapActivator(24);
	
	RotateEnt();
}

RotateEnt()
{
	brush = GetEnt("t24_brush", "targetname");
	trig = GetEnt("t24_trig", "targetname");
	
	trig EnableLinkTo();
	trig LinkTo(brush);
	
	while (true)
	{
		turns = RandomIntRange(2, 10);
		time = (turns * 360) / RandomFloatRange(200, 300);
		brush RotateYaw(360 * turns, time, time * 0.33, time * 0.33);
		brush waittill("rotatedone");
		
		wait RandomFloatRange(5, 15);
	}
}