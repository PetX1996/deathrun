// +========================================================================+
// I                    ___  _____  _____                                   I
// I                   /   !!  __ \!  ___!                                  I
// I                  / /! !! !  \/! !_          ___  ____                  I
// I                 / /_! !! ! __ !  _!        / __!!_  /                  I
// I                 \___  !! !_\ \! !      _  ! (__  / /                   I
// I                     !_/ \____/\_!     (_)  \___!/___!                  I
// I                                                                        I
// I========================================================================I
// I                           mp_dr2_amazing                               I
// I========================================================================I
// I                      mapped by:  R3MIEN, Col!ar      		            I
// I                    scripted by:  PetX                                  I
// I                        website:  www.4GF.cz                            I
// I========================================================================I
// I                           DEATHRUN 2 MOD                               I
// I========================================================================I

Main()
{
	trig = GetEnt("v_sandtrap_trig", "targetname");
	brush = GetEnt("v_sandtrap_brush", "targetname");

	totalTime = 20;
	activeDelay = totalTime * 0.625;
	activeDuration = totalTime * 0.28;
	
	// active trap
	trig waittill("trigger", player);
	
	brush NotSolid();
	brush MoveZ(256, totalTime);
	
	wait activeDelay;
	
	trig.CatchingInProgress = true;
	thread CatchingPlayers(trig);
	
	wait activeDuration;
	
	trig.CatchingInProgress = undefined;
	trig notify("catching_end");
	
	brush Solid();
	
	waittillframeend;
	trig notify("catching_finished");
}

CatchingPlayers(trig)
{
	trig endon("catching_finished");

	while (true)
	{
		trig waittill("trigger", player);
		if (IsDefined(trig.CatchingInProgress))
			thread CatchPlayer(trig, player);
	}
}

CatchPlayer(trig, player)
{
	if (IsDefined(player.IsCatched))
		return;
		
	player.IsCatched = true;
	DoCatchPlayer(trig, player);
	
	if (IsDefined(player))
	{
		player.IsCatched = undefined;
		if (IsAlive(player))
			player Suicide();
	}
}

DoCatchPlayer(trig, player)
{
	player endon("disconnect");
	player endon("death");

	//while (!player IsOnGround())
		//wait 0.05;
		
	player LinkTo(trig);
	
	trig waittill("catching_end");
}

