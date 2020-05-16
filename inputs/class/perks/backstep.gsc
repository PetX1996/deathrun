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
	self.PERK_vBackStepPosition = undefined;
	self.PERK_vBackStepAngles = undefined;
	self C_ICPERK::CBtnPrepare();
}

private KeepTime = 15;

BTN_OnCPressedSecondaryFrag(args)
{
	if (!IsDefined(self.PERK_vBackStepPosition) && !IsDefined(self.PERK_vBackStepAngles))
	{
		// p have to be on solid brush
		trace = BulletTrace(self.origin + (0, 0, 10), self.origin + (0, 0, -10000), false, self);
		if (self IsOnGround() && IsDefined(trace["position"]) && !IsDefined(trace["entity"]))
		{
			self.PERK_vBackStepPosition = self.origin;
			self.PERK_vBackStepAngles = self GetPlayerAngles();
			self.PERK_bBackStepActivated = true;
			self C_ICPERK::CBtnSetColor("^2");
			self thread DeleteSavedPosAfterTime();
		}
	}
	else if (IsDefined(self.PERK_vBackStepPosition) && IsDefined(self.PERK_vBackStepAngles))
	{
		self thread TeleportToSavedPosition();
		self C_ICPERK::CBtnSetColor("^1");
	}
}

private TeleportToSavedPosition()
{
	self FreezeControls(true);
	self SetOrigin(self.PERK_vBackStepPosition);
	self SetPlayerAngles(self.PERK_vBackStepAngles);
	
	self.PERK_vBackStepAngles = undefined;
	
	args = IECALLBACK::Args_Create();
	self C_INIT::PERK_RunOnCActivatedBackStep(args);
	
	wait 0.1;
	if (IsDefined(self))
		self FreezeControls(false);
}

private DeleteSavedPosAfterTime()
{
	self INOTIFY::WaittillAnyTime(KeepTime, "death", "disconnect");
	if (!IsDefined(self) || !IsAlive(self))
		return;

	self.PERK_vBackStepAngles = undefined;
	self C_ICPERK::CBtnSetColor("^1");
}