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

/*init()
{
	PreCacheShader( "notify_checkpoint" );
	PreCacheShader( "notify_spawn" );
	
	PreCacheShader( "notify_level" );
	PreCacheShader( "notify_leveldown" );
}*/

public CEnable()
{
	self SetClientDvar("ui_hudEnable", 1);
}

public CDisable()
{
	self SetClientDvar("ui_hudEnable", 0);
}

public EnableForAll()
{
	players = ICLIST::GetAllPlayingPlayers();
	foreach (p in players)
		p CEnable();
}

public EnableCompass()
{
	self SetClientDvar("ui_hudCompassEnable", 1);
}
public DisableCompass()
{
	self SetClientDvar("ui_hudCompassEnable", 0);
}

public EnableSpawnInfo()
{
	self SetClientDvar("ui_hudSIEnable", 1);
}

public DisableSpawnInfo()
{
	self SetClientDvar("ui_hudSIEnable", 0);
}

// ================================================================================= //	
// NOTIFY

private iNotifyTime = 5;
private iNotifyDelay = 1;

public CNotify(sTitle, [sMsg], [sImg], [fAspectWidth], [sSound])
{
	self thread CEnqueueNotify(sTitle, sMsg, sImg, fAspectWidth, sSound);
}

private CEnqueueNotify(sTitle, [sMsg], [sImg], [fAspectWidth], [sSound])
{
	self endon("disconnect");
	
	while (IsDefined(self.HUD_iNotifyEnd) 
		&& GetTime() - self.HUD_iNotifyEnd < 0)
		wait (self.HUD_iNotifyEnd - GetTime()) / 1000;
	
	self thread CShowNotify(sTitle, sMsg, sImg, fAspectWidth, sSound);
}

private CShowNotify(sTitle, [sMsg], [sImg], [fAspectWidth], [sSound])
{
	self endon("disconnect");

	if (!IsDefined(sMsg)) sMsg = "";
	if (!IsDefined(sImg)) sImg = "";
	if (!IsDefined(fAspectWidth)) fAspectWidth = 1;
	if (!IsDefined(sSound)) sSound = "mp_challenge_complete";

	self.HUD_iNotifyEnd = GetTime() + (iNotifyTime * 1000) + (iNotifyDelay * 1000);
	
	self SetClientDvars("ui_hudNI", sImg, 
						"ui_hudNW", fAspectWidth,
						"ui_hudNT", sTitle, 
						"ui_hudNM", sMsg);
			
	self PlayLocalSound(sSound);
			
	wait iNotifyTime;
	
	self SetClientDvar("ui_hudNT", "");
}

// ================================================================================================================================================================================================= //	
// PROGRESS BARS
/*
public SetBottomProgressBar(percentage)
{
	if (!IsDefined(percentage))
		return;
		
	if (percentage > 100)
		percentage = 100;

	//self.HUD_BottomProgressBar = percentage;
	self SetClientDvar("hud_progressbar_bottom", percentage);
}

public SetTopProgressBar(percentage, [color], [destroyTime])
{
	if (!IsDefined(color))
	{
		do
			color = RandomInt(8);
		while (IsDefined(self.HUD_TopProgressBarColor) 
			&& color == self.HUD_TopProgressBarColor);
	}
	
	if (percentage > 100)
		percentage = 100;
	
	self.HUD_TopProgressBar = percentage;
	self.HUD_TopProgressBarColor = color;
	self SetClientDvars("hud_progressbar_top", percentage, "hud_progressbar_top_color", color);
	
	if (percentage != 0)
		self thread SetTopProgressBar_DestroyAfterTime(destroyTime);
}

private SetTopProgressBar_DestroyAfterTime(destroyTime)
{
	self endon("disconnect");
	
	self notify("SetTopProgressBar_DestroyAfterTime");
	self endon("SetTopProgressBar_DestroyAfterTime");
	
	if (!IsDefined(destroyTime))
		destroyTime = 5;

	wait destroyTime;
	
	self.HUD_TopProgressBar = undefined;	
	self SetClientDvar("hud_progressbar_top", 0);
}
*/
// ========================================================= //	
// LOWER

private LowerBarColor = (0.5, 0.5, 0.5);
private LowerBarAlpha = 0.5;

private LowerProgressBarColor = (1, 0, 0);
private LowerProgressBarAlpha = 0.3;

public ResetLower()
{
	self.HUD_sLowerText = undefined;
	self.HUD_iLowerTimerEnd = undefined;
	self SetClientDvars("ui_hudLowerT", "", 
		"ui_hudLowerK", "");
		
	if (IsDefined(self.HUD_LowerProgressBar))
	{
		self.HUD_LowerBar.alpha = 0;
		self.HUD_LowerProgressBar.alpha = 0;
	}
	
	self notify("SetLowerText_DestroyAfterTime");
}

public IsLowerActive()
{
	return IsDefined(self.HUD_sLowerText)
		|| (IsDefined(self.HUD_iLowerTimerEnd) && GetTime() < self.HUD_iLowerTimerEnd);
}

public SetLowerText(sText, [iTimeToDestroy], [bDontOverwrite])
{
	if (IsDefined(bDontOverwrite) 
		&& bDontOverwrite
		&& self IsLowerActive())
		return;

	self.HUD_sLowerText = sText;
	self.HUD_iLowerTimerEnd = undefined;
	self SetClientDvars("ui_hudLowerT", sText, 
		"ui_hudLowerK", "");
		
	if (IsDefined(self.HUD_LowerProgressBar))
	{
		self.HUD_LowerBar.alpha = 0;
		self.HUD_LowerProgressBar.alpha = 0;
	}
	
	self notify("SetLowerText_DestroyAfterTime");
	if (IsDefined(iTimeToDestroy))
		self thread SetLowerText_DestroyAfterTime(iTimeToDestroy);
}

public SetLowerBindableText(sPreText, sKey, sPostText, [iTimeToDestroy], [bDontOverwrite])
{
	if (IsDefined(bDontOverwrite) 
		&& bDontOverwrite
		&& self IsLowerActive())
		return;

	self.HUD_sLowerText = sPreText + sKey + sPostText;
	self.HUD_iLowerTimerEnd = undefined;
	self SetClientDvars("ui_hudLowerKT", sPreText, 
		"ui_hudLowerK", sKey, 
		"ui_hudLowerT", sPostText);
		
	if (IsDefined(self.HUD_LowerProgressBar))
	{
		self.HUD_LowerBar.alpha = 0;
		self.HUD_LowerProgressBar.alpha = 0;
	}
	
	self notify("SetLowerText_DestroyAfterTime");
	if (IsDefined(iTimeToDestroy))
		self thread SetLowerText_DestroyAfterTime(iTimeToDestroy);
}

private SetLowerText_DestroyAfterTime(iTime)
{
	self endon("disconnect");
	self endon("SetLowerText_DestroyAfterTime");
	wait iTime;
	
	self ResetLower();
}

public SetLowerTimer(iTime, [iSize], [bDontOverwrite])
{
	self SetLowerTextAndTimer("", iTime, iSize, bDontOverwrite);
}

public SetLowerTextAndTimer(sText, iTime, [iSize], [bDontOverwrite])
{
	if (IsDefined(bDontOverwrite) 
		&& bDontOverwrite
		&& self IsLowerActive())
		return;

	if (!IsDefined(iSize)) iSize = 150;
	
	self.HUD_sLowerText = sText;
	self.HUD_iLowerTimerEnd = GetTime() + (iTime * 1000);
	
	self SetClientDvars("ui_hudLowerT", sText, "ui_hudLowerK", "");
	//self C_ICCMD::Command("setdvartotime ui_hudLowerTime");
	
	
	if (!IsDefined(self.HUD_LowerProgressBar))
		self InitLowerHud();

	self.HUD_LowerBar.alpha = LowerBarAlpha;
	self.HUD_LowerBar.x = (-0.5) * iSize;
	self.HUD_LowerBar SetShader("white", iSize, 14);	
	self.HUD_LowerProgressBar.alpha = LowerProgressBarAlpha;
	self.HUD_LowerProgressBar.x = (-0.5) * iSize;
	self.HUD_LowerProgressBar SetShader("white", iSize, 14);
	self.HUD_LowerProgressBar ScaleOverTime(iTime, 0, 14);


	self notify("SetLowerText_DestroyAfterTime");
	self thread SetLowerText_DestroyAfterTime(iTime);
}

public SetLowerBindableTextAndTimer(sPreText, sKey, sPostText, iTime, [iSize], [bDontOverwrite])
{
	if (IsDefined(bDontOverwrite) 
		&& bDontOverwrite
		&& self IsLowerActive())
		return;

	if (!IsDefined(iSize)) iSize = 150;
	
	self.HUD_sLowerText = sPreText + sKey + sPostText;
	self.HUD_iLowerTimerEnd = GetTime() + (iTime * 1000);
	
	self SetClientDvars("ui_hudLowerKT", sPreText, 
		"ui_hudLowerK", sKey, 
		"ui_hudLowerT", sPostText);
	//self C_ICCMD::Command("setdvartotime ui_hudLowerTime");
	
	
	if (!IsDefined(self.HUD_LowerProgressBar))
		self InitLowerHud();

	self.HUD_LowerBar.alpha = LowerBarAlpha;
	self.HUD_LowerBar.x = (-0.5) * iSize;
	self.HUD_LowerBar SetShader("white", iSize, 14);
	self.HUD_LowerProgressBar.alpha = LowerProgressBarAlpha;
	self.HUD_LowerProgressBar.x = (-0.5) * iSize;
	self.HUD_LowerProgressBar SetShader("white", iSize, 14);
	self.HUD_LowerProgressBar ScaleOverTime(iTime, 0, 14);


	self notify("SetLowerText_DestroyAfterTime");
	self thread SetLowerText_DestroyAfterTime(iTime);
}

private InitLowerHud()
{
	self.HUD_LowerBar = NewClientHudElem(self);
	self.HUD_LowerBar.alignX = "left";
	self.HUD_LowerBar.alignY = "top";
	self.HUD_LowerBar.horzAlign = "center";
	self.HUD_LowerBar.vertAlign = "middle";
	self.HUD_LowerBar.x = 0;
	self.HUD_LowerBar.y = 90;
	self.HUD_LowerBar.sort = -2;
	self.HUD_LowerBar.color = LowerBarColor;
	self.HUD_LowerBar.alpha = 0;
	//self.HUD_LowerBar.foreground = true;
	self.HUD_LowerBar.hidewheninmenu = true;
	self.HUD_LowerBar SetShader("white", 0, 14);

	self.HUD_LowerProgressBar = NewClientHudElem(self);
	self.HUD_LowerProgressBar.alignX = "left";
	self.HUD_LowerProgressBar.alignY = "top";
	self.HUD_LowerProgressBar.horzAlign = "center";
	self.HUD_LowerProgressBar.vertAlign = "middle";
	self.HUD_LowerProgressBar.x = 0;
	self.HUD_LowerProgressBar.y = 90;
	self.HUD_LowerProgressBar.sort = -1;
	self.HUD_LowerProgressBar.color = LowerProgressBarColor;
	self.HUD_LowerProgressBar.alpha = LowerProgressBarAlpha;
	//self.HUD_LowerProgressBar.foreground = true;
	self.HUD_LowerProgressBar.hidewheninmenu = true;
	self.HUD_LowerProgressBar SetShader("white", 0, 14);
}
// ================================================================================================================================================================================================= //	
// HEALTH BAR
/*
SetHealthBar( health )
{
	if( !IsDefined( health ) )
		return;
		
	if( health > 100 )
		health = 100;
	else if( health < 0 )
		health = 0;
		
	self SetClientDvar( "hud_health", health );
}
// ================================================================================================================================================================================================= //	
// SPECIALITY BAR
///
/// Nastaví SPECIALITY bar na urèité percento
///
SetSpecialityBarPercentage( percentage )
{
	if( percentage > 100 )
		percentage = 100;
		
	if( percentage < 0 )
		percentage = 0;
		
	self SetClientDvar( "hud_specBar_P", percentage, "hud_specBar_T", 1 );
}
///
/// Nastaví SPECIALITY bar na urèitý èas
///
SetSpecialityBarTime( time )
{		
	if( time < 0 )
		time = 0;
	
	self SetClientDvars( "hud_specBar_P", time, "hud_specBar_T", 2 );
	self [[level.SendCMD]]( "setdvartotime spec_time" );	
}
///
/// Schová SPECIALITY bar
///
HideSpecialityBar()
{
	self SetClientDvar( "hud_specBar_T", 0 );
}
// ================================================================================================================================================================================================= //	
// INVENTORY & PERKS
SetPerkInfo( index, material )
{
	self.HUD_BottomBarDvars["hud_Perk"+index+"M"] = material;
}

SetInventoryInfo( index, material, ammo )
{
	if( IsDefined( ammo ) && ammo == 0 )
		ammo = "^1"+ammo;
	else if( !IsDefined( ammo ) )
		ammo = "";

	if( !IsDefined( material ) && IsDefined( ammo ) )
	{
		self.HUD_BottomBarDvars["hud_Inv"+index+"T"] = ammo;
		self SetClientDvar( "hud_Inv"+index+"T", ammo );
		return;
	}
	else
	{
		self.HUD_BottomBarDvars["hud_Inv"+index+"M"] = material;	
		self.HUD_BottomBarDvars["hud_Inv"+index+"T"] = ammo;
	}
	
	if( self.reallyAlive )
		self UpdateBottomBar();
}

SetThirdPerkButtonInfo( enabled )
{
	self.HUD_BottomBarDvars["hud_Perk3BTN"] = enabled;
}

UpdateBottomBar()
{
	if( IsDefined( self.HUD_BottomBarDvars ) )
		self [[level.SendCvar]]( self.HUD_BottomBarDvars );
}

ShowShop()
{
	self SetClientDvar( "hud_shop", 1 );
}
HideShop()
{
	self SetClientDvar( "hud_shop", 0 );
}*/

public CSetHealthBar(iCurHealth, [iMaxHealth])
{
	if (!IsDefined(iMaxHealth))
		iMaxHealth = self.MaxHealth;
		
	self SetClientDvars("ui_hudSIHealth", iCurHealth, "ui_hudSIHealthMax", iMaxHealth);
}

public SetRoundsInfo(curRound, maxRounds)
{
	self SetClientDvars("ui_hudRoundCur", curRound, "ui_hudRoundMax", maxRounds);
}

public SetLifesCount(iCount)
{
	self SetClientDvar("ui_hudSILifes", iCount);
}