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
// Script by: PetX, BraXi, mnaauuu, ...
//I========================================================================I

#include core\include\_usings;
#include custom\include\_usings;

OnCSpawned(args)
{
	if (C_ISVAR::GetAsBool("CBHEnabled"))
		self thread BunnyHop();
}

private iMaxLagCount = 1;
private iLagJumpDelay = 5;

private BunnyHop()
{
    self endon("disconnect");
    self endon("death");
		
    wait 2; // this is just to make sure that new players won't spawn and bunny hoop in 1st frame
    
	// lagjump
    vLastPos = self.origin;
	vLastVel = self GetVelocity();
    iAccelsCount = 0;
	iLagsCount = 0;
    // ----- //

	doingBH = false;
	self.BH_iForce = 0;
	
    while (IsAlive(self))
    {
		// lagjump
		if(iAccelsCount > 1 
			&& vLastPos == self.origin
			&& vLastVel == self GetVelocity())
		{
            iLagsCount++;
			self C_IDEBUG::Debug("BH;LagJump;" + iLagsCount);
		}
		else
			iLagsCount = 0;
			
		if (iLagsCount >= iMaxLagCount)
		{
			self C_ICMSG::CPrintLn(C_ILOCALIZE::BHLagJumpDie);
			self Suicide();
		}
		
		vLastPos = self.origin; 
		vLastVel = self GetVelocity();
        wait 0.1;
		// ----- //
		
        stance = self getStance();
        useButton = self useButtonPressed();
        onGround = self isOnGround();
        fraction = bulletTrace( self getEye(), self getEye() + (anglesToForward(self.angles) * 32), true, self )["fraction"];
        
        // Begin
        if (!doingBH && useButton && !onGround && fraction == 1)
        {
            self SetClientDvars("bg_viewKickMax", 0, "bg_viewKickMin", 0, "bg_viewKickRandom", 0, "bg_viewKickScale", 0);
            doingBH = true;
            iAccelsCount = 0;
			
			self RunCallback();
        }

        // Accelerate
        if (doingBH && useButton && onGround && stance != "prone" && fraction == 1)
        {
            iAccelsCount++;
            if (self.BH_iForce < 120)
                self.BH_iForce += 30;
        }

        // Finish
        if (doingBH && (!useButton || stance == "prone" || fraction < 1))
        {
            self SetClientDvars("bg_viewKickMax", 90, "bg_viewKickMin", 5, "bg_viewKickRandom", 0.4, "bg_viewKickScale", 0.2);
            doingBH = false;
            self.BH_iForce = 0;
            iAccelsCount = 0;
            continue;
        }

        // Bounce
        if (self.BH_iForce && doingBH && onGround && fraction == 1)
        {
            bounceFrom = (self.origin - ( anglesToForward( self.angles ) * 50 )) - (0,0,42);
            bounceFrom = vectorNormalize( self.origin - bounceFrom );
            self C_ICDAMAGE::CRepelForce(self.BH_iForce, bounceFrom, true);
            self C_ICDAMAGE::CRepelForce(self.BH_iForce, bounceFrom, true);
			
            wait 0.1;
        }
    }
}

public CGetForce()
{
	return self.BH_iForce;
}

private RunCallback()
{
	args = IECALLBACK::Args_Create();
	self C_INIT::PERK_RunOnCActivatedBunnyHop(args);
}