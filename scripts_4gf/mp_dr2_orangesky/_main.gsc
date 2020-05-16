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

	// ========================================================================================================================== //

	mapper\_mapinfo::RegFullName("OrangeSky ^34GF.CZ ^5DR-2-");
	mapper\_mapinfo::RegDifficulty(4);
	mapper\_mapinfo::RegLength(5);
	mapper\_mapinfo::RegCreator("Col!ar", "615fe32f67350603d6438a563e6dec3b");
	mapper\_mapinfo::RegCreator("PetX", "f3329736f9b71472660b7d6c5280aa23");
	
	mapper\_mapinfo::RegDescription(0, "Creators");
	mapper\_mapinfo::RegDescription(1, "  Col!ar - map");
	mapper\_mapinfo::RegDescription(2, "  PetX - scripts");
	mapper\_mapinfo::RegDescription(3, "");
	mapper\_mapinfo::RegDescription(4, "www.4gf.cz");
	mapper\_mapinfo::RegDescription(5, "Map info - turn on specular maps");
	mapper\_mapinfo::RegDescription(6, "");
	mapper\_mapinfo::RegDescription(7, "First version - 8. 9. 2014");
	mapper\_mapinfo::RegDescription(8, "Current version - 8. 9. 2014");
	
	api\gamelogic\_picking::RegPickMore(true);
	
	// music
	mapper\_music::PlayNow("startsong", "Beyond Music - Digit By Digit");

	// ========================================================================================================================== //
	// CHALLENGES
	secret = mapper\_challenges::GetDefaultItem();
	secret.sName = "secret";
	secret.sMenuName = "Secret";
	secret.sMenuDescription = "Find and finish secret room.";
	secret.iMaxValue = 1;
	secret.bIsFree = true;
	mapper\_challenges::RegItem(secret);
	// ========================================================================================================================== //
	
	thread scripts_4gf\mp_dr2_orangesky\traps\_t0::Main();
	thread scripts_4gf\mp_dr2_orangesky\traps\_t1::Main();
	thread scripts_4gf\mp_dr2_orangesky\traps\_t2::Main();
	thread scripts_4gf\mp_dr2_orangesky\traps\_t3::Main();
	thread scripts_4gf\mp_dr2_orangesky\traps\_t4::Main();
	thread scripts_4gf\mp_dr2_orangesky\traps\_t5::Main();
	thread scripts_4gf\mp_dr2_orangesky\traps\_t6::Main();
	thread scripts_4gf\mp_dr2_orangesky\traps\_t7::Main();
	thread scripts_4gf\mp_dr2_orangesky\traps\_t8::Main();
	thread scripts_4gf\mp_dr2_orangesky\traps\_t9::Main();
	thread scripts_4gf\mp_dr2_orangesky\traps\_t10::Main();
	thread scripts_4gf\mp_dr2_orangesky\traps\_t11::Main();

	thread scripts_4gf\mp_dr2_orangesky\visual\_desk::Main();
	thread scripts_4gf\mp_dr2_orangesky\visual\_fake::Main();
	thread scripts_4gf\mp_dr2_orangesky\visual\_gate::Main();
	thread scripts_4gf\mp_dr2_orangesky\visual\_logo::Main();
	thread scripts_4gf\mp_dr2_orangesky\visual\_music::Main();
	thread scripts_4gf\mp_dr2_orangesky\visual\_ports::Main();
	thread scripts_4gf\mp_dr2_orangesky\visual\_secret::Main();
	
	thread scripts_4gf\mp_dr2_orangesky\endrooms\_endrooms::Main();
	thread scripts_4gf\mp_dr2_orangesky\endrooms\_bounce::Main();
}