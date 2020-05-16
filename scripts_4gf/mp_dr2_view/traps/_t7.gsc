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
	TrapActivator(7);
	
	thread MoveEnt("t7a", "t7b");
}

MoveEnt(sA, sB)
{
	eA = GetEnt(sA, "targetname");
	eB = GetEnt(sB, "targetname");
	
	eA MoveY(-32, 1);
	eB MoveY(32, 1);
	
	eA waittill("movedone");
	
	fDir = 1;
	while (true)
	{
		eA MoveY(64 * fDir, 2);
		eA waittill("movedone");
		
		eB MoveY(-64 * fDir, 2);	
		eB waittill("movedone");	

		fDir *= -1;
	}
}



