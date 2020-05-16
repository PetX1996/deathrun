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

// ====================================================================================== //
#region ReservedStats
// 2400 - 3000
// 3082 - 3498

// 2400 - 2490 - STAGES

// 2490 - 2590 - jumper
// 2590 - 2690 - activator
// 2690 - 3000 - bonus

// 3082 - 3498 - map

private STATS_OFFSET = 2400;

public sealed STATS_Stages = STATS_OFFSET;
public sealed STATS_Stage0 = STATS_Stages;
public sealed STATS_Stage1 = STATS_Stages + 9;
public sealed STATS_Stage2 = STATS_Stages + 18;
public sealed STATS_Stage3 = STATS_Stages + 27;
public sealed STATS_Stage4 = STATS_Stages + 36;
public sealed STATS_Stage5 = STATS_Stages + 45;
public sealed STATS_Stage6 = STATS_Stages + 54;
public sealed STATS_Stage7 = STATS_Stages + 63;
public sealed STATS_Stage8 = STATS_Stages + 72;
public sealed STATS_Stage9 = STATS_Stages + 81;

public sealed STATS_Jumper = STATS_OFFSET + 90;
public sealed STATS_Activator = STATS_OFFSET + 190;
public sealed STATS_Bonus = STATS_OFFSET + 290;

public sealed STATS_Map = 3082;

#endregion
// ====================================================================================== //

public GetDefaultItem()
{
	item = C_ICITEM::GetDefaultItem();
	
	item.iType = undefined; // filled during getting item
	item.sName = undefined; // filled during getting item
	
	/// collecting item
	item.bIsCollecting = undefined;
	
	/// name visible in the challenge menu
	item.sMenuName = "NoName";
	/// description visible in the challenge menu
	item.sMenuDescription = "No description.";
	
	/// maximum value of the challenge
	item.iMaxValue = -1;
	/// statId for saving current value
	item.iStatId = -1;
	
	item.dToString = ITYPE::IntToStr;
	
	return item;
}

public Item_IsCollecting()
{
	return IsDefined(self.bIsCollecting);
}

/// <summary>
/// 
/// </summary>
/// <self>Item | StageList</self>
/// <returns>Bool</returns>
/// <param name="pPlayer"></param>
public Item_IsAvailable(pPlayer)
{
	if (C_ISVAR::GetAsBool("DEVChEnabledAll"))
		return true;

	return self C_ICITEM::Item_IsAvailable(pPlayer);
}

public Item_GetCurrentValue(pPlayer)
{
	iProceeding = undefined;
	if (MAPIsMapSideEnabled() && self.iType == TYPE_Map)
	{
		if (!IsDefined(pPlayer.pers["MCHProceedsByName"]))
			pPlayer.pers["MCHProceedsByName"] = [];
			
		if (!IsDefined(pPlayer.pers["MCHProceedsByName"][self.sName]))
			pPlayer.pers["MCHProceedsByName"][self.sName] = 0;
			
		iProceeding = pPlayer.pers["MCHProceedsByName"][self.sName];
	}
	else
		iProceeding = pPlayer ICSTAT::GetById(self.iStatId);

	return iProceeding;
}

public Item_GetProceeding(pPlayer)
{
	iValue = self Item_GetCurrentValue(pPlayer);
	if (self Item_IsCollecting())
		iValue = IMATH::CountSetBits(iValue, (self.iMaxValue + 1));
		
	return iValue;
}

private Item_SetCurrentValue(pPlayer, iValue)
{
	if (MAPIsMapSideEnabled() && self.iType == TYPE_Map)
	{
		if (!IsDefined(pPlayer.pers["MCHProceedsByName"]))
			pPlayer.pers["MCHProceedsByName"] = [];
			
		pPlayer.pers["MCHProceedsByName"][self.sName] = iValue;
	}
	else
		pPlayer ICSTAT::SetById(self.iStatId, iValue);
}

/// <summary>
/// 
/// </summary>
/// <self>Item | StageList</self>
/// <returns>Bool</returns>
/// <param name="pPlayer"></param>
public Item_IsCompleted(pPlayer)
{
	return self Item_GetProceeding(pPlayer) >= self.iMaxValue;
}

public Item_GetMaxValue()
{
	return self.iMaxValue;
}

public Item_ValueToString(iValue)
{
	//if (self Item_IsCollecting()) // already in proceeding
	//	iValue = IMATH::CountSetBits(iValue, self.iMaxValue + 1);

	return [[self.dToString]](iValue);
}

#region STAGES
public GetDefaultStageList()
{
	item = SpawnStruct();
	item.bIsStageList = true;
	
	item.iType = undefined; // filled during getting item
	item.sName = undefined; // filled during getting item
	
	// int - stores current stageIndex
	item.iStatId = -1;

	// string[] - list of all stages
	item.SStageList = [];
	item.StageItems = [];
	
	return item;
}

public IsStageList(item)
{
	return IsDefined(item.bIsStageList);
}

/// <summary>
/// Adds a new sStage to StageList.
/// </summary>
/// <returns></returns>
/// <param name="stageList"></param>
/// <param name="sStage"></param>
public StageList_AddStage(sStage, [stageItem])
{
	self.SStageList[self.SStageList.size] = sStage;
	self.StageItems[self.StageItems.size] = stageItem;
}

/// <summary>
/// Gets specified Stage contained in StageList.
/// </summary>
/// <returns></returns>
/// <param name="iStage"></param>
public StageList_GetStageItem(iStage)
{
	sName = self StageList_GetStageName(iStage);
	return GetItemOrStageListByName(self.iType, sName);
}

public StageList_GetStageName(iStage)
{
	IEXCEPTION::OutOfRange(self.SStageList.size, iStage, "Could not find StagesList's Stage with index '" + iStage + "'");
	return self.SStageList[iStage];
}

public StageList_GetStagesCount()
{
	return self.SStageList.size;
}

private StageList_GetProceedingStageIndex(pPlayer)
{
	iStage = undefined;
	if (MAPIsMapSideEnabled() && self.iType == TYPE_Map)
	{
		if (!IsDefined(pPlayer.pers["MCHProceedsByName"]))
			pPlayer.pers["MCHProceedsByName"] = [];
			
		if (!IsDefined(pPlayer.pers["MCHProceedsByName"][self.sName]))
			pPlayer.pers["MCHProceedsByName"][self.sName] = 0;
			
		iStage = pPlayer.pers["MCHProceedsByName"][self.sName];
	}
	else
		iStage = pPlayer ICSTAT::GetById(self.iStatId);
		
	return Int(Min(iStage, self.SStageList.size - 1));
}

private StageList_SetProceedingStageIndex(pPlayer, iIndex)
{
	if (MAPIsMapSideEnabled() && self.iType == TYPE_Map)
	{
		if (!IsDefined(pPlayer.pers["MCHProceedsByName"]))
			pPlayer.pers["MCHProceedsByName"] = [];
		
		pPlayer.pers["MCHProceedsByName"][self.sName] = iIndex;
	}
	else
		pPlayer ICSTAT::SetById(self.iStatId, iIndex);
}

/// <summary>
/// Returns current proceeding Item of the StageList.
/// </summary>
/// <returns>Item</returns>
/// <param name="pPlayer"></param>
public StageList_GetProceedingStageItem(pPlayer)
{
	iStage = self StageList_GetProceedingStageIndex(pPlayer);
	return self StageList_GetStageItem(iStage);
}

/// <summary>
/// Goes to next stage index.
/// </summary>
/// <returns></returns>
/// <param name="pPlayer"></param>
private StageList_RaiseStage(pPlayer)
{
	curStageIndex = self StageList_GetProceedingStageIndex(pPlayer);
	nextStageIndex = curStageIndex + 1;
	if (nextStageIndex < self.SStageList.size)
	{
		self StageList_SetProceedingStageIndex(pPlayer, nextStageIndex);
		
		args = IECALLBACK::Args_Create();
		args.stageList = self;
		C_INIT::CH_RunOnCRaisedStage(args);
	}
}

public StageList_IsCompleted(pPlayer)
{
	iStage = self StageList_GetProceedingStageIndex(pPlayer);
	if (iStage == (self.SStageList.size - 1)) // is this last item?
	{
		item = self StageList_GetStageItem(iStage);
		return item Item_IsCompleted(pPlayer);
	}
	return false;
}
#endregion

public sealed TYPE_Stage0 = 0;
public sealed TYPE_Stage1 = 1;
public sealed TYPE_Stage2 = 2;
public sealed TYPE_Stage3 = 3;
public sealed TYPE_Stage4 = 4;
public sealed TYPE_Stage5 = 5;
public sealed TYPE_Stage6 = 6;
public sealed TYPE_Stage7 = 7;
public sealed TYPE_Stage8 = 8;
public sealed TYPE_Stage9 = 9;

public sealed TYPE_Jumper = 10;
public sealed TYPE_Activator = 11;
public sealed TYPE_Bonus = 12;
public sealed TYPE_Map = 13;
public sealed TYPE_SIZE = 14;

public IsTypeEnabled(iType)
{
	return GetItemsCount(iType) != 0;
}

public GetItemsCount(iType)
{
	switch (iType)
	{
		case TYPE_Stage0:
			return inputs\challenges\stage0::GetItemsCount();
		case TYPE_Stage1:
			return inputs\challenges\stage1::GetItemsCount();
		case TYPE_Stage2:
			return inputs\challenges\stage2::GetItemsCount();
		case TYPE_Stage3:
			return inputs\challenges\stage3::GetItemsCount();
		case TYPE_Stage4:
			return inputs\challenges\stage4::GetItemsCount();
		case TYPE_Stage5:
			return inputs\challenges\stage5::GetItemsCount();
		case TYPE_Stage6:
			return inputs\challenges\stage6::GetItemsCount();
		case TYPE_Stage7:
			return inputs\challenges\stage7::GetItemsCount();
		case TYPE_Stage8:
			return inputs\challenges\stage8::GetItemsCount();
		case TYPE_Stage9:
			return inputs\challenges\stage9::GetItemsCount();
		case TYPE_Jumper:
			return inputs\challenges\jumper::GetItemsCount();
		case TYPE_Activator:
			return inputs\challenges\activator::GetItemsCount();
		case TYPE_Bonus:
			return inputs\challenges\bonus::GetItemsCount();
		case TYPE_Map:
			return MAPGetItemsCount();
		default:
			IEXCEPTION::ArgumentMsg("Unknown challenges iType '" + iType + "'");
	}
}

public GetNameByIndex(iType, iIndex)
{
	switch (iType)
	{
		case TYPE_Stage0:
			return inputs\challenges\stage0::GetNameByIndex(iIndex);
		case TYPE_Stage1:
			return inputs\challenges\stage1::GetNameByIndex(iIndex);
		case TYPE_Stage2:
			return inputs\challenges\stage2::GetNameByIndex(iIndex);
		case TYPE_Stage3:
			return inputs\challenges\stage3::GetNameByIndex(iIndex);
		case TYPE_Stage4:
			return inputs\challenges\stage4::GetNameByIndex(iIndex);
		case TYPE_Stage5:
			return inputs\challenges\stage5::GetNameByIndex(iIndex);
		case TYPE_Stage6:
			return inputs\challenges\stage6::GetNameByIndex(iIndex);
		case TYPE_Stage7:
			return inputs\challenges\stage7::GetNameByIndex(iIndex);
		case TYPE_Stage8:
			return inputs\challenges\stage8::GetNameByIndex(iIndex);
		case TYPE_Stage9:
			return inputs\challenges\stage9::GetNameByIndex(iIndex);
		case TYPE_Jumper:
			return inputs\challenges\jumper::GetNameByIndex(iIndex);
		case TYPE_Activator:
			return inputs\challenges\activator::GetNameByIndex(iIndex);
		case TYPE_Bonus:
			return inputs\challenges\bonus::GetNameByIndex(iIndex);
		case TYPE_Map:
			return MAPGetNameByIndex(iIndex);
		default:
			IEXCEPTION::ArgumentMsg("Unknown challenges iType '" + iType + "'");
	}
}

public GetItemOrStageListByIndex(iType, iIndex)
{
	sName = GetNameByIndex(iType, iIndex);
	if (IsDefined(sName))
		return GetItemOrStageListByName(iType, sName);
		
	return undefined;
}

public GetItemOrStageListByName(iType, sName)
{
	item = _GetItemOrStageListByName(iType, sName);
	if (IsDefined(item))
	{
		item.iType = iType;
		item.sName = sName;
	}
	
	return item;
}

private _GetItemOrStageListByName(iType, sName)
{
	switch (iType)
	{
		case TYPE_Stage0:
			return inputs\challenges\stage0::GetItemOrStageListByName(sName);
		case TYPE_Stage1:
			return inputs\challenges\stage1::GetItemOrStageListByName(sName);
		case TYPE_Stage2:
			return inputs\challenges\stage2::GetItemOrStageListByName(sName);
		case TYPE_Stage3:
			return inputs\challenges\stage3::GetItemOrStageListByName(sName);
		case TYPE_Stage4:
			return inputs\challenges\stage4::GetItemOrStageListByName(sName);
		case TYPE_Stage5:
			return inputs\challenges\stage5::GetItemOrStageListByName(sName);
		case TYPE_Stage6:
			return inputs\challenges\stage6::GetItemOrStageListByName(sName);
		case TYPE_Stage7:
			return inputs\challenges\stage7::GetItemOrStageListByName(sName);
		case TYPE_Stage8:
			return inputs\challenges\stage8::GetItemOrStageListByName(sName);
		case TYPE_Stage9:
			return inputs\challenges\stage9::GetItemOrStageListByName(sName);
		case TYPE_Jumper:
			return inputs\challenges\jumper::GetItemOrStageListByName(sName);
		case TYPE_Activator:
			return inputs\challenges\activator::GetItemOrStageListByName(sName);
		case TYPE_Bonus:
			return inputs\challenges\bonus::GetItemOrStageListByName(sName);
		case TYPE_Map:
			return MAPGetItemOrStageListByName(sName);
		default:
			IEXCEPTION::ArgumentMsg("Unknown challenges iType '" + iType + "'");
	}
}

public CGetItemByIndex(iType, iIndex)
{
	itemOrStageList = GetItemOrStageListByIndex(iType, iIndex);
	
	item = itemOrStageList;
	if (IsDefined(itemOrStageList) && IsStageList(itemOrStageList))
		item = itemOrStageList StageList_GetProceedingStageItem(self);
	
	return item;
}

public CGetItemByName(iType, sName)
{
	itemOrStageList = GetItemOrStageListByName(iType, sName);
	
	item = itemOrStageList;
	if (IsDefined(itemOrStageList) && IsStageList(itemOrStageList))
		item = itemOrStageList StageList_GetProceedingStageItem(self);
	
	return item;
}

public GetItemIndexByName(iType, sName)
{
	iCount = GetItemsCount(iType);
	for (iIndex = 0; iIndex < iCount; iIndex++)
	{
		sTempName = GetNameByIndex(iType, iIndex);
		if (sTempName == sName)
			return iIndex;
	}
	
	return undefined;
}

public CCollect(iType, sName, iIdent)
{
	itemOrStageList = C_ICCHALLENGES::GetItemOrStageListByName(iType, sName);
	IEXCEPTION::Undefined(itemOrStageList, "Could not find challenge iType;" + iType + ";sName;" + sName);
	
	item = itemOrStageList;
	stageList = undefined;
	sStageListName = undefined;
	if (IsStageList(itemOrStageList))
	{
		stageList = item;
		sStageListName = sName;
		item = itemOrStageList StageList_GetProceedingStageItem(self);
		sName = item.sName;
	}
	
	IEXCEPTION::Argument(item Item_IsCollecting(), "Item iType;" + iType + ";sName;" + sName + " is not collecting item!");
	IEXCEPTION::Argument(iIdent < IMATH::iBitsInInt, "0 <= iIdent < " + IMATH::iBitsInInt);
	
	if (!C_IGLTYPE::IsDisabled() 
		&& (C_IGLTYPE::IsTrainingRound() 
			|| C_IGLTYPE::IsSinglePlayer() 
			|| C_IGLSTATE::IsPRE()
			|| C_IGLSTATE::IsINStarted()))
		return;
	
	if (!item Item_IsAvailable(self))
		return;
	
	iProceeding = item Item_GetProceeding(self);
	if (iProceeding == item.iMaxValue) // already finished
	{
		if (IsDefined(stageList))
			stageList StageList_RaiseStage(self);	
			
		return;
	}
	else if (iProceeding > item.iMaxValue) // decreasing MaxValue by developer...
	{
		item Item_SetCurrentValue(self, (IMATH::Pow2(item.iMaxValue) - 1));
		if (IsDefined(stageList))
			stageList StageList_RaiseStage(self);		

		return;
	}
	
	iOldValue = item Item_GetCurrentValue(self);
	iNewValue = iOldValue | IMATH::Pow2(iIdent);
	if (iOldValue == iNewValue)
		return;
		
	self CUpdate(iType, sName, item, stageList, sStageListName, iNewValue);
}

/// <summary>
/// Increments specified iInc to challenge's stat.
/// Do nothing if challenge is already completed.
/// </summary>
/// <returns></returns>
/// <param name="sName">Name of the challenge located in inputs\challenges\data.gsc</param>
/// <param name="iInc">Int - Default is 1</param>
public CProceed(iType, sName, [iInc])
{
	if (!IsDefined(iInc)) iInc = 1;
	iInc = Int(iInc);
	
	itemOrStageList = C_ICCHALLENGES::GetItemOrStageListByName(iType, sName);
	IEXCEPTION::Undefined(itemOrStageList, "Could not find challenge iType;" + iType + ";sName;" + sName);
	
	item = itemOrStageList;
	stageList = undefined;
	sStageListName = undefined;
	if (IsStageList(itemOrStageList))
	{
		stageList = item;
		sStageListName = sName;
		item = itemOrStageList StageList_GetProceedingStageItem(self);
		sName = item.sName;
	}
	
	if (!C_IGLTYPE::IsDisabled() 
		&& (C_IGLTYPE::IsTrainingRound() 
			|| C_IGLTYPE::IsSinglePlayer() 
			|| C_IGLSTATE::IsPRE()
			|| C_IGLSTATE::IsINStarted()))
		return;
	
	if (!item Item_IsAvailable(self))
		return;
	
	iOldValue = item Item_GetProceeding(self);
	if (iOldValue == item.iMaxValue) // already finished
	{
		if (IsDefined(stageList))
			stageList StageList_RaiseStage(self);	
			
		return;
	}
	else if (iOldValue > item.iMaxValue) // decreasing MaxValue by developer...
	{
		item Item_SetCurrentValue(self, item.iMaxValue);
		if (IsDefined(stageList))
			stageList StageList_RaiseStage(self);		

		return;
	}
	
	iNewValue = Int(Min(iOldValue + iInc, item.iMaxValue));
	self CUpdate(iType, sName, item, stageList, sStageListName, iNewValue);
}

private CUpdate(iType, sName, item, stageList, sStageListName, iNewValue)
{
	// proceed
	item Item_SetCurrentValue(self, iNewValue);
	
	args = IECALLBACK::Args_Create();
	args.sName = sName;
	args.iType = iType;
	args.iIndex = GetItemIndexByName(iType, sName);
	args.item = item;
	args.stageList = stageList;
	args.sStageListName = sStageListName;
	self C_INIT::CH_RunOnCProceeded(args);
	
	self C_IDEBUG::Debug("Challenge " + item.sMenuName + " proceeded", C_IDEBUG::TYPE_INFO);		
	//self IPrintLnBold("^1" + item.sMenuName + " ^7proceeded");
	
	// completed
	if (iNewValue >= item.iMaxValue)
	{
		args IECALLBACK::Args_Reset();
		if (IsDefined(stageList))
		{
			if (stageList StageList_IsCompleted(self))
				args.bIsStageListCompleted = true;
		}
		
		self C_INIT::CH_RunOnCCompleted(args);
		
		self C_IDEBUG::Debug("Challenge " + item.sMenuName + " completed", C_IDEBUG::TYPE_INFO);
		self C_ICMSG::CNotify("CHALLENGE COMPLETED", item.sMenuName);
		self C_ICMSG::SPrintLn(self.name + " ^7has just completed challenge " + item.sMenuName);
		
		if (IsDefined(stageList))
			stageList StageList_RaiseStage(self);
	}
}

public CGetTypeCompletedCurCount(iType)
{
	iCur = 0;
	iCount = GetItemsCount(iType);
	for (iIndex = 0; iIndex < iCount; iIndex++)
	{
		item = CGetItemByIndex(iType, iIndex);
		IEXCEPTION::Undefined(item, "Could not find challenge iType;" + iType + ";iIndex;" + iIndex);
		
		if (item Item_IsCompleted(self))
			iCur++;
			
		//if (iIndex % 10 == 9) // use this if it is too laggy :)
		//	wait 0.05;
	}
	
	return iCur;
}

// ============================================================================= //
#region Map
public MAPGetItemsCount()
{
	if (MAPIsMapSideEnabled())
	{
		if (!IsDefined(level.MCHNamesByIndex))
			return 0;
	
		return level.MCHNamesByIndex.size;
	}
	
	funcs = inputs\challenges\maps::GetMapFuncs(IGAME::GetMap());
	if (!IsDefined(funcs))
		return 0;
		
	return [[funcs["dGetItemsCount"]]]();
}

public MAPGetNameByIndex(iIndex)
{
	if (MAPIsMapSideEnabled())
	{
		if (!IsDefined(level.MCHNamesByIndex))
			return undefined;
			
		return level.MCHNamesByIndex[iIndex];
	}

	funcs = inputs\challenges\maps::GetMapFuncs(IGAME::GetMap());
	if (!IsDefined(funcs))
		return undefined;
		
	return [[funcs["dGetNameByIndex"]]](iIndex);
}

public MAPGetItemOrStageListByName(sName)
{
	if (MAPIsMapSideEnabled())
	{
		if (!IsDefined(level.MCHNamesByIndex))
			return undefined;
			
		return level.MCHItemsOrStageListsByName[sName];
	}
	
	funcs = inputs\challenges\maps::GetMapFuncs(IGAME::GetMap());
	if (!IsDefined(funcs))
		return undefined;
		
	return [[funcs["dGetItemOrStageListByName"]]](sName);
}

public MAPRegItem(item)
{
	item.iType = TYPE_Map;

	if (MAPIsMapSideEnabled())
	{
		if (!IsDefined(level.MCHItemsOrStageListsByName))
			level.MCHItemsOrStageListsByName = [];

		if (!IsDefined(level.MCHNamesByIndex))
			level.MCHNamesByIndex = [];
			
		level.MCHItemsOrStageListsByName[item.sName] = item;
		level.MCHNamesByIndex[level.MCHNamesByIndex.size] = item.sName;
	}
	
	args = IECALLBACK::Args_Create();
	args.item = item;
	C_INIT::MCH_RunInSRegingItem(args);
}

public MAPRegStageList(stageList)
{
	stageList.iType = TYPE_Map;

	if (MAPIsMapSideEnabled())
	{
		if (!IsDefined(level.MCHItemsOrStageListsByName))
			level.MCHItemsOrStageListsByName = [];

		if (!IsDefined(level.MCHNamesByIndex))
			level.MCHNamesByIndex = [];
			
		level.MCHItemsOrStageListsByName[stageList.sName] = stageList;
		foreach (stageItem in stageList.StageItems)
			level.MCHItemsOrStageListsByName[stageItem.sName] = stageItem;
			
		level.MCHNamesByIndex[level.MCHNamesByIndex.size] = stageList.sName;
	}
	
	args = IECALLBACK::Args_Create();
	args.stageList = stageList;
	C_INIT::MCH_RunInSRegingStageList(args);
}

public MAPCCollect(sName, iIdent)
{
	self CCollect(TYPE_Map, sName, iIdent);

	args = IECALLBACK::Args_Create();
	args.sName = sName;
	args.iIdent = iIdent;
	self C_INIT::MCH_RunOnCCollected(args);
}

public MAPCProceed(sName, [iInc])
{
	if (!IsDefined(iInc))
		iInc = 1;

	self CProceed(TYPE_Map, sName, iInc);

	args = IECALLBACK::Args_Create();
	args.sName = sName;
	args.iInc = iInc;
	self C_INIT::MCH_RunOnCProceeded(args);
}

private MAPItem_GetProceeding(pPlayer)
{
	if (!IsDefined(pPlayer.pers["MCHProceedsByName"]))
		pPlayer.pers["MCHProceedsByName"] = [];
		
	if (!IsDefined(pPlayer.pers["MCHProceedsByName"][self.sName]))
		pPlayer.pers["MCHProceedsByName"][self.sName] = 0;
	
	C_IDEBUG::Debug("CH;Getting local map challenge proceeding, add map's challenges to inputs", C_IDEBUG::TYPE_INFO);
	return pPlayer.pers["MCHProceedsByName"][self.sName];
}

private MAPItem_SetProceeding(pPlayer, iValue)
{
	if (!IsDefined(pPlayer.pers["MCHProceedsByName"]))
		pPlayer.pers["MCHProceedsByName"] = [];
		
	C_IDEBUG::Debug("CH;Setting local map challenge proceeding, add map's challenges to inputs", C_IDEBUG::TYPE_INFO);
	pPlayer.pers["MCHProceedsByName"][self.sName] = iValue;
}

public MAPIsMapSideEnabled()
{
	return (C_ISVAR::GetAsBool("DEVEnabled") 
		|| !IsDefined(inputs\challenges\maps::GetMapFuncs(IGAME::GetMap())));
}

#endregion
// ============================================================================= //