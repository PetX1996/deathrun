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

public GetItemsCount()
{
	return inputs\maprotate\maplist::GetCount();
}

public GetItemName(iIndex)
{
	return inputs\maprotate\maplist::GetItem(iIndex);
}

public IsMapInMapList(sName)
{
	iCount = GetItemsCount();
	for (i = 0; i < iCount; i++)
	{
		if (GetItemName(i) == sName)
			return true;
	}
	return false;
}

public GetDefaultItem()
{
	item = SpawnStruct();
	item.sFullName = "Unknown map";
	item.iLength = 0; // 1, 2, 3, 4, 5
	item.iDifficulty = 0; // 1, 2, 3, 4, 5
	item.bIsNew = false;
	item.iPopularity = 0; // changed by IVOTEMAP
	//item.GameTypes = [];
	//item.Servers = [];
	return item;
}


public GetItem(iIndex)
{
	sName = GetItemName(iIndex);
	return GetItemByName(sName);
}

public GetItemByName(sName)
{
	return inputs\maprotate\data::GetItem(sName);
}