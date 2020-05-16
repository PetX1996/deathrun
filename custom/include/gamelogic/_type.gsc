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

// GAMETYPE
public sealed iType_None = -1;
public sealed iType_Disabled = 0;
public sealed iType_TrainingRound = 1;
public sealed iType_Classic = 2;
public sealed iType_OneTeam = 3;
public sealed iType_SIZE = 4;

public Set(iGT)
{
	level._GL_iGT = iGT;
}

public IsDisabled()
{
	return level._GL_iGT == iType_Disabled;
}

public IsOneTeam()
{
	return level._GL_iGT == iType_OneTeam;
}

public IsTrainingRound()
{
	return level._GL_iGT == iType_TrainingRound;
}

public IsClassic()
{
	return level._GL_iGT == iType_Classic;
}

public IsSinglePlayer()
{
	return IsDefined(level.bLIsSinglePlayer);
}

public IsFreeRunAvailable()
{
	return C_ISVAR::GetAsBool("GLFreeRunEnabled") 
		&& (C_ISVAR::GetAsBool("GLFreeRunWithoutTTs") || (C_IMLLOGIC::GetTTList().iCount > 0));
}

public IsFreeRun()
{
	return IsDefined(level.freeRun) && level.freeRun;
}

public StartFreeRun()
{
	C_ICCMD::SetDvarToAll("ui_hudLType", C_ILOCALIZE::LFreeRun);
	level.freeRun = true; // DR1
	level.trapsDisabled = true; // DR1
	
	C_ICMSG::SPrintLnBold(C_ILOCALIZE::LDisableTraps);
	C_IMLLOGIC::AllowTTs(false);
	
	pAlives = ICLIST::GetAllPlayingPlayers(true);
	foreach (pAlive in pAlives)
		pAlive CSetFreeRunClass();
	
	args = IECALLBACK::Args_Create();
	C_INIT::GL_RunOnSStartedFreeRun(args);
}

private CSetFreeRunClass()
{
	iHealth = 0;
	sWeapon = "";
	if (self.pers["team"] == "allies")
	{
		iHealth = C_ISVAR::GetAsInt("GLFreeRunJHealth");
		sWeapon = C_ISVAR::GetAsStr("GLFreeRunJWeapon");
	}
	else if (self.pers["team"] == "axis")
	{
		iHealth = C_ISVAR::GetAsInt("GLFreeRunAHealth");
		sWeapon = C_ISVAR::GetAsStr("GLFreeRunAWeapon");		
	}
	else
		return;
	
	if (iHealth != 0)
		self C_ICPLAYER::CSetHealth(iHealth, iHealth);
	
	if (sWeapon != "")
	{
		self TakeAllWeapons();
		self C_ICWEAPON::CGiveWeapon(sWeapon);
	}
}

public StartSinglePlayer(iPlayersNeeded, fTimeLimit)
{
	level.bLIsSinglePlayer = true;
	C_IGLLOGIC::FreezeTeam(false);
	C_IGLLOGIC::StartGame(fTimeLimit * 60);
	VisionSetNaked(level.script, 5);
	
	C_IGLLOGIC::ReleaseJumpers();
	C_IGLLOGIC::ReleaseActivators();
	
	args = IECALLBACK::Args_Create();
	C_INIT::GL_RunOnSStartedSinglePlayer(args);
	
	C_IGLLOGIC::WaitForMorePlayers(iPlayersNeeded);
	
	C_IGLLOGIC::FinishRound();
}