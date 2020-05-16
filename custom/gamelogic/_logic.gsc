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

InSStarting(args)
{
	if (IGAME::IsFirstRound())
		UpdateTrainingRoundAllow();

	GameLogic();
}

private UpdateTrainingRoundAllow()
{
	if (C_ISVAR::GetAsBool("GLTrainingRoundEnabled"))
		C_IGLROUNDS::Set(0);
	else
		C_IGLROUNDS::Set(1);
}

InCPreConnecting(args)
{
	args.DvarDic IDIC::Add("ui_hudLAllies", ICLIST::GetAllAllies(true).size);
	args.DvarDic IDIC::Add("ui_hudLAxis", ICLIST::GetAllAxis(true).size);
}

OnCSpawned(args)
{
	if (C_IGLLOGIC::IsTeamFreezed(self.pers["team"]))
	{
		self C_ICPLAYER::FreezeMove(true);
		self DisableWeapons();
	}
	
	thread UpdateTeamAlivesCount();
}

private UpdateTeamAlivesCount()
{
	iAllies = ICLIST::GetAllAllies(true).size;
	iAxis = ICLIST::GetAllAxis(true).size;
	foreach (player in level.players)
		player SetClientDvars("ui_hudLAllies", iAllies, "ui_hudLAxis", iAxis);
}

// ================================================================================ //
#region LOGIC EVENTS

GL_OnCJoinedSpectators(args)
{
	self C_ICTEAM::JoinSpectator();
	self C_ICHUD::CEnable();
}

DMG_OnCDelayKilled(args)
{
	if (C_ICDAMAGE::IsSuicideSilent(args))
		return;
	
	UpdateTeamAlivesCount();
}

#endregion
// ================================================================================ //
#region MAIN LOGIC

private GameLogic()
{
	if (!C_IGLLOGIC::IsEnabled())
		custom\gamelogic\gametypes\_disabled::StartLogic();
	else if (C_ISVAR::GetAsBool("GLTrainingRoundEnabled")
		&& C_IGLROUNDS::Get() == 0)
		custom\gamelogic\gametypes\_traininground::StartLogic();
	else if (C_ISVAR::GetAsBool("GLOneTeamEnabled"))
		custom\gamelogic\gametypes\_oneteam::StartLogic();
	else
		custom\gamelogic\gametypes\_classic::StartLogic();
}