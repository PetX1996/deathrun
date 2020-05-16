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

public GetGroundForPoint(vStart, [ignoreEnts])
{
	vEnd = vStart + (0, 0, -100000);
	trace = BulletTraceMultipleEnts(vStart, vEnd, false, ignoreEnts);
	return trace["position"];
}

public GetPointForDropCylinder(origin, radius)
{
	IEXCEPTION::NotImplemented();
}

public GetPointForDropCuboid(origin, measurement)
{
	IEXCEPTION::NotImplemented();
}

public GetPointForDropPlayer()
{
	IEXCEPTION::NotImplemented();
}



public DropPoint(point, [offsetZ], [dropSpeed])
{
	IEXCEPTION::NotImplemented();
}

public DropCylinder(origin, radius, [offsetZ], [dropSpeed])
{
	IEXCEPTION::NotImplemented();
}

public DropCuboid(origin, measurement, [offsetZ], [dropSpeed])
{
	IEXCEPTION::NotImplemented();
}

public DropPlayer(player, [offsetZ], [dropSpeed])
{
	IEXCEPTION::NotImplemented();
}



public KickPlayer(strength, direction)
{
	IEXCEPTION::NotImplemented();
}

/*
REPEL_Kick( strength, direction )
{
	if( strength > 1 )
		strength = 1;
		
	dmg = Int( 200*strength );
	self.Health += dmg;
	self FinishPlayerDamage( self, self, dmg, 0, "MOD_PROJECTILE", "rpg_mp", self.origin, direction, "none", 0 );
}
*/

/*
/// PHYSIC_DropToGround( addOffsetZ )

#include scripts\include\_math;

///
///	Pustí predmet vo¾ným pádom na zem.
///
PHYSIC_DropToGround( addOffsetZ )
{
	trace = BulletTrace( self.origin, self.origin+(0,0,-100000), false, self );
	
	if( IsDefined( trace ) && IsDefined( trace["position"] ) )
	{
		if( !IsDefined( addOffsetZ ) )
			addOffsetZ = 0;

		self.origin = trace["position"] + ( 0, 0, addOffsetZ );
	}
}*/


/// <summary>
/// Supports multiple entities.
/// </summary>
/// <returns>Trace[]</returns>
/// <param name="vStart">Vector</param>
/// <param name="vEnd">Vector</param>
/// <param name="bHitCharacters">Bool</param>
/// <param name="ignoreEnts">Entity[]</param>
public BulletTraceMultipleEnts(vStart, vEnd, [bHitCharacters], [ignoreEnts])
{
	if (!IsDefined(bHitCharacters)) bHitCharacters = true;

	if (!IsDefined(ignoreEnts) || ignoreEnts.size == 0)
		return BulletTrace(vStart, vEnd, bHitCharacters, undefined);
	else if (ignoreEnts.size == 1)
		return BulletTrace(vStart, vEnd, bHitCharacters, ignoreEnts[0]);

	trace = undefined;
	vLastPoint = vStart;
	
	foreach (curEnt in ignoreEnts)
	{
		trace = BulletTrace(vLastPoint, vEnd, bHitCharacters, curEnt);
		if (trace["fraction"] == 1)
			break;
			
		vLastPoint = trace["position"];
	}	
	
	trace["fraction"] = Distance(trace["position"], vEnd) / Distance(vStart, vEnd);
	return trace;
}