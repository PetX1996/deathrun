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

// if server admin don't add your map's challenges into "inputs\challenges\maps",
// players' proceeds will be not stored permanently -> proceed will be reset every map restart

GetDefaultItem()
{
	return C_ICCHALLENGES::GetDefaultItem();
}

Item_AddAccessInfo(iAccessFlag, bIsFree, [iRankId], [iPrestige], [iChallengeType], [sChallengeName])
{
	self C_ICITEM::Item_AddAccessInfo(iAccessFlag, bIsFree, iRankId, iPrestige, iChallengeType, sChallengeName);
}

GetDefaultStageList()
{
	return C_ICCHALLENGES::GetDefaultStageList();
}

StageList_AddStage(stageItem)
{
	self C_ICCHALLENGES::StageList_AddStage(stageItem.sName, stageItem);
}

RegItem(item)
{
	C_ICCHALLENGES::MAPRegItem(item);
}

RegStageList(stageList)
{
	C_ICCHALLENGES::MAPRegStageList(stageList);
}

CIsCompleted(sName)
{
	item = C_ICCHALLENGES::CGetItemByName(C_ICCHALLENGES::TYPE_Map, sName);
	return item C_ICCHALLENGES::Item_IsCompleted(self);
}

CGetProceeding(sName)
{
	item = C_ICCHALLENGES::CGetItemByName(C_ICCHALLENGES::TYPE_Map, sName);
	return item C_ICCHALLENGES::Item_GetProceeding(self);
}

CGetCurrentValue(sName)
{
	item = C_ICCHALLENGES::CGetItemByName(C_ICCHALLENGES::TYPE_Map, sName);
	return item C_ICCHALLENGES::Item_GetCurrentValue(self);
}

GetMaxValue(sName)
{
	item = C_ICCHALLENGES::CGetItemByName(C_ICCHALLENGES::TYPE_Map, sName);
	return item C_ICCHALLENGES::Item_GetMaxValue();
}

CProceed(sName, [iInc])
{
	self C_ICCHALLENGES::MAPCProceed(sName, iInc);
}

CCollect(sName, iIdent)
{
	self C_ICCHALLENGES::MAPCCollect(sName, iIdent);
}

/*
	papyrusI = mapper\_challenges::GetDefaultItem();
	papyrusI.sName = "papyrusI";
	papyrusI.sMenuName = "Papyrus I";
	papyrusI.sMenuDescription = "Collect 5 papyruses.";
	papyrusI.iMaxValue = 5;
	papyrusI.bIsFree = true;

	papyrusII = mapper\_challenges::GetDefaultItem();
	papyrusII.sName = "papyrusII";
	papyrusII.sMenuName = "Papyrus II";
	papyrusII.sMenuDescription = "Collect 10 papyruses.";
	papyrusII.iMaxValue = 10;
	papyrusII.bIsFree = true;

	papyrusIII = mapper\_challenges::GetDefaultItem();
	papyrusIII.sName = "papyrusIII";
	papyrusIII.sMenuName = "Papyrus III";
	papyrusIII.sMenuDescription = "Collect 20 papyruses.";
	papyrusIII.iMaxValue = 20;
	papyrusIII.bIsFree = true;
	
	papyrus = mapper\_challenges::GetDefaultStageList();
	papyrus.sName = "papyrus";
	papyrus mapper\_challenges::StageList_AddStage(papyrusI);
	papyrus mapper\_challenges::StageList_AddStage(papyrusII);
	papyrus mapper\_challenges::StageList_AddStage(papyrusIII);
	mapper\_challenges::RegStageList(papyrus);

	
	paranormal = mapper\_challenges::GetDefaultItem();
	paranormal.sName = "paranormal";
	paranormal.sMenuName = "Paranormal";
	paranormal.sMenuDescription = "Run 20 paranormals.";
	paranormal.iMaxValue = 20;
	paranormal.bIsFree = true;
	mapper\_challenges::RegItem(paranormal);
*/