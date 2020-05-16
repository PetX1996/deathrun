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
/// Is gamelogic disabled?
/// </summary>
/// <returns></returns>
IsDisabled()
{
	return C_IGLTYPE::IsDisabled();
}

EndGame(sMsg, [sWinningTeam], [pWinner])
{
	C_IGLLOGIC::EndGame(C_IGLLOGIC::iEG_Map, sWinningTeam, pWinner, sMsg);
}

// ================================================================================================================= //
#region EVENTS

/// 
RegEvent_OnCConnected(dFunc)
{
	IECALLBACK::AddMapEvent("GL_OnCConnected", dFunc);
}

/// 
RegEvent_OnCJoinedTeam(dFunc)
{
	IECALLBACK::AddMapEvent("GL_OnCJoinedTeam", dFunc);
}

/// 
RegEvent_OnCJoinedSpectators(dFunc)
{
	IECALLBACK::AddMapEvent("GL_OnCJoinedSpectators", dFunc);
}

/// 
RegEvent_OnSStartedSinglePlayer(dFunc)
{
	IECALLBACK::AddMapEvent("GL_OnSStartedSinglePlayer", dFunc);
}

/// 
RegEvent_OnSStartedGame(dFunc)
{
	IECALLBACK::AddMapEvent("GL_OnSStartedGame", dFunc);
}

/// 
RegEvent_OnSReleasedJumpers(dFunc)
{
	IECALLBACK::AddMapEvent("GL_OnSReleasedJumpers", dFunc);
}

/// 
RegEvent_OnSReleasedActivators(dFunc)
{
	IECALLBACK::AddMapEvent("GL_OnSReleasedActivators", dFunc);
}

/// 
RegEvent_OnSElapsedTime(dFunc)
{
	IECALLBACK::AddMapEvent("GL_OnSElapsedTime", dFunc);
}

/// iType, [sWinningTeam], [pWinner]
RegEvent_OnSEndedGame(dFunc)
{
	IECALLBACK::AddMapEvent("GL_OnSEndedGame", dFunc);
}

/// 
RegEvent_InSTerminatingRound(dFunc)
{
	IECALLBACK::AddMapEvent("GL_InSTerminatingRound", dFunc);
}

/// 
RegEvent_InSTerminatingMap(dFunc)
{
	IECALLBACK::AddMapEvent("GL_InSTerminatingMap", dFunc);
}

#endregion
// ================================================================================================================= //