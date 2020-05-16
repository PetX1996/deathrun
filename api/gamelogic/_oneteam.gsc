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
/// Enable/Disable OneTeam(game without any activator)
/// </summary>
/// <returns></returns>
/// <param name="bAllow"></param>
RegOneTeam(bAllow)
{
	C_ISVAR::Set("GLOneTeamEnabled", bAllow);
}

/// <summary>
/// OneTeam(game without any activator)
/// </summary>
/// <returns></returns>
IsOneTeamEnabled()
{
	return C_ISVAR::GetAsBool("GLOneTeamEnabled");
}

/// <summary>
/// Minimum players for start round without activator
/// </summary>
/// <returns></returns>
/// <param name="iCount"></param>
RegMinPlayers(iCount)
{
	C_ISVAR::Set("GLOneTeamMinPlayers", iCount);
}

/// <summary>
/// Minimum players for start round without activator
/// </summary>
/// <returns>Int - count</returns>
GetMinPlayers()
{
	return C_ISVAR::GetAsInt("GLOneTeamMinPlayers");
}

/// <summary>
/// Free walking while waitting for more players
/// Maps can also rotate without players
/// </summary>
/// <returns></returns>
/// <param name="bAllow"></param>
RegSinglePlayer(bAllow)
{
	C_ISVAR::Set("GLOneTeamSinglePlayerEnabled", bAllow);
}

/// <summary>
/// Free walking while waitting for more players
/// Maps can also rotate without players
/// </summary>
/// <returns></returns>
IsSinglePlayerEnabled()
{
	return C_ISVAR::GetAsInt("GLOneTeamSinglePlayerEnabled");
}

/// <summary>
/// Time until singleplayer starts (seconds)
/// </summary>
/// <returns></returns>
/// <param name="iSeconds"></param>
RegSinglePlayerTime(iSeconds)
{
	C_ISVAR::Set("GLOneTeamSinglePlayerTime", iSeconds);
}

/// <summary>
/// Time until singleplayer starts (seconds)
/// </summary>
/// <returns>Int - seconds</returns>
GetSinglePlayerTime()
{
	return C_ISVAR::GetAsInt("GLOneTeamSinglePlayerTime");
}

/// <summary>
/// Time until rounds begin (seconds)
/// </summary>
/// <returns></returns>
/// <param name="iSeconds"></param>
RegTimePreMatch(iSeconds)
{
	C_ISVAR::Set("GLOneTeamTimePreMatch", iSeconds);
}

/// <summary>
/// Time until rounds begin (seconds)
/// </summary>
/// <returns>Int - seconds</returns>
GetTimePreMatch()
{
	return C_ISVAR::GetAsInt("GLOneTeamTimePreMatch");
}

/// <summary>
/// Duration of the round (minutes)
/// </summary>
/// <returns></returns>
/// <param name="fMinutes"></param>
RegTimeLimit(fMinutes)
{
	C_ISVAR::Set("GLOneTeamTimeLimit", fMinutes);
}

/// <summary>
/// Duration of the round (minutes)
/// </summary>
/// <returns>Float - minutes</returns>
GetTimeLimit()
{
	return C_ISVAR::GetAsFloat("GLOneTeamTimeLimit");
}

/// <summary>
/// Enables/Disables respawning after start
/// </summary>
/// <returns></returns>
/// <param name="bAllow"></param>
RegPostRespawn(bAllow)
{
	C_ISVAR::Set("GLOneTeamPostRespawnEnabled", bAllow);
}

/// <summary>
/// Respawning after start
/// </summary>
/// <returns></returns>
IsPostRespawnEnabled()
{
	return C_ISVAR::GetAsBool("GLOneTeamPostRespawnEnabled");
}

/// <summary>
/// Time until jumpers will be respawning after start (seconds)
/// </summary>
/// <returns></returns>
/// <param name="iSeconds"></param>
RegPostRespawnTime(iSeconds)
{
	C_ISVAR::Set("GLOneTeamPostRespawnTime", iSeconds);
}

/// <summary>
/// Time until jumpers will be respawning after start (seconds)
/// </summary>
/// <returns>Int - seconds</returns>
GetPostRespawnTime()
{
	return C_ISVAR::GetAsInt("GLOneTeamPostRespawnTime");
}

/// <summary>
/// Enables/Disables permanentlly respawning after start
/// </summary>
/// <returns></returns>
/// <param name="bAllow"></param>
AllowPostRespawnPermanentlly(bAllow)
{
	C_ISVAR::Set("GLOneTeamPostRespawnPermEnabled", bAllow);
}

/// <summary>
/// Permanentlly respawning after start
/// </summary>
/// <returns></returns>
IsPostRespawnPermanentllyEnabled()
{
	return C_ISVAR::GetAsBool("GLOneTeamPostRespawnPermEnabled");
}

/// <summary>
/// Is current round a OneTeam round?
/// </summary>
/// <returns></returns>
IsOneTeam()
{
	return C_IGLTYPE::IsOneTeam();
}