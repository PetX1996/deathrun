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

#region AFK

/// <summary>
/// Enables afk (checking player keyboard and mouse)
/// </summary>
/// <returns></returns>
/// <param name="sTeam"></param>
/// <param name="bAllow"></param>
RegAFK(sTeam, bAllow)
{
	C_ISVAR::Set(C_ISVAR::GetCTeamPrefix(sTeam) + "AFKEnabled", bAllow);
}

/// <summary>
/// Enables afk (checking player keyboard and mouse)
/// </summary>
/// <returns></returns>
/// <param name="sTeam"></param>
IsAFKEnabled(sTeam)
{
	return C_ISVAR::GetAsBool(C_ISVAR::GetCTeamPrefix(sTeam) + "AFKEnabled");
}

/// <summary>
/// Time until player got warn message (seconds)
/// </summary>
/// <returns></returns>
/// <param name="sTeam"></param>
/// <param name="iSeconds"></param>
RegAFKWarnTime(sTeam, iSeconds)
{
	C_ISVAR::Set(C_ISVAR::GetCTeamPrefix(sTeam) + "AFKWarnTime", iSeconds);
}

/// <summary>
/// Time until player got warn message (seconds)
/// </summary>
/// <returns>Int - seconds</returns>
/// <param name="sTeam"></param>
GetAFKWarnTime(sTeam)
{
	return C_ISVAR::GetAsInt(C_ISVAR::GetCTeamPrefix(sTeam) + "AFKWarnTime");
}

/// <summary>
/// Time until it kills/move to spect (seconds)
/// </summary>
/// <returns></returns>
/// <param name="sTeam"></param>
/// <param name="iSeconds"></param>
RegAFKFinishTime(sTeam, iSeconds)
{
	C_ISVAR::Set(C_ISVAR::GetCTeamPrefix(sTeam) + "AFKFinishTime", iSeconds);
}

/// <summary>
/// Time until it kills/move to spect (seconds)
/// </summary>
/// <returns>Int - seconds</returns>
/// <param name="sTeam"></param>
GetAFKFinishTime(sTeam)
{
	return C_ISVAR::GetAsInt(C_ISVAR::GetCTeamPrefix(sTeam) + "AFKFinishTime");
}

/// <summary>
/// Action
/// </summary>
/// <returns></returns>
/// <param name="sTeam"></param>
/// <param name="iAction">0 - kill, 1 - move to spectator, 2 - pick new, 3 - AutoActivateTTs</param>
RegAFKAction(sTeam, iAction)
{
	C_ISVAR::Set(C_ISVAR::GetCTeamPrefix(sTeam) + "AFKAction", iAction);
}

/// <summary>
/// Action
/// </summary>
/// <returns>Int - 0 - kill, 1 - move to spectator, 2 - pick new, 3 - AutoActivateTTs</returns>
/// <param name="sTeam"></param>
GetAFKAction(sTeam)
{
	return C_ISVAR::GetAsInt(C_ISVAR::GetCTeamPrefix(sTeam) + "AFKAction");
}

/// <summary>
/// AutoActivateTTs - min time for activate next trap
/// </summary>
/// <returns></returns>
/// <param name="sTeam"></param>
/// <param name="iSeconds"></param>
RegAFKActivateTTMin(sTeam, iSeconds)
{
	C_ISVAR::Set(C_ISVAR::GetCTeamPrefix(sTeam) + "AFKActivateTTMin", iSeconds);
}

/// <summary>
/// AutoActivateTTs - min time for activate next trap
/// </summary>
/// <returns>Int - seconds</returns>
/// <param name="sTeam"></param>
GetAFKActivateTTMin(sTeam)
{
	return C_ISVAR::GetAsInt(C_ISVAR::GetCTeamPrefix(sTeam) + "AFKActivateTTMin");
}

/// <summary>
/// AutoActivateTTs - max time for activate next trap
/// </summary>
/// <returns></returns>
/// <param name="sTeam"></param>
/// <param name="iSeconds"></param>
RegAFKActivateTTMax(sTeam, iSeconds)
{
	C_ISVAR::Set(C_ISVAR::GetCTeamPrefix(sTeam) + "AFKActivateTTMax", iSeconds);
}

/// <summary>
/// AutoActivateTTs - max time for activate next trap
/// </summary>
/// <returns>Int - seconds</returns>
/// <param name="sTeam"></param>
GetAFKActivateTTMax(sTeam)
{
	return C_ISVAR::GetAsInt(C_ISVAR::GetCTeamPrefix(sTeam) + "AFKActivateTTMax");
}

CIsAFK()
{
	return self C_ICAFK::CIsAFK();
}

CResetAFK()
{
	self C_ICAFK::CResetAFK();
}

CWarnAFK([iSeconds])
{
	self C_ICAFK::CWarnAFK(iSeconds);
}

CFinishAFK([iAction], [iSeconds])
{
	self C_ICAFK::CFinishAFK(iAction, iSeconds);
}

#endregion
// ======================================================================================================== //
#region Stuck

/// <summary>
/// Enables stuck (checking player moving -> player doesn't move -> he is probably stucked)
/// </summary>
/// <returns></returns>
/// <param name="sTeam"></param>
/// <param name="bAllow"></param>
RegStuck(sTeam, bAllow)
{
	C_ISVAR::Set(C_ISVAR::GetCTeamPrefix(sTeam) + "StuckEnabled", bAllow);
}

/// <summary>
/// Enables stuck (checking player moving -> player doesn't move -> he is probably stucked)
/// </summary>
/// <returns></returns>
/// <param name="sTeam"></param>
IsStuckEnabled(sTeam)
{
	return C_ISVAR::GetAsBool(C_ISVAR::GetCTeamPrefix(sTeam) + "StuckEnabled");
}

/// <summary>
/// Time until player got warn message (seconds)
/// </summary>
/// <returns></returns>
/// <param name="sTeam"></param>
/// <param name="iSeconds"></param>
RegStuckWarnTime(sTeam, iSeconds)
{
	C_ISVAR::Set(C_ISVAR::GetCTeamPrefix(sTeam) + "StuckWarnTime", iSeconds);
}

/// <summary>
/// Time until player got warn message (seconds)
/// </summary>
/// <returns>Int - seconds</returns>
/// <param name="sTeam"></param>
GetStuckWarnTime(sTeam)
{
	return C_ISVAR::GetAsInt(C_ISVAR::GetCTeamPrefix(sTeam) + "StuckWarnTime");
}

/// <summary>
/// Time until it kills player (seconds)
/// </summary>
/// <returns></returns>
/// <param name="sTeam"></param>
/// <param name="iSeconds"></param>
RegStuckKillTime(sTeam, iSeconds)
{
	C_ISVAR::Set(C_ISVAR::GetCTeamPrefix(sTeam) + "StuckKillTime", iSeconds);
}

/// <summary>
/// Time until it kills player (seconds)
/// </summary>
/// <returns>Int - seconds</returns>
/// <param name="sTeam"></param>
GetStuckKillTime(sTeam)
{
	return C_ISVAR::GetAsInt(C_ISVAR::GetCTeamPrefix(sTeam) + "StuckKillTime");
}

CIsStuck()
{
	return self C_ICAFK::CIsStuck();
}

CResetStuck()
{
	self C_ICAFK::CResetStuck();
}

CWarnStuck([iSeconds])
{
	self C_ICAFK::CWarnStuck(iSeconds);
}

CFinishStuck([iSeconds])
{
	self C_ICAFK::CFinishStuck(iSeconds);
}

#endregion
// ======================================================================================================== //
#region EVENTS

/// bCancel, [iSeconds]
RegEvent_InCStuckWarning(dFunc)
{
	IECALLBACK::AddMapEvent("AFK_InCStuckWarning", dFunc);
}

/// [iSeconds]
RegEvent_OnCStuckWarned(dFunc)
{
	IECALLBACK::AddMapEvent("AFK_OnCStuckWarned", dFunc);
}

/// bCancel, [iSeconds]
RegEvent_InCStuckFinishing(dFunc)
{
	IECALLBACK::AddMapEvent("AFK_InCStuckFinishing", dFunc);
}

/// [iSeconds]
RegEvent_OnCStuckFinished(dFunc)
{
	IECALLBACK::AddMapEvent("AFK_OnCStuckFinished", dFunc);
}

/// bCancel, [iSeconds]
RegEvent_InCAFKWarning(dFunc)
{
	IECALLBACK::AddMapEvent("AFK_InCAFKWarning", dFunc);
}

/// [iSeconds]
RegEvent_OnCAFKWarned(dFunc)
{
	IECALLBACK::AddMapEvent("AFK_OnCAFKWarned", dFunc);
}

/// bCancel, iAction, [iSeconds]
RegEvent_InCAFKFinishing(dFunc)
{
	IECALLBACK::AddMapEvent("AFK_InCAFKFinishing", dFunc);
}

/// iAction, [iSeconds]
RegEvent_OnCAFKFinished(dFunc)
{
	IECALLBACK::AddMapEvent("AFK_OnCAFKFinished", dFunc);
}

// ======================================================================================================== //