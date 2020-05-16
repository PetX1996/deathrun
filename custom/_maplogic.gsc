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

InSIniting(args)
{
	C_IMLLOGIC::InitTTnTJList();
	C_IMLLOGIC::InitEM();
}

InSStarting(args)
{
	FindTTsInTTList();
	FindTTsByName();
	FindEM();
	
	MonitorTTs();
	MonitorTJs();
	MonitorEM();
}

// ============================================================================== //
#region Finding Entities

private FindTTsInTTList()
{
	if (!IsDefined(level.TrapTriggers))
		return;
		
	for (i = 0; i < level.TrapTriggers.size; i++)
	{
		eTT = level.TrapTriggers[i];
		if (!IsDefined(eTT))
			continue;
			
		C_IMLLOGIC::RegTT(eTT, C_IMLLOGIC::iPriorTTList);
		
		eTJ = C_IMLLOGIC::GetConnectedTJ(eTT);
		if (IsDefined(eTJ))
		{
			C_IMLLOGIC::RegTJ(eTJ, C_IMLLOGIC::iPriorTTList);
			C_IMLLOGIC::RegConnectedTJsWithoutTT(eTJ, C_IMLLOGIC::iPriorTargetName);
		}
	}
}

private FindTTsByName()
{
	eTJStarting = GetEnt("dr2_t_tj", "targetname");
	if (IsDefined(eTJStarting))
	{
		C_IMLLOGIC::RegTJWithoutTT(eTJStarting, C_IMLLOGIC::iPriorTargetName);
		C_IMLLOGIC::RegConnectedTJsWithoutTT(eTJStarting, C_IMLLOGIC::iPriorTargetName);
	}

	for (i = 0; ; i++)
	{
		eTT = GetEnt("dr2_t_" + i, "targetname");
		if (!IsDefined(eTT))
			break;
			
		C_IMLLOGIC::RegTT(eTT, C_IMLLOGIC::iPriorTargetName);
		
		eTJ = C_IMLLOGIC::GetConnectedTJ(eTT);
		if (IsDefined(eTJ))
		{
			C_IMLLOGIC::RegTJ(eTJ, C_IMLLOGIC::iPriorTargetName);
			C_IMLLOGIC::RegConnectedTJsWithoutTT(eTJ, C_IMLLOGIC::iPriorTargetName);			
		}
	}
}

private FindEM()
{
	eEM = GetEntArray("dr2_t_endmap", "targetname")[0];
	if (!IsDefined(eEM))
		eEM = GetEntArray("endmap_trig", "targetname")[0];
		
	if (IsDefined(eEM))
		C_IMLLOGIC::RegEM(eEM, C_IMLLOGIC::iPriorTargetName);
}

#endregion
// ============================================================================== //
#region Monitor

private MonitorTTs()
{
	ttList = C_IMLLOGIC::GetTTList();
	for (i = 0; i < ttList.iCount; i++)
	{
		tt = ttList ILIST::Get(i);
		eTrig = tt C_IMLTT::TT_GetTrig();
		if (IsDefined(eTrig))
			eTrig thread EMonitorTTTrig(tt);
	}
}

private EMonitorTTTrig(tt)
{
	while (IsDefined(self))
	{
		self waittill("trigger", pPlayer);
		if (IsDefined(pPlayer))
			pPlayer thread C_IMLLOGIC::CTouchTT(tt, false);
	}
}


private MonitorTJs()
{
	tjList = C_IMLLOGIC::GetTJList();
	for (i = 0; i < tjList.iCount; i++)
	{
		tj = tjList ILIST::Get(i);
		eTrig = tj C_IMLTJ::TJ_GetTrig();
		if (IsDefined(eTrig))
			eTrig thread EMonitorTJTrig(tj);
	}
}

private EMonitorTJTrig(tj)
{
	while (IsDefined(self))
	{
		self waittill("trigger", pPlayer);
		if (IsDefined(pPlayer))
			pPlayer thread C_IMLLOGIC::CTouchTJ(tj);		
	}
}


private MonitorEM()
{
	em = C_IMLLOGIC::GetEM();
	if (IsDefined(em))
	{
		eTrig = em C_IMLEM::EM_GetTrig();
		if (IsDefined(eTrig))
			eTrig thread EMonitorEM(em);
	}
}

private EMonitorEM(em)
{
	while (IsDefined(self))
	{
		self waittill("trigger", pPlayer);
		if (IsDefined(pPlayer))
			pPlayer thread C_IMLLOGIC::CTouchEM(em);
	}
}
#endregion
// ============================================================================== //