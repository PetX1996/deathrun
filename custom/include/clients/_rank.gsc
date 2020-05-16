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

// self.pers["participation"] = 0; ??
// self.pers["prestige"] = 0; ??

// LVL 0: unlock challenges for level 0 - 9 
// LVL 0: get x XP -> promote
// LVL 1: get x XP -> promote
// ...
// LVL 9: get x XP
// LVL 9: complete all challenges for level 0 - 9 -> promote
// LVL 10: unlock challenges for level 10 - 19 
// LVL 10: get x XP
// ...
// LVL 99: get x XP
// LVL 99: compelete all challenges for level 90 - 99
// LVL 99: unlock all challenges
// LVL 99: complete all challenges -> promote
// LVL 100: END

// leftxp > 0 -> collecting XP for next lvl
// leftxp == 0 -> collecting XP done

// =============================================================================================== //
#region Static Rank Info

// WARNING!
// if you change this values, check if funcs GetRankIdForXP(iXP), GetRankIdMinXP(iRankId), GetRankIdMaxXP(iRankId) work correctly
// use func DBG_ListRankValues()
public sealed MaxXP = 500000;
public sealed MaxRankId = 100;

public DBG_ListRankValues()
{
	for (i = 0; i < 101; i++)
	{
		iMinXP = custom\include\clients\_rank::GetRankIdMinXP(i);
		iMaxXP = custom\include\clients\_rank::GetRankIdMaxXP(i);
		iBackRankMin = custom\include\clients\_rank::GetRankIdForXP(iMinXP);
		/*while (iBackRankMin < i)
		{
			iMinXP++;
			iBackRankMin = self custom\include\clients\_rank::GetRankIdForXP(iMinXP);
		}*/
		iBackRankMax = custom\include\clients\_rank::GetRankIdForXP(iMaxXP);
		C_IDEBUG::DebugOffline(i + ";iMinXP;" + iMinXP + ";iBackRankMin;" + iBackRankMin + ";iMaxXP;" + iMaxXP + ";iBackRankMax;" + iBackRankMax);
	}
}

/// <summary>
/// Gets RankId for this XP.
/// </summary>
/// <returns>Int</returns>
/// <param name="xp">Int</param>
public GetRankIdForXP(iXP)
{
	if (iXP <= 0)
		return 0;
	else if (iXP >= MaxXP)
		return MaxRankId;
		
	iProbablyRankId = GetProbablyRankIdForXP(iXP);
	iMaxXP = GetRankIdMaxXP(iProbablyRankId);
	if (iXP > iMaxXP)
		return iProbablyRankId + 1;
	else
		return iProbablyRankId;
}

private GetProbablyRankIdForXP(iXP)
{
	cosValue = (iXP / MaxXP) - 1;
	rankId = ((ACos(cosValue) - 180) * MaxRankId) / 90;
	return Int(rankId * (-1));
}

/// <summary>
/// Gets maximum XP for this RankId.
/// </summary>
/// <returns>Int</returns>
/// <param name="rankId">Int</param>
private GetXPForRankId(iRankId)
{
	if (iRankId < 0)
		return 0;

	iRankId += 1;
	angles = ((iRankId * 90) / (MaxRankId + 1)) + 180;
	xp = (Cos(angles) + 1) * MaxXP;
	return Int(xp);
}

public GetRankIdMinXP(iRankId)
{
	if (iRankId <= 0)
		return 0;

	return GetXPForRankId(iRankId - 1) + 1;
}

public GetRankIdMaxXP(iRankId)
{
	if (iRankId >= MaxRankId)
		return MaxXP;

	return GetXPForRankId(iRankId);
}

public GetRankIdName(iRankId)
{
	//return TableLookUpIString("mp/rankicontable.csv", 0, rankId, 2);
	return TableLookUp("mp/ranktable.csv", 0, iRankId, 13);
}

public GetRankIdImage(iRankId)
{
	//return TableLookUpIString("mp/rankicontable.csv", 0, rankId, 2);
	return TableLookUp("mp/rankicontable.csv", 0, iRankId, 1);
}

#endregion
// =============================================================================================== //
#region Giving XP, Score

public CGiveScoreType(sType, [iMultiplicator])
{
	iValue = GetValueForType(sType);
	
	if (IsDefined(iMultiplicator))
		iValue *= iMultiplicator;
		
	self CGiveScore(iValue, sType);
}

public CGiveScore(iValue, [sType])
{
	if (!C_IGLTYPE::IsDisabled() 
		&& (C_IGLTYPE::IsTrainingRound() 
			|| C_IGLTYPE::IsSinglePlayer() 
			|| !C_IGLSTATE::IsIN()))
		return;

	iValue = Int(iValue * C_ISVAR::GetAsFloat("CSMultiplicator"));
	if (iValue == 0)
		return;
	
	args = IECALLBACK::Args_Create();
	args.bCancel = undefined;
	args.iLastScore = self ICPERS::GetPersStat("score");
	args.iValue = iValue;
	args.sType = sType;
	self C_INIT::RANK_RunInCGivingScore(args);
	
	if (IsDefined(args.bCancel) || !IsDefined(args.iValue))
		return;
	
	args.iValue = Int(args.iValue);
	if (args.iValue == 0)
		return;
		
	args IECALLBACK::Args_Reset();
	self C_INIT::RANK_RunOnCGaveScore(args);
}

public CGiveRankXPType(sType, [iMultiplicator])
{
	iValue = GetValueForType(sType);
	
	if (IsDefined(iMultiplicator))
		iValue *= iMultiplicator;
	
	self CGiveRankXP(iValue, sType);
}

public CGiveRankXP(iValue, [sType])
{
	if (!C_IGLTYPE::IsDisabled() 
		&& (C_IGLTYPE::IsTrainingRound() 
			|| C_IGLTYPE::IsSinglePlayer() 
			|| !C_IGLSTATE::IsIN()))
		return;

	iValue = Int(iValue * C_ISVAR::GetAsFloat("CSMultiplicator"));
	if (iValue == 0)
		return;
		
	args = IECALLBACK::Args_Create();
	args.bCancel = undefined;
	args.iLastRankXP = self ICPERS::GetPersStat("rankxp");
	args.iValue = iValue;
	args.sType = sType;
	
	self C_INIT::RANK_RunInCGivingRankXP(args);
	
	if (IsDefined(args.bCancel) || !IsDefined(args.iValue))
		return;
	
	args.iValue = Int(args.iValue);
	if (args.iValue == 0)
		return;
		
	args IECALLBACK::Args_Reset();
	self C_INIT::RANK_RunOnCGaveRankXP(args);
}

public CGiveScoreRankXPType(sType, [iMultiplicator])
{
	self CGiveScoreType(sType, iMultiplicator);
	self CGiveRankXPType(sType, iMultiplicator);
}

public CGiveScoreRankXP(iValue, [sType])
{
	self CGiveScore(iValue, sType);
	self CGiveRankXP(iValue, sType);
}

#endregion
// =============================================================================================== //
#region Stat, Pers Info

public CGetRankXP()
{
	return self ICPERS::GetPersStat("rankxp");
}

public CSetRankXP(iXP)
{
	if (iXP < 0)
		iXP = 0;
		
	self ICPERS::SetPersStat("rankxp", iXP);
	self ICSTAT::SetByName("rankxp_hash", iXP << 16);
	
	if (!self CCheckRankIdForUpdate(iXP))
		self CSetLeftXP(self CGetMaxXP() - iXP);
}

public CIncRankXP(iXP)
{
	self C_IDEBUG::Debug("XP;^1" + iXP + "^7;Total;^1" + self.pers["rankxp"] + "^7;LVL^1;" + self.pers["rank"]);
	self CSetRankXP(self CGetRankXP() + iXP);
}

public CGetRankId()
{
	return self ICPERS::GetPersStat("rank");
}

public CSetRankId(iNewRankId)
{
	iOldRankId = self CGetRankId();	
	if (iNewRankId < 0)	iNewRankId = 0;
	if (iNewRankId > MaxRankId)	iNewRankId = MaxRankId;
	if (iNewRankId == iOldRankId)
		return false;
	
	args = IECALLBACK::Args_Create();
	args.bCancel = undefined;
	args.iOldRankId = iOldRankId;
	args.iNewRankId = iNewRankId;
	self C_INIT::RANK_RunInCSettingRankId(args);
	
	if (args.iNewRankId < 0)	args.iNewRankId = 0;
	if (args.iNewRankId > MaxRankId)	args.iNewRankId = MaxRankId;
	if (IsDefined(args.bCancel) || args.iNewRankId == args.iOldRankId)
		return false;
	
	self CUpdateRank(args.iNewRankId);
	
	args IECALLBACK::Args_Reset();
	self C_INIT::RANK_RunOnCSetRankId(args);
	return true;
}

public CIncRankId()
{
	iNewRankId = self CGetRankId() + 1;
	if (iNewRankId > MaxRankId)
		return false;
		
	self CSetRankXP(self GetRankIdMinXP(iNewRankId));
	self CSetRankId(iNewRankId);
	return true;
}

public CDecRankId()
{
	iNewRankId = self CGetRankId() - 1;
	if (iNewRankId < 0)
		return false;
	
	self CSetRankXP(self GetRankIdMaxXP(iNewRankId) - 1);
	self CSetRankId(iNewRankId);
	return true;
}


public CGetMaxXP()
{
	return self ICPERS::GetPersStat("maxxp");
}

private CSetMaxXP(iXP)
{
	self ICPERS::SetPersStat("maxxp", iXP);
}


public CGetMinXP()
{
	return self ICPERS::GetPersStat("minxp");
}

private CSetMinXP(iXP)
{
	self ICPERS::SetPersStat("minxp", iXP);
}


public CGetLeftXP()
{
	return self ICPERS::GetPersStat("leftxp");
}

private CSetLeftXP(iXP)
{
	self ICPERS::SetPersStat("leftxp", iXP);
}

#endregion
// =============================================================================================== //

private CCheckRankIdForUpdate(iXP)
{
	iNewRankId = GetRankIdForXP(iXP);
	return self CSetRankId(iNewRankId);
}

public CUpdateRank(iRankId)
{
	iRankXP = self CGetRankXP();
	iMinXP = GetRankIdMinXP(iRankId);
	iMaxXP = GetRankIdMaxXP(iRankId);
	
	if (iRankXP < iMinXP)
		iRankXP = iMinXP;
	else if (iRankXP > iMaxXP)
		iRankXP = iMaxXP;
	
	iLeftXP = iMaxXP - iRankXP;
	
	args = IECALLBACK::Args_Create();
	args.iRankXP = iRankXP;
	args.iRankId = iRankId;
	args.iMinXP = iMinXP;
	args.iMaxXP = iMaxXP;
	args.iLeftXP = iLeftXP;
	self C_INIT::RANK_RunInCUpdatingRank(args);
	
	self ICPERS::SetPersStat("rankxp", args.iRankXP);
	self ICSTAT::SetByName("rankxp_hash", args.iRankXP << 16);
	
	self ICPERS::SetPersStat("rank", args.iRankId);
	self ICSTAT::SetByName("rank_hash", args.iRankId << 16);
	
	self ICPERS::SetPersStat("minxp", args.iMinXP);
	self ICPERS::SetPersStat("maxxp", args.iMaxXP);
	self ICPERS::SetPersStat("leftxp", args.iLeftXP);
	
	self SetRank(args.iRankId);
	
	args IECALLBACK::Args_Reset();
	self C_INIT::RANK_RunOnCUpdatedRank(args);
}

public GetValueForType(sType)
{
	return C_ISVAR::GetAsInt("CS" + sType);
}