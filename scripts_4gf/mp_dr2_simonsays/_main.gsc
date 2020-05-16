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
	
	// ========================================================================================================================== //

	mapper\_mapinfo::RegFullName("Simon Says ^34GF.CZ ^5DR-2- ^6MG");
	
	mapper\_mapinfo::RegDifficulty(3);
	mapper\_mapinfo::RegLength(3);
	
	mapper\_mapinfo::RegCreator("R3MIEN", "e500c85a3ba568ed7eb8400da9065e09");
	mapper\_mapinfo::RegCreator("Col!ar", "615fe32f67350603d6438a563e6dec3b");
	mapper\_mapinfo::RegCreator("PetX", "f3329736f9b71472660b7d6c5280aa23");
	
    mapper\_mapinfo::RegDescription(0, "Creators");
    mapper\_mapinfo::RegDescription(1, "  R3MIEN and Col!ar - Map Creators");
    mapper\_mapinfo::RegDescription(2, "  PetX - Map Scripter");
    mapper\_mapinfo::RegDescription(3, "");
    mapper\_mapinfo::RegDescription(4, "Inspired by CS:S minigames");
    mapper\_mapinfo::RegDescription(5, "");
    mapper\_mapinfo::RegDescription(6, "");
    mapper\_mapinfo::RegDescription(7, "  www.4GF.cz");

	api\gamelogic\_oneteam::RegOneTeam(true);
	api\gamelogic\_traininground::RegTrainingRound(false);
	
	// allows respawning until game starts
	api\gamelogic\_oneteam::AllowPostRespawnPermanentlly(true);
	
	// ========================================================================================================================== //
	
	thread scripts_4gf\mp_dr2_simonsays\traps\_main::Main();
	
}
