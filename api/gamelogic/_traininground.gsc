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

/// <summary>
/// Enable/Disable TrainingRound(first round without any activator)
/// </summary>
/// <returns></returns>
/// <param name="bAllow"></param>
RegTrainingRound(bAllow)
{
	C_ISVAR::Set("GLTrainingRoundEnabled", bAllow);
}

/// <summary>
/// TrainingRound(first round without any activator)
/// </summary>
/// <returns></returns>
IsTrainingRoundEnabled()
{
	return C_ISVAR::GetAsBool("GLTrainingRoundEnabled");
}

/// <summary>
/// Duration of the round (minutes)
/// </summary>
/// <returns></returns>
/// <param name="fMinutes"></param>
RegTimeLimit(fMinutes)
{
	C_ISVAR::Set("GLTrainingRoundTimeLimit", fMinutes);
}

/// <summary>
/// Duration of the round (minutes)
/// </summary>
/// <returns>Float - minutes</returns>
GetTimeLimit()
{
	return C_ISVAR::GetAsFloat("GLTrainingRoundTimeLimit");
}

/// <summary>
/// Is current round a TrainingRound?
/// </summary>
/// <returns></returns>
IsTrainingRound()
{
	return C_IGLTYPE::IsTrainingRound();
}