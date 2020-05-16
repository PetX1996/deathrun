// +========================================================================+
// I                    ___  _____  _____                                   I
// I                   /   !!  __ \!  ___!                                  I
// I                  / /! !! !  \/! !_          ___  ____                  I
// I                 / /_! !! ! __ !  _!        / __!!_  /                  I
// I                 \___  !! !_\ \! !      _  ! (__  / /                   I
// I                     !_/ \____/\_!     (_)  \___!/___!                  I
// I                                                                        I
// I========================================================================I
// I                             mp_dr2_view                                I
// I========================================================================I
// I                      mapped by:  Col!ar                                I
// I                    scripted by:  PetX                                  I
// I                        website:  4GF.CZ                                I
// +========================================================================+

#include scripts_4gf\mp_dr2_view\traps\_utility;

Main()
{
	TrapActivator(8);
	
	thread MoveEnt("t8a", "t8b");
}

MoveEnt(sA, sB)
{
	sA = GetEnt(sA, "targetname");
	sB = GetEnt(sB, "targetname");
	
	fDir = 1;
	while (true)
	{
		sA MoveZ(32 * fDir, 1);
		sA waittill("movedone");
		
		sB MoveZ(32 * fDir, 1);
		sB waittill("movedone");
		
		fDir *= -1;
	}
}

