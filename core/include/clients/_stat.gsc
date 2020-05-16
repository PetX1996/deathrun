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

public GetById(id)
{
	return self GetStat(id);
}

public GetByName(name)
{
	return self GetStat(GetIdByName(name));
}

public SetById(id, value)
{
	self SetStat(id, value);
}

public SetByName(name, value)
{
	self SetById(GetIdByName(name), value);
}

public AddById(id, inc)
{
	self SetStat(id, self GetStat(id) + inc);
}

public AddByName(name, inc)
{
	self AddById(GetIdByName(name), inc);	
}

private GetIdByName(name)
{
	sStatId = TableLookup("mp/playerStatsTable.csv", 1, name, 0);
	IEXCEPTION::EmptyString(sStatId.size, "Could not find '" + name + "' in playerStatsTable.csv");
	return Int(sStatId);
}