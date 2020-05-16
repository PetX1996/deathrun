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

public IsTT(obj)
{
	return C_IMLTT::IsTT(obj);
}

public EGetTT()
{
	return self C_IMLTT::EGetTT();
}

public TT_GetTrig()
{
	return self C_IMLTT::TT_GetTrig();
}

public TT_IsAllowed()
{
	return self C_IMLTJ::TJ_IsAllowed();
}

public TT_GetAssignedTJ()
{
	return self C_IMLTT::TT_GetAssignedTJ();
}

public TT_IsTouched()
{
	return self C_IMLTT::TT_IsTouched();
}

public TT_IsTouchedAuto()
{
	return self C_IMLTT::TT_IsTouchedAuto();
}

public TT_GetToucher()
{
	return self C_IMLTT::TT_GetToucher();
}


public GetActivatedTTsCount()
{
	return C_IMLLOGIC::GetActivatedTTsCount();
}

public IsAnyTTActivated()
{
	return C_IMLLOGIC::IsAnyTTActivated();
}


public CTouchTT([eTrig], [iTTIndex], [bIsActivatedAuto])
{
	tt = undefined;
	
	// if TT is reged, it has .TT
	if (IsDefined(eTrig))
		tt = eTrig C_IMLTT::EGetTT();

	if (!IsDefined(tt) && IsDefined(iTTIndex))
		tt = C_IMLLOGIC::GetTTByIndex(iTTIndex);
	
	if (!IsDefined(tt))
	{
		tt = C_IMLTT::TT_Create(eTrig);
		
		// reg to list
		if (IsDefined(iTTIndex))
			C_IMLLOGIC::AddTTList(tt, iTTIndex);
		else if (IsDefined(eTrig))
			C_IMLLOGIC::AddTTList(tt);
	}
		
	self C_IMLLOGIC::CTouchTT(tt, bIsActivatedAuto);
}

// ================================================================================== //
#region Allow

public AllowTTs(bAllow)
{
	return C_IMLLOGIC::AllowTTs(bAllow);
}

public TT_Allow(bAllow)
{
	return C_IMLLOGIC::TT_Allow(bAllow);
}

public IsTTsAllowed()
{
	return C_IMLLOGIC::IsTTsAllowed();
}

public GetAllowedTTsCount()
{
	return C_IMLLOGIC::GetAllowedTTsCount();
}

#endregion
// ======================================================================================== //
#region Events

/// bCancel, bAllow
RegEvent_InAllowingTTs(dFunc)
{
	IECALLBACK::AddMapEvent("ML_InAllowingTTs", dFunc);
}

/// bAllow, bIsSuccessful
RegEvent_OnAllowedTTs(dFunc)
{
	IECALLBACK::AddMapEvent("ML_OnAllowedTTs", dFunc);
}

/// bCancel, bAllow
RegEvent_InTTAllowing(dFunc)
{
	IECALLBACK::AddMapEvent("ML_InTTAllowing", dFunc);
}

/// bAllow, bIsSuccessful
RegEvent_OnTTAllowed(dFunc)
{
	IECALLBACK::AddMapEvent("ML_OnTTAllowed", dFunc);
}

/// bCancel, TT, bIsTouchedAuto
RegEvent_InCTouchingTT(dFunc)
{
	IECALLBACK::AddMapEvent("ML_InCTouchingTT", dFunc);
}

/// TT, bIsTouchedAuto
RegEvent_OnCTouchedTT(dFunc)
{
	IECALLBACK::AddMapEvent("ML_OnCTouchedTT", dFunc);
}

#endregion
// ======================================================================================== //