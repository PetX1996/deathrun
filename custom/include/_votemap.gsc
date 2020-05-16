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

public sealed MapMaxCount = 10;

// player.VM_iVoteMapIndex 

// voteMap.VoteMapList
// mapListItem.iMapIndex
// mapListItem.map
// mapListItem.iVotes

// ========================================================================= //
#region Life Cycle

public VoteMap(sMusicName)
{
	voteMap = VoteMap_Create();
	voteMap VoteMap_PickMaps();
	
	voteMap VoteMap_SendDvarsForPlayers(sMusicName);
	voteMap VoteMap_ShowRatingForPlayers();
	
	wait C_ISVAR::GetAsInt("VMRateTime");
	
	voteMap VoteMap_ShowVotingForPlayers();
	
	wait C_ISVAR::GetAsInt("VMTime");
	
	voteMap VoteMap_Finish();
	
	wait C_ISVAR::GetAsInt("VMAfterTime");
}

private VoteMap_SendDvarsForPlayers(sMusicName)
{
	dvarDic = IDIC::Create();
	self VoteMap_BuildDvarList(dvarDic, sMusicName);

	dvars = dvarDic IDIC::ToDicArray();
	
	foreach (player in level.players)
		player C_ICCMD::SendDvars(dvars);
}

private VoteMap_ShowRatingForPlayers()
{
	foreach (p in level.players)
		p OpenMenu(C_ICMENU::GetMenu("votemap"));
}

private VoteMap_ShowVotingForPlayers()
{
	foreach (p in level.players)
		p SetClientDvar("ui_vmV", true); 
}

private VoteMap_BuildDvarList(dvarDic, sMusicName)
{
	for (i = 0; i < self.VoteMapList.iCount; i++)
		self VoteMap_BuildMapDvarList(dvarDic, i, self VoteMap_GetVoteMapListMap(i));
	
	dvarDic IDIC::Add("ui_vmV", false);
	dvarDic IDIC::Add("ui_vmC", self.VoteMapList.iCount);
	dvarDic IDIC::Add("ui_vmA", true);
	dvarDic IDIC::Add("ui_vmS", sMusicName);
	dvarDic IDIC::Add("ui_vmRTime", C_ISVAR::GetAsInt("VMRateTime"));
	dvarDic IDIC::Add("ui_vmTime", C_ISVAR::GetAsInt("VMTime"));
}

private VoteMap_BuildMapDvarList(dvarDic, iLine, map)
{
// "ui_vmM" + i + "N" // sFullName
// "ui_vmM" + i + "P" // iPopularity
// "ui_vmM" + i + "D" // iDifficulty
// "ui_vmM" + i + "L" // iLength
// "ui_vmM" + i + "T" // bIsNew
// "ui_vmM" + i + "V" // sVotes
	
	dvarDic IDIC::Add("ui_vmM" + iLine + "N", map.sFullName);
	dvarDic IDIC::Add("ui_vmM" + iLine + "P", map.iPopularity);
	dvarDic IDIC::Add("ui_vmM" + iLine + "D", map.iDifficulty);
	dvarDic IDIC::Add("ui_vmM" + iLine + "L", map.iLength);
	dvarDic IDIC::Add("ui_vmM" + iLine + "T", map.bIsNew);
	dvarDic IDIC::Add("ui_vmM" + iLine + "V", 0);
}

private CShowMenu(dvarList)
{
	self endon("disconnect");
	
	self C_ICCMD::SendDvars(dvarList);
	self OpenMenu(C_ICMENU::GetMenu("votemap"));
}

public CRegisterVote(iIndex)
{
	voteMap = GetVoteMapStruct();

	if (iIndex >= voteMap.VoteMapList.iCount)
		return;

	if (voteMap VoteMap_RegisterPlayerVote(self, iIndex))
		voteMap VoteMap_UpdateAllVotes();
}

private VoteMap_UpdateAllVotes()
{
	dvarDicArray = [];
	iMaxIndex = 0;
	iMaxVotes = 0;
	for (i = 0; i < self.VoteMapList.iCount; i++)
	{
		iVotes = self VoteMap_GetVoteMapListVotes(i);
		if (iVotes > iMaxVotes)
		{
			iMaxVotes = iVotes;
			iMaxIndex = i;
		}
	}
	
	for (i = 0; i < self.VoteMapList.iCount; i++)
	{
		sVotes = self VoteMap_GetVoteMapListVotes(i);
		if (i == iMaxIndex)
			sVotes = "^1" + sVotes;
		
		dvarDicArray["ui_vmM" + i + "V"] = sVotes;
	}
	
	thread C_ICCMD::SendDvarsToAll(dvarDicArray);
}

private VoteMap_Finish()
{
	iLine = VoteMap_GetWinningMapLine();
	iNextMapIndex = self VoteMap_GetVoteMapListMapIndex(iLine);
	sNextMapName = C_IMAPLIST::GetItemName(iNextMapIndex);
	C_IROTATEMAP::SetNextMap(sNextMapName, iNextMapIndex);
	
	dvarDicArray = [];
	dvarDicArray["ui_vmA"] = false;
	for (i = 0; i < self.VoteMapList.iCount; i++)
	{
		if (i == iLine)
			continue;
			
		dvarDicArray["ui_vmM" + i + "N"] = "";
	}
	thread C_ICCMD::SendDvarsToAll(dvarDicArray);
	
	// IgnoredMaps
	self.IgnoredMaps C_IROTATEMAP::IgnoredMaps_Add(iNextMapIndex);
	self.IgnoredMaps C_IROTATEMAP::IgnoredMaps_Ensure(C_IROTATEMAP::GetIgnoredMapsCount());
	self.IgnoredMaps C_IROTATEMAP::IgnoredMaps_Save();
	
	self VoteMap_SaveForNextVoting();
}


private VoteMap_GetWinningMapLine()
{
	iMax = 0;
	iMaxIndex = 0;
	for (i = 0; i < self.VoteMapList.iCount; i++)
	{
		iVotes = self VoteMap_GetVoteMapListVotes(i);
		if (iVotes > iMax)
		{
			iMax = iVotes;
			iMaxIndex = i;
		}
	}
	
	return iMaxIndex;
}

#endregion
// ========================================================================= //

public VoteMap_Create()
{
	voteMap = SpawnStruct();
	/// if is not enough maps or error during generating map list...
	voteMap.bIsFewMaps = undefined;
	voteMap.iVoteMapListMaxCount = C_ISVAR::GetAsInt("VMMapCount");
	voteMap.VoteMapList = ILIST::Create();
	
	level.VoteMap = voteMap;
	return voteMap;
}

public GetVoteMapStruct()
{
	return level.VoteMap;
}

// ========================================================================= //
#region Voting

public VoteMap_RegisterPlayerVote(pPlayer, iVoteMapIndex)
{
	iLastVoteMapIndex = pPlayer.VM_iVoteMapIndex;
	if (IsDefined(iLastVoteMapIndex))
	{
		if (iLastVoteMapIndex == iVoteMapIndex)
			return false;
	
		iVotes = self VoteMap_GetVoteMapListVotes(iLastVoteMapIndex);
		if (iVotes > 0)
			self VoteMap_SetVoteMapListVotes(iLastVoteMapIndex, iVotes - 1);
	}
	
	pPlayer.VM_iVoteMapIndex = iVoteMapIndex;
	
	iVotes = self VoteMap_GetVoteMapListVotes(iVoteMapIndex);
	self VoteMap_SetVoteMapListVotes(iVoteMapIndex, iVotes + 1);
	
	return true;
}

private VoteMap_GetVoteMapListVotes(iVoteMapIndex)
{
	return (self.VoteMapList ILIST::Get(iVoteMapIndex)).iVotes;
}

private VoteMap_SetVoteMapListVotes(iVoteMapIndex, iVotes)
{
	voteMap = self.VoteMapList ILIST::Get(iVoteMapIndex);
	voteMap.iVotes = iVotes;
}

private VoteMap_GetVoteMapListMap(iVoteMapIndex)
{
	return (self.VoteMapList ILIST::Get(iVoteMapIndex)).map;
}

private VoteMap_GetVoteMapListMapIndex(iVoteMapIndex)
{
	return (self.VoteMapList ILIST::Get(iVoteMapIndex)).iMapIndex;
}

#endregion
// ========================================================================= //
#region Picking Map

public VoteMap_PickMaps()
{
	self.C = SpawnStruct();
	self.C.MapList = ILIST::Create(C_IMAPLIST::GetItemsCount());
	
	if (self.C.MapList.iCount <= self.iVoteMapListMaxCount)
	{
		for (i = 0; i < self.C.MapList.iCount; i++)
		{
			self.C.MapList ILIST::Set(i, C_IMAPLIST::GetItem(i));
			self VoteMap_AddMap(i);
		}
		
		self.bIsFewMaps = true;
		return;
	}
	
	// IgnoredMaps
	self.IgnoredMaps = C_IROTATEMAP::IgnoredMaps_Create();
	ignoredMapList = ILIST::Create();
	ignoredMapList ILIST::AddArray(self.IgnoredMaps C_IROTATEMAP::IgnoredMaps_GetIndexes());

	for (i = 0; i < self.C.MapList.iCount; i++)
	{
		if (ignoredMapList ILIST::Contains(i))
			continue;
			
		self.C.MapList ILIST::Set(i, C_IMAPLIST::GetItem(i));
	}
	
	ignoredMapList = undefined;
	// --
	
	self VoteMap_LoadLastVoting();
	self VoteMap_LoadPopularity();
	
	
	bAny = true;
	for (iLoop = 0; iLoop < self.iVoteMapListMaxCount && !self VoteMap_IsVoteMapFull() && bAny; iLoop++)
	{
		bAny = false;
	
		if (C_ISVAR::GetAsInt("VMAddLast") > iLoop
			&& !self VoteMap_IsVoteMapFull())
		{
			iMapIndex = self VoteMap_GetMapFromLastVoting();
			if (self VoteMap_TryAddMap(iMapIndex, "VMAddLast"))
				bAny = true;
		}

		if (C_ISVAR::GetAsInt("VMAddPopular") > iLoop
			&& !self VoteMap_IsVoteMapFull())
		{
			iMapIndex = self VoteMap_GetRandomMapIndex(::VoteMap_GetPopularMap);
			if (self VoteMap_TryAddMap(iMapIndex, "VMAddPopular"))
				bAny = true;
		}

		if (C_ISVAR::GetAsInt("VMAddUnPopular") > iLoop
			&& !self VoteMap_IsVoteMapFull())
		{
			iMapIndex = self VoteMap_GetRandomMapIndex(::VoteMap_GetUnPopularMap);
			if (self VoteMap_TryAddMap(iMapIndex, "VMAddUnPopular"))
				bAny = true;
		}	

		if (C_ISVAR::GetAsInt("VMAddRated") > iLoop
			&& !self VoteMap_IsVoteMapFull())
		{	
			iMapIndex = self VoteMap_GetRandomMapIndex(::VoteMap_GetRatedMap);
			if (self VoteMap_TryAddMap(iMapIndex, "VMAddRated"))
				bAny = true;
		}
		
		if (C_ISVAR::GetAsInt("VMAddUnRated") > iLoop
			&& !self VoteMap_IsVoteMapFull())
		{	
			iMapIndex = self VoteMap_GetRandomMapIndex(::VoteMap_GetUnRatedMap);
			if (self VoteMap_TryAddMap(iMapIndex, "VMAddUnRated"))
				bAny = true;
		}

		if (C_ISVAR::GetAsInt("VMAddOld") > iLoop
			&& !self VoteMap_IsVoteMapFull())
		{		
			iMapIndex = self VoteMap_GetRandomMapIndex(::VoteMap_GetOldMap);
			if (self VoteMap_TryAddMap(iMapIndex, "VMAddOld"))
				bAny = true;
		}		
		
		if (C_ISVAR::GetAsInt("VMAddNew") > iLoop
			&& !self VoteMap_IsVoteMapFull())
		{
			iMapIndex = self VoteMap_GetRandomNewMap();
			if (self VoteMap_TryAddMap(iMapIndex, "VMAddNew"))
				bAny = true;
		}
		
		if (C_ISVAR::GetAsInt("VMAddHard") > iLoop
			&& !self VoteMap_IsVoteMapFull())
		{		
			iMapIndex = self VoteMap_GetRandomMapIndex(::VoteMap_GetHardMap);
			if (self VoteMap_TryAddMap(iMapIndex, "VMAddHard"))
				bAny = true;
		}
		
		if (C_ISVAR::GetAsInt("VMAddEasy") > iLoop
			&& !self VoteMap_IsVoteMapFull())
		{		
			iMapIndex = self VoteMap_GetRandomMapIndex(::VoteMap_GetEasyMap);
			if (self VoteMap_TryAddMap(iMapIndex, "VMAddEasy"))
				bAny = true;
		}
		
		if (C_ISVAR::GetAsInt("VMAddLong") > iLoop
			&& !self VoteMap_IsVoteMapFull())
		{		
			iMapIndex = self VoteMap_GetRandomMapIndex(::VoteMap_GetLongMap);
			if (self VoteMap_TryAddMap(iMapIndex, "VMAddLong"))
				bAny = true;
		}		
		
		if (C_ISVAR::GetAsInt("VMAddShort") > iLoop
			&& !self VoteMap_IsVoteMapFull())
		{		
			iMapIndex = self VoteMap_GetRandomMapIndex(::VoteMap_GetShortMap);
			if (self VoteMap_TryAddMap(iMapIndex, "VMAddShort"))
				bAny = true;
		}
	}
	
	// if there is not enough map -> fills with random maps
	for (i = 0; i < self.iVoteMapListMaxCount && !self VoteMap_IsVoteMapFull(); i++)
	{
		iMapIndex = self VoteMap_GetRandomMapIndex();
		if (!IsDefined(iMapIndex))
			break;
			
		self VoteMap_AddMap(iMapIndex);
	}
	
	// wrong server settings...
	if (!self VoteMap_IsVoteMapFull())
	{
		self.bIsFewMaps = true;
		C_IDEBUG::Debug("Change svar LRMIgnCount or LRMIgnMapListFraction or fill maplist with more maps!", C_IDEBUG::TYPE_ERROR);
	}

	self.C = undefined;
}

private VoteMap_IsMapAccepted(iMapIndex, map)
{
	if (C_ISVAR::GetAsBool("VMFilterEnabled"))
	{
		if (map.iPopularity > 0)
		{
			if (!C_ISVAR::GetAsBool("VMFilterPopular") && map.iPopularity > 3)
				return false;

			if (!C_ISVAR::GetAsBool("VMFilterUnPopular") && map.iPopularity < 3)
				return false;
		}
		
		iRateTimes = self.C.MapsPopRateTimesList ILIST::Get(iMapIndex);
		if (IsDefined(iRateTimes))
		{
			if (!C_ISVAR::GetAsBool("VMFilterRated") && iRateTimes > self.C.fPopRateTimesAvg)
				return false;

			if (!C_ISVAR::GetAsBool("VMFilterUnRated") && iRateTimes < self.C.fPopRateTimesAvg)
				return false;	
		}
		
		if (!C_ISVAR::GetAsBool("VMFilterOld") && !map.bIsNew)
			return false;
		
		if (!C_ISVAR::GetAsBool("VMFilterNew") && map.bIsNew)
			return false;
			
		if (!C_ISVAR::GetAsBool("VMFilterHard") && map.iDifficulty > 3)
			return false;

		if (!C_ISVAR::GetAsBool("VMFilterEasy") && map.iDifficulty < 3)
			return false;

		if (!C_ISVAR::GetAsBool("VMFilterLong") && map.iLength > 3)
			return false;

		if (!C_ISVAR::GetAsBool("VMFilterShort") && map.iLength < 3)
			return false;
	}
	
	return true;
}

private VoteMap_GetRandomMapIndex([dPredicate], [iRndStart], [iRndEnd])
{
	if (!IsDefined(iRndStart))
		iRndStart = 0;
	if (!IsDefined(iRndEnd))
		iRndEnd = self.C.MapList.iCount;

	r = RandomIntRange(iRndStart, iRndEnd);
	for (iLoopCounter = 0; iLoopCounter < self.C.MapList.iCount; iLoopCounter++)
	{
		map = self.C.MapList ILIST::Get(r);
		if (IsDefined(map)
			&& self VoteMap_IsMapAccepted(r, map))
		{
			if (!IsDefined(dPredicate) 
				|| self [[dPredicate]](r, map))
				return r;
		}
	
		r++;
		if (r >= self.C.MapList.iCount)
			r = 0;
	}
	
	return undefined;
}

private VoteMap_GetOldMap(iMapIndex, map)
{
	return (!map.bIsNew);
}

private VoteMap_GetRandomNewMap()
{
	// new maps are probably at the end of the list
	// -> find first new map -> gets from range (first, last)
	iFirstI = undefined;
	for (i = self.C.MapList.iCount - 1; i >= 0; i--)
	{
		map = self.C.MapList ILIST::Get(i);
		if (IsDefined(map) 
			&& self VoteMap_IsMapAccepted(i, map))
		{
			if (map.bIsNew)
				iFirstI = i;
			else
				break;
		}
	}
	
	if (!IsDefined(iFirstI))
		return undefined;

	return self VoteMap_GetRandomMapIndex(::VoteMap_GetNewMap, iFirstI);
}

private VoteMap_GetNewMap(iMapIndex, map)
{
	return (map.bIsNew);
}

private VoteMap_GetHardMap(iMapIndex, map)
{
	return (map.iDifficulty >= 3);
}

private VoteMap_GetEasyMap(iMapIndex, map)
{
	return (map.iDifficulty <= 3);
}

private VoteMap_GetLongMap(iMapIndex, map)
{
	return (map.iLength >= 3);
}

private VoteMap_GetShortMap(iMapIndex, map)
{
	return (map.iLength <= 3);
}

private VoteMap_IsVoteMapFull()
{
	return (self.VoteMapList.iCount >= self.iVoteMapListMaxCount);
}

private VoteMap_TryAddMap(iMapIndex, [sType])
{
	if (!IsDefined(iMapIndex) 
		|| self VoteMap_IsVoteMapFull())
		return false;
	
	C_IDEBUG::Debug("VM;" + self.VoteMapList.iCount + ";" + sType + ";" + iMapIndex + ";" + C_IMAPLIST::GetItemName(iMapIndex));
	self VoteMap_AddMap(iMapIndex);
	return true;
}

private VoteMap_AddMap(iMapIndex)
{
	item = SpawnStruct();
	item.iMapIndex = iMapIndex;
	item.map = self.C.MapList ILIST::Get(iMapIndex);
	item.iVotes = 0;
	self.VoteMapList ILIST::Add(item);
	
	self.C.MapList ILIST::Set(iMapIndex, undefined);
}

#endregion
// ============================================================================== //
#region MapFromLastVoting

private VoteMap_GetMapFromLastVoting()
{
	for (; self.C.iLastVotingListIndex < self.C.LastVotingList.iCount; self.C.iLastVotingListIndex++)
	{
		iMapIndex = self.C.LastVotingList ILIST::Get(self.C.iLastVotingListIndex);
		map = self.C.MapList ILIST::Get(iMapIndex);
		if (!IsDefined(map) 
			|| !self VoteMap_IsMapAccepted(iMapIndex, map))
			continue;
	
		self.C.iLastVotingListIndex++;
		return iMapIndex;
	}

	return undefined;
}

private VoteMap_LoadLastVoting()
{
	self.C.iLastVotingListIndex = 0;
	self.C.LastVotingList = ILIST::Create();

	sValue = GetDvar("vmMapsFromLastVoting");
	if (sValue != "")
	{
		toks = StrTok(sValue, ";");
		for (i = 0; i < toks.size; i++)
		{
			if (toks[i] != "")
			{
				iMapIndex = Int(toks[i]);
				if (iMapIndex < self.C.MapList.iCount)
					self.C.LastVotingList ILIST::Add(iMapIndex);
			}
		}
	}
}

public VoteMap_SaveForNextVoting()
{
	if (C_ISVAR::GetAsInt("VMAddLast") <= 0)
		return;

	self.VoteMapList ILIST::Sort(::CompareMapVotes);
		
	str = "";
	for (i = 1; i < self.VoteMapList.iCount; i++)
		str += self VoteMap_GetVoteMapListMapIndex(i) + ";";
		
	SetDvar("vmMapsFromLastVoting", str);
}

private CompareMapVotes(mA, mB)
{
	if (mA.iVotes > mB.iVotes)
		return -1;
	else if (mA.iVotes < mB.iVotes)
		return 1;
	else
		return 0;
}

#endregion
// ================================================================================ //
#region PopularMaps

private VoteMap_LoadPopularity()
{
	iRateTimesSum = 0;
	iCount = 0;

	self.C.MapsPopRateTimesList = ILIST::Create(self.C.MapList.iCount);
	
	for (i = 0; i < self.C.MapList.iCount; i++)
	{
		map = self.C.MapList ILIST::Get(i);
		if (!IsDefined(map)) // already added or ignored
			continue;
		
		sMapName = C_IMAPLIST::GetItemName(i);
		popInfo = C_IMAPPOP::POP_Get(sMapName);
		fPop = popInfo C_IMAPPOP::POP_GetPopularity();
		iRateTimes = popInfo C_IMAPPOP::POP_GetRateTimes();
		
		map.iPopularity = IMATH::Round(fPop);
		self.C.MapsPopRateTimesList ILIST::Set(i, iRateTimes);
		
		iRateTimesSum += iRateTimes;
		iCount++;
	}
	
	self.C.fPopRateTimesAvg = 0;
	if (iCount > 0)
	{
		self.C.fPopRateTimesAvg = iRateTimesSum / iCount;
		
		
		// hides map's popularity for maps with few votes
		fMinRateTimesToShow = (self.C.fPopRateTimesAvg / 2);
		for (i = 0; i < self.C.MapList.iCount; i++)
		{
			map = self.C.MapList ILIST::Get(i);
			if (!IsDefined(map)) // already added or ignored
				continue;
			
			iRateTimes = self.C.MapsPopRateTimesList ILIST::Get(i);
			if (iRateTimes < fMinRateTimesToShow)
				map.iPopularity = 0;
		}	
	}
}

private VoteMap_GetPopularMap(iMapIndex, map)
{
	return (map.iPopularity >= 3);
}

private VoteMap_GetUnPopularMap(iMapIndex, map)
{
	return (map.iPopularity <= 3);
}

private VoteMap_GetRatedMap(iMapIndex, map)
{
	iRateTimes = self.C.MapsPopRateTimesList ILIST::Get(iMapIndex);
	return (IsDefined(iRateTimes) && iRateTimes >= self.C.fPopRateTimesAvg);
}

private VoteMap_GetUnRatedMap(iMapIndex, map)
{
	iRateTimes = self.C.MapsPopRateTimesList ILIST::Get(iMapIndex);
	return (IsDefined(iRateTimes) && iRateTimes <= self.C.fPopRateTimesAvg);
}

#endregion
// ================================================================================ //