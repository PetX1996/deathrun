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
	TrapActivator(9);
	
	thread MoveEnt("trap9a", 
	140, // fDist
	1); // fTime
	thread MoveEnt("trap9b", 
	160, // fDist
	1); // fTime
}

MoveEnt(sName, fDist, fTime)
{
	eBrush = GetEnt(sName, "targetname");
	
	eBrush MoveY(fDist * 0.5, fTime * 0.5);
	eBrush waittill("movedone");
	
	fDir = -1;
	while (true)
	{
		eBrush MoveY(fDist * fDir, fTime);
		eBrush waittill("movedone");
		fDir *= -1;
	}
}

