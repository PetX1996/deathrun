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

InSIniting(args)
{
	level.freeRun = false; // DR1

	level._GL_iGT = C_IGLTYPE::iType_None;
}

InSStarting(args)
{
	sWeapon = C_ISVAR::GetAsStr("GLFreeRunJWeapon");
	if (sWeapon != "")
		PreCacheItem(sWeapon);
		
	sWeapon = C_ISVAR::GetAsStr("GLFreeRunAWeapon");
	if (sWeapon != "")
		PreCacheItem(sWeapon);
}

InCPreConnecting(args)
{
	if (C_IGLTYPE::IsDisabled())
		type = C_ILOCALIZE::LDisabled;
	else if (C_IGLTYPE::IsTrainingRound())
		type = C_ILOCALIZE::LTrainingRound;
	else if (C_IGLTYPE::IsOneTeam())
		type = C_ILOCALIZE::LOneTeam;
	else if (C_IGLTYPE::IsFreeRun())
		type = C_ILOCALIZE::LFreeRun;
	else
		type = "";
		
	args.DvarDic IDIC::Add("ui_hudLType", type);
}

/// bCancel, DvarDic, SpawnPoint, sBodyModel, sHeadModel, sViewModel, iHealth, fSpeed, sForcedWeapon, sSpawnWeapon, Weapons, sOffHand, sSecondaryOffHand, sActionSlot1, sActionSlot2, sActionSlot3, sActionSlot4, Perks
InCPostSpawning(args)
{
	if (C_IGLTYPE::IsFreeRun())
	{
		iHealth = 0;
		sWeapon = "";
		if (self.pers["team"] == "allies")
		{
			iHealth = C_ISVAR::GetAsInt("GLFreeRunJHealth");
			sWeapon = C_ISVAR::GetAsStr("GLFreeRunJWeapon");
		}
		else
		{
			iHealth = C_ISVAR::GetAsInt("GLFreeRunAHealth");
			sWeapon = C_ISVAR::GetAsStr("GLFreeRunAWeapon");
		}
		
		if (iHealth != 0) args.iHealth = iHealth;
		if (sWeapon != "") args.sSpawnWeapon = sWeapon;
	}
}