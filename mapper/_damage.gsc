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

RegFallDmgAllowed(bAllowed)
{
	C_ISVAR::Set("GFallDmgEnabled", bAllowed);
}

CFallDmgAllow(bAllow)
{}

/// <summary>
/// Repels player away like BH
/// </summary>
/// <returns></returns>
/// <param name="fStrength">Strength of repel(0 - 1)</param>
/// <param name="vDir">Direction to repel</param>
/// <param name="bGiveDmg">Shows player's hurt</param>
CRepel(fStrength, vDir, [bGiveDmg])
{
	self C_ICDAMAGE::CRepel(fStrength, vDir, bGiveDmg);
}

/// <summary>
/// Repels player away like BH
/// </summary>
/// <returns></returns>
/// <param name="iForce">Force for repel, default is 200</param>
/// <param name="vDir">Direction to repel</param>
/// <param name="bGiveDmg">Shows player's hurt</param>
CRepelForce(iForce, vDir, [bGiveDmg])
{
	self C_ICDAMAGE::CRepelForce(iForce, vDir, bGiveDmg);
}

CDoDamage([eAttacker], [eInflictor], [iDamage], [iDFlags], [sMeansOfDeath], [sWeapon], [vPoint], [vDir], [sHitLoc], [psOffsetTime])
{
	self C_ICDAMAGE::CDoDamage(eAttacker, eInflictor, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime);
}