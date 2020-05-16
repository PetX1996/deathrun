// +========================================================================+
// I                    ___  _____  _____                                   I
// I                   /   !!  __ \!  ___!                                  I
// I                  / /! !! !  \/! !_          ___  ____                  I
// I                 / /_! !! ! __ !  _!        / __!!_  /                  I
// I                 \___  !! !_\ \! !      _  ! (__  / /                   I
// I                     !_/ \____/\_!     (_)  \___!/___!                  I
// I                                                                        I
// I========================================================================I
// I                            mp_dr2_orangesky                            I
// I========================================================================I
// I                      mapped by:  Col!ar                                I
// I                    scripted by:  PetX                                  I
// I                        website:  4GF.CZ                                I
// +========================================================================+

Main()
{
	eTrig = GetEnt("fake", "targetname");
	eTrig thread WatchTrigger();
}

WatchTrigger()
{
	while (true)
	{
		self waittill("trigger", pPlayer);
		self DoFake(pPlayer);
	}
}

DoFake(pPlayer)
{
	pPlayer IPrintLnBold("It's not a secret room! Dumb!");
	pPlayer IPrintLnBold("Activator thanks for your sacrifice.");
	pPlayer IPrintLnBold("You have 20 seconds of life");
	pPlayer TakeAllWeapons();
	pPlayer mapper\_player::CTeleportRandom(self.target, true);
	
	pPlayer thread CKillAfterTime();
}

CKillAfterTime()
{
	self endon("disconnect");
	self endon("death");
	
	wait 20;
	
	self Suicide();
}