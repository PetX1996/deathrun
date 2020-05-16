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
	BuildSpawnSystem();
}

InCPreSpawning(args)
{
	spawns = C_ICSPAWN::GetSpawnPoints(self.pers["team"]);
	spawnPoint = C_ICSPAWN::GetRandomFreeSpawnPoint(spawns);
	args.SpawnPoint = spawnPoint;
}

private BuildSpawnSystem()
{
	// === SPECTATOR ===
	C_ICSPAWN::RegisterSpawnPoints("spectator", "dr2_spawn_spectator", "classname", false);
	if (C_ICSPAWN::GetSpawnPointsCount("spectator", true) == 0)
		C_ICSPAWN::RegisterSpawnPoints("spectator", "mp_global_intermission", "classname", false);
		
	C_ICSPAWN::CheckSpawnPoints("spectator");
	
	// === JUMPERS ===
	C_ICSPAWN::RegisterSpawnPoints("allies", "dr2_spawn_jumper", "classname", true);
	if (C_ICSPAWN::GetSpawnPointsCount("allies", true) == 0)
		C_ICSPAWN::RegisterSpawnPoints("allies", "mp_jumper_spawn", "classname", true);
	if (C_ICSPAWN::GetSpawnPointsCount("allies", true) == 0)
		C_ICSPAWN::RegisterSpawnPoints("allies", "mp_dm_spawn", "classname", true);
		
	C_ICSPAWN::CheckSpawnPoints("allies");
	
	// === ACTIVATOR ===
	C_ICSPAWN::RegisterSpawnPoints("axis", "dr2_spawn_activator", "classname", true);
	if (C_ICSPAWN::GetSpawnPointsCount("axis", true) == 0)
		C_ICSPAWN::RegisterSpawnPoints("axis", "mp_activator_spawn", "classname", true);
	if (C_ICSPAWN::GetSpawnPointsCount("axis", true) == 0)
		C_ICSPAWN::RegisterSpawnPoints("axis", "mp_tdm_spawn", "classname", true);
		
	if (!C_ISVAR::GetAsBool("GLOneTeamEnabled"))
		C_ICSPAWN::CheckSpawnPoints("axis");
}