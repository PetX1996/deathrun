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

// ENDGAME
public sealed iEG_Winner = 0;
public sealed iEG_Event = 1;
public sealed iEG_TimeReached = 2;
public sealed iEG_Forced = 3;
public sealed iEG_Map = 4;
public sealed iEG_SIZE = 5;

public IsEnabled()
{
	return !C_ISVAR::GetAsBool("DEVEnabled") && C_ISVAR::GetAsBool("GLEnabled");
}

public IsEnoughPlayers(playersNeeded)
{
	return ICLIST::GetAllPlayingPlayers(true).size >= playersNeeded;
}

public WaitForMorePlayers(iPlayersNeeded, [iMaxWaitTime])
{
	iStartTime = GetTime();
	while (true)
	{
		wait 1;
		
		if (IsEnoughPlayers(iPlayersNeeded))
			return true;

		if (IsDefined(iMaxWaitTime) 
			&& (GetTime() - iStartTime) >= (iMaxWaitTime * 1000))
			return false;
			
		C_IGLHUD::UpdateHud(C_ILOCALIZE::LWaitingForMorePlayers);
	}
}

public WaitForMorePlayersWithSinglePlayer(iPlayersNeeded, iSinglePlayerEnterTime, fRoundTimeLimit)
{
	if (iSinglePlayerEnterTime == 0)
		iSinglePlayerEnterTime = undefined;
	
	if (!C_IGLLOGIC::WaitForMorePlayers(iPlayersNeeded, iSinglePlayerEnterTime))
		C_IGLTYPE::StartSinglePlayer(iPlayersNeeded, fRoundTimeLimit);
}


public FreezeTeam(state, [team])
{
	if (state)
	{
		if (!IsDefined(team) || team == "allies")
			level._isAlliesFreezed = true;
		
		if (!IsDefined(team) || team == "axis")
			level._isAxisFreezed = true;
	}
	else
	{
		if (!IsDefined(team) || team == "allies")
			level._isAlliesFreezed = undefined;
		
		if (!IsDefined(team) || team == "axis")
			level._isAxisFreezed = undefined;
	}

	players = ICLIST::GetAllPlayingPlayers(true, team);
	foreach (player in players)
	{
		player C_ICPLAYER::FreezeMove(state);
		
		if (state)
			player DisableWeapons();
		else
			player EnableWeapons();
	}
}

public IsTeamFreezed(team)
{
	return (team == "allies" && IsDefined(level._isAlliesFreezed))
		|| (team == "axis" && IsDefined(level._isAxisFreezed));
}

public FinishRound()
{
	args = IECALLBACK::Args_Create();
	C_INIT::GL_RunInSTerminatingRound(args);
	
	Map_Restart(true);
}

public FinishMap()
{
	args = IECALLBACK::Args_Create();
	C_INIT::GL_RunInSTerminatingRound(args);
	
	args = IECALLBACK::Args_Create();
	C_INIT::GL_RunInSTerminatingMap(args);
	
	C_IROTATEMAP::RunNextMap();
}

public CConnected()
{
	args = IECALLBACK::Args_Create();
	self C_INIT::GL_RunOnCConnected(args);
}

public CJoinTeam()
{
	args = IECALLBACK::Args_Create();
	self C_INIT::GL_RunOnCJoinedTeam(args);
}

public CJoinSpectators()
{
	args = IECALLBACK::Args_Create();
	self C_INIT::GL_RunOnCJoinedSpectators(args);
}

public PreMatchWaitting()
{
	C_IGLSTATE::Set(C_IGLSTATE::iPRE_Waitting);
	C_IGLTIMER::Disable();
	
	game["state"] = "playing";
}

public PreMatchTimer(iSeconds, sMsg)
{
	C_IGLSTATE::Set(C_IGLSTATE::iPRE_Starting);
	C_IGLHUD::CreateTimer(iSeconds, undefined, sMsg);
}

public StartGame([fTimeLimit])
{
	if (!IsDefined(fTimeLimit)) fTimeLimit = 0;

	// -- DR 1.1
	level notify("start_round");
	level notify( "round_started", C_IGLROUNDS::Get() );
	level notify( "game started" );
	game["roundStarted"] = true;
	// --
	
	C_IGLSTATE::Set(C_IGLSTATE::iIN_Started);
	C_IGLTIMER::Set(fTimeLimit);
	
	C_ICHUD::EnableForAll();
	
	args = IECALLBACK::Args_Create();
	C_INIT::GL_RunOnSStartedGame(args);
	
	thread MonitorGameLogic();
}

private MonitorGameLogic()
{
	wait 1;

	while (true)
	{
		args = IECALLBACK::Args_Create();
		C_INIT::GL_RunOnSElapsedTime(args);
	
		wait 1;
	}
}

public ReleaseJumpers()
{
	FreezeTeam(false, "allies");
	C_IGLSTATE::Set(C_IGLSTATE::iIN_Released, "allies");
	
	args = IECALLBACK::Args_Create();
	C_INIT::GL_RunOnSReleasedJumpers(args);
}

public ReleaseActivators()
{
	FreezeTeam(false, "axis");
	C_IGLSTATE::Set(C_IGLSTATE::iIN_Released, "axis");
	
	args = IECALLBACK::Args_Create();
	C_INIT::GL_RunOnSReleasedActivators(args);
}

private GetVictoryReason(iType, [sWinningTeam], [pWinningPlayer])
{
	switch (iType)
	{
		case C_IGLLOGIC::iEG_Winner:
			if (IsDefined(sWinningTeam) && sWinningTeam == "allies" && IsDefined(pWinningPlayer))
				return pWinningPlayer.name + C_ILOCALIZE::VICPlayerKillActiv;
			else if (IsDefined(sWinningTeam) && sWinningTeam == "axis" && IsDefined(pWinningPlayer))
				return pWinningPlayer.name + C_ILOCALIZE::VICPlayerKillJumper;
				
			break;
		case C_IGLLOGIC::iEG_Event:
			if (IsDefined(sWinningTeam) && sWinningTeam == "allies")
				return C_ILOCALIZE::VICNoActivs;
			else if (IsDefined(sWinningTeam) && sWinningTeam == "axis")
				return C_ILOCALIZE::VICNoJumpers;
			
			break;
		case C_IGLLOGIC::iEG_TimeReached:
			return C_ILOCALIZE::VICNoTime;
		case C_IGLLOGIC::iEG_Forced:
			return C_ILOCALIZE::VICForced;
		default:
			break;
	}
	return "Could not create victory reason";
}

public EndGame(iType, [sWinningTeam], [pWinner], [sMsg])
{
	if (C_IGLSTATE::IsPOSTEnding())
		return;

	iStartGameTime = C_IGLSTATE::GetINStartedTime();
	iTime = 0;
	if (IsDefined(iStartGameTime))
	{
		//iprintln("iTime " + (GetTime() - iStartGameTime));
		iTime = Int(((GetTime() - iStartGameTime) / 1000) + 0.95); // magic number :)
	}
	
	if (!IsDefined(sMsg))
		sMsg = GetVictoryReason(iType, sWinningTeam, pWinner);
	
	C_IGLSTATE::Set(C_IGLSTATE::iPOST_Ending);
	C_IGLTIMER::Disable();
	
	game["state"] = "postgame";
	level notify("game_ended");
	
	args = IECALLBACK::Args_Create();
	args.iType = iType;
	args.sWinningTeam = sWinningTeam;
	args.pWinner = pWinner;
	C_INIT::GL_RunOnSEndedGame(args);
	
	
	
	
	C_IDEBUG::Debug("EndGame;" + iType);
	C_IVICTORY::Victory(iTime, sMsg, sWinningTeam);
	
	if (C_IGLROUNDS::Get() >= C_IGLROUNDS::GetLimit())
	{
		sMusicFullName = "";
		if (C_ISVAR::GetAsBool("GLMusicEnabled"))
		{
			music = C_IMUSIC::PickEOGMusic();
			if (IsDefined(music))
			{
				music C_IMUSIC::Music_Play();
				sMusicFullName = music.sName;
			}
		}
		
		C_IEOG::EOG(sMusicFullName);
	
		if (C_ISVAR::GetAsBool("VMEnabled"))
			C_IVOTEMAP::VoteMap(sMusicFullName);
		else
			C_IROTATEMAP::RotateMap();
	
		FinishMap();
	}
	else
	{
		C_IGLROUNDS::Inc();
		FinishRound();
	}
}