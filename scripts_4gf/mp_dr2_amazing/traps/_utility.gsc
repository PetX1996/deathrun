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

#include custom\include\_usings;

TrapActivator(iNumber)
{
	trigger = getEnt("t" + iNumber, "targetname");
	
	if(IsDefined(trigger))
	{
		api\maplogic\_logic::RegTT("t" + iNumber);
		trigger waittill("trigger");
		trigger Delete();
	}
	else
		level waittill("uadhiuawhdauiwhd"); // freezes thread -> does not activate trap
}

KillPlayersInTrigger(trigger)
{
	players = GetEntArray("player", "classname");
	for (i = 0; i < players.size; i++)
	{
		player = players[i];
		if (IsPlayer(player) && IsAlive(player) && player IsTouching(trigger))
			player Suicide();
	}
}

SpeedSlider(minVelocity, maxVelocity, minDelay, maxDelay)
{
	targets = GetEntArray(self.target, "targetname");

	startPos = targets[0].origin;
	
	if (targets.size > 1)
		endPos = targets[1].origin;
	else
		endPos = self.origin;
	
	while( true )
	{
		if(self.origin == startPos)
			targetPoint = endPos;
		else if(self.origin == endPos)
			targetPoint = startPos;
		else if(RandomInt(99) % 2)
			targetPoint = endPos;
		else
			targetPoint = startPos;
		
		if (minVelocity == maxVelocity)
			v = minVelocity;
		else
			v = RandomFloatRange(minVelocity, maxVelocity);
			
		self MoveTo(targetPoint, Distance(self.origin, targetPoint) / v);
		
		self waittill("movedone");
		
		if (minDelay == maxDelay)
			wait minDelay;
		else
			wait RandomFloatRange(minDelay, maxDelay);
	}
}