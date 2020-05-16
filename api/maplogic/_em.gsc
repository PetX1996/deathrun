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

public IsEM(obj)
{
	return C_IMLEM::IsEM(obj);
}

public EGetEM()
{
	return self C_IMLEM::EGetEM();
}

public EM_GetTrig()
{
	return self C_IMLEM::EM_GetTrig();
}

public EM_IsAllowed()
{
	return self C_IMLEM::EM_IsAllowed();
}

public EM_GetTouchesList()
{
	return self C_IMLEM::EM_GetTouchesList();
}

public EM_GetTouchesAutoList()
{
	return self C_IMLEM::EM_GetTouchesAutoList();
}


public CTouchEM([eTrig], [bIsActivatedAuto])
{
	// if EM is reged, it has .EM
	em = C_IMLLOGIC::GetEM();
		
	if (!IsDefined(em))
	{
		em = C_IMLEM::EM_Create(eTrig);
		C_IMLLOGIC::AddEM(em);
	}
		
	self C_IMLLOGIC::CTouchEM(em, bIsActivatedAuto);
}

// ================================================================================== //
#region Allow

public AllowEM(bAllow)
{
	return C_IMLLOGIC::AllowEM(bAllow);
}

public IsEMAllowed()
{
	return C_IMLLOGIC::IsEMAllowed();
}

#endregion
// ======================================================================================== //
#region Events

/// bCancel, bAllow
RegEvent_InEMAllowing(dFunc)
{
	IECALLBACK::AddMapEvent("ML_InEMAllowing", dFunc);
}

/// bAllow, bIsSuccessful
RegEvent_OnEMAllowed(dFunc)
{
	IECALLBACK::AddMapEvent("ML_OnEMAllowed", dFunc);
}

/// bCancel, EM, iPlace, bIsTouchedAuto
RegEvent_InCTouchingEM(dFunc)
{
	IECALLBACK::AddMapEvent("ML_InCTouchingEM", dFunc);
}

/// EM, iPlace, bIsTouchedAuto
RegEvent_OnCTouchedEM(dFunc)
{
	IECALLBACK::AddMapEvent("ML_OnCTouchedEM", dFunc);
}

#endregion
// ======================================================================================== //