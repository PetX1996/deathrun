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

InSIniting(args)
{
	ResetFromLastMap();
}

private ResetFromLastMap()
{
	/*
	Known changed dvars
	----------
	r_specularcolorscale 1
	//r_glowbloomintensity0
	//r_glowbloomintensity1
	//r_glowskybleedintensity0
	r_glowTweakEnable 0
	r_glowUseTweaks 0
	r_glowTweakBloomCutoff 0.5
	//r_glowTweakBloomIntensity
	r_specular 1
	r_dlightLimit 4
	r_distortion 1
	r_lightTweakSunLight 1.6
	//r_filmEnable
	r_fullbright 0
	r_filmTweakEnable 0
	r_drawDecals 1

	//compassmaxrange

	//scr_testclients

	player_meleerange 64

	jump_height 39

	sv_cheats 0

	bg_falldamagemaxheight 300
	bg_falldamageminheight 128

	//cg_thirdperson

	fx_enable 1

	g_speed 190
	g_knockback 1000
	g_gravity 800

	//dr_jumpers_speed
	//dr_activators_speed
	//dr_timelimit
	//scr_jumpers_speed
	*/

	SetDvar("bullet_penetrationEnabled", 0); // ??
	SetDvar("jump_slowdownEnable", 0); // causes easier jumping
	SetDvar("r_specularcolorscale", 1);
	SetDvar("r_glowTweakEnable", 0);
	SetDvar("r_glowUseTweaks", 0);
	SetDvar("r_glowTweakBloomCutoff", 0.5);
	SetDvar("r_specular", 1);
	SetDvar("r_dlightLimit", 4);
	SetDvar("r_distortion", 1);
	SetDvar("r_lightTweakSunLight", 1.6);
	SetDvar("r_fullbright", 0);
	SetDvar("r_filmTweakEnable", 0);
	SetDvar("r_drawDecals", 1);
	SetDvar("player_meleerange", 64);
	SetDvar("jump_height", 39);
	SetDvar("sv_cheats", 0);
	SetDvar("bg_falldamagemaxheight", 300);
	SetDvar("bg_falldamageminheight", 128);
	SetDvar("fx_enable", 1);
	SetDvar("g_speed", 190);
	SetDvar("g_knockback", 1000);
	SetDvar("g_gravity", 800);
}