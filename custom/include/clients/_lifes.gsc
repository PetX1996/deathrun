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

public sealed MaxLifes = 4;

public CGiveLife()
{
	if (!C_ISVAR::GetAsBool("CLifesEnabled"))
		return;

	if (self CGetLifesCount() >= C_ISVAR::GetAsInt("CLifesCount"))
		return;
		
	args = IECALLBACK::Args_Create();
	args.bCancel = undefined;
	self C_INIT::LIFE_RunInCGiving(args);
	if (IsDefined(args.bCancel))
		return;
	
	self.pers["lifes"]++;
	self SetClientDvar("ui_hudSILifes", self.pers["lifes"]);
	
	args IECALLBACK::Args_Reset();
	self C_INIT::LIFE_RunOnCGave(args);
}

public CTakeLife()
{
	if (!C_ISVAR::GetAsBool("CLifesEnabled"))
		return;

	if (self CGetLifesCount() <= 0)
		return;
		
	self.pers["lifes"]--;
	self SetClientDvar("ui_hudSILifes", self.pers["lifes"]);
}

public CUseLife()
{
	args = IECALLBACK::Args_Create();
	args.bCancel = undefined;
	self C_INIT::LIFE_RunInCUsing(args);
	if (IsDefined(args.bCancel))
		return;	

	self C_ICLIFES::CTakeLife();
	self thread C_ICPLAYER::SpawnPlayer();
	
	args IECALLBACK::Args_Reset();
	self C_INIT::LIFE_RunOnCUsed(args);
}

public CGetLifesCount()
{
	return self.pers["lifes"];
}

public CLifeButtonWaitting()
{
	self endon("disconnect");
	self endon("spawned");
	self endon("joined_team");
	self endon("joined_spectators");

	if (!C_ISVAR::GetAsBool("CLifesEnabled"))
		return;

	if (self CGetLifesCount() <= 0)
		return;
		
	self C_ICHUD::SetLowerBindableTextAndTimer(C_ILOCALIZE::LIFESRespawnHintPre, "+activate",  C_ILOCALIZE::LIFESRespawnHintPost, C_ISVAR::GetAsInt("CLifesTimer"));
	
	iEndTime = GetTime() + (C_ISVAR::GetAsInt("CLifesTimer") * 1000);
	while (GetTime() < iEndTime)
	{
		if (self UseButtonPressed())
		{
			self C_ICHUD::ResetLower();
			self thread CUseLife();
			return;
		}
		
		wait 0.05;
	}
}