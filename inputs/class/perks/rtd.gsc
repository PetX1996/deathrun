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

// SpawnPoint, sBodyModel, sHeadModel, sViewModel, iHealth, fSpeed, sForcedWeapon, sSpawnWeapon, Weapons, sOffHand, sSecondaryOffHand, sActionSlot1, sActionSlot2, sActionSlot3, sActionSlot4, Perks
InCPreSpawning(args)
{
	iTeam = RandomInt(C_ICCLASS::TEAM_SIZE);
	iCount = C_ICCLASS::GetItemsCount(iTeam, C_ICCLASS::TYPE_InvA);
	
	IEXCEPTION::InvalidOperation(iCount >= 2, "Not enough perks for Roll the Dice");
	
	iIndex = undefined;
	perk = undefined;
	do
	{
		iIndex = RandomInt(iCount);
		perk = C_ICCLASS::GetItemByIndex(iTeam, C_ICCLASS::TYPE_InvA, iIndex);
	}
	while (!perk C_ICCLASS::Item_IsUsable() || perk.sPerkName == "perk_rtd");
	
	self C_ICCLASS::CSISet(C_ICCLASS::TYPE_InvA, iTeam, iIndex);
	args.Perks[args.Perks.size] = perk.sPerkName;
	
	args = IECALLBACK::Args_Create();
	self C_INIT::PERK_RunOnCActivatedRTD(args);
}