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

MENU_OnCResponded(args)
{
	if (!IsDefined(self.VG) || args.sMenuName != C_ICMENU::GetMenu("vg"))
		return;

	if (IsDefined(self.VG.bIsWorking)) // sending dvars have not finished yet...
		return;
	
	if (args.sResponse == "vgClose")
		self.VG C_ICVG::OnClose();
	else if (args.sResponse == "vgEsc")
		self.VG C_ICVG::OnEsc();
	else if (args.sResponse == "vgBtn")
		self.VG C_ICVG::Menu_OnBtn(Int(args.ResponseArgs[1]) - 1);
	else if (args.sResponse == "vgSBtn")
		return; // arrows, enter, backSpace, ...
	else if (args.sResponse == "vgT")
	{
		if (args.ResponseArgs[1] == "Cancel")
			self.VG C_ICVG::TextBox_OnCancel();
		else if (args.ResponseArgs[1] == "OK")
			self.VG C_ICVG::TextBox_OnOK();
		else
			IEXCEPTION::ArgumentMsg("Unknown VG notify '" + args.sResponse + "'");
	}
	else
		IEXCEPTION::ArgumentMsg("Unknown VG notify '" + args.sResponse + "'");
}

DMG_OnCKilled()
{
	if (IsDefined(self.VG))
		self.VG C_ICVG::Close();
}

public Open()
{
	mapfixer = C_ICVG::Create(self);
	
	//mapfixer C_ICVG::SetText(0, "Some Text");
	
	// ---------
	// EM + TT + TJ
	mapfixer.eEM = undefined;
	em = C_IMLLOGIC::GetEM();
	if (IsDefined(em))
		mapfixer.eEM = em C_IMLEM::EM_GetTrig();
		
	mapfixer.eTTsList = ILIST::Create();
	mapfixer.TTList = C_IMLLOGIC::GetTTList();
	for (i = 0; i < mapfixer.TTList.iCount; i++)
	{
		tt = mapfixer.TTList ILIST::Get(i);
		mapfixer.eTTsList ILIST::Set(i, tt C_IMLTT::TT_GetTrig());
	}
	
	mapfixer.eTJsList = ILIST::Create();
	mapfixer.TJList = C_IMLLOGIC::GetTJList();
	for (i = 0; i < mapfixer.TJList.iCount; i++)
	{
		tj = mapfixer.TJList ILIST::Get(i);
		mapfixer.eTJsList ILIST::Set(i, tj C_IMLTJ::TJ_GetTrig());
	}
	
	mapfixer TTnTJ_RebuildList();
	// --------
	
	mapfixer.S_Allies = level.Spawns["allies"];
	mapfixer.S_Axis = level.Spawns["axis"];
	mapfixer.S_Spectator = level.Spawns["spectator"];
	
	mapfixer C_ICVG::AddTextClear();
	mapfixer C_ICVG::AddTextSet(C_ICVG::TotalLines - 1, "");
	
	mapfixer C_ICVG::Menu_Clear(false);
	mapfixer C_ICVG::Menu_RegisterBtn(0, "Entities", ::MenuOnOpenEnts);
	mapfixer C_ICVG::Menu_RegisterBtn(1, "BoxGroups", ::BG_MenuOnOpen);
	mapfixer C_ICVG::Menu_RegisterBtn(2, "Map Support", ::MenuOnOpenSupp);
	mapfixer C_ICVG::Menu_RegisterBtn(3, "Save", ::MenuOnSave);
	mapfixer C_ICVG::Menu_Show();
}

private MenuOnSave()
{
	ls = ILIST::Create();
	ls ILIST::Add("InSIniting()");
	ls ILIST::Add("{");
	
	ls ILIST::AddList(self C_IMAPFIXERUTIL::Entities_GetOutputForSave());
	ls ILIST::AddList(self C_IMAPFIXERUTIL::BG_GetOutputForSave());
	ls ILIST::AddList(self S_GetOutputForSave());
	ls ILIST::AddList(self EM_GetOutputForSave());
	ls ILIST::AddList(self TTnTJ_GetOutputForSave());
	
	ls ILIST::Add("}");
	
	// fs_homepath "D:\Program Files (x86)\Activision\Call of Duty 4 - Modern Warfare"
	// fs_game "mods/deathrun"
	
	///#
	sFileName = "inputs\\mapfixer\\" + IGAME::GetMap() + ".gsc";
	//iFile = OpenFile(sFileName, "write");
	//IEXCEPTION::InvalidOperation(iFile != -1, "Could not open file " + sFileName);
	
	FPrintLine("== MAPFIXER START =============================================================");
	FPrintLine("MFilePath: inputs\\mapfixer\\mapfixer.gsc");
	FPrintLine("FilePath: " + sFileName);
	
	lines = ls ILIST::ToArray();
	foreach (sLine in lines)
	{
		FPrintLine(sLine);
	}
	FPrintLine("== MAPFIXER END =============================================================");
	//#/
}

private FPrintLine(sLine)
{
	LogPrint(sLine + "\n");
}

// ============================================================================== //
#region Entities

private MenuOnOpenEnts()
{
	self C_ICVG::AddTextClear();
	self C_ICVG::AddTextSet(C_ICVG::TotalLines - 1, C_ICVGENT::LEGEND);

	self C_ICVGENT::Create();
	
	self C_ICVG::Menu_Clear(true, ::MenuOnCloseEnts);
	self C_ICVG::Menu_RegisterBtn(0, "Move", C_ICVGENT::MenuMove, true);
	self C_ICVG::Menu_RegisterBtn(1, "Rotate", C_ICVGENT::MenuRotate, true);
	self C_ICVG::Menu_RegisterBtn(2, "Properties", C_ICVGENT::MenuProps);
	self C_ICVG::Menu_RegisterBtn(3, "Delete", C_ICVGENT::MenuDelete);
	self C_ICVG::Menu_RegisterBtn(4, "Restore", C_ICVGENT::MenuRestore);
	self C_ICVG::Menu_RegisterBtn(5, "Spawn", C_ICVGENT::MenuSpawn);
	self C_ICVG::Menu_RegisterBtn(6, "Save", ::MenuOnSave);
	self C_ICVG::Menu_Show();
}

private MenuOnCloseEnts()
{
	self C_ICVGENT::Close();
}

#endregion
// ============================================================================== //
#region BoxGroups

private BG_MenuOnOpen()
{
	self C_ICVG::AddTextClear();
	self C_ICVG::AddTextSet(C_ICVG::TotalLines - 1, C_ICVGBG::LEGEND);

	self C_ICVGBG::Create();

	self C_ICVG::Menu_Clear(true, ::BG_MenuOnClose);
	self C_ICVG::Menu_RegisterBtn(0, "Move", C_ICVGBG::MenuMove, true);
	self C_ICVG::Menu_RegisterBtn(1, "Move Pivot", C_ICVGBG::MenuPivotMove, true);
	self C_ICVG::Menu_RegisterBtn(2, "Rotate", C_ICVGBG::MenuRotate, true);
	self C_ICVG::Menu_RegisterBtn(3, "Properties", C_ICVGBG::MenuProps);
	self C_ICVG::Menu_RegisterBtn(4, "Delete", C_ICVGBG::MenuDelete);
	self C_ICVG::Menu_RegisterBtn(5, "Create BG", C_ICVGBG::CreateBG_MenuOpen);
	self C_ICVG::Menu_RegisterBtn(6, "Add Shape", C_ICVGBG::AddShape_MenuOpen);
	self C_ICVG::Menu_RegisterBtn(7, "Save", ::MenuOnSave);
	self C_ICVG::Menu_Show();
}

private BG_MenuOnClose()
{
	self C_ICVGBG::Close();
}

#endregion
// ============================================================================== //
#region Map Support

private MenuOnOpenSupp()
{
	self C_ICVG::AddTextClear();
	self C_ICVG::AddTextSet(C_ICVG::TotalLines - 1, "");

	self C_ICVG::Menu_Clear(true, ::MenuOnCloseSupp);
	self C_ICVG::Menu_RegisterBtn(0, "Spawns", ::S_MenuOnOpen);
	self C_ICVG::Menu_RegisterBtn(1, "EM", ::EM_MenuOnOpen);
	self C_ICVG::Menu_RegisterBtn(2, "TTs & TJs", ::TTnTJ_MenuOnOpen);
	self C_ICVG::Menu_RegisterBtn(3, "Save", ::MenuOnSave);
	self C_ICVG::Menu_Show();
}

private MenuOnCloseSupp()
{
	iprintlnbold("close MapSupport");
}

	// ============================================================================= //
	#region Spawns	
	private S_MenuOnOpen()
	{
		self C_ICVG::AddTextClear();
		self C_ICVG::AddTextSet(C_ICVG::TotalLines - 1, C_ICVGENT::LEGEND + " ^5Spawned ^7| ^1Activator ^2Jumper ^7Spectator");
		
		self C_ICVGENT::Create();
		self.Ents.dChooseEntsBegin = ::S_OnChooseEntsBegin;
		self.Ents.dShowingEnt = ::S_OnShowingEnt;
		
		self C_ICVG::Menu_Clear(true, ::S_MenuOnClose);
		
		self C_ICVG::Menu_RegisterBtn(0, "Move", C_ICVGENT::MenuMove, true);
		self C_ICVG::Menu_RegisterBtn(1, "Rotate", C_ICVGENT::MenuRotate, true);
		self C_ICVG::Menu_RegisterBtn(2, "Properties", C_ICVGENT::MenuProps);
		self C_ICVG::Menu_RegisterBtn(3, "Delete", ::S_MenuOnDelete);
		self C_ICVG::Menu_RegisterBtn(4, "Restore", C_ICVGENT::MenuRestore);
		self C_ICVG::Menu_RegisterBtn(5, "Spawn", ::S_MenuOnSpawnOpen);
		self C_ICVG::Menu_RegisterBtn(6, "Save", ::MenuOnSave);
		self C_ICVG::Menu_Show();
	}

	private S_MenuOnClose()
	{
		self C_ICVGENT::Close();
	}

	private S_OnChooseEntsBegin()
	{
		self.Ents.EntsListSource = self.S_Allies;
		self.Ents.EntsListSource = IARRAY::AddRange(self.Ents.EntsListSource, self.S_Axis);
		self.Ents.EntsListSource = IARRAY::AddRange(self.Ents.EntsListSource, self.S_Spectator);
		
		self S_ShowSelectedInfo();
	}
	
	private S_ShowSelectedInfo()
	{
		iAlliesSpawnsCount = 0;
		iAlliesSpawnsFake = 0;
		foreach (eSpawn in self.S_Allies)
		{
			if (!IsDefined(eSpawn.MF) || !IsDefined(eSpawn.MF.bIsDeleted))
				iAlliesSpawnsCount++;
			
			if (IsDefined(eSpawn.bIsFake))
				iAlliesSpawnsFake++;
		}
	
		iAxisSpawnsCount = 0;
		iAxisSpawnsFake = 0;
		foreach (eSpawn in self.S_Axis)
		{
			if (!IsDefined(eSpawn.MF) || !IsDefined(eSpawn.MF.bIsDeleted))
				iAxisSpawnsCount++;
				
			if (IsDefined(eSpawn.bIsFake))
				iAxisSpawnsFake++;
		}
		
		iSpectatorSpawnsCount = 0;
		iSpectatorSpawnsFake = 0;
		foreach (eSpawn in self.S_Spectator)
		{
			if (!IsDefined(eSpawn.MF) || !IsDefined(eSpawn.MF.bIsDeleted))
				iSpectatorSpawnsCount++;
				
			if (IsDefined(eSpawn.bIsFake))
				iSpectatorSpawnsFake++;
		}
	
		self C_ICVG::AddTextSet(2, "Allies: " + iAlliesSpawnsCount + "/" + self.S_Allies.size + " ^5+ " + iAlliesSpawnsFake);
		self C_ICVG::AddTextSet(3, "Axis: " + iAxisSpawnsCount + "/" + self.S_Axis.size + " ^5+ " + iAxisSpawnsFake);
		self C_ICVG::AddTextSet(4, "Spectator: " + iSpectatorSpawnsCount + "/" + self.S_Spectator.size + " ^5+ " + iSpectatorSpawnsFake);
	}
	
	private S_OnShowingEnt()
	{
		eEnt = self.Ents.eShowingEnt;
		if (IsDefined(eEnt.bIsFake))
			self.Ents.vShowingEntColor = (0, 1, 1);
			
		vColor = (1, 1, 1);
		vSize = (32, 32, 32);
		if (eEnt.classname == "dr2_spawn_jumper"
			|| eEnt.classname == "mp_jumper_spawn"
			|| eEnt.classname == "mp_dm_spawn")
		{
			vColor = (0, 1, 0);
			vSize = (32, 32, 72);
		}
		else if (eEnt.classname == "dr2_spawn_activator"
			|| eEnt.classname == "mp_activator_spawn"
			|| eEnt.classname == "mp_tdm_spawn")
		{
			vColor = (1, 0, 0);
			vSize = (32, 32, 72);
		}
		
		cuboid = ISHAPE::Cuboid_Create(eEnt.origin + (0, 0, vSize[2] * 0.5), vSize, eEnt.angles, eEnt.origin);
		cuboid ISHAPE::Cuboid_Draw(vColor, false);
	}
	
	private S_MenuOnSpawnOpen()
	{
		self C_ICVG::Menu_Clear(true, ::S_MenuOnSpawnClose);
		
		self C_ICVG::Menu_RegisterBtn(0, "Jumper", ::S_Spawn_MenuOnJumper);
		self C_ICVG::Menu_RegisterBtn(1, "Activator", ::S_Spawn_MenuOnActivator);
		self C_ICVG::Menu_RegisterBtn(2, "Spectator", ::S_Spawn_MenuOnSpectator);
		self C_ICVG::Menu_Show();
	}
	
	private S_MenuOnSpawnClose()
	{
	}
	
	private S_Spawn_MenuOnJumper()
	{
		spawn = C_ICSPAWN::CreateFakeSpawnPoint("dr2_spawn_jumper", self.pOwner.origin, (0, 0, 0));
		self.S_Allies[self.S_Allies.size] = spawn;
		
		self C_ICVG::Menu_OnBackBtn();
	}
	
	private S_Spawn_MenuOnActivator()
	{
		spawn = C_ICSPAWN::CreateFakeSpawnPoint("dr2_spawn_activator", self.pOwner.origin, (0, 0, 0));
		self.S_Axis[self.S_Axis.size] = spawn;
		
		self C_ICVG::Menu_OnBackBtn();
	}

	private S_Spawn_MenuOnSpectator()
	{
		spawn = C_ICSPAWN::CreateFakeSpawnPoint("dr2_spawn_spectator", self.pOwner.origin, (0, 0, 0));
		self.S_Spectator[self.S_Spectator.size] = spawn;
		
		self C_ICVG::Menu_OnBackBtn();
	}
	
	private S_MenuOnDelete()
	{
		eEnt = self.Ents.eSelectedEnt;
		if (IsDefined(eEnt) && IsDefined(eEnt.bIsFake))
		{
			self.S_Allies = IARRAY::Remove(self.S_Allies, eEnt);
			self.S_Axis = IARRAY::Remove(self.S_Axis, eEnt);
			self.S_Spectator = IARRAY::Remove(self.S_Spectator, eEnt);
		}
		else
			self C_ICVGENT::MenuDelete();
	}
	
	private S_GetOutputForSave()
	{
		level.Spawns["allies"] = self.S_Allies;
		level.Spawns["axis"] = self.S_Axis;
		level.Spawns["spectator"] = self.S_Spectator;
		
		ls = ILIST::Create();
		ls ILIST::Add(Tab + "// Spawns");
		
		foreach (eSpawn in self.S_Allies)
		{
			if (IsDefined(eSpawn.bIsFake))
				ls ILIST::Add(Tab + "custom\\include\\_mapfixer::S_Register(\"allies\", \"" + eSpawn.classname + "\", " + eSpawn.origin + ", " + eSpawn.angles + ");");
		}
		
		foreach (eSpawn in self.S_Axis)
		{
			if (IsDefined(eSpawn.bIsFake))
				ls ILIST::Add(Tab + "custom\\include\\_mapfixer::S_Register(\"axis\", \"" + eSpawn.classname + "\", " + eSpawn.origin + ", " + eSpawn.angles + ");");
		}
		
		foreach (eSpawn in self.S_Spectator)
		{
			if (IsDefined(eSpawn.bIsFake))
				ls ILIST::Add(Tab + "custom\\include\\_mapfixer::S_Register(\"spectator\", \"" + eSpawn.classname + "\", " + eSpawn.origin + ", " + eSpawn.angles + ");");
		}
		
		ls ILIST::Add("");
		return ls;
	}
	
	#endregion
	// ============================================================================= //
	#region EM Trigger

	private EM_MenuOnOpen()
	{
		self C_ICVG::AddTextClear();
		self C_ICVG::AddTextSet(C_ICVG::TotalLines - 1, C_ICVGENT::LEGEND + " ^5Registered");
	
		self C_ICVGENT::Create();
		self.Ents.dChooseEntsBegin = ::EM_OnChooseEntsBegin;
		self.Ents.dShowingEnt = ::EM_OnShowingEnt;
		
		self.Ents.dSpawnEntBegin = ::EM_OnSpawnBegin;
		self.Ents.dSpawnEntFinish = ::EM_OnSpawnFinish;
		
		self.Ents.dDeleteEntBegin = ::EM_OnDeleteBegin;
		
		self C_ICVG::Menu_Clear(true, ::EM_MenuOnClose);
		self C_ICVG::Menu_RegisterBtn(0, "Select", ::EM_MenuOnSelect);
		self C_ICVG::Menu_RegisterBtn(1, "Deselect", ::EM_MenuOnDeselect);
		self C_ICVG::Menu_RegisterBtn(2, "Entity", ::EM_OnEntityMenuOpen);
		self C_ICVG::Menu_RegisterBtn(3, "Save", ::MenuOnSave);
		self C_ICVG::Menu_Show();
	}

	private EM_MenuOnClose()
	{
		self C_ICVGENT::Close();
	}
	
	private EM_OnEntityMenuOpen()
	{
		self C_ICVG::Menu_Clear(true, ::EM_OnEntityMenuClose);
		self C_ICVG::Menu_RegisterBtn(0, "Move", C_ICVGENT::MenuMove, true);
		self C_ICVG::Menu_RegisterBtn(1, "Rotate", C_ICVGENT::MenuRotate, true);
		self C_ICVG::Menu_RegisterBtn(2, "Properties", C_ICVGENT::MenuProps);
		self C_ICVG::Menu_RegisterBtn(3, "Delete", C_ICVGENT::MenuDelete);
		self C_ICVG::Menu_RegisterBtn(4, "Restore", C_ICVGENT::MenuRestore);
		self C_ICVG::Menu_RegisterBtn(5, "Spawn", C_ICVGENT::MenuSpawn);
		self C_ICVG::Menu_RegisterBtn(6, "Save", ::MenuOnSave);
		self C_ICVG::Menu_Show();	
	}

	private EM_OnEntityMenuClose()
	{}
	
	private EM_OnChooseEntsBegin()
	{
		self.Ents.EntsListSource = GetEntArray("trigger_multiple", "classname");
		self.Ents.EntsListSource = IARRAY::AddRange(self.Ents.EntsListSource, GetEntArray("trigger_radius", "classname"));
		self.Ents.EntsListSource = IARRAY::AddRange(self.Ents.EntsListSource, GetEntArray("trigger_damage", "classname"));
		self.Ents.EntsListSource = IARRAY::AddRange(self.Ents.EntsListSource, GetEntArray("trigger_use", "classname"));
		self.Ents.EntsListSource = IARRAY::AddRange(self.Ents.EntsListSource, GetEntArray("trigger_use_touch", "classname"));
	}
	
	private EM_OnShowingEnt()
	{
		if (IsDefined(self.eEM) 
			&& self.Ents.eShowingEnt == self.eEM)
			self.Ents.vShowingEntColor = (0, 1, 1);
			
			
		self EM_ShowSelectedInfo();
	}
	
	private EM_ShowSelectedInfo()
	{
		eTrig = self.eEM;
		if (IsDefined(eTrig))
		{
			sColor = "";
			if (IsDefined(self.Ents.eSelectedEnt) && eTrig == self.Ents.eSelectedEnt)
				sColor = "^5";
		
			sTargetName = eTrig.targetname;
			if (!IsDefined(sTargetName))
				sTargetName = "";
			
			self C_ICVG::AddTextSet(2, sColor + eTrig.classname + " ; " + sTargetName + " ; " + eTrig.origin);
		}
		else
			self C_ICVG::AddTextSet(2, "Undefined");		
	}
	
	private EM_MenuOnSelect()
	{
		eEnt = self.Ents.eSelectedEnt;
		if (IsDefined(eEnt) 
			&& !self.eTTsList ILIST::Contains(eEnt)
			&& !self.eTJsList ILIST::Contains(eEnt))
			self.eEM = self.Ents.eSelectedEnt;
	}
	
	private EM_MenuOnDeselect()
	{
		self.eEM = undefined;
	}
	
	private EM_OnSpawnBegin()
	{
		self.Ents.sSpawnEntClassName = "trigger_radius";
		self.Ents.sSpawnEntTargetName = "dr2_t_endmap";
		self.Ents.fSpawnEntRadius = 50;
		self.Ents.fSpawnEntHeight = 50;
	}
	
	private EM_OnSpawnFinish(eTrig)
	{
		self.eEM = eTrig;
	}
	
	private EM_OnDeleteBegin(eEnt)
	{
		if (IsDefined(self.eEM) && eEnt == self.eEM)
			self.eEM = undefined;
	}
	
	private EM_GetOutputForSave()
	{
		ls = ILIST::Create();
		ls ILIST::Add(Tab + "// EM");
		
		eCurEMTrig = self.eEM;
		
		lastEM = C_IMLLOGIC::GetEM();
		eLastEMTrig = undefined;
		if (IsDefined(lastEM))
			eLastEMTrig = lastEM C_IMLEM::EM_GetTrig();
		
		if (IsDefined(eCurEMTrig) 
			&& (!ITYPE::IsEqual(eLastEMTrig, eCurEMTrig) || C_IMLLOGIC::GetEMPrior() == C_IMLLOGIC::iPriorMapFixer)
			&& (!IsDefined(eCurEMTrig.MF) || !IsDefined(eCurEMTrig.MF.bIsDeleted)))
		{
			em = eCurEMTrig C_IMLEM::EGetEM();
			if (!IsDefined(em))
				em = C_IMLEM::EM_Create(eCurEMTrig);
				
			C_IMLLOGIC::InitEM();
			C_IMLLOGIC::AddEM(em);
			C_IMLLOGIC::SetEMPrior(C_IMLLOGIC::iPriorMapFixer);
			
			origTargetName = eCurEMTrig C_IMAPFIXERUTIL::Entity_GetPropOrigValue("targetname");
			origOrigin = eCurEMTrig C_IMAPFIXERUTIL::Entity_GetPropOrigValue("origin");
			
			if (IsDefined(origTargetName))
				ls ILIST::Add(Tab + "custom\\include\\_mapfixer::RegEM(\"" + eCurEMTrig.classname + "\", " + origOrigin + ", \"" + origTargetName + "\");");
			else
				ls ILIST::Add(Tab + "custom\\include\\_mapfixer::RegEM(\"" + eCurEMTrig.classname + "\", " + origOrigin + ");");
		}
		ls ILIST::Add("");
		return ls;
	}
	
	#endregion
	// ============================================================================= //
	#region TTnTJ Triggers

	private TTnTJ_RebuildList()
	{
		self.TTnTJList = ILIST::Create();
	
		iTTMax = self.TTList.iCount;
		iTJMax = self.TJList.iCount;
		
		iTT = 0;
		iTJ = 0;
		
		for (; iTT < iTTMax || iTJ < iTJMax;)
		{
			if (iTJ < iTJMax)
			{
				tj = self.TJList ILIST::Get(iTJ);
				if ((tj C_IMLTJ::TJ_GetAssignedTTsList()).iCount == 0)
				{
					self.TTnTJList ILIST::Add(tj);
					iTJ++;
					continue;
				}
			}
		
			if (iTT < iTTMax)
			{
				tt = self.TTList ILIST::Get(iTT);
				self.TTnTJList ILIST::Add(tt);
				iTT++;
				
				assignedTJ = tt C_IMLTT::TT_GetAssignedTJ();
				if (IsDefined(assignedTJ))
				{
					if (iTJ < iTJMax)
					{
						tj = self.TJList ILIST::Get(iTJ);
						if (tj == assignedTJ) // otherwise it's 1 TJ for more TT or TJ without TT
							iTJ++;
					}
				}
				
				continue;
			}
		}
		
		self.TTnTJ_bIsAnyChange = true;
	}
	
	private TTnTJ_RevertBuildedList()
	{
		self.TTList = ILIST::Create();
		self.eTTsList = ILIST::Create();
		self.TJList = ILIST::Create();
		self.eTJsList = ILIST::Create();
		
		for (i = 0; i < self.TTnTJList.iCount; i++)
		{
			e = self.TTnTJList ILIST::Get(i);
		
			if (C_IMLTJ::IsTJ(e))
			{
				self.TJList ILIST::Add(e);
				self.eTJsList ILIST::Add(e C_IMLTJ::TJ_GetTrig());
			}
			else
			{
				self.TTList ILIST::Add(e);
				self.eTTsList ILIST::Add(e C_IMLTT::TT_GetTrig());
				
				assignedTJ = e C_IMLTT::TT_GetAssignedTJ();
				if (IsDefined(assignedTJ)
					&& !self.TJList ILIST::Contains(assignedTJ))
				{
					self.TJList ILIST::Add(assignedTJ);
					self.eTJsList ILIST::Add(assignedTJ C_IMLTJ::TJ_GetTrig());					
				}
			}
		}
		
		self.TTnTJ_bIsAnyChange = true;
	}
	
	private TTnTJ_MenuOnOpen()
	{
		self C_ICVG::AddTextClear();
		self C_ICVG::AddTextSet(C_ICVG::TotalLines - 1, C_ICVGENT::LEGEND + " ^5TT ^6TJ");
	
		self C_ICVGENT::Create();
		self.Ents.dChooseEntsBegin = ::TTnTJ_OnChooseEntsBegin;
		self.Ents.dShowingEnt = ::TTnTJ_OnShowingEnt;
		self.Ents.dSpawnEntBegin = ::TTnTJ_OnSpawnEntBegin;
		
		self.Ents.dDeleteEntBegin = ::TTnTJ_OnDeleteBegin;
		
		self C_ICVG::Menu_Clear(true, ::TTnTJ_MenuOnClose);
		self C_ICVG::Menu_RegisterBtn(0, "Select TT", ::TTnTJ_MenuOnSelectTT);
		self C_ICVG::Menu_RegisterBtn(1, "Deselect", ::TTnTJ_MenuOnDeselect);
		self C_ICVG::Menu_RegisterBtn(2, "Connect TJ", ::TTnTJ_MenuOnConnectTJ, true);
		self C_ICVG::Menu_RegisterBtn(3, "Select TJ", ::TTnTJ_MenuOnSelectTJ);
		self C_ICVG::Menu_RegisterBtn(4, "Sort", ::TTnTJ_MenuOnSortOpen);
		self C_ICVG::Menu_RegisterBtn(5, "Entity", ::TTnTJ_OnEntityMenuOpen);
		self C_ICVG::Menu_RegisterBtn(6, "Save", ::MenuOnSave);
		self C_ICVG::Menu_Show();
		
		self.TTnTJ_bIsAnyChange = true;
		self.TTnTJ_eHoldingEnt = undefined;
	}
	
	private TTnTJ_OnEntityMenuOpen()
	{
		self C_ICVG::Menu_Clear(true, ::TTnTJ_OnEntityMenuClose);
		self C_ICVG::Menu_RegisterBtn(0, "Move", C_ICVGENT::MenuMove, true);
		self C_ICVG::Menu_RegisterBtn(1, "Rotate", C_ICVGENT::MenuRotate, true);
		self C_ICVG::Menu_RegisterBtn(2, "Properties", C_ICVGENT::MenuProps);
		self C_ICVG::Menu_RegisterBtn(3, "Delete", C_ICVGENT::MenuDelete);
		self C_ICVG::Menu_RegisterBtn(4, "Restore", C_ICVGENT::MenuRestore);
		self C_ICVG::Menu_RegisterBtn(5, "Spawn", C_ICVGENT::MenuSpawn);
		self C_ICVG::Menu_RegisterBtn(6, "Save", ::MenuOnSave);
		self C_ICVG::Menu_Show();	
	}
	
	private TTnTJ_OnEntityMenuClose()
	{}
	
	private TTnTJ_MenuOnClose()
	{
		self C_ICVGENT::Close();
		
		self.TTnTJ_bIsAnyChange = undefined;
		self.TTnTJ_eHoldingEnt = undefined;
	}

	private TTnTJ_OnChooseEntsBegin()
	{
		self.Ents.EntsListSource = GetEntArray("trigger_multiple", "classname");
		self.Ents.EntsListSource = IARRAY::AddRange(self.Ents.EntsListSource, GetEntArray("trigger_radius", "classname"));
		self.Ents.EntsListSource = IARRAY::AddRange(self.Ents.EntsListSource, GetEntArray("trigger_damage", "classname"));
		self.Ents.EntsListSource = IARRAY::AddRange(self.Ents.EntsListSource, GetEntArray("trigger_use", "classname"));
		self.Ents.EntsListSource = IARRAY::AddRange(self.Ents.EntsListSource, GetEntArray("trigger_use_touch", "classname"));
	}
	
	private TTnTJ_OnShowingEnt()
	{
		if (self.eTTsList ILIST::Contains(self.Ents.eShowingEnt))
			self.Ents.vShowingEntColor = (0, 1, 1);
		else if(self.eTJsList ILIST::Contains(self.Ents.eShowingEnt))
			self.Ents.vShowingEntColor = (1, 0, 1);
			
		if (IsDefined(self.TTnTJ_eHoldingEnt) && self.Ents.eShowingEnt == self.TTnTJ_eHoldingEnt)
			self.Ents.vShowingEntColor = (1, 0, 0);
			
		self TTnTJ_ShowSelectedInfo();
	}
	
	private TTnTJ_ShowSelectedInfo()
	{
		if (self.TTnTJList.iCount == 0)
		{
			if (IsDefined(self.TTnTJ_iSortHgl))
				self.TTnTJ_iSortHgl = -1;
				
			self C_ICVG::AddTextClear();
			self C_ICVG::AddTextSet(2, "Undefined");
		}
		else
		{
			if (IsDefined(self.TTnTJ_iSortHgl) && (self.TTnTJ_iSortHgl < 0 || self.TTnTJ_iSortHgl > (self.TTnTJList.iCount - 1)))
				self.TTnTJ_iSortHgl = 0;
		
			if (self.TTnTJ_bIsAnyChange)
			{
				self C_ICVG::AddTextClear();
				self.TTnTJ_bIsAnyChange = false;
			}
		
			for (i = 0; i < self.TTnTJList.iCount; i++)
			{
				e = self.TTnTJList ILIST::Get(i);
				
				tt = undefined;
				eTT = undefined;
				tj = undefined;
				eTJ = undefined;
				if (C_IMLTT::IsTT(e))
				{
					tt = e;
					eTT = tt C_IMLTT::TT_GetTrig();
					
					assignedTJ = tt C_IMLTT::TT_GetAssignedTJ();
					if (IsDefined(assignedTJ))
					{
						tj = assignedTJ;
						eTJ = tj C_IMLTJ::TJ_GetTrig();
					}
				}
				else
				{
					tj = e;
					eTJ = tj C_IMLTJ::TJ_GetTrig();
				}
				
				sColor = "";
				if (IsDefined(self.Ents.eSelectedEnt))
				{
					if (IsDefined(eTT) && eTT == self.Ents.eSelectedEnt)
						sColor = "^5";
					else if (IsDefined(eTJ) && eTJ == self.Ents.eSelectedEnt)
						sColor = "^6";
				}
				
				if (IsDefined(self.TTnTJ_iSortHgl) && i == self.TTnTJ_iSortHgl)
				{
					if (IsDefined(self.TTnTJ_bSortIsSel) && self.TTnTJ_bSortIsSel)
						sColor = "^1";
					else
						sColor = "^2";
				}

				if (IsDefined(self.TTnTJ_eHoldingEnt) 
					&& IsDefined(eTT) 
					&& eTT == self.TTnTJ_eHoldingEnt)
					sColor = "^1";
				
				if (IsDefined(eTT) && IsDefined(eTJ))
					self C_ICVG::AddTextSet(2 + i, sColor + eTT IENTITY::GetFullName() + " + " + eTJ IENTITY::GetFullName());		
				else if (IsDefined(eTT))
					self C_ICVG::AddTextSet(2 + i, sColor + eTT IENTITY::GetFullName());	
				else
					self C_ICVG::AddTextSet(2 + i, sColor + eTJ IENTITY::GetFullName());
			}
			
			// links
			lastTT = undefined;
			lastTJ = undefined;
			for (i = 0; i < self.TTnTJList.iCount; i++)
			{
				e = self.TTnTJList ILIST::Get(i);
				tt = undefined;
				tj = undefined;
				if (C_IMLTT::IsTT(e))
				{
					tt = e;
					assignedTJ = tt C_IMLTT::TT_GetAssignedTJ();
					if (IsDefined(assignedTJ))
					{
						tj = assignedTJ;
						ISHAPE::DrawLine((tt C_IMLTT::TT_GetTrig()).origin, (tj C_IMLTJ::TJ_GetTrig()).origin, (1, 0, 0));
					}
				}
				else
					tj = e;

				if (IsDefined(lastTT) && IsDefined(tt))
					ISHAPE::DrawLine((lastTT C_IMLTT::TT_GetTrig()).origin, (tt C_IMLTT::TT_GetTrig()).origin, (0, 1, 1));
				
				if (IsDefined(lastTJ) && IsDefined(tj))
					ISHAPE::DrawLine((lastTJ C_IMLTJ::TJ_GetTrig()).origin, (tj C_IMLTJ::TJ_GetTrig()).origin, (1, 0, 1));
				
				if (IsDefined(tt))
					lastTT = tt;
				if (IsDefined(tj))
					lastTJ = tj;
			}
		}
	}
	
	private TTnTJ_MenuOnSelectTT()
	{
		eTrig = self.Ents.eSelectedEnt;
		if (IsDefined(eTrig))
		{
			if ((!IsDefined(eTrig.MF) || !IsDefined(eTrig.MF.bIsDeleted))
				&& !self.eTTsList ILIST::Contains(eTrig)
				&& !self.eTJsList ILIST::Contains(eTrig)
				&& (!IsDefined(self.eEM) || self.eEM != eTrig))
			{
				tt = eTrig C_IMLTT::EGetTT();
				if (!IsDefined(tt))
					tt = C_IMLTT::TT_Create(eTrig);
					
				self.TTList ILIST::Add(tt);
				self.eTTsList ILIST::Add(eTrig);
				
				self TTnTJ_RebuildList();
			}
		}
	}
	
	private TTnTJ_MenuOnDeselect()
	{
		eEnt = self.Ents.eSelectedEnt;
		if (IsDefined(eEnt))
		{
			tt = eEnt C_IMLTT::EGetTT();
			if (IsDefined(tt))
			{
				tj = tt C_IMLTT::TT_GetAssignedTJ();
				if (IsDefined(tj))
				{
					if ((tj C_IMLTJ::TJ_GetAssignedTTsList()).iCount <= 1)
					{
						eTrig = C_IMLTJ::TJ_GetTrig();
						self.TJList ILIST::Remove(tj);
						self.eTJsList ILIST::Remove(eTrig);
						tj C_IMLTJ::TJ_Dispose();
					}
					else
						(tj C_IMLTJ::TJ_GetAssignedTTsList()) ILIST::Remove(tt);
				}
			
				self.TTList ILIST::Remove(tt);
				self.eTTsList ILIST::Remove(eEnt);
				tt C_IMLTT::TT_Dispose();
				
				self TTnTJ_RebuildList();
			}
			else
			{
				tj = eEnt C_IMLTJ::EGetTJ();
				if (IsDefined(tj))
				{
					assignedTTsList = tj C_IMLTJ::TJ_GetAssignedTTsList();
					for (i = 0; i < assignedTTsList.iCount; i++)
					{
						tt = assignedTTsList ILIST::Get(i);
						tt C_IMLTT::TT_SetAssignedTJ(undefined);
					}
				
					self.TJList ILIST::Remove(tj);
					self.eTJsList ILIST::Remove(tj C_IMLTJ::TJ_GetTrig());
					tj C_IMLTJ::TJ_Dispose();	

					self TTnTJ_RebuildList();
				}
			}
		}
	}
	
	private TTnTJ_MenuOnConnectTJ()
	{
		eTrig = self.Ents.eSelectedEnt;
		if (!IsDefined(eTrig)
			|| eTrig == self.eEM
			|| (!IsDefined(self.TTnTJ_eHoldingEnt) && (!self.eTTsList ILIST::Contains(eTrig)))
			|| (IsDefined(self.TTnTJ_eHoldingEnt) && (self.eTTsList ILIST::Contains(eTrig))))
		{
			self.TTnTJ_eHoldingEnt = undefined;
			self C_ICVG::Menu_TurnBtnOff(2);
			return;
		}
		
		if (!IsDefined(self.TTnTJ_eHoldingEnt))
			self.TTnTJ_eHoldingEnt = eTrig;
		else
		{
			eTT = self.TTnTJ_eHoldingEnt;
			tt = eTT C_IMLTT::EGetTT();
			
			eTJ = eTrig;
			tj = eTJ C_IMLTJ::EGetTJ();
			if (!IsDefined(tj))
			{
				tj = C_IMLTJ::TJ_Create(eTJ);
				self.TJList ILIST::Add(tj);
				self.eTJsList ILIST::Add(eTJ);
			}	
			else if ((tj C_IMLTJ::TJ_GetAssignedTTsList()) ILIST::Contains(tt))
			{
				self.TTnTJ_eHoldingEnt = undefined;
				self C_ICVG::Menu_TurnBtnOff(2);
				return;
			}
			
			assignedTJ = tt C_IMLTT::TT_GetAssignedTJ();
			if (IsDefined(assignedTJ))
				(assignedTJ C_IMLTJ::TJ_GetAssignedTTsList()) ILIST::Remove(tt);
				
			tt C_IMLTT::TT_SetAssignedTJ(tj);
			(tj C_IMLTJ::TJ_GetAssignedTTsList()) ILIST::Add(tt);
			
			self.TTnTJ_eHoldingEnt = undefined;
			self C_ICVG::Menu_TurnBtnOff(2);
			
			self TTnTJ_RebuildList();
		}
	}
	
	private TTnTJ_MenuOnSelectTJ()
	{
		eTJ = self.Ents.eSelectedEnt;
		if (!IsDefined(eTJ)
			|| eTJ == self.eEM
			|| self.eTTsList ILIST::Contains(eTJ)
			|| self.eTJsList ILIST::Contains(eTJ))
		{
			return;
		}
		
		tj = C_IMLTJ::TJ_Create(eTJ);
		self.TJList ILIST::Add(tj);
		self.eTJsList ILIST::Add(eTJ);
		
		self TTnTJ_RebuildList();
	}
	
	private TTnTJ_MenuOnSortOpen()
	{
		self.TTnTJ_iSortHgl = 0;
		self.TTnTJ_bSortIsSel = false;
	
		self C_ICVG::Menu_Clear(true, ::TTnTJ_MenuOnSortClose);
		self C_ICVG::Menu_RegisterBtn(0, "Next", ::TTnTJ_Sort_MenuOnNext);
		self C_ICVG::Menu_RegisterBtn(1, "Previous", ::TTnTJ_Sort_MenuOnPrev);
		self C_ICVG::Menu_RegisterBtn(2, "Select", ::TTnTJ_Sort_MenuOnSel);
		self C_ICVG::Menu_RegisterBtn(3, "Save", ::MenuOnSave);
		self C_ICVG::Menu_Show();
	}
	
	private TTnTJ_MenuOnSortClose()
	{
		self.TTnTJ_iSortHgl = undefined;
		self.TTnTJ_bSortIsSel = undefined;
	}
	
	private TTnTJ_Sort_MenuOnNext()
	{
		iLast = self.TTnTJ_iSortHgl;
		iNew = (iLast + 1) % self.TTnTJList.iCount;
		self.TTnTJ_iSortHgl = iNew;
		
		if (self.TTnTJ_bSortIsSel)
		{
			last = self.TTnTJList ILIST::Get(iLast);
			new = self.TTnTJList ILIST::Get(iNew);
			self.TTnTJList ILIST::Set(iLast, new);
			self.TTnTJList ILIST::Set(iNew, last);
		
			self TTnTJ_RevertBuildedList();
		}
	}
	
	private TTnTJ_Sort_MenuOnPrev()
	{
		iLast = self.TTnTJ_iSortHgl;
		
		iNew = self.TTnTJ_iSortHgl - 1;
		if (iNew < 0)
			iNew = self.TTList.iCount - 1;
			
		self.TTnTJ_iSortHgl = iNew;
			
		if (self.TTnTJ_bSortIsSel)
		{
			last = self.TTnTJList ILIST::Get(iLast);
			new = self.TTnTJList ILIST::Get(iNew);
			self.TTnTJList ILIST::Set(iLast, new);
			self.TTnTJList ILIST::Set(iNew, last);	

			self TTnTJ_RevertBuildedList();
		}
	}
	
	private TTnTJ_Sort_MenuOnSel()
	{
		self.TTnTJ_bSortIsSel = !self.TTnTJ_bSortIsSel;
	}
	
	private TTnTJ_OnSpawnEntBegin()
	{
		self.Ents.sSpawnEntClassName = "trigger_radius";
		self.Ents.sSpawnEntTargetName = "ttspawn_" + RandomInt(10000);
		self.Ents.fSpawnEntRadius = 50;
		self.Ents.fSpawnEntHeight = 50;
	}
	
	private TTnTJ_OnDeleteBegin(eEnt)
	{
		if (IsDefined(eEnt))
		{
			tt = eEnt C_IMLTT::EGetTT();
			if (IsDefined(tt))
			{
				tj = tt C_IMLTT::TT_GetAssignedTJ();
				if (IsDefined(tj))
				{
					if ((tj C_IMLTJ::TJ_GetAssignedTTsList()).iCount <= 1)
					{
						self.TJList ILIST::Remove(tj);
						self.eTJsList ILIST::Remove(tj C_IMLTJ::TJ_GetTrig());
						tj C_IMLTJ::TJ_Dispose();
					}
					else
						(tj C_IMLTJ::TJ_GetAssignedTTsList()) ILIST::Remove(tt);
				}
			
				self.TTList ILIST::Remove(tt);
				self.eTTsList ILIST::Remove(eEnt);
				tt C_IMLTT::TT_Dispose();
			}
			else
			{
				tj = eEnt C_IMLTJ::EGetTJ();
				if (IsDefined(tj))
				{
					assignedTTsList = tj C_IMLTJ::TJ_GetAssignedTTsList();
					for (i = 0; i < assignedTTsList.iCount; i++)
					{
						tt = assignedTTsList ILIST::Get(i);
						tt C_IMLTT::TT_SetAssignedTJ(undefined);
					}
				
					self.TJList ILIST::Remove(tj);
					self.eTJsList ILIST::Remove(tj C_IMLTJ::TJ_GetTrig());
					tj C_IMLTJ::TJ_Dispose();				
				}
			}
		}
	}
	
	private TTnTJ_GetOutputForSave()
	{
		ls = ILIST::Create();
		ls ILIST::Add(Tab + "// TT & TJ");
		
		if (!self.TTList ILIST::IsEqual(C_IMLLOGIC::GetTTList()) 
			|| !self.TJList ILIST::IsEqual(C_IMLLOGIC::GetTJList())
			|| C_IMLLOGIC::GetTTnTJPrior() == C_IMLLOGIC::iPriorMapFixer)
		{
			C_IMLLOGIC::InitTTnTJList();
			C_IMLLOGIC::SetTTnTJPrior(C_IMLLOGIC::iPriorMapFixer);
			
			for (i = 0; i < self.TTnTJList.iCount; i++)
			{
				e = self.TTnTJList ILIST::Get(i);
				tt = undefined;
				tj = undefined;		
				if (C_IMLTT::IsTT(e))
				{
					tt = e;
					tj = tt C_IMLTT::TT_GetAssignedTJ();
				}
				else
					tj = e;
			
				if (IsDefined(tt))
				{
					eTTTrig = tt C_IMLTT::TT_GetTrig();
					if (!IsDefined(eTTTrig.MF) || !IsDefined(eTTTrig.MF.bIsDeleted))
					{
						C_IMLLOGIC::AddTTList(tt);
						
						origTargetName = eTTTrig C_IMAPFIXERUTIL::Entity_GetPropOrigValue("targetname");
						origOrigin = eTTTrig C_IMAPFIXERUTIL::Entity_GetPropOrigValue("origin");
						
						if (IsDefined(origTargetName))
							ls ILIST::Add(Tab + "custom\\include\\_mapfixer::RegTT(\"" + eTTTrig.classname + "\", " + origOrigin + ", \"" + origTargetName + "\");");
						else
							ls ILIST::Add(Tab + "custom\\include\\_mapfixer::RegTT(\"" + eTTTrig.classname + "\", " + origOrigin + ");");
							
						if (IsDefined(tj))
						{
							eTJTrig = tj C_IMLTJ::TJ_GetTrig();
							if (!IsDefined(eTJTrig.MF) || !IsDefined(eTJTrig.MF.bIsDeleted))
							{
								if (!C_IMLLOGIC::GetTJList() ILIST::Contains(tj))
									C_IMLLOGIC::AddTJList(tj);
								
								origTargetName = eTJTrig C_IMAPFIXERUTIL::Entity_GetPropOrigValue("targetname");
								origOrigin = eTJTrig C_IMAPFIXERUTIL::Entity_GetPropOrigValue("origin");
								
								if (IsDefined(origTargetName))
									ls ILIST::Add(Tab + "custom\\include\\_mapfixer::RegTJ(\"" + eTJTrig.classname + "\", " + origOrigin + ", \"" + origTargetName + "\");");
								else
									ls ILIST::Add(Tab + "custom\\include\\_mapfixer::RegTJ(\"" + eTJTrig.classname + "\", " + origOrigin + ");");						
							}
						}
					}
				}
				
				else if (!IsDefined(tt) && IsDefined(tj))
				{
					eTJTrig = tj C_IMLTJ::TJ_GetTrig();
					if (!IsDefined(eTJTrig.MF) || !IsDefined(eTJTrig.MF.bIsDeleted))
					{
						C_IMLLOGIC::AddTJList(tj);
						
						origTargetName = eTJTrig C_IMAPFIXERUTIL::Entity_GetPropOrigValue("targetname");
						origOrigin = eTJTrig C_IMAPFIXERUTIL::Entity_GetPropOrigValue("origin");
						
						if (IsDefined(origTargetName))
							ls ILIST::Add(Tab + "custom\\include\\_mapfixer::RegTJWithoutTT(\"" + eTJTrig.classname + "\", " + origOrigin + ", \"" + origTargetName + "\");");
						else
							ls ILIST::Add(Tab + "custom\\include\\_mapfixer::RegTJWithoutTT(\"" + eTJTrig.classname + "\", " + origOrigin + ");");
					}
				}
			}
		}
		ls ILIST::Add("");
		return ls;
	}
	
	#endregion
	// ============================================================================= //

private Tab = "    ";

#endregion
// ============================================================================== //
