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
// Mod      : Core
// Website  : http://www.4gf.cz/
//I========================================================================I
// Script by: PetX
//I========================================================================I

#include core\include\_usings;

public AddModEvent(sName, dFunc)
{
	if (!IsDefined(level._ModEvents))
		level._ModEvents = [];
		
	if (!IsDefined(level._ModEvents[sName]))
		level._ModEvents[sName] = ILIST::Create();

	level._ModEvents[sName] ILIST::Add(dFunc);
}

public AddMapEvent(sName, dFunc)
{
	if (!IsDefined(level._MapEvents))
		level._MapEvents = [];
		
	if (!IsDefined(level._MapEvents[sName]))
		level._MapEvents[sName] = ILIST::Create();

	level._MapEvents[sName] ILIST::Add(dFunc);
}

public DeleteModEvent([sName], [dFunc])
{
	if (IsDefined(sName) && IsDefined(dFunc))
	{
		if (!IsDefined(level._ModEvents) || !IsDefined(level._ModEvents[sName]))
			return;
		
		level._ModEvents[sName] ILIST::Remove(dFunc);
	}
	else if (IsDefined(sName))
	{
		if (!IsDefined(level._ModEvents))
			return;		
			
		level._ModEvents[sName] = undefined;
	}
	else
		level._ModEvents = undefined;
}

public DeleteMapEvent([sName], [dFunc])
{
	if (IsDefined(sName) && IsDefined(dFunc))
	{
		if (!IsDefined(level._MapEvents) || !IsDefined(level._MapEvents[sName]))
			return;
		
		level._MapEvents[sName] ILIST::Remove(dFunc);
	}
	else if (IsDefined(sName))
	{
		if (!IsDefined(level._MapEvents))
			return;		
			
		level._MapEvents[sName] = undefined;
	}
	else
		level._MapEvents = undefined;
}

public Args_Create()
{
	args = SpawnStruct();
	args Args_Reset();
	return args;
}

public Args_Reset()
{
	//args.Cancel = false;
}

public RunEvent(sName, bIsThreaded, [args])
{
	if (self == level)
		sEnt = "S";
	else if (IsPlayer(self))
		sEnt = self.name;
	else
		sEnt = "";
		
	text = "Event;" + sEnt + ";" + sName;
	
	if (!IsDefined(args))
		args = Args_Create();
	
	if (IsDefined(level._ModEvents) && IsDefined(level._ModEvents[sName]))
	{
		for (i = 0; i < level._ModEvents[sName].iCount; i++)
		{
			dFunc = level._ModEvents[sName] ILIST::Get(i);
			if (bIsThreaded)
				self thread [[dFunc]](args);			
			else
				self [[dFunc]](args);
		}
	}
	
	if (IsDefined(level._MapEvents) && IsDefined(level._MapEvents[sName]))
	{
		for (i = 0; i < level._MapEvents[sName].iCount; i++)
		{
			dFunc = level._MapEvents[sName] ILIST::Get(i);
			if (bIsThreaded)
				self thread [[dFunc]](args);			
			else
				self [[dFunc]](args);
		}
	}
	
	//self C_IDEBUG::Debug(text);
}