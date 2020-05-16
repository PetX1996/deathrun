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
/// Minimum players for start round classic round
/// </summary>
/// <returns></returns>
/// <param name="iCount"></param>
RegMinPlayers(iCount)
{
	C_ISVAR::Set("GLClassicMinPlayers", iCount);
}

/// <summary>
/// Minimum players for start round classic round
/// </summary>
/// <returns>Int - count</returns>
GetMinPlayers()
{
	return C_ISVAR::GetAsInt("GLClassicMinPlayers");
}

/// <summary>
/// Free walking while waitting for more players
/// Maps can also rotate without players
/// </summary>
/// <returns></returns>
/// <param name="bAllow"></param>
RegSinglePlayer(bAllow)
{
	C_ISVAR::Set("GLClassicSinglePlayerEnabled", bAllow);
}

/// <summary>
/// Free walking while waitting for more players
/// Maps can also rotate without players
/// </summary>
/// <returns></returns>
IsSinglePlayerEnabled()
{
	return C_ISVAR::GetAsInt("GLClassicSinglePlayerEnabled");
}

/// <summary>
/// Time until singleplayer starts (seconds)
/// </summary>
/// <returns></returns>
/// <param name="iSeconds"></param>
RegSinglePlayerTime(iSeconds)
{
	C_ISVAR::Set("GLClassicSinglePlayerTime", iSeconds);
}

/// <summary>
/// Time until singleplayer starts (seconds)
/// </summary>
/// <returns>Int - seconds</returns>
GetSinglePlayerTime()
{
	return C_ISVAR::GetAsInt("GLClassicSinglePlayerTime");
}

/// <summary>
/// Time until rounds begin (seconds)
/// </summary>
/// <returns></returns>
/// <param name="iSeconds"></param>
RegTimePreMatch(iSeconds)
{
	C_ISVAR::Set("GLClassicTimePreMatch", iSeconds);
}

/// <summary>
/// Time until rounds begin (seconds)
/// </summary>
/// <returns>Int - seconds</returns>
GetTimePreMatch()
{
	return C_ISVAR::GetAsInt("GLClassicTimePreMatch");
}

/// <summary>
/// Time until jumpers will be released (seconds)
/// </summary>
/// <returns></returns>
/// <param name="iSeconds"></param>
RegTimeJumpers(iSeconds)
{
	C_ISVAR::Set("GLClassicTimeJumpers", iSeconds);
}

/// <summary>
/// Time until jumpers will be released (seconds)
/// </summary>
/// <returns>Int - seconds</returns>
GetTimeJumpers()
{
	return C_ISVAR::GetAsInt("GLClassicTimeJumpers");
}

/// <summary>
/// Time until activators will be released (seconds)
/// </summary>
/// <returns></returns>
/// <param name="iSeconds"></param>
RegTimeActivators(iSeconds)
{
	C_ISVAR::Set("GLClassicTimeActivators", iSeconds);
}

/// <summary>
/// Time until activators will be released (seconds)
/// </summary>
/// <returns>Int - seconds</returns>
GetTimeActivators()
{
	return C_ISVAR::GetAsInt("GLClassicTimeActivators");
}

/// <summary>
/// Duration of the round (minutes)
/// </summary>
/// <returns></returns>
/// <param name="fMinutes"></param>
RegTimeLimit(fMinutes)
{
	C_ISVAR::Set("GLClassicTimeLimit", fMinutes);
}

/// <summary>
/// Duration of the round (minutes)
/// </summary>
/// <returns>Flaot - minutes</returns>
GetTimeLimit()
{
	return C_ISVAR::GetAsFloat("GLClassicTimeLimit");
}

/// <summary>
/// Enables/Disables respawning after start
/// </summary>
/// <returns></returns>
/// <param name="bAllow"></param>
RegPostRespawn(bAllow)
{
	C_ISVAR::Set("GLClassicPostRespawnEnabled", bAllow);
}

/// <summary>
/// Respawning after start
/// </summary>
/// <returns></returns>
IsPostRespawnEnabled()
{
	return C_ISVAR::GetAsBool("GLClassicPostRespawnEnabled");
}

/// <summary>
/// Time until jumpers will be respawning after start (seconds)
/// </summary>
/// <returns></returns>
/// <param name="iSeconds"></param>
RegPostRespawnTime(iSeconds)
{
	C_ISVAR::Set("GLClassicPostRespawnTime", iSeconds);
}

/// <summary>
/// Time until jumpers will be respawning after start (seconds)
/// </summary>
/// <returns>Int - seconds</returns>
GetPostRespawnTime()
{
	return C_ISVAR::GetAsInt("GLClassicPostRespawnTime");
}

/// <summary>
/// Enables/Disables permanentlly respawning after start
/// </summary>
/// <returns></returns>
/// <param name="bAllow"></param>
AllowPostRespawnPermanentlly(bAllow)
{
	C_ISVAR::Set("GLClassicPostRespawnPermEnabled", bAllow);
}

/// <summary>
/// Permanentlly respawning after start
/// </summary>
/// <returns></returns>
IsPostRespawnPermanentllyEnabled()
{
	return C_ISVAR::GetAsBool("GLClassicPostRespawnPermEnabled");
}

/// <summary>
/// Is current round a Classic round?
/// </summary>
/// <returns></returns>
IsClassic()
{
	return C_IGLTYPE::IsClassic();
}