main()
{

	//***************************//
    maps\mp\_load::main();

	//***** script ******//
	maps\mp\mp_dr_terror\traps::main();
	//maps\mp\mp_dr_terror\mp_dr_terror::main();
	api\gamelogic\_classic::RegTimeLimit(4);
	thread RegisterTrapTrigger( "t1_" );
	thread RegisterTrapTrigger( "t2_" );
	thread RegisterTrapTrigger( "t3_" );
	thread RegisterTrapTrigger( "t4_" );
	thread RegisterTrapTrigger( "t5_" );
	thread RegisterTrapTrigger( "t6_" );
	thread RegisterTrapTrigger( "t7_" );
	thread RegisterTrapTrigger( "t8_" );
	thread RegisterTrapTrigger( "t9_" );
	thread RegisterTrapTrigger( "t10_" );
	thread RegisterTrapTrigger( "t11_" );
	thread RegisterTrapTrigger( "t12_" );
	thread RegisterTrapTrigger( "t13_" );
	thread RegisterTrapTrigger( "t14_" );
	thread RegisterTrapTrigger( "t15_" );
	thread RegisterTrapTrigger( "t16_" );
	thread RegisterTrapTrigger( "t17_" );
	thread RegisterTrapTrigger( "t18_" );
	thread RegisterTrapTrigger( "t19_" );
	thread RegisterTrapTrigger( "t20_" );
	thread RegisterTrapTrigger( "t21_" );
	thread RegisterTrapTrigger( "t22_" );
	setdvar("compassmaxrange","1750");
	
	//AmbientPlay( "coldplay" );
	mapper\_music::PlayNow("coldplay", "Coldplay - Princess Of China ft. Rihanna ");
    mapper\_mapinfo::RegDescription(0, "Creators");
    mapper\_mapinfo::RegDescription(1, "  Col!ar - Map Creator");
    mapper\_mapinfo::RegDescription(2, "  PetX - Map Sctipter");
    mapper\_mapinfo::RegDescription(3, "");
    mapper\_mapinfo::RegDescription(4, "");
    mapper\_mapinfo::RegDescription(5, "");
    mapper\_mapinfo::RegDescription(6, "");
    mapper\_mapinfo::RegDescription(7, "  WwW.4GF.Cz");
    mapper\_mapinfo::RegDescription(8, "");
	//***************************//

        game["allies"] = "sas";
        game["axis"] = "opfor";
        game["attackers"] = "axis";
        game["defenders"] = "allies";
        game["allies_soldiertype"] = "woodland";
        game["axis_soldiertype"] = "woodland";

	//setdvar( "r_specularcolorscale", "1" );
	
	//setdvar("r_glowbloomintensity0",".25");
	//setdvar("r_glowbloomintensity1",".25");
	//setdvar("r_glowskybleedintensity0",".3");
	//setdvar("compassmaxrange","1800");
}

RegisterTrapTrigger( targetname )
{
	if( !isDefined( level.trapTriggers ) )
		level.trapTriggers = [];

	ent = getEnt( targetname, "targetname" );

	if( isDefined( ent ) )
		level.trapTriggers[level.trapTriggers.size] = ent;
}