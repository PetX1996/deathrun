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

public CPrintLn(sText, [sArg0], [sArg1], [sArg2], [sArg3], [sArg4])
{
	if (IsDefined(sArg0) && IsDefined(sArg1) && IsDefined(sArg2) && IsDefined(sArg3) && IsDefined(sArg4))
		self IPrintLn("^3[DR] ^7" + sText, sArg0, sArg1, sArg2, sArg3, sArg4);
	else if (IsDefined(sArg0) && IsDefined(sArg1) && IsDefined(sArg2) && IsDefined(sArg3))
		self IPrintLn("^3[DR] ^7" + sText, sArg0, sArg1, sArg2, sArg3);
	else if (IsDefined(sArg0) && IsDefined(sArg1) && IsDefined(sArg2))
		self IPrintLn("^3[DR] ^7" + sText, sArg0, sArg1, sArg2);
	else if (IsDefined(sArg0) && IsDefined(sArg1))
		self IPrintLn("^3[DR] ^7" + sText, sArg0, sArg1);
	else if (IsDefined(sArg0))
		self IPrintLn("^3[DR] ^7" + sText, sArg0);
	else
		self IPrintLn("^3[DR] ^7" + sText);
}

public CPrintLnBold(sText, [sArg0], [sArg1], [sArg2], [sArg3], [sArg4])
{
	if (IsDefined(sArg0) && IsDefined(sArg1) && IsDefined(sArg2) && IsDefined(sArg3) && IsDefined(sArg4))
		self IPrintLnBold(sText, sArg0, sArg1, sArg2, sArg3, sArg4);
	else if (IsDefined(sArg0) && IsDefined(sArg1) && IsDefined(sArg2) && IsDefined(sArg3))
		self IPrintLnBold(sText, sArg0, sArg1, sArg2, sArg3);
	else if (IsDefined(sArg0) && IsDefined(sArg1) && IsDefined(sArg2))
		self IPrintLnBold(sText, sArg0, sArg1, sArg2);
	else if (IsDefined(sArg0) && IsDefined(sArg1))
		self IPrintLnBold(sText, sArg0, sArg1);
	else if (IsDefined(sArg0))
		self IPrintLnBold(sText, sArg0);
	else
		self IPrintLnBold(sText);
}

public SPrintLn(sText, [sArg0], [sArg1], [sArg2], [sArg3], [sArg4])
{
	if (IsDefined(sArg0) && IsDefined(sArg1) && IsDefined(sArg2) && IsDefined(sArg3) && IsDefined(sArg4))
		IPrintLn("^3[DR] ^7" + sText, sArg0, sArg1, sArg2, sArg3, sArg4);
	else if (IsDefined(sArg0) && IsDefined(sArg1) && IsDefined(sArg2) && IsDefined(sArg3))
		IPrintLn("^3[DR] ^7" + sText, sArg0, sArg1, sArg2, sArg3);
	else if (IsDefined(sArg0) && IsDefined(sArg1) && IsDefined(sArg2))
		IPrintLn("^3[DR] ^7" + sText, sArg0, sArg1, sArg2);
	else if (IsDefined(sArg0) && IsDefined(sArg1))
		IPrintLn("^3[DR] ^7" + sText, sArg0, sArg1);
	else if (IsDefined(sArg0))
		IPrintLn("^3[DR] ^7" + sText, sArg0);
	else
		IPrintLn("^3[DR] ^7" + sText);
}

public SPrintLnBold(sText, [sArg0], [sArg1], [sArg2], [sArg3], [sArg4])
{
	if (IsDefined(sArg0) && IsDefined(sArg1) && IsDefined(sArg2) && IsDefined(sArg3) && IsDefined(sArg4))
		IPrintLnBold(sText, sArg0, sArg1, sArg2, sArg3, sArg4);
	else if (IsDefined(sArg0) && IsDefined(sArg1) && IsDefined(sArg2) && IsDefined(sArg3))
		IPrintLnBold(sText, sArg0, sArg1, sArg2, sArg3);
	else if (IsDefined(sArg0) && IsDefined(sArg1) && IsDefined(sArg2))
		IPrintLnBold(sText, sArg0, sArg1, sArg2);
	else if (IsDefined(sArg0) && IsDefined(sArg1))
		IPrintLnBold(sText, sArg0, sArg1);
	else if (IsDefined(sArg0))
		IPrintLnBold(sText, sArg0);
	else
		IPrintLnBold(sText);
}

public CNotify(sTitle, [sMsg], [sImg], [fAspectWidth], [sSound])
{
	self C_ICHUD::CNotify(sTitle, sMsg, sImg, fAspectWidth, sSound);
}