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

public ForceNextMap(sMapName, [iMapIndex])
{
	game["nextMap"] = sMapName;
	game["nextMapIndex"] = iMapIndex;
	game["isNextMapForced"] = true;
}

public ForceNextGameType(sMapName)
{
	game["nextGameType"] = sMapName;
	game["isNextGameTypeForced"] = true;
}

public SetNextMap(sMapName, [iMapIndex])
{
	if (!IsDefined(game["isNextMapForced"]))
	{
		game["nextMap"] = sMapName;
		game["nextMapIndex"] = iMapIndex;
	}
}

public SetNextGameType(sMapName)
{
	if (!IsDefined(game["isNextGameTypeForced"]))
		game["nextGameType"] = sMapName;
}

public GetNextMap()
{
	return game["nextMap"];
}

/// <summary>
/// 
/// </summary>
/// <returns>Int - undefined if has not set</returns>
public GetCurMapIndex()
{
	sValue = GetDvar("curMapIndex");
	if (sValue != "")
		return Int(sValue);
		
	return undefined;
}

public GetNextMapIndex()
{
	return game["nextMapIndex"];
}

public GetNextGameType()
{
	return game["nextGameType"];
}

public RunNextMap()
{
	sMapName = GetNextMap();
	IEXCEPTION::Undefined(sMapName, "Next map has not been set!");
	
	RunMap(sMapName, GetNextGameType(), GetNextMapIndex());
}

public RunMap(sMapName, [sGameType], [iMapIndex])
{
	if (!IsDefined(sGameType))
		sGameType = IGAME::GetGameType();

	SetDvar("sv_mapRotationCurrent", "gametype " + sGameType + " map " + sMapName); 
	
	sMapIndex = "";
	if (IsDefined(iMapIndex))
		sMapIndex = iMapIndex;
	
	SetDvar("curMapIndex", sMapIndex);
	
	ExitLevel(false);
}

// =================================================================================== //
#region IgnoredMaps

public IgnoredMaps_Create()
{
	ignoredMaps = SpawnStruct();
	ignoredMaps.Indexes = [];
	
	ignoredMaps IgnoredMaps_LoadFromDvar();
	
	return ignoredMaps;
}

public IgnoredMaps_Add(iMapIndex)
{
	self.Indexes[self.Indexes.size] = iMapIndex;
}

public IgnoredMaps_Ensure(iCapacity)
{
	iRemoveCount = (self.Indexes.size - iCapacity);
	if (iRemoveCount > 0)
		self.Indexes = IARRAY::RemoveRange(self.Indexes, 0, iRemoveCount);
}

public IgnoredMaps_GetIndexes()
{
	return self.Indexes;
}

public IgnoredMaps_Save()
{
	self IgnoredMaps_SaveToDvar();
}

private IgnoredMaps_LoadFromDvar()
{
	dvarValue = GetDvar("ignoredMaps");
	if (dvarValue == "")
		return;
		
	toks = StrTok(dvarValue, ";");
	foreach (tok in toks)
	{
		if (tok == "")
			continue;
	
		self IgnoredMaps_Add(Int(tok));
	}
}

private IgnoredMaps_SaveToDvar()
{
	value = "";
	if (self.Indexes.size > 0)
		value = ISTRING::Join(";", self.Indexes);
		
	SetDvar("ignoredMaps", value);
}

#endregion
// =================================================================================== //

public RotateMap()
{
	
}

public GetIgnoredMapsCount()
{
	fFrac = C_ISVAR::GetAsFloat("RMIgnMapListFraction");
	if (fFrac != 0)
		return Int(C_IMAPLIST::GetItemsCount() * fFrac);
	
	return C_ISVAR::GetAsInt("RMIgnCount");
}

// ============================================================================================== //
#region DEBUG

public DBGRotateAllMapsNow()
{
	iNextIndex = 0;

	iIndex = GetCurMapIndex();
	if (!IsDefined(iIndex))
		iIndex = 0;
	else
		iNextIndex = iIndex + 1;
		
	iMapsCount = C_IMAPLIST::GetItemsCount();
	if (iNextIndex >= iMapsCount)
		return;
		
	sMapName = C_IMAPLIST::GetItemName(iNextIndex);
	if (!IsDefined(sMapName))
		IEXCEPTION::InvalidOperationMsg("Error in maplist, could not find map with index " + iNextIndex);
		
	RunMap(sMapName, "deathrun", iNextIndex);
}

#endregion
// ============================================================================================== //