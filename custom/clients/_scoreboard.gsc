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

InSPreCaching(args)
{
	PreCacheShader("faction_128_sas");
	PreCacheShader("faction_128_arab");
}

InSStarting(args)
{
	SetDvar("g_TeamName_Allies", C_ILOCALIZE::TEAMJumpersName);
	SetDvar("g_TeamIcon_Allies", "faction_128_sas");
	SetDvar("g_TeamColor_Allies", "1 1 1");
	SetDvar("g_ScoresColor_Allies", "0 0.5 0");	
	
	SetDvar("g_TeamName_Axis", C_ILOCALIZE::TEAMActivatorsName);
	SetDvar("g_TeamIcon_Axis", "faction_128_arab");
	SetDvar("g_TeamColor_Axis", "1 1 1");		
	SetDvar("g_ScoresColor_Axis", "0.5 0 0");
	
	SetDvar("g_ScoresColor_Spectator", ".25 .25 .25");
	SetDvar("g_ScoresColor_Free", ".76 .78 .10");
	SetDvar("g_teamColor_MyTeam", ".6 .8 .6" );
	SetDvar("g_teamColor_EnemyTeam", "1 .45 .5" );	
}
