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

Main()
{
	maps\mp\_load::main();

	// ========================================================================================================================== //
	mapper\_mapinfo::RegFullName("Amazing ^34GF.CZ ^5DR-2- ^1BETA");
	mapper\_mapinfo::RegDifficulty(4);
	mapper\_mapinfo::RegLength(5);
	mapper\_mapinfo::RegCreator("Col!ar", "615fe32f67350603d6438a563e6dec3b");
	mapper\_mapinfo::RegCreator("R3MIEN", "e500c85a3ba568ed7eb8400da9065e09");
	mapper\_mapinfo::RegCreator("PetX", "f3329736f9b71472660b7d6c5280aa23");
	
	mapper\_mapinfo::RegDescription(0, "Creators");
	mapper\_mapinfo::RegDescription(1, "  Col!ar - boss, hater, design guru");
	mapper\_mapinfo::RegDescription(2, "  R3MIEN - can everything, do nothing");
	mapper\_mapinfo::RegDescription(3, "  PetX - lazy bastard...and scripts");
	mapper\_mapinfo::RegDescription(4, "");
	mapper\_mapinfo::RegDescription(5, "");
	mapper\_mapinfo::RegDescription(6, "");
	mapper\_mapinfo::RegDescription(7, "First version - 28. 7. 2012");
	mapper\_mapinfo::RegDescription(8, "Current version - 26. 9. 2014");
	
	api\gamelogic\_picking::RegPickMore(true);
	
	
	// challenges
	/*papyrusI = mapper\_challenges::GetDefaultItem();
	papyrusI.sName = "papyrusI";
	papyrusI.sMenuName = "Papyrus I";
	papyrusI.sMenuDescription = "Collect 5 papyruses.";
	papyrusI.iMaxValue = 5;
	papyrusI.bIsFree = true;

	papyrusII = mapper\_challenges::GetDefaultItem();
	papyrusII.sName = "papyrusII";
	papyrusII.sMenuName = "Papyrus II";
	papyrusII.sMenuDescription = "Collect 10 papyruses.";
	papyrusII.iMaxValue = 10;
	papyrusII.bIsFree = true;

	papyrusIII = mapper\_challenges::GetDefaultItem();
	papyrusIII.sName = "papyrusIII";
	papyrusIII.sMenuName = "Papyrus III";
	papyrusIII.sMenuDescription = "Collect 20 papyruses.";
	papyrusIII.iMaxValue = 20;
	papyrusIII.bIsFree = true;
	
	papyrus = mapper\_challenges::GetDefaultStageList();
	papyrus.sName = "papyrus";
	papyrus mapper\_challenges::StageList_AddStage(papyrusI);
	papyrus mapper\_challenges::StageList_AddStage(papyrusII);
	papyrus mapper\_challenges::StageList_AddStage(papyrusIII);
	mapper\_challenges::RegStageList(papyrus);

	
	paranormal = mapper\_challenges::GetDefaultItem();
	paranormal.sName = "paranormal";
	paranormal.sMenuName = "Paranormal";
	paranormal.sMenuDescription = "Run all paranormals.";
	paranormal.iMaxValue = 20;
	paranormal.bIsFree = true;
	mapper\_challenges::RegItem(paranormal);*/
	
	
	// music
	mapper\_music::PlayNow("mp_dr2_amazing", "James Horner - Becoming One Of The People");
	// ========================================================================================================================== //
	
	
	
	
	thread scripts_4gf\mp_dr2_amazing\_ways::Main();
	
	thread scripts_4gf\mp_dr2_amazing\_fx::Main();
	thread scripts_4gf\mp_dr2_amazing\_logo::Main();
	thread scripts_4gf\mp_dr2_amazing\_doors::Main();	
	thread scripts_4gf\mp_dr2_amazing\_water::Main();
	
	thread scripts_4gf\mp_dr2_amazing\endrooms\_endrooms::Main();
	thread scripts_4gf\mp_dr2_amazing\endrooms\_bounce::Main();
	
	thread scripts_4gf\mp_dr2_amazing\traps\_t0::Main();
	thread scripts_4gf\mp_dr2_amazing\traps\_t1::Main();
	thread scripts_4gf\mp_dr2_amazing\traps\_t2::Main();
	thread scripts_4gf\mp_dr2_amazing\traps\_t3::Main();
	thread scripts_4gf\mp_dr2_amazing\traps\_t4::Main();
	thread scripts_4gf\mp_dr2_amazing\traps\_t5::Main();
	thread scripts_4gf\mp_dr2_amazing\traps\_t6::Main();
	thread scripts_4gf\mp_dr2_amazing\traps\_t7::Main();
	thread scripts_4gf\mp_dr2_amazing\traps\_t8::Main();
	thread scripts_4gf\mp_dr2_amazing\traps\_t9::Main();
	thread scripts_4gf\mp_dr2_amazing\traps\_t10::Main();
	thread scripts_4gf\mp_dr2_amazing\traps\_t11::Main();
	thread scripts_4gf\mp_dr2_amazing\traps\_t12::Main();
	thread scripts_4gf\mp_dr2_amazing\traps\_t13::Main();
	thread scripts_4gf\mp_dr2_amazing\traps\_t14::Main();
	thread scripts_4gf\mp_dr2_amazing\traps\_t15::Main();
	thread scripts_4gf\mp_dr2_amazing\traps\_t16::Main();
	thread scripts_4gf\mp_dr2_amazing\traps\_t17::Main();
	thread scripts_4gf\mp_dr2_amazing\traps\_t18::Main();
	thread scripts_4gf\mp_dr2_amazing\traps\_t19::Main();
	thread scripts_4gf\mp_dr2_amazing\traps\_t20::Main();
	thread scripts_4gf\mp_dr2_amazing\traps\_t21::Main();
	thread scripts_4gf\mp_dr2_amazing\traps\_t22::Main();
	thread scripts_4gf\mp_dr2_amazing\traps\_t23::Main();
	thread scripts_4gf\mp_dr2_amazing\traps\_t24::Main();
	
	thread scripts_4gf\mp_dr2_amazing\visual\_hole::Main();
	thread scripts_4gf\mp_dr2_amazing\visual\_grinder::Main();
	thread scripts_4gf\mp_dr2_amazing\visual\_spidertrap::Main();
	thread scripts_4gf\mp_dr2_amazing\visual\_spidertrap::Main2();
	thread scripts_4gf\mp_dr2_amazing\visual\_sandtrap::Main();
	thread scripts_4gf\mp_dr2_amazing\visual\_pigtrap::Main();
	thread scripts_4gf\mp_dr2_amazing\visual\_sliders::Main();
	thread scripts_4gf\mp_dr2_amazing\visual\_torches::Main();
	
	//thread scripts_4gf\mp_dr2_amazing\paranormal\_hands::Main();
	//thread scripts_4gf\mp_dr2_amazing\paranormal\_roots::Main();
}