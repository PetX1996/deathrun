// +========================================================================+
// I                    ___  _____  _____                                   I
// I                   /   !!  __ \!  ___!                                  I
// I                  / /! !! !  \/! !_          ___  ____                  I
// I                 / /_! !! ! __ !  _!        / __!!_  /                  I
// I                 \___  !! !_\ \! !      _  ! (__  / /                   I
// I                     !_/ \____/\_!     (_)  \___!/___!                  I
// I                                                                        I
// I========================================================================I
// I                           mp_dr2_amazing                               I
// I========================================================================I
// I                      mapped by:  R3MIEN, Col!ar      		            I
// I                    scripted by:  PetX                                  I
// I                        website:  www.4GF.cz                            I
// I========================================================================I
// I                           DEATHRUN 2 MOD                               I
// I========================================================================I

#include scripts_4gf\mp_dr2_amazing\traps\_utility;

Main()
{
	TrapActivator(21);
	
	RotateEnt();
}

RotateEnt()
{
	brush = GetEnt("t21_brush", "targetname");
	trig = GetEnt("t21_trig", "targetname");
	
	while (true)
	{
		turns = RandomIntRange(1, 20);
		time = RandomFloatRange(3 + (0.5 * turns), 10 + (0.5 * turns));
		
		velocity = (360 * turns) / time;
		
		thread CentrifugalForce(trig, velocity, time);
		
		dir = 1;
		if (RandomInt(99) % 2)
			dir = -1;
		
		brush RotateYaw(360 * turns * dir, time, time * 0.5, time * 0.5);
		brush waittill("rotatedone");
			
		wait RandomFloat(2);
	}
}

CentrifugalForce(trig, velocityMax, timeTotal)
{
	timeInc = 0.25;

	turns = Int(timeTotal / timeInc);
	
	velocityCur = 0;
	velocityInc = velocityMax / (turns * 0.5);
	
	for (i = 0; i < turns; i++)
	{
		if (i < turns * 0.5)
			velocityCur += velocityInc;
		else
			velocityCur -= velocityInc;
			
		if (velocityCur < 0) 
			velocityCur = 0;
		else if (velocityCur > velocityMax) 
			velocityCur = velocityMax;
			
		damage = Int(velocityCur * 0.3);
		//iprintln("vel: " + velocityCur + "; dmg: " + damage);
		if (i != 0)
			KickPlayersInTrigger(trig, damage);
			
		wait timeInc;
	}
}

KickPlayersInTrigger(trig, damage)
{
	if (damage < 10)
		return;

	players = GetEntArray("player", "classname");
	for (i = 0; i < players.size; i++)
	{
		player = players[i];
		if (player IsTouching(trig))
		{
			player.Health += damage;
			player FinishPlayerDamage(player, player, damage, 0, "MOD_PROJECTILE", "rpg_mp", player.origin, VectorNormalize(player.origin - trig.origin), "none", 0);
		}
	}
}