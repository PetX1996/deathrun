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

InSPreCaching(args)
{
	if (!C_ISVAR::GetAsBool("DEVDiagnosticsEnabled"))
		return;

	thread FirstRoundStarted();
}

private FirstRoundStarted()
{
	wait 1;
	
	FirstRoundStartedDelayed();
}

private FirstRoundStartedDelayed()
{
	// MapBaseInfo
	LogMapLogicEvent("L", C_IMAPINFO::GetFullName() + ";" 
		+ C_IMAPINFO::GetDifficulty() + ";" 
		+ C_IMAPINFO::GetLength() + ";" 
		+ C_IMAPINFO::IsNew() + ";" 
		+ C_IMAPLIST::IsMapInMapList(IGAME::GetGameType()));
	
	
	// MapSupportInfo
	iCODSpectator = GetEntArray("mp_global_intermission", "classname").size;
	iCODJumpers = GetEntArray("mp_dm_spawn", "classname").size;
	iCODActivator = GetEntArray("mp_tdm_spawn", "classname").size;
	
	iDR1Jumpers = GetEntArray("mp_jumper_spawn", "classname").size;
	iDR1Activator = GetEntArray("mp_activator_spawn", "classname").size;
	
	iDR2Spectator = GetEntArray("dr2_spawn_spectator", "classname").size;
	iDR2Jumpers = GetEntArray("dr2_spawn_jumper", "classname").size;
	iDR2Activator = GetEntArray("dr2_spawn_activator", "classname").size;
	
	iTTCount = 0;
	iTJCount = 0;
	bIsEM = false;
	if (IsDefined(level.TrapTriggers))
		iTTCount = level.TrapTriggers.size;
	if (IsDefined(level.TrapJumperTriggers))
		iTJCount = level.TrapJumperTriggers.size;
	
	if (IsDefined(level.EndMapTrigger))
		bIsEM = true;
	
	LogMapLogicEvent("S", iCODSpectator + ";" + iCODJumpers + ";" + iCODActivator 
		+ ";" + iDR1Jumpers + ";" + iDR1Activator 
		+ ";" + iDR2Spectator + ";" + iDR2Jumpers + ";" + iDR2Activator 
		+ ";" + iTTCount + ";" + iTJCount + ";" + bIsEM);
		
	// MapChInfo
	/*iCount = C_ICCHALLENGES::GetItemsCount(C_ICCHALLENGES::TYPE_Map);
	for (iIndex = 0; iIndex < iCount; iIndex++)
	{
		sName = C_ICCHALLENGES::GetNameByIndex(C_ICCHALLENGES::TYPE_Map, iIndex);
		itemOrStageList = C_ICCHALLENGES::GetItemOrStageListByIndex(C_ICCHALLENGES::TYPE_Map, iIndex);
		if (C_ICCHALLENGES::IsStageList(itemOrStageList))
		{
			sArgs = sName;
			iStagesCount = itemOrStageList C_ICCHALLENGES::StageList_GetStagesCount();
			for (iStage = 0; iStage < iStagesCount; iStage++)
			{
				sItemName = itemOrStageList C_ICCHALLENGES::StageList_GetStageName(iStage);
				item = itemOrStageList C_ICCHALLENGES::StageList_GetStageItem(iStage);
				sArgs += ";" + sItemName + ";" + item.sMenuName + ";" + item.sMenuDescription + ";" + item.iMaxValue;
			}
			LogMapLogicEvent("SS", sArgs);
		}
		else
		{
			LogMapLogicEvent("SI", sName + ";" + itemOrStageList.sMenuName + ";" + itemOrStageList.sMenuDescription + ";" + itemOrStageList.iMaxValue);
		}
	}*/
}

MI_InUpdatingFromMapper(args)
{
	if (!C_ISVAR::GetAsBool("DEVDiagnosticsEnabled"))
		return;

	if (!IGAME::IsFirstRound())
		return;
	
	sMappers = "";
	mappers = C_IMAPINFO::GetCreators();
	mappersNames = C_IMAPINFO::GetCreatorsNames();
	foreach (sMapperName in mappersNames)
		sMappers += sMapperName + ";" + mappers[sMapperName] + ";";
	
	LogMapLogicEvent("M", C_IMAPINFO::GetFullName() + ";" + C_IMAPINFO::GetDifficulty() + ";" + C_IMAPINFO::GetLength() + ";" + sMappers);
}

// ==================================================================================================================================== //
#region MapSupportInfo

ML_OnCTouchedTT(args)
{
	if (!C_ISVAR::GetAsBool("DEVDiagnosticsEnabled"))
		return;

	i = args.TT C_IMLLOGIC::TT_GetIndexInList();
	if (!IsDefined(i))
		i = -1;
		
	LogMapLogicEvent("T", i);
}

ML_OnCTouchedTJ(args)
{
	if (!C_ISVAR::GetAsBool("DEVDiagnosticsEnabled"))
		return;

	i = args.TJ C_IMLLOGIC::TJ_GetIndexInList();
	if (!IsDefined(i))
		i = -1;
		
	LogMapLogicEvent("J", i + ";" + args.iPlace + ";" + args.TJ C_IMLTJ::TJ_GetTouchedTTsCount());
}

ML_OnCTouchedEM(args)
{
	if (!C_ISVAR::GetAsBool("DEVDiagnosticsEnabled"))
		return;

	LogMapLogicEvent("E", args.iPlace);
}

#endregion
// ==================================================================================================================================== //
#region MapChInfo

MCH_InSRegingStageList(args)
{
	if (!C_ISVAR::GetAsBool("DEVDiagnosticsEnabled"))
		return;

	if (!IGAME::IsFirstRound())
		return;	
		
	str = args.stageList.sName + ";";
	foreach (stageItem in args.stageList.StageItems)
	{
		str += "{" + CHGetItemStr(stageItem) + "};";
	}
	LogMapLogicEvent("CS", str);
}

MCH_InSRegingItem(args)
{
	if (!C_ISVAR::GetAsBool("DEVDiagnosticsEnabled"))
		return;

	if (!IGAME::IsFirstRound())
		return;	
	
	LogMapLogicEvent("CI", CHGetItemStr(args.item));
}

MCH_OnCProceeded(args)
{
	if (!C_ISVAR::GetAsBool("DEVDiagnosticsEnabled"))
		return;

	LogMapLogicEvent("CP", args.sName + ";" + args.iInc);
}

MCH_OnCCollected(args)
{
	if (!C_ISVAR::GetAsBool("DEVDiagnosticsEnabled"))
		return;

	LogMapLogicEvent("CC", args.sName + ";" + args.iIdent);
}

private CHGetItemStr(item)
{
	sAccessInfo = "";
	if (IsDefined(item.AccessInfo))
	{
		keys = GetArrayKeys(item.AccessInfo);
		if (keys.size > 0)
		{
			sAccessInfo += "{";
			foreach (iKey in keys)
			{
				accessInfo = item C_ICITEM::Item_GetAccessInfo(iKey);
				bIsFree = accessInfo["bIsFree"];
				if (!IsDefined(bIsFree)) bIsFree = "";
				iRankId = accessInfo["iRankId"];
				if (!IsDefined(iRankId)) iRankId = "";
				iPrestige = accessInfo["iPrestige"];
				if (!IsDefined(iPrestige)) iPrestige = "";
				iChallengeType = accessInfo["iChallengeType"];
				if (!IsDefined(iChallengeType)) iChallengeType = "";
				sChallengeName = accessInfo["sChallengeName"];
				if (!IsDefined(sChallengeName)) sChallengeName = "";
				
				sAccessInfo += "{" + iKey + ";" + bIsFree + ";" + iRankId + ";" + iPrestige + ";" + iChallengeType + ";" + sChallengeName + "};";
			}
			sAccessInfo += "}";
		}
	}
	
	sName = item.sName;
	sMenuName = item.sMenuName;
	sMenuDescription = item.sMenuDescription;
	iMaxValue = item.iMaxValue;
	bIsCollecting = IsDefined(item.bIsCollecting);
	bIsFree = item.bIsFree;
	if (!IsDefined(bIsFree)) bIsFree = "";
	iRankId = item.iRankId;
	if (!IsDefined(iRankId)) iRankId = "";
	iPrestige = item.iPrestige;
	if (!IsDefined(iPrestige)) iPrestige = "";
	iChallengeType = item.iChallengeType;
	if (!IsDefined(iChallengeType)) iChallengeType = "";
	sChallengeName = item.sChallengeName;
	if (!IsDefined(sChallengeName)) sChallengeName = "";	
	iAccessFlag = item.iAccessFlag;
	if (!IsDefined(iAccessFlag)) iAccessFlag = "";		
	
	return sName + ";" 
		+ sMenuName + ";" 
		+ sMenuDescription + ";" 
		+ iMaxValue + ";"
		+ bIsCollecting + ";"
		+ bIsFree + ";"
		+ iRankId + ";"
		+ iPrestige + ";"
		+ iChallengeType + ";"
		+ sChallengeName + ";"
		+ iAccessFlag + ";"
		+ sAccessInfo;
}

#endregion
// ==================================================================================================================================== //
#region MapStatisticInfo

// eInflictor, eAttacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration, bSuicideSilent
DMG_OnCKilled(args)
{
	if (!C_ISVAR::GetAsBool("DEVDiagnosticsEnabled"))
		return;

	if (C_ICDAMAGE::IsSuicideSilent(args)
		|| C_ICDAMAGE::IsAFK(args))
		return;
	
	sAttacker = "";
	if (IsDefined(args.eAttacker) && IsPlayer(args.eAttacker))
		sAttacker = args.eAttacker.name;

	LogMapLogicEvent("D", args.sMeansOfDeath + ";" + args.sWeapon + ";" + sAttacker + ";" + self.name);
}

// iLastScore, iValue, [sType]
RANK_OnCGaveScore(args)
{
	if (!C_ISVAR::GetAsBool("DEVDiagnosticsEnabled"))
		return;

	sType = "";
	if (IsDefined(args.sType))
		sType = args.sType;
		
	LogMapLogicEvent("C", args.iValue + ";" + sType);
}

// eInflictor, eAttacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration, bSuicideSilent, pVictim
DMG_OnCAssisted(args)
{
	if (!C_ISVAR::GetAsBool("DEVDiagnosticsEnabled"))
		return;

	eAttacker = "";
	if (IsDefined(args.eAttacker) && IsPlayer(args.eAttacker))
		eAttacker = args.eAttacker.name;

	LogMapLogicEvent("A", args.sMeansOfDeath + ";" + args.sWeapon + ";" + eAttacker + ";" + args.pVictim.name + ";" + self.name);
}

#endregion
// ==================================================================================================================================== //

MPOP_OnCRatedLeave(args)
{
	if (!C_ISVAR::GetAsBool("DEVDiagnosticsEnabled"))
		return;

	LogMapLogicEvent("RL", C_IMAPPOP::GetCurMapRateSum() + ";" + C_IMAPPOP::GetCurMapRateTimes());
}

MPOP_OnCRatedVote(args)
{
	if (!C_ISVAR::GetAsBool("DEVDiagnosticsEnabled"))
		return;

	LogMapLogicEvent("RV", C_IMAPPOP::GetCurMapRateSum() + ";" + C_IMAPPOP::GetCurMapRateTimes());
}

MUSIC_InSPickingVictory(args)
{
	if (IsDefined(args.Music))
		LogMapLogicEvent("MV", args.Music.sName);
}

MUSIC_InSPickingEOG(args)
{
	if (IsDefined(args.Music))
		LogMapLogicEvent("ME", args.Music.sName);
}

private LogMapLogicEvent(sName, sArgs)
{
	LogEvent("ML", sName, sArgs);
}

private LogEvent(sType, sName, sArgs)
{
	LogPrint("DIAG;" + sType + ";" + sName + ";" + sArgs + "\n");
}