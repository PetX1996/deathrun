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

// eInflictor, eAttacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration, bSuicideSilent
DMG_OnCKilled(args)
{
	if (IsDefined(args.bSuicideSilent))
		return;

	if (C_ICDAMAGE::IsEnemy(args)
		&& C_ICDAMAGE::IsMelee(args)
		&& args.eAttacker C_ICPERK::CHas("perk_enemyhp"))
	{
		args.eAttacker C_IDEBUG::Debug("Perk enemyhp");
		
		args.eAttacker C_ICPLAYER::CSetHealth(self.MaxHealth);
		
		args.eAttacker RunCallback();
	}
}

private RunCallback()
{
	args = IECALLBACK::Args_Create();
	self C_INIT::PERK_RunOnCActivatedEnemyHP(args);
}