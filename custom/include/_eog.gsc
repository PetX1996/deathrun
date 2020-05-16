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

public EOG(sMusicFullName)
{
	if (C_ISVAR::GetAsInt("GLEOGTime") == 0)
		return;
		
	PrepareEOG(sMusicFullName);
	
	wait C_ISVAR::GetAsInt("GLEOGTime");
}

private PrepareEOG(sMusicFullName)
{
	foreach (player in level.players)
		player thread PlayerShowMenu(sMusicFullName);
}

private PlayerShowMenu(sMusicFullName)
{
	self endon("disconnect");

	dvarDic = IDIC::Create();
	self PlayerBuildDvarList(dvarDic, sMusicFullName);
	
	self C_ICCMD::SendDvars(dvarDic IDIC::ToDicArray());
	self OpenMenu(C_ICMENU::GetMenu("endofgame"));
}

private PlayerBuildDvarList(dvarDic, sMusicFullName)
{
	self PlayerBuildRecordDvarList(dvarDic, "B", C_ISUMMARY::TYPE_Best);
	self PlayerBuildRecordDvarList(dvarDic, "W", C_ISUMMARY::TYPE_Worst);
	
	dvarDic IDIC::Add("ui_eogS", sMusicFullName);
	dvarDic IDIC::Add("ui_eogTime", C_ISVAR::GetAsInt("GLEOGTime"));
}

private LinesInStatsTable = 13;
private PlayerBuildRecordDvarList(dvarDic, sInfix, iType)
{
	line = 0;
	iCount = C_ISUMMARY::GetItemsCount(iType);
	IEXCEPTION::OutOfRange((LinesInStatsTable + 1), iCount, "Summary count is not valid, valid values are from 0 to " + LinesInStatsTable + " iType " + iType);
	
// "ui_eogBR" + i + "N" // name of best record
// "ui_eogBR" + i + "V" // value of best record
// "ui_eogBR" + i + "P" // player with better result
// "ui_eogBR" + i + "R" // value of better result

// "ui_eogWR" + i + "N" // name of worst record
// "ui_eogWR" + i + "V" // value of worst record
// "ui_eogWR" + i + "P" // player with better result
// "ui_eogWR" + i + "R" // value of better result
	
	for (i = 0; i < iCount; i++)
	{
		sRecordName = C_ISUMMARY::GetItemName(iType, i);
		IEXCEPTION::Undefined(sRecordName, "Could not find summary record iType " + iType + " iIndex " + i);
		
		sBestName = C_ISUMMARY::GetMapRecordPlayerName(sRecordName);
		if (IsDefined(sBestName))
		{
			record = C_ISUMMARY::GetItemByName(sRecordName);
			sBestValue = C_ISUMMARY::GetMapRecordValue(sRecordName);
			sMyValue = self C_ISUMMARY::GetPlayerRecord(sRecordName);
			
			if (IsDefined(sMyValue))
				sMyValue = [[record.dToString]](Int(sMyValue));
			else
				sMyValue = "N/A";
				
			sBestValue = [[record.dToString]](Int(sBestValue));
			
			if (sBestName == self.Name)
				sBestName = "^1" + sBestName;
			
			dvarDic IDIC::Add("ui_eog" + sInfix + "R" + line + "N", record.sName);
			dvarDic IDIC::Add("ui_eog" + sInfix + "R" + line + "V", sMyValue);
			dvarDic IDIC::Add("ui_eog" + sInfix + "R" + line + "P", sBestName);
			dvarDic IDIC::Add("ui_eog" + sInfix + "R" + line + "R", sBestValue);
			line++;
		}
	}
	
	for (i = line; i < LinesInStatsTable; i++)
	{
		dvarDic IDIC::Add("ui_eog" + sInfix + "R" + i + "N", "");
		dvarDic IDIC::Add("ui_eog" + sInfix + "R" + i + "V", "");
		dvarDic IDIC::Add("ui_eog" + sInfix + "R" + i + "P", "");
		dvarDic IDIC::Add("ui_eog" + sInfix + "R" + i + "R", "");
	}
}