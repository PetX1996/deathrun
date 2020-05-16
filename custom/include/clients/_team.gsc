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

public JoinAllies()
{
	self endon("disconnect");

	oldTeam = self.pers["team"];
	args = IECALLBACK::Args_Create();
	args.bCancel = undefined;
	args.sOldTeam = oldTeam;
	args.sNewTeam = "allies";
	
	self C_INIT::TEAM_RunInCPreJoining(args);
	
	args IECALLBACK::Args_Reset();
	self C_INIT::TEAM_RunInCPostJoining(args);

	if (IsDefined(args.bCancel))
		return;
	
	
	if ((oldTeam == "allies" || oldTeam == "axis") && IsAlive(self))
		self C_ICDAMAGE::CSuicideSilent();

	//iprintln("JoinAllies");
	
	self C_ICPLAYER::ClearPlayerState();
	self.AliveVars = undefined;
	
	self.pers["team"] = "allies";
	self.Team = "allies";
	self.SessionTeam = "allies";
	self.StatusIcon = "hud_status_dead";
	
	self UpdateClientsLists();
	
	
	self notify("joined_team");
	
	args IECALLBACK::Args_Reset();
	self C_INIT::TEAM_RunOnCJoined(args);
}

public JoinAxis()
{
	self endon("disconnect");

	oldTeam = self.pers["team"];
	args = IECALLBACK::Args_Create();
	args.bCancel = undefined;
	args.sOldTeam = oldTeam;
	args.sNewTeam = "axis";
	
	self C_INIT::TEAM_RunInCPreJoining(args);
	
	args IECALLBACK::Args_Reset();
	self C_INIT::TEAM_RunInCPostJoining(args);

	if (IsDefined(args.bCancel))
		return;
		
		
	if ((oldTeam == "allies" || oldTeam == "axis") && IsAlive(self))
		self C_ICDAMAGE::CSuicideSilent();
	
	//iprintln("JoinAxis");
	
	self C_ICPLAYER::ClearPlayerState();
	self.AliveVars = undefined;
	
	self.pers["team"] = "axis";
	self.Team = "axis";
	self.SessionTeam = "axis";
	self.StatusIcon = "hud_status_dead";
	
	self UpdateClientsLists();
	
	
	self notify("joined_team");
	
	args IECALLBACK::Args_Reset();
	self C_INIT::TEAM_RunOnCJoined(args);
}

public JoinSpectator()
{
	self endon("disconnect");

	oldTeam = self.pers["team"];
	args = IECALLBACK::Args_Create();
	args.bCancel = undefined;
	args.sOldTeam = oldTeam;
	args.sNewTeam = "spectator";
	
	self C_INIT::TEAM_RunInCPreJoining(args);
	
	args IECALLBACK::Args_Reset();
	self C_INIT::TEAM_RunInCPostJoining(args);

	if (IsDefined(args.bCancel))
		return;

	
	if ((oldTeam == "allies" || oldTeam == "axis") && IsAlive(self))
		self C_ICDAMAGE::CSuicideSilent();
	
	//iprintln("JoinSpectator");
	
	self C_ICPLAYER::ClearPlayerState();
	self.AliveVars = undefined;
	
	self.pers["team"] = "spectator";
	self.SessionTeam = "spectator";
	self.SessionState = "spectator";
	self.SpectatorClient = -1;
	self.StatusIcon = "";
	self.Team = "spectator";
	
	spawnPoints = C_ICSPAWN::GetSpawnPoints("spectator");
	spawnPoint = spawnPoints[RandomInt(spawnPoints.size)];
	self Spawn(spawnPoint.Origin, spawnPoint.Angles);	
	
	self AllowSpectateTeam("freelook", true);
	self AllowSpectateTeam("allies", true);
	self AllowSpectateTeam("axis", true);
	self AllowSpectateTeam("none", true);
	
	self UpdateClientsLists();
	
	
	self notify("joined_spectators");
	
	args IECALLBACK::Args_Reset();
	self C_INIT::TEAM_RunOnCJoined(args);
}

private UpdateClientsLists()
{
	level._alliesPlayers = IARRAY::Remove(level._alliesPlayers, self);
	level._axisPlayers = IARRAY::Remove(level._axisPlayers, self);
	level._spectatorPlayers = IARRAY::Remove(level._spectatorPlayers, self);
	
	if (self.pers["team"] == "allies")
		level._alliesPlayers[level._alliesPlayers.size] = self;
	else if (self.pers["team"] == "axis")
		level._axisPlayers[level._axisPlayers.size] = self;
	else if	(self.pers["team"] == "spectator")
		level._spectatorPlayers[level._spectatorPlayers.size] = self;
}