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

IsPREWaitting([sTeam])
{
	return C_IGLSTATE::IsPREWaitting(sTeam);
}

IsPREStarting([sTeam])
{
	return C_IGLSTATE::IsPREStarting(sTeam);
}

IsINStarted([sTeam])
{
	return C_IGLSTATE::IsINStarted(sTeam);
}

IsINReleased([sTeam])
{
	return C_IGLSTATE::IsINReleased(sTeam);
}

IsPOSTDeciding([sTeam])
{
	return C_IGLSTATE::IsPOSTDeciding(sTeam);
}

IsPOSTEnding([sTeam])
{
	return C_IGLSTATE::IsPOSTEnding(sTeam);
}

GetPREWaittingTime([sTeam])
{
	return C_IGLSTATE::GetPREWaittingTime(sTeam);
}

GetPREStartingTime([sTeam])
{
	return C_IGLSTATE::GetPREStartingTime(sTeam);
}

GetINStartedTime([sTeam])
{
	return C_IGLSTATE::GetINStartedTime(sTeam);
}

GetINReleasedTime([sTeam])
{
	return C_IGLSTATE::GetINReleasedTime(sTeam);
}

GetPOSTDecidingTime([sTeam])
{
	return C_IGLSTATE::GetPOSTDecidingTime(sTeam);
}

GetPOSTEndingTime([sTeam])
{
	return C_IGLSTATE::GetPOSTEndingTime(sTeam);
}