//mp_dr_steel
//Map Made by Elpredatore		xf: elpredatore
//Scripted by TwiYo				xf: 1buzz
//Created for Braxi's Deathrun mod for CoD4
//www.ix-treme.com and www.braxi.org

/////////////////////////////////////////////////////////////////////
//[][][][][][][][]/[]////////////////[] []//[]//////[]///////////////
/////////[]/////////[]//////////////[]///////[]////[]////////////////
/////////[]//////////[]////////////[]///[]////[]//[]///[][][][][][]//
/////////[]///////////[]////[]////[]////[]/////[][]////[]////////[]//
/////////[]////////////[]//[][]//[]/////[]//////[]/////[]////////[]//
/////////[]/////////////[][]//[][]//////[]//////[]/////[][][][][][]//
///////////////////////////////////////////////////////////////////// 

main()
{
	maps\mp\_load::main();
	thread Ambient();
	
	mapper\_mapinfo::RegDescription(0, "Creators");
    mapper\_mapinfo::RegDescription(1, "  Elpredatore - Creator");
    mapper\_mapinfo::RegDescription(2, "  TwiYo - Sctipted");
    mapper\_mapinfo::RegDescription(3, "  xf: elpredatore");
    mapper\_mapinfo::RegDescription(4, "  xf: 1buzzz");
    mapper\_mapinfo::RegDescription(5, "");
    mapper\_mapinfo::RegDescription(6, "");
    mapper\_mapinfo::RegDescription(7, "  ^7---^3www^1.^3ix^1-^3treme^1.^3com^7---");
    mapper\_mapinfo::RegDescription(8, "");
	
	setExpFog(500, 2200, 0.81, 0.75, 0.63, 0.5);
	
	precacheItem("ak74u_mp");
	precacheItem("remington700_mp");
	precacheItem("knife_mp");
	precacheItem("tomahawk_mp");
	precacheItem("deserteagle_mp");
	precacheItem("uzi_mp");
	precacheItem("m4_mp");
	precacheItem("ak47_mp");
	precacheItem("g3_mp");
	precacheItem("m60e4_mp");
	precacheItem("p90_mp");
	precacheItem("m40a3_mp");
	precacheItem("barrett_mp");
	precacheItem("g36c_silencer_mp");
	precacheItem("skorpion_silencer_mp");
	precacheItem("saw_grip_mp");
	
	level.fire = loadfx("test/jeepride_smokeblind");
	
	setdvar( "r_specularcolorscale", "1" );
	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	
	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	thread startdoor();
	thread werbung();
	thread printCredits();
	/////////////////////TRAPS/////////////////
	thread trap1();
	thread knopf();
	thread exit();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8();
	thread trap9();
	thread trap10();
	addTriggerToList("trap1_trigger");
    addTriggerToList("trap2_trigger");
    addTriggerToList("trap3_trigger");
	addTriggerToList("trap4_trigger");
	addtriggerTolist("trap5_trigger");
	addtriggerTolist("trap6_trigger");
	addtriggerTolist("trap7_trigger");
	addtriggerTolist("trap8_trigger");
	addtriggerTolist("trap9_trigger");
	addtriggerTolist("trap10_trigger");	
	/////////////////////LIFTS/////////////////
	thread liftdoor();
	thread liftjumper();
	thread liftacti();
	////////////////////Secret/////////////////
	thread secret();
	thread secretdoor();
	thread ausgang();
	//thread secrettrap();
	thread respawn1();
	thread respawn2();
	///////////////////////////////////////////
	thread actiteleport();
	thread actiteleportjumper();
	///////////////////////////////////////////
	thread tunnel1();
	thread tunnel2();
	thread tunnel3();
	thread tunnel4();
	thread tunnel5();
	thread tunnel6();	
	thread tunnel7();
	thread tunnel8();
	thread tunnel9();
	thread tunnel10();
	thread tunnel11();
	thread tunnel12();
	thread tunnel13();
	thread tunnel14();
	thread tunnel15();
	thread tunnel16();
	thread tunnel17();
	thread tunnel18();
	thread train();
	///////////////////////ENDROOMS////////////
	thread sniperfight();
	thread KnifeFight();
	thread BounceFight();
	thread KnifeRotateFight();
	thread oldfight();
	thread bounceweapon();
	thread knife_respawn();
	thread bouncerespawn();

	}
	
	addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}
	
werbung()	
{
wait(15);
iprintln("^7Check out iXtreme on ^3www.ix-treme.com");
wait(15);
iprintln("^7DRServer: ^3178.254.28.132:28960");
}

Ambient()
{
//AmbientPlay ( "map" );
mapper\_music::PlayNow("map", "Linkin Park - Numb Dubstep Remix");
wait 2;
iprintln("^1>>^7Now Playing^3: ^1Linkin Park ^3- ^7Numb Dubstep Remix^1<<");
iprintln("^1>>^7Now Playing^3: ^1Linkin Park ^3- ^7Numb Dubstep Remix^1<<");
}	
		
	
startdoor()
{
		trigger = getent ("door_trigger", "targetname");
		object = getent("links", "targetname");
		
		
		
		trigger waittill ("trigger", Player);
		trigger delete();
	
			
		thread credit();
		thread button();
		thread rechts();	
		thread quake();
		object moveX (15, 5);
		object waittill("movedone");
		object moveY (100, 5);
			
		
		
				
}
rechts()
{
		object = getent ("rechts", "targetname");
		
		object moveX (15, 5);
		object waittill("movedone");
		object moveY (-100, 5);
}
quake()
{
		sound = getent ("main_door", "targetname");
		main_door  = getent( "main_door", "targetname" );
		
		
			wait(0.5);
				EarthQuake( 0.4, 5, main_door.origin, 10000 );
				//Earthquake( 0.7, 8, main_door.origin, 10000 );
				sound PlaySound( "elm_quake_sub_rumble"); 
		
}
button()
{
		object = getent ("button", "targetname");
		
		object  moveX (-10, 3.5);
}
credit()
{
wait(2.5);
thread drawInformation( 800, 0.8, 1, "Steel" );
wait(4);
thread drawInformation( 800, 0.8, 1, "© Elpredatore & TwiYo" );
wait(4);
}	

drawInformation( start_offset, movetime, mult, text )
{
	start_offset *= mult;
	hud = new_ending_hud( "center", 0.1, start_offset, 90 );
	hud setText( text );
	hud moveOverTime( movetime );
	hud.x = 0;
	wait( movetime );
	wait( 3 );
	hud moveOverTime( movetime );
	hud.x = start_offset * -1;

	wait movetime;
	hud destroy();
}

new_ending_hud( align, fade_in_time, x_off, y_off )
{
	hud = newHudElem();
    hud.foreground = true;
	hud.x = x_off;
	hud.y = y_off;
	hud.alignX = align;
	hud.alignY = "middle";
	hud.horzAlign = align;
	hud.vertAlign = "middle";

 	hud.fontScale = 3;

	hud.color = (0.988235, 0.521569, 0.094118);
	hud.font = "objective";
	hud.glowColor = (0.3, 0.6, 0.3);
	hud.glowAlpha = 1;

	hud.alpha = 0;
	hud fadeovertime( fade_in_time );
	hud.alpha = 1;
	hud.hidewheninmenu = true;
	hud.sort = 10;
	return hud;
}
//////////////////////////////TRAPS//////////////////////////////////////
trap1()
{
	trigger = getent("trap1_trigger", "targetname");
	rechts = getent("door_rechts", "targetname");
	links = getent ("door_links", "targetname");
	coneR = getent ("coneR", "targetname");
	coneL = getent ("coneL", "targetname");
	
	trigger setHintString ("^7Press ^3[Use] ^7to Activate!");
	trigger waittill ("trigger", Player);		
	
	trigger setHintString ("^1Trap Activated!");
		
	
	{
	thread objectc();
	
	//rechts enablelinkto();
	rechts linkto (coneR);
	coneR rotateroll(-85,0.1);
	
	//links enablelinkto();
	links linkto (coneL);
	coneL rotateroll(85,0.1);
	
	wait(10);
	
	coneR rotateroll(85,.9);
	coneL rotateroll(-85,.9);
	
	}
}


objectc()
{
	objectc = getent("push", "targetname");
	
	wait(15);
	thread spikes();
	objectc moveX(-250, 8);
	objectc waittill ("movedone");
	wait(4);
	objectc moveX(250, 5);
	
	
	}
spikes()
{
	spike = getent("spikes", "targetname");
	killtrigger = getent ("spikesh", "targetname");
	
	
	killtrigger enablelinkto ();
	killtrigger linkto (spike);
	spike moveX(55, 5);
	spike waittill ("movedone");
	wait(4);
	spike moveX(-55, 5);
	
}

exit()
{
		trigger = getEnt ("exit_trigger", "targetname");
		target = getEnt ("exit_teleport", "targetname");
		object = getent ("knopf", "targetname");
	
	for(;;)
	{
		trigger waittill ("trigger", player);
		trigger delete();
		object moveY (12, 2.5); 
		iPrintlnBold( " ^6" + player.name + " ^5 Has Found a way to leave the Trap^1!" ); // Change the massage if you want
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
	}
}
knopf()
{
	object = getent ("knopf", "targetname");
	
	object notsolid();
	}
	
trap2()
{
		trigger = getEnt("trap2_trigger","targetname");
        		
       
		trigger setHintString ("^7Press ^3[Use] ^7to Activate!");
		trigger waittill ("trigger", Player);		
	
		trigger setHintString ("^1Trap Activated!");  
    
		myVar = getEntArray("trap2a", "targetname")[RandomInt(2)];  
		myVar notsolid();
		myVar = getEntArray("trap2b", "targetname")[RandomInt(2)];
		myVar notsolid();
	 
            
}

trap3()
{
		trigger = getent ("trap3_trigger", "targetname");
		object = getent ("trap3a", "targetname");
		
		trigger setHintString ("^7Press ^3[Use] ^7to Activate!");
		trigger waittill ("trigger", Player);		
	
		trigger setHintString ("^1Trap Activated!");  

		
		while(1)
		{
		
		thread trap3c();
		thread trap3b();
		object moveZ (55, 1.3);
		object waittill("movedone");
		object moveZ (-55,1.3);
		object waittill("movedone");
		
		}
}

trap3b()
{
		object = getent ("trap3b", "targetname");
		wait(1);
		object moveZ (-55, 1.3);
		object waittill("movedone");
		object moveZ (55, 1.3);
		object waittill("movedone");
}

trap3c()
{
		object = getent ("trap3c", "targetname");
		
		object moveZ (-55, 1.3);
		object waittill("movedone");
		object moveZ (55, 1.3);
		object waittill("movedone");
}

trap4()
{
		trigger = getent ("trap4_trigger", "targetname");
		object = getent ("spin", "targetname");
	
		trigger setHintString ("^7Press ^3[Use] ^7to Activate!");
		trigger waittill ("trigger", Player);		
	
		trigger setHintString ("^1Trap Activated!");  
			
		while(1)
		{
		object rotatepitch (360, 3.5);
		wait(0.5);
		}
}

trap5()
{
		trigger = getent ("trap5_trigger", "targetname");
		object = getent ("trap5a", "targetname");
		
		trigger setHintString ("^7Press ^3[Use] ^7to Activate!");
		trigger waittill ("trigger", Player);		
	
		trigger setHintString ("^1Trap Activated!");  

		while(1)
		{
		thread trap5b();
		object moveY (395, 1.3);
		object waittill("movedone");
		object moveY (-395, 1.3);
		object waittill("movedone");
		
		}
}

trap5b()
{
		object = getent ("trap5b", "targetname");
		wait(1.5);
		object moveY (395, 1.3);
		object waittill("movedone");
		object moveY (-395, 1.3);
		object waittill("movedone");
}
	
trap6()
{
		trigger = getent ("trap6_trigger", "targetname");
		object = getent ("bounce_spin", "targetname");
		
		trigger setHintString ("^7Press ^3[Use] ^7to Activate!");
		trigger waittill ("trigger", Player);		
	
		trigger setHintString ("^1Trap Activated!"); 

		while(1)
		{		
		object rotateYAW (360, 3.5);
		wait(0.5);
		}
}

trap7()
{
		trigger = getent ("trap7_trigger", "targetname");
		object = getent ("trap7a", "targetname");
		
		trigger setHintString ("^7Press ^3[Use] ^7to Activate!");
		trigger waittill ("trigger", Player);		
	
		trigger setHintString ("^1Trap Activated!"); 
		
		thread trap7b();
		thread trapquake();
		object moveZ (65, 0.3);
		object waittill("movedone");
		wait(2.5);
		object moveZ (-65, 0.3);
		object waittill("movedone");
}

trap7b()
{
		traplink = getent ("trap7b", "targetname");
		dmg2 = getent ("trap7h", "targetname");
		
		dmg2 enablelinkto ();
		dmg2 linkto (traplink);
		traplink moveZ (-165, 0.3);
		traplink waittill ("movedone");
		wait(2.5);
		traplink moveZ (165, 0.3);
		traplink waittill("movedone");
}

trapquake()
{
		Firesound = getent ("trap7_quake", "targetname");
		trap7_quake = getent( "trap7_quake", "targetname" );
		
		
			wait(0.3);
				Firesound PlaySound( "battle");
				EarthQuake( 0.8, 3, trap7_quake.origin, 2000 );
				//Earthquake( 0.7, 8, trap7_quake.origin, 10000 );
				 
		
}
		
trap8()
{
		trigger = getent ("trap8_trigger", "targetname");
		object = getent ("trap8a", "targetname");
		
		trigger setHintString ("^7Press ^3[Use] ^7to Activate!");
		trigger waittill ("trigger", Player);		
	
		trigger setHintString ("^1Trap Activated!"); 

		while(1)
		{
		thread trap8b();
				
		object moveZ (-50, 1.3);
		object waittill("movedone");
		
		object moveZ (50, 1.3);
		object waittill("movedone");
		
		}
}

trap8b()
{
		object = getent ("trap8b", "targetname");
		
		object moveZ (50, 1.3);
		object waittill("movedone");
		
		object moveZ (-50, 1.3);
		object waittill("movedone");
		
}

trap9()
{
		trigger = getent ("trap9_trigger", "targetname");
		object = getent ("move", "targetname");
		
		trigger setHintString ("^7Press ^3[Use] ^7to Activate!");
		trigger waittill ("trigger", Player);		
	
		trigger setHintString ("^1Trap Activated!"); 

		while(1)
		{
		object moveX (680, 2.5);
		object waittill("movedone");
		object moveX (-680, 2.5);
		object waittill("movedone");
		}
}

trap10()
{
		trigger = getent ("trap10_trigger", "targetname");
		object = getent ("trap10a", "targetname");
		
		trigger setHintString ("^7Press ^3[Use] ^7to Activate!");
		trigger waittill ("trigger", Player);		
	
		trigger setHintString ("^1Trap Activated!"); 

		while(1)
		{
		thread trap10b();
		object moveZ (180, 1);
		object waittill("movedone");
		wait(0.8);
		object moveZ (-180, 1);
		object waittill("movedone");
		wait(2.5);
		
		}
}

trap10b()
{
		object = getent ("trap10b", "targetname");
		
		wait(3.5);
		object moveZ (180, 1);
		object waittill("movedone");
		wait(0.8);
		object moveZ (-180, 1);
		object waittill("movedone");
		wait(2.5);
}
////////////////////////////////////Lifts////////////////////////////////////////
liftdoor()
{
		trigger = getent("lift_door_trigger", "targetname");
		liftL = getent ("liftL", "targetname");
				
		trigger waittill ("trigger", Player);
		trigger delete();
		
		thread liftR();
		liftL moveY (180, 1.5);
		liftL waittill("movedone");

}

liftR()
{
		object = getent ("liftR", "targetname");
		
		object moveY (-180, 1.5);
		object waittill("movedone");
}		
		
liftjumper()
{
		trigger = getent ("liftjumper_trigger", "targetname");
		object = getent ("liftjumper", "targetname");
		
		trigger waittill ("trigger", Player);
		trigger delete();
		
		while(1)
		{
		wait(1.5);
		object moveZ (1284, 3);
		object waittill("movedone");
		wait(4);
		object moveZ (-1284, 3);
		object waittill ("movedone");
		wait(4);
		}
}

liftacti()
{
		trigger = getent ("actilift_trigger", "targetname");
		object = getent ("actilift", "targetname");
		nodmg = getent ("acti_lift_nodmg" , "targetname");
		
		trigger waittill ("trigger", Player);
		trigger delete();
		
		nodmg enablelinkto ();
		nodmg linkto (object);	
		
		while(1)
		{
		wait(1);
		object moveZ (1253, 2);
		object waittill("movedone");
		wait (4);
		object moveZ (-1253, 2);
		object waittill("movedone");
		wait(4);
		}
}
///////////////////////////////////////////Secret////////////////////////////////////////////////////////////
secret()
{
		step1 = getEnt("step1", "targetname");
		object = getent("soliddoor", "targetname");
		step2 = getent ("step2", "targetname");
		step3 = getent ("step3", "targetname");
		platform = getent("secret_eingang", "targetname");
		teleport = getent ("secret_eingang_teleport", "targetname");
		
		for(;;)
		{
		step1 waittill("trigger", player);
		player iPrintLnBold("You opened a Wall!"); //Change the message if you want
		object notsolid();
		step2 waittill ("trigger", player);
		player iPrintLnBold("You pressed a Button!"); //Change the message if you want
		step3 waittill ("trigger", player);
		player iPrintLnBold("You opened the Secretroom!"); //Change the message if you want
		iPrintlnBold( " ^3" + player.name + " ^6 Has opened the Secretroom^1!" ); //Change the message if you want
		teleport enablelinkto ();
		teleport linkto (platform);		
		platform notsolid();
		platform movez(250,1);
		platform waittill("movedone");
		thread tele();
		}
}
tele()
{
	trigger = getEnt ("secret_eingang_teleport", "targetname");
	target = getEnt ("secret_eingang_target", "targetname");
	
	for(;;)
	{
		trigger waittill ("trigger", player);
		
		player iprintlnbold ("Welcome to the Secretroom!");	// change the message if you want
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
	}
}
/*secrettrap()
{
		object1 = getent ("secrettrap1", "targetname");
		object2 = getent ("secrettrap2", "targetname");
		
		while(1)
		{
		object1 rotateroll(360, 2.2);
		object2 moveZ (40, 1.3);
		object2 waittill("movedone");
		object2 moveZ (-20, 2.2);
		object2 waittill("movedone");
		}
}*/
ausgang()
{
	trigger = getEnt ("secret_ausgang_teleport", "targetname");
	target = getEnt ("secret_ausgang_target", "targetname");
	
	for(;;)
	{
		trigger waittill ("trigger", player);
		
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
		
		player giveWeapon("ak74u_mp", 100, 500 );
		player switchToWeapon("ak74u_mp");
		iPrintlnBold( " ^3" + player.name + " ^6 HAS FINISHED THE SECRET ROOM^1!" ); // change the message if you want
		player braxi\_rank::giveRankXp( "", 100);
	}
}	
secretdoor()
{
		trigger = getent ("secret_door_trigger", "targetname");
		object  = getent ("secret_door", "targetname");
		
		trigger waittill("trigger", Player);
		trigger delete();
		
		object moveZ (-110, 2.5);
		object waittill("movedone");
}
respawn1()
{
	trigger = getEnt ("secret_respawn1", "targetname");
	target = getEnt ("secret_respawn1_target", "targetname");
	
	for(;;)
	{
		trigger waittill ("trigger", player);
		
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
	}
}
respawn2()
{
	trigger = getEnt ("secret_respawn2", "targetname");
	target = getEnt ("secret_respawn2_target", "targetname");
	
	for(;;)
	{
		trigger waittill ("trigger", player);
		
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
	}
}
/////////////////////////////////////////////////////////////////////////////
actiteleport()
{
	trigger = getEnt ("acti_teleport_teleport", "targetname");
	target = getEnt ("acti_teleport_target", "targetname");
	trigger2 = getent ("acti_teleport_jumper_trigger", "targetname");
	
	for(;;)
	{
		trigger waittill ("trigger", player);
		trigger delete();
		trigger2 delete();
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
	}
}

actiteleportjumper()
{
		level.acti_teleport_jumper_trigger = getent ("acti_teleport_jumper_trigger", "targetname");
		tele_activator_tunnel = getent ("acti2_teleport_target", "targetname");
		
		level.acti_teleport_jumper_trigger waittill( "trigger", player );
		level.acti_teleport_jumper_trigger delete();
		
		level.activ finalRoom(tele_activator_tunnel);
	
}
finalRoom( tp, weap, health )
{	
    self SetPlayerAngles( tp.angles );
    self SetOrigin( tp.origin );
}	

tunnel1()
{
	jumper = getent ("tunnel1_trigger","targetname");
	fly1_1 = getent ("fly1_1","targetname");
	fly1_2 = getent ("fly1_2","targetname");
	fly1_3 = getent ("fly1_3","targetname");
	fly1_4 = getent ("fly1_4","targetname");
	fly1_5 = getent ("fly1_5","targetname");
	while(1)
	{
	for(;;)
	{
		jumper waittill ("trigger", player);
		if (player istouching(jumper))
		{
			fly = spawn ("script_model",(0,0,0));
			fly.origin = player.origin;
			fly.angles = player.angles;
			player linkto (fly);
			fly moveto (fly1_1.origin, 0.5);
			wait 0.5;
			fly moveto (fly1_2.origin, 0.5);
			wait 0.5;
			fly moveto (fly1_3.origin, 0.5);
			wait 0.5;
			fly moveto (fly1_4.origin, 0.5);
			wait 0.5;
			fly moveto (fly1_5.origin, 0.5);
			wait 1;
			player unlink();
			wait 1;
		}
	}
}
}	
tunnel2()
{
	jumper = getent ("tunnel2_trigger","targetname");
	fly2_1 = getent ("fly2_1","targetname");
	fly2_2 = getent ("fly2_2","targetname");
	fly2_3 = getent ("fly2_3","targetname");
	fly2_4 = getent ("fly2_4","targetname");
	fly2_5 = getent ("fly2_5","targetname");
	while(1)
	{
	for(;;)
	{
		jumper waittill ("trigger", player);
		if (player istouching(jumper))
		{
			fly = spawn ("script_model",(0,0,0));
			fly.origin = player.origin;
			fly.angles = player.angles;
			player linkto (fly);
			fly moveto (fly2_1.origin, 0.5);
			wait 0.5;
			fly moveto (fly2_2.origin, 0.5);
			wait 0.5;
			fly moveto (fly2_3.origin, 0.5);
			wait 0.5;
			fly moveto (fly2_4.origin, 0.5);
			wait 0.5;
			fly moveto (fly2_5.origin, 0.5);
			wait 1;
			player unlink();
			wait 1;
		}
	}
}
}			
tunnel3()
{
	jumper = getent ("tunnel3_trigger","targetname");
	fly3_1 = getent ("fly3_1","targetname");
	fly3_2 = getent ("fly3_2","targetname");
	fly3_3 = getent ("fly3_3","targetname");
	fly3_4 = getent ("fly3_4","targetname");
	fly3_5 = getent ("fly3_5","targetname");
	while(1)
	{
	for(;;)
	{
		jumper waittill ("trigger", player);
		if (player istouching(jumper))
		{
			fly = spawn ("script_model",(0,0,0));
			fly.origin = player.origin;
			fly.angles = player.angles;
			player linkto (fly);
			fly moveto (fly3_1.origin, 0.5);
			wait 0.5;
			fly moveto (fly3_2.origin, 0.5);
			wait 0.5;
			fly moveto (fly3_3.origin, 0.5);
			wait 0.5;
			fly moveto (fly3_4.origin, 0.5);
			wait 0.5;
			fly moveto (fly3_5.origin, 0.5);
			wait 1;
			player unlink();
			wait 1;
		}
	}
}
}
tunnel4()
{
	jumper = getent ("tunnel4_trigger","targetname");
	fly4_1 = getent ("fly4_1","targetname");
	fly4_2 = getent ("fly4_2","targetname");
	fly4_3 = getent ("fly4_3","targetname");
	fly4_4 = getent ("fly4_4","targetname");
	fly4_5 = getent ("fly4_5","targetname");
	while(1)
	{
	for(;;)
	{
		jumper waittill ("trigger", player);
		if (player istouching(jumper))
		{
			fly = spawn ("script_model",(0,0,0));
			fly.origin = player.origin;
			fly.angles = player.angles;
			player linkto (fly);
			fly moveto (fly4_1.origin, 0.5);
			wait 0.5;
			fly moveto (fly4_2.origin, 0.5);
			wait 0.5;
			fly moveto (fly4_3.origin, 0.5);
			wait 0.5;
			fly moveto (fly4_4.origin, 0.5);
			wait 0.5;
			fly moveto (fly4_5.origin, 0.5);
			wait 1;
			player unlink();
			wait 1;
		}
	}
}
}	
tunnel5()
{
	jumper = getent ("tunnel5_trigger","targetname");
	fly5_1 = getent ("fly5_1","targetname");
	fly5_2 = getent ("fly5_2","targetname");
	fly5_3 = getent ("fly5_3","targetname");
	fly5_4 = getent ("fly5_4","targetname");
	fly5_5 = getent ("fly5_5","targetname");
	while(1)
	{
	for(;;)
	{
		jumper waittill ("trigger", player);
		if (player istouching(jumper))
		{
			fly = spawn ("script_model",(0,0,0));
			fly.origin = player.origin;
			fly.angles = player.angles;
			player linkto (fly);
			fly moveto (fly5_1.origin, 0.5);
			wait 0.5;
			fly moveto (fly5_2.origin, 0.5);
			wait 0.5;
			fly moveto (fly5_3.origin, 0.5);
			wait 0.5;
			fly moveto (fly5_4.origin, 0.5);
			wait 0.5;
			fly moveto (fly5_5.origin, 0.5);
			wait 1;
			player unlink();
			wait 1;
		}
	}
}
}	
tunnel6()
{
	jumper = getent ("tunnel6_trigger","targetname");
	fly6_1 = getent ("fly6_1","targetname");
	fly6_2 = getent ("fly6_2","targetname");
	fly6_3 = getent ("fly6_3","targetname");
	fly6_4 = getent ("fly6_4","targetname");
	fly6_5 = getent ("fly6_5","targetname");
	while(1)
	{
	for(;;)
	{
		jumper waittill ("trigger", player);
		if (player istouching(jumper))
		{
			fly = spawn ("script_model",(0,0,0));
			fly.origin = player.origin;
			fly.angles = player.angles;
			player linkto (fly);
			fly moveto (fly6_1.origin, 0.5);
			wait 0.5;
			fly moveto (fly6_2.origin, 0.5);
			wait 0.5;
			fly moveto (fly6_3.origin, 0.5);
			wait 0.5;
			fly moveto (fly6_4.origin, 0.5);
			wait 0.5;
			fly moveto (fly6_5.origin, 0.5);
			wait 1;
			player unlink();
			wait 1;
		}
	}
}
}	
tunnel7()
{
	jumper = getent ("tunnel7_trigger","targetname");
	fly7_1 = getent ("fly7_1","targetname");
	fly7_2 = getent ("fly7_2","targetname");
	fly7_3 = getent ("fly7_3","targetname");
	fly7_4 = getent ("fly7_4","targetname");
	fly7_5 = getent ("fly7_5","targetname");
	while(1)
	{
	for(;;)
	{
		jumper waittill ("trigger", player);
		if (player istouching(jumper))
		{
			fly = spawn ("script_model",(0,0,0));
			fly.origin = player.origin;
			fly.angles = player.angles;
			player linkto (fly);
			fly moveto (fly7_1.origin, 0.5);
			wait 0.5;
			fly moveto (fly7_2.origin, 0.5);
			wait 0.5;
			fly moveto (fly7_3.origin, 0.5);
			wait 0.5;
			fly moveto (fly7_4.origin, 0.5);
			wait 0.5;
			fly moveto (fly7_5.origin, 0.5);
			wait 1;
			player unlink();
			wait 1;
		}
	}
}
}
tunnel8()
{
	jumper = getent ("tunnel8_trigger","targetname");
	fly8_1 = getent ("fly8_1","targetname");
	fly8_2 = getent ("fly8_2","targetname");
	fly8_3 = getent ("fly8_3","targetname");
	fly8_4 = getent ("fly8_4","targetname");
	fly8_5 = getent ("fly8_5","targetname");
	while(1)
	{
	for(;;)
	{
		jumper waittill ("trigger", player);
		if (player istouching(jumper))
		{
			fly = spawn ("script_model",(0,0,0));
			fly.origin = player.origin;
			fly.angles = player.angles;
			player linkto (fly);
			fly moveto (fly8_1.origin, 0.5);
			wait 0.5;
			fly moveto (fly8_2.origin, 0.5);
			wait 0.5;
			fly moveto (fly8_3.origin, 0.5);
			wait 0.5;
			fly moveto (fly8_4.origin, 0.5);
			wait 0.5;
			fly moveto (fly8_5.origin, 0.5);
			wait 1;
			player unlink();
			wait 1;
		}
	}
}
}	
tunnel9()
{
	jumper = getent ("tunnel9_trigger","targetname");
	fly9_1 = getent ("fly9_1","targetname");
	fly9_2 = getent ("fly9_2","targetname");
	fly9_3 = getent ("fly9_3","targetname");
	fly9_4 = getent ("fly9_4","targetname");
	fly9_5 = getent ("fly9_5","targetname");
	while(1)
	{
	for(;;)
	{
		jumper waittill ("trigger", player);
		if (player istouching(jumper))
		{
			fly = spawn ("script_model",(0,0,0));
			fly.origin = player.origin;
			fly.angles = player.angles;
			player linkto (fly);
			fly moveto (fly9_1.origin, 0.5);
			wait 0.5;
			fly moveto (fly9_2.origin, 0.5);
			wait 0.5;
			fly moveto (fly9_3.origin, 0.5);
			wait 0.5;
			fly moveto (fly9_4.origin, 0.5);
			wait 0.5;
			fly moveto (fly9_5.origin, 0.5);
			wait 1;
			player unlink();
			wait 1;
		}
	}
}
}
tunnel10()
{
	jumper = getent ("tunnel10_trigger","targetname");
	fly10_1 = getent ("fly10_1","targetname");
	fly10_2 = getent ("fly10_2","targetname");
	fly10_3 = getent ("fly10_3","targetname");
	fly10_4 = getent ("fly10_4","targetname");
	fly10_5 = getent ("fly10_5","targetname");
	while(1)
	{
	for(;;)
	{
		jumper waittill ("trigger", player);
		if (player istouching(jumper))
		{
			fly = spawn ("script_model",(0,0,0));
			fly.origin = player.origin;
			fly.angles = player.angles;
			player linkto (fly);
			fly moveto (fly10_1.origin, 0.5);
			wait 0.5;
			fly moveto (fly10_2.origin, 0.5);
			wait 0.5;
			fly moveto (fly10_3.origin, 0.5);
			wait 0.5;
			fly moveto (fly10_4.origin, 0.5);
			wait 0.5;
			fly moveto (fly10_5.origin, 0.5);
			wait 1;
			player unlink();
			wait 1;
		}
	}
}
}
tunnel11()
{
	jumper = getent ("tunnel11_trigger","targetname");
	fly11_1 = getent ("fly11_1","targetname");
	fly11_2 = getent ("fly11_2","targetname");
	fly11_3 = getent ("fly11_3","targetname");
	fly11_4 = getent ("fly11_4","targetname");
	fly11_5 = getent ("fly11_5","targetname");
	while(1)
	{
	for(;;)
	{
		jumper waittill ("trigger", player);
		if (player istouching(jumper))
		{
			fly = spawn ("script_model",(0,0,0));
			fly.origin = player.origin;
			fly.angles = player.angles;
			player linkto (fly);
			fly moveto (fly11_1.origin, 0.5);
			wait 0.5;
			fly moveto (fly11_2.origin, 0.5);
			wait 0.5;
			fly moveto (fly11_3.origin, 0.5);
			wait 0.5;
			fly moveto (fly11_4.origin, 0.5);
			wait 0.5;
			fly moveto (fly11_5.origin, 0.5);
			wait 1;
			player unlink();
			wait 1;
		}
	}
}
}
tunnel12()
{
	jumper = getent ("tunnel12_trigger","targetname");
	fly12_1 = getent ("fly12_1","targetname");
	fly12_2 = getent ("fly12_2","targetname");
	fly12_3 = getent ("fly12_3","targetname");
	fly12_4 = getent ("fly12_4","targetname");
	fly12_5 = getent ("fly12_5","targetname");
	while(1)
	{
	for(;;)
	{
		jumper waittill ("trigger", player);
		if (player istouching(jumper))
		{
			fly = spawn ("script_model",(0,0,0));
			fly.origin = player.origin;
			fly.angles = player.angles;
			player linkto (fly);
			fly moveto (fly12_1.origin, 0.5);
			wait 0.5;
			fly moveto (fly12_2.origin, 0.5);
			wait 0.5;
			fly moveto (fly12_3.origin, 0.5);
			wait 0.5;
			fly moveto (fly12_4.origin, 0.5);
			wait 0.5;
			fly moveto (fly12_5.origin, 0.5);
			wait 1;
			player unlink();
			wait 1;
		}
	}
}
}
tunnel13()
{
	jumper = getent ("tunnel13_trigger","targetname");
	fly13_1 = getent ("fly13_1","targetname");
	fly13_2 = getent ("fly13_2","targetname");
	fly13_3 = getent ("fly13_3","targetname");
	fly13_4 = getent ("fly13_4","targetname");
	fly13_5 = getent ("fly13_5","targetname");
	while(1)
	{
	for(;;)
	{
		jumper waittill ("trigger", player);
		if (player istouching(jumper))
		{
			fly = spawn ("script_model",(0,0,0));
			fly.origin = player.origin;
			fly.angles = player.angles;
			player linkto (fly);
			fly moveto (fly13_1.origin, 0.5);
			wait 0.5;
			fly moveto (fly13_2.origin, 0.5);
			wait 0.5;
			fly moveto (fly13_3.origin, 0.5);
			wait 0.5;
			fly moveto (fly13_4.origin, 0.5);
			wait 0.5;
			fly moveto (fly13_5.origin, 0.5);
			wait 1;
			player unlink();
			wait 1;
		}
	}
}
}
tunnel14()
{
	jumper = getent ("tunnel14_trigger","targetname");
	fly14_1 = getent ("fly14_1","targetname");
	fly14_2 = getent ("fly14_2","targetname");
	fly14_3 = getent ("fly14_3","targetname");
	fly14_4 = getent ("fly14_4","targetname");
	fly14_5 = getent ("fly14_5","targetname");
	while(1)
	{
	for(;;)
	{
		jumper waittill ("trigger", player);
		if (player istouching(jumper))
		{
			fly = spawn ("script_model",(0,0,0));
			fly.origin = player.origin;
			fly.angles = player.angles;
			player linkto (fly);
			fly moveto (fly14_1.origin, 0.5);
			wait 0.5;
			fly moveto (fly14_2.origin, 0.5);
			wait 0.5;
			fly moveto (fly14_3.origin, 0.5);
			wait 0.5;
			fly moveto (fly14_4.origin, 0.5);
			wait 0.5;
			fly moveto (fly14_5.origin, 0.5);
			wait 1;
			player unlink();
			wait 1;
		}
	}
}
}
tunnel15()
{
	jumper = getent ("tunnel15_trigger","targetname");
	fly15_1 = getent ("fly15_1","targetname");
	fly15_2 = getent ("fly15_2","targetname");
	fly15_3 = getent ("fly15_3","targetname");
	fly15_4 = getent ("fly15_4","targetname");
	fly15_5 = getent ("fly15_5","targetname");
	while(1)
	{
	for(;;)
	{
		jumper waittill ("trigger", player);
		if (player istouching(jumper))
		{
			fly = spawn ("script_model",(0,0,0));
			fly.origin = player.origin;
			fly.angles = player.angles;
			player linkto (fly);
			fly moveto (fly15_1.origin, 0.5);
			wait 0.5;
			fly moveto (fly15_2.origin, 0.5);
			wait 0.5;
			fly moveto (fly15_3.origin, 0.5);
			wait 0.5;
			fly moveto (fly15_4.origin, 0.5);
			wait 0.5;
			fly moveto (fly15_5.origin, 0.5);
			wait 1;
			player unlink();
			wait 1;
		}
	}
}
}
tunnel16()
{
	jumper = getent ("tunnel16_trigger","targetname");
	fly16_1 = getent ("fly16_1","targetname");
	fly16_2 = getent ("fly16_2","targetname");
	fly16_3 = getent ("fly16_3","targetname");
	fly16_4 = getent ("fly16_4","targetname");
	fly16_5 = getent ("fly16_5","targetname");
	while(1)
	{
	for(;;)
	{
		jumper waittill ("trigger", player);
		if (player istouching(jumper))
		{
			fly = spawn ("script_model",(0,0,0));
			fly.origin = player.origin;
			fly.angles = player.angles;
			player linkto (fly);
			fly moveto (fly16_1.origin, 0.5);
			wait 0.5;
			fly moveto (fly16_2.origin, 0.5);
			wait 0.5;
			fly moveto (fly16_3.origin, 0.5);
			wait 0.5;
			fly moveto (fly16_4.origin, 0.5);
			wait 0.5;
			fly moveto (fly16_5.origin, 0.5);
			wait 1;
			player unlink();
			wait 1;
		}
	}
}
}
tunnel17()
{
	jumper = getent ("tunnel17_trigger","targetname");
	fly17_1 = getent ("fly17_1","targetname");
	fly17_2 = getent ("fly17_2","targetname");
	fly17_3 = getent ("fly17_3","targetname");
	fly17_4 = getent ("fly17_4","targetname");
	fly17_5 = getent ("fly17_5","targetname");
	while(1)
	{
	for(;;)
	{
		jumper waittill ("trigger", player);
		if (player istouching(jumper))
		{
			fly = spawn ("script_model",(0,0,0));
			fly.origin = player.origin;
			fly.angles = player.angles;
			player linkto (fly);
			fly moveto (fly17_1.origin, 0.5);
			wait 0.5;
			fly moveto (fly17_2.origin, 0.5);
			wait 0.5;
			fly moveto (fly17_3.origin, 0.5);
			wait 0.5;
			fly moveto (fly17_4.origin, 0.5);
			wait 0.5;
			fly moveto (fly17_5.origin, 0.5);
			wait 1;
			player unlink();
			wait 1;
		}
	}
}
}
tunnel18()
{
	jumper = getent ("tunnel18_trigger","targetname");
	fly18_1 = getent ("fly18_1","targetname");
	fly18_2 = getent ("fly18_2","targetname");
	fly18_3 = getent ("fly18_3","targetname");
	fly18_4 = getent ("fly18_4","targetname");
	fly18_5 = getent ("fly18_5","targetname");
	while(1)
	{
	for(;;)
	{
		jumper waittill ("trigger", player);
		if (player istouching(jumper))
		{
			fly = spawn ("script_model",(0,0,0));
			fly.origin = player.origin;
			fly.angles = player.angles;
			player linkto (fly);
			fly moveto (fly18_1.origin, 0.5);
			wait 0.5;
			fly moveto (fly18_2.origin, 0.5);
			wait 0.5;
			fly moveto (fly18_3.origin, 0.5);
			wait 0.5;
			fly moveto (fly18_4.origin, 0.5);
			wait 0.5;
			fly moveto (fly18_5.origin, 0.5);
			wait 1;
			player unlink();
			wait 1;
		}
	}
}
}
train()
{
		
			trigger = getent ("train_trigger", "targetname");
			object = getent ("train", "targetname");
			gleis2 = getent ("gleis2", "targetname"); //broke
			door2 = getent ("door2", "targetname"); //broke
			scheibe = getent ("train_scheibe", "targetname");
			backdoor = getent ("train_backdoor", "targetname");
			sound = getent ("train_sound", "targetname");
			
			gleis2 hide();
			gleis2 notsolid();			
			door2 hide();
			door2 notsolid();
			
			trigger waittill("trigger",player);
			trigger delete();
			
			//sound enablelinkto ();
			sound linkto (object);
			//backdoor enablelinkto ();
			backdoor linkto (object);
			//scheibe enablelinkto ();
			scheibe linkto (object);
			wait(3);			
			sound Playsound ( "trains" );
			object moveY (2640, 1);
			object waittill("movedone");
			scheibe unlink();
			backdoor unlink();
			thread trainquake();
}
trainquake()
{
			gleis1 = getent ("gleis1", "targetname");
			gleis2 = getent ("gleis2", "targetname"); //broke
			door1 = getent ("door1", "targetname");
			door2 = getent ("door2", "targetname"); //broke
			scheibe = getent ("train_scheibe", "targetname");
			backdoor = getent ("train_backdoor", "targetname");
			door1_boom = getent ("door1_boom", "targetname"); //origin
			firesound = getent("door1_boom","targetname"); //origin	

			
			
			firesound PlaySound( "rock"); 
			playFx(level.fire, door1_boom.origin);
			EarthQuake( 1, 4, door1_boom.origin, 4000 );	
			gleis1 hide();
			gleis1 notsolid();
			gleis2 solid();
			gleis2 show();	
			door1 hide();
			door1 notsolid();
			door2 show();
			door2 solid();
			scheibe hide();
			scheibe notsolid();
			backdoor hide();
			backdoor notsolid();
			wait 1;
}
///////////////////////////////////////////////ENDROOMS/////////////////////////////////////////////////
SniperFight()
{
	
    level.sniper_trigger = getEnt( "sniper_trigger", "targetname");
    tele_activator = getEnt( "sniper_activator_teleport", "targetname" );
    tele_jumper = getEnt( "sniper_jumper_teleport", "targetname" );
    music_changed = false;           
    level.finalJumper = undefined;
	
		
    while( 1 )
    {
	
		level.sniper_trigger waittill( "trigger", player );
        if( !isDefined( level.sniper_trigger ) )
            return;
			
		if(level.firstenter==true)
		{
		level.bounce_trigger delete();
		level.old_jumper_trigger delete();
		level.knife_trigger delete();
		level.knife_rotate_trigger delete();
		level.firstenter=false;
		}
     
		
		

      
       if( level.freeRun || isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
            continue;

        level.finalJumper = player;
        level.finalJumper thread finalMonitor();
        
        level.finalJumper finalRoom0( tele_jumper, "remington700_mp", 100);
        level.activ finalRoom0( tele_activator, "remington700_mp", 100);
		if (!music_changed)
		{
			music_changed = true;
			thread endMusic();
		}
		iPrintlnBold( " ^3" + player.name + " ^6 HAS ENTERED THE SNIPER ROOM^1!" );
    }
   
}

endMusic()
{
	AmbientStop(1);
	wait 0.5;
	//AmbientPlay("sniper");
	mapper\_music::PlayNow("sniper", "Dubstep - Earthquake (Fytch Remix)");
	wait (2);
	iprintln("^1>>^7Now Playing^3: ^1Dubstep ^3- ^7Earthquake (Fytch Remix) ^1<<");
	iprintln("^1>>^7Now Playing^3: ^1Dubstep ^3- ^7Earthquake (Fytch Remix) ^1<<");
}
	

finalMonitor()
{
    self endon( "disconnect" );
    self thread monitorDisconnect();

    while( self.sessionstate == "playing" )
        wait 0.05;
    level.finalJumper = undefined;
}

monitorDisconnect()
{
    self waittill( "disconnect" );
    level.finalJumper = undefined;
}

finalRoom0( tp, weap, health )
{
	
    self SetPlayerAngles( tp.angles );
    self SetOrigin( tp.origin );
	
	
    
    self TakeAllWeapons(); 
    self GiveWeapon( weap );
    self GiveMaxAmmo( weap );
    self SwitchToWeapon( weap );
}	

	KnifeFight()
{
	
    level.knife_trigger = getEnt( "knife_trigger", "targetname");
    tele_activator = getEnt( "knife_activator_teleport", "targetname" );
    tele_jumper = getEnt( "knife_jumper_teleport", "targetname" );
    music_changed = false;            
    level.finalJumper = undefined;
	
		
    while( 1 )
    {
		
		level.knife_trigger waittill( "trigger", player );
        if( !isDefined( level.knife_trigger ) )
            return;
			
		if(level.firstenter==true)
		{
		level.sniper_trigger delete();
		level.old_jumper_trigger delete();
		level.bounce_trigger delete();
		level.knife_rotate_trigger delete();
		level.firstenter=false;
		}
		
       
		

      
        if( level.freeRun || isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
            continue;

        level.finalJumper = player;
        level.finalJumper thread finalMonitor1();
        
        level.finalJumper finalRoom1( tele_jumper, "tomahawk_mp");
        level.activ finalRoom1( tele_activator, "tomahawk_mp");
		if (!music_changed)
		{
			music_changed = true;
			thread endMusic1();
		}
		iPrintlnBold( " ^3" + player.name + " ^6 HAS ENTERED THE KNIFE ROOM^1!" );
    }
   
}

endMusic1()
{
	AmbientStop(1);
	wait 0.5;
	//AmbientPlay("knife");
	mapper\_music::PlayNow("knife", "Linkin Park - In The End (Dubstep Remix)");
	wait (5); 
	iprintln("^1>>^7Now Playing^3: ^1Linkin Park ^3- ^7In The End (Dubstep Remix)^1<<");
	iprintln("^1>>^7Now Playing^3: ^1Linkin Park ^3- ^7In The End (Dubstep Remix)^1<<");
		
}
	

finalMonitor1()
{
    self endon( "disconnect" );
    self thread monitorDisconnect1();

    while( self.sessionstate == "playing" )
        wait 0.05;
    level.finalJumper = undefined;
}

monitorDisconnect1()
{
    self waittill( "disconnect" );
    level.finalJumper = undefined;
}

finalRoom1( tp, weap, health )
{
    self SetPlayerAngles( tp.angles );
    self SetOrigin( tp.origin );
    
    self TakeAllWeapons(); 
    self GiveWeapon( weap );
    self GiveMaxAmmo( weap );
    self SwitchToWeapon( weap );
}	

BounceFight()
{
	
    level.bounce_trigger = getEnt( "bounce_trigger", "targetname");
    tele_activator = getEnt( "bounce_activator_teleport", "targetname" );
    tele_jumper = getEnt( "bounce_jumper_teleport", "targetname" );
    music_changed = false;           
    level.finalJumper = undefined;
	
		
    while( 1 )
    {
		level.bounce_trigger waittill( "trigger", player );
        if( !isDefined( level.bounce_trigger ) )
            return;
			
		if(level.firstenter==true)
		{
		level.sniper_trigger delete();
		level.old_jumper_trigger delete();
		level.knife_trigger delete();
		level.knife_rotate_trigger delete();
		level.firstenter=false;
		}
        
		
		
        if( level.freeRun || isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
            continue;

        level.finalJumper = player;
        level.finalJumper thread finalMonitor2();
        
		level.finalJumper finalRoom2( tele_jumper, "knife_mp");
		level.activ finalRoom2( tele_activator, "knife_mp");
		if (!music_changed)
		{
			music_changed = true;
			thread endMusic2();
		}
		iPrintlnBold( " ^3" + player.name + " ^6 HAS ENTERED THE BOUNCE ROOM^1!" );
    }
   
}

bouncerespawn()
{
	trigger = getEnt ("bounce_respawn_trigger", "targetname");
	jumper = getEnt ("bounce_jumper_respawn", "targetname");
	activator = getEnt ("bounce_activator_respawn", "targetname");
	
	for(;;)
	{
		trigger waittill ("trigger", player);
		if(player.pers["team"] == "allies")
		{
			player SetOrigin(jumper.origin);
			player SetPlayerAngles( jumper.angles );
		}
		else if(player.pers["team"] == "axis")	
		{
			player SetOrigin(activator.origin);
			player SetPlayerAngles( activator.angles );			
		}
	}
}


endMusic2()
{
	AmbientStop(1);
	wait 0.5;
	//AmbientPlay("bounce");
	mapper\_music::PlayNow("bounce", "Linkin Park - New Divide (Dubstep Remix)");
	wait (2);
	iprintln("^1>>^7Now Playing^3: ^1Linkin Park ^3- ^7New Divide (Dubstep Remix)^1<<");
	iprintln("^1>>^7Now Playing^3: ^1Linkin Park ^3- ^7New Divide (Dubstep Remix)^1<<");
}
	

finalMonitor2()
{
    self endon( "disconnect" );
    self thread monitorDisconnect2();

    while( self.sessionstate == "playing" )
        wait 0.05;
    level.finalJumper = undefined;
}

monitorDisconnect2()
{
    self waittill( "disconnect" );
    level.finalJumper = undefined;
}

finalRoom2( tp, weap, health )
{
	
    self SetPlayerAngles( tp.angles );
    self SetOrigin( tp.origin );
	
	
    
    self TakeAllWeapons(); 
    self GiveWeapon( weap );
    self GiveMaxAmmo( weap );
    self SwitchToWeapon( weap );
}

KnifeRotateFight()
{
	
    level.knife_rotate_trigger = getEnt( "knife_rotate_trigger", "targetname");
    tele_activator = getEnt( "knife_rotate_activator_teleport", "targetname" );
    tele_jumper = getEnt( "knife_rotate_jumper_teleport", "targetname" );
    music_changed = false;            
    level.finalJumper = undefined;
	thread rotation();
		
    while( 1 )
    {
		
		level.knife_rotate_trigger waittill( "trigger", player );
        if( !isDefined( level.knife_rotate_trigger ) )
            return;
			
		if(level.firstenter==true)
		{
		level.sniper_trigger delete();
		level.old_jumper_trigger delete();
		level.bounce_trigger delete();
		level.firstenter=false;
		}
		
      		
      
        if( level.freeRun || isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
            continue;

        level.finalJumper = player;
        level.finalJumper thread finalMonitor3();
        
        level.finalJumper finalRoom3( tele_jumper, "tomahawk_mp");
        level.activ finalRoom3( tele_activator, "tomahawk_mp");
		
		if (!music_changed)
		{
			music_changed = true;
			thread endMusic3();
		}
		
		iPrintlnBold( " ^3" + player.name + " ^6 HAS ENTERED THE KNIFE ROTATE ROOM^1!" );
	}
  
}
rotation()
{
		object = getent ("rotateknife", "targetname");
		wait(2.5);
		while(1)
		{
		object rotateYAW (360, 0.8);
		object moveZ (-150, 0.8);
		object waittill("movedone");
		object moveZ (150, 0.8);
		object waittill("movedone");
		wait(1);
		}
}
endMusic3()
{
	AmbientStop(1);
	wait 0.5;
	//AmbientPlay("rotateknife");
	mapper\_music::PlayNow("rotateknife", "DJ BL3ND & Modulation - Here we go (Original Mix)");
	wait (2);
	iprintln("^1>>^7Now Playing^3: ^1DJ BL3ND & Modulation ^3- ^7Here we go (Original Mix)^1<<");
	iprintln("^1>>^7Now Playing^3: ^1DJ BL3ND & Modulation ^3- ^7Here we go (Original Mix)^1<<");
}
	

finalMonitor3()
{
    self endon( "disconnect" );
    self thread monitorDisconnect3();

    while( self.sessionstate == "playing" )
        wait 0.05;
    level.finalJumper = undefined;
}

monitorDisconnect3()
{
    self waittill( "disconnect" );
    level.finalJumper = undefined;
}

finalRoom3( tp, weap, health )
{
    self SetPlayerAngles( tp.angles );
    self SetOrigin( tp.origin );
    
    self TakeAllWeapons(); 
    self GiveWeapon( weap );
    self GiveMaxAmmo( weap );
    self SwitchToWeapon( weap );
}

knife_respawn()
{
	trigger = getEnt ("knife_respawn_trigger", "targetname");
	target = getEnt ("knife_respawn", "targetname");
	
	for(;;)
	{
		trigger waittill ("trigger", player);
		
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
	}
}



oldfight()
{
	
   	level.old_jumper_trigger = getEnt( "old_jumper_trigger", "targetname");
	object = getent ("old_door", "targetname");
	music_changed = false;
	for(;;)
	{
	while( 1 )
    {
		
		level.old_jumper_trigger waittill( "trigger", player );
        if( !isDefined( level.old_jumper_trigger ) )
            return;
		thread old_door2();	
		if(level.firstenter==true)
		{
		level.sniper_trigger delete();
		level.knife_trigger delete();
		level.bounce_trigger delete();
		//level.old_jumper_trigger delete():
		level.knife_rotate_trigger delete();
		level.firstenter=false;
		}
		level.old_jumper_trigger delete();
        
	
	if( level.freeRun || isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
            continue;
		
		object moveZ (-145, 2.5);
		iPrintlnBold( " ^3" + player.name + " ^6 HAS OPENED THE OLD WAY^1!" );
		
		if (!music_changed)
		{
			music_changed = true;
			thread endMusic4();
			}
		}
		
	}	
	
}

endMusic4()
{
	AmbientStop(1);
	wait 0.5;
	//AmbientPlay("old");
	mapper\_music::PlayNow("old", "Linkin Park - Crawling (SHVR Dubstep Remix)");
	wait (2); 
	iprintln("^1>>^7Now Playing^3: ^1Linkin Park ^3- ^7Crawling (SHVR Dubstep Remix)^1<<");
	iprintln("^1>>^7Now Playing^3: ^1Linkin Park ^3- ^7Crawling (SHVR Dubstep Remix)^1<<");

}	

old_door2()
{
		wait(3);
		object = getent ("old_door2", "targetname");
		
		wait(2);
		object moveZ (-150, 2.5);
}

bounceweapon()
{
		trigger = getent ("bounce_room_weapon", "targetname");
		
		trigger waittill ("trigger", user);
		trigger delete();
		
		{
			{
			wait 0.25;
			random = randomInt(13);

			if(random == 0)
			{
				user giveWeapon("deserteagle_mp", 100, 500 );
				user switchToWeapon("deserteagle_mp");
			
			}
			if(random == 1)
			{
				user giveWeapon("uzi_mp", 100, 500 );
				user switchToWeapon("uzi_mp");
				
			}
			if(random == 2)
			{
				user giveWeapon("m4_mp", 100, 500 );
				user switchToWeapon("m4_mp");
				
			}
			if(random == 3)
			{
				user giveWeapon("ak47_mp", 100, 500 );
				user switchToWeapon("ak47_mp");
				
			}
			if(random == 4)
			{
				user giveWeapon("g3_mp", 100, 500 );
				user switchToWeapon("g3_mp");
				
			}
			if(random == 5)
			{
				user giveWeapon("m60e4_mp", 100, 500 );
				user switchToWeapon("m60e4_mp");
				
			}
			if(random == 6)
			{
				user giveWeapon("p90_mp", 100, 500 );
				user switchToWeapon("p90_mp");
				
			}
			if(random == 7)
			{
				user giveWeapon("m40a3_mp", 100, 500 );
				user switchToWeapon("m40a3_mp");
				
			}
			if(random == 8)
			{
				user giveWeapon("barrett_mp", 100, 500 );
				user switchToWeapon("barrett_mp");
				
			}
			if(random == 9)
			{
				user giveWeapon("g36c_silencer_mp", 100, 0 );
				user switchToWeapon("g36c_silencer_mp");
				
			}
			if(random == 10)
			{
				user giveWeapon("skorpion_silencer_mp", 100, 500 );
				user switchToWeapon("skorpion_silencer_mp");
				
			}
			if(random == 11)
			{
				user giveWeapon("saw_grip_mp", 100, 500 );
				user switchToWeapon("saw_grip_mp");
				
			}
			if(random == 12)
			{
				user giveWeapon("remington700_mp", 100, 500 );
				user switchToWeapon("remington700_mp");
				
			}
			if(random == 13)
			{
				user giveWeapon("ak74u_mp", 100, 500 );
				user switchToWeapon("ak74u_mp");
			}
		}
	}
}

printCredits()
    {
            if( isDefined( self.logoText ) )
                    self.logoText destroy();
     
            self.logoText = newHudElem();
            self.logoText.y = 10;
            self.logoText.alignX = "center";
            self.logoText.alignY = "middle";
            self.logoText.horzAlign = "center_safearea";
     
            self.logoText.alpha = 0;
            self.logoText.sort = -3;
            self.logoText.fontScale = 1.6;
            self.logoText.archieved = true;
     
            for(;;)
            {
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 1;
                    self.logoText setText("^7---^3Map created by Elpredatore^7---");
                    wait 3;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 1;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 1;
                    self.logoText setText("^7--^3xf: elpredatore^7---");
                    wait 3;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 1;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 1;
                    self.logoText setText("^7---^3Scripted by TwiYo^7---");
                    wait 3;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 1;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 1;
                    self.logoText setText("^7---^3xf: 1buzzz^7---");
                    wait 3;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 1;
					self.logoText fadeOverTime(1);
                    self.logoText.alpha = 1;
                    self.logoText setText("^7---^3www^1.^3ix^1-^3treme^1.^3com^7---");
                    wait 3;
					self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
					wait 1;
		}
	
	}