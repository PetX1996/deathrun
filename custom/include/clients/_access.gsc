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

public sealed FLAG_GUEST = 1;
public sealed FLAG_MEMBER = 2;
public sealed FLAG_DONATOR = 4;
public sealed FLAG_VIP = 8;
public sealed FLAG_ADMIN = 16;
public sealed FLAG_OWNER = 32;

public sealed FLAG_MAPPER = 64;
public sealed FLAG_DEVELOPER = 128;

/// <summary>
/// Gets player's access level.
/// </summary>
/// <self>Player</self>
/// <returns>Int</returns>
public CGet()
{
	return self.iAccessFlag;
}

public CIs(iFlag)
{
	return self.iAccessFlag & iFlag;
}

/// <summary>
/// Sets player's access level.
/// </summary>
/// <self>Player</self>
/// <param name="value">Int</param>
public CGive(iFlag)
{
	if (!IsDefined(self.iAccessFlag))
		self.iAccessFlag = 0;
		
	self.iAccessFlag |= iFlag;
}

public CTake(iFlag)
{
	self.iAccessFlag &= ~iFlag;
}

public GetFullName(iFlag)
{
	switch (iFlag)
	{
		case FLAG_GUEST:
			return "Guest";
		case FLAG_MEMBER:
			return "Member";
		case FLAG_DONATOR:
			return "Donator";
		case FLAG_VIP:
			return "VIP";
		case FLAG_ADMIN:
			return "Admin";
		case FLAG_OWNER:
			return "Owner";
		case FLAG_MAPPER:
			return "Mapper";
		case FLAG_DEVELOPER:
			return "Developer";
		default:
			IEXCEPTION::ArgumentMsg("Unknown AccessFlag '" + iFlag + "'");
			return undefined;
	}
}

public GetIconName(iFlag)
{
	switch (iFlag)
	{
		case FLAG_GUEST:
			return "";
		case FLAG_MEMBER:
			return "";
		case FLAG_DONATOR:
			return "";
		case FLAG_VIP:
			return "";
		case FLAG_ADMIN:
			return "";
		case FLAG_OWNER:
			return "";
		case FLAG_MAPPER:
			return "";
		case FLAG_DEVELOPER:
			return "";
		default:
			IEXCEPTION::ArgumentMsg("Unknown AccessFlag '" + iFlag + "'");
			return undefined;
	}
}