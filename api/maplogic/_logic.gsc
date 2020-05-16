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

/*

DR v2										| DR 0 - 1.2									| ORIGINAL
[classname]				 		[targetname]|[classname]						[targetname]|[classname]					[targetname]
--------------------------------------------------------------------------------------------------------------------------------------------------
dr2_spawn_jumper	 						|mp_jumper_spawn								|mp_dm_spawn					
--------------------------------------------------------------------------------------------------------------------------------------------------
dr2_spawn_activator	 						|mp_activator_spawn								|mp_tdm_spawn					
--------------------------------------------------------------------------------------------------------------------------------------------------
dr2_spawn_spectator	 						|												|mp_global_intermission		
--------------------------------------------------------------------------------------------------------------------------------------------------
trigger_multiple			    dr2_t_endmap|trigger_multiple?					 endmap_trig|
trigger_radius								|												|
trigger_use
trigger_use_touch							|												|
trigger_damage								|												|
--------------------------------------------------------------------------------------------------------------------------------------------------
// I = {0, 1, 2, ..., n}					|												|
trigger_multiple					 dr2_t_I|trigger_use_touch?								|
trigger_radius								|												|
trigger_use
trigger_use_touch							|												|
trigger_damage								|												|
--------------------------------------------------------------------------------------------------------------------------------------------------
// [OPTIONAL] ; I = {0, 1, 2, ..., n}		|												|
trigger_multiple			  dr2_t_I.target| 												|
trigger_radius						dr2_t_tj|												|
trigger_use
trigger_use_touch							|												|
trigger_damage								|												|

*/

// registering triggers
// different choices
/*

// -------------------------------------------------------------------------------------- //
// There are only 3 TT triggers. -> WITHOUT SCRIPT-REGISTERING
// 1. Place to the map 3 triggers with targetnames 'dr2_t_0', 'dr2_t_1', 'dr2_t_2'

TT 0
|       
TT 1
|
TT 2



// -------------------------------------------------------------------------------------- //
// There are only 3 TT triggers.

TT 0
|       
TT 1
|
TT 2

	RegTT("t0");
	RegTT("t1");
	RegTT("t2");

// -------------------------------------------------------------------------------------- //
// There are 4 TT and 3 TJ triggers.
// 1. Every TJ trigger is connected with its TT by 'W' in radiant (first TT, then TJ).
// 3. Every TJ without any TT is connected with previous TJ (first previous TJ, then current TJ).

TT 0 -> TJ 0
|       |
TT 1 -> TJ 1
|		|
|		TJW 1
|		|
TT 2 -> TJ 2
|
TT 3

	RegTT("t0");
	RegTT("t1");
	RegTT("t2");
	RegTT("t3");
	
// -------------------------------------------------------------------------------------- //
// There are 4 TT and 3 TJ triggers. -> WITHOUT SCRIPT-REGISTERING
// 1. Place to the map 4 triggers with targetnames 'dr2_t_0', 'dr2_t_1', 'dr2_t_2', 'dr2_t_3'
// 2. Every TJ trigger is connected with its TT by 'W' in radiant (first TT, then TJ).

TT 0 -> TJ 0
|       |
TT 1	|
|		|
TT 2 -> TJ 2
|		|
TT 3 -> TJ 3

// -------------------------------------------------------------------------------------- //
// There are 4 TT and 3 TJ with targetnames. -> NOT CONNECTED!
// You have to call first RegTT() and then RegTJ()!

TT 0 -> TJ 0
|       |
TT 1 -> TJ 1
|		|
TT 2	|
|		|
TT 3 -> TJ 3

	RegTT("t0");
	RegTJ("tj0");
	RegTT("t1");
	RegTJ("tj1");
	RegTT("t2");
	RegTT("t3");
	RegTJ("tj3");
	
// -------------------------------------------------------------------------------------- //
// There are 4 TT and 7 TJ triggers. -> WITHOUT SCRIPT-REGISTERING
// 1. Place to the map 4 triggers with targetnames 'dr2_t_0', 'dr2_t_1', 'dr2_t_2', 'dr_t_3'
// 2. Every TJ trigger is connected with its TT by 'W' in radiant (first TT, then TJ).
// 3. Every TJ without any TT is connected with previous TJ (first previous TJ, then current TJ).
// 4. If you need TJ at the start, where is not any TT yet, create trigger with targetname 'dr2_t_tj'

		TJW 0 (dr2_t_tj)
		|	
TT 0 -> TJ 0
|       |
TT 1 -> TJ 1
|       |
TT 2 -> TJ 2
|		|
|		TJW 2
|		|
TT 3 -> TJ 3
		|
		TJW 3

// -------------------------------------------------------------------------------------- //
// There are 3 TT with targetnames and 3 TJ with targetnames. -> NOT CONNECTED!
// There are also 2 TJ, which are not assigned to any trap. -> only for jumpers

TT 0 -> TJ 0
|       |
TT 1 -> TJ 1
|		|
|		TJW 1
|		|
TT 2 -> TJ 2
		|
		TJW 2

	RegTT("t0");
	RegTJ("tj0");
	RegTT("t1");
	RegTJ("tj1");
	RegTJWithoutTT("tjw1");
	RegTT("t2");
	RegTJ("tj2");
	RegTJWithoutTT("tjw2");
// -------------------------------------------------------------------------------------- //

*/

// ================================================================================== //
#region Regging

public RegTT(sTargetName)
{
	eTT = GetEnt(sTargetName, "targetname");
	IEXCEPTION::EntityExist(eTT, "MAPLOGIC - Could not find TT with targetname '" + sTargetName + "'");
	
	C_IMLLOGIC::RegTT(eTT, C_IMLLOGIC::iPriorMapScript);
	
	eTJ = C_IMLLOGIC::GetConnectedTJ(eTT);
	if (IsDefined(eTJ))
	{
		C_IMLLOGIC::RegTJ(eTJ, C_IMLLOGIC::iPriorMapScript);
		C_IMLLOGIC::RegConnectedTJsWithoutTT(eTJ, C_IMLLOGIC::iPriorMapScript);
	}
}

public RegTJ(sTargetName)
{
	eTJ = GetEnt(sTargetName, "targetname");
	IEXCEPTION::EntityExist(eTJ, "MAPLOGIC - Could not find TJ with targetname '" + sTargetName + "'");
	
	C_IMLLOGIC::RegTJ(eTJ, C_IMLLOGIC::iPriorMapScript);
}

public RegTJWithoutTT(sTargetName)
{
	eTJ = GetEnt(sTargetName, "targetname");
	IEXCEPTION::EntityExist(eTJ, "MAPLOGIC - Could not find TJ with targetname '" + sTargetName + "'");
	
	C_IMLLOGIC::RegTJWithoutTT(eTJ, C_IMLLOGIC::iPriorMapScript);
}

public RegEM(sTargetName)
{
	eEM = GetEnt(sTargetName, "targetname");
	IEXCEPTION::EntityExist(eEM, "MAPLOGIC - Could not find EM with targetname '" + sTargetName + "'");
	
	C_IMLLOGIC::RegEM(eEM, C_IMLLOGIC::iPriorMapScript);
}

#endregion
// ================================================================================== //

public TT_GetIndexInList()
{
	return self C_IMLLOGIC::TT_GetIndexInList();
}

public TJ_GetIndexInList()
{
	return self C_IMLLOGIC::TJ_GetIndexInList();
}

public GetTTList()
{
	return C_IMLLOGIC::GetTTList();
}

public GetTTByIndex(iTTIndex)
{
	return C_IMLLOGIC::GetTTByIndex(iTTIndex);
}

public GetTJList()
{
	return C_IMLLOGIC::GetTJList();
}

public GetTJByIndex(iTJIndex)
{
	return C_IMLLOGIC::GetTJByIndex(iTJIndex);
}

public GetEM()
{
	return C_IMLLOGIC::GetEM();
}