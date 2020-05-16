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
	PreCacheItem("knife_mp");
	PreCacheItem("remington700_mp");
	PreCacheItem("ak47_mp");
	PreCacheItem("ak74u_mp");
	PreCacheItem("winchester1200_mp");
	PreCacheItem("rpd_mp");

	
	old = mapper\_endrooms::RegRoom("oldt");
	
	old.eBrush = GetEnt("oldb", "targetname");
	old.eBrush.vStartOrigin = old.eBrush.origin;
	old.eEnterTrigger EnableLinkTo();
	old.eEnterTrigger LinkTo(old.eBrush);
	
	old.dOnNotSelected = ::Room_HideEnter;
	old.dOnRestartedSelection = ::Room_ShowEnter;
	old.dOnTriedEnter = ::Room_OnTriedEnter;
	old.dOnEntered = ::Room_OnEnteredOld;
	
	
	bounce = mapper\_endrooms::RegRoom("bount");
	
	bounce.eBrush = GetEnt("bounb", "targetname");
	bounce.eBrush.vStartOrigin = bounce.eBrush.origin;
	bounce.eEnterTrigger EnableLinkTo();
	bounce.eEnterTrigger LinkTo(bounce.eBrush);
	
	bounce.dOnNotSelected = ::Room_HideEnter;
	bounce.dOnRestartedSelection = ::Room_ShowEnter;
	bounce.dOnTriedEnter = ::Room_OnTriedEnter;
	bounce.dOnEntered = ::Room_OnEnteredBounce;
	
	
	snip = mapper\_endrooms::RegRoom("snipt");
	
	snip.eBrush = GetEnt("snipb", "targetname");
	snip.eBrush.vStartOrigin = snip.eBrush.origin;
	snip.eEnterTrigger EnableLinkTo();
	snip.eEnterTrigger LinkTo(snip.eBrush);
	
	snip.dOnNotSelected = ::Room_HideEnter;
	snip.dOnRestartedSelection = ::Room_ShowEnter;
	snip.dOnTriedEnter = ::Room_OnTriedEnter;
	snip.dOnEntered = ::Room_OnEnteredSnip;
	
	
	knife = mapper\_endrooms::RegRoom("knifet");
	
	knife.eBrush = GetEnt("knifeb", "targetname");
	knife.eBrush.vStartOrigin = knife.eBrush.origin;
	knife.eEnterTrigger EnableLinkTo();
	knife.eEnterTrigger LinkTo(knife.eBrush);
	
	knife.dOnNotSelected = ::Room_HideEnter;
	knife.dOnRestartedSelection = ::Room_ShowEnter;
	knife.dOnTriedEnter = ::Room_OnTriedEnter;
	knife.dOnEntered = ::Room_OnEnteredKnife;
	
	
	weapon = mapper\_endrooms::RegRoom("weapt");
	
	weapon.eBrush = GetEnt("weapb", "targetname");
	weapon.eBrush.vStartOrigin = weapon.eBrush.origin;
	weapon.eEnterTrigger EnableLinkTo();
	weapon.eEnterTrigger LinkTo(weapon.eBrush);
	
	weapon.dOnNotSelected = ::Room_HideEnter;
	weapon.dOnRestartedSelection = ::Room_ShowEnter;
	weapon.dOnTriedEnter = ::Room_OnTriedEnter;
	weapon.dOnEntered = ::Room_OnEnteredWeapon;
}

Room_ShowEnter()
{
	self.eBrush MoveTo(self.eBrush.vStartOrigin, 3);
}

Room_HideEnter()
{
	self.eBrush MoveTo(self.eBrush.vStartOrigin + (0, 0, -176), 3);
}

Room_OnTriedEnter(pJumper)
{
	pJumper IPrintLnBold("Please try it later");
}

// ==================================================================================== //
// OLD

/*Room_OnEnteredOld(pJumper)
{
	IPrintLnBold("Player " + pJumper.name + "^7 has just entered old room");
	
	if (!IsDefined(self.bIsActivatorInside))
	{
		thread mapper\_endrooms::PortAllActivators("olda");
		self.bIsActivatorInside = true;
	}
	
	pJumper thread mapper\_player::CTeleportRandom("oldj", true);
}*/

Room_OnEnteredOld(pJumper)
{
	self mapper\_endrooms::Room_MakeUnAvailable(); // other players can't inside

	// fight with all activators
	self Room_OldLife(pJumper);

	//self mapper\_endrooms::Room_MakeAvailable(); // other players can inside
	mapper\_endrooms::RestartSelection();
}

Room_OldLife(pJumper)
{
	// jumper is away -> make room available / restart selection
	while (IsDefined(pJumper) && IsAlive(pJumper))
	{
		pActivators = mapper\_teams::GetAllActivators(true);
		pActivator = pActivators[0];
		// there is no more activators -> make room available / restart selection
		if (!IsDefined(pActivator))
			return;

		// give weapons, wait until start, wait until end, etc.
		self Room_OldLogic(pJumper, pActivator);
			
		// if somebody dies in preparing wait or teleport wait, etc...
		// 	-> unfreeze other guy
		if (IsDefined(pJumper) && IsAlive(pJumper))
			pJumper FreezeControls(false);
		if (IsDefined(pActivator) && IsAlive(pActivator))
			pActivator FreezeControls(false);
	}
}

Room_OldLogic(pJumper, pActivator)
{
	pJumper endon("disconnect");
	pJumper endon("death");
	
	pActivator endon("disconnect");
	pActivator endon("death");
	
	//pJumper TakeAllWeapons();
	//pJumper thread mapper\_weapon::CGiveWeapon("knife_mp");
	pJumper mapper\_player::CTeleportRandom("oldj", false);
	//pJumper mapper\_player::CSetHealth(100, 100);
	
	//pActivator TakeAllWeapons();
	//pActivator thread mapper\_weapon::CGiveWeapon("knife_mp");
	pActivator mapper\_player::CTeleportRandom("olda", false);
	//pActivator mapper\_player::CSetHealth(100, 100);
	
	IPrintLnBold("OLD");
	IPrintLnBold(pJumper.name + "^7 vs. " + pActivator.name);
	
	pJumper FreezeControls(true);
	pActivator FreezeControls(true);
	
	// preparing time
	wait 2;
	
	pJumper FreezeControls(false);
	pActivator FreezeControls(false);
	
	// pause thread until somebody die/disconnect
	pActivator waittill("death");
}

// ==================================================================================== //
// BOUNCE

/*Room_OnEnteredBounce(pJumper)
{
	IPrintLnBold("Player " + pJumper.name + "^7 has just entered bounce room");

	if (!IsDefined(self.bIsActivatorInside))
	{
		pActivators = mapper\_teams::GetAllActivators(true);
		for (i = 0; i < pActivators.size; i++)
		{
			pActivator = pActivators[i];
			pActivator TakeAllWeapons();
			pActivator thread mapper\_weapon::CGiveWeapon("knife_mp");
			pActivator thread mapper\_player::CTeleportRandom("bouna", true);
		}
		
		self.bIsActivatorInside = true;
	}
	
	pJumper TakeAllWeapons();
	pJumper thread mapper\_weapon::CGiveWeapon("knife_mp");
	pJumper thread mapper\_endrooms::CTeleportRandom("bounj", true);
}*/

Room_OnEnteredBounce(pJumper)
{
	self mapper\_endrooms::Room_MakeUnAvailable(); // other players can't inside

	// fight with all activators
	self Room_BounceLife(pJumper);

	//self mapper\_endrooms::Room_MakeAvailable(); // other players can inside
	mapper\_endrooms::RestartSelection();
}

Room_BounceLife(pJumper)
{
	// jumper is away -> make room available / restart selection
	while (IsDefined(pJumper) && IsAlive(pJumper))
	{
		pActivators = mapper\_teams::GetAllActivators(true);
		pActivator = pActivators[0];
		// there is no more activators -> make room available / restart selection
		if (!IsDefined(pActivator))
			return;

		// give weapons, wait until start, wait until end, etc.
		self Room_BounceLogic(pJumper, pActivator);
			
		// if somebody dies in preparing wait or teleport wait, etc...
		// 	-> unfreeze other guy
		if (IsDefined(pJumper) && IsAlive(pJumper))
			pJumper FreezeControls(false);
		if (IsDefined(pActivator) && IsAlive(pActivator))
			pActivator FreezeControls(false);
	}
}

Room_BounceLogic(pJumper, pActivator)
{
	pJumper endon("disconnect");
	pJumper endon("death");
	
	pActivator endon("disconnect");
	pActivator endon("death");
	
	pJumper TakeAllWeapons();
	pJumper thread mapper\_weapon::CGiveWeapon("knife_mp");
	pJumper mapper\_player::CTeleportRandom("bounj", false);
	pJumper mapper\_player::CSetHealth(100, 100);
	
	pActivator TakeAllWeapons();
	pActivator thread mapper\_weapon::CGiveWeapon("knife_mp");
	pActivator mapper\_player::CTeleportRandom("bouna", false);
	pActivator mapper\_player::CSetHealth(100, 100);
	
	IPrintLnBold("BOUNCE");
	IPrintLnBold(pJumper.name + "^7 vs. " + pActivator.name);
	
	pJumper FreezeControls(true);
	pActivator FreezeControls(true);
	
	// preparing time
	wait 2;
	
	pJumper FreezeControls(false);
	pActivator FreezeControls(false);
	
	// pause thread until somebody die/disconnect
	pActivator waittill("death");
}

// ==================================================================================== //
// SNIP

Room_OnEnteredSnip(pJumper)
{
	self mapper\_endrooms::Room_MakeUnAvailable(); // other players can't inside

	// fight with all activators
	self Room_SnipLife(pJumper);

	//self mapper\_endrooms::Room_MakeAvailable(); // other players can inside
	mapper\_endrooms::RestartSelection();
}

Room_SnipLife(pJumper)
{
	// jumper is away -> make room available / restart selection
	while (IsDefined(pJumper) && IsAlive(pJumper))
	{
		pActivators = mapper\_teams::GetAllActivators(true);
		pActivator = pActivators[0];
		// there is no more activators -> make room available / restart selection
		if (!IsDefined(pActivator))
			return;

		// give weapons, wait until start, wait until end, etc.
		self Room_SnipLogic(pJumper, pActivator);
			
		// if somebody dies in preparing wait or teleport wait, etc...
		// 	-> unfreeze other guy
		if (IsDefined(pJumper) && IsAlive(pJumper))
			pJumper FreezeControls(false);
		if (IsDefined(pActivator) && IsAlive(pActivator))
			pActivator FreezeControls(false);
	}
}

Room_SnipLogic(pJumper, pActivator)
{
	pJumper endon("disconnect");
	pJumper endon("death");
	
	pActivator endon("disconnect");
	pActivator endon("death");
	
	pJumper TakeAllWeapons();
	pJumper thread mapper\_weapon::CGiveWeapon("remington700_mp");
	pJumper mapper\_player::CTeleportRandom("snipj", false);
	pJumper mapper\_player::CSetHealth(100, 100);
	
	pActivator TakeAllWeapons();
	pActivator thread mapper\_weapon::CGiveWeapon("remington700_mp");
	pActivator mapper\_player::CTeleportRandom("snipa", false);
	pActivator mapper\_player::CSetHealth(100, 100);
	
	IPrintLnBold("SNIPER");
	IPrintLnBold(pJumper.name + "^7 vs. " + pActivator.name);
	
	pJumper FreezeControls(true);
	pActivator FreezeControls(true);
	
	// preparing time
	wait 2;
	
	pJumper FreezeControls(false);
	pActivator FreezeControls(false);
	
	// pause thread until somebody die/disconnect
	pActivator waittill("death");
}

// ==================================================================================== //
// KNIFE

Room_OnEnteredKnife(pJumper)
{
	self mapper\_endrooms::Room_MakeUnAvailable(); // other players can't inside

	// fight with all activators
	self Room_KnifeLife(pJumper);

	//self mapper\_endrooms::Room_MakeAvailable(); // other players can inside
	mapper\_endrooms::RestartSelection();
}

Room_KnifeLife(pJumper)
{
	// jumper is away -> make room available / restart selection
	while (IsDefined(pJumper) && IsAlive(pJumper))
	{
		pActivators = mapper\_teams::GetAllActivators(true);
		pActivator = pActivators[0];
		// there is no more activators -> make room available / restart selection
		if (!IsDefined(pActivator))
			return;

		// give weapons, wait until start, wait until end, etc.
		self Room_KnifeLogic(pJumper, pActivator);
			
		// if somebody dies in preparing wait or teleport wait, etc...
		// 	-> unfreeze other guy
		if (IsDefined(pJumper) && IsAlive(pJumper))
			pJumper FreezeControls(false);
		if (IsDefined(pActivator) && IsAlive(pActivator))
			pActivator FreezeControls(false);
	}
}

Room_KnifeLogic(pJumper, pActivator)
{
	pJumper endon("disconnect");
	pJumper endon("death");
	
	pActivator endon("disconnect");
	pActivator endon("death");
	
	pJumper TakeAllWeapons();
	pJumper thread mapper\_weapon::CGiveWeapon("knife_mp");
	pJumper mapper\_player::CTeleportRandom("knifej", false);
	pJumper mapper\_player::CSetHealth(100, 100);
	
	pActivator TakeAllWeapons();
	pActivator thread mapper\_weapon::CGiveWeapon("knife_mp");
	pActivator mapper\_player::CTeleportRandom("knifea", false);
	pActivator mapper\_player::CSetHealth(100, 100);
	
	IPrintLnBold("KNIFE");
	IPrintLnBold(pJumper.name + "^7 vs. " + pActivator.name);
	
	pJumper FreezeControls(true);
	pActivator FreezeControls(true);
	
	// preparing time
	wait 2;
	
	pJumper FreezeControls(false);
	pActivator FreezeControls(false);
	
	// pause thread until somebody die/disconnect
	pActivator waittill("death");
}

// ==================================================================================== //
// WEAPON

Room_OnEnteredWeapon(pJumper)
{
	self mapper\_endrooms::Room_MakeUnAvailable(); // other players can't inside

	// fight with all activators
	self Room_WeaponLife(pJumper);

	//self mapper\_endrooms::Room_MakeAvailable(); // other players can inside
	mapper\_endrooms::RestartSelection();
}

Room_WeaponLife(pJumper)
{
	// jumper is away -> make room available / restart selection
	while (IsDefined(pJumper) && IsAlive(pJumper))
	{
		pActivators = mapper\_teams::GetAllActivators(true);
		pActivator = pActivators[0];
		// there is no more activators -> make room available / restart selection
		if (!IsDefined(pActivator))
			return;

		// give weapons, wait until start, wait until end, etc.
		self Room_WeaponLogic(pJumper, pActivator);
			
		// if somebody dies in preparing wait or teleport wait, etc...
		// 	-> unfreeze other guy
		if (IsDefined(pJumper) && IsAlive(pJumper))
			pJumper FreezeControls(false);
		if (IsDefined(pActivator) && IsAlive(pActivator))
			pActivator FreezeControls(false);
	}
}

Room_WeaponLogic(pJumper, pActivator)
{
	pJumper endon("disconnect");
	pJumper endon("death");
	
	pActivator endon("disconnect");
	pActivator endon("death");

	sWeapons = [];
	sWeapons[sWeapons.size] = "ak47_mp";
	sWeapons[sWeapons.size] = "ak74u_mp";
	sWeapons[sWeapons.size] = "winchester1200_mp";
	sWeapons[sWeapons.size] = "rpd_mp";
	sWeapon = sWeapons[RandomInt(sWeapons.size)];
	
	pJumper TakeAllWeapons();
	pJumper thread mapper\_weapon::CGiveWeapon(sWeapon, true);
	pJumper mapper\_player::CTeleportRandom("weapj", false);
	pJumper mapper\_player::CSetHealth(100, 100);
	
	pActivator TakeAllWeapons();
	pActivator thread mapper\_weapon::CGiveWeapon(sWeapon, true);
	pActivator mapper\_player::CTeleportRandom("weapa", false);
	pActivator mapper\_player::CSetHealth(100, 100);
	
	IPrintLnBold("WEAPON");
	IPrintLnBold(pJumper.name + "^7 vs. " + pActivator.name);
	
	pJumper FreezeControls(true);
	pActivator FreezeControls(true);
	
	// preparing time
	wait 2;
	
	pJumper FreezeControls(false);
	pActivator FreezeControls(false);
	
	// pause thread until somebody die/disconnect
	pActivator waittill("death");
}