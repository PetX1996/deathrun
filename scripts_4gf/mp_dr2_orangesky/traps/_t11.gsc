// +========================================================================+
// I                    ___  _____  _____                                   I
// I                   /   !!  __ \!  ___!                                  I
// I                  / /! !! !  \/! !_          ___  ____                  I
// I                 / /_! !! ! __ !  _!        / __!!_  /                  I
// I                 \___  !! !_\ \! !      _  ! (__  / /                   I
// I                     !_/ \____/\_!     (_)  \___!/___!                  I
// I                                                                        I
// I========================================================================I
// I                            mp_dr2_orangesky                            I
// I========================================================================I
// I                      mapped by:  Col!ar                                I
// I                    scripted by:  PetX                                  I
// I                        website:  4GF.CZ                                I
// +========================================================================+

#include scripts_4gf\mp_dr2_orangesky\traps\_utility;

Main()
{
	thread Prepare();

	TrapActivator(12);
	
	thread Activate();
}

Prepare()
{
	eTriggers = GetEntArray("trap12_1", "targetname");
	for (i = 0; i < eTriggers.size; i++)
		eTriggers[i].origin += (0, 0, -10000);
	
	eBrush = GetEnt("trap12_2", "targetname");
	eBrush NotSolid();
	eBrush Hide();
}

Activate()
{
	eTriggers = GetEntArray("trap12_1", "targetname");
	eTriggers[RandomInt(eTriggers.size)].origin += (0, 0, 10000);
	
	eBrush = GetEnt("trap12_2", "targetname");
	eBrush Solid();
	eBrush Show();
}

