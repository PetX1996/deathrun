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
// Mod      : Core
// Website  : http://www.4gf.cz/
//I========================================================================I
// Script by: PetX
//I========================================================================I

#include core\include\_usings;
#include custom\include\_usings;

public sealed iDFlags_SuicideSilent = 128;
public sealed iDFlags_ByEnemy = 256;
public sealed iDFlags_Repel = 512;
public sealed iDFlags_ByAFK = 4096;
public sealed iDFlags_ByTrap = 8192;

public CSuicideSilent()
{
	self endon("disconnect");

	self CDoDamage(self, self, self.Health + 100, iDFlags_SuicideSilent, "MOD_SUICIDE", "", self.origin, undefined, "none", 0);
	self waittill("death_delay_finished");
}

public SuicideAFK()
{
	self endon("disconnect");
	
	self CDoDamage(self, self, self.Health + 100, iDFlags_ByAFK, "MOD_SUICIDE", "", self.origin, undefined, "none", 0);
	self waittill("death_delay_finished");
}

public CRepel(fStrength, vDir, [bGiveDmg])
{
	if (fStrength > 1)
		fStrength = 1;
	
	self CRepelForce(Int(200 * fStrength), vDir, bGiveDmg);
}

public CRepelForce(iForce, vDir, [bGiveDmg])
{
	if (!IsDefined(bGiveDmg)) bGiveDmg = false;

	iDamage = Int(iForce);
	self.Health += iDamage;
	
	if (!bGiveDmg)
		self SetClientDvars("bg_viewKickMax", 0, "bg_viewKickMin", 0, "bg_viewKickRandom", 0, "bg_viewKickScale", 0/*, "cg_hudDamageIconTime", 0*/);
		
	self CDoDamage(self, self, iDamage, iDFlags_Repel, "MOD_PROJECTILE", "none", undefined, vDir, "none", 0);
	
	if (!bGiveDmg)
		self thread CResetRepelSettings();
}

private CResetRepelSettings()
{
	self endon("disconnect");
	self notify("CResetRepelSettings");
	self endon("CResetRepelSettings");
	
	wait 0.05;
	
	self SetClientDvars("bg_viewKickMax", 90, "bg_viewKickMin", 5, "bg_viewKickRandom", 0.4, "bg_viewKickScale", 0.2/*, "cg_hudDamageIconTime", 2000*/);
}

public CDoDamage([eAttacker], [eInflictor], [iDamage], [iDFlags], [sMeansOfDeath], [sWeapon], [vPoint], [vDir], [sHitLoc], [psOffsetTime])
{
	if (!IsDefined(iDamage)) iDamage = 1;
	if (!IsDefined(iDFlags)) iDFlags = 0;
	if (!IsDefined(sMeansOfDeath)) sMeansOfDeath = "MOD_SUICIDE";
	if (!IsDefined(sWeapon)) sWeapon = "";
	if (!IsDefined(vPoint)) vPoint = self.origin;
	//if (!IsDefined(vDir)) vDir = (0, 0, 0);
	if (!IsDefined(sHitLoc)) sHitLoc = "none";
	if (!IsDefined(psOffsetTime)) psOffsetTime = 0;

	self custom\_callbacks::Callback_PlayerDamage(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime);
}

public GetHitLocHeight(sHitLoc)
{
	switch (sHitLoc)
	{
		case "helmet":
		case "head":
		case "neck":
			return 60;
		case "torso_upper":
		case "right_arm_upper":
		case "left_arm_upper":
		case "right_arm_lower":
		case "left_arm_lower":
		case "right_hand":
		case "left_hand":
		case "gun":
			return 48;
		case "torso_lower":
			return 40;
		case "right_leg_upper":
		case "left_leg_upper":
			return 32;
		case "right_leg_lower":
		case "left_leg_lower":
			return 10;
		case "right_foot":
		case "left_foot":
			return 5;
		default:
			return 48;
	}
}

public IsEnemy(args)
{
	return (args.iDFlags & iDFlags_ByEnemy);
}

public IsSuicideSilent(args)
{
	return (args.iDFlags & iDFlags_SuicideSilent);
}

public IsRepel(args)
{
	return (args.iDFlags & iDFlags_Repel);
}

public IsClassicMyself(args)
{
	return (!IsEnemy(args) && !IsSuicideSilent(args) && !IsRepel(args) && !IsAFK(args));
}

public IsFall(args)
{
	return (args.sMeansOfDeath == "MOD_FALLING");
}

public IsTrap(args)
{
	return (args.iDFlags & iDFlags_ByTrap);
}

public IsAFK(args)
{
	return (args.iDFlags & iDFlags_ByAFK);
}

public IsBullet(args)
{
	return (args.sMeansOfDeath == "MOD_PISTOL_BULLET" 
		|| args.sMeansOfDeath == "MOD_RIFLE_BULLET" 
		|| args.sMeansOfDeath == "MOD_HEAD_SHOT");
}

public IsMelee(args)
{
	return args.sMeansOfDeath == "MOD_MELEE";
}

public IsExplosion(args)
{
	return !IsRepel(args)
			&& (args.sMeansOfDeath == "MOD_GRENADE_SPLASH" 
			|| args.sMeansOfDeath == "MOD_PROJECTILE_SPLASH" 
			|| args.sMeansOfDeath == "MOD_EXPLOSIVE");
}

public IsHeadShot(args)
{
	return args.sMeansOfDeath == "MOD_HEAD_SHOT";
}

public IsPistol(args)
{
	return (args.sMeansOfDeath == "MOD_PISTOL_BULLET");
}

public IsSniper(args)
{
	return args.sMeansOfDeath == "MOD_RIFLE_BULLET" 
			&& (args.sWeapon == "dragunov_acog_mp"
				|| args.sWeapon == "dragunov_mp"
				|| args.sWeapon == "m40a3_acog_mp"
				|| args.sWeapon == "m40a3_mp"
				|| args.sWeapon == "barrett_acog_mp"
				|| args.sWeapon == "barrett_mp"
				|| args.sWeapon == "remington700_acog_mp"
				|| args.sWeapon == "remington700_mp"
				|| args.sWeapon == "m21_acog_mp"
				|| args.sWeapon == "m21_mp"
				|| args.sWeapon == "mp5_acog_mp"); // kar98
}