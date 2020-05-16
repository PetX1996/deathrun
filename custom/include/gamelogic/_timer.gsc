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

public Disable()
{
	Set(0);
}

public Set(iSeconds)
{
	level._iGameTimerStart = GetTime();
	level._iGameTimerLimit = iSeconds;
	level._iGameTimerEnd = Int(GetTime() + (iSeconds * 1000));
	
	if (iSeconds == 0)
		SetGameEndTime(0);
	else
		SetGameEndTime(level._iGameTimerEnd);
}

public Increase(iSeconds)
{
	level._iGameTimerLimit += iSeconds;
	level._iGameTimerEnd += iSeconds * 1000;
	
	SetGameEndTime(level._iGameTimerEnd);
}

public Decrease(iSeconds)
{
	level._iGameTimerLimit -= iSeconds;
	level._iGameTimerEnd -= iSeconds * 1000;
	
	if (level._iGameTimerLimit < 0)
		level._iGameTimerLimit = 0;
		
	if (level._iGameTimerEnd < level._iGameTimerStart)
		level._iGameTimerEnd = level._iGameTimerStart;
		
	SetGameEndTime(level._iGameTimerEnd);
}

public GetStart()
{
	return level._iGameTimerStart;
}

public GetRemaining()
{
	iRemain = level._iGameTimerEnd - GetTime();
	if (iRemain <= 0)
		return 0;
		
	return Int(iRemain / 1000);
}

public GetLimit()
{
	return level._iGameTimerLimit;
}