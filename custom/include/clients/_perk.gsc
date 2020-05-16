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

public CSet(sPerkName)
{
	if (!IsDefined(self.Perks))
		self.Perks = [];
		
	self.Perks[self.Perks.size] = sPerkName;
	
	if (IsExePerk(sPerkName))
		self SetPerk(sPerkName);
}

public CHas(sPerkName)
{
	if (!IsDefined(self.Perks))
		self.Perks = [];

	return IARRAY::Contains(self.Perks, sPerkName);
}

public CGetAll()
{
	if (!IsDefined(self.Perks))
		self.Perks = [];

	return self.Perks;
}

public CTake(sPerkName)
{
	if (!IsDefined(self.Perks))
		self.Perks = [];
		
	self.Perks = IARRAY::Remove(self.Perks, sPerkName);
	
	self UnSetPerk(sPerkName);
}

public CTakeAll()
{
	self.Perks = [];
	
	self ClearPerks();
}

private IsExePerk(sPerkName)
{
	switch (sPerkName)
	{
		case "specialty_parabolic":
		case "specialty_gpsjammer":
		case "specialty_holdbreath":
		case "specialty_quieter":
		case "specialty_longersprint":
		case "specialty_detectexplosive":
		case "specialty_explosivedamage":
		case "specialty_pistoldeath":
		case "specialty_grenadepulldeath":
		case "specialty_bulletdamage":
		case "specialty_bulletpenetration":
		case "specialty_bulletaccuracy":
		case "specialty_rof":
		case "specialty_fastreload":
		case "specialty_extraammo":
		case "specialty_twoprimaries":
		case "specialty_armorvest":
		case "specialty_fraggrenade":
		case "specialty_specialgrenade":
		case "specialty_weapon_c4":
		case "specialty_weapon_claymore":
		case "specialty_weapon_rpg":
		case "specialty_null":
			return true;
		default:
			return false;
	}
}

// =================================================================================================== //
#region Button

public CBtnPrepareNV([sColorCode])
{
	if (!IsDefined(sColorCode))
		sColorCode = "^7";
		
	self SetActionSlot(1, "nightvision"); // N
	self SetClientDvars("ui_hudPerkC", sColorCode, "ui_hudPerkT", 2);
}

public CBtnPrepareGL([sColorCode])
{
	if (!IsDefined(sColorCode))
		sColorCode = "^7";
		
	self SetActionSlot(1, "altmode");
	self SetClientDvars("ui_hudPerkC", sColorCode, "ui_hudPerkT", 2);
}

public CBtnPrepare([sColorCode])
{
	if (!IsDefined(sColorCode))
		sColorCode = "^7";
	
	self SetClientDvars("ui_hudPerkC", sColorCode, "ui_hudPerkT", 1);
}

public CBtnSetColor([sColorCode])
{
	if (!IsDefined(sColorCode))
		sColorCode = "^7";
		
	self SetClientDvar("ui_hudPerkC", sColorCode);
}

public CBtnRelease()
{
	self SetActionSlot(1, "");
	self SetClientDvar("ui_hudPerkT", 0);
}

#endregion
// =================================================================================================== //