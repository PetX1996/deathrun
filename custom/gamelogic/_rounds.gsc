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
	if (!IsDefined(game["roundsPlayed"]))
		game["roundsPlayed"] = 0;
}

InCPreConnecting(args)
{
	if (!IsDefined(self.pers["RoundsPlayed"])) 
		self.pers["RoundsPlayed"] = 0;
		
	self.pers["RoundsPlayed"]++;
	
	args.DvarDic IDIC::Add("ui_hudLRoundCur", C_IGLROUNDS::Get());
	args.DvarDic IDIC::Add("ui_hudLRoundMax", C_IGLROUNDS::GetLimit());
}