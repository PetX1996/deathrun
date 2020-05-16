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
	TrapActivator(0);
	
	thread MoveEnt("t0", // sBrushName
				   -40, // fX
				   2, // fTime
				   2); // fDelay
}

MoveEnt(sBrushName, fX, fTime, fDelay)
{
	eBrush = GetEnt(sBrushName, "targetname");
	eTrig = GetEnt(eBrush.target, "targetname");
	
	eTrig EnableLinkTo();
	eTrig LinkTo(eBrush);
	
	fDir = 1;
	while (true)
	{
		eBrush MoveX(fX * fDir, fTime);
		eBrush waittill("movedone");
		
		wait fDelay;
		fDir *= -1;
	}
}