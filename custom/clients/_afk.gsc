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

OnCSpawned(args)
{
	self thread CMonitorActions();
}

MENU_OnCOpened(args)
{
	self ResetFromUI();
}

MENU_OnCResponded(args)
{
	self ResetFromUI();
}

private ResetFromUI()
{
	if (C_ISVAR::GetAsBool(self C_ISVAR::CGetCTeamPrefix() + "AFKUIEnabled"))
		self C_ICAFK::CResetAFK();
}

private CMonitorActions()
{
	self endon("disconnect");
	self endon("death");
	
	self.AFK_iAFKTimes = undefined;
	self.AFK_iStuckTimes = undefined;
	self.AFK_vLastAngles = self GetPlayerAngles();
	self.AFK_vLastOrigin = self.origin;
	wait 1;
	
	while (true)
	{
		if (!C_IGLTYPE::IsDisabled()
			&& !C_IGLTYPE::IsTrainingRound()
			&& !C_IGLTYPE::IsSinglePlayer()
			&& C_IGLSTATE::IsINReleased(self.pers["team"]))
			self CUpdateState();
			
		wait 1;
	}
}

private CUpdateState()
{
	vCurAngles = self GetPlayerAngles();
	vCurOrigin = self.origin;
	
	if (vCurOrigin == self.AFK_vLastOrigin)
	{
		if (!IsDefined(self.AFK_iStuckTimes))
			self.AFK_iStuckTimes = 0;
			
		self.AFK_iStuckTimes++;
		if (!IsDefined(self.AFK_iAFKTimes)) // p is stuck but not AFK
			self CDoStuckAction(self.AFK_iStuckTimes);
	}
	else
		self C_ICAFK::CResetStuck();
	
	if (vCurAngles == self.AFK_vLastAngles)
	{
		if (!IsDefined(self.AFK_iAFKTimes))
			self.AFK_iAFKTimes = 0;
			
		self.AFK_iAFKTimes++;
		self CDoAFKAction(self.AFK_iAFKTimes);
	}
	else
		self C_ICAFK::CResetAFK();
		
	self.AFK_vLastAngles = vCurAngles;
	self.AFK_vLastOrigin = vCurOrigin;
}

private CDoStuckAction(iSeconds)
{
	if (!C_ISVAR::GetAsBool(self C_ISVAR::CGetCTeamPrefix() + "StuckEnabled"))
		return;
		
	if (iSeconds == C_ISVAR::GetAsInt(self C_ISVAR::CGetCTeamPrefix() + "StuckWarnTime"))
		self thread C_ICAFK::CWarnStuck(iSeconds);
	else if (iSeconds == C_ISVAR::GetAsInt(self C_ISVAR::CGetCTeamPrefix() + "StuckKillTime"))
		self thread C_ICAFK::CFinishStuck(iSeconds);
}

private CDoAFKAction(iSeconds)
{
	if (!C_ISVAR::GetAsBool(self C_ISVAR::CGetCTeamPrefix() + "AFKEnabled"))
		return;
		
	if (iSeconds == C_ISVAR::GetAsInt(self C_ISVAR::CGetCTeamPrefix() + "AFKWarnTime"))
		self thread C_ICAFK::CWarnAFK(iSeconds);
	else if (iSeconds == C_ISVAR::GetAsInt(self C_ISVAR::CGetCTeamPrefix() + "AFKFinishTime"))
		self thread C_ICAFK::CFinishAFK(undefined, iSeconds);
}