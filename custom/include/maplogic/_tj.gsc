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

public TJ_Create([eTrig])
{
	tj = SpawnStruct();
	tj._bIsTJ = true;
	
	if (IsDefined(eTrig))
	{
		tj._eTrig = eTrig;
		tj._eTrig._TJ = tj;
		
		if (!IsDefined(tj._eTrig.vStartOrigin))
			tj._eTrig.vStartOrigin = eTrig.origin;
	}
	
	tj._uIsDisabled = undefined;
	
	if (!C_IMLLOGIC::IsTJsAllowed())
		tj TJ_Allow(false);
		
	
	tj._AssignedTTList = ILIST::Create();
	
	tj._pTouchesList = ILIST::Create();
	tj._pTouchesAutoList = ILIST::Create();
	tj._iTouchedTTs = 0;
	
	return tj;
}

public TJ_Dispose()
{
	if (IsDefined(self._eTrig))
		self._eTrig._TJ = undefined;
}

public IsTJ(obj)
{
	return IsDefined(obj._bIsTJ);
}

public EGetTJ()
{
	return self._TJ;
}

public TJ_GetTrig()
{
	return self._eTrig;
}

public TJ_IsAllowed()
{
	return !IsDefined(self._uIsDisabled);
}

public TJ_Allow(bAllow)
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

public TJ_GetAssignedTTsList()
{
	return self._AssignedTTList;
}

public TJ_GetTouchesList()
{
	return self._pTouchesList;
}

public TJ_GetTouchesAutoList()
{
	return self._pTouchesAutoList;
}

public TJ_GetTouchedTTsCount()
{
	return self._iTouchedTTs;
}

public TJ_SetTouchedTTs(iCount)
{
	self._iTouchedTTs = iCount;
}

public TJ_IncTouchedTTs(iInc)
{
	self._iTouchedTTs += iInc;
}