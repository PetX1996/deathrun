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

/*
STATS
	101 - STATS VERSION
	104 - 115 - classes
	2300 - 2400 - statistics
	2400 - 3000 - challenges
	3082 - 3498 - challenges
*/

private StatVersionStat = 101;
/// have to be higher than 1! ...and lower than 256!
private StatVersionVersion = 10;
/// default value after reset...
/// do not modify!!!
private StatVersionDefault = 1;

InSPreCaching(args)
{
	precacheString(&"RANK_PLAYER_WAS_PROMOTED");
	precacheString(&"RANK_PLAYER_WAS_DEMOTED");
	precacheString(&"MP_PLUS");
	
	// ============================================== //

	rankId = 0;
	for (rankId = 0; rankId <= C_ICRANK::MaxRankId; rankId++)
	{
		rankIcon = TableLookup("mp/rankicontable.csv", 0, rankId, 1);
		
		if (rankIcon == "")
			break;
		
		PreCacheShader(rankIcon);
		PreCacheString(TableLookupIString("mp/rankicontable.csv", 0, rankId, 2));
	}
}

// ============================================================================================= //
#region Connecting

InCPreConnecting(args)
{
	self endon("disconnect");

	C_IDEBUG::Debug("StatVersionStat;" + self ICSTAT::GetById(StatVersionStat) + ";" + StatVersionVersion);
	C_IDEBUG::Debug("CHCUR;" + self ICSTAT::GetByName("CHCUR"));
	C_IDEBUG::Debug("CHMAX;" + self ICSTAT::GetByName("CHMAX"));
	C_IDEBUG::Debug("RANKXP_HASH;" + self ICSTAT::GetByName("RANKXP_HASH"));
	C_IDEBUG::Debug("RANK_HASH;" + self ICSTAT::GetByName("RANK_HASH"));
	C_IDEBUG::Debug("RANKXP;" + self ICSTAT::GetByName("RANKXP"));
	C_IDEBUG::Debug("RANK;" + self ICSTAT::GetByName("RANK"));
	C_IDEBUG::Debug("PLEVEL;" + self ICSTAT::GetByName("PLEVEL"));
	C_IDEBUG::Debug("LEFTXP;" + self ICSTAT::GetByName("LEFTXP"));
	C_IDEBUG::Debug("MINXP;" + self ICSTAT::GetByName("MINXP"));
	C_IDEBUG::Debug("MAXXP;" + self ICSTAT::GetByName("MAXXP"));
	
	self.pers["rankxp"] = self ICSTAT::GetByName("rankxp");
	iRankId = C_ICRANK::GetRankIdForXP(self.pers["rankxp"]);
	
	statVer = self GetStat(StatVersionStat);
	if ((statVer != StatVersionVersion && statVer != StatVersionDefault)
		|| !self CIsRankHashesValid(iRankId))
	{
		/*for (i = 0; i < 10; i++)
		{
			self C_IDEBUG::Debug("Your stats has been reseted", C_IDEBUG::TYPE_INFO);
			wait 0.5;
		}*/
		
		self C_ICCMD::ResetStats();
		return;
	}
	else if (statVer == StatVersionDefault)
	{
		self C_IDEBUG::Debug("Preparing stats", C_IDEBUG::TYPE_INFO);
		self SetStat(StatVersionStat, StatVersionVersion);
	}
	
	self CCreateScoreFeedbackHud();
	self C_ICRANK::CUpdateRank(iRankId);
	
	//self maps\mp\gametypes\_persistence::playerPersSupport();
	//self thread SendPlayerScoreInfo();
}

private CIsRankHashesValid(rankId)
{
	rankXpHash = self ICSTAT::GetByName("rankxp_hash");
	
	oldRankId = self ICSTAT::GetByName("rank");
	rankIdHash = self ICSTAT::GetByName("rank_hash");
	
	if (oldRankId != rankId
		|| (self.pers["rankxp"] << 16) != rankXpHash
		|| (rankId << 16) != rankIdHash)
	{
		self C_IDEBUG::Debug("Rank has been manually modified");
		return false;
	}
	
	return true;
}

#endregion
// ============================================================================================= //

RANK_OnCGaveScore(args)
{
	self ICPERS::IncPersStat("score", args.iValue);
	self notify ("update_playerscore_hud");
	
	self thread CUpdateScoreFeedbackHud(args.iValue);
}

RANK_OnCGaveRankXP(args)
{
	self C_ICRANK::CIncRankXP(args.iValue);
}

RANK_OnCSetRankId(args)
{
	if (args.iNewRankId > args.iOldRankId)
		self thread UpdateRankAnnounceHUD(1);
	else
		self thread UpdateRankAnnounceHUD(-1);
}

// ======================================================================== //
#region Feedbacks

private CCreateScoreFeedbackHud()
{
	self.HUD_ScoreFeedbackUpdate = NewClientHudElem(self);
	self.HUD_ScoreFeedbackUpdate.horzAlign = "center";
	self.HUD_ScoreFeedbackUpdate.vertAlign = "middle";
	self.HUD_ScoreFeedbackUpdate.alignX = "center";
	self.HUD_ScoreFeedbackUpdate.alignY = "middle";
	self.HUD_ScoreFeedbackUpdate.x = 0;
	self.HUD_ScoreFeedbackUpdate.y = -50;
	self.HUD_ScoreFeedbackUpdate.font = "default";
	self.HUD_ScoreFeedbackUpdate.fontscale = 2.0;
	self.HUD_ScoreFeedbackUpdate.archived = false;
	self.HUD_ScoreFeedbackUpdate.color = (0.5,0.5,0.5);
	self.HUD_ScoreFeedbackUpdate maps\mp\gametypes\_hud::FontPulseInit();
	self.HUD_ScoreFeedbackUpdate.iTotalAmount = 0;
}

private CUpdateScoreFeedbackHud(iAmount)
{
	self endon("disconnect");

	self notify("update_score");
	self endon("update_score");

	self.HUD_ScoreFeedbackUpdate.iTotalAmount += iAmount;

	wait ( 0.05 );

	if (self.HUD_ScoreFeedbackUpdate.iTotalAmount < 0)
	{
		self.HUD_ScoreFeedbackUpdate.Label = &"";
		self.HUD_ScoreFeedbackUpdate.Color = (1,0,0);
	}
	else
	{
		self.HUD_ScoreFeedbackUpdate.Label = &"MP_PLUS";
		self.HUD_ScoreFeedbackUpdate.Color = (1,1,0.5);
	}

	self.HUD_ScoreFeedbackUpdate SetValue(self.HUD_ScoreFeedbackUpdate.iTotalAmount);
	self.HUD_ScoreFeedbackUpdate.Alpha = 0.85;
	self.HUD_ScoreFeedbackUpdate thread maps\mp\gametypes\_hud::FontPulse(self);

	wait 1;
	self.HUD_ScoreFeedbackUpdate FadeOverTime(0.75);
	self.HUD_ScoreFeedbackUpdate.Alpha = 0;
	
	self.HUD_ScoreFeedbackUpdate.iTotalAmount = 0;
}

public UpdateRankAnnounceHUD(type)
{
	self notify("reset_outcome");
	
	sName = C_ICRANK::GetRankIdName(self.pers["rank"]);
	sImage = C_ICRANK::GetRankIdImage(self.pers["rank"]);
	
	if (type == 1)
	{
		self C_ICMSG::CNotify("LEVEL UP", "You have just promoted to lvl " + sName, sImage);
		self C_ICMSG::SPrintLn(self.name + " ^7has just promoted to lvl " + sName);
	}
	else
	{
		self C_ICMSG::CNotify("LEVEL DOWN", "You have just demoted to lvl " + sName, sImage);
		self C_ICMSG::SPrintLn(self.name + " ^7has just demoted to lvl " + sName);
	}
}

#endregion
// ======================================================================== //
