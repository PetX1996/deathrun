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

public CIsStuck()
{
	return (IsAlive(self)
		&& !IsDefined(self.AFK_iAFKTimes)
		&& IsDefined(self.AFK_iStuckTimes)
		&& self.AFK_iStuckTimes >= C_ISVAR::GetAsInt(self C_ISVAR::CGetCTeamPrefix() + "StuckWarnTime"));
}

public CResetStuck()
{
	self.AFK_iStuckTimes = undefined;
	self.AFK_iAFKTimes = undefined;
}

public CWarnStuck([iSeconds])
{
	args = IECALLBACK::Args_Create();
	args.bCancel = undefined;
	args.iSeconds = iSeconds;
	self C_INIT::AFK_RunInCStuckWarning(args);
	if (IsDefined(args.bCancel) && args.bCancel)
	{
		self CResetStuck();
		return;
	}
	
	
	self C_ICMSG::CPrintLnBold(C_ILOCALIZE::StuckWarn);
	
	
	args IECALLBACK::Args_Reset();
	self C_INIT::AFK_RunOnCStuckWarned(args);
}

public CFinishStuck([iSeconds])
{
	args = IECALLBACK::Args_Create();
	args.bCancel = undefined;
	args.iSeconds = iSeconds;
	self C_INIT::AFK_RunInCStuckFinishing(args);
	if (IsDefined(args.bCancel) && args.bCancel)
	{
		self.AFK_iStuckTimes = undefined;
		return;
	}

	
	self C_ICMSG::CPrintLnBold(C_ILOCALIZE::StuckKill);
	C_ICMSG::SPrintLn(C_ILOCALIZE::StuckKillAll, self.Name);
	self Suicide();
	
	
	args IECALLBACK::Args_Reset();
	self C_INIT::AFK_RunOnCStuckFinished(args);
}


public sealed iAFK_Kill = 0;
public sealed iAFK_Spectator = 1;
public sealed iAFK_PickNew = 2;
public sealed iAFK_ActivateTTs = 3;
public sealed iAFK_SIZE = 4;

public CIsAFK()
{
	return (IsAlive(self)
		&& IsDefined(self.AFK_iAFKTimes)
		&& self.AFK_iAFKTimes >= C_ISVAR::GetAsInt(self C_ISVAR::CGetCTeamPrefix() + "AFKWarnTime"));
}

public CResetAFK()
{
	self.AFK_iAFKTimes = undefined;
}

public CWarnAFK([iSeconds])
{
	args = IECALLBACK::Args_Create();
	args.bCancel = undefined;
	args.iSeconds = iSeconds;
	self C_INIT::AFK_RunInCAFKWarning(args);
	if (IsDefined(args.bCancel) && args.bCancel)
	{
		self CResetAFK();
		return;
	}
	

	self C_ICMSG::CPrintLnBold(C_ILOCALIZE::AFKWarn);
	
	
	args IECALLBACK::Args_Reset();
	self C_INIT::AFK_RunOnCAFKWarned(args);
}

public CFinishAFK([iAction], [iSeconds])
{
	if (!IsDefined(iAction))
		iAction = C_ISVAR::GetAsInt(self C_ISVAR::CGetCTeamPrefix() + "AFKAction");
		
	args = IECALLBACK::Args_Create();
	args.bCancel = undefined;
	args.iAction = iAction;
	args.iSeconds = iSeconds;
	self C_INIT::AFK_RunInCAFKFinishing(args);
	if (IsDefined(args.bCancel) && args.bCancel)
	{
		self CResetAFK();
		return;
	}
		
	
	switch (iAction)
	{
		case iAFK_Kill:
			self C_ICMSG::CPrintLnBold(C_ILOCALIZE::AFKKill);
			C_ICMSG::SPrintLn(C_ILOCALIZE::AFKKillAll, self.Name);
			self C_ICDAMAGE::SuicideAFK();
			break;
		case iAFK_Spectator:
			self C_ICMSG::CPrintLnBold(C_ILOCALIZE::AFKSpect);
			C_ICMSG::SPrintLn(C_ILOCALIZE::AFKSpectAll, self.Name);
			self C_ICTEAM::JoinSpectator();
			break;
		case iAFK_PickNew:
			if (IsAllActivsAFK())
			{
				pPickedList = C_IGLPICKING::PickActivators(1);
				if (pPickedList.iCount > 0)
				{
					if (ICLIST::GetAllAxis(true).size > 1
						&& !C_IGLPICKING::IsMoreEnabled())
					{
						self C_ICMSG::CPrintLnBold(C_ILOCALIZE::AFKKill);
						C_ICMSG::SPrintLn(C_ILOCALIZE::AFKKillAll, self.Name);
						self C_ICDAMAGE::SuicideAFK();
					}
					
					C_ICMSG::SPrintLn(C_ILOCALIZE::AFKPickAll);
					for (i = 0; i < pPickedList.iCount; i++)
					{
						pActiv = pPickedList ILIST::Get(i);
						if (IsDefined(pActiv) && IsAlive(pActiv) && pActiv.pers["team"] == "axis")
							pActiv C_ICMSG::CPrintLnBold(C_ILOCALIZE::AFKPick);
					}
				}
			}
			break;
		case iAFK_ActivateTTs:
			thread AutoActivateAllTTs();
			break;
		default:
			IEXCEPTION::InvalidOperationMsg("Unknown svar value 'CAAFKAction'");
	}
	
	args IECALLBACK::Args_Reset();
	self C_INIT::AFK_RunOnCAFKFinished(args);
}

private AutoActivateAllTTs()
{
	level notify("AutoActivateAllTTs");
	level endon("AutoActivateAllTTs");

	iStartTime = C_IGLSTATE::GetINStartedTime();
	if (!IsDefined(iStartTime))
		return;
		
	iMinTime = C_ISVAR::GetAsInt("CAAFKActivateTTMin");
	iMaxTime = C_ISVAR::GetAsInt("CAAFKActivateTTMax");
	
	if ((GetTime() - iStartTime) < (iMinTime * 1000))
		wait iMinTime;
		
	iCurTT = 0;
	iTTListCount = C_IMLLOGIC::GetTTList().iCount;
		
	while (IsAllActivsAFK()
		&& C_IGLSTATE::IsIN()
		&& iCurTT < iTTListCount)
	{
		pActiv = ICLIST::GetAllAxis(true)[0];
		if (!IsDefined(pActiv))
			return;
		
		// skip all activated TTs
		tt = C_IMLLOGIC::GetTTByIndex(iCurTT);
		while (tt C_IMLTT::TT_IsTouched())
		{
			iCurTT++;
			if (iCurTT >= iTTListCount)
				return;
			
			tt = C_IMLLOGIC::GetTTByIndex(iCurTT);
		}
		iCurTT++;
		
		pActiv C_IMLLOGIC::CTouchTT(tt, true);
		wait RandomFloatRange(iMinTime, iMaxTime);
	}
}

public IsAllActivsAFK()
{
	pAliveActivs = ICLIST::GetAllAxis(true);
	if (pAliveActivs.size == 0)
		return false;
		
	foreach (pActiv in pAliveActivs)
	{
		if (!pActiv C_ICAFK::CIsAFK())
			return false;
	}
	return true;
}