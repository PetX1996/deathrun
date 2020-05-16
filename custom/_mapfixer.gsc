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
// Mod      : Core
// Website  : http://www.4gf.cz/
//I========================================================================I
// Script by: PetX
//I========================================================================I

#include core\include\_usings;
#include custom\include\_usings;

InSIniting(args)
{
	level.MF = SpawnStruct();

	EntsInit();
	BoxesInit();
	
	level.MF.S_iLastSize = [];
	level.MF.S_iLastSize["allies"] = 0;
	level.MF.S_iLastSize["axis"] = 0;
	level.MF.S_iLastSize["spectator"] = 0;
	
	inputs\mapfixer\mapfixer::InSIniting();
}

InSStarting(args)
{
	thread HurtsMonitor();
	thread CollidesMonitor();
}

private EntsInit()
{
	if (IGAME::IsDev())
	{
		level.MF.Ents = SpawnStruct();
		
		level.MF.Ents.EntsList = [];
	}
	
	EntsSaveOrigin();
}

private EntsSaveOrigin()
{
	ents = GetEntArray();
	foreach (eEnt in ents)
	{
		eEnt.vOrigOrigin = eEnt.origin;
		eEnt.sOrigTargetName = eEnt.targetname;
	}
}

private BoxesInit()
{
	level.MF.Boxes = SpawnStruct();
	
	level.MF.Boxes.Hurts = [];
	level.MF.Boxes.Collides = [];
	level.MF.Boxes.BulletWalls = [];
	//level.MF.Boxes.BulletBools = [];
}

private HurtsMonitor()
{
	wait 1;
	
	while (true)
	{
		HurtsCheck();
		wait 0.05;
	}
}

private HurtsCheck()
{
	foreach (bg in level.MF.Boxes.Hurts)
	{
		foreach (cuboid in bg.Cuboids)
		{
			foreach (pPlayer in level.players)
			{
				if (!IsAlive(pPlayer) || pPlayer.pers["team"] == "spectator")
					continue;
			
				if (IsDefined(bg.sTeam) && pPlayer.pers["team"] != bg.sTeam)
					continue;
			
				if (cuboid ISHAPE::Cuboid_ContainsPoint(pPlayer ILOOK::GetPlayerCenterPos()))
					pPlayer C_ICDAMAGE::CDoDamage(bg.iDmg, undefined, undefined, cuboid.vOrigin, undefined);
			}
		}
	}
}

private CollidesMonitor()
{
	wait 1;
	
	while (true)
	{
		CollidesCheck();
		wait 0.05;
	}
}

private CollidesCheck()
{
	foreach (bg in level.MF.Boxes.Collides)
	{
		foreach (cuboid in bg.Cuboids)
		{
			foreach (pPlayer in level.players)
			{
				if (!IsAlive(pPlayer) || pPlayer.pers["team"] == "spectator")
					continue;
			
				if (IsDefined(bg.sTeam) && pPlayer.pers["team"] != bg.sTeam)
					continue;
			
				if (cuboid ISHAPE::Cuboid_ContainsPoint(pPlayer ILOOK::GetPlayerCenterPos())
					&&
					(!IsDefined(cuboid.InsidePlayers)
					|| !IARRAY::Contains(cuboid.InsidePlayers, pPlayer)))
					pPlayer thread RepelPlayerAway(cuboid);
			}
		}
	}
}

private RepelPlayerAway(cuboid)
{
	if (!IsDefined(cuboid.InsidePlayers))
		cuboid.InsidePlayers = [];

	cuboid.InsidePlayers[cuboid.InsidePlayers.size] = self;
	
	fStrength = Length(self GetVelocity()) / 100;
	vDir = self GetVelocity() * -1;
	iTry = 1;
	
	do
	{
		for (i = 0; i < Max(1, fStrength); i++)
			self C_ICDAMAGE::CRepel(fStrength, vDir);
		
		iTry++;
		if (iTry % 50)
			vDir = (RandomFloat(2) - 1, RandomFloat(2) - 1, 0);
		
		if (iTry > 1000)
		{
			IPrintLnBold("Collide Box error");
			return;
		}
		
		wait 0.05;
	}
	while (IsDefined(self)
		&& IsAlive(self) 
		&& self.pers["team"] != "spectator"
		&& cuboid ISHAPE::Cuboid_ContainsPoint(self ILOOK::GetPlayerCenterPos()));
	
	cuboid.InsidePlayers = IARRAY::Remove(cuboid.InsidePlayers, self);
}

// eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime
DMG_InCPostDamaging(args)
{
	if (C_ICDAMAGE::IsEnemy(args)
		&& IsAlive(self)
		&& C_ICDAMAGE::IsBullet(args))
	{
		vStart = args.eAttacker ILOOK::GetPlayerViewPos();
		vEnd = args.vPoint;
		
		foreach (bg in level.MF.Boxes.BulletWalls)
		{
			foreach (cuboid in bg.Cuboids)
			{
				if (cuboid ISHAPE::Cuboid_IsLineIntersect(vStart, vEnd))
				{
					args.bCancel = true;
					return;
				}
			}
		}
	}
}