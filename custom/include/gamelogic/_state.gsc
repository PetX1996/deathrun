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

public sealed iPRE_Waitting = 0;
public sealed iPRE_Starting = 1;
public sealed iIN_Started = 2;
public sealed iIN_Released = 3;
public sealed iPOST_Deciding = 4;
public sealed iPOST_Ending = 5;
public sealed iSIZE = 6;

public Set(iState, [sTeam])
{
	if (!IsDefined(sTeam))
	{
		Set(iState, "allies");
		Set(iState, "axis");
	}
	else
	{
		level._GL_iGS[sTeam] = iState;
		level._GL_iGSTimes[sTeam][iState] = GetTime();
	}
}

private Is(iState, [sTeam])
{
	if (!IsDefined(sTeam))
		return (level._GL_iGS["allies"] == iState
			|| level._GL_iGS["axis"] == iState);
	else
		return level._GL_iGS[sTeam] == iState;
}

public IsPRE([sTeam])
{
	return Is(iPRE_Waitting, sTeam)
		|| Is(iPRE_Starting, sTeam);
}

public IsPREWaitting([sTeam])
{
	return Is(iPRE_Waitting, sTeam);
}

public IsPREStarting([sTeam])
{
	return Is(iPRE_Starting, sTeam);
}

public IsIN([sTeam])
{
	return Is(iIN_Started, sTeam)
		|| Is(iIN_Released, sTeam);
}

public IsINStarted([sTeam])
{
	return Is(iIN_Started, sTeam);
}

public IsINReleased([sTeam])
{
	return Is(iIN_Released, sTeam);
}

public IsPOST([sTeam])
{
	return Is(iPOST_Deciding, sTeam)
		|| Is(iPOST_Ending, sTeam);
}

public IsPOSTDeciding([sTeam])
{
	return Is(iPOST_Deciding, sTeam);
}

public IsPOSTEnding([sTeam])
{
	return Is(iPOST_Ending, sTeam);
}

private GetBeginTime(iState, [sTeam])
{
	if (!IsDefined(sTeam))
	{
		iTime = level._GL_iGSTimes["allies"][iState];
		if (IsDefined(iTime))
			return iTime;
		
		return level._GL_iGSTimes["axis"][iState];
	}
	
	return level._GL_iGSTimes[sTeam][iState];
}

public GetPREWaittingTime([sTeam])
{
	return GetBeginTime(iPRE_Waitting, sTeam);
}

public GetPREStartingTime([sTeam])
{
	return GetBeginTime(iPRE_Starting, sTeam);
}

public GetINStartedTime([sTeam])
{
	return GetBeginTime(iIN_Started, sTeam);
}

public GetInReleasedTime([sTeam])
{
	return GetBeginTime(iIN_Released, sTeam);
}

public GetPOSTDecidingTime([sTeam])
{
	return GetBeginTime(iPOST_Deciding, sTeam);
}

public GetPOSTEndingTime([sTeam])
{
	return GetBeginTime(iPOST_Ending, sTeam);
}