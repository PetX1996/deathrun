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
	PreCacheForTeam(C_ICCLASS::TEAM_Allies);
	PreCacheForTeam(C_ICCLASS::TEAM_Axis);
}

private PreCacheForTeam(iTeam)
{
	for (t = 0; t < C_ICCLASS::TYPE_SIZE; t++)
		PreCacheForType(iTeam, t);
}

private PreCacheForType(iTeam, iType)
{
	count = C_ICCLASS::GetItemsCount(iTeam, iType);
	for (i = 0; i < count; i++)
		C_ICCLASS::ItemInSVPreCache(iTeam, iType, i);
}

InCPreConnecting(args)
{
	self UpdateCStatsForTeam(args, C_ICCLASS::TEAM_Allies);
	self UpdateCStatsForTeam(args, C_ICCLASS::TEAM_Axis);
}

private UpdateCStatsForTeam(args, iTeam)
{
	for (t = 0; t < C_ICCLASS::TYPE_SIZE; t++)
		self UpdateCStatsForType(args, iTeam, t);
}

private UpdateCStatsForType(args, iTeam, iType)
{
	sIcon = "";
	
	if (C_ICCLASS::IsTypeEnabled(iTeam, iType))
	{
		iIndex = self C_ICCLASS::GetPlayerStat(iTeam, iType);
		item = C_ICCLASS::GetItemByIndex(iTeam, iType, iIndex);
		if (!IsDefined(item) || !item C_ICCLASS::Item_IsAvailable(self))
		{
			iIndex = 0;
			self C_IDEBUG::Debug("Reseting class stat, team;" + iTeam + ";type;" + iType, 
				C_IDEBUG::TYPE_WARNING);
			self C_ICCLASS::SetPlayerStat(iTeam, iType, iIndex);
			
			item = C_ICCLASS::GetItemByIndex(iTeam, iType, iIndex);
			IEXCEPTION::Undefined(item, "Error in class inputs iTeam;" + iTeam + ";iType;" + iType + ";iIndex" + iIndex);
		}
		
		sIcon = item.sMenuIcon;
	}
	
	args.DvarDic IDIC::Add("ui_teamC" + iTeam + "T" + iType, sIcon);
}

InCPreSpawning(args)
{
	iTeam = C_ICCLASS::GetITeam(self.pers["team"]);
	for (iType = 0; iType < C_ICCLASS::TYPE_SIZE; iType++)
	{
		if (C_ICCLASS::IsTypeEnabled(iTeam, iType))
		{
			iIndex = self C_ICCLASS::GetPlayerStat(iTeam, iType);
			self C_ICCLASS::ItemInCPreSpawning(iTeam, iType, iIndex, args);
		}
	}
}

InCFinalSpawning(args)
{
	iTeam = C_ICCLASS::GetITeam(self.pers["team"]);
	for (iType = 0; iType < C_ICCLASS::TYPE_SIZE; iType++)
	{
		if (C_ICCLASS::IsTypeEnabled(iTeam, iType))
		{
			//iIndex = self C_ICCLASS::GetPlayerStat(iTeam, iType);
			iItemTeam = self C_ICCLASS::CSIGetTeam(iType);
			iItemIndex = self C_ICCLASS::CSIGetIndex(iType);
			item = C_ICCLASS::GetItemByIndex(iItemTeam, iType, iItemIndex);
			
			switch (iType)
			{
				case C_ICCLASS::TYPE_Body:
					args.DvarDic IDIC::Add("ui_hudSIBody", item.sMenuIcon);
					break;
				case C_ICCLASS::TYPE_InvA:
					args.DvarDic IDIC::Add("ui_hudSIInvA", item.sMenuIcon);
					break;	
				case C_ICCLASS::TYPE_InvB:
					args.DvarDic IDIC::Add("ui_hudSIInvB", item.sMenuIcon);
					break;	
				case C_ICCLASS::TYPE_InvC:
					args.DvarDic IDIC::Add("ui_hudSIInvC", item.sMenuIcon);
					break;	
				case C_ICCLASS::TYPE_InvD:
					args.DvarDic IDIC::Add("ui_hudSIInvD", item.sMenuIcon);
					break;
				default:
					break;
			}
		}
	}
}

OnCSpawned(args)
{
	iTeam = C_ICCLASS::GetITeam(self.pers["team"]);
	for (iType = 0; iType < C_ICCLASS::TYPE_SIZE; iType++)
	{
		if (C_ICCLASS::IsTypeEnabled(iTeam, iType))
		{
			iIndex = C_ICCLASS::GetPlayerStat(iTeam, iType);
			self C_ICCLASS::ItemOnCSpawned(iTeam, iType, iIndex, args);
		}
	}	
}