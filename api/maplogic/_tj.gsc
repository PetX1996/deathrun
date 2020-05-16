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

public IsTJ(obj)
{
	return C_IMLTJ::IsTJ(obj);
}

public EGetTJ()
{
	return self C_IMLTJ::EGetTJ();
}

public TJ_GetTrig()
{
	return self C_IMLTJ::TJ_GetTrig();
}

public TJ_IsAllowed()
{
	return self C_IMLTJ::TJ_IsAllowed();
}

public TJ_GetAssignedTTsList()
{
	return self C_IMLTJ::TJ_GetAssignedTTsList();
}

public TJ_GetTouchesList()
{
	return self C_IMLTJ::TJ_GetTouchesList();
}

public TJ_GetTouchesAutoList()
{
	return self C_IMLTJ::TJ_GetTouchesAutoList();
}

public TJ_GetTouchedTTsCount()
{
	return self C_IMLTJ::TJ_GetTouchedTTsCount();
}


public CTouchTJ([eTrig], [iTJIndex], [bIsActivatedAuto])
{
	tj = undefined;
	
	// if TJ is reged, it has .TJ
	if (IsDefined(eTrig))
		tj = eTrig C_IMLTJ::EGetTJ();

	if (!IsDefined(tj) && IsDefined(iTJIndex))
		tj = C_IMLLOGIC::GetTJByIndex(iTJIndex);
	
	if (!IsDefined(tj))
	{
		tj = C_IMLTJ::TJ_Create(eTrig);
		
		// reg to list
		if (IsDefined(eTrig))
			C_IMLLOGIC::AddTJList(tj);
		else if (IsDefined(iTJIndex))
			C_IMLLOGIC::AddTJList(tj, iTJIndex);
	}
		
	self C_IMLLOGIC::CTouchTJ(tj, bIsActivatedAuto);
}

// ================================================================================== //
#region Allow

public AllowTJs(bAllow)
{
	return C_IMLLOGIC::AllowTJs(bAllow);
}

public TJ_Allow(bAllow)
{
	return C_IMLLOGIC::TJ_Allow(bAllow);
}

public IsTJsAllowed()
{
	return C_IMLLOGIC::IsTJsAllowed();
}

public GetAllowedTJsCount()
{
	return C_IMLLOGIC::GetAllowedTJsCount();
}

#endregion
// ======================================================================================== //
#region Events

/// bCancel, bAllow
RegEvent_InAllowingTJs(dFunc)
{
	IECALLBACK::AddMapEvent("ML_InAllowingTJs", dFunc);
}

/// bAllow, bIsSuccessful
RegEvent_OnAllowedTJs(dFunc)
{
	IECALLBACK::AddMapEvent("ML_OnAllowedTJs", dFunc);
}

/// bCancel, bAllow
RegEvent_InTJAllowing(dFunc)
{
	IECALLBACK::AddMapEvent("ML_InTJAllowing", dFunc);
}

/// bAllow, bIsSuccessful
RegEvent_OnTJAllowed(dFunc)
{
	IECALLBACK::AddMapEvent("ML_OnTJAllowed", dFunc);
}

/// bCancel, TJ, iPlace, bIsTouchedAuto
RegEvent_InCTouchingTJ(dFunc)
{
	IECALLBACK::AddMapEvent("ML_InCTouchingTJ", dFunc);
}

/// TJ, iPlace, bIsTouchedAuto
RegEvent_OnCTouchedTJ(dFunc)
{
	IECALLBACK::AddMapEvent("ML_OnCTouchedTJ", dFunc);
}

#endregion
// ======================================================================================== //