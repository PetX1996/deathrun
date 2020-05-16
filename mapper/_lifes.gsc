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

RegAllowed(bAllowed)
{
	C_ISVAR::Set("CLifesEnabled", bAllowed);
}

GetMaxCount()
{
	return C_ICLIFES::MaxLifes;
}

CGive()
{
	self C_ICLIFES::CGiveLife();
}

CGetCurCount()
{
	return self C_ICLIFES::CGetLifesCount();
}

CAllow(bAllow)
{}
