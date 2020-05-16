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

private TYPE_Sequential = 0;
private TYPE_FullRandom = 1;
private TYPE_IgnoreRandom = 2;

InSStarting(args)
{
	if (!IsDefined(C_IROTATEMAP::GetNextMap()) // is this first round?
		&& !C_ISVAR::GetAsBool("VMEnabled")) // is RotateMap enabled?
		PickNextMap();
}

// ============================================================================================== //
#region PickMap

private PickNextMap()
{
	iMapsCount = C_IMAPLIST::GetItemsCount();
	IEXCEPTION::InvalidOperation(iMapsCount > 0, "There must be at least one map in the MapList.");
	
	iType = C_ISVAR::GetAsInt("RMType");
	if (iType == TYPE_Sequential)
		PickMapSequential(iMapsCount);
	else if (iType == TYPE_FullRandom)
		PickMapFullRandom(iMapsCount);
	else if (iType == TYPE_IgnoreRandom)
		PickMapIgnoreRandom(iMapsCount);
	else
		IEXCEPTION::ArgumentMsg("Unknown SVAR value LRMType");
}

private PickMapSequential(iMapsCount)
{
	iCurMapIndex = C_IROTATEMAP::GetCurMapIndex();
	if (!IsDefined(iCurMapIndex))
		iCurMapIndex = 0;
	
	iNextMapIndex = (iCurMapIndex + 1) % iMapsCount;
	sNextMapName = C_IMAPLIST::GetItemName(iNextMapIndex);
	
	C_IROTATEMAP::SetNextMap(sNextMapName, iNextMapIndex);
}

private PickMapFullRandom(iMapsCount)
{
	iNextMapIndex = undefined;
	sNextMapName = undefined;
	
	counter = 0;
	do
	{
		counter++; if (counter > 50) IEXCEPTION::InvalidOperationMsg("Loop detected");
	
		iNextMapIndex = RandomInt(iMapsCount);
		sNextMapName = C_IMAPLIST::GetItemName(iNextMapIndex);
	}
	while (iMapsCount > 1 && sNextMapName == IGAME::GetMap());
	
	C_IROTATEMAP::SetNextMap(sNextMapName, iNextMapIndex);
}

private PickMapIgnoreRandom(iMapsCount)
{
	ignoredMaps = C_IROTATEMAP::IgnoredMaps_Create();
	ignoredMapsIndexes = C_IROTATEMAP::IgnoredMaps_GetIndexes();

	iNextMapIndex = undefined;
	sNextMapName = undefined;
	
	counter = 0;
	do
	{
		counter++; if (counter > 50) IEXCEPTION::InvalidOperationMsg("Loop detected");
		
		iNextMapIndex = RandomInt(iMapsCount);
		
		if (iMapsCount > (ignoredMapsIndexes + 1)
			&& IARRAY::Contains(ignoredMapsIndexes, iNextMapIndex))
			continue;
			
		sNextMapName = C_IMAPLIST::GetItemName(iNextMapIndex);
	}
	while (iMapsCount > 1 && sNextMapName == IGAME::GetMap());

	ignoredMaps C_IROTATEMAP::IgnoredMaps_Add(iNextMapIndex);
	ignoredMaps C_IROTATEMAP::IgnoredMaps_Ensure(C_IROTATEMAP::GetIgnoredMapsCount());
	ignoredMaps C_IROTATEMAP::IgnoredMaps_Save();
	
	C_IROTATEMAP::SetNextMap(sNextMapName, iNextMapIndex);
}

#endregion
// ============================================================================================== //
