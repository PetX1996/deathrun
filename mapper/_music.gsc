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

RegAllowed(bAllowed)
{
	C_ISVAR::Set("GLMusicEnabled", bAllowed);
}

RegVictoryMusic(sSoundAlias, sName)
{
	level.MAPPER.VictoryMusic = SpawnStruct();
	level.MAPPER.VictoryMusic.sSoundAlias = sSoundAlias;
	level.MAPPER.VictoryMusic.sName = sName;
}

RegEOGMusic(sSoundAlias, sName)
{
	level.MAPPER.EOGMusic = SpawnStruct();
	level.MAPPER.EOGMusic.sSoundAlias = sSoundAlias;
	level.MAPPER.EOGMusic.sName = sName;
}

CAllow(bAllow)
{}

PlayNow(sSoundAlias, sName)
{
	level.MAPPER.MapMusic = SpawnStruct();
	level.MAPPER.MapMusic.sSoundAlias = sSoundAlias;
	level.MAPPER.MapMusic.sName = sName;
	
	level.MAPPER.MapMusic C_IMUSIC::Music_PlayMapMusic();
}