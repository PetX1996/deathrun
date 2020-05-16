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

InSIniting(args)
{
}

InCPreSpawning(args)
{
	foreach (sPerk in args.Perks)
	{
		switch (sPerk)
		{
			case "perk_rtd":
				self inputs\class\perks\rtd::InCPreSpawning(args);
				break;
			default:
				break;
		}		
	}
}

InCPostSpawning(args)
{
	foreach (sPerk in args.Perks)
	{
		switch (sPerk)
		{
			case "perk_speed":
				self inputs\class\perks\speed::InCPostSpawning(args);
				break;
			default:
				break;
		}		
	}
}

OnCSpawned(args)
{
	foreach (sPerk in self C_ICPERK::CGetAll())
	{
		switch (sPerk)
		{
			case "specialty_extraammo":
				self inputs\class\perks\extraammo::OnCSpawned(args);
				break;
			case "specialty_bulletaccuracy":
				self inputs\class\perks\bulletaccuracy::OnCSpawned(args);
				break;
			case "perk_nightvision":
				self inputs\class\perks\nightvision::OnCSpawned(args);
				break;
			//case "perk_flashlight":
			//	self inputs\class\perks\flashlight::OnCSpawned(args);
			//	break;
			case "perk_bunnyhop":
				self inputs\class\perks\bunnyhop::OnCSpawned(args);
				break;
			case "perk_fastrun":
				self inputs\class\perks\fastrun::OnCSpawned(args);
				break;
			case "perk_backstep":
				self inputs\class\perks\backstep::OnCSpawned(args);
				break;
			default:
				break;
		}
	}
}

BTN_OnCPressedSecondaryFrag(args)
{
	foreach (sPerk in self C_ICPERK::CGetAll())
	{
		switch (sPerk)
		{
			//case "perk_flashlight":
			//	self inputs\class\perks\flashlight::BTN_OnCPressedSecondaryFrag(args);
			//	break;
			case "perk_fastrun":
				self inputs\class\perks\fastrun::BTN_OnCPressedSecondaryFrag(args);
				break;
			case "perk_backstep":
				self inputs\class\perks\backstep::BTN_OnCPressedSecondaryFrag(args);
				break;				
			default:
				break;
		}
	}	
}


DMG_InCPostDamaging(args)
{
	foreach (sPerk in self C_ICPERK::CGetAll())
		self InCPostDamagingCalls(sPerk, args);
	
	if (C_ICDAMAGE::IsEnemy(args))
	{
		foreach (sPerk in args.eAttacker C_ICPERK::CGetAll())
			self InCPostDamagingCalls(sPerk, args);
	}
}

private InCPostDamagingCalls(sPerk, args)
{
	switch (sPerk)
	{
		case "specialty_bulletdamage":
			self inputs\class\perks\bulletdamage::DMG_InCPostDamaging(args);
			break;
		case "specialty_armorvest":
			self inputs\class\perks\armorvest::DMG_InCPostDamaging(args);
			break;
		//case "perk_knifedmg":
		//	self inputs\class\perks\knifedmg::DMG_InCPostDamaging(args);
		//	break;
		default:
			break;
	}
}


DMG_OnCKilled(args)
{
	foreach (sPerk in self C_ICPERK::CGetAll())
		self OnCKilledCalls(sPerk, args);
	
	if (C_ICDAMAGE::IsEnemy(args))
	{
		foreach (sPerk in args.eAttacker C_ICPERK::CGetAll())
			self OnCKilledCalls(sPerk, args);
	}
}

private OnCKilledCalls(sPerk, args)
{
	switch (sPerk)
	{
		case "perk_enemyhp":
			self inputs\class\perks\enemyhp::DMG_OnCKilled(args);
			break;
		default:
			break;
	}
}