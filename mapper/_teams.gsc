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

// ======================================================================== //
#region Jumpers

JGetSpeed()
{
	return C_ISVAR::GetAsFloat("CJSpeed");
}

JRegSpeed(fFraction)
{
	C_ISVAR::Set("CJSpeed", fFraction);
}

JGetHealth()
{
	return C_ISVAR::GetAsInt("CJHealth");
}

JRegHealth(iHP)
{
	C_ISVAR::Set("CJHealth", iHP);
}

JGetKnifeDmg()
{
	return C_ISVAR::GetAsInt("CJKnifeDmg");
}

JRegKnifeDmg(iDmg)
{
	C_ISVAR::Set("CJKnifeDmg", iDmg);
}

#endregion
// ======================================================================== //
#region Activators

AGetSpeed()
{
	return C_ISVAR::GetAsFloat("CSpeed");
}

ARegSpeed(fFraction)
{
	C_ISVAR::Set("CASpeed", fFraction);
}

AGetHealth()
{
	return C_ISVAR::GetAsInt("CAHealth");
}

ARegHealth(iHP)
{
	C_ISVAR::Set("CAHealth", iHP);
}

AGetKnifeDmg()
{
	return C_ISVAR::GetAsInt("CAKnifeDmg");
}

ARegKnifeDmg(iDmg)
{
	C_ISVAR::Set("CAKnifeDmg", iDmg);
}

#endregion
// ======================================================================== //

GetAllActivators([bIsAlive])
{
	return ICLIST::GetAllAxis(bIsAlive);
}

GetAllJumpers([bIsAlive])
{
	return ICLIST::GetAllAllies(bIsAlive);
}