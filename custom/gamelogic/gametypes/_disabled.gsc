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
	C_IGLType::Set(C_IGLTYPE::iType_Disabled);
	IECALLBACK::AddModEvent("GL_OnCConnected", ::GL_OnCConnected);
	IECALLBACK::AddModEvent("GL_OnCJoinedTeam", ::GL_OnCJoinedTeam);
	IECALLBACK::AddModEvent("DMG_OnCDelayKilled", ::DMG_OnCDelayKilled);
}

private GameLogic()
{
	C_IGLLOGIC::PreMatchWaitting();
	VisionSetNaked(level.script);
	
	wait 0.5;
	
	C_IGLLOGIC::StartGame();

	C_IGLLOGIC::ReleaseJumpers();
	C_IGLLOGIC::ReleaseActivators();
}

GL_OnCConnected(args)
{
	self C_IGLLOGIC::CJoinTeam();
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
		
	self C_ICPLAYER::SpawnPlayer();
}

DMG_OnCDelayKilled(args)
{
	if (C_ICDAMAGE::IsSuicideSilent(args))
		return;
		
	waittillframeend; // let the callback playerKilled finish
	
	if (!IsDefined(self) || IsAlive(self))
		return;

	self C_ICPLAYER::SpawnPlayer();
}