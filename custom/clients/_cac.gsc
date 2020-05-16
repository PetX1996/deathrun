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

private ItemsPerPage = 12;

MENU_OnCOpened(args)
{
	if (args.sMenuName != C_ICMENU::GetMenu("class_allies")
		&& args.sMenuName != C_ICMENU::GetMenu("class_axis"))
		return;
	
	args.OpenedMenu.ICurTeam = C_ICCLASS::TEAM_Allies;
	if (args.sMenuName == C_ICMENU::GetMenu("class_axis"))
		args.OpenedMenu.ICurTeam = C_ICCLASS::TEAM_Axis;
	
	args.OpenedMenu.ICurType = Int(args.ResponseArgs[1]);
	args.OpenedMenu.ICurPage = 0;
	self UpdateMenuContent(args.OpenedMenu);
}

MENU_OnCResponded(args)
{
	if (args.sMenuName != C_ICMENU::GetMenu("class_allies")
		&& args.sMenuName != C_ICMENU::GetMenu("class_axis"))
		return;

	openedMenu = self C_ICMENU::GetOpenedMenu();
	if (IsDefined(openedMenu.IsWorking))
		return;
	
	if (args.sResponse == "classPrev")
		self GoToFollowingPage(openedMenu, -1);
	else if (args.sResponse == "classNext")
		self GoToFollowingPage(openedMenu, 1);
	else if (args.sResponse == "classItem")
		self SelectItem(openedMenu, Int(args.ResponseArgs[1]));
	else
		IEXCEPTION::ArgumentMsg("Unknown class notify '" + args.sResponse + "'");
}

private GoToFollowingPage(openedMenu, dir)
{
	totalItemsCount = C_ICCLASS::GetItemsCount(openedMenu.ICurTeam, openedMenu.ICurType);
	if (dir == -1 && openedMenu.ICurPage > 0)
	{
		openedMenu.ICurPage--;
		self UpdateMenuContent(openedMenu);
	}
	else if (dir == 1 && totalItemsCount > ((openedMenu.ICurPage + 1) * ItemsPerPage))
	{
		openedMenu.ICurPage++;
		self UpdateMenuContent(openedMenu);
	}
	else
		self C_IDEBUG::Debug("This button should not be here.");
}

private UpdateMenuContent(openedMenu)
{
	openedMenu.IsWorking = true;

	dvarDic = IDIC::Create();
	
	totalItemsCount = C_ICCLASS::GetItemsCount(openedMenu.ICurTeam, openedMenu.ICurType);
	localItemsCount = Min(totalItemsCount - (openedMenu.ICurPage * ItemsPerPage), ItemsPerPage);
	
	dvarDic IDIC::Add("ui_classIsPrev", openedMenu.ICurPage > 0);
	dvarDic IDIC::Add("ui_classIsNext", totalItemsCount > ((openedMenu.ICurPage + 1) * ItemsPerPage));
	
	for (i = 0; i < localItemsCount; i++)
	{
		item = C_ICCLASS::GetItemByIndex(openedMenu.ICurTeam, openedMenu.ICurType, (openedMenu.ICurPage * ItemsPerPage) + i);
		IEXCEPTION::Undefined(item, "Could not find item team;" + openedMenu.ICurTeam + ";type;" + openedMenu.ICurType 
			+ ";index;" + (openedMenu.ICurPage * ItemsPerPage) + i);
		self GetDvarListForItem(dvarDic, i, item);
	}
	
	self C_ICCMD::SendDvars(dvarDic IDIC::ToDicArray());
	
	self SetClientDvar("ui_classCount", localItemsCount);
	openedMenu.IsWorking = undefined;
}

private SelectItem(openedMenu, itemLocalI)
{
	iIndex = (openedMenu.ICurPage * ItemsPerPage) + itemLocalI;
	item = self C_ICCLASS::GetItemByIndex(openedMenu.ICurTeam, openedMenu.ICurType, iIndex);
	
	// probably client modified cvar...
	if (!IsDefined(item))
		self C_IDEBUG::Debug("This button should not be here!", C_IDEBUG::TYPE_ERROR);
		
	//IEXCEPTION::Undefined(item, "Could not find item, team;" + openedMenu.ICurTeam + ";type;" + openedMenu.ICurType + ";index;" + iIndex);

	if (item C_ICCLASS::Item_IsAvailable(self))
	{
		//self C_IDEBUG::Debug("Selecting item " + itemLocalI);
		self C_ICCLASS::SetPlayerStat(openedMenu.ICurTeam, openedMenu.ICurType, iIndex);
		self C_ICCLASS::UpdateClassType(openedMenu.ICurTeam, openedMenu.ICurType, iIndex);
	}
}

private GetDvarListForItem(dvarDic, itemLocalI, item)
{
	dvarDic IDIC::Add("ui_classItem" + itemLocalI + "M", "");
	dvarDic IDIC::Add("ui_classItem" + itemLocalI + "D", "");
	dvarDic IDIC::Add("ui_classItem" + itemLocalI + "T0", "");
	dvarDic IDIC::Add("ui_classItem" + itemLocalI + "T1", "");
	dvarDic IDIC::Add("ui_classItem" + itemLocalI + "T2", "");
	
	if (item C_ICCLASS::Item_IsAvailable(self))
	{
		dvarDic IDIC::Add("ui_classItem" + itemLocalI + "M", item.sMenuIcon);
		
		if (item.sMenuName != "")
		{
			if (item.sMenuDescription != "")
				dvarDic IDIC::Add("ui_classItem" + itemLocalI + "D", item.sMenuName + " - " + item.sMenuDescription);
			else
				dvarDic IDIC::Add("ui_classItem" + itemLocalI + "D", item.sMenuName);
		}
	}
	else
	{
		if (IsDefined(item.bIsFree)) // -> LOCKED, otherwise is available...
			dvarDic IDIC::Add("ui_classItem" + itemLocalI + "T2", C_ILOCALIZE::CLASSItemLocked);
		else // check other conditions...
		{
			accessInfo = item C_ICITEM::Item_GetAccessInfo(C_ICACCESS::FLAG_DONATOR);
			curLineI = 0;
			if (IsDefined(item.iAccessFlag))
			{
				sText = C_ICACCESS::GetFullName(item.iAccessFlag);
			
				if (IsDefined(accessInfo) && IsDefined(accessInfo["bIsFree"]))
					sText += " ^3(Donator FREE)^7";
			
				dvarDic IDIC::Add("ui_classItem" + itemLocalI + "T" + curLineI, sText);
				curLineI++;
			}
			
			if (IsDefined(item.iChallengeType) && IsDefined(item.sChallengeName))
			{
				challenge = C_ICCHALLENGES::GetItemOrStageListByName(item.iChallengeType, item.sChallengeName);
				IEXCEPTION::Undefined(challenge, "Could not find challenge iType;" + item.iChallengeType + ";sName;" + item.sChallengeName + "'");
				
				sText = challenge.sMenuName;
				
				if (IsDefined(accessInfo))
				{
					sName = "";
					if (IsDefined(accessInfo["iChallengeType"]) && IsDefined(accessInfo["sChallengeName"]))
					{
						challenge = C_ICCHALLENGES::GetItemOrStageListByName(accessInfo["iChallengeType"], accessInfo["sChallengeName"]);
						IEXCEPTION::Undefined(challenge, "Could not find challenge iType;" + accessInfo["iChallengeType"] + ";sName;" + accessInfo["sChallengeName"] + "'");
						
						sName = challenge.sMenuName;
					}
					sText += " ^3(Donator " + sName + ")^7";
				}
				
				dvarDic IDIC::Add("ui_classItem" + itemLocalI + "T" + curLineI, sText);
				curLineI++;
			}
			
			if (IsDefined(item.iRankId) || IsDefined(item.iPrestige))
			{
				sText = "";
				bRankId = false;
				if (IsDefined(item.iRankId))
				{
					bRankId = true;
					sText += C_ILOCALIZE::CLASSItemLockedLvl + C_ICRANK::GetRankIdName(item.iRankId);
					
					if (IsDefined(accessInfo))
					{
						sName = "";
						if (IsDefined(accessInfo["iRankId"]))
							sName = C_ICRANK::GetRankIdName(accessInfo["iRankId"]);

						sText += " ^3(Donator " + sName + ")^7";
					}
				}
				
				if (IsDefined(item.iPrestige))
				{
					if (bRankId)
						sText += ", ";
						
					sText += "Prestige: " + C_ICPRESTIGE::GetPrestigeName(item.iPrestige);
					
					if (IsDefined(accessInfo))
					{
						sName = "";
						if (IsDefined(accessInfo["iPrestige"]))
							sName = C_ICPRESTIGE::GetPrestigeName(accessInfo["iPrestige"]);

						sText += " ^3(Donator " + sName + ")^7";
					}					
				}
				
				dvarDic IDIC::Add("ui_classItem" + itemLocalI + "T" + curLineI, sText);
				curLineI++;
			}
		}
	}
}