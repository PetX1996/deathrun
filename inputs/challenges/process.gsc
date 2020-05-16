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

// 
OnCConnected(args)
{
	if (self C_ICPLAYER::CIsFirstPlayedRound())
		self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage6, "connections");
}

// SpawnPoint, sBodyModel, sHeadModel, sViewModel, iHealth, fSpeed, sForcedWeapon, sSpawnWeapon, Weapons, sOffHand, sSecondaryOffHand, sActionSlot1, sActionSlot2, sActionSlot3, sActionSlot4, Perks
OnCSpawned(args)
{
	self.CH_pLastHitEnemy = undefined;
	self.CH_iLastHitDamage = undefined;
	self.CH_bLastHitIsBullet = undefined;
	self.CH_iLastHitHealth = undefined;
	
	self thread CMonitorChallenges();
	
	self.CH_iSpawnedTime = GetTime();
}

private iFlyerTime = 4000;
private iNoGravityTime = 10000;

private iSexMaxWalkedDistSq = 1024; // 32
private iSexMaxDistSq = 16384; // 128
private iSexUps = 5;

private CMonitorChallenges()
{
	self endon("disconnect");
	self endon("death");
	
	iInAirStartTime = undefined;
	
	sLastStance = "stand";
	iStanceChanges = 0;
	vSexPos = self.origin;
	
	// activator - speed
	vLastPos = self.origin;
	iTravelled = 0;
	if (!self C_ICPERK::CHas("perk_speed"))
		iTravelled = -1;
	
	while (true)
	{
		// flyer
		if (self IsOnGround())
			iInAirStartTime = undefined;
		else if (!IsDefined(iInAirStartTime))
			iInAirStartTime = GetTime();
		else if ((GetTime() - iInAirStartTime) == iFlyerTime)
			self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage4, "flyer");
		else if ((GetTime() - iInAirStartTime) == iNoGravityTime)
			self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage8, "noGravity");
		
		// necrophile
		if (self GetStance() != sLastStance)
		{
			if (DistanceSquared(vSexPos, self.origin) <= iSexMaxWalkedDistSq
				&& ((self GetStance() == "prone" && sLastStance == "crouch")
					|| (self GetStance() == "crouch" && sLastStance == "prone")))
			{
				iStanceChanges++;
				if (iStanceChanges >= iSexUps)
				{
					self DoSexCh();
					iStanceChanges = 0;
				}
			}
			else
			{
				vSexPos = self.origin;
				iStanceChanges = 0;
			}
			
			sLastStance = self GetStance();
		}
		
		// activator - speed
		if (iTravelled >= 0
			&& vLastPos != self.origin)
		{
			iTravelled += Distance(vLastPos, self.origin);
			vLastPos = self.origin;
			
			if (iTravelled > 100)
			{
				self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Activator, "speed", iTravelled);
				iTravelled = 0;
			}
		}
		
		wait 0.05;
	}
}

private DoSexCh()
{
	eActivCorpsesList = C_ICCORPSE::GetCorpsesList("axis");
	for (i = 0; i < eActivCorpsesList.iCount; i++)
	{
		eActivCorpse = eActivCorpsesList ILIST::Get(i);
		if (IsDefined(eActivCorpse) && IsDefined(eActivCorpse.origin))
		{
			if (DistanceSquared(eActivCorpse.origin, self.origin) <= iSexMaxDistSq)
			{
				self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage6, "necrophile");
				return;
			}
		}	
	}
}

// eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime
DMG_InCPostDamaging(args)
{
	if (C_ICDAMAGE::IsSuicideSilent(args)
		|| C_ICDAMAGE::IsRepel(args))
		return;

	if (C_ICDAMAGE::IsEnemy(args))
	{
		self.CH_bCurHitWasOnGround = undefined;
		if (self IsOnGround())
			self.CH_bCurHitWasOnGround = true;
	}
}

// eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime
DMG_OnCDamaged(args)
{
	self endon("disconnect");
	self endon("spawned");
	
	if (C_ICDAMAGE::IsSuicideSilent(args)
		|| C_ICDAMAGE::IsRepel(args))
		return;

	wait 0.05; // wait until DMG_OnCKilled finished
		
	self.CH_pLastHitEnemy = undefined;
	self.CH_iLastHitDamage = undefined;
	self.CH_bLastHitIsBullet = undefined;
	self.CH_iLastHitHealth = undefined;	

	if (C_ICDAMAGE::IsEnemy(args))
	{
		self.CH_pLastHitEnemy = args.eAttacker;
		self.CH_iLastHitDamage = args.iDamage;
		self.CH_bLastHitIsBullet = C_ICDAMAGE::IsBullet(args);
		
		if (C_ICDAMAGE::IsBullet(args)
			&& args.eAttacker C_ICPERK::CHas("specialty_bulletdamage"))
			args.eAttacker C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Jumper, "bulletDamage");
			
		if (self C_ICPERK::CHas("specialty_armorvest"))
			self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Activator, "vest");
	}
	
	// will player survive this dmg?
	if (IsAlive(self)
		&& args.iDamage < self.Health)
	{
		self.CH_iLastHitHealth = self.Health;
	
		if (C_ICDAMAGE::IsFall(args))
		{
			self C_IDEBUG::Debug("CH stage2 - lucker");
			self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage2, "lucker");
		}
	}
}

private iMassTrapKillerDelay = 2000;
private iMassTrapKillerDeathsStage3 = 4;
private iMassTrapKillerDeathsStage7 = 6;

private iCloseShotDistanceSq = 1600; // 40
private iLongShotDistanceSq = 25000000; // 5000

private iFinishHimMaxHealth = 5;

private iFastEndMaxTime = 5000;

private iJumperSerialKillerStage7Kills = 4;

private iHitmanStage8MaxTime = 40000;

private iNoTimeForMercyMaxTime = 10000;

// eInflictor, eAttacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration, iDFlags
DMG_OnCKilled(args)
{
	if (C_ICDAMAGE::IsSuicideSilent(args))
		return;
		
	if (C_ICDAMAGE::IsEnemy(args))
	{
		if (self.pers["team"] == "axis")
		{
			args.eAttacker C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage0, "activatorKiller");
			args.eAttacker C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage5, "activatorKiller");
			
			if (C_ICDAMAGE::IsBullet(args))
			{
				if (C_ICDAMAGE::IsPistol(args))
					args.eAttacker C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage3, "pistols");
				else if (C_ICDAMAGE::IsSniper(args))
					args.eAttacker C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage5, "snipers");
				else
					args.eAttacker C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage6, "automatic");
				
				if (DistanceSquared(args.vPoint, args.eAttacker ILOOK::GetPlayerViewPos()) <= iCloseShotDistanceSq)
					args.eAttacker C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage3, "closeShot");
				else if (DistanceSquared(args.vPoint, args.eAttacker.origin) >= iLongShotDistanceSq)
					args.eAttacker C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage7, "longShot");
			}
			
			if (IsDefined(self.CH_iLastHitHealth) 
				&& self.CH_iLastHitHealth <= iFinishHimMaxHealth)
			{
				args.eAttacker C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage4, "finishHim");
				args.eAttacker C_IDEBUG::Debug("finishHim");
			}
			
			if (IsDefined(args.eAttacker.CH_bRespawned))
				args.eAttacker C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage5, "vendetta");
				
			if (IsDefined(args.eAttacker.CH_iFinishedTime)
				&& (GetTime() - args.eAttacker.CH_iFinishedTime) <= iFastEndMaxTime
				&& ICLIST::GetAllAxis(true).size == 0)
				args.eAttacker C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage6, "fastEnd");
				
			iStartRoundTime = C_IGLSTATE::GetINStartedTime();
			if (IsDefined(iStartRoundTime)
				&& (GetTime() - iStartRoundTime) <= iHitmanStage8MaxTime
				&& ICLIST::GetAllAxis(true).size == 0)
				args.eAttacker C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage8, "hitman");
				
			// stage9 - activatorHater
			if (!IsDefined(args.eAttacker.pers["CH_iKilledActivators"]))
				args.eAttacker.pers["CH_iKilledActivators"] = 0;
				
			args.eAttacker.pers["CH_iKilledActivators"]++;
			
			iJumperTimes = C_IGLROUNDS::GetLimit() - args.eAttacker C_IGLPICKING::CGetPickedTimes();
			if (args.eAttacker.pers["CH_iKilledActivators"] == iJumperTimes)
				args.eAttacker C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage9, "activatorHater");
				
			// stage9 - lastTry
			if (IsDefined(args.eAttacker.CH_iUsedLifes)
				&& args.eAttacker.CH_iUsedLifes == C_ICLIFES::MaxLifes)
				args.eAttacker C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage9, "lastTry");
				
			// bonus - activatorSerialKiller
			if (!IsDefined(args.eAttacker.CH_iKilledActivators))
				args.eAttacker.CH_iKilledActivators = 0;
				
			args.eAttacker.CH_iKilledActivators++;
			if (args.eAttacker.CH_iKilledActivators == 2)
				args.eAttacker C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Bonus, "activatorSerialKiller");
		}
		else if (self.pers["team"] == "allies")
		{
			args.eAttacker C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage1, "jumperKiller");
			
			if (C_ICDAMAGE::IsMelee(args))
			{
				args.eAttacker C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage3, "knifeKiller");
				
				// self = jumper
				// args.eAttacker = activator
				if (IsDefined(args.eAttacker.CH_pLastHitEnemy)
					&& args.eAttacker.CH_pLastHitEnemy == self
					&& args.eAttacker.CH_bLastHitIsBullet)
					self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage4, "niceTry");
			}
			
			// jumper serial killer
			if (!IsDefined(args.eAttacker.CH_iJumperKilled))
				args.eAttacker.CH_iJumperKilled = 0;
				
			args.eAttacker.CH_iJumperKilled++;
			if (args.eAttacker.CH_iJumperKilled == iJumperSerialKillerStage7Kills)
				args.eAttacker C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage7, "jumperSerialKiller");
				
			if (ICLIST::GetAllAllies(true).size == 0)
			{
				if (C_IGLTYPE::IsFreeRun()
					&& !IsDefined(level.CH_iKilledByTraps))
					args.eAttacker C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage9, "freeForLamas");
					
				pActivs = ICLIST::GetAllAxis(true);
				if (pActivs.size >= 2)
				{
					foreach (pActiv in pActivs)
					{
						if (!pActiv C_ICAFK::CIsAFK())
							pActiv C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Bonus, "cooperation");
					}
				}
			}
		}
		
		if (C_ICDAMAGE::IsMelee(args)
			&& IsDefined(self.CH_pLastHitEnemy) 
			&& self.CH_pLastHitEnemy == args.eAttacker
			&& IsDefined(self.CH_iLastHitDamage)
			&& (self.CH_iLastHitDamage + args.iDamage) >= self.MaxHealth)
			args.eAttacker C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage2, "hitAndKill");
			
		if (C_ICDAMAGE::IsHeadShot(args))
		{
			args.eAttacker C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage2, "headshots");
			args.eAttacker C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage4, "headshots");
		}
		
		sStance = args.eAttacker GetStance();
		if (sStance == "crouch")
			args.eAttacker C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage3, "crouchKill");
		else if (sStance == "prone")
		{
			args.eAttacker C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage4, "proneKill");
			
			if (C_ICDAMAGE::IsMelee(args))
				args.eAttacker C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage5, "proneKnifer");
		}
		
		if (!args.eAttacker IsOnGround())
		{
			args.eAttacker C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage7, "airKill");
			
			if (IsDefined(self.CH_bCurHitWasOnGround))
				args.eAttacker C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage9, "airLover");
		}
		
		if (self C_ICAFK::CIsAFK() || self C_ICAFK::CIsStuck())
			args.eAttacker C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Bonus, "noDelays");
	}
	
	if (C_ICDAMAGE::IsTrap(args))
	{
		pActivs = ICLIST::GetAllAxis(true);
		foreach (pActiv in pActivs)
		{
			if (pActiv C_ICAFK::CIsAFK())
				continue;
		
			pActiv C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage0, "trapKiller");
			pActiv C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage2, "trapKiller");
			pActiv C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage6, "trapKiller");
			
			// massTrapKiller
			if (IsDefined(pActiv.CH_iLastActivationTime) 
				&& (GetTime() - pActiv.CH_iLastActivationTime) <= iMassTrapKillerDelay)
			{
				pActiv.CH_iLastTrapDeaths++;
				if (pActiv.CH_iLastTrapDeaths == iMassTrapKillerDeathsStage3)
					pActiv C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage3, "massTrapKiller");
				else if (pActiv.CH_iLastTrapDeaths == iMassTrapKillerDeathsStage7)
					pActiv C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage7, "massTrapKiller");
			}
		}
		
		// stage9 - freeForLamas
		if (!IsDefined(level.CH_iKilledByTraps))
			level.CH_iKilledByTraps = 0;
			
		level.CH_iKilledByTraps++;
		
		
		if (C_IGLTYPE::IsFreeRun())
			self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Bonus, "iAmNewbie");
	}
	
	if (!C_ICDAMAGE::IsAFK(args))
	{
		if (self.pers["team"] == "allies")
		{
			if (ICLIST::GetAllAllies(true).size == 0)
			{
				iRoundStartTime = C_IGLSTATE::GetINStartedTime();
				if (IsDefined(iRoundStartTime)
					&& (GetTime() - iRoundStartTime) <= iNoTimeForMercyMaxTime)
				{
					pActivs = ICLIST::GetAllAxis(true);
					foreach (pActiv in pActivs)
					{
						if (!pActiv C_ICAFK::CIsAFK())
							pActiv C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage6, "noTimeForMercy");
					}
				}
			}
			
			if (IsDefined(self.CH_iSucceededActivatedTTs)
				&& self.CH_iSucceededActivatedTTs >= (C_IMLLOGIC::GetTTList()).iCount)
				self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Bonus, "soClose");
		}
		
		if (self.pers["team"] == "axis"
			&& C_ICDAMAGE::IsFall(args))
			self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Bonus, "looserOfLoosers");
		
		if (IsDefined(self.CH_iSpawnedTime))
			self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage8, "addiction", (GetTime() - self.CH_iSpawnedTime));
			
		if (C_ICDAMAGE::IsFall(args))
			self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Bonus, "falls");

		self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Bonus, "deaths");
	}
		
	if (self.pers["team"] == "allies"
		&& ICLIST::GetAllAllies(false).size == 1) // only I am dead
		self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Bonus, "badDay");
		
	self.pers["CH_bHaveBeenKilled"] = true;
}

// eInflictor, eAttacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration, iDFlags, pVictim
DMG_OnCAssisted(args)
{
	self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage4, "almostKills");
}

private iInMemoryOfDistSq = 16384; // 128
private iNoShameDistSq = 16384; // 128
private fCeilingRange = -0.9; // -1 = ceiling; 1 = floor; 0 = perpendicular to floor

private iVandalismStage7SprayedTimes = 15;

// sFX, vPos, vForward, vUp, vNormal, sSurfaceType
SPRAY_OnCSprayed(args)
{
	self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage1, "graffiter");

	eCorpsesList = C_ICCORPSE::GetCorpsesList();
	for (i = 0; i < eCorpsesList.iCount; i++)
	{
		eCorpse = eCorpsesList ILIST::Get(i);
		if (IsDefined(eCorpse) && IsDefined(eCorpse.origin))
		{
			if (DistanceSquared(eCorpse.origin, args.vPos) < iInMemoryOfDistSq)
			{
				self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage0, "inMemoryOf");
				break;
			}
		}
	}
	
	eActivatorsCorpsesList = C_ICCORPSE::GetCorpsesList("axis");
	for (i = 0; i < eActivatorsCorpsesList.iCount; i++)
	{
		eActivatorCorpse = eActivatorsCorpsesList ILIST::Get(i);
		if (IsDefined(eActivatorCorpse) && IsDefined(eActivatorCorpse.origin))
		{
			if (DistanceSquared(eActivatorCorpse.origin, args.vPos) < iNoShameDistSq)
			{
				self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage2, "noShame");
				break;
			}
		}
	}
	
	if (IsDefined(args.vNormal)
		&& args.vNormal[2] <= fCeilingRange)
		self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage3, "upsideDown");
		
	if (!self IsOnGround())
		self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage4, "airSprayer");
		
	if (args.sSurfaceType == "grass")
		self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage5, "environmentalist");
		
	if (!IsDefined(self.CH_iSprayedTimes))
		self.CH_iSprayedTimes = 0;
		
	self.CH_iSprayedTimes++;
	if (self.CH_iSprayedTimes == iVandalismStage7SprayedTimes)
		self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage7, "vandalism");
}

private iImpatientMaxTime = 25000;


ML_OnCTouchedTT(args)
{
	if (!C_IGLSTATE::IsIN()
		|| C_IGLTYPE::IsTrainingRound()
		|| C_IGLTYPE::IsSinglePlayer())
		return;
	
	if (IsDefined(args.bIsTouchedAuto) && args.bIsTouchedAuto)
		return;

	if (self.pers["team"] == "axis")
	{
		self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage1, "trapsActivated");
		self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage4, "trapsActivated");
		self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage9, "trapsActivated");
		
		// stage 2 - turnOnAll
		if (!IsDefined(self.CH_iActivatedTraps))
			self.CH_iActivatedTraps = 0;
			
		self.CH_iActivatedTraps++;
		
		if (self.CH_iActivatedTraps >= (C_IMLLOGIC::GetTTList()).iCount)
		{
			self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage2, "turnOnAll");
			
			iStartGameTime = C_IGLSTATE::GetINStartedTime();
			if (IsDefined(iStartGameTime) 
				&& (GetTime() - iStartGameTime) <= iImpatientMaxTime)
				self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage5, "impatient");
				
			jumpers = ICLIST::GetAllAllies(true);
			foreach (pJumper in jumpers)
			{
				if (IsDefined(pJumper.CH_iSucceedDeActivatedTJs)
					&& pJumper.CH_iSucceedDeActivatedTJs >= (C_IMLLOGIC::GetTJList()).iCount)
					pJumper C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Bonus, "fasterThanActivator");
			}
		}
		
		// stage 3 - massTrapKiller
		self.CH_iLastTrapDeaths = 0;
		self.CH_iLastActivationTime = GetTime();
	}
}


ML_OnCTouchedTJ(args)
{
	if (!C_IGLSTATE::IsIN()
		|| C_IGLTYPE::IsTrainingRound()
		|| C_IGLTYPE::IsSinglePlayer())
		return;

	if (IsDefined(args.bIsTouchedAuto) && args.bIsTouchedAuto)
		return;
		
	// if TJ is connected with TT, TT must be active!
	assignedTTsList = args.TJ C_IMLTJ::TJ_GetAssignedTTsList();
	iTouchedTTs = args.TJ C_IMLTJ::TJ_GetTouchedTTsCount();
	
	if (assignedTTsList.iCount <= 0
		|| iTouchedTTs > 0)
	{
		self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Bonus, "trapsSucceeded");
		
		
		if (!IsDefined(self.CH_iSucceededActivatedTTs))
			self.CH_iSucceededActivatedTTs = 0;
			
		self.CH_iSucceededActivatedTTs += iTouchedTTs;
		if (self.CH_iSucceededActivatedTTs >= (C_IMLLOGIC::GetTTList()).iCount)
			self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Bonus, "unstoppable");
			
			
		if (args.iPlace == 0)
		{
			if (!IsDefined(self.CH_iSucceededActivatedTTsAsFirst))
				self.CH_iSucceededActivatedTTsAsFirst = 0;
				
			self.CH_iSucceededActivatedTTsAsFirst += iTouchedTTs;
			if (self.CH_iSucceededActivatedTTsAsFirst >= (C_IMLLOGIC::GetTTList()).iCount)
				self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Bonus, "iAmFirst");
		}
	}
	
	// bonus - fasterThanActivator
	if (assignedTTsList.iCount <= 0
		|| iTouchedTTs == 0)
	{
		if (!IsDefined(self.CH_iSucceedDeActivatedTJs))
			self.CH_iSucceedDeActivatedTJs = 0;
	
		self.CH_iSucceedDeActivatedTJs++;
	}
}

private iGoodTimeMaxTime = 35000;


ML_OnCTouchedEM(args)
{
	if (!C_IGLSTATE::IsIN()
		|| C_IGLTYPE::IsTrainingRound()
		|| C_IGLTYPE::IsSinglePlayer())
		return;

	if (IsDefined(args.bIsTouchedAuto) && args.bIsTouchedAuto)
		return;
		
	self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage1, "finishes");
	
	if (IsDefined(self.CH_bRespawned))
		self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage3, "secondChance");
		
	// stage6 - fastEnd
	self.CH_iFinishedTime = GetTime();
	
	iRoundStartTime = C_IGLSTATE::GetINStartedTime();
	if (IsDefined(iRoundStartTime)
		&& (GetTime() - iRoundStartTime) <= iGoodTimeMaxTime)
		self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage7, "goodTime");
		
	// stage8 - proFinisher
	if (!IsDefined(self.pers["CH_iFinishedTimes"]))
		self.pers["CH_iFinishedTimes"] = 0;
		
	self.pers["CH_iFinishedTimes"]++;
	
	if (C_IGLROUNDS::IsLast())
	{
		iJumpersRounds = C_IGLROUNDS::GetLimit() - self C_IGLPICKING::CGetPickedTimes();
		if (iJumpersRounds > 0
			&& self.pers["CH_iFinishedTimes"] >= iJumpersRounds)
			self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage8, "proFinisher");
	}
}

// iType, [sWinningTeam], [pWinner]
GL_OnSEndedGame(args)
{
	if (IsDefined(args.sWinningTeam))
	{
		foreach (pPlayer in level.players)
		{
			if (!IsAlive(pPlayer))
				continue;
				
			if (pPlayer.pers["team"] == args.sWinningTeam)
			{ 
				if (args.sWinningTeam == "axis")
				{
					pPlayer C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage1, "activatorWinner");
					pPlayer C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage5, "activatorWinner");
					pPlayer C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage8, "activatorWinner");
				}
				else if (args.sWinningTeam == "allies")
					pPlayer C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage3, "jumperWinner");
			}
		}
	}
	
	if (C_IGLROUNDS::IsLast())
	{
		if (level.players.size > 1)
		{
			pMaxScore = level.players[0];
			pMaxKills = level.players[0];
			foreach (p in level.players)
			{
				if (p.pers["score"] > pMaxScore.pers["score"])
					pMaxScore = p;
				
				if (p.pers["kills"] > pMaxKills.pers["kills"])
					pMaxKills = p;
			}
			
			pMaxScore C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage6, "mapScore");
			pMaxKills C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage8, "mapKills");
		}
		
		foreach (p in level.players)
		{
			if (!IsDefined(p.pers["CH_bAnyLifeUsed"])
				&& p C_ICLIFES::CGetLifesCount() == C_ICLIFES::MaxLifes)
				p C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage7, "lifeWaster");
				
			if (!IsDefined(p.pers["CH_bHaveBeenKilled"])
				&& p C_IGLROUNDS::CGetPlayedRounds() >= C_IGLROUNDS::GetLimit())
				p C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage9, "survival");
		}
	}
}

private iCollectLifesStage2 = 2;

// 
LIFE_OnCGave(args)
{
	if (self C_ICLIFES::CGetLifesCount() == iCollectLifesStage2)
		self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage2, "lifes");
	else if (self C_ICLIFES::CGetLifesCount() == C_ICLIFES::MaxLifes)
		self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage6, "lifesCollector");
}

// 
LIFE_OnCUsed(args)
{
	self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage1, "respawns");
	self.CH_bRespawned = true;
	self.pers["CH_bAnyLifeUsed"] = true;
	
	if (!IsDefined(self.CH_iUsedLifes))
		self.CH_iUsedLifes = 0;
		
	self.CH_iUsedLifes++;
	if (self.CH_iUsedLifes == C_ICLIFES::MaxLifes)
		self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Stage8, "uninstallIt");
}

// sWeapon
W_OnCStartedReloading(args)
{
	if (self C_ICPERK::CHas("specialty_fastreload"))
		self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Jumper, "fastReload");
}

// 
PERK_OnCActivatedFastRun(args)
{
	self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Jumper, "fastRun");
}

// 
PERK_OnCActivatedRTD(args)
{
	self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Jumper, "rollTheDice");
}

// 
PERK_OnCActivatedBunnyHop(args)
{
	self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Jumper, "bunnyHop");
}

// 
PERK_OnCActivatedBackStep(args)
{
	self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Jumper, "backStep");
}

// 
PERK_OnCActivatedEnemyHP(args)
{
	self C_ICCHALLENGES::CProceed(C_ICCHALLENGES::TYPE_Activator, "enemyHP");
}