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

InSIniting(args)
{
	level.MAPPER = SpawnStruct();
}

InCPreConnecting(args)
{
	sName = "";
	if (IsDefined(level.MAPPER.MapMusic))
		sName = level.MAPPER.MapMusic.sName;
	
	args.DvarDic IDIC::Add("ui_mainS", sName);
}

MUSIC_InSPickingVictory(args)
{
	if (IsDefined(level.MAPPER) && IsDefined(level.MAPPER.VictoryMusic))
		args.Music = level.MAPPER.VictoryMusic;
}

MUSIC_InSPickingEOG(args)
{
	if (IsDefined(level.MAPPER) && IsDefined(level.MAPPER.EOGMusic))
		args.Music = level.MAPPER.EOGMusic;
}