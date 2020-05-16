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

public CreateTimer(iSeconds, [sTeam], [sMsg], [iWidth])
{
	iEndTime = GetTime() + (iSeconds * 1000);
	while (GetTime() < iEndTime)
	{
		UpdateHud(sMsg, sTeam, (iEndTime - GetTime()) / 1000, iWidth);
		wait 0.1;
	}
}

public UpdateHud(sText, [sTeam], [iSeconds], [iWidth])
{
	pAlives = ICLIST::GetAllPlayingPlayers(true, sTeam);
	foreach (pAlive in pAlives)
		pAlive CUpdateHud(sText, iSeconds, iWidth);
}

public CUpdateHud(sText, [iSeconds], [iWidth])
{
	if (IsAlive(self) 
		&& IsDefined(self.AliveVars._gameLogicHud) 
		&& self.AliveVars._gameLogicHud == sText)
		return;
		
	self.AliveVars._gameLogicHud = sText;
	
	if (IsDefined(iSeconds))
		self C_ICHUD::SetLowerTextAndTimer(sText, iSeconds, iWidth);
	else
		self C_ICHUD::SetLowerText(sText);
}

public CUpdateHudBindable(sPreText, sKey, sPostText, [iSeconds], [iWidth])
{
	sText = sPreText + sKey + sPostText;
	if (IsAlive(self) 
		&& IsDefined(self.AliveVars._gameLogicHud) 
		&& self.AliveVars._gameLogicHud == sText)
		return;
		
	self.AliveVars._gameLogicHud = sText;
	
	if (IsDefined(iSeconds))
		self C_ICHUD::SetLowerBindableTextAndTimer(sPreText, sKey, sPostText, iSeconds, iWidth);
	else
		self C_ICHUD::SetLowerBindableText(sPreText, sKey, sPostText);
}