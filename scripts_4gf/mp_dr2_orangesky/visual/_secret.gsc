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
	eDmgTrig = GetEnt("secret", "targetname");
	eDmgTrig thread WatchDmgTrig();
	
	mapper\_player::RegEvent_OnCConnected(::OnCConnected);
}

WatchDmgTrig()
{
	self waittill("trigger");
	
	eBrush = GetEnt(self.target, "targetname");
	eBrush Delete();
	self Delete();
	
	eSecret = GetEnt("secretfin", "targetname");
	eSecret thread WatchSecretTrigger();
}

WatchSecretTrigger()
{
	while (true)
	{
		self waittill("trigger", pPlayer);
		
		// p can do it only once per round
		if (!self mapper\_entity::EListContaints("secretEnters", pPlayer))
		{
			self mapper\_entity::EListAdd("secretEnters", pPlayer);
			pPlayer thread CDoSecretAction();
		}
	}
}

CDoSecretAction()
{
	IPrintLnBold(self.name + " ^7has just finished the secret room.");

	if (!self mapper\_challenges::CIsCompleted("secret"))
	{
		// complete ch + give XP
		self mapper\_challenges::CProceed("secret");
		
		self mapper\_rank::CGiveScoreXP(250);
		
		self IPrintLnBold("You earned a life");
		self mapper\_lifes::CGive();
	}
	else
		self mapper\_rank::CGiveScoreXP(50);
}

OnCConnected(args)
{
	if (self mapper\_player::CIsFirstPlayedRound()
		&& self mapper\_challenges::CIsCompleted("secret"))
	{
		self IPrintLnBold("You earned a life because you have already finished a secret.");
		self mapper\_lifes::CGive();
	}
}
