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
/// Enable/Disable FreeRun (game with disabled traps)
/// </summary>
/// <returns></returns>
/// <param name="bAllow"></param>
RegFreeRun(bAllow)
{
	C_ISVAR::Set("GLFreeRunEnabled", bAllow);
}

/// <summary>
/// Enables FreeRun on maps without registered TTs
/// </summary>
/// <returns></returns>
/// <param name="bAllow"></param>
RegWithoutTTs(bAllow)
{
	C_ISVAR::Set("GLFreeRunWithoutTTs", bAllow);
}

/// <summary>
/// Enables FreeRun on maps without registered TTs
/// </summary>
/// <returns></returns>
IsWithoutTTsEnabled()
{
	return C_ISVAR::GetAsBool("GLFreeRunWithoutTTs");
}

/// <summary>
/// FreeRun (game with disabled traps)
/// </summary>
/// <returns></returns>
IsFreeRunEnabled()
{
	return C_ISVAR::GetAsBool("GLFreeRunEnabled");
}

/// <summary>
/// Activators' health
/// </summary>
/// <returns></returns>
/// <param name="iHealth">0 -> don't change</param>
RegAHealth(iHealth)
{
	C_ISVAR::Set("GLFreeRunAHealth", iHealth);
}

/// <summary>
/// Activators' health
/// </summary>
/// <returns>0 -> don't change</returns>
GetAHealth()
{
	return C_ISVAR::GetAsInt("GLFreeRunAHealth");
}

/// <summary>
/// Activators' weapon
/// </summary>
/// <returns></returns>
/// <param name="sWeapon">"" -> don't change</param>
RegAWeapon(sWeapon)
{
	C_ISVAR::Set("GLFreeRunAWeapon", sWeapon);
}

/// <summary>
/// Activators' weapon
/// </summary>
/// <returns>"" -> don't change</returns>
GetAWeapon()
{
	return C_ISVAR::GetAsStr("GLFreeRunAWeapon");
}

/// <summary>
/// Jumpers' health
/// </summary>
/// <returns></returns>
/// <param name="iHealth">0 -> don't change</param>
RegJHealth(iHealth)
{
	C_ISVAR::Set("GLFreeRunJHealth", iHealth);
}

/// <summary>
/// Jumpers' health
/// </summary>
/// <returns>0 -> don't change</returns>
GetJHealth()
{
	return C_ISVAR::GetAsInt("GLFreeRunJHealth");
}

/// <summary>
/// Jumpers' weapon
/// </summary>
/// <returns></returns>
/// <param name="sWeapon">"" -> don't change</param>
RegJWeapon(sWeapon)
{
	C_ISVAR::Set("GLFreeRunJWeapon", sWeapon);
}

/// <summary>
/// Jumpers' weapon
/// </summary>
/// <returns>"" -> don't change</returns>
GetJWeapon()
{
	return C_ISVAR::GetAsStr("GLFreeRunJWeapon");
}

/// <summary>
/// Is current round a FreeRun round?
/// </summary>
/// <returns></returns>
IsFreeRun()
{
	return C_IGLTYPE::IsFreeRun();
}

/// <summary>
/// Starts free run manually
/// </summary>
/// <returns></returns>
StartFreeRun()
{
	if (C_IGLTYPE::IsFreeRun())
		return;

	C_IGLTYPE::StartFreeRun();
}

/// 
RegEvent_OnSStartedFreeRun(dFunc)
{
	IECALLBACK::AddMapEvent("GL_OnSStartedFreeRun", dFunc);
}