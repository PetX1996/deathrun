// +========================================================================+
// I                    ___  _____  _____                                   I
// I                   /   !!  __ \!  ___!                                  I
// I                  / /! !! !  \/! !_          ___  ____                  I
// I                 / /_! !! ! __ !  _!        / __!!_  /                  I
// I                 \___  !! !_\ \! !      _  ! (__  / /                   I
// I                     !_/ \____/\_!     (_)  \___!/___!                  I
// I                                                                        I
// I========================================================================I
// I                             mp_dr2_view                                I
// I========================================================================I
// I                      mapped by:  Col!ar                                I
// I                    scripted by:  PetX                                  I
// I                        website:  4GF.CZ                                I
// +========================================================================+

TrapActivator(iNumber)
{
	trigger = GetEnt("use" + iNumber, "targetname");
	
	if(IsDefined(trigger))
	{
		api\maplogic\_logic::RegTT("use" + iNumber);
		trigger waittill("trigger");
		trigger Delete();
	}
	else
		level waittill("uadhiuawhdauiwhd"); // freezes thread -> does not activate trap
}

EKillPlayersInside()
{
	players = GetEntArray("player", "classname");
	for (i = 0; i < players.size; i++)
	{
		p = players[i];
		if (IsPlayer(p) && IsAlive(p) && p IsTouching(self))
			p Suicide();
	}
}
/*
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
}*/