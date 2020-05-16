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

public RegisterSpawnPoints(team, keyValue, keyName, dropToGround)
{
	if(!IsDefined(level.Spawns))
		level.Spawns = [];

	if(!IsDefined(level.Spawns[team]))
		level.Spawns[team] = [];
		
	spawnPoints = GetEntArray(keyValue, keyName);
	foreach(spawnPoint in spawnPoints)
	{
		if(dropToGround)
			spawnPoint PlaceSpawnPoint();
			
		level.Spawns[team][level.Spawns[team].size] = spawnPoint;
	}
}

public CheckSpawnPoints(sTeam)
{
	if(GetSpawnPointsCount(sTeam, false) == 0)
	{
		level.Spawns[sTeam][0] = CreateFakeSpawnPoint(undefined, (0, 0, 0), (0, 0, 0), false);
		//MapError( "Spawns - Could not load any spawnPoints for \'" + sTeam + "\', gameType \'" + level.gametype + "\'" );
	}
}

public CreateFakeSpawnPoint(sClassName, vOrigin, vAngles, [bDropToGround])
{
	if (IsDefined(bDropToGround) && bDropToGround)
	{
		eOrigin = Spawn("script_origin", vOrigin);
		eOrigin PlaceSpawnPoint();
		vOrigin = eOrigin.origin;
		eOrigin Delete();
	}
	
	spawn = SpawnStruct();
	spawn.bIsFake = true;
	spawn.classname = sClassName;
	spawn.origin = vOrigin;
	spawn.angles = vAngles;
	return spawn;
}

public GetSpawnPoints(team)
{
	return level.Spawns[team];
}

public GetSpawnPointsCount(sTeam, bIgnoreFaked)
{
	if (IsDefined(bIgnoreFaked) && bIgnoreFaked)
		return level.Spawns[sTeam].size - level.MF.S_iLastSize[sTeam];
	else
		return level.Spawns[sTeam].size;
}

private DISTFROMSPAWN_MIN_SQ = 4096;
public IsSpawnPointFree(spawnPoint)
{
	foreach(player in level.players)
	{
		if(!IsAlive(player) || player.pers["team"] == "spectator")
			continue;
		
		if(DistanceSquared(spawnPoint.origin, player.origin) < DISTFROMSPAWN_MIN_SQ)
			return false;
	}
	return true;
}

public GetRandomFreeSpawnPoint(spawnPoints)
{
	startIndex = RandomInt(spawnPoints.size);
	i = startIndex;
	do
	{
		if(IsSpawnPointFree(spawnPoints[i]))
			return spawnPoints[i];
		
		i = (i + spawnPoints.size + 1) % spawnPoints.size;
	}
	while(i != startIndex);
	
	return spawnPoints[RandomInt(spawnPoints.size)];
}