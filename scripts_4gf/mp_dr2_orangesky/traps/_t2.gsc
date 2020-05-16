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
	TrapActivator(3);
	
	thread MoveEnt(100, // fDist
	1, // fTime
	5); // fDelay
}

MoveEnt(fDist, fTime, fDelay)
{
	eBrush = GetEnt("trap3", "targetname");
	eBrush MoveZ(fDist * -1, fTime);
	eBrush waittill("movedone");
	
	wait fDelay;
	
	eBrush MoveZ(fDist, fTime);
}