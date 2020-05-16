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
	TrapActivator(4);
	
	thread MoveEnt();
}

MoveEnt()
{
	eA = GetEnt("t4a", "targetname");
	eB = GetEnt("t4b", "targetname");
	eTrig = GetEnt(eA.target, "targetname");
	
	eTrig EnableLinkTo();
	eTrig LinkTo(eA);
	
	// go up
	eA MoveZ(104, 2);
	eA waittill("movedone");
	
	eA MoveZ(104, 2);
	eB MoveZ(104, 2);
	eA waittill("movedone");
	
	eA MoveZ(480, 8, 3);
	eA waittill("movedone");
	
	wait 1; // delay before reset
	
	// go down
	eA MoveZ(-480, 4);
	eA waittill("movedone");
	
	eA MoveZ(-104, 2);
	eB MoveZ(-104, 2);
	eA waittill("movedone");
	
	eA MoveZ(-104, 2);
	eA waittill("movedone");
}
