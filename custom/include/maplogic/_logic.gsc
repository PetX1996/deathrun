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

/// dr2_t_I
public sealed iPriorTargetName = 0;
/// level.TrapTriggers
public sealed iPriorTTList = 1;
/// mapper\_maplogic::RegTT()
public sealed iPriorMapScript = 2;
public sealed iPriorMapFixer = 3;

public GetConnectedTJ(eTT)
{
	sTJTargetName = eTT.target;
	if (IsDefined(sTJTargetName))
	{
		eTJ = GetEntArray(sTJTargetName, "targetname")[0];
		// is it really trigger? or any brush connected with trap?
		if (IsDefined(eTJ) && IsSubStr(eTJ.classname, "trigger"))
			return eTJ;
	}
	
	return undefined;
}

public RegConnectedTJsWithoutTT(eTJ, iPrior)
{
	sTJTargetName = eTJ.target;
	if (IsDefined(sTJTargetName))
	{
		eTJ = GetEntArray(sTJTargetName, "targetname")[0];
		// is it really trigger? or any brush connected with trap?
		if (IsDefined(eTJ) && IsSubStr(eTJ.classname, "trigger"))
		{
			RegTJWithoutTT(eTJ, iPrior);
			RegConnectedTJsWithoutTT(eTJ, iPrior);
		}
	}
}


public InitTTnTJList()
{
	level.ML_TTList = ILIST::Create();
	level.ML_TJList = ILIST::Create();
	
	level.ML_iDisabledTTsCount = 0;
	level.ML_iDisabledTJsCount = 0;
}

public InitEM()
{
	level.ML_EM = undefined;
}

public AddTTList(tt, [iTTIndex])
{
	if (!IsDefined(iTTIndex)) iTTIndex = level.ML_TTList.iCount;
	
	tt._iTTListIndex = iTTIndex;

	level.ML_TTList ILIST::Set(iTTIndex, tt);
}

public TT_GetIndexInList()
{
	return self._iTTListIndex;
}

public AddTJList(tj, [iTJIndex])
{
	if (!IsDefined(iTJIndex)) iTJIndex = level.ML_TJList.iCount;
	
	tj._iTJListIndex = iTJIndex;
	level.ML_TJList ILIST::Set(iTJIndex, tj);
}

public TJ_GetIndexInList()
{
	return self._iTJListIndex;
}

public AddEM(em)
{
	level.ML_EM = em;
}

public GetTTList()
{
	return level.ML_TTList ILIST::CreateCopy();
}

public GetTTByIndex(iTTIndex)
{
	return level.ML_TTList ILIST::Get(iTTIndex);
}

public GetTJList()
{
	return level.ML_TJList ILIST::CreateCopy();
}

public GetTJByIndex(iTJIndex)
{
	return level.ML_TJList ILIST::Get(iTJIndex);
}

public GetEM()
{
	return level.ML_EM;
}

private FindInTTListByTrig(eTrig)
{
	for (i = 0; i < level.ML_TTList.iCount; i++)
	{
		tt = level.ML_TTList ILIST::Get(i);
		eTTTrig = tt C_IMLTT::TT_GetTrig();
		if (IsDefined(eTTTrig) && eTTTrig == eTrig)
			return tt;
	}
	return undefined;
}

private FindInTJListByTrig(eTrig)
{
	for (i = 0; i < level.ML_TJList.iCount; i++)
	{
		tj = level.ML_TJList ILIST::Get(i);
		eTJTrig = tj C_IMLTJ::TJ_GetTrig();
		if (IsDefined(eTJTrig) && eTJTrig == eTrig)
			return tj;
	}
	return undefined;
}

public GetTTnTJPrior()
{
	if (!IsDefined(level.ML_iTTnTJPrior))
		return -1;
		
	return level.ML_iTTnTJPrior;
}

public SetTTnTJPrior(iPrior)
{
	level.ML_iTTnTJPrior = iPrior;
}

public RegTT(eTrig, iPrior)
{
	if (!IsDefined(level.ML_iTTnTJPrior)
		|| iPrior > level.ML_iTTnTJPrior)
	{
		level.ML_iTTnTJPrior = iPrior;
		InitTTnTJList();
	}
	else if (iPrior < level.ML_iTTnTJPrior)
		return;
		
	LogPrint("eTrig.targetname;" + eTrig.targetname + "\n");
		
	IEXCEPTION::InvalidOperation((!IsDefined(eTrig C_IMLTT::EGetTT()) && !IsDefined(eTrig C_IMLTJ::EGetTJ()) && !IsDefined(eTrig C_IMLEM::EGetEM())), 
		"MAPLOGIC - TT with targetname '" + eTrig.targetname + "' has been already added");
		
	tt = C_IMLTT::TT_Create(eTrig);
	AddTTList(tt);
}

public RegTJ(eTrig, iPrior)
{
	if (!IsDefined(level.ML_iTTnTJPrior)
		|| iPrior > level.ML_iTTnTJPrior)
	{
		level.ML_iTTnTJPrior = iPrior;
		InitTTnTJList();
	}
	else if (iPrior < level.ML_iTTnTJPrior)
		return;
		
	IEXCEPTION::InvalidOperation(!IsDefined(eTrig C_IMLTT::EGetTT()) && !IsDefined(eTrig C_IMLEM::EGetEM()), 
		"MAPLOGIC - TJ with targetname '" + eTrig.targetname + "' has been already added as TT or EM");
		
	tj = FindInTJListByTrig(eTrig);
	if (!IsDefined(tj))
	{
		tj = C_IMLTJ::TJ_Create(eTrig);
		AddTJList(tj);
	}
	
	lastTT = level.ML_TTList ILIST::Get(level.ML_TTList.iCount - 1);
	IEXCEPTION::InvalidOperation(!IsDefined(lastTT C_IMLTT::TT_GetAssignedTJ()), "MAPLOGIC - TT with targetname '" + (lastTT C_IMLTT::TT_GetTrig()).targetname + "' has already had assigned TJ");
	
	IEXCEPTION::InvalidOperation(!(tj C_IMLTJ::TJ_GetAssignedTTsList()) ILIST::Contains(lastTT), 
		"MAPLOGIC - TJ with targetname '" + eTrig.targetname 
			+ "' has registered 2 same TTs with targetname '" + (lastTT C_IMLTT::TT_GetTrig()).targetname + "'");
			
	(tj C_IMLTJ::TJ_GetAssignedTTsList()) ILIST::Add(lastTT);
	lastTT C_IMLTT::TT_SetAssignedTJ(tj);
}

public RegTJWithoutTT(eTrig, iPrior)
{
	if (!IsDefined(level.ML_iTTnTJPrior)
		|| iPrior > level.ML_iTTnTJPrior)
	{
		level.ML_iTTnTJPrior = iPrior;
		InitTTnTJList();
	}
	else if (iPrior < level.ML_iTTnTJPrior)
		return;
		
	IEXCEPTION::InvalidOperation(!IsDefined(eTrig C_IMLTT::EGetTT()) && !IsDefined(eTrig C_IMLTJ::EGetTJ()) && !IsDefined(eTrig C_IMLEM::EGetEM()), 
		"MAPLOGIC - TJ with targetname '" + eTrig.targetname + "' has been already added");
		
	tj = C_IMLTJ::TJ_Create(eTrig);
	AddTJList(tj);
}

public GetEMPrior()
{
	if (!IsDefined(level.ML_iEMPrior))
		return -1;

	return level.ML_iEMPrior;
}

public SetEMPrior(iPrior)
{
	level.ML_iEMPrior = iPrior;
}

public RegEM(eTrig, iPrior)
{
	if (!IsDefined(level.ML_iEMPrior)
		|| iPrior > level.ML_iEMPrior)
	{
		level.ML_iEMPrior = iPrior;
		InitEM();
	}
	else if (iPrior < level.ML_iEMPrior)
		return;
		
	IEXCEPTION::InvalidOperation(!IsDefined(eTrig C_IMLTT::EGetTT()) && !IsDefined(eTrig C_IMLTJ::EGetTJ()) && !IsDefined(eTrig C_IMLEM::EGetEM()), 
		"MAPLOGIC - EM with targetname '" + eTrig.targetname + "' has been already added");
		
	em = C_IMLEM::EM_Create(eTrig);
	AddEM(em);
}

// ================================================================================ //
#region Allow

public IsTTsAllowed()
{
	return !IsDefined(level.ML_uIsTTsDisabled)
		|| (level.ML_iDisabledTTsCount >= level.ML_TTList.iCount);
}

public GetAllowedTTsCount()
{
	return level.ML_TTList.iCount - level.ML_iDisabledTTsCount;
}

public AllowTTs(bAllow)
{
	bIsSuccessful = false;

	args = IECALLBACK::Args_Create();
	args.bCancel = false;
	args.bAllow = bAllow;
	C_INIT::ML_RunInAllowingTTs(args);
	
	if (ITYPE::UBoolToBool(args.bCancel))
		return bIsSuccessful;
		
	bAllow = args.bAllow;
	
	for (i = 0; i < level.ML_TTList.iCount; i++)
	{
		tt = level.ML_TTList ILIST::Get(i);
		tt C_IMLTT::TT_Allow(bAllow);
	}

	if (bAllow)
		level.ML_iDisabledTTsCount = 0;
	else
		level.ML_iDisabledTTsCount = level.ML_TTList.iCount;
	
	bIsSuccessful = (ITYPE::UBoolToBool(level.ML_uIsTTsDisabled) == bAllow);
	level.ML_uIsTTsDisabled = ITYPE::BoolToUBool(bAllow);
	
	args IECALLBACK::Args_Reset();
	args.bIsSuccessful = bIsSuccessful;
	C_INIT::ML_RunOnAllowedTJs(args);
	
	return bIsSuccessful;
}

public TT_Allow(bAllow)
{
	bIsSuccessful = false;
	if (!IsDefined(self TT_GetIndexInList()))
		return bIsSuccessful;
		
	args = IECALLBACK::Args_Create();
	args.bCancel = false;
	args.bAllow = bAllow;
	self C_INIT::ML_RunInTTAllowing(args);
	
	if (ITYPE::UBoolToBool(args.bCancel))
		return bIsSuccessful;
		
	bAllow = args.bAllow;
		
	if (self C_IMLTT::TT_Allow(bAllow))
	{
		if (bAllow)
			level.ML_iDisabledTTsCount--;
		else
			level.ML_iDisabledTTsCount++;
			
		bIsSuccessful = true;
	}
	
	args = IECALLBACK::Args_Reset();
	args.bIsSuccessful = bIsSuccessful;
	self C_INIT::ML_RunOnTTAllowed(args);
	
	return bIsSuccessful;
}


public IsTJsAllowed()
{
	return !IsDefined(level.ML_uIsTJsDisabled)
		|| (level.ML_iDisabledTJsCount >= level.ML_TJList.iCount);
}

public GetAllowedTJsCount()
{
	return level.ML_TJList.iCount - level.ML_iDisabledTJsCount;
}

public AllowTJs(bAllow)
{
	bIsSuccessful = false;

	args = IECALLBACK::Args_Create();
	args.bCancel = false;
	args.bAllow = bAllow;
	C_INIT::ML_RunInAllowingTJs(args);
	
	if (ITYPE::UBoolToBool(args.bCancel))
		return bIsSuccessful;
		
	bAllow = args.bAllow;
	
	for (i = 0; i < level.ML_TJList.iCount; i++)
	{
		tj = level.ML_TJList ILIST::Get(i);
		tj C_IMLTJ::TJ_Allow(bAllow);
	}

	if (bAllow)
		level.ML_iDisabledTJsCount = 0;
	else
		level.ML_iDisabledTJsCount = level.ML_TJList.iCount;
	
	bIsSuccessful = (ITYPE::UBoolToBool(level.ML_uIsTJsDisabled) == bAllow);
	level.ML_uIsTJsDisabled = ITYPE::BoolToUBool(bAllow);
	
	args IECALLBACK::Args_Reset();
	args.bIsSuccessful = bIsSuccessful;
	C_INIT::ML_RunOnAllowedTJs(args);
	
	return bIsSuccessful;
}

public TJ_Allow(bAllow)
{
	bIsSuccessful = false;
	if (!IsDefined(self TJ_GetIndexInList()))
		return bIsSuccessful;
		
	args = IECALLBACK::Args_Create();
	args.bCancel = false;
	args.bAllow = bAllow;
	self C_INIT::ML_RunInTJAllowing(args);
	
	if (ITYPE::UBoolToBool(args.bCancel))
		return bIsSuccessful;
		
	bAllow = args.bAllow;
		
	if (self C_IMLTJ::TJ_Allow(bAllow))
	{
		if (bAllow)
			level.ML_iDisabledTJsCount--;
		else
			level.ML_iDisabledTJsCount++;
			
		bIsSuccessful = true;
	}
	
	args = IECALLBACK::Args_Reset();
	args.bIsSuccessful = bIsSuccessful;
	self C_INIT::ML_RunOnTJAllowed(args);
	
	return bIsSuccessful;
}


public IsEMAllowed()
{
	return !IsDefined(level.ML_uIsEMDisabled);
}

public AllowEM(bAllow)
{
	bIsSuccessful = false;

	args = IECALLBACK::Args_Create();
	args.bCancel = false;
	args.bAllow = false;
	self C_INIT::ML_RunInEMAllowing(args);

	if (ITYPE::UBoolToBool(args.bCancel))
		return bIsSuccessful;
	
	bAllow = args.bAllow;
	
	if (IsDefined(level.ML_EM))
	{
		if (level.ML_EM C_IMLEM::EM_Allow(bAllow))
			bIsSuccessful = true;
	}
	
	bIsSuccessful = (ITYPE::UBoolToBool(level.ML_uIsEMDisabled) == bAllow);
	level.ML_uIsEMDisabled = ITYPE::BoolToUBool(bAllow);
	
	args IECALLBACK::Args_Reset();
	args.bIsSuccessful = bIsSuccessful;
	self C_INIT::ML_RunOnEMAllowed(args);
	
	return bIsSuccessful;
}

#endregion
// ================================================================================ //
#region Touching

public CTouchTT(tt, [bIsTouchedAuto])
{
	if (!IsDefined(bIsTouchedAuto))	bIsTouchedAuto = false;

	if (!IsTTsAllowed() || !tt C_IMLTT::TT_IsAllowed())
		return false;
	
	if (tt C_IMLTT::TT_IsTouched()
		|| tt C_IMLTT::TT_IsTouchedAuto())
		return false;
	
	// callbacks
	args = IECALLBACK::Args_Create();
	args.TT = tt;
	args.bIsTouchedAuto = bIsTouchedAuto;
	args.bCancel = undefined;
	
	
	self C_INIT::ML_RunInCTouchingTT(args);
	if (IsDefined(args.bCancel) && args.bCancel)
		return false;
	
	
	if (!IsDefined(level.ML_iActivatedTTs)) level.ML_iActivatedTTs = 0;
	level.ML_iActivatedTTs++;
	
	assignedTJ = tt C_IMLTT::TT_GetAssignedTJ();
	if (IsDefined(assignedTJ))
		assignedTJ C_IMLTJ::TJ_IncTouchedTTs(1);
	
	tt C_IMLTT::TT_Touch(args.bIsTouchedAuto, self);
	
	eTTTrig = tt C_IMLTT::TT_GetTrig();
	if (IsDefined(args.bIsTouchedAuto) && args.bIsTouchedAuto
		&& IsDefined(eTTTrig))
		eTTTrig notify("trigger", self);
	
	args IECALLBACK::Args_Reset();
	self C_INIT::ML_RunOnCTouchedTT(args);
	return true;
}

public CTouchTJ(tj, [bIsTouchedAuto])
{
	if (!IsDefined(bIsTouchedAuto))	bIsTouchedAuto = false;

	if (!IsTJsAllowed() || !tj C_IMLTJ::TJ_IsAllowed())
		return false;

	if (self.pers["team"] != "allies")
		return false;
	
	if ((tj C_IMLTJ::TJ_GetTouchesAutoList()) ILIST::Contains(self)
		|| (tj C_IMLTJ::TJ_GetTouchesList()) ILIST::Contains(self))
		return false;
		
		
	// callbacks
	args = IECALLBACK::Args_Create();
	args.TJ = tj;
	args.iPlace = (tj C_IMLTJ::TJ_GetTouchesAutoList()).iCount + (tj C_IMLTJ::TJ_GetTouchesList()).iCount;
	args.bIsTouchedAuto = bIsTouchedAuto;
	args.bCancel = undefined;
	
	self C_INIT::ML_RunInCTouchingTJ(args);
	if (IsDefined(args.bCancel) && args.bCancel)
		return false;
	
	
	if (IsDefined(args.bIsTouchedAuto) && args.bIsTouchedAuto)
	{
		(tj C_IMLTJ::TJ_GetTouchesAutoList()) ILIST::Add(self);
		
		eTrig = tj C_IMLTJ::TJ_GetTrig();
		if (IsDefined(eTrig))
			eTrig notify("trigger", self);
	}
	else
		(tj C_IMLTJ::TJ_GetTouchesList()) ILIST::Add(self);
	
	args IECALLBACK::Args_Reset();
	self C_INIT::ML_RunOnCTouchedTJ(args);
	return true;
}

public CTouchEM(em, [bIsTouchedAuto])
{
	if (!IsDefined(bIsTouchedAuto))	bIsTouchedAuto = false;

	if (!IsEMAllowed() || !em C_IMLEM::EM_IsAllowed())
		return false;

	if (self.pers["team"] != "allies")
		return false;

	if (em C_IMLEM::EM_GetTouchesAutoList() ILIST::Contains(self)
		|| em C_IMLEM::EM_GetTouchesList() ILIST::Contains(self))
		return false;
		
		
	// callbacks
	args = IECALLBACK::Args_Create();
	args.EM = em;
	args.iPlace = (em C_IMLEM::EM_GetTouchesAutoList()).iCount + (em C_IMLEM::EM_GetTouchesList()).iCount;
	args.bIsTouchedAuto = bIsTouchedAuto;
	args.bCancel = undefined;
	
	
	self C_INIT::ML_RunInCTouchingEM(args);
	if (IsDefined(args.bCancel) && args.bCancel)
		return false;
	
	
	if (IsDefined(args.bIsTouchedAuto) && args.bIsTouchedAuto)
	{
		(em C_IMLEM::EM_GetTouchesAutoList()) ILIST::Add(self);
		
		eTrig = em C_IMLEM::EM_GetTrig();
		if (IsDefined(eTrig))
			eTrig notify("trigger", self);
	}
	else
		(em C_IMLEM::EM_GetTouchesList()) ILIST::Add(self);

	
	self C_ICMSG::CPrintLnBold(C_ILOCALIZE::MLFinished, ISTRING::GetOrdinalStr(args.iPlace + 1));
	C_ICMSG::SPrintLn(C_ILOCALIZE::MLFinishedAll, ISTRING::GetOrdinalStr(args.iPlace + 1), self.name);
	
	
	args IECALLBACK::Args_Reset();
	self C_INIT::ML_RunOnCTouchedEM(args);
	return true;
}

#endregion
// ================================================================================ //

public GetActivatedTTsCount()
{
	if (!IsDefined(level.ML_iActivatedTTs))
		return 0;
		
	return level.ML_iActivatedTTs;
}

public IsAnyTTActivated()
{
	return IsDefined(level.ML_iActivatedTTs) && level.ML_iActivatedTTs > 0;
}