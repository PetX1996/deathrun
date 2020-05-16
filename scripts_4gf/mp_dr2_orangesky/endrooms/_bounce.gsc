// +========================================================================+
// I                    ___  _____  _____                                   I
// I                   /   !!  __ \!  ___!                                  I
// I                  / /! !! !  \/! !_          ___  ____                  I
// I                 / /_! !! ! __ !  _!        / __!!_  /                  I
// I                 \___  !! !_\ \! !      _  ! (__  / /                   I
// I                     !_/ \____/\_!     (_)  \___!/___!                  I
// I                                                                        I
// I========================================================================I
// I                            mp_dr2_orangesky                            I
// I========================================================================I
// I                      mapped by:  Col!ar                                I
// I                    scripted by:  PetX                                  I
// I                        website:  4GF.CZ                                I
// +========================================================================+

Main()
{
	PreCacheItem("rpg_mp");
	PreCacheItem("ak47_mp");

	Teleport("bouncetele", "bouncea", "bouncej");
	thread WatchWeaponTrigger("bouncew");
}

Teleport(sTriggerName, sActivatorsOrigins, sJumpersOrigins)
{
	eTrigger = GetEnt(sTriggerName, "targetname");
	eTrigger thread WatchTrigger(sActivatorsOrigins, sJumpersOrigins);
}

WatchTrigger(eActivatorOrigins, eJumpersOrigins)
{
	while (true)
	{
		self waittill("trigger", pPlayer);
		if (pPlayer.pers["team"] == "allies")
			pPlayer mapper\_player::CTeleportRandom(eJumpersOrigins, true);
		else
			pPlayer mapper\_player::CTeleportRandom(eActivatorOrigins, true);
	}
}

WatchWeaponTrigger(sName)
{
	eTrigger = GetEnt(sName, "targetname");
	//while (true)
	//{
		eTrigger waittill("trigger", pPlayer);
		pPlayer PickRandomWeapon();
	//}
}

PickRandomWeapon()
{
	sWeapons = [];
	sWeapons[sWeapons.size] = "rpg_mp";
	sWeapons[sWeapons.size] = "ak47_mp";
	
	sWeapon = sWeapons[RandomInt(sWeapons.size)];
	self mapper\_weapon::CGiveWeapon(sWeapon, true);
}