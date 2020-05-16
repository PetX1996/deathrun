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

public CGiveWeapon(sName, [bGiveMaxAmmo])
{
	self endon("disconnect");
	self endon("death");

	self GiveWeapon(sName);
	if (IsDefined(bGiveMaxAmmo) && bGiveMaxAmmo)
		self GiveMaxAmmo(sName);
	
	wait 0.05;
	
	self SwitchToWeapon(sName);
}

public CGiveWeapons(sNames, [bGiveMaxAmmo])
{
	self endon("disconnect");
	self endon("death");
	
	for (i = 0; i < sNames.size; i++)
	{
		self GiveWeapon(sNames[i]);
		if (IsDefined(bGiveMaxAmmo) && bGiveMaxAmmo)
			self GiveMaxAmmo(sNames[i]);
	}
	
	wait 0.05;
	
	self SwitchToWeapon(sNames[sNames.size - 1]);
}

public SetWeapon(weaponName)
{
	self GiveWeapon(weaponName);
}

public SetForcedWeapon(weaponName)
{
	self.sForcedWeapon = weaponName;
	self GiveWeapon(weaponName);
}

public SetOffhandWeapon(weaponName)
{
	self GiveWeapon(weaponName);
}

public SetSecondaryOffhandWeapon(weaponName)
{
	self GiveWeapon(weaponName);

	if (weaponName == "flash_grenade_mp")
		self SetOffhandSecondaryClass("flash");
	else if (weaponName == "smoke_grenade_mp")
		self SetOffhandSecondaryClass("smoke");
}

public PreCacheActionSlotWeapon(weaponName)
{
	if (weaponName != "altmode" && weaponName != "nightvision")
		PreCacheItem(weaponName);
}

public SetActionSlotWeapon(slotId, arg)
{
	if (arg == "altmode" || arg == "nightvision")
		self SetActionSlot(slotId, arg);
	else
	{
		self GiveWeapon(arg);
		self SetActionSlot(slotId, "weapon", arg);
	}
}

public IsMeleeWeapon(sWeaponName)
{
	return inputs\weapons\melee::IsMeleeWeapon(sWeaponName);
}