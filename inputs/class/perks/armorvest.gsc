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

private BulletDmgInc = 0.8;
private KnifeDmgInc = 0.8;
private ExplosionDmgInc = 0.8;

// eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime
DMG_InCPostDamaging(args)
{
	if (C_ICDAMAGE::IsEnemy(args)
		&& self C_ICPERK::CHas("specialty_armorvest"))
	{
		args.eAttacker C_IDEBUG::Debug("Perk armorvest");
		
		if (C_ICDAMAGE::IsBullet(args))
			args.iDamage *= BulletDmgInc;
		else if (C_ICDAMAGE::IsMelee(args))
			args.iDamage *= KnifeDmgInc;
		else if (C_ICDAMAGE::IsExplosion(args))
			args.iDamage *= ExplosionDmgInc;
	}
}