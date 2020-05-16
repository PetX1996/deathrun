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

public GetCorpsesList([sTeam])
{
	if (!IsDefined(sTeam))
	{
		list = level.Corpses["allies"] ILIST::CreateCopy();
		list ILIST::AddList(level.Corpses["axis"]);
		return list;
	}
	else
		return level.Corpses[sTeam] ILIST::CreateCopy();
}

private CAddCorpseToList(sTeam, eBody)
{
	if (IsDefined(self.eLastCorpse))
	{
		level.Corpses[self.eLastCorpse.sTeam] ILIST::Remove(self.eLastCorpse);
		self.eLastCorpse Delete();
	}
	
	level.Corpses[sTeam] ILIST::Add(eBody);
		
	self.eLastCorpse = eBody;
	self.eLastCorpse.sTeam = sTeam;
}

/// <summary>
/// 
/// </summary>
/// <self>Player</self>
/// <returns>eBody</returns>
/// <param name="args">Args from 'PlayerKilled' callback</param>
public CPlaceCorpse(killedArgs)
{
	// ============================================================================================================================================================================================= //	
	// callbacks and modify
	args = IECALLBACK::Args_Create();
	args.killedArgs = killedArgs;
	args.fExplosionForce = 0.75;
	args.fExplosionRadius = 40;
	args.bCancel = undefined;
	
	self C_INIT::DMG_RunInCPlacingCorpse(args);
	// ============================================================================================================================================================================================= //	
	
	if (IsDefined(args.bCancel))
		return undefined;
	
	body = self ClonePlayer(args.killedArgs.deathAnimDuration);
	body.vDieOrigin = body.origin; // in some cases corpse falls throught solid

	if (self IsOnLadder() || self IsMantling())
		body StartRagdoll();
	
	//body thread EDelayStartRagdoll(args);

	self CAddCorpseToList(self.pers["team"], body);
	
	args IECALLBACK::Args_Reset();
	args.eBody = body;
	self C_INIT::DMG_RunOnCPlacedCorpse(args);
	
	return body;
}

public EGetCorpseDieOrigin()
{
	return self.vDieOrigin;
}

/*private EDelayStartRagdoll(args)
{
	deathAnim = self GetCorpseAnim();
	if (AnimHasNoteTrack(deathAnim, "ignore_ragdoll"))
		return;

	wait 0.05;
		
	vDir = args.killedArgs.vDir;
	if (!IsDefined(vDir))
		vDir = (0, 0, 0);

	vExplosionPos = self.origin + (0, 0, C_ICDAMAGE::GetHitLocHeight(args.killedArgs.sHitLoc));
	vExplosionPos -= vDir * 20;

	// body drops to the ground normally,
	// but on some surfaces body.origin says, that the body drops on the skybox 
	self StartRagdoll(1);

	wait 0.05;

	if (IsDefined(self))
		PhysicsExplosionSphere(vExplosionPos, args.fExplosionRadius, args.fExplosionRadius * 0.5, args.fExplosionForce);
}*/