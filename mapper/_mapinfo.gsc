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

RegFullName(sFullName)
{
	C_IMAPINFO::SetFullName(sFullName);
}

RegDifficulty(iDifficulty)
{
	IEXCEPTION::Argument(iDifficulty >= 1 && iDifficulty <= 5, "Map difficulty have to be between 1 - 5");
	C_IMAPINFO::SetDifficulty(iDifficulty);
}

RegLength(iLength)
{
	IEXCEPTION::Argument(iLength >= 1 && iLength <= 5, "Map length have to be between 1 - 5");
	C_IMAPINFO::SetLength(iLength);
}

RegCreator(sName, [sFullGuid])
{
	IEXCEPTION::Argument(sName.size < 16, "Enter your valid name(shorter than 16 chars)");
	if (IsDefined(sFullGuid))
		IEXCEPTION::Argument(sFullGuid.size == 32, "Enter your valid 32-chars guid");
		
	C_IMAPINFO::SetCreator(sName, sFullGuid);
}

RegDescription(iLine, sText)
{
	IEXCEPTION::Argument(iLine >= 0 && iLine < C_IMAPINFO::DescriptionLinesCount, "Set iLine between 0 - " + C_IMAPINFO::DescriptionLinesCount);
	C_IMAPINFO::SetDescription(iLine, sText);
}