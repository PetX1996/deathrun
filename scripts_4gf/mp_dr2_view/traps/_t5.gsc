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
	TrapActivator(5);
	
	thread MoveEnt("t5a", // sName
				   32, // fZ
				   1, // fMinTime
				   5, // fMaxTime
				   1, // fMinDelay
				   1); // fMaxDelay
				   
	thread MoveEnt("t5b", // sName
				   32, // fZ
				   1, // fMinTime
				   5, // fMaxTime
				   1, // fMinDelay
				   1); // fMaxDelay
				   
	thread MoveEnt("t5c", // sName
				   32, // fZ
				   1, // fMinTime
				   5, // fMaxTime
				   1, // fMinDelay
				   1); // fMaxDelay
}

MoveEnt(sName, fZ, fMinTime, fMaxTime, fMinDelay, fMaxDelay)
{
	eBrush = GetEnt(sName, "targetname");
	
	fDir = 1;
	while (true)
	{
		fTime = fMinTime;
		if (fMinTime != fMaxTime)
			fTime = RandomFloatRange(fMinTime, fMaxTime);
			
		fDelay = fMinDelay;
		if (fMinDelay != fMaxDelay)
			fDelay = RandomFloatRange(fMinDelay, fMaxDelay);		
	
		eBrush MoveZ(fZ * fDir, fTime);
		eBrush waittill("movedone");
		
		wait fDelay;
		
		fDir *= -1;
	}
}