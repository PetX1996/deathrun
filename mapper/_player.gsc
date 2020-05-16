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

public CSetHealth([iCurHealth], [iMaxHealth])
{
	self C_ICPLAYER::CSetHealth(iCurHealth, iMaxHealth);
}

public CTeleport(vOrigin, vAngles, [bFreeze])
{
	if (!IsDefined(bFreeze)) bFreeze = false;

	self endon("disconnect");
	self endon("death");

	if (bFreeze)
		self FreezeControls(true);
	
	self SetOrigin(vOrigin);
	self SetPlayerAngles(vAngles);
	
	if (bFreeze)
	{
		wait 0.05;
		self FreezeControls(false);
	}
}

public CTeleportRandom(sOriginsNames, [bFreeze])
{
	eOrigins = GetEntArray(sOriginsNames, "targetname");
	IEXCEPTION::Argument(eOrigins.size > 0, "Could not find port origins '" + sOriginsNames + "'");
	
	eOrigin = eOrigins[RandomInt(eOrigins.size)];
	self mapper\_player::CTeleport(eOrigin.origin, eOrigin.angles, bFreeze);
}

public CIsFirstPlayedRound()
{
	return self C_ICPLAYER::CIsFirstPlayedRound();
}

public RegEvent_OnCConnected(dFunc)
{
	IECALLBACK::AddMapEvent("OnCConnected", dFunc);
}