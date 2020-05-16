main()
{
	maps\mp\_load::main();

	//VisionSetNaked( "mp_crossfire" );
	ambientPlay("electric");

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	setdvar( "r_specularcolorscale", "1.85" );
	
	precacheItem( "ak47_mp" );

	setdvar("compassmaxrange","2100");
	thread trap1();
	thread trap2();
	thread move25();
	thread trap4();
	thread opendoor();
	thread move25();
	thread move26();
	thread trap_5();
	thread trap_6();
	thread trap_7();
	thread trap_8();
	thread trap_9();
	thread finalAk();
	thread knifeFight();
	thread desertFight();
	thread sniperFight();
            addTriggerToList("trap1_trig");
            addTriggerToList("trap3_trig");
            addTriggerToList("trap4_trig");
            addTriggerToList("trigger5");
	        addTriggerToList("trigger6");
			addTriggerToList("trigger7");
			addTriggerToList("trigger8");
			addTriggerToList("trigger9");
}
addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}		
trap1()
{
	trig = getEnt ("trap1_trig", "targetname");
	
	trig waittill ("trigger");
	
	wait .05;
	thread move1();
	thread move2();
	thread move3();
	thread move4();
	thread move5();
	thread move6();
	thread move7();
	thread move8();
	thread move9();
	thread move10();
	thread move11();
	thread move12();
	thread move13();
	thread move14();
    thread move15();
	thread move16();
	thread move17();
	thread move18();
	thread move19();
	thread move20();
	thread move21();
	thread move22();
	thread move23();
	thread move24();
		
}
move1()
{
	brush = getEnt ("trap1.1", "targetname");

		brush moveZ( 50,3);
		brush waittill("movedone");
		wait 0.5;
		while(1)
	    {
		brush moveZ( -100,1);
		brush waittill("movedone");
		wait 0.1;
		brush moveZ( 100,1);
		brush waittill("movedone");
	   }
	 
}
move2()
{
	brush = getEnt ("trap1.2", "targetname");

		brush moveZ( -50,3);
		brush waittill("movedone");
		wait 0.5;
		while(1)
	    {
		brush moveZ( 100,1);
		brush waittill("movedone");
		wait 0.1;
		brush moveZ( -100,1);
		brush waittill("movedone");
	   }
	 
}
move3()
{
	brush = getEnt ("trap1.3", "targetname");

		brush moveZ( 50,3);
		brush waittill("movedone");
		wait 0.5;
		while(1)
	    {
		brush moveZ( -100,1);
		brush waittill("movedone");
		wait 0.1;
		brush moveZ( 100,1);
		brush waittill("movedone");
	   }
	 
}
move4()
{
	brush = getEnt ("trap1.4", "targetname");

		brush moveZ( -50,3);
		brush waittill("movedone");
		wait 1;
		brush delete();
	 
}
move5()
{
	brush = getEnt ("trap1.5", "targetname");

		brush moveZ( 50,3);
		brush waittill("movedone");
		wait 0.5;
		while(1)
	    {
		brush moveZ( -100,1);
		brush waittill("movedone");
		wait 0.1;
		brush moveZ( 100,1);
		brush waittill("movedone");
	   }
	 
}
move6()
{
	brush = getEnt ("trap1.6", "targetname");

		brush moveZ( -50,3);
		brush waittill("movedone");
		wait 0.5;
		while(1)
	    {
		brush moveZ( 100,1);
		brush waittill("movedone");
		wait 0.1;
		brush moveZ( -100,1);
		brush waittill("movedone");
	   }
	 
}
move7()
{
	brush = getEnt ("trap1.7", "targetname");

		brush moveZ( 50,3);
		brush waittill("movedone");
		wait 0.5;
		while(1)
	    {
		brush moveZ( -100,1);
		brush waittill("movedone");
		wait 0.1;
		brush moveZ( 100,1);
		brush waittill("movedone");
	   }
	 
}
move8()
{
	brush = getEnt ("trap1.8", "targetname");

		brush moveZ( -50,3);
		brush waittill("movedone");
		wait 1;
		brush delete();
	 
}
move9()
{
	brush = getEnt ("trap1.9", "targetname");

		brush moveZ( 50,3);
		brush waittill("movedone");
		wait 0.5;
		while(1)
	    {
		brush moveZ( -100,1);
		brush waittill("movedone");
		wait 0.1;
		brush moveZ( 100,1);
		brush waittill("movedone");
	   }
	 
}
move10()
{
	brush = getEnt ("trap1.10", "targetname");

		brush moveZ( -50,3);
		brush waittill("movedone");
		wait 0.5;
		while(1)
	    {
		brush moveZ( 100,1);
		brush waittill("movedone");
		wait 0.1;
		brush moveZ( -100,1);
		brush waittill("movedone");
	   }
	 
}
move11()
{
	brush = getEnt ("trap1.11", "targetname");

		brush moveZ( 50,3);
		brush waittill("movedone");
		wait 0.5;
		while(1)
	    {
		brush moveZ( -100,1);
		brush waittill("movedone");
		wait 0.1;
		brush moveZ( 100,1);
		brush waittill("movedone");
	   }
	 
}
move12()
{
	brush = getEnt ("trap1.12", "targetname");

		brush moveZ( -50,3);
		brush waittill("movedone");
		wait 1;
		brush delete();
	 
}	 	 	 
move13()
{
	brush = getEnt ("trap1.13", "targetname");

		brush moveZ( 50,3);
		brush waittill("movedone");
		wait 0.5;
		while(1)
	    {
		brush moveZ( -100,1);
		brush waittill("movedone");
		wait 0.1;
		brush moveZ( 100,1);
		brush waittill("movedone");
	   }
	 
}
move14()
{
	brush = getEnt ("trap1.14", "targetname");

		brush moveZ( -50,3);
		brush waittill("movedone");
		wait 0.5;
		while(1)
	    {
		brush moveZ( 100,1);
		brush waittill("movedone");
		wait 0.1;
		brush moveZ( -100,1);
		brush waittill("movedone");
	   }
	 
}
move15()
{
	brush = getEnt ("trap1.15", "targetname");

		brush moveZ( 50,3);
		brush waittill("movedone");
		wait 0.5;
		while(1)
	    {
		brush moveZ( -100,1);
		brush waittill("movedone");
		wait 0.1;
		brush moveZ( 100,1);
		brush waittill("movedone");
	   }
	 
}
move16()
{
	brush = getEnt ("trap1.16", "targetname");

		brush moveZ( 50,3);
		brush waittill("movedone");
		wait 0.5;
		while(1)
	    {
		brush moveZ( -100,1);
		brush waittill("movedone");
		wait 0.1;
		brush moveZ( 100,1);
		brush waittill("movedone");
	   }
	 
}
move17()
{
	brush = getEnt ("trap1.17", "targetname");

		brush moveZ( -50,3);
		brush waittill("movedone");
		wait 0.5;
		while(1)
	    {
		brush moveZ( 100,1);
		brush waittill("movedone");
		wait 0.1;
		brush moveZ( -100,1);
		brush waittill("movedone");
	   }
	 
}
move18()
{
	brush = getEnt ("trap1.18", "targetname");

		brush moveZ( 50,3);
		brush waittill("movedone");
		wait 0.5;
		while(1)
	    {
		brush moveZ( -100,1);
		brush waittill("movedone");
		wait 0.1;
		brush moveZ( 100,1);
		brush waittill("movedone");
	   }
	 
}
move19()
{
	brush = getEnt ("trap1.19", "targetname");

		brush moveZ( -50,3);
		brush waittill("movedone");
		wait 1;
		brush delete();
	 
}
move20()
{
	brush = getEnt ("trap1.20", "targetname");

		brush moveZ( 50,3);
		brush waittill("movedone");
		wait 0.5;
		while(1)
	    {
		brush moveZ( -100,1);
		brush waittill("movedone");
		wait 0.1;
		brush moveZ( 100,1);
		brush waittill("movedone");
	   }
	 
}
move21()
{
	brush = getEnt ("trap1.21", "targetname");

		brush moveZ( -50,3);
		brush waittill("movedone");
		wait 1;
		brush delete();
	 
}	 	 
move22()
{
	brush = getEnt ("trap1.22", "targetname");

		brush moveZ( 50,3);
		brush waittill("movedone");
		wait 0.5;
		while(1)
	    {
		brush moveZ( -100,1);
		brush waittill("movedone");
		wait 0.1;
		brush moveZ( 100,1);
		brush waittill("movedone");
	   }
	 
}
move23()
{
	brush = getEnt ("trap1.23", "targetname");

		brush moveZ( -50,3);
		brush waittill("movedone");
		wait 1;
		brush delete();
	 
}	 	 
move24()
{
	brush = getEnt ("trap1.24", "targetname");

		brush moveZ( 50,3);
		brush waittill("movedone");
		wait 0.5;
		while(1)
	    {
		brush moveZ( -100,1);
		brush waittill("movedone");
		wait 0.1;
		brush moveZ( 100,1);
		brush waittill("movedone");
	   }
	 
}
trap2()
{	
trig = getEnt ("trap2_trig", "targetname");	
hurt = getEnt ("trap2_spikeshurt", "targetname");	
spikes = getEnt ("trap2_spike", "targetname"); 

hurt enablelinkto(); 
hurt linkto (spikes); 

trig waittill ("trigger");
{ 
spikes moveZ (-123,4);	
spikes waittill("movedone");
wait 1;
hurt delete();
spikes delete();
}
}
move25()
{
    trig = getEnt ("trap3_trig", "targetname");	
	brush = getEnt( "move25", "targetname" );

	trig waittill( "trigger", who );
	if (IsDefined(trig)) trig delete();

	brush moveZ( 870,3);
	wait 1;
	brush moveZ( -870,3);
}
trap4()
{
	trig = getEnt ("trap4_trig", "targetname");
	
	trig waittill ("trigger");
	
	wait .05;
	thread move41();
}	
move41()
{
	brush = getEnt ("trap4.1", "targetname");

		brush moveZ( -50,1);
		brush waittill("movedone");
		wait 1;
		brush delete();
	 
}
opendoor()
{
	trig = getEnt ("door_trig", "targetname");
	
	trig waittill ("trigger");
	
	wait .05;
	thread door();
	thread rotate();
}
door()
{
	brush = getEnt ("trap5.1", "targetname");

		brush moveZ( -50,1);
		brush waittill("movedone");
		wait 1;
		brush delete();
	 
}
rotate()
{
	brush = getEnt( "trap5.2", "targetname" );
	
	for( i = 0; i < 8; i++ )
	{
		brush rotateYaw( 360, 1 );
		wait 1;
	}
}
move26()
{
	brush = getEnt( "move26", "targetname" );

	while(1)
	{
		brush moveY( 300,3);
		brush waittill("movedone");
		wait 1;
		brush moveY( -300,3);
		brush waittill("movedone");
		wait 1;
	}
	
}		
trap_5()
{
	trig = getEnt( "trigger5", "targetname" );
	brush = getEnt( "trap5", "targetname" );

	trig waittill( "trigger", who );
	trig delete();

	while( isDefined( brush ) )
	{
		brush rotateRoll( 180, 2 );
		wait 4;
	}
}
trap_6()
{
	trig = getEnt( "trigger6", "targetname" );
	brush = getEnt( "trap6", "targetname" );

	trig waittill( "trigger", who );
	trig delete();

	while( isDefined( brush ) )
	{
		brush rotateRoll( 180, 2 );
		wait 4;
	}
}
trap_7()
{
	trig = getEnt( "trigger7", "targetname" );
	brush = getEnt( "trap7", "targetname" );

	trig waittill( "trigger", who );
	
	for( i = 0; i < 2; i++ )
	{
		brush rotateYaw( 512, 3 );
		wait 3;
		brush rotateYaw( -512, 3 );
		wait 3;
	}
}
trap_8()
{
	trig = getEnt ("trigger8", "targetname");
	
	trig waittill ("trigger");
	
	wait .05;
	thread movetrap();
}
movetrap()
{
	brush = getEnt( "trap8", "targetname" );

	while(1)
	{
		brush moveX( -500,12);
		brush waittill("movedone");
		wait 3;
		brush moveX( 500,12);
		brush waittill("movedone");
		wait 3;
	}
	
}	
trap_9()
{
	trig = getEnt( "trigger9", "targetname" );
	brush = getEnt( "trap9", "targetname" );

	trig waittill( "trigger", who );
	trig delete();
	
	for( i = 0; i < 2; i++ )
	{
		brush rotateYaw( 512, 3 );
		wait 3;
		brush rotateYaw( -512, 3 );
		wait 3;
	}
}
finalAk()
{
    trig = getEnt( "ak_trigger", "targetname" );
    tele_activator = getEnt( "ak_activator_teleport", "targetname" );
    tele_jumper = getEnt( "ak_jumper_teleport", "targetname" );
                
    level.akJumper = undefined;

    while( 1 )
    {
        trig waittill( "trigger", player );

        // this will be blocked if jumper is currently in room and while its free run round
        if( /*level.freeRun ||*/ isDefined( level.akJumper ) || player.pers["team"] != "allies" )
            continue;
			
        AmbientStop( 2 );			
		ambientPlay("ak"); 
        level.akJumper = player;
        level.akJumper thread akMonitor();
        
        level.akJumper thread akRoom( tele_jumper, "ak47_mp", 100 );
		if (IsDefined(level.activ))
			level.activ thread akRoom( tele_activator, "ak47_mp", 100 );
			
		wait 0.05;
    }
    // code never gets here
}
akMonitor()
{
    self endon( "disconnect" );
    self thread akDisconnect();

    while( self.sessionstate == "playing" )
        wait 0.05;
    level.akJumper = undefined;
}

akDisconnect()
{
    self waittill( "disconnect" );
    level.akJumper = undefined;
}

akRoom( tp, weap, health )
{
	self endon("disconnect");
	self endon("death");

    self SetPlayerAngles( tp.angles );
    self SetOrigin( tp.origin );
    
    self TakeAllWeapons(); //this should be called so it takes away insertion perk in dr 1.2
    self GiveWeapon( weap );
    self GiveMaxAmmo( weap );
	wait 0.05;
    self SwitchToWeapon( weap );
    
    self.maxhealth = health;
}
knifeFight()
{
    trig = getEnt( "knife_trigger", "targetname" );
    tele_activator = getEnt( "knife_activator_teleport", "targetname" );
    tele_jumper = getEnt( "knife_jumper_teleport", "targetname" );
                
    level.knifeJumper = undefined;

    while( 1 )
    {
        trig waittill( "trigger", player );

        // this will be blocked if jumper is currently in room and while its free run round
        if( /*level.freeRun ||*/ isDefined( level.knifeJumper ) || player.pers["team"] != "allies" )
            continue;
			
        AmbientStop( 2 );			
		ambientPlay("knife");
        level.knifeJumper = player;
        level.knifeJumper thread knifeMonitor();
        
        level.knifeJumper knifeRoom( tele_jumper, "knife_mp", 100 );
		if (IsDefined(level.activ))
			level.activ knifeRoom( tele_activator, "knife_mp", 100 );
			
		wait 0.05;
    }
    // code never gets here
}
knifeMonitor()
{
    self endon( "disconnect" );
    self thread knifeDisconnect();

    while( self.sessionstate == "playing" )
        wait 0.05;
    level.knifeJumper = undefined;
}

knifeDisconnect()
{
    self waittill( "disconnect" );
    level.knifeJumper = undefined;
}

knifeRoom( tp, weap, health )
{
	self endon("disconnect");
	self endon("death");

    self SetPlayerAngles( tp.angles );
    self SetOrigin( tp.origin );
    
    self TakeAllWeapons(); //this should be called so it takes away insertion perk in dr 1.2
    self GiveWeapon( weap );
    self GiveMaxAmmo( weap );
	wait 0.05;
    self SwitchToWeapon( weap );
    
    self.maxhealth = health;
} 
desertFight()
{
    trig = getEnt( "desert_trigger", "targetname" );
    tele_activator = getEnt( "desert_activator_teleport", "targetname" );
    tele_jumper = getEnt( "desert_jumper_teleport", "targetname" );
                
    level.desertJumper = undefined;

    while( 1 )
    {
        trig waittill( "trigger", player );

        // this will be blocked if jumper is currently in room and while its free run round
        if( /*level.freeRun ||*/ isDefined( level.desertJumper ) || player.pers["team"] != "allies" )
            continue;
			
        AmbientStop( 2 );			
		ambientPlay("desert");
        level.desertJumper = player;
        level.desertJumper thread desertMonitor();
        
        level.desertJumper desertRoom( tele_jumper, "deserteagle_mp", 100 );
		if (IsDefined(level.activ))
			level.activ desertRoom( tele_activator, "deserteagle_mp", 100 );
    }
    // code never gets here
}
desertMonitor()
{
    self endon( "disconnect" );
    self thread desertDisconnect();

    while( self.sessionstate == "playing" )
        wait 0.05;
    level.desertJumper = undefined;
}

desertDisconnect()
{
    self waittill( "disconnect" );
    level.desertJumper = undefined;
}

desertRoom( tp, weap, health )
{
	self endon("disconnect");
	self endon("death");

    self SetPlayerAngles( tp.angles );
    self SetOrigin( tp.origin );
    
    self TakeAllWeapons(); //this should be called so it takes away insertion perk in dr 1.2
    self GiveWeapon( weap );
    self GiveMaxAmmo( weap );
	wait 0.05;
    self SwitchToWeapon( weap );
    
    self.maxhealth = health;
} 
sniperFight()
{
    trig = getEnt( "sniper_trigger", "targetname" );
    tele_activator = getEnt( "sniper_activator_teleport", "targetname" );
    tele_jumper = getEnt( "sniper_jumper_teleport", "targetname" );
                
    level.sniperJumper = undefined;

    while( 1 )
    {
        trig waittill( "trigger", player );

        // this will be blocked if jumper is currently in room and while its free run round
        if( /*level.freeRun ||*/ isDefined( level.sniperJumper ) || player.pers["team"] != "allies" )
            continue;

		AmbientStop( 2 );			
		ambientPlay("sniper");	
        level.sniperJumper = player;
        level.sniperJumper thread sniperMonitor();
        
        level.sniperJumper sniperRoom( tele_jumper, "m40a3_mp", 100 );
		if (IsDefined(level.activ))
			level.activ sniperRoom( tele_activator, "m40a3_mp", 100 );
			
		wait 0.05;
    }
    // code never gets here
}
sniperMonitor()
{
    self endon( "disconnect" );
    self thread sniperDisconnect();

    while( self.sessionstate == "playing" )
        wait 0.05;
    level.sniperJumper = undefined;
}

sniperDisconnect()
{
    self waittill( "disconnect" );
    level.sniperJumper = undefined;
}

sniperRoom( tp, weap, health )
{
	self endon("disconnect");
	self endon("death");

    self SetPlayerAngles( tp.angles );
    self SetOrigin( tp.origin );
    
    self TakeAllWeapons(); //this should be called so it takes away insertion perk in dr 1.2
    self GiveWeapon( weap );
    self GiveMaxAmmo( weap );
	wait 0.05;
    self SwitchToWeapon( weap );
    
    self.maxhealth = health;
} 