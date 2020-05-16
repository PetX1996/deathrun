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

InSStarting(args)
{
	level.Corpses = [];
	level.Corpses["allies"] = ILIST::Create();
	level.Corpses["axis"] = ILIST::Create();
}

InCDisconnecting(args)
{
	if (IsDefined(self.eLastCorpse))
		level.Corpses[self.eLastCorpse.sTeam] ILIST::Remove(self.eLastCorpse);
}