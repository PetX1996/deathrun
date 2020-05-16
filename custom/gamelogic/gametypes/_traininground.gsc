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
	C_IGLTYPE::Set(C_IGLTYPE::iType_TrainingRound);
	IECALLBACK::AddModEvent("GL_OnCConnected", ::GL_OnCConnected);
	IECALLBACK::AddModEvent("GL_OnSElapsedTime", ::GL_OnSElapsedTime);
	IECALLBACK::AddModEvent("GL_OnCJoinedTeam", ::GL_OnCJoinedTeam);
	IECALLBACK::AddModEvent("DMG_OnCDelayKilled", ::DMG_OnCDelayKilled);
}

private GameLogic()
{
	C_IGLLOGIC::PreMatchWaitting();
	VisionSetNaked(level.script);
	
	wait 0.5;

	C_IGLLOGIC::StartGame(C_ISVAR::GetAsFloat("GLTrainingRoundTimeLimit") * 60);
	
	C_IGLLOGIC::ReleaseJumpers();
	C_IGLLOGIC::ReleaseActivators();
	
	C_IDEBUG::Debug("TrainingRound", C_IDEBUG::TYPE_INFO);
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
	if (C_IGLTIMER::GetRemaining() == 0)
	{
		C_IGLLOGIC::EndGame(C_IGLLOGIC::iEG_TimeReached);
		return;
	}
}

private IsSpawnAvailable()
{
	return (!C_IGLSTATE::IsPOST());
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