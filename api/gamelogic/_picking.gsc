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

/// <summary>
/// Enables picking more activators
/// </summary>
/// <returns></returns>
/// <param name="bAllow"></param>
RegPickMore(bAllow)
{
	C_ISVAR::Set("GLPickMoreEnabled", bAllow);
}

/// <summary>
/// Picking more activators
/// </summary>
/// <returns></returns>
IsPickMoreEnabled()
{
	return C_ISVAR::GetAsBool("GLPickMoreEnabled");
}

/// <summary>
/// How many players will be picked
/// </summary>
/// <returns></returns>
/// <param name="fFraction"></param>
RegPickFraction(fFraction)
{
	C_ISVAR::Set("GLPickFraction", fFraction);
}

/// <summary>
/// How many players will be picked
/// </summary>
/// <returns>Float</returns>
GetPickFraction()
{
	return C_ISVAR::GetAsFloat("GLPickFraction");
}

/// <summary>
/// How many players will be LITERALY picked?
/// </summary>
/// <returns></returns>
/// <param name="iCount"></param>
RegPickStaticCount(iCount)
{
	C_ISVAR::Set("GLPickStaticCount", iCount);
}

/// <summary>
/// How many players will be LITERALY picked?
/// </summary>
/// <returns>Int - count</returns>
GetPickStaticCount()
{
	return C_ISVAR::GetAsInt("GLPickStaticCount");
}

/// <summary>
/// Picks activators
/// </summary>
/// <returns>List of picked activators</returns>
/// <param name="iCount"></param>
PickActivators([iCount])
{
	C_IGLPICKING::PickActivators(iCount);
}

/// <summary>
/// Pick player as Activator
/// </summary>
/// <returns></returns>
CPick()
{
	self C_IGLPICKING::CPick();
}

/// <summary>
/// Returns how many times was player picked as Activator
/// </summary>
/// <returns></returns>
CGetPickedTimes()
{
	return self C_IGLPICKING::CGetPickedTimes();
}


/// iCount
RegEvent_InSPickingActivators(dFunc)
{
	IECALLBACK::AddMapEvent("GL_InSPickingActivators", dFunc);
}

/// pickedList
RegEvent_OnSPickedActivators(dFunc)
{
	IECALLBACK::AddMapEvent("GL_OnSPickedActivators", dFunc);
}

/// bCancel
RegEvent_InCSelectingForPick(dFunc)
{
	IECALLBACK::AddMapEvent("GL_InCSelectingForPick", dFunc);
}

/// bCancel
RegEvent_InCPickingAsActivator(dFunc)
{
	IECALLBACK::AddMapEvent("GL_InCPickingAsActivator", dFunc);
}

/// 
RegEvent_OnCPickedAsActivator(dFunc)
{
	IECALLBACK::AddMapEvent("GL_OnCPickedAsActivator", dFunc);
}