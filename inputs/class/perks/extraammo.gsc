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

OnCSpawned(args)
{
	if (IsDefined(args.sForcedWeapon))
		self GiveMaxAmmo(args.sForcedWeapon);
		
	if (IsDefined(args.sSpawnWeapon))
		self GiveMaxAmmo(args.sSpawnWeapon);
		
	foreach (sWeapon in args.Weapons)
		self GiveMaxAmmo(sWeapon);
}