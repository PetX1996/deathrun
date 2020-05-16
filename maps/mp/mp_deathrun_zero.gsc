/*
//    +========================================================================+
//    I                    ___  _____  _____                                   I
//    I                   /   !!  __ \!  ___!                                  I
//    I                  / /! !! !  \/! !_          ___  ____                  I
//    I                 / /_! !! ! __ !  _!        / __!!_  /                  I
//    I                 \___  !! !_\ \! !      _  ! (__  / /                   I
//    I                     !_/ \____/\_!     (_)  \___!/___!                  I
//    I========================================================================I
//    I                           mp_deathrun_zero                             I
//    I========================================================================I
//    I                      mapped by:  r3mien@4gf.cz                         I
//    I                    scripted by:  mnaauuu@4gf.cz                        I
//    I                         website: www.4GF.cz                            I
//    I========================================================================I
//    I                Compatible with original Deathrun by BraX               I
//    +========================================================================+
*/

main()
{
	maps\mp\_load::main();
	maps\createfx\mp_deathrun_zero_fx::main();
	maps\mp\mp_deathrun_zero_fx::main();
	maps\mp\mp_deathrun_zero\fx_load::main();
		
	maps\mp\mp_deathrun_zero\teleport::main();
	maps\mp\mp_deathrun_zero\teleport2::main();
	//maps\mp\mp_deathrun_zero\door::main();
	maps\mp\mp_deathrun_zero\population::main();
	maps\mp\mp_deathrun_zero\billboard1::init();
	maps\mp\mp_deathrun_zero\billboard2::init();
	maps\mp\mp_deathrun_zero\coins::main();
	
	maps\mp\mp_deathrun_zero\ends\end_1::main();
	maps\mp\mp_deathrun_zero\ends\end_2::main();
	maps\mp\mp_deathrun_zero\ends\end_3::main();
	maps\mp\mp_deathrun_zero\ends\end_4::main();
	
	maps\mp\mp_deathrun_zero\traps\rotor1::main();
	maps\mp\mp_deathrun_zero\traps\rotor2::main();
	maps\mp\mp_deathrun_zero\traps\mackac1::main();
	maps\mp\mp_deathrun_zero\traps\mackac2::main();
	maps\mp\mp_deathrun_zero\traps\blesky1::main();
	maps\mp\mp_deathrun_zero\traps\fire1::main();
	maps\mp\mp_deathrun_zero\traps\propadlo::main();
	
	maps\mp\mp_deathrun_zero\auto\mover1::main();
	maps\mp\mp_deathrun_zero\auto\tlacic1::main();
	maps\mp\mp_deathrun_zero\auto\fan1::main();
	maps\mp\mp_deathrun_zero\auto\fan2::main();
	maps\mp\mp_deathrun_zero\auto\pady1::main();
	
	//maps\mp\_compass::setupMiniMap("compass_map_mp_deathrun_zero");

	VisionSetNaked( "mp_deathrun_zero" );
	//ambientPlay("music_zero");
	
	mapper\_music::PlayNow("music_zero", "Mirrored Theory - The Cleansing");
    mapper\_mapinfo::RegDescription(0, "Creators");
    mapper\_mapinfo::RegDescription(1, "  R3MIEN - Map Creator");
    mapper\_mapinfo::RegDescription(2, "  PetX - Map Sctipter v1.6");
    mapper\_mapinfo::RegDescription(3, "  Mnaauuu - Map Scripter");
    mapper\_mapinfo::RegDescription(4, "  8 Traps");
    mapper\_mapinfo::RegDescription(5, "  Special bonuses");
    mapper\_mapinfo::RegDescription(6, "  Ends: Knife, Snip, Jump, Classic");
    mapper\_mapinfo::RegDescription(7, "  WwW.4GF.Cz");
    mapper\_mapinfo::RegDescription(8, "Current version - 1.6");
	
	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	setdvar("compassmaxrange","2000");
	
	level._effect[ "pulse" ] = LoadFX( "misc/pulse" );
	
	level.trapTriggers = [];
	level.trapTriggers[level.trapTriggers.size] = getEnt( "tmackac1", "targetname" );
    level.trapTriggers[level.trapTriggers.size] = getEnt( "trap0", "targetname" );
    level.trapTriggers[level.trapTriggers.size] = getEnt( "trap1", "targetname" );
    level.trapTriggers[level.trapTriggers.size] = getEnt( "trap2", "targetname" );
    level.trapTriggers[level.trapTriggers.size] = getEnt( "trap3", "targetname" );
    level.trapTriggers[level.trapTriggers.size] = getEnt( "trap4", "targetname" );
    level.trapTriggers[level.trapTriggers.size] = getEnt( "trap5", "targetname" );
	level.trapTriggers[level.trapTriggers.size] = getEnt( "trap6", "targetname" );
}
