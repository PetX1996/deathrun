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
	self.PERK_bIsFastRunActive = undefined;
	self C_ICPERK::CBtnPrepare();
}

private SpeedInc = 1.7;
private ActiveTime = 3;
private RechargeDelay = 20;

BTN_OnCPressedSecondaryFrag(args)
{
	if (IsDefined(self.PERK_bIsFastRunActive))
		return;

	self SetMoveSpeedScale(C_ISVAR::GetAsFloat("CJSpeed") * SpeedInc);
	self.PERK_bIsFastRunActive = true;
	self C_ICPERK::CBtnSetColor("^2");
	
	args = IECALLBACK::Args_Create();
	self C_INIT::PERK_RunOnCActivatedFastRun(args);
	
	self thread RechargeFastRun();
}

private RechargeFastRun()
{
	self INOTIFY::WaittillAnyTime(ActiveTime, "death", "disconnect");
	if (!IsDefined(self) || !IsAlive(self))
		return;

		
	self SetMoveSpeedScale(C_ISVAR::GetAsFloat("CJSpeed"));
	self C_ICPERK::CBtnSetColor("^1");
		
	self INOTIFY::WaittillAnyTime(RechargeDelay, "death", "disconnect");
	if (!IsDefined(self) || !IsAlive(self))
		return;
		
		
	self.PERK_bIsFastRunActive = undefined;
	self C_ICPERK::CBtnSetColor();
}