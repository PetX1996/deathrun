// +========================================================================+
// I                    ___  _____  _____                                   I
// I                   /   !!  __ \!  ___!                                  I
// I                  / /! !! !  \/! !_          ___  ____                  I
// I                 / /_! !! ! __ !  _!        / __!!_  /                  I
// I                 \___  !! !_\ \! !      _  ! (__  / /                   I
// I                     !_/ \____/\_!     (_)  \___!/___!                  I
// I                                                                        I
// I========================================================================I
// I                            mp_dr2_simonsays                            I
// I========================================================================I
// I                      mapped by:  Col!ar, R3MIEN                        I
// I                    scripted by:  PetX                                  I
// I                        website:  4GF.CZ                                I
// +========================================================================+

Main()
{
	BuildArray();
	SwitchPlatforms();
	
	HideAllSigns();
	EnableAllPlatforms();
	
	api\gamelogic\_logic::RegEvent_OnSReleasedJumpers(::GL_OnSStartedJumpers);
}

BuildArray()
{
	level.SS_eFlagsPlatforms = [];
	level.SS_eFlagsSigns = [];
	
	for (i = 0; i < 16; i++)
	{
		level.SS_eFlagsPlatforms[i] = GetEnt("flag" + i, "targetname");
		level.SS_eFlagsSigns[i] = GetEnt("f" + i, "targetname");
	}
}

SwitchPlatforms()
{
	for (i = 0; i < level.SS_eFlagsPlatforms.size; i++)
	{
		eCur = level.SS_eFlagsPlatforms[i];
		eOther = level.SS_eFlagsPlatforms[RandomInt(level.SS_eFlagsPlatforms.size)];
		
		vCurPos = eCur.origin;
		eCur.origin = eOther.origin;
		eOther.origin = vCurPos;
	}
}

HideAllSigns()
{
	for (i = 0; i < level.SS_eFlagsSigns.size; i++)
		level.SS_eFlagsSigns[i] Hide();
}

ShowSign(i)
{
	level.SS_eFlagsSigns[i] Show();
}

EnableAllPlatforms()
{
	for (i = 0; i < level.SS_eFlagsPlatforms.size; i++)
		level.SS_eFlagsPlatforms[i] Solid();
}

DisableOtherPlatforms(iNot)
{
	for (i = 0; i < level.SS_eFlagsPlatforms.size; i++)
	{
		if (i != iNot)
			level.SS_eFlagsPlatforms[i] NotSolid();
	}
}

GiveXPForAlives()
{
	pAlives = mapper\_teams::GetAllJumpers(true);
	for (i = 0; i < pAlives.size; i++)
		pAlives[i] mapper\_rank::CGiveScoreXP(5);
}


GL_OnSStartedJumpers(args)
{
	thread StartGame();
}

StartGame()
{
	AmbientPlay("flag");
	wait 11;

	for (i = 3; i > 0; i--)
	{
		IPrintLnBold("Start in " + i);
		wait 1;
	}
	
	IPrintLnBold("GO");
	api\gamelogic\_oneteam::AllowPostRespawnPermanentlly(false);
	mapper\_music::PlayNow("popcorn", "Gershon Kingsley - Popcorn Song 1969");
		
	fResponseMaxTime = 5;
	fResponseTime = fResponseMaxTime;
	fResponseDec = 0.2;
	
	fResponseDecMaxTimes = 5;
	fResponseDecTimes = fResponseDecMaxTimes;
	fResponseDecDec = 0.02;
	
	while (fResponseTime > 0
		&& mapper\_teams::GetAllJumpers(true).size > 0)
	{
		iPicked = RandomInt(level.SS_eFlagsPlatforms.size);
		ShowSign(iPicked);
		
		wait fResponseTime;
		//IPrintLn(fResponseTime + ";" + fResponseDec);
		fResponseTime -= fResponseDec;
		fResponseDecTimes--;
		if (fResponseDecTimes <= 0)
		{
			fResponseDecTimes = fResponseDecMaxTimes;
			fResponseDec -= fResponseDecDec;
			if (fResponseDec <= 0)
				fResponseDec = 0.1;
		}
		
		DisableOtherPlatforms(iPicked);
		
		wait 2;
		
		EnableAllPlatforms();
		HideAllSigns();
		GiveXPForAlives();
		
		wait 1;
	}
}