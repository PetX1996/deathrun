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
	TrapActivator(2);

	thread MoveEnt("t2a", // sDown
				   "t2b", // sUp
				   "t2t", // sTrig
				   48, // fDistDown
				   -48, // fDistUp
				   0.5, // fCloseTime
				   2, // fClosedDelay
				   2, // fOpenTime
				   2); // fOpenedDelay
}

MoveEnt(sDown, sUp, sTrig, fDistDown, fDistUp, fCloseTime, fClosedDelay, fOpenTime, fOpenedDelay)
{
	eDown = GetEnt(sDown, "targetname");
	eUp = GetEnt(sUp, "targetname");
	eTrig = GetEnt(sTrig, "targetname");
	
	while (true)
	{
		eDown MoveZ(fDistDown, fCloseTime);
		eUp NotSolid();
		eUp MoveZ(fDistUp, fCloseTime);
		
		eUp waittill("movedone");
		eUp Solid();
		eTrig scripts_4gf\mp_dr2_view\traps\_utility::EKillPlayersInside();
		wait fClosedDelay;
		
		eDown MoveZ(fDistDown * (-1), fOpenTime);
		eUp MoveZ(fDistUp * (-1), fOpenTime);	

		eUp waittill("movedone");
		wait fOpenedDelay;
	}
}