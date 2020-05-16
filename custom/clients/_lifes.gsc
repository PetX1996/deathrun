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

InCPreConnecting(args)
{
	if (self C_ICPLAYER::CIsFirstPlayedRound())
		self.pers["lifes"] = 0;
}

InCFinalSpawning(args)
{
	args.DvarDic IDIC::Add("ui_hudSILifes", self C_ICLIFES::CGetLifesCount());
}

// eInflictor, eAttacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration, bSuicideSilent
DMG_OnCKilled(args)
{
	if (C_ICDAMAGE::IsEnemy(args) 
		&& args.eAttacker.pers["team"] == "allies" 
		&& self.pers["team"] == "axis")
		args.eAttacker C_ICLIFES::CGiveLife();
}

// eInflictor, eAttacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration, bSuicideSilent
DMG_OnCDelayKilled(args)
{
	if (C_ICDAMAGE::IsSuicideSilent(args))
		return;
		
	if (self.pers["team"] == "allies" && C_IGLSTATE::IsINReleased("allies"))
		self thread C_ICLIFES::CLifeButtonWaitting();
}