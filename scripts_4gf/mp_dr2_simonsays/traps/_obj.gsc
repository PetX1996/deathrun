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
	level.SS_eObjPlatforms = [];
	level.SS_eObjSigns = [];
	
	for (i = 0; i < 9; i++)
	{
		level.SS_eObjPlatforms[i] = GetEnt("obj" + i, "targetname");
		level.SS_eObjSigns[i] = GetEnt("objx" + i, "targetname");
	}
}

SwitchPlatforms()
{
	for (i = 0; i < level.SS_eObjPlatforms.size; i++)
	{
		eCur = level.SS_eObjPlatforms[i];
		eOther = level.SS_eObjPlatforms[RandomInt(level.SS_eObjPlatforms.size)];
		
		vCurPos = eCur.origin;
		eCur.origin = eOther.origin;
		eOther.origin = vCurPos;
	}
}

HideAllSigns()
{
	for (i = 0; i < level.SS_eObjSigns.size; i++)
		level.SS_eObjSigns[i] Hide();
}

ShowSign(i)
{
	level.SS_eObjSigns[i] Show();
}

EnableAllPlatforms()
{
	for (i = 0; i < level.SS_eObjPlatforms.size; i++)
		level.SS_eObjPlatforms[i] Solid();
}

DisableOtherPlatforms(iNot)
{
	for (i = 0; i < level.SS_eObjPlatforms.size; i++)
	{
		if (i != iNot)
			level.SS_eObjPlatforms[i] NotSolid();
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
	AmbientPlay("obj");
	wait 11;

	for (i = 3; i > 0; i--)
	{
		IPrintLnBold("Start in " + i);
		wait 1;
	}
	
	IPrintLnBold("GO");
	api\gamelogic\_oneteam::AllowPostRespawnPermanentlly(false);
	mapper\_music::PlayNow("atw", "Daft Punk - Around The World");
	
	fResponseMaxTime = 5;
	fResponseTime = fResponseMaxTime;
	fResponseDec = 0.2;
	
	fResponseDecMaxTimes = 5;
	fResponseDecTimes = fResponseDecMaxTimes;
	fResponseDecDec = 0.02;
	
	while (fResponseTime > 0
		&& mapper\_teams::GetAllJumpers(true).size > 0)
	{
		iPicked = RandomInt(level.SS_eObjPlatforms.size);
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