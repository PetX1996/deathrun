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
	return 30;
}

GetItem(iIndex)
{
	switch (iIndex)
	{
		case 0:
			item = C_IMUSIC::GetDefaultItem();
			item.sName = "Lana Del Rey ft. Cedric Gervais - Summertime Sadness";
			item.sSoundAlias = "endround0";
			return item;	
		case 1:
			item = C_IMUSIC::GetDefaultItem();
			item.sName = "Calvin Harris - Summer";
			item.sSoundAlias = "endround1";
			return item;
		case 2:
			item = C_IMUSIC::GetDefaultItem();
			item.sName = "SKRILLEX - Bangarang feat. Sirah";
			item.sSoundAlias = "endround2";
			return item;
		case 3:
			item = C_IMUSIC::GetDefaultItem();
			item.sName = "2 Chainz We Own It ft. Wiz Khalifa";
			item.sSoundAlias = "endround3";
			return item;
		case 4:
			item = C_IMUSIC::GetDefaultItem();
			item.sName = "Calvin Harris - Blame ft. John Newman";
			item.sSoundAlias = "endround4";
			return item;
		case 5:
			item = C_IMUSIC::GetDefaultItem();
			item.sName = "Hardwell ft. Mitch Crown - Call Me A Spaceman";
			item.sSoundAlias = "endround5";
			return item;
		case 6:
			item = C_IMUSIC::GetDefaultItem();
			item.sName = "Tove Lo - Stay High (Habits Remix) ft. Hippie Sabotage";
			item.sSoundAlias = "endround6";
			return item;
		case 7:
			item = C_IMUSIC::GetDefaultItem();
			item.sName = "David Guetta & Showtek - Bad ft. Vassy";
			item.sSoundAlias = "endround7";
			return item;
		case 8:
			item = C_IMUSIC::GetDefaultItem();
			item.sName = "Hard Rock Sofa & Swanky Tunes - Here We Go";
			item.sSoundAlias = "endround8";
			return item;
		case 9:
			item = C_IMUSIC::GetDefaultItem();
			item.sName = "Charli XCX - Boom Clap";
			item.sSoundAlias = "endround9";
			return item;
		case 10:
			item = C_IMUSIC::GetDefaultItem();
			item.sName = "Fall Out Boy - My Songs Know What You Did In The Dark";
			item.sSoundAlias = "endround10";
			return item;
		case 11:
			item = C_IMUSIC::GetDefaultItem();
			item.sName = "Martin Garrix - Animals";
			item.sSoundAlias = "endround11";
			return item;
		case 12:
			item = C_IMUSIC::GetDefaultItem();
			item.sName = "Martin Garrix & Jay-Hardway - Wizard";
			item.sSoundAlias = "endround12";
			return item;
		case 13:
			item = C_IMUSIC::GetDefaultItem();
			item.sName = "Swedish House Mafia - One";
			item.sSoundAlias = "endround13";
			return item;
		case 14:
			item = C_IMUSIC::GetDefaultItem();
			item.sName = "Pendulum - Witchcraft";
			item.sSoundAlias = "endround14";
			return item;
		case 15:
			item = C_IMUSIC::GetDefaultItem();
			item.sName = "David Guetta feat. Skylar Grey - Shot Me Down";
			item.sSoundAlias = "endround15";
			return item;
		case 16:
			item = C_IMUSIC::GetDefaultItem();
			item.sName = "Avicii - Wake Me Up";
			item.sSoundAlias = "endround16";
			return item;
		case 17:
			item = C_IMUSIC::GetDefaultItem();
			item.sName = "Pendulum - Tarantula";
			item.sSoundAlias = "endround17";
			return item;
		case 18:
			item = C_IMUSIC::GetDefaultItem();
			item.sName = "Tiesto - Wasted (feat. Matthew Koma)";
			item.sSoundAlias = "endround18";
			return item;
		case 19:
			item = C_IMUSIC::GetDefaultItem();
			item.sName = "Sia - Chandelier";
			item.sSoundAlias = "endround19";
			return item;
		case 20:
			item = C_IMUSIC::GetDefaultItem();
			item.sName = "Macklemore & Ryan Lewis - Can't Hold Us";
			item.sSoundAlias = "endround20";
			return item;
		case 21:
			item = C_IMUSIC::GetDefaultItem();
			item.sName = "Alesso - Years ft. Matthew Koma";
			item.sSoundAlias = "endround21";
			return item;
		case 22:
			item = C_IMUSIC::GetDefaultItem();
			item.sName = "Madeon - Finale";
			item.sSoundAlias = "endround22";
			return item;
		case 23:
			item = C_IMUSIC::GetDefaultItem();
			item.sName = "The Chainsmokers - Selfie";
			item.sSoundAlias = "endround23";
			return item;
		case 24:
			item = C_IMUSIC::GetDefaultItem();
			item.sName = "Swedish House Mafia - Don't You Worry Child ft. John Martin";
			item.sSoundAlias = "endround24";
			return item;
		case 25:
			item = C_IMUSIC::GetDefaultItem();
			item.sName = "W&W - Moscow";
			item.sSoundAlias = "endround25";
			return item;			
		case 26:
			item = C_IMUSIC::GetDefaultItem();
			item.sName = "Blue Stahli - Accelerant";
			item.sSoundAlias = "endround26";
			return item;	
		case 27:
			item = C_IMUSIC::GetDefaultItem();
			item.sName = "DJ Antoine - This Time (Klaas Remix)";
			item.sSoundAlias = "endround27";
			return item;	
		case 28:
			item = C_IMUSIC::GetDefaultItem();
			item.sName = "All That Remains - Passion";
			item.sSoundAlias = "endround28";
			return item;	
		case 29:
			item = C_IMUSIC::GetDefaultItem();
			item.sName = "Icona Pop - I Love It";
			item.sSoundAlias = "endround29";
			return item;
		default:
			return undefined;			
	}
}