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

#include core\include\_usings;
#include custom\include\_usings;

main()
{
	//level._effect[ "teleport" ] = LoadFX( "misc/teleport" );

	/*thread SearchPorts();
	
	thread HookedPorts();*/
}

BuildPorts(portsQueue)
{
	level._effect[ "teleport" ] = LoadFX( "misc/teleport" );
	eLast = undefined;
	
	foreach (sPort in portsQueue)
	{
		if (sPort == "")
			continue;
			
		ePort = GetEnt(sPort, "targetname");
		IEXCEPTION::EntityExist(ePort, sPort);
		
		if (!IsDefined(eLast))
			eLast = ePort;
		else
		{
			eLast PortInit(ePort);
			eLast = undefined;
		}
	}
}

PortInit(eTarget)
{
	self PlaceSpawnPoint();
	eTrigA = Spawn("trigger_radius", self.origin, 0, 40, 50);
	eTrigA.angles = self.angles;
	self Delete();
	
	eTarget PlaceSpawnPoint();
	eTrigB = Spawn("trigger_radius", eTarget.origin, 0, 40, 50);
	eTrigB.angles = eTarget.angles;
	eTarget Delete();
	
	eTrigA.eTarget = eTrigB;
	eTrigB.eTarget = eTrigA;
	
	eTrigA.fx = SpawnFx(level._effect[ "teleport" ], eTrigA.origin);
	TriggerFX(eTrigA.fx, -15);
	
	eTrigB.fx = SpawnFx(level._effect[ "teleport" ], eTrigB.origin);
	TriggerFX(eTrigB.fx, -15);
	
	eTrigA thread PortMonitor();
	eTrigB thread PortMonitor();
}

PortMonitor()
{
	while (true)
	{
		self waittill("trigger", player);
		
		if (IsDefined(self.iLastUseTime) && (GetTime() - self.iLastUseTime) < 3000)
			continue;
		
		self.eTarget.iLastUseTime = GetTime();
		player thread CTeleport(self.eTarget.origin, self.eTarget.angles);
	}
}

CTeleport(vOrigin, vAngles)
{
	self endon("disconnect");

	self SetOrigin(vOrigin);
	self SetPlayerAngles(vAngles);
	
	self FreezeControls(true);
	wait 0.5;
	self FreezeControls(false);
}
