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
	TrapActivator(8);
	
	if (RandomInt(2))
	{
		thread MoveEnt("trap8a", 
		512, // fDist
		1, // fTime
		1); // fDelay
	}
	else
	{
		thread MoveEnt("trap8b", 
		512, // fDist
		1, // fTime
		1); // fDelay
	}
}

MoveEnt(sName, fDist, fTime, fDelay)
{
	eBrush = GetEnt(sName, "targetname");
	eBrush MoveY(fDist, fTime);
	eBrush waittill("movedone");
	
	wait fDelay;
	
	eBrush MoveY(fDist * -1, fTime);
}

