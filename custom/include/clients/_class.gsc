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

public sealed TEAM_Allies = 0;
public sealed TEAM_Axis = 1;
public sealed TEAM_SIZE = 2;

public GetDefaultItem()
{
	item = C_ICITEM::GetDefaultItem();
	/// icon visible in the class menu
	item.sMenuIcon = "black";
	
	/// name visible in the class menu
	item.sMenuName = "";
	/// description visible in the class menu
	item.sMenuDescription = "";

	return item;
}

private GetNoneItem()
{
	item = SpawnStruct();
	item.bIsNone = true;
	item.sMenuIcon = "specialty_null";
	item.sMenuName = "";
	item.sMenuDescription = "";
	return item;
}

public GetITeam(sTeam)
{
	if (sTeam == "allies")
		return TEAM_Allies;
	else if (sTeam == "axis")
		return TEAM_Axis;
	else
		IEXCEPTION::ArgumentMsg("Unknown class team '" + sTeam + "'");
}

public sealed TYPE_Body = 0;
public sealed TYPE_Weapon = 1;
public sealed TYPE_InvA = 2;
public sealed TYPE_InvB = 3;
public sealed TYPE_InvC = 4;
public sealed TYPE_InvD = 5;
public sealed TYPE_SIZE = 6;

// stats 104 - 115
private InitStat = 104;

public SetPlayerStat(iTeam, iType, iItem)
{
	self ICSTAT::SetById(InitStat + (iTeam * TYPE_SIZE) + iType, iItem);	
}

public GetPlayerStat(iTeam, iType)
{
	return self ICSTAT::GetById(InitStat + (iTeam * TYPE_SIZE) + iType);
}

public IsTypeEnabled(iTeam, iType)
{
	return C_ICCLASS::GetItemsCount(iTeam, iType) != 0;
}

public UpdateClassType(iTeam, iType, iIndex)
{
	item = GetItemByIndex(iTeam, iType, iIndex);
	IEXCEPTION::Undefined(item, "Could not find class item team;" + iTeam + ";type;" + iType + ";index;" + iIndex);
	self SetClientDvar("ui_teamC" + iTeam + "T" + iType, item.sMenuIcon);
}

public Item_IsUsable()
{
	return !IsDefined(self.bIsNone);
}

public Item_IsAvailable(pPlayer)
{
	if (!self Item_IsUsable())
		return true;
	
	if (C_ISVAR::GetAsBool("DEVClassEnabledAll"))
		return true;
	
	return self C_ICITEM::Item_IsAvailable(pPlayer);
}

/// <summary>
/// 
/// </summary>
/// <returns>Undefined if iIndex doesn't exist</returns>
/// <param name="sTeam"></param>
/// <param name="iType"></param>
/// <param name="iIndex"></param>
public GetItemByIndex(iTeam, iType, iIndex)
{
	sName = GetNameByIndex(iTeam, iType, iIndex);
	if (!IsDefined(sName))
		return undefined;
		
	return GetItemByName(iTeam, iType, sName);
}

/// <summary>
/// 
/// </summary>
/// <returns>NoneItem if sName is empty string</returns>
/// <param name="iTeam"></param>
/// <param name="iType"></param>
/// <param name="sName"></param>
public GetItemByName(iTeam, iType, sName)
{
	if (sName == "")
		return GetNoneItem();

	if (iTeam == TEAM_Allies)
	{
		switch (iType)
		{
			case TYPE_Body:
				return inputs\class\allies_body::GetItemByName(sName);
			case TYPE_Weapon:
				return inputs\class\allies_weapon::GetItemByName(sName);
			case TYPE_InvA:
				return inputs\class\allies_invA::GetItemByName(sName);
			case TYPE_InvB:
				return inputs\class\allies_invB::GetItemByName(sName);
			case TYPE_InvC:
				return inputs\class\allies_invC::GetItemByName(sName);
			case TYPE_InvD:
				return inputs\class\allies_invD::GetItemByName(sName);
			default:
				IEXCEPTION::ArgumentMsg("Unknown class iType '" + iType + "'");
		}
	}
	else if (iTeam == TEAM_Axis)
	{
		switch (iType)
		{
			case TYPE_Body:
				return inputs\class\axis_body::GetItemByName(sName);
			case TYPE_Weapon:
				return inputs\class\axis_weapon::GetItemByName(sName);
			case TYPE_InvA:
				return inputs\class\axis_invA::GetItemByName(sName);
			case TYPE_InvB:
				return inputs\class\axis_invB::GetItemByName(sName);
			case TYPE_InvC:
				return inputs\class\axis_invC::GetItemByName(sName);
			case TYPE_InvD:
				return inputs\class\axis_invD::GetItemByName(sName);
			default:
				IEXCEPTION::ArgumentMsg("Unknown class iType '" + iType + "'");
		}		
	}
	else
		IEXCEPTION::ArgumentMsg("Unknown class iTeam '" + iTeam + "'");
}

/// <summary>
/// 
/// </summary>
/// <returns>Undefined if iIndex doesn't exist
/// 		 Empty string if it's NoneItem</returns>
/// <param name="iTeam"></param>
/// <param name="iType"></param>
/// <param name="iIndex"></param>
public GetNameByIndex(iTeam, iType, iIndex)
{
	if (iTeam == TEAM_Allies)
	{
		switch (iType)
		{
			case TYPE_Body:
				return inputs\class\allies_body::GetNameByIndex(iIndex);
			case TYPE_Weapon:
				return inputs\class\allies_weapon::GetNameByIndex(iIndex);
			case TYPE_InvA:
				return inputs\class\allies_invA::GetNameByIndex(iIndex);
			case TYPE_InvB:
				return inputs\class\allies_invB::GetNameByIndex(iIndex);
			case TYPE_InvC:
				return inputs\class\allies_invC::GetNameByIndex(iIndex);
			case TYPE_InvD:
				return inputs\class\allies_invD::GetNameByIndex(iIndex);
			default:
				IEXCEPTION::ArgumentMsg("Unknown class iType '" + iType + "'");
		}
	}
	else if (iTeam == TEAM_Axis)
	{
		switch (iType)
		{
			case TYPE_Body:
				return inputs\class\axis_body::GetNameByIndex(iIndex);
			case TYPE_Weapon:
				return inputs\class\axis_weapon::GetNameByIndex(iIndex);
			case TYPE_InvA:
				return inputs\class\axis_invA::GetNameByIndex(iIndex);
			case TYPE_InvB:
				return inputs\class\axis_invB::GetNameByIndex(iIndex);
			case TYPE_InvC:
				return inputs\class\axis_invC::GetNameByIndex(iIndex);
			case TYPE_InvD:
				return inputs\class\axis_invD::GetNameByIndex(iIndex);
			default:
				IEXCEPTION::ArgumentMsg("Unknown class iType '" + iType + "'");
		}		
	}
	else
		IEXCEPTION::ArgumentMsg("Unknown class iTeam '" + iTeam + "'");
}

public GetItemsCount(iTeam, iType)
{
	if (iTeam == TEAM_Allies)
	{
		switch (iType)
		{
			case TYPE_Body:
				return inputs\class\allies_body::GetItemsCount();
			case TYPE_Weapon:
				return inputs\class\allies_weapon::GetItemsCount();
			case TYPE_InvA:
				return inputs\class\allies_invA::GetItemsCount();
			case TYPE_InvB:
				return inputs\class\allies_invB::GetItemsCount();
			case TYPE_InvC:
				return inputs\class\allies_invC::GetItemsCount();
			case TYPE_InvD:
				return inputs\class\allies_invD::GetItemsCount();
			default:
				IEXCEPTION::ArgumentMsg("Unknown class iType '" + iType + "'");
		}
	}
	else if (iTeam == TEAM_Axis)
	{
		switch (iType)
		{
			case TYPE_Body:
				return inputs\class\axis_body::GetItemsCount();
			case TYPE_Weapon:
				return inputs\class\axis_weapon::GetItemsCount();
			case TYPE_InvA:
				return inputs\class\axis_invA::GetItemsCount();
			case TYPE_InvB:
				return inputs\class\axis_invB::GetItemsCount();
			case TYPE_InvC:
				return inputs\class\axis_invC::GetItemsCount();
			case TYPE_InvD:
				return inputs\class\axis_invD::GetItemsCount();
			default:
				IEXCEPTION::ArgumentMsg("Unknown class iType '" + iType + "'");
		}		
	}
	else
		IEXCEPTION::ArgumentMsg("Unknown class iTeam '" + iTeam + "'");
}

#region Events
public ItemInSVPreCache(iTeam, iType, iIndex)
{
	item = GetItemByIndex(iTeam, iType, iIndex);
	IEXCEPTION::Undefined(item, "Could not find class item team;" + iTeam + ";type;" + iType + ";index;" + iIndex);
	if (!item Item_IsUsable())
		return;
	
	if (iTeam == TEAM_Allies)
	{
		switch (iType)
		{
			case TYPE_Body:
				return custom\clients\class\_allies_body::ItemInSVPreCache(item);
			case TYPE_Weapon:
				return custom\clients\class\_allies_weapon::ItemInSVPreCache(item);
			case TYPE_InvA:
				return custom\clients\class\_allies_invA::ItemInSVPreCache(item);
			case TYPE_InvB:
				return custom\clients\class\_allies_invB::ItemInSVPreCache(item);
			case TYPE_InvC:
				return custom\clients\class\_allies_invC::ItemInSVPreCache(item);
			case TYPE_InvD:
				return custom\clients\class\_allies_invD::ItemInSVPreCache(item);
			default:
				IEXCEPTION::ArgumentMsg("Unknown class type '" + iType + "'");
		}
	}
	else if (iTeam == TEAM_Axis)
	{
		switch (iType)
		{
			case TYPE_Body:
				return custom\clients\class\_axis_body::ItemInSVPreCache(item);
			case TYPE_Weapon:
				return custom\clients\class\_axis_weapon::ItemInSVPreCache(item);
			case TYPE_InvA:
				return custom\clients\class\_axis_invA::ItemInSVPreCache(item);
			case TYPE_InvB:
				return custom\clients\class\_axis_invB::ItemInSVPreCache(item);
			case TYPE_InvC:
				return custom\clients\class\_axis_invC::ItemInSVPreCache(item);
			case TYPE_InvD:
				return custom\clients\class\_axis_invD::ItemInSVPreCache(item);
			default:
				IEXCEPTION::ArgumentMsg("Unknown class type '" + iType + "'");
		}		
	}
	else
		IEXCEPTION::ArgumentMsg("Unknown class team '" + iTeam + "'");
}

public ItemInCPreSpawning(iTeam, iType, iIndex, args)
{
	item = GetItemByIndex(iTeam, iType, iIndex);
	self C_ICCLASS::CSISet(iType, iTeam, iIndex);
	
	IEXCEPTION::Undefined(item, "Could not find class item team;" + iTeam + ";type;" + iType + ";index;" + iIndex);
	if (!item Item_IsUsable())
		return;
	
	if (iTeam == TEAM_Allies)
	{
		switch (iType)
		{
			case TYPE_Body:
				return self custom\clients\class\_allies_body::ItemInCPreSpawning(item, args);
			case TYPE_Weapon:
				return self custom\clients\class\_allies_weapon::ItemInCPreSpawning(item, args);
			case TYPE_InvA:
				return self custom\clients\class\_allies_invA::ItemInCPreSpawning(item, args);
			case TYPE_InvB:
				return self custom\clients\class\_allies_invB::ItemInCPreSpawning(item, args);
			case TYPE_InvC:
				return self custom\clients\class\_allies_invC::ItemInCPreSpawning(item, args);
			case TYPE_InvD:
				return self custom\clients\class\_allies_invD::ItemInCPreSpawning(item, args);
			default:
				IEXCEPTION::ArgumentMsg("Unknown class type '" + iType + "'");
		}
	}
	else if (iTeam == TEAM_Axis)
	{
		switch (iType)
		{
			case TYPE_Body:
				return self custom\clients\class\_axis_body::ItemInCPreSpawning(item, args);
			case TYPE_Weapon:
				return self custom\clients\class\_axis_weapon::ItemInCPreSpawning(item, args);
			case TYPE_InvA:
				return self custom\clients\class\_axis_invA::ItemInCPreSpawning(item, args);
			case TYPE_InvB:
				return self custom\clients\class\_axis_invB::ItemInCPreSpawning(item, args);
			case TYPE_InvC:
				return self custom\clients\class\_axis_invC::ItemInCPreSpawning(item, args);
			case TYPE_InvD:
				return self custom\clients\class\_axis_invD::ItemInCPreSpawning(item, args);
			default:
				IEXCEPTION::ArgumentMsg("Unknown class type '" + iType + "'");
		}		
	}
	else
		IEXCEPTION::ArgumentMsg("Unknown class team '" + iTeam + "'");
}

public ItemOnCSpawned(iTeam, iType, iIndex, args)
{
	item = GetItemByIndex(iTeam, iType, iIndex);
	IEXCEPTION::Undefined(item, "Could not find class item team;" + iTeam + ";type;" + iType + ";index;" + iIndex);
	if (!item Item_IsUsable())
		return;
	
	if (iTeam == TEAM_Allies)
	{
		switch (iType)
		{
			case TYPE_Body:
				return self custom\clients\class\_allies_body::ItemOnCSpawned(item, args);
			case TYPE_Weapon:
				return self custom\clients\class\_allies_weapon::ItemOnCSpawned(item, args);
			case TYPE_InvA:
				return self custom\clients\class\_allies_invA::ItemOnCSpawned(item, args);
			case TYPE_InvB:
				return self custom\clients\class\_allies_invB::ItemOnCSpawned(item, args);
			case TYPE_InvC:
				return self custom\clients\class\_allies_invC::ItemOnCSpawned(item, args);
			case TYPE_InvD:
				return self custom\clients\class\_allies_invD::ItemOnCSpawned(item, args);
			default:
				IEXCEPTION::ArgumentMsg("Unknown class type '" + iType + "'");
		}
	}
	else if (iTeam == TEAM_Axis)
	{
		switch (iType)
		{
			case TYPE_Body:
				return self custom\clients\class\_axis_body::ItemOnCSpawned(item, args);
			case TYPE_Weapon:
				return self custom\clients\class\_axis_weapon::ItemOnCSpawned(item, args);
			case TYPE_InvA:
				return self custom\clients\class\_axis_invA::ItemOnCSpawned(item, args);
			case TYPE_InvB:
				return self custom\clients\class\_axis_invB::ItemOnCSpawned(item, args);
			case TYPE_InvC:
				return self custom\clients\class\_axis_invC::ItemOnCSpawned(item, args);
			case TYPE_InvD:
				return self custom\clients\class\_axis_invD::ItemOnCSpawned(item, args);
			default:
				IEXCEPTION::ArgumentMsg("Unknown class type '" + iType + "'");
		}		
	}
	else
		IEXCEPTION::ArgumentMsg("Unknown class team '" + iTeam + "'");
}

#endregion
// ================================================================================================================ //
#region Spawn Info

public CSISet(iType, iTeam, iIndex)
{
	if (!IsDefined(self.CLASS_SI))
		self.CLASS_SI = [];

	self.CLASS_SI[iType] = { iTeam = iTeam, iIndex = iIndex };
}

public CSIReset()
{
	self.CLASS_SI = undefined;
}

public CSIGetTeam(iType)
{
	if (!IsDefined(self.CLASS_SI))
		return undefined;
		
	if (!IsDefined(self.CLASS_SI[iType]))
		return undefined;
	
	return self.CLASS_SI[iType]["iTeam"];
}

public CSIGetIndex(iType)
{
	if (!IsDefined(self.CLASS_SI))
		return undefined;
		
	if (!IsDefined(self.CLASS_SI[iType]))
		return undefined;
	
	return self.CLASS_SI[iType]["iIndex"];
}

#endregion
// ================================================================================================================ //
