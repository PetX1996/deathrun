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
	TrapActivator(11);

	RotateEnt("trap11", 
	360, // fAngle
	3.5, // fTime
	0.3); // fAccTime
}

RotateEnt(sName, fAngle, fTime, fAccTime)
{
	eBrush = GetEnt(sName, "targetname");
	
	while (true)
	{
		eBrush RotatePitch(fAngle, fTime, fAccTime, fAccTime);
		wait fTime;
	}
}