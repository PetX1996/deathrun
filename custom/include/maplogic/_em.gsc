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

public EM_Create([eTrig])
{
	em = SpawnStruct();
	em._bIsEM = true;
	
	if (IsDefined(eTrig))
	{
		em._eTrig = eTrig;
		em._eTrig._EM = em;
		
		if (!IsDefined(em._eTrig.vStartOrigin))
			em._eTrig.vStartOrigin = eTrig.origin;	
	}
	
	em._uIsDisabled = undefined;
	
	if (!C_IMLLOGIC::IsEMAllowed())
		em EM_Allow(false);
		
	
	em._pTouchesList = ILIST::Create();
	em._pTouchesAutoList = ILIST::Create();
	
	return em;
}

public EM_Dispose()
{
	if (IsDefined(self._eTrig))
		self._eTrig._EM = undefined;
}

public IsEM(obj)
{
	return IsDefined(obj._bIsEM);
}

public EGetEM()
{
	return self._EM;
}

public EM_GetTrig()
{
	return self._eTrig;
}

public EM_IsAllowed()
{
	return !IsDefined(self._uIsDisabled);
}

public EM_Allow(bAllow)
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

public EM_GetTouchesList()
{
	return self._pTouchesList;
}

public EM_GetTouchesAutoList()
{
	return self._pTouchesAutoList;
}