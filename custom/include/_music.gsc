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

GetDefaultItem()
{
	item = SpawnStruct();
	item.sName = "Unknown music";
	item.sSoundAlias = "null";
	
	return item;
}


public Music_Play()
{
	AmbientStop();
	MusicStop();
	
	//foreach (player in level.players)
		//player StopLocalSound();
		
	AmbientPlay(self.sSoundAlias);
}


public PickVictoryMusic()
{
	args = IECALLBACK::Args_Create();
	args.Music = undefined;
	
	iCount = GetVictoryMusicCount();
	if (iCount > 0)
		args.Music = GetVictoryMusic(RandomInt(iCount));
	
	C_INIT::MUSIC_RunInSPickingVictory(args);
	
	return args.Music;
}

public GetVictoryMusic(iIndex)
{
	return inputs\music\victory::GetItem(iIndex);
}

public GetVictoryMusicCount()
{
	return inputs\music\victory::GetCount();
}


public PickEOGMusic()
{
	args = IECALLBACK::Args_Create();
	args.Music = undefined;
	
	iCount = GetEOGMusicCount();
	if (iCount > 0)
		args.Music = GetEOGMusic(RandomInt(iCount));
	
	C_INIT::MUSIC_RunInSPickingEOG(args);
	
	return args.Music;
}

public GetEOGMusic(iIndex)
{
	return inputs\music\eog::GetItem(iIndex);
}

public GetEOGMusicCount()
{
	return inputs\music\eog::GetCount();
}


public Music_PlayMapMusic()
{
	foreach (p in level.players)
		p SetClientDvar("ui_mainS", self.sName);
		
	self Music_Play();
}