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
	TrapActivator(3);

	thread MoveEnt("t3a", // sA
				   "t3b", // sB
				   "t3t1", // sAB
				   "t3c", // sC
				   "t3d", // sD
				   "t3t2",	// sCD			   
				   -16, // fDistDown
				   16, // fDistUp
				   0.3, // fCloseTime
				   2, // fClosedDelay
				   2, // fOpenTime
				   2); // fOpenedDelay
}

MoveEnt(sA, sB, sAB, sC, sD, sCD, fDistDown, fDistUp, fCloseTime, fClosedDelay, fOpenTime, fOpenedDelay)
{
	eA = GetEnt(sA, "targetname");
	eB = GetEnt(sB, "targetname");
	eAB = GetEnt(sAB, "targetname");
	eC = GetEnt(sC, "targetname");
	eD = GetEnt(sD, "targetname");
	eCD = GetEnt(sCD, "targetname");
	
	while (true)
	{
		MovePart(eA, eB, eAB, fDistDown, fDistUp, fCloseTime, fClosedDelay, fOpenTime, fOpenedDelay);
		MovePart(eC, eD, eCD, fDistDown, fDistUp, fCloseTime, fClosedDelay, fOpenTime, fOpenedDelay);
	}
}

MovePart(eA, eB, eAB, fDistDown, fDistUp, fCloseTime, fClosedDelay, fOpenTime, fOpenedDelay)
{
	eA MoveY(fDistDown, fCloseTime);
	eB NotSolid();
	eB MoveY(fDistUp, fCloseTime);
	
	eB waittill("movedone");
	eB Solid();
	eAB scripts_4gf\mp_dr2_view\traps\_utility::EKillPlayersInside();
	wait fClosedDelay;
	
	eA MoveY(fDistDown * (-1), fOpenTime);
	eB MoveY(fDistUp * (-1), fOpenTime);	

	eB waittill("movedone");
	wait fOpenedDelay;
}
