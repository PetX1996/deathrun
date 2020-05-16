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

public GetDefaultItem()
{
	item = SpawnStruct();
	
	/// false = always locked; true = always available; 
	/// undefined = compare lvl, accessLevel, challengeName
	item.bIsFree = undefined;
	

	/// minimal rankId(rank visible in scoreboard - 1)
	item.iRankId = undefined;
	/// minimal prestige
	item.iPrestige = undefined;
	/// category and name of the challenge
	item.iChallengeType = undefined;
	item.sChallengeName = undefined;

	item.iAccessFlag = undefined;
	
	
	item.AccessInfo = [];
	
	return item;
}

/// <summary>
/// Changes item's availability for clients with specified iAccessFlag
/// </summary>
/// <returns></returns>
/// <param name="iAccessFlag"></param>
/// <param name="bIsFree"></param>
/// <param name="iRankId"></param>
/// <param name="iPrestige"></param>
/// <param name="iChallengeType"></param>
/// <param name="sChallengeName"></param>
public Item_AddAccessInfo(iAccessFlag, bIsFree, [iRankId], [iPrestige], [iChallengeType], [sChallengeName])
{
	self.AccessInfo[iAccessFlag] = { bIsFree = bIsFree, iRankId = iRankId, iPrestige = iPrestige, iChallengeType = iChallengeType, sChallengeName = sChallengeName };
}

public Item_GetAccessInfo(iAccessFlag)
{
	// only one flag
	accessInfo = self.AccessInfo[iAccessFlag];
	if (IsDefined(accessInfo))
		return accessInfo;
	
	// more flags combined with bitwise OR
	keys = GetArrayKeys(self.AccessInfo);
	foreach (iKey in keys)
	{
		if (iKey & iAccessFlag)
			return self.AccessInfo[iKey];
	}
	
	return undefined;
}

public Item_IsAvailable(pPlayer)
{
	if (IsDefined(self.bIsFree) && self.bIsFree)
		return true;
		
	if (self Item_IsAvailableByAccessInfo(pPlayer))
		return true;
		
	if (IsDefined(self.iRankId) && pPlayer C_ICRANK::CGetRankId() < self.iRankId)
		return false;
		
	if (IsDefined(self.iPrestige) && pPlayer C_ICPRESTIGE::CGetPrestige() < self.iPrestige)
		return false;
		
	if (IsDefined(self.iAccessFlag) && !pPlayer C_ICACCESS::CIs(self.iAccessFlag))
		return false;
	
	if (IsDefined(self.iChallengeType) && IsDefined(self.sChallengeName))
	{
		challenge = pPlayer C_ICCHALLENGES::CGetItemByName(self.iChallengeType, self.sChallengeName);
		IEXCEPTION::Undefined(challenge, "Could not find challenge iType;" + self.iChallengeType + ";sName;" + self.sChallengeName);
		if (!challenge C_ICCHALLENGES::Item_IsCompleted(pPlayer))
			return false;
	}
		
	return true;
}

private Item_IsAvailableByAccessInfo(pPlayer)
{
	if (self.AccessInfo.size <= 0)
		return false;

	accessInfo = self Item_GetAccessInfo(pPlayer C_ICACCESS::CGet());
	if (!IsDefined(accessInfo))
		return false;
	
	if (IsDefined(accessInfo["bIsFree"]) && accessInfo["bIsFree"])
		return true;
	
	if (IsDefined(accessInfo["iRankId"]) && pPlayer C_ICRANK::CGetRankId() < accessInfo["iRankId"])
		return false;
		
	if (IsDefined(accessInfo["iPrestige"]) && pPlayer C_ICPRESTIGE::CGetPrestige() < accessInfo["iPrestige"])
		return false;
	
	if (IsDefined(accessInfo["iChallengeType"]) && IsDefined(accessInfo["sChallengeName"]))
	{
		challenge = pPlayer C_ICCHALLENGES::CGetItemByName(accessInfo["iChallengeType"], accessInfo["sChallengeName"]);
		IEXCEPTION::Undefined(challenge, "Could not find challenge iType;" + accessInfo["iChallengeType"] + ";sName;" + accessInfo["sChallengeName"]);
		if (!challenge C_ICCHALLENGES::Item_IsCompleted(pPlayer))
			return false;
	}
	
	return true;
}