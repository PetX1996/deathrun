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

public sealed DescriptionLinesCount = 10;

// set values from mapper
// -> overwrite its from inputs

public GetFullName()
{
	return level.MapInfo.sFullName;
}

public GetDifficulty()
{
	return level.MapInfo.iDifficulty;
}

public GetLength()
{
	return level.MapInfo.iLength;
}

public IsNew()
{
	return level.MapInfo.bIsNew;
}

public GetPopularity()
{
	return level.MapInfo.iPopularity;
}

public GetCreators()
{
	return level.MapInfo.Creators;
}

public GetCreatorsNames()
{
	return GetArrayKeys(level.MapInfo.Creators);
}

public GetDescription(iLine)
{
	return level.MapInfo.DescriptionLines[iLine];
}


public SetFullName(sFullName)
{
	level.MapInfo.sFullName = sFullName;
}

public SetDifficulty(iDifficulty)
{
	level.MapInfo.iDifficulty = iDifficulty;
}

public SetLength(iLength)
{
	level.MapInfo.iLength = iLength;
}

public SetIsNew(bIsNew)
{
	level.MapInfo.bIsNew = bIsNew;
}

public SetPopularity(iPopularity)
{
	level.MapInfo.iPopularity = iPopularity;
}

public SetCreator(sName, [sFullGuid])
{
	if (!IsDefined(sFullGuid))
		sFullGuid = "";
		
	level.MapInfo.Creators[sName] = sFullGuid;
}

public SetDescription(iLine, sText)
{
	level.MapInfo.DescriptionLines[iLine] = sText;
}