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

public TT_Create([eTrig])
{
	tt = SpawnStruct();
	tt._bIsTT = true;

	if (IsDefined(eTrig))
	{
		tt._eTrig = eTrig;
		tt._eTrig._TT = tt;
		
		if (!IsDefined(tt._eTrig.vStartOrigin))
			tt._eTrig.vStartOrigin = eTrig.origin;
	}
	
	tt._uIsDisabled = undefined;
	
	if (!C_IMLLOGIC::IsTTsAllowed())
		tt TT_Allow(false);
		
	
	tt._AssignedTJ = undefined;
	
	tt._bIsTouched = undefined;
	tt._bIsTouchedAuto = undefined;
	tt._pTouchedBy = undefined;
	
	return tt;
}

public TT_Dispose()
{
	if (IsDefined(self._eTrig))
		self._eTrig._TT = undefined;
}

public IsTT(obj)
{
	return IsDefined(obj._bIsTT);
}

public EGetTT()
{
	return self._TT;
}

public TT_GetTrig()
{
	return self._eTrig;
}

public TT_IsAllowed()
{
	return !IsDefined(self._uIsDisabled);
}

public TT_Allow(bAllow)
{
	if (!bAllow)
		self._eTrig.origin = self._eTrig.vStartOrigin + (0, 0, 100000);
	else
		self._eTrig.origin = self._eTrig.vStartOrigin;
	
	if ((!ITYPE::UBoolToBool(self._uIsDisabled)) == bAllow)
		return false;
	
	self._uIsDisabled = ITYPE::BoolToUBool(bAllow);
	return true;
}

public TT_SetAssignedTJ(tj)
{
	self._AssignedTJ = tj;
}

public TT_GetAssignedTJ()
{
	return self._AssignedTJ;
}

public TT_IsTouched()
{
	return IsDefined(self._bIsTouched);
}

public TT_IsTouchedAuto()
{
	return IsDefined(self._bIsTouchedAuto);
}

public TT_GetToucher()
{
	return self._pTouchedBy;
}

public TT_Touch(bIsAuto, pToucher)
{
	self._bIsTouched = true;
	self._bIsTouchedAuto = bIsAuto;
	self._pTouchedBy = pToucher;
}