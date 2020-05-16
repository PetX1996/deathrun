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
	Ports("trap3t");
	
	Ports("pt0");
	Ports("pt1");
	
	Ports("at0");
	Ports("at1");
	
	// secret
	Ports("secrettele");
}

Ports(sName)
{
	eTrigs = GetEntArray(sName, "targetname");
	for (i = 0; i < eTrigs.size; i++)
		eTrigs[i] thread WatchTrigger();
}

WatchTrigger()
{
	while (true)
	{
		self waittill("trigger", pPlayer);
		pPlayer thread mapper\_player::CTeleportRandom(self.target, true);
	}
}

