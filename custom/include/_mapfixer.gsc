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

#include custom\include\_usings;
#include core\include\_usings;

public RegTT(sClassName, vOrigin, [sTargetName])
{
	eTT = C_IMAPFIXERUTIL::Entity_OnlyGet(sClassName, vOrigin, sTargetName);
	IEXCEPTION::EntityExist(eTT, "MAPFIXER - Could not find entity " + IENTITY::CreateFullName(sClassName, sTargetName, vOrigin));
	
	C_IMLLOGIC::RegTT(eTT, C_IMLLOGIC::iPriorMapFixer);
}

public RegTJ(sClassName, vOrigin, [sTargetName])
{
	eTJ = C_IMAPFIXERUTIL::Entity_OnlyGet(sClassName, vOrigin, sTargetName);
	IEXCEPTION::EntityExist(eTJ, "MAPFIXER - Could not find entity " + IENTITY::CreateFullName(sClassName, sTargetName, vOrigin));
	
	C_IMLLOGIC::RegTJ(eTJ, C_IMLLOGIC::iPriorMapFixer);
}

public RegTJWithoutTT(sClassName, vOrigin, [sTargetName])
{
	eTJ = C_IMAPFIXERUTIL::Entity_OnlyGet(sClassName, vOrigin, sTargetName);
	IEXCEPTION::EntityExist(eTJ, "MAPFIXER - Could not find entity " + IENTITY::CreateFullName(sClassName, sTargetName, vOrigin));
	
	C_IMLLOGIC::RegTJWithoutTT(eTJ, C_IMLLOGIC::iPriorMapFixer);
}

public RegEM(sClassName, vOrigin, [sTargetName])
{
	eEM = C_IMAPFIXERUTIL::Entity_OnlyGet(sClassName, vOrigin, sTargetName);
	IEXCEPTION::EntityExist(eEM, "MAPFIXER - Could not find entity " + IENTITY::CreateFullName(sClassName, sTargetName, vOrigin));
	
	C_IMLLOGIC::RegEM(eEM, C_IMLLOGIC::iPriorMapFixer);
}


public S_Register(sTeam, sClassName, vOrigin, vAngles)
{
	if (!IsDefined(level.Spawns))
		level.Spawns = [];
		
	if (!IsDefined(level.Spawns[sTeam]))
		level.Spawns[sTeam] = [];
		
	spawn = C_ICSPAWN::CreateFakeSpawnPoint(sClassName, vOrigin, vAngles, true);
	level.Spawns[sTeam][level.Spawns[sTeam].size] = spawn;
	
	level.MF.S_iLastSize[sTeam] = level.Spawns[sTeam].size;
}