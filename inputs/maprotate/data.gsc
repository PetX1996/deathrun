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

GetItem(sName)
{
	switch (sName)
	{
		case "mp_deathrun_colourful":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Colorful";
			item.iLength = 0;
			item.iDifficulty = 2;
			return item;
		case "mp_deathrun_cave":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Cave";
			item.iLength = 0;
			item.iDifficulty = 2;
			return item;
		case "mp_deathrun_darkness":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Darkness";
			item.iLength = 0;
			item.iDifficulty = 1;
			return item;
		case "mp_deathrun_minecraft":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Minecraft";
			item.iLength = 0;
			item.iDifficulty = 1;
			return item;
		case "mp_deathrun_palm":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Palm ^34GF.CZ";
			item.iLength = 0;
			item.iDifficulty = 2;
			return item;
		case "mp_deathrun_cookie":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Cookie";
			item.iLength = 0;
			item.iDifficulty = 2;
			return item;
		case "mp_deathrun_stone":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Stone";
			item.iLength = 0;
			item.iDifficulty = 2;
			return item;
		case "mp_dr_minerun":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Minerun";
			item.iLength = 0;
			item.iDifficulty = 2;
			return item;
		case "mp_dr_pool":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Pool";
			item.iLength = 0;
			item.iDifficulty = 2;
			return item;
		case "mp_dr_ssc_nothing":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Nothing";
			item.iLength = 0;
			item.iDifficulty = 1;
			return item;
		case "mp_fnrp_piratas":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Piratas";
			item.iLength = 0;
			item.iDifficulty = 2;
			return item;
		case "mp_deathrun_farm":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Farm";
			item.iLength = 0;
			item.iDifficulty = 2;
			return item;
		case "mp_dr_pacman":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Pacman";
			item.iLength = 0;
			item.iDifficulty = 2;
			return item;
		case "mp_dr_ryno":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Ryno";
			item.iLength = 0;
			item.iDifficulty = 2;
			return item;
		case "mp_deathrun_azteca":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Azteca";
			item.iLength = 0;
			item.iDifficulty = 2;
			return item;
		case "mp_deathrun_destroyed":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Destroyed";
			item.iLength = 0;
			item.iDifficulty = 2;
			return item;
		case "mp_deathrun_jailhouse":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Jail House";
			item.iLength = 0;
			item.iDifficulty = 2;
			return item;
		case "mp_deathrun_liferun":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Liferun";
			item.iLength = 0;
			item.iDifficulty = 2;
			return item;
		case "mp_deathrun_portal_v3":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Portal V3";
			item.iLength = 0;
			item.iDifficulty = 2;
			return item;
		case "mp_deathrun_short_v4":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Short V4";
			item.iLength = 0;
			item.iDifficulty = 2;
			return item;
		case "mp_deathrun_supermario":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Supermario";
			item.iLength = 0;
			item.iDifficulty = 2;
			return item;
		case "mp_dr_bananaphone_v2":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Bananaphone";
			item.iLength = 0;
			item.iDifficulty = 2;
			return item;
		case "mp_dr_sm_world":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Supermario World";
			item.iLength = 0;
			item.iDifficulty = 2;
			return item;
		case "mp_dr_boxroom":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Box room";
			item.iLength = 0;
			item.iDifficulty = 2;
			return item;
		case "mp_dr_finalshuttle":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Finalshuttle";
			item.iLength = 0;
			item.iDifficulty = 2;
			return item;
		case "mp_deathrun_bangarang":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Bangarang";
			item.iLength = 0;
			item.iDifficulty = 2;
			return item;
		case "mp_ls_simple":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Simple";
			item.iLength = 0;
			item.iDifficulty = 2;
			return item;
		case "mp_dr_watercity":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Watercity";
			item.iLength = 0;
			item.iDifficulty = 2;
			return item;
		case "mp_dr_takeshi":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Takeshi";
			item.iLength = 0;
			item.iDifficulty = 2;
			return item;
		case "mp_deathrun_forest":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Forest";
			item.iLength = 0;
			item.iDifficulty = 1;
			return item;
		case "mp_dr_hilly":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Hilly";
			item.iLength = 0;
			item.iDifficulty = 2;
			return item;
		case "mp_deathrun_takecare":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Takecare";
			item.iLength = 0;
			item.iDifficulty = 3;
			return item;
		case "mp_deathrun_portal_v2":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Portal V2";
			item.iLength = 0;
			item.iDifficulty = 3;
			return item;
		case "mp_deathrun_city":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "City ^34GF.CZ";
			item.iLength = 0;
			item.iDifficulty = 3;
			return item;
		case "mp_deathrun_clear":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Clear ^34GF.CZ";
			item.iLength = 0;
			item.iDifficulty = 3;
			return item;
		case "mp_deathrun_dirt":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Dirt ^34GF.CZ";
			item.iLength = 0;
			item.iDifficulty = 3;
			return item;
		case "mp_deathrun_dungeon":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Dungeon";
			item.iLength = 0;
			item.iDifficulty = 3;
			return item;
		case "mp_deathrun_glass":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Glass";
			item.iLength = 0;
			item.iDifficulty = 3;
			return item;
		case "mp_deathrun_grassy":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Grassy";
			item.iLength = 0;
			item.iDifficulty = 3;
			return item;
		case "mp_deathrun_long":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Long";
			item.iLength = 0;
			item.iDifficulty = 3;
			return item;
		case "mp_deathrun_sg1":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "SG-1  ^34GF.CZ ^1beta";
			item.iLength = 0;
			item.iDifficulty = 3;
			return item;
		case "mp_deathrun_watchit_v3":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Watchit V3";
			item.iLength = 0;
			item.iDifficulty = 3;
			return item;
		case "mp_deathrun_arbase":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Arbase";
			item.iLength = 0;
			item.iDifficulty = 3;
			return item;
		case "mp_deathrun_sm_v2":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Supermario V2";
			item.iLength = 0;
			item.iDifficulty = 3;
			return item;
		case "mp_deathrun_factory":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Factory";
			item.iLength = 0;
			item.iDifficulty = 3;
			return item;
		case "mp_deathrun_grassy_v4":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Grassy V4";
			item.iLength = 0;
			item.iDifficulty = 3;
			return item;
		case "mp_dr_indipyramid":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Indy Pyramid ^34GF.CZ";
			item.iLength = 0;
			item.iDifficulty = 3;
			return item;
		case "mp_dr_jurapark":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Jurapark ^34GF.CZ";
			item.iLength = 0;
			item.iDifficulty = 3;
			return item;
		case "mp_fnrp_iceland_v2":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Iceland";
			item.iLength = 0;
			item.iDifficulty = 3;
			return item;
		case "mp_deathrun_greenland":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Green Land";
			item.iLength = 0;
			item.iDifficulty = 3;
			return item;
		case "mp_deathrun_escape2":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Escape 2";
			item.iLength = 0;
			item.iDifficulty = 3;
			return item;
		case "mp_deathrun_lalamx":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Lalamx";
			item.iLength = 0;
			item.iDifficulty = 3;
			return item;
		case "mp_deathrun_metal":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Metal";
			item.iLength = 0;
			item.iDifficulty = 3;
			return item;
		case "mp_deathrun_scary":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Scary";
			item.iLength = 0;
			item.iDifficulty = 3;
			return item;
		case "mp_dr_wtf":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "WTF v2";
			item.iLength = 0;
			item.iDifficulty = 3;
			return item;
		case "mp_dr_levels":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Levels";
			item.iLength = 0;
			item.iDifficulty = 3;
			return item;
		case "mp_ls_stairs":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Stairs";
			item.iLength = 0;
			item.iDifficulty = 3;
			return item;
		case "mp_dr_mystic":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Mystic";
			item.iLength = 0;
			item.iDifficulty = 3;
			return item;
		case "mp_deathrun_backlot":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Backlot";
			item.iLength = 0;
			item.iDifficulty = 3;
			return item;
		case "mp_deathrun_flow":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Flow";
			item.iLength = 0;
			item.iDifficulty = 3;
			return item;
		case "mp_deathrun_bunker":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Bunker";
			item.iLength = 0;
			item.iDifficulty = 3;
			return item;
		case "mp_dr_dirty":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Dirty";
			item.iLength = 0;
			item.iDifficulty = 3;
			return item;
		case "mp_dr_disco":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Disco";
			item.iLength = 0;
			item.iDifficulty = 3;
			return item;
		case "mp_deathrun_zero":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Zero ^34GF.CZ";
			item.iLength = 0;
			item.iDifficulty = 4;
			return item;
		case "mp_deathrun_max":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Max";
			item.iLength = 0;
			item.iDifficulty = 4;
			return item;
		case "mp_dr_glass2":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Glass 2";
			item.iLength = 0;
			item.iDifficulty = 4;
			return item;
		case "mp_deathrun_metal2":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Metal 2";
			item.iLength = 0;
			item.iDifficulty = 4;
			return item;
		case "mp_deathrun_diehard":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Die Hard";
			item.iLength = 0;
			item.iDifficulty = 4;
			return item;
		case "mp_deathrun_ruin":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Ruin";
			item.iLength = 0;
			item.iDifficulty = 4;
			return item;
		case "mp_deathrun_ruin2":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Ruin 2";
			item.iLength = 0;
			item.iDifficulty = 5;
			return item;
		case "mp_deathrun_framey_v2":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Framey";
			item.iLength = 0;
			item.iDifficulty = 4;
			return item;
		case "mp_deathrun_moustache":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Moustache";
			item.iLength = 0;
			item.iDifficulty = 5;
			return item;
		case "mp_deathrun_easy":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "EASY ^34GF.CZ";
			item.iLength = 0;
			item.iDifficulty = 5;
			return item;
		case "mp_deathrun_skypillar":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Skypillar";
			item.iLength = 0;
			item.iDifficulty = 4;
			return item;
		case "mp_dr_wipeout":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Wipeout";
			item.iLength = 0;
			item.iDifficulty = 4;
			return item;
		case "mp_fnrp_monderland":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Monderland";
			item.iLength = 0;
			item.iDifficulty = 4;
			return item;
		case "mp_deathrun_death":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Death";
			item.iLength = 0;
			item.iDifficulty = 4;
			return item;
		case "mp_dr_hazard":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Hazard";
			item.iLength = 0;
			item.iDifficulty = 4;
			return item;
		case "mp_dr_terror":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Terror ^34GF.CZ";
			item.iLength = 0;
			item.iDifficulty = 5;
			return item;
		case "mp_deathrun_epicfail":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Epicfail";
			item.iLength = 0;
			item.iDifficulty = 4;
			return item;
		case "mp_dr_magical":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Magical";
			item.iLength = 0;
			item.iDifficulty = 4;
			return item;
		case "mp_deathrun_tribute":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Tribute";
			item.iLength = 0;
			item.iDifficulty = 4;
			return item;
		case "mp_dr_apocalypse_v2":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Apocalypse";
			item.iLength = 0;
			item.iDifficulty = 4;
			return item;
		case "mp_deathrun_dragonball":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Dragonball";
			item.iLength = 0;
			item.iDifficulty = 5;
			return item;
		case "mp_dr_bigfall":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Big Fall";
			item.iLength = 0;
			item.iDifficulty = 4;
			return item;
		case "mp_dr_unreal":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Unreal";
			item.iLength = 0;
			item.iDifficulty = 4;
			return item;
		case "mp_deathrun_highrise":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Highrise";
			item.iLength = 0;
			item.iDifficulty = 0;
			return item;
		case "mp_fnrp_laberinto_v2":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Laberinto";
			item.iLength = 0;
			item.iDifficulty = 0;
			return item;
		case "mp_dr_bounce":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Bounce";
			item.iLength = 0;
			item.iDifficulty = 4;
			return item;
		case "mp_deathrun_qube":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Qube";
			item.iLength = 0;
			item.iDifficulty = 4;
			return item;
		case "mp_deathrun_amazon":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Amazon";
			item.iLength = 0;
			item.iDifficulty = 4;
			//item.bIsNew = true;
			return item;
		case "mp_deathrun_bricky":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Bricky";
			item.iLength = 0;
			item.iDifficulty = 3;
			//item.bIsNew = true;
			return item;
		case "mp_deathrun_clockwork":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Clockwork";
			item.iLength = 0;
			item.iDifficulty = 4;
			//item.bIsNew = true;
			return item;
		case "mp_deathrun_eudora":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Eudora";
			item.iLength = 0;
			item.iDifficulty = 4;
			//item.bIsNew = true;
			return item;
		case "mp_deathrun_hop":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Hop";
			item.iLength = 0;
			item.iDifficulty = 3;
			//item.bIsNew = true;
			return item;
		case "mp_deathrun_mine":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Mine";
			item.iLength = 0;
			item.iDifficulty = 3;
			//item.bIsNew = true;
			return item;
		case "mp_deathrun_rocky":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Rocky";
			item.iLength = 0;
			item.iDifficulty = 3;
			//item.bIsNew = true;
			return item;
		case "mp_deathrun_sapphire":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Sapphire";
			item.iLength = 0;
			item.iDifficulty = 3;
			//item.bIsNew = true;
			return item;
		case "mp_deathrun_semtex":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Semtex";
			item.iLength = 0;
			item.iDifficulty = 3;
			//item.bIsNew = true;
			return item;
		case "mp_deathrun_slow":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Slow";
			item.iLength = 0;
			item.iDifficulty = 1;
			//item.bIsNew = true;
			return item;
		case "mp_deathrun_sonic":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Sonic";
			item.iLength = 0;
			item.iDifficulty = 2;
			//item.bIsNew = true;
			return item;
		case "mp_deathrun_under":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Under";
			item.iLength = 0;
			item.iDifficulty = 3;
			//item.bIsNew = true;
			return item;
		case "mp_deathrun_waterwork":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Waterwork";
			item.iLength = 0;
			item.iDifficulty = 3;
			//item.bIsNew = true;
			return item;
		case "mp_dr_blackandwhite":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Blackandwhite";
			item.iLength = 0;
			item.iDifficulty = 3;
			//item.bIsNew = true;
			return item;
		case "mp_dr_buggedlikehell":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "buggedlikehell";
			item.iLength = 0;
			item.iDifficulty = 3;
			//item.bIsNew = true;
			return item;
		case "mp_dr_detained":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Detained";
			item.iLength = 0;
			item.iDifficulty = 4;
			//item.bIsNew = true;
			return item;
		case "mp_dr_digital":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Digital";
			item.iLength = 0;
			item.iDifficulty = 5;
			//item.bIsNew = true;
			return item;
		case "mp_dr_electric":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Eletric";
			item.iLength = 0;
			item.iDifficulty = 2;
			//item.bIsNew = true;
			return item;
		case "mp_dr_emerald":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Emerald";
			item.iLength = 0;
			item.iDifficulty = 2;
			//item.bIsNew = true;
			return item;
		case "mp_dr_freakyland":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Freakyland";
			item.iLength = 0;
			item.iDifficulty = 3;
			//item.bIsNew = true;
			return item;
		case "mp_dr_glass3":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Glass 3";
			item.iLength = 0;
			item.iDifficulty = 3;
			//item.bIsNew = true;
			return item;
		case "mp_dr_gooby":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Gooby";
			item.iLength = 0;
			item.iDifficulty = 4;
			//item.bIsNew = true;
			return item;
		case "mp_dr_heat":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Heat";
			item.iLength = 0;
			item.iDifficulty = 3;
			//item.bIsNew = true;
			return item;
		case "mp_dr_iwillrockyou":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Iwillrockyou";
			item.iLength = 0;
			item.iDifficulty = 3;
			//item.bIsNew = true;
			return item;
		case "mp_dr_iwontrockyou":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Iwontrockyou";
			item.iLength = 0;
			item.iDifficulty = 3;
			//item.bIsNew = true;
			return item;
		case "mp_dr_neon":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Neon";
			item.iLength = 0;
			item.iDifficulty = 3;
			//item.bIsNew = true;
			return item;
		case "mp_dr_render":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Render";
			item.iLength = 0;
			item.iDifficulty = 3;
			//item.bIsNew = true;
			return item;
		case "mp_dr_rock":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Rock";
			item.iLength = 0;
			item.iDifficulty = 3;
			//item.bIsNew = true;
			return item;
		case "mp_dr_sheox":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Sheox";
			item.iLength = 0;
			item.iDifficulty = 3;
			//item.bIsNew = true;
			return item;
		case "mp_dr_skydeath":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Skydeath";
			item.iLength = 0;
			item.iDifficulty = 4;
			//item.bIsNew = true;
			return item;
		case "mp_dr_turnabout":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Turnabout";
			item.iLength = 0;
			item.iDifficulty = 4;
			//item.bIsNew = true;
			return item;
		case "mp_dr_wicked":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Wicked";
			item.iLength = 0;
			item.iDifficulty = 3;
			//item.bIsNew = true;
			return item;
		case "mp_deathrun_saw":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "SaW";
			item.iLength = 0;
			item.iDifficulty = 4;
			//item.bIsNew = true;
			return item;
		case "mp_dr_bridge":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Bridge";
			item.iLength = 0;
			item.iDifficulty = 3;
			//item.bIsNew = true;
			return item;
		case "mp_deathrun_fusion":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Fusion";
			item.iLength = 0;
			item.iDifficulty = 3;
			//item.bIsNew = true;
			return item;
		case "mp_deathrun_smooth":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Smooth";
			item.iLength = 0;
			item.iDifficulty = 2;
			//item.bIsNew = true;
			return item;
		case "mp_dr_skypower":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Skypower";
			item.iLength = 0;
			item.iDifficulty = 2;
			//item.bIsNew = true;
			return item;
		case "mp_dr_style":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Style";
			item.iLength = 0;
			item.iDifficulty = 3;
			//item.bIsNew = true;
			return item;
		case "mp_deathrun_mirroredge":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Mirroredge";
			item.iLength = 0;
			item.iDifficulty = 4;
			//item.bIsNew = true;
			return item;
		case "mp_deathrun_fearful":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Fearful";
			item.iLength = 0;
			item.iDifficulty = 4;
			item.bIsNew = true;
			return item;
		case "mp_deathrun_fluxx":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Fluxx";
			item.iLength = 0;
			item.iDifficulty = 4;
			item.bIsNew = true;
			return item;
		case "mp_deathrun_gold":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Gold";
			item.iLength = 0;
			item.iDifficulty = 3;
			item.bIsNew = true;
			return item;
		case "mp_deathrun_industry":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Industry";
			item.iLength = 0;
			item.iDifficulty = 4;
			item.bIsNew = true;
			return item;
		case "mp_deathrun_islands":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Islands";
			item.iLength = 0;
			item.iDifficulty = 4;
			item.bIsNew = true;
			return item;
		case "mp_deathrun_scoria":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Scoria";
			item.iLength = 0;
			item.iDifficulty = 4;
			item.bIsNew = true;
			return item;
		case "mp_deathrun_village":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Village";
			item.iLength = 0;
			item.iDifficulty = 4;
			item.bIsNew = true;
			return item;
		case "mp_deathrun_waterworld":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Water World";
			item.iLength = 0;
			item.iDifficulty = 3;
			item.bIsNew = true;
			return item;
		case "mp_deathrun_wicked2":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Wicked 2";
			item.iLength = 0;
			item.iDifficulty = 4;
			item.bIsNew = true;
			return item;
		case "mp_dr_android":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Android";
			item.iLength = 0;
			item.iDifficulty = 3;
			item.bIsNew = true;
			return item;
		case "mp_dr_antichamber":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Antichamber";
			item.iLength = 0;
			item.iDifficulty = 5;
			item.bIsNew = true;
			return item;
		case "mp_dr_brainfuck":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Brain Fuck";
			item.iLength = 0;
			item.iDifficulty = 4;
			item.bIsNew = true;
			return item;
		case "mp_dr_crawl":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Crawl";
			item.iLength = 0;
			item.iDifficulty = 2;
			item.bIsNew = true;
			return item;
		case "mp_dr_deadzone":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Deadzone";
			item.iLength = 0;
			item.iDifficulty = 3;
			item.bIsNew = true;
			return item;
		case "mp_dr_fallrun":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Fallrun";
			item.iLength = 0;
			item.iDifficulty = 4;
			item.bIsNew = true;
			return item;
		case "mp_dr_imaginary":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Imaginary";
			item.iLength = 0;
			item.iDifficulty = 5;
			item.bIsNew = true;
			return item;
		case "mp_dr_nightlight":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "NightLight";
			item.iLength = 0;
			item.iDifficulty = 3;
			item.bIsNew = true;
			return item;
		case "mp_dr_nimble":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Nimble";
			item.iLength = 0;
			item.iDifficulty = 1;
			item.bIsNew = true;
			return item;
		case "mp_dr_rage":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Rage";
			item.iLength = 0;
			item.iDifficulty = 3;
			item.bIsNew = true;
			return item;
		case "mp_dr_royals":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Royals";
			item.iLength = 0;
			item.iDifficulty = 3;
			item.bIsNew = true;
			return item;
		case "mp_dr_slay":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Slay";
			item.iLength = 0;
			item.iDifficulty = 3;
			item.bIsNew = true;
			return item;
		case "mp_dr_spacetunnel":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Space Tunnel";
			item.iLength = 0;
			item.iDifficulty = 4;
			item.bIsNew = true;
			return item;
		case "mp_dr_steel":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Steel";
			item.iLength = 0;
			item.iDifficulty = 4;
			item.bIsNew = true;
			return item;
		case "mp_dr_steelv2":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Steel 2";
			item.iLength = 0;
			item.iDifficulty = 4;
			item.bIsNew = true;
			return item;
		case "mp_dr_stonerun":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Stonerun";
			item.iLength = 0;
			item.iDifficulty = 2;
			item.bIsNew = true;
			return item;
		/*case "mp_dr_trapntrance":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Trapntrace";
			item.iLength = 0;
			item.iDifficulty = 3;
			item.bIsNew = true;
			return item;*/
		case "mp_dr_trikx":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Trikx";
			item.iLength = 0;
			item.iDifficulty = 3;
			item.bIsNew = true;
			return item;
		case "mp_dr_tutorial":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Tutorial";
			item.iLength = 0;
			item.iDifficulty = 2;
			item.bIsNew = true;
			return item;
		case "mp_dr_vector":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Vector";
			item.iLength = 0;
			item.iDifficulty = 4;
			item.bIsNew = true;
			return item;
		case "mp_dr_blue":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Blue";
			item.iLength = 0;
			item.iDifficulty = 4;
			item.bIsNew = true;
			return item;
		case "mp_dr_h2o":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "H2O";
			item.iLength = 0;
			item.iDifficulty = 3;
			item.bIsNew = true;
			return item;
		case "mp_dr_naruto":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Naruto";
			item.iLength = 0;
			item.iDifficulty = 4;
			item.bIsNew = true;
			return item;
		case "mp_deathrun_apollo":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Apollo";
			item.iLength = 0;
			item.iDifficulty = 5;
			item.bIsNew = true;
			return item;
		case "mp_deathrun_glow":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Glow";
			item.iLength = 0;
			item.iDifficulty = 4;
			item.bIsNew = true;
			return item;
		case "mp_deathrun_wipeout_v2":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Wipeout 2";
			item.iLength = 0;
			item.iDifficulty = 4;
			item.bIsNew = true;
			return item;
		case "mp_dr2_orangesky":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Orange Sky ^34GF.CZ ^5DR-2-";
			item.iLength = 0;
			item.iDifficulty = 3;
			item.bIsNew = true;
			return item;
		case "mp_deathrun_crystal":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Crystal";
			item.iLength = 0;
			item.iDifficulty = 4;
			item.bIsNew = true;
			return item;
		case "mp_deathrun_empire":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Empire";
			item.iLength = 0;
			item.iDifficulty = 4;
			item.bIsNew = true;
			return item;
		case "mp_dr_hardstyle":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Hard Style";
			item.iLength = 0;
			item.iDifficulty = 3;
			item.bIsNew = true;
			return item;
		case "mp_dr_holyshiet":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "HolyShiet";
			item.iLength = 0;
			item.iDifficulty = 3;
			item.bIsNew = true;
			return item;
		case "mp_dr_underwater":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Under Water";
			item.iLength = 0;
			item.iDifficulty = 3;
			item.bIsNew = true;
			return item;
		case "mp_dr_worldofmetal":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "World of Metal";
			item.iLength = 0;
			item.iDifficulty = 4;
			item.bIsNew = true;
			return item;
		case "mp_dr_xplosive":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Xplosive";
			item.iLength = 0;
			item.iDifficulty = 3;
			item.bIsNew = true;
			return item;
        case "mp_dr_sub":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Sub";
			item.iLength = 0;
			item.iDifficulty = 3;
			item.bIsNew = true;
			return item;
        case "mp_dr_dawn":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Dawn";
			item.iLength = 0;
			item.iDifficulty = 3;
			item.bIsNew = true;
			return item;
        case "mp_dr_western":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Western";
			item.iLength = 0;
			item.iDifficulty = 3;
			item.bIsNew = true;
			return item;
        case "mp_dr_oldschool":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Old School";
			item.iLength = 0;
			item.iDifficulty = 3;
			item.bIsNew = true;
			return item;
        case "mp_dr_slayv2":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Slay v2";
			item.iLength = 0;
			item.iDifficulty = 3;
			item.bIsNew = true;
			return item;
		case "mp_dr2_view":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "View ^34GF.CZ ^5DR-2-";
			item.iLength = 0;
			item.iDifficulty = 2;
			item.bIsNew = true;
			return item;
		case "mp_dr2_simonsays":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Simon Says ^34GF.CZ ^5DR-2- ^6MG";
			item.iLength = 0;
			item.iDifficulty = 0;
			item.bIsNew = true;
			return item;
		/*
		mp_vc_high -> rozbite bounces
		mp_dr_idk - script, bugnuta stena activa - zmazaù
		mp_dr_bouncev2 - uû pridanÈ - zmazaù
		mp_deathrun_trans - corrupted FF - zmazaù
		mp_deathrun_oreo - zacyklen˝ server - zmazaù
		mp_deathrun_framey_v3, map_dr_arctic - ch˝baj˙ scripty
		mp_deathrun_ruin2"; // crash server? config strings?
		*/
		// ------------------------------------------------------------------------------------- //
		// Already added?
/*		case "mp_wtf":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "WTF";
			item.iLength = 0;
			item.iDifficulty = 3;
			return item;
*/ 		// ------------------------------------------------------------------------------------- //
		// 2400 image assets
/*		case "mp_deathrun_rainy_v2":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Rainy V2";
			item.iLength = 0;
			item.iDifficulty = 2;
			return item;
		case "mp_dr_gohome":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Go home";
			item.iLength = 0;
			item.iDifficulty = 3;
			return item;
		case "mp_dr_meatboy":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Meatboy";
			item.iLength = 0;
			item.iDifficulty = 0;
			item.bIsNew = true;
			return item;
		case "mp_dr_sewers":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Sewers";
			item.iLength = 0;
			item.iDifficulty = 0;
			item.bIsNew = true;
			return item;
*/		// ------------------------------------------------------------------------------------- //
		// DR2 - Unreleased
		case "mp_deathrun_amazing":
			item = custom\include\_maplist::GetDefaultItem();
			item.sFullName = "Amazing ^34GF.CZ ^1BETA";
			item.iLength = 5;
			item.iDifficulty = 4;
			item.bIsNew = true;
			return item;
		default:
			return undefined;
	}
}