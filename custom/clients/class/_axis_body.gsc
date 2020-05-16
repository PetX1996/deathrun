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

public ItemInSVPreCache(item)
{
	PreCacheModel(item.sBodyModel);
	
	if (IsDefined(item.sBodyHead))
		PreCacheModel(item.sBodyHead);
		
	PreCacheModel(item.sViewHands);
	
	if (IsDefined(item.sForcedWeapon))
		PreCacheItem(item.sForcedWeapon);
}

public ItemInCPreSpawning(item, args)
{
	args.sBodyModel = item.sBodyModel;
	
	if (IsDefined(item.sBodyHead))
		args.sHeadModel = item.sBodyHead;
		
	args.sViewModel = item.sViewHands;
	
	if (IsDefined(item.sForcedWeapon))
		args.sForcedWeapon = item.sForcedWeapon;
}

public ItemOnCSpawned(item, args)
{
	
}