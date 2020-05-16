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

GetCount()
{
	return 8;
}

GetItem(iIndex)
{
	switch (iIndex)
	{
		case 0:
			item = C_IMUSIC::GetDefaultItem();
			item.sName = "Eminem - Survival (feat. Liz Rodrigues)";
			item.sSoundAlias = "endmap0";
			return item;
		case 1:
			item = C_IMUSIC::GetDefaultItem();
			item.sName = "Bob Marley - Bad Boys";
			item.sSoundAlias = "endmap1";
			return item;
		case 2:
			item = C_IMUSIC::GetDefaultItem();
			item.sName = "Linkin Park - New Divide";
			item.sSoundAlias = "endmap2";
			return item;
		case 3:
			item = C_IMUSIC::GetDefaultItem();
			item.sName = "Outcast - Hey ya";
			item.sSoundAlias = "endmap3";
			return item;
		case 4:
			item = C_IMUSIC::GetDefaultItem();
			item.sName = "The Animals - The House Of The Rising Sun";
			item.sSoundAlias = "endmap4";
			return item;			
		case 5:
			item = C_IMUSIC::GetDefaultItem();
			item.sName = "The Prodigy - Invaders Must Die";
			item.sSoundAlias = "endmap5";
			return item;
		case 6:
			item = C_IMUSIC::GetDefaultItem();
			item.sName = "Crazy Town - Butterfly";
			item.sSoundAlias = "endmap6";
			return item;
		case 7:
			item = C_IMUSIC::GetDefaultItem();
			item.sName = "Smash Mouth - All Star";
			item.sSoundAlias = "endmap7";
			return item;
		default:
			return undefined;			
	}
}