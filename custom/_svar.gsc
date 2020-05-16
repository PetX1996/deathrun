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
	UpdateSvars(true);
}

InSStarting(args)
{
	UpdateSvars(false);
}

private UpdateSvars(isInit)
{
	// ============================================================== //
	// DEV
	C_ISVAR::Init(isInit, "DEVEnabled", ITYPE::TYPE_BOOL, 1);
	C_ISVAR::Init(isInit, "DEVFlying", ITYPE::TYPE_BOOL, 1);
	
	C_ISVAR::Init(isInit, "DEVVGEnabled", ITYPE::TYPE_BOOL, 0);
	
	C_ISVAR::Init(isInit, "DEVDiagnosticsEnabled", ITYPE::TYPE_BOOL, 1);

	C_ISVAR::Init(isInit, "DEVClassEnabledAll", ITYPE::TYPE_BOOL, 0);
	C_ISVAR::Init(isInit, "DEVChEnabledAll", ITYPE::TYPE_BOOL, 0);
	
	// ============================================================== //
	// SERVER
	C_ISVAR::Init(isInit, "SVShortName", ITYPE::TYPE_STRING, "4GF.CZ #00 DR v2.0 BETA"); // visible in main menu
	C_ISVAR::Init(isInit, "SVFullName", ITYPE::TYPE_STRING, " ^44GF.CZ ^7#00 | DeathRun | v2.0 ^1BETA ^7| AntiBlock | Cracked | {CurRound}/{MaxRound}"); // generic name
	
	// ============================================================== //
	// GAME
	C_ISVAR::Init(isInit, "GFallDmgEnabled", ITYPE::TYPE_BOOL, 1);
	
	// ============================================================== //
	// LOGIC
	C_ISVAR::Init(isInit, "GLEnabled", ITYPE::TYPE_BOOL, 1);
	
	C_ISVAR::Init(isInit, "GLRoundLimit", ITYPE::TYPE_INTEGER, 8);
	
	// CLASSIC
	C_ISVAR::Init(isInit, "GLClassicMinPlayers", ITYPE::TYPE_INTEGER, 2);
	C_ISVAR::Init(isInit, "GLClassicSinglePlayerEnabled", ITYPE::TYPE_BOOL, 1);
	C_ISVAR::Init(isInit, "GLClassicSinglePlayerTime", ITYPE::TYPE_INTEGER, 5);
	
	C_ISVAR::Init(isInit, "GLClassicTimePreMatch", ITYPE::TYPE_INTEGER, 5);
	C_ISVAR::Init(isInit, "GLClassicTimeJumpers", ITYPE::TYPE_INTEGER, 5);
	C_ISVAR::Init(isInit, "GLClassicTimeActivators", ITYPE::TYPE_INTEGER, 0);
	
	C_ISVAR::Init(isInit, "GLClassicTimeLimit", ITYPE::TYPE_FLOAT, 4);
	
	C_ISVAR::Init(isInit, "GLClassicPostRespawnEnabled", ITYPE::TYPE_BOOL, 0);
	C_ISVAR::Init(isInit, "GLClassicPostRespawnTime", ITYPE::TYPE_INTEGER, 0);
	C_ISVAR::Init(isInit, "GLClassicPostRespawnPermEnabled", ITYPE::TYPE_BOOL, 0);
	
	// PICKING
	// activatorsCount >= 1;
	C_ISVAR::Init(isInit, "GLPickMoreEnabled", ITYPE::TYPE_BOOL, 0);
	// activatorsCount = max(players * this, 1); 
	// if this == 0 then activatorsCount = GLPickStaticCount;
	C_ISVAR::Init(isInit, "GLPickFraction", ITYPE::TYPE_FLOAT, 0.2);
	// activatorsCount = this;
	C_ISVAR::Init(isInit, "GLPickStaticCount", ITYPE::TYPE_INTEGER, 1);
	// 0 - random; 1 - always fair; 2 - mix
	C_ISVAR::Init(isInit, "GLPickType", ITYPE::TYPE_INTEGER, 2);
	// chance(%) for random picking otherwise will be use fair
	C_ISVAR::Init(isInit, "GLPickTypeMixRnd", ITYPE::TYPE_INTEGER, 10);

	
	// switches all traps off
	C_ISVAR::Init(isInit, "GLFreeRunEnabled", ITYPE::TYPE_BOOL, 1);
	
	C_ISVAR::Init(isInit, "GLFreeRunAfterActivated", ITYPE::TYPE_BOOL, 0);
	C_ISVAR::Init(isInit, "GLFreeRunWithoutTTs", ITYPE::TYPE_BOOL, 0);
	// % / 100; how many activators have to agree for start free run...
	// 0.75 = 3/4 of activators
	// 1 = all
	C_ISVAR::Init(isInit, "GLFreeRunChooseFraction", ITYPE::TYPE_FLOAT, 1);
	// seconds; choose time
	C_ISVAR::Init(isInit, "GLFreeRunChooseTime", ITYPE::TYPE_INTEGER, 5);
	
	// 0 -> don't change
	C_ISVAR::Init(isInit, "GLFreeRunAHealth", ITYPE::TYPE_INTEGER, 0);
	C_ISVAR::Init(isInit, "GLFreeRunJHealth", ITYPE::TYPE_INTEGER, 0);
	// "" -> don't change
	C_ISVAR::Init(isInit, "GLFreeRunAWeapon", ITYPE::TYPE_STRING, "knife_mp");
	C_ISVAR::Init(isInit, "GLFreeRunJWeapon", ITYPE::TYPE_STRING, "knife_mp");
	
	// ONE TEAM
	C_ISVAR::Init(isInit, "GLOneTeamEnabled", ITYPE::TYPE_BOOL, 0);
	
	C_ISVAR::Init(isInit, "GLOneTeamMinPlayers", ITYPE::TYPE_INTEGER, 1);
	C_ISVAR::Init(isInit, "GLOneTeamSinglePlayerEnabled", ITYPE::TYPE_BOOL, 1);
	C_ISVAR::Init(isInit, "GLOneTeamSinglePlayerTime", ITYPE::TYPE_INTEGER, 5);
	
	C_ISVAR::Init(isInit, "GLOneTeamTimePreMatch", ITYPE::TYPE_INTEGER, 5);
	
	C_ISVAR::Init(isInit, "GLOneTeamTimeLimit", ITYPE::TYPE_FLOAT, 4);
	
	C_ISVAR::Init(isInit, "GLOneTeamPostRespawnEnabled", ITYPE::TYPE_BOOL, 0);
	C_ISVAR::Init(isInit, "GLOneTeamPostRespawnTime", ITYPE::TYPE_INTEGER, 0);
	C_ISVAR::Init(isInit, "GLOneTeamPostRespawnPermEnabled", ITYPE::TYPE_BOOL, 0);
	
	// TRAINING ROUND
	C_ISVAR::Init(isInit, "GLTrainingRoundEnabled", ITYPE::TYPE_BOOL, 1);
	C_ISVAR::Init(isInit, "GLTrainingRoundTimeLimit", ITYPE::TYPE_FLOAT, 1);
	
	
	// MUSIC
	C_ISVAR::Init(isInit, "GLMusicEnabled", ITYPE::TYPE_BOOL, 1);
	
	// VICTORY
	C_ISVAR::Init(isInit, "GLVicTime", ITYPE::TYPE_INTEGER, 10);

	// EOG
	C_ISVAR::Init(isInit, "GLEOGTime", ITYPE::TYPE_INTEGER, 0);
	
	// ============================================================== //
	// VOTEMAP
	// 1 - voting; 2 - rotate map
	C_ISVAR::Init(isInit, "VMEnabled", ITYPE::TYPE_BOOL, 1);
	
	// 0 - sequential; 1 - full random; 2 - random with IgnoredMaps
	C_ISVAR::Init(isInit, "RMType", ITYPE::TYPE_INTEGER, 0);
	
	// last played maps -> IgnoredMaps -> shared for RotateMap & VoteMap
	// static count of ignored maps
	C_ISVAR::Init(isInit, "RMIgnCount", ITYPE::TYPE_INTEGER, 5);
	// count = count of maps in MapList * this;
	// if this == 0 then count = RMIgnCount;
	C_ISVAR::Init(isInit, "RMIgnMapListFraction", ITYPE::TYPE_FLOAT, 0);	

	
	// time for rating current Map
	C_ISVAR::Init(isInit, "VMRateTime", ITYPE::TYPE_INTEGER, 5);
	// time for voting
	C_ISVAR::Init(isInit, "VMTime", ITYPE::TYPE_INTEGER, 15);
	// time for showing the winning map
	C_ISVAR::Init(isInit, "VMAfterTime", ITYPE::TYPE_INTEGER, 5);
	
	// -- voting content options --
	// count of maps in the vote menu
	C_ISVAR::Init(isInit, "VMMapCount", ITYPE::TYPE_INTEGER, 6, 2, C_IVOTEMAP::MapMaxCount);
	// adds x maps from last voting(except previous map)
	C_ISVAR::Init(isInit, "VMAddLast", ITYPE::TYPE_INTEGER, 1);
	// adds x popular maps(stars >= 3)
	C_ISVAR::Init(isInit, "VMAddPopular", ITYPE::TYPE_INTEGER, 2);
	// adds x unpopular maps(stars <= 3)
	C_ISVAR::Init(isInit, "VMAddUnPopular", ITYPE::TYPE_INTEGER, 0);
	// adds x rated maps(maps which have more votes than average)
	C_ISVAR::Init(isInit, "VMAddRated", ITYPE::TYPE_INTEGER, 0);
	// adds x unrated maps(maps which have less votes than average)
	C_ISVAR::Init(isInit, "VMAddUnRated", ITYPE::TYPE_INTEGER, 1);
	// adds x old maps
	C_ISVAR::Init(isInit, "VMAddOld", ITYPE::TYPE_INTEGER, 0);
	// adds x new maps
	C_ISVAR::Init(isInit, "VMAddNew", ITYPE::TYPE_INTEGER, 1);
	// adds x hard maps(stars > 3)
	C_ISVAR::Init(isInit, "VMAddHard", ITYPE::TYPE_INTEGER, 1);
	// adds x easy maps(stars < 3)
	C_ISVAR::Init(isInit, "VMAddEasy", ITYPE::TYPE_INTEGER, 0);
	// adds x long maps(stars > 3)
	C_ISVAR::Init(isInit, "VMAddLong", ITYPE::TYPE_INTEGER, 0);
	// adds x short maps(stars < 3)
	C_ISVAR::Init(isInit, "VMAddShort", ITYPE::TYPE_INTEGER, 0);
	
	// filters maps in the voting
	C_ISVAR::Init(isInit, "VMFilterEnabled", ITYPE::TYPE_BOOL, 0);
	// enable popular maps(stars > 3)
	C_ISVAR::Init(isInit, "VMFilterPopular", ITYPE::TYPE_BOOL, 1);
	// enable unpopular maps(stars < 3)
	C_ISVAR::Init(isInit, "VMFilterUnPopular", ITYPE::TYPE_BOOL, 1);
	// ...
	C_ISVAR::Init(isInit, "VMFilterRated", ITYPE::TYPE_BOOL, 1);
	C_ISVAR::Init(isInit, "VMFilterUnRated", ITYPE::TYPE_BOOL, 1);
	C_ISVAR::Init(isInit, "VMFilterOld", ITYPE::TYPE_BOOL, 1);
	C_ISVAR::Init(isInit, "VMFilterNew", ITYPE::TYPE_BOOL, 1);
	C_ISVAR::Init(isInit, "VMFilterHard", ITYPE::TYPE_BOOL, 1);
	C_ISVAR::Init(isInit, "VMFilterEasy", ITYPE::TYPE_BOOL, 1);
	C_ISVAR::Init(isInit, "VMFilterLong", ITYPE::TYPE_BOOL, 1);
	C_ISVAR::Init(isInit, "VMFilterShort", ITYPE::TYPE_BOOL, 1);
	// ----
	
	// ============================================================== //
	// CLIENT
	// check wall-firing from script
	// may cause problems with player hitting(doesn't use player's hitbox model)
	C_ISVAR::Init(isInit, "CScrCheckPenetration", ITYPE::TYPE_BOOL, 1);
	
	C_ISVAR::Init(isInit, "CJHealth", ITYPE::TYPE_INTEGER, 100);
	C_ISVAR::Init(isInit, "CJSpeed", ITYPE::TYPE_FLOAT, 1.05);
	C_ISVAR::Init(isInit, "CJGunsKnifeDmg", ITYPE::TYPE_INTEGER, 85);
	C_ISVAR::Init(isInit, "CJMeleeKnifeDmg", ITYPE::TYPE_INTEGER, 100);
	
	C_ISVAR::Init(isInit, "CAHealth", ITYPE::TYPE_INTEGER, 100);
	C_ISVAR::Init(isInit, "CASpeed", ITYPE::TYPE_FLOAT, 1.12);
	C_ISVAR::Init(isInit, "CAKnifeDmg", ITYPE::TYPE_INTEGER, 100);
	
	// LIFES
	C_ISVAR::Init(isInit, "CLifesEnabled", ITYPE::TYPE_BOOL, 1);
	C_ISVAR::Init(isInit, "CLifesCount", ITYPE::TYPE_INTEGER, C_ICLIFES::MaxLifes, 1, C_ICLIFES::MaxLifes);
	C_ISVAR::Init(isInit, "CLifesTimer", ITYPE::TYPE_INTEGER, 5);
	
	// BUNNYHOOP
	C_ISVAR::Init(isInit, "CBHEnabled", ITYPE::TYPE_BOOL, 1);
	
	// SPRAY
	C_ISVAR::Init(isInit, "CSprayEnabled", ITYPE::TYPE_BOOL, 1);
	C_ISVAR::Init(isInit, "CSprayTime", ITYPE::TYPE_INTEGER, 5);
	
	// AFK
	C_ISVAR::Init(isInit, "CAAFKEnabled", ITYPE::TYPE_BOOL, 1);
	C_ISVAR::Init(isInit, "CAAFKUIEnabled", ITYPE::TYPE_BOOL, 1);
	C_ISVAR::Init(isInit, "CAAFKWarnTime", ITYPE::TYPE_INTEGER, 30);	
	C_ISVAR::Init(isInit, "CAAFKFinishTime", ITYPE::TYPE_INTEGER, 35);
	C_ISVAR::Init(isInit, "CAAFKAction", ITYPE::TYPE_INTEGER, 2);	// 0 - kill; 1 - spectator; 2 - pick new; 3 - AutoActivateTTs
	C_ISVAR::Init(isInit, "CAAFKActivateTTMin", ITYPE::TYPE_INTEGER, 5);
	C_ISVAR::Init(isInit, "CAAFKActivateTTMax", ITYPE::TYPE_INTEGER, 20);
	
	C_ISVAR::Init(isInit, "CJAFKEnabled", ITYPE::TYPE_BOOL, 1);
	C_ISVAR::Init(isInit, "CJAFKUIEnabled", ITYPE::TYPE_BOOL, 1);
	C_ISVAR::Init(isInit, "CJAFKWarnTime", ITYPE::TYPE_INTEGER, 30);	
	C_ISVAR::Init(isInit, "CJAFKFinishTime", ITYPE::TYPE_INTEGER, 35);
	C_ISVAR::Init(isInit, "CJAFKAction", ITYPE::TYPE_INTEGER, 0);	// 0 - kill; 1 - spectator
	
	// STUCK
	C_ISVAR::Init(isInit, "CAStuckEnabled", ITYPE::TYPE_BOOL, 1);
	C_ISVAR::Init(isInit, "CAStuckWarnTime", ITYPE::TYPE_INTEGER, 60);
	C_ISVAR::Init(isInit, "CAStuckKillTime", ITYPE::TYPE_INTEGER, 65);

	C_ISVAR::Init(isInit, "CJStuckEnabled", ITYPE::TYPE_BOOL, 1);
	C_ISVAR::Init(isInit, "CJStuckWarnTime", ITYPE::TYPE_INTEGER, 20);
	C_ISVAR::Init(isInit, "CJStuckKillTime", ITYPE::TYPE_INTEGER, 25);
	
	// ============================================================== //
	// CLIENT SCORE
	C_ISVAR::Init(isInit, "CSMultiplicator", ITYPE::TYPE_FLOAT, 1);
	
	C_ISVAR::Init(isInit, "CSKill", ITYPE::TYPE_INTEGER, 50);
	C_ISVAR::Init(isInit, "CSKillHeadshot", ITYPE::TYPE_INTEGER, 100);
	C_ISVAR::Init(isInit, "CSAssist", ITYPE::TYPE_INTEGER, 10);
	
	C_ISVAR::Init(isInit, "CSAJumperDied", ITYPE::TYPE_INTEGER, 15);
	C_ISVAR::Init(isInit, "CSATrapActivate", ITYPE::TYPE_INTEGER, 10);
	
	C_ISVAR::Init(isInit, "CSJTrapSucceed", ITYPE::TYPE_INTEGER, 5);
	C_ISVAR::Init(isInit, "CSJFinishedFirst", ITYPE::TYPE_INTEGER, 150);
	C_ISVAR::Init(isInit, "CSJFinishedSecond", ITYPE::TYPE_INTEGER, 100);
	C_ISVAR::Init(isInit, "CSJFinishedThird", ITYPE::TYPE_INTEGER, 50);
	C_ISVAR::Init(isInit, "CSJFinishedNext", ITYPE::TYPE_INTEGER, 25);
}