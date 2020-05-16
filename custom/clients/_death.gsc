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

DMG_OnCKilled(args)
{
	if (C_ICDAMAGE::IsSuicideSilent(args))
		return;

	// hack for melee weapons killicons
	sMeansOfDeath = args.sMeansOfDeath;
	if (C_ICWEAPON::IsMeleeWeapon(args.sWeapon))
		sMeansOfDeath = "MOD_PISTOL_BULLET";
		
	Obituary(self, args.eAttacker, args.sWeapon, sMeansOfDeath);	
	
	self.StatusIcon = "hud_status_dead";
	
	self ICPERS::IncPersStat("deaths");
	
	if (C_ICDAMAGE::IsEnemy(args))
	{
		args.eAttacker ICPERS::IncPersStat("kills");
	
		if (C_ICDAMAGE::IsHeadShot(args))
		{
			args.eAttacker PlayLocalSound("bullet_impact_headshot_2"); // TODO: check it!
		}
	}
	
	self C_ICCORPSE::CPlaceCorpse(args);
}