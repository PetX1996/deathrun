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
	TrapActivator(5);
	
	fDir = 1;
	for (i = 0; i < 5; i++)
	{
		// sName, fDist, fMinTime, fMaxTime, fMinDelay, fMaxDelay
		thread MoveEnt("trap5_" + i, 
		(80 * fDir), // fDist
		0.2, // fMinTime
		1, // fMaxTime
		0, // fMinDelay
		0.7); // fMaxDelay
		fDir *= -1;
	}
}

MoveEnt(sName, fDist, fMinTime, fMaxTime, fMinDelay, fMaxDelay)
{
	eBrush = GetEnt(sName, "targetname");
	
	fDir = 1;
	while (true)
	{
		fTime = fMinTime;
		if (fMinTime != fMaxTime)
			fTime = RandomFloatRange(fMinTime, fMaxTime);
			
		eBrush MoveY(fDist * fDir, RandomFloatRange(fMinTime, fMaxTime));
		eBrush waittill("movedone");
		
		fDelay = fMinDelay;
		if (fMinDelay != fMaxDelay)
			fDelay = RandomFloatRange(fMinDelay, fMaxDelay);
			
		wait fDelay;
		
		fDir *= -1;
	}
}
