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

OnCConnected(args)
{
	if (self C_ICPLAYER::CIsFirstPlayedRound())
		self ICSTAT::AddByName("CONNECTIONS", 1);
}

TEAM_OnCJoined(args)
{
	self UpdatePlayedTime(args.sOldTeam);
}

InCLeaving(args)
{
	self UpdatePlayedTime(self.pers["team"]);
}

GL_InSTerminatingRound(args)
{
	foreach (player in level.players)
		player UpdatePlayedTime(player.pers["team"]);
}

private UpdatePlayedTime(team)
{
	if (!IsDefined(self._iLastTimeSaved))
	{
		self._iLastTimeSaved = GetTime();
		return;
	}
	
	time = GetTime() - self._iLastTimeSaved;
	
	statName = "TIME_PLAYED_OTHER";
	if (team == "allies")
		statName = "TIME_PLAYED_ALLIES";
	else if (team == "axis")
		statName = "TIME_PLAYED_AXIS";
	
	self ICSTAT::AddByName(statName, Int(time / 1000));
	
	self._iLastTimeSaved = GetTime();
}

DMG_OnCKilled(args)
{
	if (C_ICDAMAGE::IsSuicideSilent(args)
		|| C_ICDAMAGE::IsAFK(args))
		return;
	
	if (C_ICDAMAGE::IsTrap(args))
	{
		self ICSTAT::AddByName("DEATHS_TRAP", 1);
		
		pActivs = ICLIST::GetAllAxis(true);
		foreach (pActiv in pActivs)
		{
			if (!pActiv C_ICAFK::CIsAFK())
				pActiv ICSTAT::AddByName("KILLS_TRAP", 1);
		}
	}
	
	if (C_ICDAMAGE::IsEnemy(args))
	{
		self ICSTAT::AddByName("DEATHS_KILLED", 1);
	
		if (self.pers["team"] == "allies")
			args.eAttacker ICSTAT::AddByName("KILLED_ALLIES", 1);
		else if (self.pers["team"] == "axis")
			args.eAttacker ICSTAT::AddByName("KILLED_AXIS", 1);
			
		if (C_ICDAMAGE::IsHeadShot(args))
			args.eAttacker ICSTAT::AddByName("KILLS_HEADSHOT", 1);
		else if (C_ICDAMAGE::IsMelee(args))
			args.eAttacker ICSTAT::AddByName("KILLS_MELEE", 1);
		else if (C_ICDAMAGE::IsBullet(args))
			args.eAttacker ICSTAT::AddByName("KILLS_BULLET", 1);
		else
			args.eAttacker ICSTAT::AddByName("KILLS_OTHER", 1);
	}
	else if (!C_ICDAMAGE::IsTrap(args))
		self ICSTAT::AddByName("DEATHS_OTHER", 1);
}

ML_OnCTouchedTT(args)
{
	if (!C_IGLSTATE::IsIN()
		|| C_IGLTYPE::IsTrainingRound()
		|| C_IGLTYPE::IsSinglePlayer())
		return;

	if (IsDefined(args.bIsTouchedAuto) && args.bIsTouchedAuto)
		return;

	self ICSTAT::AddByName("TRAP_ACTIVATED", 1);
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
	iTouchedTTs = args.TJ C_IMLTJ::TJ_GetTouchedTTsCount();
	assignedTTsList = args.TJ C_IMLTJ::TJ_GetAssignedTTsList();
	if (assignedTTsList.iCount <= 0
		|| iTouchedTTs > 0)
	{
		if (assignedTTsList.iCount <= 0) // TJ without TT
			iTouchedTTs = 1;
		
		self ICSTAT::AddByName("TRAP_SUCCEED", iTouchedTTs);
	}
}

ML_OnCTouchedEM(args)
{
	if (!C_IGLSTATE::IsIN()
		|| C_IGLTYPE::IsTrainingRound()
		|| C_IGLTYPE::IsSinglePlayer())
		return;

	if (IsDefined(args.bIsTouchedAuto) && args.bIsTouchedAuto)
		return;
		
	self ICSTAT::AddByName("FINISHES", 1);
}

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
				if (args.sWinningTeam == "allies")
					pPlayer ICSTAT::AddByName("WINS_ALLIES", 1);
				else
					pPlayer ICSTAT::AddByName("WINS_AXIS", 1);
			}
		}
	}
}