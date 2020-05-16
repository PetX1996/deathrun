//I========================================================================I
//I                    ___  _____  _____                                   I
//I                   /   !!  __ \!  ___!                                  I
//I                  / /! !! !  \/! !_          ___  ____                  I
//I                 / /_! !! ! __ !  _!        / __!!_  /                  I
//I                 \___  !! !_\ \! !      _  ! (__  / /                   I
//I                     !_/ \____/\_!     (_)  \___!/___!                  I
//I                                                                        I
//I========================================================================I
// Call of Duty 4: Modern Warfare
//I========================================================================I
// Mod      : Deathrun
// Website  : http://www.4gf.cz/
//I========================================================================I
// Script by: PetX
//I========================================================================I

#include core\include\_usings;
#include custom\include\_usings;

MENU_OnCResponded(args)
{
	if (args.sMenuName != C_ICMENU::GetMenu("votemap"))
		return;
		
	if (args.sResponse == "vmVote")
		self C_IVOTEMAP::CRegisterVote(Int(args.ResponseArgs[1]));
	else if (args.sResponse != "vmRate")
		IEXCEPTION::InvalidOperationMsg("Unknown votemap menuresponse " + args.sResponse);
}