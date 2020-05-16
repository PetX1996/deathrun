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

InCPreSpawning(args)
{
	args.DvarDic IDIC::Add("ui_hudSIBody", "");
	args.DvarDic IDIC::Add("ui_hudSIInvA", "");
	args.DvarDic IDIC::Add("ui_hudSIInvB", "");
	args.DvarDic IDIC::Add("ui_hudSIInvC", "");
	args.DvarDic IDIC::Add("ui_hudSIInvD", "");

	if (self.pers["team"] == "allies")
	{
		args.iHealth = C_ISVAR::GetAsInt("CJHealth");
		args.fSpeed = C_ISVAR::GetAsInt("CJSpeed");
	}
	else
	{
		args.iHealth = C_ISVAR::GetAsInt("CAHealth");
		args.fSpeed = C_ISVAR::GetAsInt("CASpeed");
	}
}

OnCSpawned(args)
{
	self C_ICPLAYER::SetThirdPersonFromSave();
	level notify("player_spawn", self); // braxi
}

DMG_InCPreDamaging(args)
{
	if (C_ICDAMAGE::IsEnemy(args))
	{
		// disable friendly-fire
		if (args.eAttacker.pers["team"] == self.pers["team"])
		{
			args.bCancel = true;
			return;
		}
	}
	
	if (self IsByTrap(args))
		args.iDFlags |= C_ICDAMAGE::iDFlags_ByTrap;
}

private IsByTrap(args)
{
	/*if (C_IGLTYPE::IsFreeRun()
		|| C_IGAMELOGIC::IsTrainingRound()
		|| !C_IMLLOGIC::IsAnyTrapActivated())
		return false;*/
		
	return C_ICDAMAGE::IsClassicMyself(args) 
		&& self.pers["team"] == "allies"
		&& (args.sMeansOfDeath == "MOD_FALLING"
			|| args.sMeansOfDeath == "MOD_TRIGGER_HURT"
			|| args.sMeansOfDeath == "MOD_SUICIDE");
}

DMG_InCPostDamaging(args)
{
	if (C_ICDAMAGE::IsFall(args) && !C_ISVAR::GetAsBool("GFallDmgEnabled"))
	{
		args.bCancel = true;
		return;
	}

	if (C_ICDAMAGE::IsEnemy(args))
	{
		// wall shooting
		if (C_ISVAR::GetAsBool("CScrCheckPenetration")
			&& C_ICDAMAGE::IsBullet(args)
			&& self IsWallShooting(args.eAttacker, args.vPoint))
		{
			args.bCancel = true;
			return;
		}
		
		// modify melee damage
		if (C_ICDAMAGE::IsMelee(args))
		{
			if (args.eAttacker.pers["team"] == "allies")
			{
				if (C_ICWEAPON::IsMeleeWeapon(args.sWeapon))
					args.iDamage = C_ISVAR::GetAsInt("CJMeleeKnifeDmg");
				else
					args.iDamage = C_ISVAR::GetAsInt("CJGunsKnifeDmg");
			}
			else if (args.eAttacker.pers["team"] == "axis")
				args.iDamage = C_ISVAR::GetAsInt("CAKnifeDmg");
		}
	}
}

private IsWallShooting(eAttacker, vPoint)
{
	trace = BulletTrace(eAttacker ILOOK::GetPlayerViewPos(), vPoint, true, eAttacker);
	return (!IsDefined(trace["entity"]) || trace["entity"] != self);
}

BTN_OnCPressedAttack(args)
{
	// knifing press FIRE button
	if (!IsAlive(self))
		return;
		
	if (C_ICWEAPON::IsMeleeWeapon(self GetCurrentWeapon()))
		self C_ICCMD::Command("+melee; -melee;");
}