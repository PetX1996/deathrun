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
// Mod      : Core
// Website  : http://www.4gf.cz/
//I========================================================================I
// Script by: PetX
//I========================================================================I

#include core\include\_usings;

/// <summary>
/// Gets all players in the game.
/// </summary>
/// <returns>Player[]</returns>
/// <param name="isAlive">Bool</param>
/// <param name="team">String</param>
public GetAllPlayers([isAlive], [team])
{
	players = undefined;
	if (IsDefined(team))
	{
		if (team == "allies")
			players = level._alliesPlayers;
		else if (team == "axis")
			players = level._axisPlayers;
		else if (team == "spectator")
			players = level._spectatorPlayers;
		else
			IEXCEPTION::ArgumentMsg("team");
	}
	else
		players = level.players;

	if (IsDefined(isAlive))
	{
		if (isAlive)
			return FilterAlivePlayers(players);
		else
			return FilterDeadPlayers(players);
	}
	
	return players;
}

/// <summary>
/// Gets all players in any playing team.
/// </summary>
/// <returns>Player[]</returns>
/// <param name="isAlive">Bool</param>
/// <param name="team">String</param>
public GetAllPlayingPlayers([isAlive], [team])
{
	players = undefined;
	if (IsDefined(team))
	{
		if (team == "allies")
			players = level._alliesPlayers;
		else if (team == "axis")
			players = level._axisPlayers;
		else
			IEXCEPTION::ArgumentMsg("team");
	}
	else
		players = IARRAY::AddRange(level._alliesPlayers, level._axisPlayers);
		
	if (IsDefined(isAlive))
	{
		if (isAlive)
			return FilterAlivePlayers(players);
		else
			return FilterDeadPlayers(players);
	}
	
	return players;
}

/// <summary>
/// Gets all players in team ALLIES.
/// </summary>
/// <returns>Player[]</returns>
/// <param name="isAlive">Bool</param>
public GetAllAllies([isAlive])
{
	if (IsDefined(isAlive))
	{
		if (isAlive)
			return FilterAlivePlayers(level._alliesPlayers);
		else
			return FilterDeadPlayers(level._alliesPlayers);
	}
	
	return level._alliesPlayers;
}

/// <summary>
/// Gets all players in team AXIS.
/// </summary>
/// <returns>Player[]</returns>
/// <param name="isAlive">Bool</param>
public GetAllAxis([isAlive])
{
	if (IsDefined(isAlive))
	{
		if (isAlive)
			return FilterAlivePlayers(level._axisPlayers);
		else
			return FilterDeadPlayers(level._axisPlayers);
	}
	
	return level._axisPlayers;
}

/// <summary>
/// Gets all players in team SPECTATOR.
/// </summary>
/// <returns>Player[]</returns>
public GetAllSpectators()
{
	return level._spectatorPlayers;
}

private FilterAlivePlayers(players)
{
	alives = [];
	foreach (player in players)
		if (IsAlive(player))
			alives[alives.size] = player;
		
	return alives;
}

private FilterDeadPlayers(players)
{
	deads = [];
	foreach (player in players)
		if (!IsAlive(player))
			deads[deads.size] = player;
		
	return deads;
}