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

GetDefaultItem()
{
	item = SpawnStruct();
	item.sName = "Unknown item";
	
	item.iMinValue = undefined;
	item.iMaxValue = undefined;
	
	// int undefined CompareFunc(int a, int b)
	// returns 1 if a is "better" than b
	// returns 0 if a is equal to b
	// returns -1 if a is "worse" than b
	item.dComparer = ICOMPARE::GreaterInt;
	

	item.dToString = ITYPE::IntToStr;
	
	return item;
}

// level.RoundSummary[sRecordName]["value"] = iValue;
// level.RoundSummary[sRecordName]["playerName"] = sPlayerName;

// player.pers["summary"][sRecordName] = iValue;

// IMAPVARS
// sRecordName = iValue + "," + sPlayerName;

public UpdateRecord(sName, iValue)
{
	iValue = Int(iValue);
	
	record = GetItemByName(sName);
	IEXCEPTION::Undefined(record, "Could not find summary record " + sName);
	if (!IsValueValid(record, iValue))
		return;
		
	//iRoundRecordVal = GetRoundRecordValue(sName);
	//if (!IsDefined(iRoundRecordVal) || [[record.dComparer]](iValue, iRoundRecordVal) > 0)
	//	SetRoundRecord(sName, self, iValue);
		
	iPlayerRecordVal = self GetPlayerRecord(sName);
	if (!IsDefined(iPlayerRecordVal) || [[record.dComparer]](iValue, iPlayerRecordVal) > 0)
		self SetPlayerRecord(sName, iValue);
		
	iMapRecordVal = GetMapRecordValue(sName);
	if (!IsDefined(iMapRecordVal) || [[record.dComparer]](iValue, iMapRecordVal) > 0)
		SetMapRecord(sName, self, iValue);
		
	self C_IDEBUG::Debug("updating record " + sName + ";" + iValue);
}

private IsValueValid(record, iValue)
{
	if (IsDefined(record.iMinValue) && iValue < record.iMinValue)
		return false;
		
	if (IsDefined(record.iMaxValue) && iValue > record.iMaxValue)
		return false;
		
	return true;
}

// ========================================================================================== //
#region RoundRecord

// Changed content in victory menu -> round summary disabled
/*private SetRoundRecord(sName, pPlayer, iValue)
{
	if (!IsDefined(level.RoundSummary))
		level.RoundSummary = [];
		
	if (!IsDefined(level.RoundSummary[sName]))
		level.RoundSummary[sName] = [];

	level.RoundSummary[sName]["sPlayerName"] = pPlayer.Name;
	level.RoundSummary[sName]["iValue"] = iValue;
}

public GetRoundRecordValue(sName)
{
	if (!IsDefined(level.RoundSummary) || !IsDefined(level.RoundSummary[sName]))
		return undefined;
		
	return level.RoundSummary[sName]["iValue"];
}

public GetRoundRecordPlayerName(sName)
{
	if (!IsDefined(level.RoundSummary) || !IsDefined(level.RoundSummary[sName]))
		return undefined;
		
	return level.RoundSummary[sName]["sPlayerName"];
}*/

#endregion
// ========================================================================================== //
#region PlayerRecord

private SetPlayerRecord(sName, iValue)
{
	if (!IsDefined(self.pers["summary"]))
		self.pers["summary"] = [];

	self.pers["summary"][sName] = iValue;
}

public GetPlayerRecord(sName)
{
	if (!IsDefined(self.pers["summary"]))
		return undefined;
		
	return self.pers["summary"][sName];
}

#endregion
// ========================================================================================== //
#region MapRecord

private SetMapRecord(sName, pPlayer, iValue)
{
	C_IMAPVARS::Set(IGAME::GetMap(), sName, iValue + "," + pPlayer.Name);
}

public GetMapRecordValue(sName)
{
	data = C_IMAPVARS::Get(IGAME::GetMap(), sName);
	if (!IsDefined(data))
		return undefined;
		
	toks = StrTok(data, ",");
	return Int(toks[0]);
}

public GetMapRecordPlayerName(sName)
{
	data = C_IMAPVARS::Get(IGAME::GetMap(), sName);
	if (!IsDefined(data))
		return undefined;
		
	toks = StrTok(data, ",");
	return toks[1];
}

#endregion
// ========================================================================================== //
#region ITEMS

public sealed TYPE_Best = 0;
public sealed TYPE_Worst = 1;
public sealed TYPE_SIZE = 2;

public GetItem(iType, iIndex)
{
	sName = GetItemName(iType, iIndex);	
	if (IsDefined(sName))
		return inputs\summary\data::GetItem(sName);
		
	return undefined;
}

public GetItemName(iType, iIndex)
{
	switch (iType)
	{
		case TYPE_Best:
			return inputs\summary\best::GetItem(iIndex);
		case TYPE_Worst:
			return inputs\summary\worst::GetItem(iIndex);
		default:
			IEXCEPTION::ArgumentMsg("Unknown record type '" + iType + "'");
			break;
	}	
}

public GetItemsCount(iType)
{
	switch (iType)
	{
		case TYPE_Best:
			return inputs\summary\best::GetCount();
		case TYPE_Worst:
			return inputs\summary\worst::GetCount();
		default:
			IEXCEPTION::ArgumentMsg("Unknown record type '" + iType + "'");
			break;
	}
}

public GetItemByName(sName)
{
	return inputs\summary\data::GetItem(sName);
}

#endregion
// ========================================================================================== //