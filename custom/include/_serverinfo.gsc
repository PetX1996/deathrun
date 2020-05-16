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

public sealed DescriptionLinesCount = 13;

public SetDescription(iLine, sText)
{
	IEXCEPTION::Argument(iLine >= 0 && iLine < DescriptionLinesCount, "There is only " + DescriptionLinesCount + " lines for server info!");

	level.ServerInfo.DescriptionLines[iLine] = sText;
}


public UpdateServerShortName()
{
	sPattern = C_ISVAR::GetAsStr("SVShortName");
	sNew = ISTRING::Format(sPattern, ::GetVarValue);
	if (sNew != level.ServerInfo.sShortName)
	{
		level.ServerInfo.sShortName = sNew;
		return true;
	}
	return false;
}

public GetServerShortName()
{
	return level.ServerInfo.sShortName;
}


public UpdateServerFullName()
{
	sPattern = C_ISVAR::GetAsStr("SVFullName");
	sNew = ISTRING::Format(sPattern, ::GetVarValue);
	if (sNew != level.ServerInfo.sFullName)
	{
		level.ServerInfo.sFullName = sNew;
		return true;
	}
	return false;
}

public GetServerFullName()
{
	return level.ServerInfo.sFullName;
}

// ==================================================================================================== //
#region Generic HostName

private GetVarValue(sName, args)
{
	switch (sName)
	{
		case "CurRound":
			return C_IGLROUNDS::Get();
		case "MaxRound":
			return C_IGLROUNDS::GetLimit();
		case "ModVersion":
			return C_INIT::ModVersion;
		case "ModBuild":
			return C_INIT::ModBuild;
		case "ModFullVersion":
			return C_INIT::ModFullVersion;
		case "MapName":
			return IGAME::GetMap();
		case "MapFullName":
			return C_IMAPINFO::GetFullName();
		case "Activator":
			activs = ICLIST::GetAllAxis();
			
			if (activs.size == 0)
				return "N/A";
			
			activNames = [];
			foreach (pActiv in activs)
				activNames[activNames.size] = pActiv.name;
				
			return ISTRING::Join("^7, ", activNames);
		case "BestPlayer":
			iMax = 0;
			pMax = undefined;
			foreach (pPlayer in level.players)
			{
				if (pPlayer.pers["score"] > iMax)
				{
					iMax = pPlayer.pers["score"];
					pMax = pPlayer;
				}
			}
			
			if (!IsDefined(pMax))
				return "N/A";
				
			return pMax.name;
		default:
			return undefined;
	}
}

#endregion
// ==================================================================================================== //