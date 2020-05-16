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

#include custom\include\_usings;
#include core\include\_usings;

InSIniting(args)
{
	level.ServerInfo = SpawnStruct();
	level.ServerInfo.DescriptionLines = [];
	level.ServerInfo.sShortName = "";
	level.ServerInfo.sFullName = "";
	
	for (i = 0; i < C_ISVINFO::DescriptionLinesCount; i++)
		level.ServerInfo.DescriptionLines[i] = "";	

	//C_ISVINFO::UpdateServerShortName();
	//C_ISVINFO::UpdateServerFullName();
	
	thread KeepNamesActual();
}

private KeepNamesActual()
{
	wait 0.05;
	
	while (true)
	{
		if (IsAnyNamesUpdated())
		{
			foreach (p in level.players)
				p SetClientDvar("ui_mainSV", C_ISVINFO::GetServerShortName());
				
			SetDvar("sv_hostname", C_ISVINFO::GetServerFullName());
		}
			
		wait 5;
	}
}

private IsAnyNamesUpdated()
{
	bAnyUpdate = false;
	
	if (C_ISVINFO::UpdateServerShortName())
		bAnyUpdate = true;
		
	if (C_ISVINFO::UpdateServerFullName())
		bAnyUpdate = true;	

	return bAnyUpdate;
}

InSStarting(args)
{
	inputs\info\info::BuildServerInfo();
}

InCPreConnecting(args)
{
	if (!self C_ICPLAYER::CIsFirstPlayedRound())
		return;

	// server
	args.DvarDic IDIC::Add("ui_mainSV", C_ISVINFO::GetServerShortName());
	
	for (i = 0; i < level.ServerInfo.DescriptionLines.size; i++)
		args.DvarDic IDIC::Add("ui_mainSV_" + i, level.ServerInfo.DescriptionLines[i]);
}