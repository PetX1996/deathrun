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

public CUnlocksForRankId(iRankId)
{
	self inputs\unlocks\rank::CUnlocksForRankId(iRankId);
}

public CUnlocksForPrestige(iPrestige)
{
	self inputs\unlocks\rank::CUnlocksForPrestige(iPrestige);
}

public CUnlocksForChallenge(iType, sName)
{
	self inputs\unlocks\challenges::CUnlocksForChallenge(iType, sName);
}

public CChallenge(iType, sName)
{
	item = self C_ICCHALLENGES::CGetItemByName(iType, sName);
	IEXCEPTION::Undefined(item, "Could not find challenge item iType;" + iType + ";sName;" + sName);
	self CNotifyUnlock("CHALLENGE UNLOCKED", item.sMenuName);
}

public CAlliesBody(sName)
{
	item = C_ICCLASS::GetItemByName(C_ICCLASS::TEAM_Allies, C_ICCLASS::TYPE_Body, sName);
	IEXCEPTION::Undefined(item, "Could not find class item iTeam;" + C_ICCLASS::TEAM_Allies + ";iType;" + C_ICCLASS::TYPE_Body + ";sName;" + sName);
	self CNotifyUnlock("^2BODY UNLOCKED", item.sMenuName, item.sMenuIcon);
}

public CAlliesWeapon(sName)
{	
	item = C_ICCLASS::GetItemByName(C_ICCLASS::TEAM_Allies, C_ICCLASS::TYPE_Weapon, sName);
	IEXCEPTION::Undefined(item, "Could not find class item iTeam;" + C_ICCLASS::TEAM_Allies + ";iType;" + C_ICCLASS::TYPE_Weapon + ";sName;" + sName);
	self CNotifyUnlock("^2WEAPON UNLOCKED", item.sMenuName, item.sMenuIcon, 2);
}

public CAlliesInvA(sName)
{	
	item = C_ICCLASS::GetItemByName(C_ICCLASS::TEAM_Allies, C_ICCLASS::TYPE_InvA, sName);
	IEXCEPTION::Undefined(item, "Could not find class item iTeam;" + C_ICCLASS::TEAM_Allies + ";iType;" + C_ICCLASS::TYPE_InvA + ";sName;" + sName);
	self CNotifyUnlock("^2PERK UNLOCKED", item.sMenuName, item.sMenuIcon);
}

public CAlliesInvB(sName)
{	
	item = C_ICCLASS::GetItemByName(C_ICCLASS::TEAM_Allies, C_ICCLASS::TYPE_InvB, sName);
	IEXCEPTION::Undefined(item, "Could not find class item iTeam;" + C_ICCLASS::TEAM_Allies + ";iType;" + C_ICCLASS::TYPE_InvB + ";sName;" + sName);
	self CNotifyUnlock("^2SPRAY UNLOCKED", item.sMenuName, item.sMenuIcon);
}

public CAlliesInvC(sName)
{	
	item = C_ICCLASS::GetItemByName(C_ICCLASS::TEAM_Allies, C_ICCLASS::TYPE_InvC, sName);
	IEXCEPTION::Undefined(item, "Could not find class item iTeam;" + C_ICCLASS::TEAM_Allies + ";iType;" + C_ICCLASS::TYPE_InvC + ";sName;" + sName);
	self CNotifyUnlock("^2TRAIL UNLOCKED", item.sMenuName, item.sMenuIcon);
}

public CAxisBody(sName)
{
	item = C_ICCLASS::GetItemByName(C_ICCLASS::TEAM_Axis, C_ICCLASS::TYPE_Body, sName);
	IEXCEPTION::Undefined(item, "Could not find class item iTeam;" + C_ICCLASS::TEAM_Axis + ";iType;" + C_ICCLASS::TYPE_Body + ";sName;" + sName);
	self CNotifyUnlock("^1BODY UNLOCKED", item.sMenuName, item.sMenuIcon);
}

public CAxisWeapon(sName)
{	
	item = C_ICCLASS::GetItemByName(C_ICCLASS::TEAM_Axis, C_ICCLASS::TYPE_Weapon, sName);
	IEXCEPTION::Undefined(item, "Could not find class item iTeam;" + C_ICCLASS::TEAM_Axis + ";iType;" + C_ICCLASS::TYPE_Weapon + ";sName;" + sName);
	self CNotifyUnlock("^1WEAPON UNLOCKED", item.sMenuName, item.sMenuIcon, 2);
}

public CAxisInvA(sName)
{	
	item = C_ICCLASS::GetItemByName(C_ICCLASS::TEAM_Axis, C_ICCLASS::TYPE_InvA, sName);
	IEXCEPTION::Undefined(item, "Could not find class item iTeam;" + C_ICCLASS::TEAM_Axis + ";iType;" + C_ICCLASS::TYPE_InvA + ";sName;" + sName);
	self CNotifyUnlock("^1PERK UNLOCKED", item.sMenuName, item.sMenuIcon);
}

private CNotifyUnlock(sTitle, sMsg, [sImage], [fAspectWidth])
{
	self C_ICMSG::CNotify(sTitle, sMsg, sImage, fAspectWidth);
}
