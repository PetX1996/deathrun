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

// "classname" "script_brushmodel"
// "target" "auto5"
// "script_landmark" "water"

// "classname" "trigger_multiple"
// "targetname" "auto5"

Main()
{
	level.DrowningWaterTriggers = [];
	
	ents = GetEntArray("script_brushmodel", "classname");
	for (i = 0; i < ents.size; i++)
	{
		if (IsDefined(ents[i].script_landmark) && ents[i].script_landmark == "water")
			WaterInit(ents[i]);
	}
}

// WATER
WaterInit(waterLevel)
{
	waterTriggers = GetEntArray(waterLevel.target, "targetname");
	for (i = 0; i < waterTriggers.size; i++)
		thread WaterMonitor(waterTriggers[i], waterLevel);
}

WaterMonitor(waterTrigger, waterLevel)
{
	level.DrowningWaterTriggers[level.DrowningWaterTriggers.size] = waterTrigger;
	waterTrigger.WaterLevel = waterLevel;
	
	while (true)
	{
		waterTrigger waittill("trigger", player);
		if (player IsPlayerInWater(waterTrigger))
			player thread PlayerDrowningInit(waterTrigger);
	}
}

GetWaterWithPlayer()
{
	for (i = 0; i < level.DrowningWaterTriggers.size; i++)
	{
		if (IsPlayerInWater(level.DrowningWaterTriggers[i]))
			return level.DrowningWaterTriggers[i];
	}
	return undefined;
}

IsPlayerInWater(waterTrigger)
{
	if (!self IsTouching(waterTrigger))
		return false;

	playerViewZ = self GetPlayerViewPos()[2];
	waterLevelZ = waterTrigger.WaterLevel.origin[2];
	return (playerViewZ < waterLevelZ);
}

GetPlayerViewPos()
{
	stance = self GetStance();
	if(stance == "stand") 		
		return self.origin + (0, 0, 60);
	else if(stance == "crouch") 
		return self.origin + (0, 0, 40);
	else 						
		return self.origin + (0, 0, 11);
}

// PLAYER DROWNING
PlayerDrowningInit(waterTrigger)
{
	if (IsDefined(self.IsDrowning))
		return;
		
	self notify("drowingRefresh");
	self.IsDrowning = true;
	self PlayerVisionInit();
	
	monitorResult = self PlayerDrowningMonitor(waterTrigger);
	if (!IsDefined(monitorResult) && IsDefined(self)) // death
		self PlayerDrowningDispose();
}

PlayerDrowningMonitor(waterTrigger)
{
	self endon("disconnect");
	self endon("death");

	startTime = GetTime();
	lastHurtTime = GetTime();
	oxygenTime = 4000;
	hurtDelay = 2000;
	
	while (true)
	{
		if (!self IsPlayerInWater(waterTrigger))
		{
			otherWater = self GetWaterWithPlayer();
			if (IsDefined(otherWater))
				waterTrigger = otherWater;
			else
				break;
		}
	
		if (GetTime() - startTime > oxygenTime
			&& GetTime() - lastHurtTime > hurtDelay)
		{
			self FinishPlayerDamage(self, self, 10, 0, "MOD_TRIGGER_HURT", "none", (0, 0, 0), (0, 0, 0), "none", 0); // TODO: correct?
			lastHurtTime = GetTime();
		}
		
		wait 0.05;
	}
		
	self PlayerDrowningFinish();
	return true;
}

PlayerDrowningFinish()
{
	self endon("drowingRefresh"); // kill PlayerVisionFadeOut()

	self.IsDrowning = undefined;
	self PlayerVisionFadeOut();
	
	if (IsDefined(self) && !IsDefined(self.IsDrowning) && IsDefined(self.WaterVision)) // player may go to water again...
	{
		//self iprintln("PlayerDrowningFinish Destroy()");
		self.WaterVision Destroy();
	}
}

PlayerDrowningDispose()
{
	self.IsDrowning = undefined;
	
	if (IsDefined(self.WaterVision))
	{
		//self iprintln("PlayerDrowningDispose Destroy()");
		self.WaterVision Destroy();
	}
}

// WATER VISION
PlayerVisionInit()
{
	//self iprintln("PlayerVisionInit()");
	//if (IsDefined(self.WaterVision))
		//self.WaterVision Reset();
	if (!IsDefined(self.WaterVision))
	{
		//self iprintln("NewClientHudElem()");
		self.WaterVision = NewClientHudElem(self);
		self.WaterVision.X = 0;
		self.WaterVision.Y = 0;
		self.WaterVision.AlignX = "left";
		self.WaterVision.AlignY = "top";
		self.WaterVision.HorzAlign = "fullscreen";
		self.WaterVision.VertAlign = "fullscreen";
		self.WaterVision.Color = (0.16, 0.38, 0.5);
		self.WaterVision.Alpha = 0;
		self.WaterVision SetShader ("white", 640, 480);
	}
	
	self thread PlayerVisionFadeIn();
}

PlayerVisionFadeIn()
{
	self endon("drowingRefresh");

	time = 0.2;
	self.WaterVision FadeOverTime(time);
	self.WaterVision.Alpha = 0.60;
	wait time;
}

PlayerVisionFadeOut()
{
	//self endon("drowingRefresh");

	//self iprintln("PlayerVisionFadeOut() start");
	time = 3;
	self.WaterVision FadeOverTime(time);
	self.WaterVision.Alpha = 0;
	wait time;
	//self iprintln("PlayerVisionFadeOut() end");
}