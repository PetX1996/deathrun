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
	/*if (C_ICDAMAGE::IsSuicideSilent(args))
		return;
	
	if (self.pers["team"] == "allies" && C_IGAMELOGIC::IsGameStateStarted(self.pers["team"]))
	{
		iStartTime = C_IGAMELOGIC::GetStartGameTime();
		if (IsDefined(iStartTime))
			self C_ISUMMARY::UpdateRecord("firstBlood", Int(GetTime() - iStartTime));
	}
	
	if (C_ICDAMAGE::IsEnemy(args))
		args.eAttacker C_ISUMMARY::UpdateRecord("kills", args.eAttacker ICPERS::GetPersStat("kills"));*/
}

// iPlace, [eTrig]
ML_OnCTouchedEM(args)
{
	/*iStartTime = C_IGAMELOGIC::GetStartGameTime();
	if (IsDefined(iStartTime))
		self C_ISUMMARY::UpdateRecord("endTime", Int(GetTime() - iStartTime));*/
}