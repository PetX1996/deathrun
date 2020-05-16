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

public sealed LWaitingForMorePlayers = "Waiting for more players";

public sealed LDisabled = "LOGIC DISABLED";
public sealed LTrainingRound = "TRAINING ROUND";
public sealed LFreeRun = "FREE RUN";
public sealed LOneTeam = "ONE TEAM";

public sealed LTimePrematch = "Preparing";
public sealed LTimeJumpers = "Releasing";
public sealed LTimeActivators = "Releasing";

public sealed LDisableTrapsHintPre = "Press ^3"; // +frag
public sealed LDisableTrapsHintPost = "^7 to disable traps";
public sealed LDisableTraps = "^2FREE RUN";


public sealed VICPlayerKillActiv = /* player name */ "^7 killed last activator";
public sealed VICPlayerKillJumper = /* player name */ "^7 killed last jumper";

public sealed VICNoActivs = "No more activators left";
public sealed VICNoJumpers = "Every jumper has died";
public sealed VICNoTime = "Time has been reached";
public sealed VICForced = "Admin has forced the round to the end";

// ================================================================================================== //
#region AFK

public sealed AFKWarn = "AFK Warning! Wake up!";
public sealed StuckWarn = "Stuck Warning! Move!";

public sealed AFKKill = "You were killed for inactivity";
public sealed AFKKillAll = "Player &&1^7 was killed for inactivity"; // sVictimName

public sealed AFKSpect = "You were moved to spectator for inactivity";
public sealed AFKSpectAll = "Player &&1^7 was moved to spectator for inactivity"; // sVictimName

public sealed AFKPick = "You were picked as activator because AFK";
public sealed AFKPickAll = "Picked new activator because AFK";

public sealed StuckKill = "You were killed for stuck";
public sealed StuckKillAll = "Player &&1^7 was killed for stuck"; // sVictimName

#endregion
// ================================================================================================== //

public sealed BHLagJumpDie = "^3Lagjump? ^1DIE!";

public sealed CLASSItemLocked = "^1Locked by server admin.";
public sealed CLASSItemLockedLvl = "LVL: " /* lvl */;

public sealed CHALLENGEItemLockedTitle = "^1LOCKED";
public sealed CHALLENGEItemLocked = "^1Locked by server admin.";

public sealed TEAMJumpersName = "^2Jumpers^7";
public sealed TEAMActivatorsName = "^1Activator^7";

public sealed LIFESRespawnHintPre = "Press ^3"; // +activate
public sealed LIFESRespawnHintPost = "^7 use your life";

public sealed MLFinished = "You have finished as &&1"; // iPlace;
public sealed MLFinishedAll = "&&2^7 has finished as &&1"; // iPlace, sWinnerName;