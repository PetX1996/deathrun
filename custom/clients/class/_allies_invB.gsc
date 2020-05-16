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
	IFX::Register(item.sSprayFX);
}

public ItemInCPreSpawning(item, args)
{
	
}

public ItemOnCSpawned(item, args)
{
	if (C_ISVAR::GetAsBool("CSprayEnabled"))
		self thread WatchSprayBtn(item.sSprayFX);
}

private WatchSprayBtn(sFX)
{
	self endon("disconnect");
	self endon("death");

	while (IsAlive(self))
	{
		wait 0.05;
	
		if (!self FragButtonPressed())
			continue;

		self UseSpray(sFX);
	}
}

private UseSpray(sFX)
{
	vLookVec = self ILOOK::GetPlayerLookVector();
	vLookPos = self ILOOK::GetPlayerViewPos();
	
	vTarget = vLookPos + (vLookVec * 70);
	trace = BulletTrace(vLookPos, vTarget, false, self);
	
	if (trace["fraction"] == 1 
		|| IsDefined(trace["entity"])) //we didnt hit the wall or floor
		return;
		
	vPos = trace["position"] + (vLookVec * -2);
	vHitAngles = VectorToAngles(trace["normal"]);
	vPlayerAngles = VectorToAngles(vLookPos - vPos);

	iDiff = vPlayerAngles[1] - vHitAngles[1]; // moves player's angles to spray's rotation -> angles[3]
	vAngles = (vHitAngles[0], vHitAngles[1], Abs(Sin(vHitAngles[0])) * iDiff); // sin removes rotation on walls
	
	args = IECALLBACK::Args_Create();
	args.bCancel = undefined;
	args.sFX = sFX;
	args.vPos = vPos;
	args.vAngles = vAngles;
	args.vNormal = trace["normal"];
	args.sSurfaceType = trace["surfacetype"];
	
	self C_INIT::SPRAY_RunInCSpraying(args);
	
	if (IsDefined(args.bCancel))
		return;
	
	//args.vAngles = (args.vAngles[0], args.vAngles[1], args.vAngles[2] - 90); // rotates spray...
	PlayFX(IFX::Get(args.sFX), args.vPos, AnglesToForward(args.vAngles), AnglesToUp(args.vAngles));
	self PlaySound("sprayer");

	//self notify("spray", item, position, forward, up); // ch_sprayit
	
	args IECALLBACK::Args_Reset();
	self C_INIT::SPRAY_RunOnCSprayed(args);
	
	wait C_ISVAR::GetAsInt("CSprayTime");
}