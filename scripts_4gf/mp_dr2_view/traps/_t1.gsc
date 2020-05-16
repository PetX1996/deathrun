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
	TrapActivator(1);
	
	thread MoveEnt("t1a", // sA
				   "t1b", // sB
				   -40, // fDist
				   1.5); // fTime
}

MoveEnt(sA, sB, fDist, fTime)
{
	eBrushA = GetEnt(sA, "targetname");
	eBrushB = GetEnt(sB, "targetname");
	
	while (true)
	{
		eBrushA MoveZ(fDist, fTime);
		eBrushA waittill("movedone");
		eBrushA MoveZ(fDist * (-1), fTime);
		eBrushA waittill("movedone");
		
		eBrushB MoveZ(fDist, fTime);
		eBrushB waittill("movedone");
		eBrushB MoveZ(fDist * (-1), fTime);
		eBrushB waittill("movedone");		
	}
}
