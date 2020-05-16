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
	TrapActivator(1);
	
	fDist = 112;
	fTime = 1;
	thread Slider("1a", "1at", fDist, fTime);
	thread Slider("1c", "1ct", fDist, fTime);
	
	wait fTime;
	
	thread Slider("1b", "1bt", fDist * -1, fTime);
}

Slider(sBrush, sTrigger, fZ, fTime)
{
	eBrush = GetEnt(sBrush, "targetname");
	
	eTrigger = GetEnt(sTrigger, "targetname");
	eTrigger EnableLinkTo();
	eTrigger LinkTo(eBrush);
	
	vStart = eBrush.origin;
	vMiddle = eBrush.origin + (0, 0, fZ / 2);
	vEnd = eBrush.origin + (0, 0, fZ);
	
	while (true)
	{
		vTarget = vMiddle;
		if (eBrush.origin == vStart)
		{
			vTarget = vMiddle;
			if (RandomInt(2))
				vTarget = vEnd;
		}
		else if (eBrush.origin == vEnd)
		{
			vTarget = vMiddle;
			if (RandomInt(2))
				vTarget = vStart;			
		}
		else if (eBrush.origin == vMiddle)
		{
			vTarget = vStart;
			if (RandomInt(2))
				vTarget = vEnd;
		}
		
		eBrush MoveTo(vTarget, fTime);
		eBrush waittill("movedone");
	}
}