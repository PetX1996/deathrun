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

private ItemsPerPage = 9;

MENU_OnCOpened(args)
{
	if (args.sMenuName != C_ICMENU::GetMenu("challenges"))
		return;
	
	args.OpenedMenu.ICurType = Int(args.ResponseArgs[1]);
	args.OpenedMenu.ICurPage = 0;
	self UpdateMenuContent(args.OpenedMenu);
}

MENU_OnCResponded(args)
{
	if (args.sMenuName != C_ICMENU::GetMenu("challenges"))
		return;

	openedMenu = self C_ICMENU::GetOpenedMenu();
	if (IsDefined(openedMenu.IsWorking)) // sending dvars have not finished yet...
		return;
	
	if (args.sResponse == "chPrev")
		self GoToFollowingPage(openedMenu, -1);
	else if (args.sResponse == "chNext")
		self GoToFollowingPage(openedMenu, 1);
	else
		IEXCEPTION::ArgumentMsg("Unknown challenges notify '" + args.sResponse + "'");
}

private GoToFollowingPage(openedMenu, iDir)
{
	totalItemsCount = C_ICCHALLENGES::GetItemsCount(openedMenu.ICurType);
	if (iDir == -1 && openedMenu.ICurPage > 0)
	{
		openedMenu.ICurPage--;
		self UpdateMenuContent(openedMenu);
	}
	else if (iDir == 1 && totalItemsCount > ((openedMenu.ICurPage + 1) * ItemsPerPage))
	{
		openedMenu.ICurPage++;
		self UpdateMenuContent(openedMenu);
	}
	else
		self C_IDEBUG::Debug("This button should not be here.", C_IDEBUG::TYPE_ERROR);
}

private UpdateMenuContent(openedMenu)
{
	openedMenu.IsWorking = true;
	
	dvarDic = IDIC::Create();
	
	totalItemsCount = C_ICCHALLENGES::GetItemsCount(openedMenu.ICurType);
	localItemsCount = Min(totalItemsCount - (openedMenu.ICurPage * ItemsPerPage), ItemsPerPage);
	
	dvarDic IDIC::Add("ui_chIsPrev", openedMenu.ICurPage > 0);
	dvarDic IDIC::Add("ui_chIsNext", totalItemsCount > ((openedMenu.ICurPage + 1) * ItemsPerPage));
	
	for (i = 0; i < localItemsCount; i++)
	{
		item = self C_ICCHALLENGES::CGetItemByIndex(openedMenu.ICurType, (openedMenu.ICurPage * ItemsPerPage) + i);
		IEXCEPTION::Undefined(item, "Could not find challenges item type;" + openedMenu.ICurType 
			+ ";index;" + (openedMenu.ICurPage * ItemsPerPage) + i);

		self GetDvarListForItem(dvarDic, i, item);
	}
	
	self C_ICCMD::SendDvars(dvarDic IDIC::ToDicArray());
	
	self SetClientDvar("ui_chCount", localItemsCount);
	openedMenu.IsWorking = undefined;
}

private GetDvarListForItem(dvarDic, iItemLocalI, item)
{
	dvarDic IDIC::Add("ui_chI" + iItemLocalI + "T", "");
	dvarDic IDIC::Add("ui_chI" + iItemLocalI + "D", "");
	dvarDic IDIC::Add("ui_chI" + iItemLocalI + "C", "");
	dvarDic IDIC::Add("ui_chI" + iItemLocalI + "M", "");
	
	if (item C_ICCHALLENGES::Item_IsAvailable(self))
	{
		dvarDic IDIC::Add("ui_chI" + iItemLocalI + "T", item.sMenuName);
		dvarDic IDIC::Add("ui_chI" + iItemLocalI + "D", item.sMenuDescription);
		dvarDic IDIC::Add("ui_chI" + iItemLocalI + "C", item C_ICCHALLENGES::Item_ValueToString(item C_ICCHALLENGES::Item_GetProceeding(self)));
		dvarDic IDIC::Add("ui_chI" + iItemLocalI + "M", item C_ICCHALLENGES::Item_ValueToString(item.iMaxValue));
	}
	else
	{
		dvarDic IDIC::Add("ui_chI" + iItemLocalI + "T", C_ILOCALIZE::CHALLENGEItemLockedTitle);
	
		if (IsDefined(item.bIsFree)) // -> LOCKED, otherwise is available...
			dvarDic IDIC::Add("ui_chI" + iItemLocalI + "D", C_ILOCALIZE::CHALLENGEItemLocked);
		else // check other conditions...
		{
			// LVL: {rankId}, {challengeName}, {accessName}
			sText = "";
			bRankId = false;
			bPrestige = false;
			bChallengeName = false;

			accessInfo = item C_ICITEM::Item_GetAccessInfo(C_ICACCESS::FLAG_DONATOR);
			if (IsDefined(accessInfo) && IsDefined(accessInfo["bIsFree"]))
				sText += "^3(Donator FREE)^7 ";
			
			if (IsDefined(item.iRankId))
			{		
				bRankId = true;
				sText += "LVL: " + C_ICRANK::GetRankIdName(item.iRankId);
				
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
			
				bPrestige = true;
				sText += "Prestige: " + C_ICPRESTIGE::GetPrestigeName(item.iPrestige);
				
				if (IsDefined(accessInfo))
				{
					sName = "";
					if (IsDefined(accessInfo["iPrestige"]))
						sName = C_ICPRESTIGE::GetPrestigeName(accessInfo["iPrestige"]);

					sText += " ^3(Donator " + sName + ")^7";
				}
			}
			
			if (IsDefined(item.iChallengeType) && IsDefined(item.sChallengeName))
			{
				if (bRankId || bPrestige)
					sText += ", ";
			
				challenge = C_ICCHALLENGES::GetItemOrStageListByName(item.iChallengeType, item.sChallengeName);
				IEXCEPTION::Undefined(challenge, "Could not find challenge iType;" + item.iChallengeType + ";sName;" + item.sChallengeName);
					
				bChallengeName = true;
				sText += challenge.sMenuName;
				
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
			}
			
			if (IsDefined(item.iAccessFlag))
			{
				if (bRankId || bPrestige || bChallengeName)
					sText += ", ";
				
				sText += C_ICACCESS::GetFullName(item.iAccessFlag);
			}
			
			dvarDic IDIC::Add("ui_chI" + iItemLocalI + "D", sText);
		}
	}
}