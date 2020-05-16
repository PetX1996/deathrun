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

public sealed ModVersion = "DR v2.0 BETA";
public sealed ModBuild = COMPILER::VersionInt;
public sealed ModFullVersion = ModVersion + " - " + ModBuild;

public Init()
{
	level.splitscreen = IsSplitScreen();
	level.xenon = false;
	level.ps3 = false;
	level.onlineGame = true;
	level.console = false; 
	level.rankedMatch = GetDvarInt("sv_pure");
	level.teamBased = true;
	level.oldschool = false;
	level.gameEnded = false;
	
	if (!IsDefined(game["iRoundsPlayedTotally"]))
		game["iRoundsPlayedTotally"] = 0;
	else
		game["iRoundsPlayedTotally"]++;
	
	level.script = ToLower(GetDvar("mapname"));
	level.gametype = ToLower(GetDvar("g_gametype"));
		
	level.dropTeam = GetDvarInt("sv_maxclients");
	
	if (GetDvar("scr_player_sprinttime") == "")
		SetDvar("scr_player_sprinttime", GetDvar("player_sprintTime"));
	
	if (GetDvar("scr_show_unlock_wait") == "")
		SetDvar("scr_show_unlock_wait", 0.1);
		
	if (GetDvar("scr_intermission_time") == "")
		SetDvar("scr_intermission_time", 30.0);
	
	SetDvar("g_deadChat", 1);
	
	level._effect = [];
	
	level.players = [];
	level._alliesPlayers = [];
	level._axisPlayers = [];
	level._spectatorPlayers = [];
	
	args = IECALLBACK::Args_Create();
	level RunInSIniting(args);
}

// ===================================================================== //
// SERVER

/// 
public RunInSIniting(args)
{
	// keep order
	custom\_svar::InSIniting(args);
	
	custom\_maplogic::InSIniting(args);
	custom\_mapfixer::InSIniting(args);
	
	
	custom\_svar::InSIniting(args);

	custom\_game::InSIniting(args);

	
	// others...
	custom\_mapinfo::InSIniting(args);
	custom\_mapper::InSIniting(args);
	custom\_serverinfo::InSIniting(args);
	
	custom\gamelogic\_rounds::InSIniting(args);
	custom\gamelogic\_state::InSIniting(args);
	custom\gamelogic\_timer::InSIniting(args);
	custom\gamelogic\_type::InSIniting(args);
	
	inputs\class\perks::InSIniting(args);
	
	level IECALLBACK::RunEvent("InSIniting", false, args);
	
	// keep it last!
	thread CheckGameType();
	scripts_4gf\_main::main();
}

/// 
public RunInSPreCaching(args)
{
	custom\_mappopularity::InSPreCaching(args);

	custom\clients\_damagefeedback::InSPreCaching(args);
	custom\clients\_dev::InSPreCaching(args);
	custom\clients\_menu::InSPreCaching(args);
	

	// -- braxi
	PreCacheItem("remington700_mp");
	PreCacheItem("m40a3_mp");
	PreCacheItem("bh_mp");
	PreCacheItem("colt44_mp");
	// ----
	
	custom\_diagnostics::InSPreCaching(args);
	
	custom\clients\_class::InSPreCaching(args);
	custom\clients\_quickmessage::InSPreCaching(args);
	custom\clients\_rank::InSPreCaching(args);
	custom\clients\_scoreboard::InSPreCaching(args);
	custom\clients\_menu::InSPreCaching(args);
	
	level IECALLBACK::RunEvent("InSPreCaching", false, args);
}

/// 
public RunInSStarting(args)
{
	// keep order
	custom\_svar::InSStarting(args);
	
	custom\_mapfixer::InSStarting(args);
	
	custom\_rotatemap::InSStarting(args);
	
	custom\clients\_corpse::InSStarting(args);
	custom\clients\_dev::InSStarting(args);
	custom\clients\_weapon::InSStarting(args);
	
	
	maps\mp\gametypes\_hud::init();

	custom\_svar::InSStarting(args);

	custom\_maplogic::InSStarting(args);
	
	// others...
	custom\gamelogic\_logic::InSStarting(args);
	custom\gamelogic\_type::InSStarting(args);
	custom\_mapinfo::InSStarting(args);
	custom\_serverinfo::InSStarting(args);
	
	custom\clients\_scoreboard::InSStarting(args);
	custom\clients\_spawn::InSStarting(args);
	
	level IECALLBACK::RunEvent("InSStarting", false, args);
}

/// 
public RunOnCBeginConnecting(args)
{
	
	self IECALLBACK::RunEvent("OnCBeginConnecting", true, args);
}

/// DvarDic
public RunInCPreConnecting(args)
{
	// keep order!
	self custom\_mappopularity::InCPreConnecting(args);

	self custom\gamelogic\_rounds::InCPreConnecting(args);
	self custom\gamelogic\_picking::InCPreConnecting(args);
	
	self custom\clients\_rank::InCPreConnecting(args);
	if (!IGAME::IsDev()) wait 0.05;
	self custom\clients\_prestige::InCPreConnecting(args);
	if (!IGAME::IsDev()) wait 0.05;
	self custom\clients\_cvar::InCPreConnecting(args);
	if (!IGAME::IsDev()) wait 0.05;
	self custom\clients\_class::InCPreConnecting(args);
	if (!IGAME::IsDev()) wait 0.05;
	
	// others
	self custom\gamelogic\_logic::InCPreConnecting(args);
	self custom\gamelogic\_type::InCPreConnecting(args);
	
	self custom\_mapinfo::InCPreConnecting(args);
	self custom\_mapper::InCPreConnecting(args);
	self custom\_serverinfo::InCPreConnecting(args);
	
	self custom\clients\_lifes::InCPreConnecting(args);
	
	self IECALLBACK::RunEvent("InCPreConnecting", false, args);
}

/// DvarDic
public RunInCPostConnecting(args)
{

	self IECALLBACK::RunEvent("InCPostConnecting", false, args);
}

/// 
public RunOnCConnected(args)
{
	self thread custom\clients\_damagefeedback::OnCConnected(args);
	self thread custom\clients\_menu::OnCConnected(args);
	self thread custom\clients\_bind::OnCConnected(args);
	self thread custom\clients\_weapon::OnCConnected(args);

	
	self thread maps\mp\gametypes\_hud_message::initNotifyMessage();

	self thread custom\clients\_progress::OnCConnected(args);
	
	self thread custom\clients\_statistic::OnCConnected(args);
	
	self thread inputs\challenges\process::OnCConnected(args);
	
	self IECALLBACK::RunEvent("OnCConnected", true, args);
}

/// bCancel
public RunInCLeaving(args)
{
	self custom\clients\_statistic::InCLeaving(args);
	
	self IECALLBACK::RunEvent("InCLeaving", false, args);	
}

/// 
public RunInCDisconnecting(args)
{
	self custom\clients\_corpse::InCDisconnecting(args);
	
	self IECALLBACK::RunEvent("InCDisconnecting", false, args);
}

/// bCancel, DvarDic, SpawnPoint, sBodyModel, sHeadModel, sViewModel, iHealth, fSpeed, sForcedWeapon, sSpawnWeapon, Weapons, sOffHand, sSecondaryOffHand, sActionSlot1, sActionSlot2, sActionSlot3, sActionSlot4, Perks
public RunInCPreSpawning(args)
{
	// spawn
	self custom\clients\_spawn::InCPreSpawning(args);

	// class
	self custom\clients\_class::InCPreSpawning(args);

	// speed & health settings from svars...
	self custom\clients\_player::InCPreSpawning(args);
	
	// other stuffs
	
	
	self inputs\class\perks::InCPreSpawning(args);
	
	self IECALLBACK::RunEvent("InCPreSpawning", false, args);
}

/// bCancel, DvarDic, SpawnPoint, sBodyModel, sHeadModel, sViewModel, iHealth, fSpeed, sForcedWeapon, sSpawnWeapon, Weapons, sOffHand, sSecondaryOffHand, sActionSlot1, sActionSlot2, sActionSlot3, sActionSlot4, Perks
public RunInCPostSpawning(args)
{
	self custom\gamelogic\_type::InCPostSpawning(args);

	self inputs\class\perks::InCPostSpawning(args);
	
	self IECALLBACK::RunEvent("InCPostSpawning", false, args);	
}

/// DvarDic, SpawnPoint, sBodyModel, sHeadModel, sViewModel, iHealth, fSpeed, sForcedWeapon, sSpawnWeapon, Weapons, sOffHand, sSecondaryOffHand, sActionSlot1, sActionSlot2, sActionSlot3, sActionSlot4, Perks
public RunInCFinalSpawning(args)
{
	self custom\clients\_class::InCFinalSpawning(args);
	self custom\clients\_lifes::InCFinalSpawning(args);
	
	self IECALLBACK::RunEvent("InCFinalSpawning", false, args);	
}

/// SpawnPoint, sBodyModel, sHeadModel, sViewModel, iHealth, fSpeed, sForcedWeapon, sSpawnWeapon, Weapons, sOffHand, sSecondaryOffHand, sActionSlot1, sActionSlot2, sActionSlot3, sActionSlot4, Perks
public RunOnCSpawned(args)
{
	self thread custom\clients\_dev::OnCSpawned(args);
	self thread custom\clients\_weapon::OnCSpawned(args);
	

	self thread custom\gamelogic\_logic::OnCSpawned(args);

	self thread custom\clients\_afk::OnCSpawned(args);
	self thread custom\clients\_class::OnCSpawned(args);
	self thread custom\clients\_player::OnCSpawned(args);
	
	self thread inputs\class\perks::OnCSpawned(args);
	self thread inputs\challenges\process::OnCSpawned(args);
	
	self IECALLBACK::RunEvent("OnCSpawned", true, args);
}

// ===================================================================== //
#region Team

/// bCancel, sOldTeam, sNewTeam
public TEAM_RunInCPreJoining(args)
{
	
	self IECALLBACK::RunEvent("TEAM_InCPreJoining", false, args);
}

/// bCancel, sOldTeam, sNewTeam
public TEAM_RunInCPostJoining(args)
{
	
	self IECALLBACK::RunEvent("TEAM_InCPostJoining", false, args);
}

/// sOldTeam, sNewTeam
public TEAM_RunOnCJoined(args)
{
	self thread custom\clients\_statistic::TEAM_OnCJoined(args);
	
	self IECALLBACK::RunEvent("TEAM_OnCJoined", true, args);
}

#endregion
// ===================================================================== //
#region Damage

/// bCancel, eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime
public DMG_RunInCPreDamaging(args)
{
	self custom\clients\_player::DMG_InCPreDamaging(args);
	
	self IECALLBACK::RunEvent("DMG_InCPreDamaging", false, args);
}

/// bCancel, eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime
public DMG_RunInCPostDamaging(args)
{
	self custom\_mapfixer::DMG_InCPostDamaging(args);

	self custom\clients\_player::DMG_InCPostDamaging(args);
	
	self inputs\class\perks::DMG_InCPostDamaging(args);
	self inputs\challenges\process::DMG_InCPostDamaging(args);
	
	self IECALLBACK::RunEvent("DMG_InCPostDamaging", false, args);
}

/// eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime
public DMG_RunOnCDamaged(args)
{
	self thread custom\clients\_damagefeedback::DMG_OnCDamaged(args);

	self thread inputs\challenges\process::DMG_OnCDamaged(args);
	
	self IECALLBACK::RunEvent("DMG_OnCDamaged", true, args);
}

/// eInflictor, eAttacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration, vPoint, iDFlags
public DMG_RunInCKilling(args)
{

	self IECALLBACK::RunEvent("DMG_InCKilling", false, args);
}

/// eInflictor, eAttacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration, vPoint, iDFlags
public DMG_RunOnCKilled(args)
{
	self thread custom\clients\_vg::DMG_OnCKilled();

	self thread custom\_diagnostics::DMG_OnCKilled(args);

	self thread custom\clients\_death::DMG_OnCKilled(args);
	self thread custom\clients\_lifes::DMG_OnCKilled(args);
	self thread custom\clients\_score::DMG_OnCKilled(args);
	self thread custom\clients\_statistic::DMG_OnCKilled(args);
	
	self thread inputs\class\perks::DMG_OnCKilled(args);
	self thread inputs\challenges\process::DMG_OnCKilled(args);
	self thread inputs\summary\process::DMG_OnCKilled(args);
	
	self IECALLBACK::RunEvent("DMG_OnCKilled", true, args);
}

/// eInflictor, eAttacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration, vPoint, iDFlags
public DMG_RunOnCDelayKilled(args)
{
	self thread custom\clients\_lifes::DMG_OnCDelayKilled(args);

	self thread custom\gamelogic\_logic::DMG_OnCDelayKilled(args);
	
	self IECALLBACK::RunEvent("DMG_OnCDelayKilled", true, args);
}

/// pVictim, eInflictor, eAttacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration, vPoint, iDFlags
public DMG_RunOnCAssisted(args)
{
	self thread custom\_diagnostics::DMG_OnCAssisted(args);
	
	self thread custom\clients\_score::DMG_OnCAssisted(args);
	
	self thread inputs\challenges\process::DMG_OnCAssisted(args);
	
	self IECALLBACK::RunEvent("DMG_OnCAssisted", true, args);
}

/// bCancel, fExplosionForce, fExplosionRadius, eInflictor, eAttacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration, vPoint, iDFlags
public DMG_RunInCPlacingCorpse(args)
{

	self IECALLBACK::RunEvent("DMG_InCPlacingCorpse", false, args);
}

/// fExplosionForce, fExplosionRadius, eBody, eInflictor, eAttacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration, vPoint, iDFlags
public DMG_RunOnCPlacedCorpse(args)
{

	self IECALLBACK::RunEvent("DMG_OnCPlacedCorpse", true, args);
}

#endregion
// ===================================================================== //
#region GameLogic

/// 
public GL_RunOnCConnected(args)
{

	self IECALLBACK::RunEvent("GL_OnCConnected", true, args);
}

/// 
public GL_RunOnCJoinedTeam(args)
{

	self IECALLBACK::RunEvent("GL_OnCJoinedTeam", true, args);
}

/// 
public GL_RunOnCJoinedSpectators(args)
{
	self thread custom\gamelogic\_logic::GL_OnCJoinedSpectators(args);
	
	self IECALLBACK::RunEvent("GL_OnCJoinedSpectators", true, args);
}

/// 
public GL_RunOnSStartedSinglePlayer(args)
{

	IECALLBACK::RunEvent("GL_OnSStartedSinglePlayer", true, args);
}

/// 
public GL_RunOnSStartedGame(args)
{

	IECALLBACK::RunEvent("GL_OnSStartedGame", true, args);
}

/// iCount
public GL_RunInSPickingActivators(args)
{


	self IECALLBACK::RunEvent("GL_InSPickingActivators", false, args);
}

/// pickedList
public GL_RunOnSPickedActivators(args)
{


	self IECALLBACK::RunEvent("GL_OnSPickedActivators", true, args);
}

/// bCancel
public GL_RunInCSelectingForPick(args)
{


	self IECALLBACK::RunEvent("GL_InCSelectingForPick", false, args);
}

/// bCancel
public GL_RunInCPickingAsActivator(args)
{


	self IECALLBACK::RunEvent("GL_InCPickingAsActivator", false, args);
}

/// 
public GL_RunOnCPickedAsActivator(args)
{


	self IECALLBACK::RunEvent("GL_OnCPickedAsActivator", true, args);
}

/// 
public GL_RunOnSReleasedJumpers(args)
{
	
	
	IECALLBACK::RunEvent("GL_OnSReleasedJumpers", true, args);
}

/// 
public GL_RunOnSReleasedActivators(args)
{
	
	
	IECALLBACK::RunEvent("GL_OnSReleasedActivators", true, args);
}

/// 
public GL_RunOnSStartedFreeRun(args)
{

	IECALLBACK::RunEvent("GL_OnSStartedFreeRun", true, args);
}

/// 
public GL_RunOnSElapsedTime(args)
{
	
	IECALLBACK::RunEvent("GL_OnSElapsedTime", true, args);
}

/// iType, [sWinningTeam], [pWinner]
public GL_RunOnSEndedGame(args)
{
	thread custom\clients\_statistic::GL_OnSEndedGame(args);
	
	thread inputs\challenges\process::GL_OnSEndedGame(args);
	
	IECALLBACK::RunEvent("GL_OnSEndedGame", true, args);	
}

/// 
public GL_RunInSTerminatingRound(args)
{
	custom\clients\_statistic::GL_InSTerminatingRound(args);
	
	IECALLBACK::RunEvent("GL_InSTerminatingRound", false, args);
}

/// 
public GL_RunInSTerminatingMap(args)
{
	custom\_mappopularity::GL_InSTerminatingMap(args);
	
	IECALLBACK::RunEvent("GL_InSTerminatingMap", false, args);	
}

#endregion
// ===================================================================== //
#region MapLogic

/// bCancel, bAllow
public ML_RunInAllowingTTs(args)
{
	
	self IECALLBACK::RunEvent("ML_InAllowingTTs", false, args);
}

/// bAllow, bIsSuccessful
public ML_RunOnAllowedTTs(args)
{
	
	self IECALLBACK::RunEvent("ML_OnAllowedTTs", true, args);
}

/// bCancel, bAllow
public ML_RunInTTAllowing(args)
{
	
	self IECALLBACK::RunEvent("ML_InTTAllowing", false, args);
}

/// bAllow, bIsSuccessful
public ML_RunOnTTAllowed(args)
{
	
	self IECALLBACK::RunEvent("ML_OnTTAllowed", true, args);
}

/// bCancel, bAllow
public ML_RunInAllowingTJs(args)
{
	
	self IECALLBACK::RunEvent("ML_InAllowingTJs", false, args);
}

/// bAllow, bIsSuccessful
public ML_RunOnAllowedTJs(args)
{
	
	self IECALLBACK::RunEvent("ML_OnAllowedTJs", true, args);
}

/// bCancel, bAllow
public ML_RunInTJAllowing(args)
{
	
	self IECALLBACK::RunEvent("ML_InTJAllowing", false, args);
}

/// bAllow, bIsSuccessful
public ML_RunOnTJAllowed(args)
{
	
	self IECALLBACK::RunEvent("ML_OnTJAllowed", true, args);
}

/// bCancel, bAllow
public ML_RunInEMAllowing(args)
{
	
	self IECALLBACK::RunEvent("ML_InEMAllowing", false, args);
}

/// bAllow, bIsSuccessful
public ML_RunOnEMAllowed(args)
{
	
	self IECALLBACK::RunEvent("ML_OnEMAllowed", true, args);
}

/// bCancel, TT, bIsTouchedAuto
public ML_RunInCTouchingTT(args)
{
	
	
	self IECALLBACK::RunEvent("ML_InCTouchingTT", false, args);
}

/// TT, bIsTouchedAuto
public ML_RunOnCTouchedTT(args)
{
	self thread custom\_diagnostics::ML_OnCTouchedTT(args);

	self thread custom\clients\_score::ML_OnCTouchedTT(args);
	self thread custom\clients\_statistic::ML_OnCTouchedTT(args);

	self thread inputs\challenges\process::ML_OnCTouchedTT(args);
	
	self IECALLBACK::RunEvent("ML_OnCTouchedTT", true, args);
}

/// bCancel, TJ, iPlace, bIsTouchedAuto
public ML_RunInCTouchingTJ(args)
{
	
	
	self IECALLBACK::RunEvent("ML_InCTouchingTJ", false, args);
}

/// TJ, iPlace, bIsTouchedAuto
public ML_RunOnCTouchedTJ(args)
{
	self thread custom\_diagnostics::ML_OnCTouchedTJ(args);

	self thread custom\clients\_score::ML_OnCTouchedTJ(args);
	self thread custom\clients\_statistic::ML_OnCTouchedTJ(args);
	
	self thread inputs\challenges\process::ML_OnCTouchedTJ(args);
	
	self IECALLBACK::RunEvent("ML_OnCTouchedTJ", true, args);
}

/// bCancel, EM, iPlace, bIsTouchedAuto
public ML_RunInCTouchingEM(args)
{
	
	
	self IECALLBACK::RunEvent("ML_InCTouchingEM", false, args);
}

/// EM, iPlace, bIsTouchedAuto
public ML_RunOnCTouchedEM(args)
{
	self thread custom\_diagnostics::ML_OnCTouchedEM(args);

	self thread custom\clients\_score::ML_OnCTouchedEM(args);
	self thread custom\clients\_statistic::ML_OnCTouchedEM(args);

	self thread inputs\summary\process::ML_OnCTouchedEM(args);
	self thread inputs\challenges\process::ML_OnCTouchedEM(args);
	
	self IECALLBACK::RunEvent("ML_OnCTouchedEM", true, args);
}

#endregion
// ===================================================================== //
#region Music

/// Music
public MUSIC_RunInSPickingVictory(args)
{
	custom\_mapper::MUSIC_InSPickingVictory(args);
	
	custom\_diagnostics::MUSIC_InSPickingVictory(args);
	
	IECALLBACK::RunEvent("MUSIC_InSPickingVictory", false, args);
}

/// Music
public MUSIC_RunInSPickingEOG(args)
{
	custom\_mapper::MUSIC_InSPickingEOG(args);
	
	custom\_diagnostics::MUSIC_InSPickingEOG(args);
	
	IECALLBACK::RunEvent("MUSIC_InSPickingEOG", false, args);
}

#endregion
// ===================================================================== //
#region MapInfo

/// 
public MI_RunInUpdatingFromMapper(args)
{
	custom\_diagnostics::MI_InUpdatingFromMapper(args);

	IECALLBACK::RunEvent("MI_InUpdatingFromMapper", false, args);
}

/// 
public MI_RunInUpdatingFromInputs(args)
{
	

	IECALLBACK::RunEvent("MI_InUpdatingFromInputs", false, args);
}

#endregion
// ===================================================================== //
#region MapPopularity

/// iStars
public MPOP_RunOnCRatedLeave(args)
{
	self thread custom\_diagnostics::MPOP_OnCRatedLeave(args);
	
	self IECALLBACK::RunEvent("MPOP_OnCRatedLeave", true, args);
}

/// iStars
public MPOP_RunOnCRatedVote(args)
{
	self thread custom\_diagnostics::MPOP_OnCRatedVote(args);
	
	self IECALLBACK::RunEvent("MPOP_OnCRatedVote", true, args);
}

#endregion
// ===================================================================== //
#region Menu

/// sMenuName, sResponse, ResponseArgs
public MENU_RunOnCOpened(args)
{
	self thread custom\clients\_afk::MENU_OnCOpened(args);
	self thread custom\clients\_cac::MENU_OnCOpened(args);
	self thread custom\clients\_challenges::MENU_OnCOpened(args);
	
	self IECALLBACK::RunEvent("MENU_OnCOpened", true, args);
}

/// sMenuName, sResponse, ResponseArgs
public MENU_RunOnCResponded(args)
{
	self thread custom\_mappopularity::MENU_OnCResponded(args);

	self thread custom\clients\_vg::MENU_OnCResponded(args);
	

	self thread custom\_votemap::MENU_OnCResponded(args);

	self thread custom\clients\_afk::MENU_OnCResponded(args);
	self thread custom\clients\_cac::MENU_OnCResponded(args);
	self thread custom\clients\_challenges::MENU_OnCResponded(args);
	self thread custom\clients\_quickmessage::MENU_OnCResponded(args);
	
	self IECALLBACK::RunEvent("MENU_OnCResponded", true, args);
}

#endregion
// ===================================================================== //
#region AFK

/// bCancel, [iSeconds]
public AFK_RunInCStuckWarning(args)
{

	self IECALLBACK::RunEvent("AFK_InCStuckWarning", false, args);
}

/// [iSeconds]
public AFK_RunOnCStuckWarned(args)
{

	self IECALLBACK::RunEvent("AFK_OnCStuckWarned", true, args);
}

/// bCancel, [iSeconds]
public AFK_RunInCStuckFinishing(args)
{

	self IECALLBACK::RunEvent("AFK_InCStuckFinishing", false, args);
}

/// [iSeconds]
public AFK_RunOnCStuckFinished(args)
{

	self IECALLBACK::RunEvent("AFK_OnCStuckFinished", true, args);
}

/// bCancel, [iSeconds]
public AFK_RunInCAFKWarning(args)
{

	self IECALLBACK::RunEvent("AFK_InCAFKWarning", false, args);
}

/// [iSeconds]
public AFK_RunOnCAFKWarned(args)
{

	self IECALLBACK::RunEvent("AFK_OnCAFKWarned", true, args);
}

/// bCancel, iAction, [iSeconds]
public AFK_RunInCAFKFinishing(args)
{

	self IECALLBACK::RunEvent("AFK_InCAFKFinishing", false, args);
}

/// iAction, [iSeconds]
public AFK_RunOnCAFKFinished(args)
{

	self IECALLBACK::RunEvent("AFK_OnCAFKFinished", true, args);
}

#endregion
// ===================================================================== //
#region BINDS

/// 
public BTN_RunOnCPressedAttack(args)
{
	self thread custom\clients\_player::BTN_OnCPressedAttack(args);
	
	self IECALLBACK::RunEvent("BTN_OnCPressedAttack", true, args);	
}

/// 
public BTN_RunOnCHeldAttack(args)
{

	self IECALLBACK::RunEvent("BTN_OnCHeldAttack", true, args);
}

/// 
public BTN_RunOnCPressedUse(args)
{

	self IECALLBACK::RunEvent("BTN_OnCPressedUse", true, args);	
}

/// 
public BTN_RunOnCHeldUse(args)
{

	self IECALLBACK::RunEvent("BTN_OnCHeldUse", true, args);
}

/// 
public BTN_RunOnCPressedMelee(args)
{	

	self IECALLBACK::RunEvent("BTN_OnCPressedMelee", true, args);	
}

/// 
public BTN_RunOnCHeldMelee(args)
{

	self IECALLBACK::RunEvent("BTN_OnCHeldMelee", true, args);
}

/// 
public BTN_RunOnCPressedFrag(args)
{
	
	self IECALLBACK::RunEvent("BTN_OnCPressedFrag", true, args);	
}

/// 
public BTN_RunOnCHeldFrag(args)
{

	self IECALLBACK::RunEvent("BTN_OnCHeldFrag", true, args);
}

/// 
public BTN_RunOnCPressedSecondaryFrag(args)
{
	self thread inputs\class\perks::BTN_OnCPressedSecondaryFrag(args);
	
	self IECALLBACK::RunEvent("BTN_OnCPressedSecondaryFrag", true, args);	
}

/// 
public BTN_RunOnCHeldSecondaryFrag(args)
{

	self IECALLBACK::RunEvent("BTN_OnCHeldSecondaryFrag", true, args);
}

#endregion
// ===================================================================== //
#region Weapon

/// sLastWeapon, sNewWeapon
public W_RunOnCChanged(args)
{

	self IECALLBACK::RunEvent("W_OnCChanged", true, args);
}

/// sWeapon
public W_RunOnCStartedReloading(args)
{
	self thread inputs\challenges\process::W_OnCStartedReloading(args);
	
	self IECALLBACK::RunEvent("W_OnCStartedReloading", true, args);
}

#endregion
// ===================================================================== //
#region Rank

/// bCancel, iLastScore, iValue, [sType]
public RANK_RunInCGivingScore(args)
{
	
	
	self IECALLBACK::RunEvent("RANK_InCGivingScore", false, args);
}

/// iLastScore, iValue, [sType]
public RANK_RunOnCGaveScore(args)
{
	self thread custom\clients\_rank::RANK_OnCGaveScore(args);
	
	// others...
	self thread custom\_diagnostics::RANK_OnCGaveScore(args);
	
	
	self IECALLBACK::RunEvent("RANK_OnCGaveScore", true, args);
}

/// bCancel, iLastRankXP, iValue, [sType]
public RANK_RunInCGivingRankXP(args)
{
	self custom\clients\_prestige::RANK_InCGivingRankXP(args);
	
	// others...
	
	self IECALLBACK::RunEvent("RANK_InCGivingRankXP", false, args);
}

/// iLastRankXP, iValue, [sType]
public RANK_RunOnCGaveRankXP(args)
{
	self thread custom\clients\_rank::RANK_OnCGaveRankXP(args);
	
	// others...
	
	self IECALLBACK::RunEvent("RANK_OnCGaveRankXP", true, args);
}

/// bCancel, iOldRankId, iNewRankId
public RANK_RunInCSettingRankId(args)
{
	self custom\clients\_prestige::RANK_InCSettingRankId(args);
	
	// others...
	
	self IECALLBACK::RunEvent("RANK_InCSettingRankId", false, args);
}

/// iOldRankId, iNewRankId
public RANK_RunOnCSetRankId(args)
{
	self thread custom\clients\_rank::RANK_OnCSetRankId(args);
	
	// others...
	self thread custom\clients\_unlocks::RANK_OnCSetRankId(args);
	
	self IECALLBACK::RunEvent("RANK_OnCSetRankId", true, args);
}

/// iRankXP, iRankId, iMinXP, iMaxXP, iLeftXP
public RANK_RunInCUpdatingRank(args)
{
	
	
	self IECALLBACK::RunEvent("RANK_InCUpdatingRank", false, args);
}

/// iRankXP, iRankId, iMinXP, iMaxXP, iLeftXP
public RANK_RunOnCUpdatedRank(args)
{
	
	
	self IECALLBACK::RunEvent("RANK_OnCUpdatedRank", true, args);
}

/// iOldPrestige, iNewPrestige
public RANK_RunOnCIncedPrestige(args)
{
	self thread custom\clients\_progress::RANK_OnCIncedPrestige(args);
	self thread custom\clients\_unlocks::RANK_OnCIncedPrestige(args);
	
	self IECALLBACK::RunEvent("RANK_OnCIncedPrestige", true, args);
}

#endregion
// ===================================================================== //
#region Challenges

/// sName, iType, iIndex, item, stageList, sStageListName
public CH_RunOnCProceeded(args)
{


	self IECALLBACK::RunEvent("CH_OnCProceeded", true, args);
}

/// sName, iType, iIndex, item, stageList, sStageListName, bIsStageListCompleted
public CH_RunOnCCompleted(args)
{
	self thread custom\clients\_prestige::CH_OnCCompleted(args);
	
	// others...
	self thread custom\clients\_unlocks::CH_OnCCompleted(args);
	
	self IECALLBACK::RunEvent("CH_OnCCompleted", true, args);
}

/// stageList
public CH_RunOnCRaisedStage(args)
{
	
	
	self IECALLBACK::RunEvent("CH_OnCRaisedStage", true, args);
}

#endregion
// ===================================================================== //
#region MapChallenges

/// item
public MCH_RunInSRegingItem(args)
{
	custom\_diagnostics::MCH_InSRegingItem(args);
	
	IECALLBACK::RunEvent("MCH_InSRegingItem", false, args);
}

/// stageList
public MCH_RunInSRegingStageList(args)
{
	custom\_diagnostics::MCH_InSRegingStageList(args);
	
	IECALLBACK::RunEvent("MCH_InSRegingStageList", false, args);
}

/// sName, [iInc]
public MCH_RunOnCProceeded(args)
{
	self thread custom\_diagnostics::MCH_OnCProceeded(args);
	
	self IECALLBACK::RunEvent("MCH_OnCProceeded", true, args);
}

/// sName, iIdent
public MCH_RunOnCCollected(args)
{
	self thread custom\_diagnostics::MCH_OnCCollected(args);
	
	self IECALLBACK::RunEvent("MCH_OnCCollected", true, args);
}

#endregion
// ===================================================================== //
#region Lifes

/// bCancel
public LIFE_RunInCGiving(args)
{
	
	self IECALLBACK::RunEvent("LIFE_InCGiving", false, args);
}

/// 
public LIFE_RunOnCGave(args)
{
	self thread inputs\challenges\process::LIFE_OnCGave(args);
	
	self IECALLBACK::RunEvent("LIFE_OnCGave", true, args);
}

/// bCancel
public LIFE_RunInCUsing(args)
{

	self IECALLBACK::RunEvent("LIFE_InCUsing", false, args);
}

/// 
public LIFE_RunOnCUsed(args)
{
	self thread inputs\challenges\process::LIFE_OnCUsed(args);
	
	self IECALLBACK::RunEvent("LIFE_OnCUsed", true, args);
}

#endregion
// ===================================================================== //
#region Spray

/// bCancel, sFX, vPos, vForward, vUp, vNormal, sSurfaceType
public SPRAY_RunInCSpraying(args)
{


	self IECALLBACK::RunEvent("SPRAY_InCSpraying", false, args);
}

/// sFX, vPos, vForward, vUp, vNormal, sSurfaceType
public SPRAY_RunOnCSprayed(args)
{
	self thread inputs\challenges\process::SPRAY_OnCSprayed(args);

	self IECALLBACK::RunEvent("SPRAY_OnCSprayed", true, args);
}

#endregion
// ===================================================================== //
#region Perks

/// 
public PERK_RunOnCActivatedFastRun(args)
{
	self thread inputs\challenges\process::PERK_OnCActivatedFastRun(args);
	
	self IECALLBACK::RunEvent("PERK_OnCActivatedFastRun", true, args);
}

/// 
public PERK_RunOnCActivatedRTD(args)
{
	self thread inputs\challenges\process::PERK_OnCActivatedRTD(args);
	
	self IECALLBACK::RunEvent("PERK_OnCActivatedRTD", true, args);
}

/// 
public PERK_RunOnCActivatedBunnyHop(args)
{
	self thread inputs\challenges\process::PERK_OnCActivatedBunnyHop(args);
	
	self IECALLBACK::RunEvent("PERK_OnCActivatedBunnyHop", true, args);
}

/// 
public PERK_RunOnCActivatedBackStep(args)
{
	self thread inputs\challenges\process::PERK_OnCActivatedBackStep(args);
	
	self IECALLBACK::RunEvent("PERK_OnCActivatedBackStep", true, args);
}

/// 
public PERK_RunOnCActivatedEnemyHP(args)
{
	self thread inputs\challenges\process::PERK_OnCActivatedEnemyHP(args);
	
	self IECALLBACK::RunEvent("PERK_OnCActivatedEnemyHP", true, args);
}

#endregion
// ===================================================================== //
// ===================================================================== //

private CheckGameType()
{
	wait 0.5;
	
	//gametype error
	if (level.gametype != "deathrun" && level.gametype != "war")
	{
		SetDvar("sv_mapRotationCurrent", "gametype deathrun map " + level.script); 
		ExitLevel(false);
	}
	
	//wait 20;
	//C_IROTATEMAP::DBGRotateAllMapsNow();
}