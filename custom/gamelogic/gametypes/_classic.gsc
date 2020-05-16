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

public StartLogic()
{
	SetCallbacks();
	thread GameLogic();
}

private SetCallbacks()
{
	C_IGLTYPE::Set(C_IGLTYPE::iType_Classic);
	IECALLBACK::AddModEvent("GL_OnCConnected", ::GL_OnCConnected);
	IECALLBACK::AddModEvent("GL_OnSElapsedTime", ::GL_OnSElapsedTime);
	IECALLBACK::AddModEvent("GL_OnCJoinedTeam", ::GL_OnCJoinedTeam);
	IECALLBACK::AddModEvent("DMG_OnCDelayKilled", ::DMG_OnCDelayKilled);
	IECALLBACK::AddModEvent("BTN_OnCPressedFrag", ::BTN_OnCPressedFrag);
	IECALLBACK::AddModEvent("ML_OnCTouchedTT", ::ML_OnCTouchedTT);
}

private GameLogic()
{
	C_IGLLOGIC::PreMatchWaitting();
	C_IGLLOGIC::FreezeTeam(true);
	VisionSetNaked("mpIntro");
	
	wait 0.5;
	
	iPlayersNeeded = C_ISVAR::GetAsInt("GLClassicMinPlayers");
	fRoundTimeLimit = C_ISVAR::GetAsFloat("GLClassicTimeLimit");
	
	C_IGLLOGIC::WaitForMorePlayersWithSinglePlayer(iPlayersNeeded, C_ISVAR::GetAsInt("GLClassicSinglePlayerTime"), fRoundTimeLimit);

	C_IGLLOGIC::PreMatchTimer(C_ISVAR::GetAsInt("GLClassicTimePreMatch"), C_ILOCALIZE::LTimePrematch);
	if (!C_IGLLOGIC::IsEnoughPlayers(iPlayersNeeded))
	{
		thread GameLogic();
		return;
	}
	
	pPickedList = C_IGLPICKING::PickActivators();
	if (pPickedList.iCount <= 0)
	{
		thread GameLogic();
		return;
	}

	C_IGLLOGIC::StartGame(fRoundTimeLimit * 60);
	VisionSetNaked(level.script, 5);
	
	thread JumpersBeginningTimer();
	thread ActivatorsBeginningTimerCreate();
	thread ActivatorsFreeRunTimerCreate();
}

GL_OnCConnected(args)
{
	if (C_IGLSTATE::IsPOST() || self.pers["team"] == "spectator")
	{
		self C_IGLLOGIC::CJoinSpectators();
		
		if (!C_IGLSTATE::IsPOST() 
			&& self C_ICPLAYER::CIsFirstPlayedRound())
			self OpenMenu(C_ICMENU::GetMenu("team"));
	}
	else
		self C_IGLLOGIC::CJoinTeam();
}

GL_OnSElapsedTime(args)
{
	if (!C_IGLTYPE::IsSinglePlayer())
	{
		if (ICLIST::GetAllAllies(true).size == 0 
			&& C_IGLSTATE::IsINReleased("allies")
			&& !IsPostRespawnAvailable("allies"))
		{
			C_IGLLOGIC::EndGame(C_IGLLOGIC::iEG_Event, "axis");
			return;
		}
		else if (ICLIST::GetAllAxis(true).size == 0 
			&& C_IGLSTATE::IsINReleased("axis")
			&& !IsPostRespawnAvailable("axis"))
		{
			C_IGLLOGIC::EndGame(C_IGLLOGIC::iEG_Event, "allies");
			return;
		}
	}
	
	if (C_IGLTIMER::GetRemaining() <= 0)
	{
		C_IGLLOGIC::EndGame(C_IGLLOGIC::iEG_TimeReached, "axis");
		return;
	}
}

private IsSpawnAvailable()
{
	return (C_IGLTYPE::IsSinglePlayer() 
		|| C_IGLSTATE::IsPRE(self.pers["team"])
		|| C_IGLSTATE::IsINStarted(self.pers["team"])
		|| IsPostRespawnAvailable(self.pers["team"]));
}

private IsPostRespawnAvailable([sTeam])
{
	return (C_ISVAR::GetAsBool("GLClassicPostRespawnPermEnabled")
		|| (C_ISVAR::GetAsBool("GLClassicPostRespawnEnabled") 
			&& GetTime() < (C_IGLSTATE::GetInReleasedTime(sTeam) + C_ISVAR::GetAsInt("GLClassicPostRespawnTime") * 1000)));
}

GL_OnCJoinedTeam(args)
{
	if (IsAlive(self))
		return;
	
	if (C_IGLSTATE::IsIN())
		self C_ICHUD::CEnable();
	else
		self C_ICHUD::CDisable();

	self C_ICTEAM::JoinAllies();
	if (self.pers["team"] != "allies")
		return;
	
	if (self IsSpawnAvailable())
		self C_ICPLAYER::SpawnPlayer();
}

DMG_OnCDelayKilled(args)
{
	if (C_ICDAMAGE::IsSuicideSilent(args))
		return;
		
	waittillframeend; // let the callback playerKilled finish
	
	if (!IsDefined(self) || IsAlive(self))
		return;

	if (!C_IGLSTATE::IsPOST()
		&& C_ICDAMAGE::IsEnemy(args))
	{
		if (self.pers["team"] == "allies" 
			&& ICLIST::GetAllAllies(true).size == 0 
			&& C_IGLSTATE::IsINReleased("allies"))
		{
			C_IGLLOGIC::EndGame(C_IGLLOGIC::iEG_Winner, "axis", args.eAttacker);
			return;
		}
			
		if (self.pers["team"] == "axis" 
			&& ICLIST::GetAllAxis(true).size == 0 
			&& C_IGLSTATE::IsINReleased("axis"))
		{
			C_IGLLOGIC::EndGame(C_IGLLOGIC::iEG_Winner, "allies", args.eAttacker);
			return;
		}
	}
	
	if (self IsSpawnAvailable())
		self C_ICPLAYER::SpawnPlayer();
	else
	{
		self.SessionState = "spectator";
		self.SpectatorClient = -1;

		self AllowSpectateTeam("freelook", true);
		self AllowSpectateTeam("allies", true);
		self AllowSpectateTeam("axis", true);
		self AllowSpectateTeam("none", true);
	}
}

// ================================================================================================ //
#region Starting Timers

private JumpersBeginningTimer()
{
	iTime = C_ISVAR::GetAsInt("GLClassicTimeJumpers");
	if (iTime != 0)
		C_IGLHUD::CreateTimer(iTime, "allies", C_ILOCALIZE::LTimeJumpers);
		
	C_IGLLOGIC::ReleaseJumpers();
}

#endregion
// ================================================================================================ //
#region ACTIVATORS BEGINNING TIMER
// connected with FREE RUN!

private ActivatorsBeginningTimerCreate()
{
	freezeTime = C_ISVAR::GetAsInt("GLClassicTimeActivators");
	if (freezeTime > 0)
	{
		level._activatorsTimeEnd = GetTime() + (freezeTime * 1000);
	
		if (!C_IGLTYPE::IsFreeRunAvailable())
		{
			activators = ICLIST::GetAllAxis();
			foreach (player in activators)
				player CActivatorTimerCreate();
		}
	
		wait freezeTime;
		level._activatorsTimeEnd = undefined;
	}

	C_IGLLOGIC::ReleaseActivators();
}

private CActivatorTimerCreate()
{
	if (!IsDefined(level._activatorsTimeEnd))
		return;
		
	time = Int((level._activatorsTimeEnd - GetTime()) / 1000);
	if (time > 1)
		self C_IGLHUD::CUpdateHud(C_ILOCALIZE::LTimeActivators, time);
}

#endregion
// ================================================================================================ //
#region FREE RUN
// connected with ACTIVATORS TIMER

BTN_OnCPressedFrag(args)
{
	if (IsActivatorsFreeRunTimerActive()
		&& self CIsFreeRunTimerActive()
		&& self.pers["team"] == "axis"
		&& IsAlive(self))
	{
		level._freeRunChoosing++;
		
		activators = ICLIST::GetAllAxis();
		agreeFraction = level._freeRunChoosing / activators.size;
		if (activators.size == 1 || agreeFraction >= C_ISVAR::GetAsFloat("GLFreeRunChooseFraction"))
		{
			foreach (player in activators)
				player CFreeRunTimerDestroy();
		
			ActivatorsFreeRunTimerDestroy();
			
			C_IGLTYPE::StartFreeRun();
		}
		else
			self CFreeRunTimerDestroy();
	}
}

/// TT, bIsActivatedAuto
ML_OnCTouchedTT(args)
{
	if (IsActivatorsFreeRunTimerActive()
		&& !C_ISVAR::GetAsBool("GLFreeRunAfterActivated"))
	{
		pActivators = ICLIST::GetAllAxis();
		foreach (player in pActivators)
			player CFreeRunTimerDestroy();
	
		ActivatorsFreeRunTimerDestroy();
	}
}

private ActivatorsFreeRunTimerCreate()
{
	level endon("FreeRunChoosingEnded");

	if (!C_IGLTYPE::IsFreeRunAvailable())
		return;
	
	// number of players which agree
	level._freeRunChoosing = 0;
	
	activators = ICLIST::GetAllAxis();
	foreach (player in activators)
		player thread CFreeRunTimerCreate();
	
	wait C_ISVAR::GetAsInt("GLFreeRunChooseTime");
	thread ActivatorsFreeRunTimerDestroy();
}

private IsActivatorsFreeRunTimerActive()
{
	return IsDefined(level._freeRunChoosing);
}

private ActivatorsFreeRunTimerDestroy()
{
	level._freeRunChoosing = undefined;
	level notify("FreeRunChoosingEnded");
}

private CFreeRunTimerCreate()
{
	self endon("disconnect");

	self._freeRunTimer = true;
	
	time = C_ISVAR::GetAsInt("GLFreeRunChooseTime");
	self C_IGLHUD::CUpdateHudBindable(C_ILOCALIZE::LDisableTrapsHintPre, "+frag", C_ILOCALIZE::LDisableTrapsHintPost, time);
	
	self INOTIFY::WaittillAnyTime(time, "death", "FreeRunChoosingEnded");
	
	self CFreeRunTimerDestroy();
	
	self CActivatorTimerCreate();
}

private CIsFreeRunTimerActive()
{
	return IsDefined(self._freeRunTimer);
}

private CFreeRunTimerDestroy()
{
	if (!IsDefined(self._freeRunTimer))
		return;
		
	self._freeRunTimer = undefined;
	self C_ICHUD::ResetLower();
	self notify("FreeRunChoosingEnded");
}

#endregion
// ================================================================================================ //