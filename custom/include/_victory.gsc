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

public Victory(iTime, sMsg, [sWinningTeam])
{
	PrepareVictory(iTime, sMsg, sWinningTeam);
	
	wait C_ISVAR::GetAsInt("GLVicTime");
}

private PrepareVictory(iTime, sMsg, [sWinningTeam])
{
	sMusicFullName = "";
	if (C_ISVAR::GetAsBool("GLMusicEnabled"))
	{
		music = C_IMUSIC::PickVictoryMusic();
		if (IsDefined(music))
		{
			music C_IMUSIC::Music_Play();
			sMusicFullName = music.sName;
		}
	}

	foreach (pPlayer in level.players)
		pPlayer thread CShowMenu(iTime, sMsg, sMusicFullName, sWinningTeam);
}

private CShowMenu(iTime, sReason, sMusicFullName, [sWinningTeam])
{
	self endon("disconnect");

	//sMenuName = self GetMenuName(sWinningTeam);
	
	dvarDic = IDIC::Create();
	self CBuildDvarList(dvarDic, iTime, sReason, sMusicFullName);
	
	self C_ICCMD::SendDvars(dvarDic IDIC::ToDicArray());
	
	self SetClientDvar("ui_vicVis", true);
	self CRunProgressBarHud(C_ISVAR::GetAsInt("GLVicTime"));
	
	//self OpenMenu(sMenuName);
	//self IPrintLnBold(sReason);
}

private BarColor = (0.5, 0.5, 0.5);
private BarAlpha = 0.75;

private ProgressBarColor = (1, 0, 0);
private ProgressBarAlpha = 0.3;

private CRunProgressBarHud(iTime)
{
	self.HUD_VictoryBar = NewClientHudElem(self);
	self.HUD_VictoryBar.alignX = "left";
	self.HUD_VictoryBar.alignY = "top";
	self.HUD_VictoryBar.horzAlign = "subleft";
	self.HUD_VictoryBar.vertAlign = "subtop";
	self.HUD_VictoryBar.x = 15;
	self.HUD_VictoryBar.y = 70;
	self.HUD_VictoryBar.sort = -2;
	self.HUD_VictoryBar.color = BarColor;
	self.HUD_VictoryBar.alpha = BarAlpha;
	//self.HUD_VictoryBar.foreground = true;
	self.HUD_VictoryBar.hidewheninmenu = true;
	self.HUD_VictoryBar SetShader("white", 610, 20);

	self.HUD_VictoryProgressBar = NewClientHudElem(self);
	self.HUD_VictoryProgressBar.alignX = "left";
	self.HUD_VictoryProgressBar.alignY = "top";
	self.HUD_VictoryProgressBar.horzAlign = "subleft";
	self.HUD_VictoryProgressBar.vertAlign = "subtop";
	self.HUD_VictoryProgressBar.x = 15;
	self.HUD_VictoryProgressBar.y = 70;
	self.HUD_VictoryProgressBar.sort = -1;
	self.HUD_VictoryProgressBar.color = ProgressBarColor;
	self.HUD_VictoryProgressBar.alpha = ProgressBarAlpha;
	//self.HUD_VictoryProgressBar.foreground = true;
	self.HUD_VictoryProgressBar.hidewheninmenu = true;
	//self.HUD_VictoryProgressBar SetShader("white", 610, 20);
	
	//self.HUD_VictoryProgressBar.x = (-0.5) * iSize;
	self.HUD_VictoryProgressBar SetShader("white", 610, 20);
	self.HUD_VictoryProgressBar ScaleOverTime(iTime, 0, 20);
}

/*private GetMenuName(sWinningTeam)
{
	sMenuName = C_ICMENU::GetMenu("victory_none");
	if (IsDefined(sWinningTeam) && self.pers["team"] != "spectator")
	{
		if (sWinningTeam == self.pers["team"])
			sMenuName = C_ICMENU::GetMenu("victory_marines");
		else
			sMenuName = C_ICMENU::GetMenu("victory_opfor");
	}
	
	return sMenuName;
}*/

private CBuildDvarList(dvarDic, iTime, sReason, sMusicFullName)
{
	dvarDic IDIC::Add("ui_vicS", sMusicFullName);
	dvarDic IDIC::Add("ui_vicM", sReason);
	//dvarDic IDIC::Add("ui_vicTime", C_ISVAR::GetAsInt("GLVicTime"));
	dvarDic IDIC::Add("ui_vicD", iTime);
	dvarDic IDIC::Add("ui_vicRC", C_IGLROUNDS::Get());
	dvarDic IDIC::Add("ui_vicRM", C_IGLROUNDS::GetLimit());

	dvarDic IDIC::Add("cg_hudChatPosition", "5 70");
	
	//self PlayerBuildRecordDvarList(dvarDic, "B", C_ISUMMARY::TYPE_Best);
	//self PlayerBuildRecordDvarList(dvarDic, "W", C_ISUMMARY::TYPE_Worst);
	self CBuildProgressDvarList(dvarDic);
}

private ChallengesProgressLines = 9;

CBuildProgressDvarList(dvarDic)
{
	iLastXP = self C_ICPROGRESS::CGetSavedLastXP();
	iMaxXP = self C_ICPRESTIGE::CGetMaxRankXPForPrestige();
	iCurXP = self C_ICRANK::CGetRankXP();
	dvarDic IDIC::Add("ui_vicXPL", iLastXP);
	dvarDic IDIC::Add("ui_vicXPI", self C_ICRANK::CGetRankXP() - iLastXP);

	if (self C_ICRANK::CGetRankId() == C_ICRANK::MaxRankId)
	{
		dvarDic IDIC::Add("ui_vicXPM", "oo");
		dvarDic IDIC::Add("ui_vicXPE", "");
	}
	else
	{
		dvarDic IDIC::Add("ui_vicXPM", iMaxXP);
		dvarDic IDIC::Add("ui_vicXPE", iMaxXP - iCurXP);
	}	
	
	iLine = 0;
	iPrestige = self C_ICPRESTIGE::CGetPrestige();
	if (iPrestige < 10)
	{
		iLine = self CBuildChallengesDvarList(dvarDic, iPrestige, iLine, false);
	}
	else if (iPrestige == 10)
	{
		iLine = self CBuildChallengesDvarList(dvarDic, C_ICCHALLENGES::STATS_Jumper, iLine, true);
		iLine = self CBuildChallengesDvarList(dvarDic, C_ICCHALLENGES::STATS_Activator, iLine, true);
	}
	else
	{
		iLine = self CBuildChallengesDvarList(dvarDic, C_ICCHALLENGES::STATS_Bonus, iLine, true);
		iLine = self CBuildChallengesDvarList(dvarDic, C_ICCHALLENGES::STATS_Map, iLine, false);	
	}
	
	dvarDic IDIC::Add("ui_vicCHC", iLine);
}

private CBuildChallengesDvarList(dvarDic, iType, iLine, bIgnoreCompleted)
{
	if (iLine >= ChallengesProgressLines)
		return iLine;
	
	iLastValues = self C_ICPROGRESS::CGetSavedChallenges(iType);
	iCount = C_ICCHALLENGES::GetItemsCount(iType);
	for (iIndex = 0; iIndex < iCount; iIndex++)
	{
		item = self C_ICCHALLENGES::CGetItemByIndex(iType, iIndex);
		iCurValue = item C_ICCHALLENGES::Item_GetProceeding(self);
		iMaxValue = item.iMaxValue;
	
		if (bIgnoreCompleted && iCurValue >= iMaxValue)
			continue;
	
		iLastValue = iLastValues[iIndex];
	
		dvarDic IDIC::Add("ui_vicCH" + iLine + "T", item.sMenuName);
		dvarDic IDIC::Add("ui_vicCH" + iLine + "D", item.sMenuDescription);
		dvarDic IDIC::Add("ui_vicCH" + iLine + "L", item C_ICCHALLENGES::Item_ValueToString(iLastValue));
		dvarDic IDIC::Add("ui_vicCH" + iLine + "I", item C_ICCHALLENGES::Item_ValueToString(iCurValue - iLastValue));
		dvarDic IDIC::Add("ui_vicCH" + iLine + "M", item C_ICCHALLENGES::Item_ValueToString(iMaxValue));
		iLine++;
	
		if (iLine >= ChallengesProgressLines)
			return iLine;
	}
	
	return iLine;
}

/*private LinesInStatsTable = 13;
private PlayerBuildRecordDvarList(dvarDic, sInfix, iType)
{
	line = 0;
	iCount = C_ISUMMARY::GetItemsCount(iType);
	IEXCEPTION::OutOfRange((LinesInStatsTable + 1), iCount, "Summary count is not valid, valid values are from 0 to " + LinesInStatsTable + " iType " + iType);
	
	for (i = 0; i < iCount; i++)
	{
		recordName = C_ISUMMARY::GetItemName(iType, i);
		IEXCEPTION::Undefined(recordName, "Could not find summary record iType " + iType + " iIndex " + i);
		
		playerName = C_ISUMMARY::GetRoundRecordPlayerName(recordName);
		if (IsDefined(playerName))
		{
			record = C_ISUMMARY::GetItemByName(recordName);

			if (playerName == self.Name)
				playerName = "^1" + playerName;

			dvarDic IDIC::Add("ui_vic" + sInfix + "R" + line + "N", record.sName);
			dvarDic IDIC::Add("ui_vic" + sInfix + "R" + line + "V", playerName);
			line++;
		}
	}
	
	for (i = line; i < LinesInStatsTable; i++)
	{
		dvarDic IDIC::Add("ui_vic" + sInfix + "R" + i + "N", "");
		dvarDic IDIC::Add("ui_vic" + sInfix + "R" + i + "V", "");
	}
}*/