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
// Script by: PetX, BraXi, ...
//I========================================================================I

#include core\include\_usings;
#include custom\include\_usings;

public ItemInSVPreCache(item)
{
}

public ItemInCPreSpawning(item, args)
{
	args.Perks[args.Perks.size] = item.sPerkName;
}

public ItemOnCSpawned(item, args)
{
	
}

