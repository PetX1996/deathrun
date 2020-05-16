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

private DmgInc = 1.2;

// eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime
DMG_InCPostDamaging(args)
{
	if (C_ICDAMAGE::IsEnemy(args)
		&& C_ICDAMAGE::IsBullet(args)
		&& args.eAttacker C_ICPERK::CHas("specialty_bulletdamage"))
	{
		args.eAttacker C_IDEBUG::Debug("Perk bulletdamage");
		args.iDamage *= DmgInc;
	}
}