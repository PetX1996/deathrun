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

OnCConnected(args)
{
	self thread CheckButtons();
}

private CheckButtons()
{
	wait 0.05;

	bAttack = false;
	bUse = false;
	bMelee = false;
	bFrag = false;
	bSecondaryFrag = false;
	
	while (IsDefined(self))
	{
		if (self AttackButtonPressed())
		{
			if (!bAttack)
				self CPressedAttack();
			
			self CHeldAttack();
			bAttack = true;
		}
		else
			bAttack = false;
			
		if (self UseButtonPressed())
		{
			if (!bUse)
				self CPressedUse();
			
			self CHeldUse();
			bUse = true;
		}
		else
			bUse = false;
			
		if (self MeleeButtonPressed())
		{
			if (!bMelee)
				self CPressedMelee();
			
			self CHeldMelee();
			bMelee = true;
		}
		else
			bMelee = false;
		
		if (self FragButtonPressed())
		{
			if (!bFrag)
				self CPressedFrag();
			
			self CHeldFrag();
			bFrag = true;			
		}
		else
			bFrag = false;
			
		if (self SecondaryOffhandButtonPressed())
		{
			if (!bSecondaryFrag)
				self CPressedSecondaryFrag();
			
			self CHeldSecondaryFrag();
			bSecondaryFrag = true;			
		}
		else
			bSecondaryFrag = false;
		
		wait 0.05;
	}
}

private CPressedAttack()
{
	args = IECALLBACK::Args_Create();
	self C_INIT::BTN_RunOnCPressedAttack(args);
}

private CHeldAttack()
{
	args = IECALLBACK::Args_Create();
	self C_INIT::BTN_RunOnCHeldAttack(args);
}

private CPressedUse()
{
	args = IECALLBACK::Args_Create();
	self C_INIT::BTN_RunOnCPressedUse(args);
}

private CHeldUse()
{
	args = IECALLBACK::Args_Create();
	self C_INIT::BTN_RunOnCHeldUse(args);
}

private CPressedMelee()
{
	args = IECALLBACK::Args_Create();
	self C_INIT::BTN_RunOnCPressedMelee(args);
}

private CHeldMelee()
{
	args = IECALLBACK::Args_Create();
	self C_INIT::BTN_RunOnCHeldMelee(args);
}

private CPressedFrag()
{
	args = IECALLBACK::Args_Create();
	self C_INIT::BTN_RunOnCPressedFrag(args);
}

private CHeldFrag()
{
	args = IECALLBACK::Args_Create();
	self C_INIT::BTN_RunOnCHeldFrag(args);
}

private CPressedSecondaryFrag()
{
	args = IECALLBACK::Args_Create();
	self C_INIT::BTN_RunOnCPressedSecondaryFrag(args);
}

private CHeldSecondaryFrag()
{
	args = IECALLBACK::Args_Create();
	self C_INIT::BTN_RunOnCHeldSecondaryFrag(args);
}