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
// Mod      : Core
// Website  : http://www.4gf.cz/
//I========================================================================I
// Script by: PetX
//I========================================================================I

#include core\include\_usings;

public InitPersStat(sDataName, [iInitValue])
{
	if (!IsDefined(iInitValue))
		iInitValue = 0;

	if (!IsDefined(self.pers[sDataName]))
		self.pers[sDataName] = iInitValue;
		
	switch (ToLower(sDataName))
	{
		case "score":
			self.Score = self.pers[sDataName];
			break;
		case "kills":
			self.Kills = self.pers[sDataName];
			break;
		case "assists":
			self.Assists = self.pers[sDataName];
			break;
		case "deaths":
			self.Deaths = self.pers[sDataName];
			break;
		default:
			break;
	}
}

public GetPersStat(sDataName)
{
	return self.pers[sDataName];
}

public SetPersStat(sDataName, iValue)
{
	self.pers[sDataName] = iValue;
	self ICSTAT::SetByName(sDataName, iValue);
	
	switch (ToLower(sDataName))
	{
		case "score":
			self.Score = iValue;
			break;
		case "kills":
			self.Kills = iValue;
			break;
		case "assists":
			self.Assists = iValue;
			break;
		case "deaths":
			self.Deaths = iValue;
			break;
		default:
			break;
	}
}

public IncPersStat(sDataName, [iInc])
{
	if (!IsDefined(iInc)) iInc = 1;

	iValue = self GetPersStat(sDataName) + iInc;
	self SetPersStat(sDataName, iValue);
}