main()
{
	maps\mp\_load::main();
	
	game["allies"] = "marines";
    game["axis"] = "opfor";
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "desert";
    game["axis_soldiertype"] = "desert";
	
	///*
	precacheItem("m60e4_mp");
	precacheItem("ak74u_mp");
	precacheItem("ak47_mp");
	precacheItem("m1014_mp");
	precacheItem("rpg_mp");
	
	thread main_door();
	thread credit();
	
	thread trap1();
	thread trap2();
	thread trap4();
	thread trap5();
	thread trap6();
	
	thread jump();
	thread knife();
	thread snipe();
	
	thread teleport();
	thread teleport2();
	thread teleport3();
	thread teleport4();
	thread teleport5();
	thread teleport6();
	thread teleport7();
	thread teleport8();
	thread teleport9();
	
	thread jumper();
	thread jumperweapon0();
	thread jumperweapon1();
	thread jumperweapon2();
	thread jumperweapon3();
	thread jumperweapon4();
	
	thread Secret();
	thread secretrpg();
	thread rpgremove();
	
	
	addTriggerToList( "trap1_trig");
	addTriggerToList( "trap2_trig");
	addTriggerToList( "trap5_trig");
	addTriggerToList( "trap6_trig");
	addTriggerToList( "js0");
}

addTriggerToList( name )
{
	if( !isDefined( level.trapTriggers ) )
	level.trapTriggers = [];
	level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}


//*

credit()
{

	door = getEnt("main_door", "targetname");
	
	wait 10;
	hud_clock = NewHudElem();
	hud_clock.alignX = "center";
	hud_clock.alignY = "top";
	hud_clock.horzalign = "center";
	hud_clock.vertalign = "top";
	hud_clock.alpha = 1;
	hud_clock.x = 0;
	hud_clock.y = 0;
	hud_clock.font = "default";
	hud_clock.fontscale = 2;
	hud_clock.glowalpha = 1;
	hud_clock.glowcolor = (0,0,0);
	hud_clock.label = &"^2--Scripted and completed by Sentrex--";
	hud_clock SetPulseFX( 60, 9999, 200 );	
}



main_door()
{
	door = getEnt("main_door", "targetname");
	
	wait 10;
	iPrintlnbold("^2Map by Porkchop");
	wait 1;
	iPrintln("== ^2IIV ^7-- ^2ALPHA ^7-- ^2QUAD ^7-- ^2COUPLE ^7==");
	door moveZ (-400,4);
}


trap1()
{
	brusha = getEnt ("trap1a", "targetname");
	brushb = getEnt ("trap1b", "targetname");
	brushc = getEnt ("trap1c", "targetname");
	brushd = getEnt ("trap1d", "targetname");
	trig = getEnt ("trap1_trig", "targetname");
	
	trig waittill("trigger", user);
	trig delete();
	
	while(1)
	{
		brusha rotateYaw(360,1);
		brushc rotateYaw(360,1);
		wait 1;
		brushb rotateYaw(360,1);
		brushd rotateYaw(360,1);
		wait 1;
	}
}

trapS1()
{
	brusha = getEnt ("trap1a", "targetname");
	brushb = getEnt ("trap1b", "targetname");	
	brushc = getEnt ("trap1c", "targetname");
	brushd = getEnt ("trap1d", "targetname");
	trig = getEnt ("trap1_trig", "targetname");
	
	trig waittill("trigger", user);
	trig delete();
	
	while(1)
	{	
		brusha movex(92, 1);
		brusha movey(-60, 1);
		
		brushb movex(92, 1);
		brushb movey(60, 1);
		
		brushc movex(-92, 1);
		brushc movey(60, 1);
		
		brushd movex(-92, 1);
		brushd movey(-60, 1);
		
		wait 1;
		
		brusha movex(-92, 1);
		brusha movey(60, 1);
		
		brushb movex(-92, 1);
		brushb movey(-60, 1);
		
		brushc movex(92, 1);
		brushc movey(-60, 1);
		
		brusha movex(92, 1);
		brusha movey(60, 1);
		wait 1;
	}
	
}

trap2()
{
	brusha = getEnt ("trap2a", "targetname");
	brushb = getEnt ("trap2b", "targetname");	
	trig = getEnt ("trap2_trig", "targetname");
	
	trig waittill("trigger", user);
	trig delete();
	
	while(1)
	{	
		brusha moveZ(40, 1);
		brushb moveZ(-40, 1);
		wait 1;
		brusha moveZ(-40, 1);
		brushb moveZ(40, 1);
		wait 1;
	}
	
}

trap4()
{
	platform1 = getEnt("trap4_platform1", "targetname");
	platform2 = getEnt("trap4_platform2", "targetname");
	trig = getEnt ("trap6_trig", "targetname");
	
	while (1)
	{
		platform1 moveY (-192,1.5);
		platform2 moveY (192,1.5);
		wait 1.5;
		platform1 moveY (192,1.5);
		platform2 moveY (-192,1.5);
		wait 1.5;
	}
	
}

trap5()
{
	brusha = getEnt ("trap5a", "targetname");
	brushb = getEnt ("trap5b", "targetname");	
	brushc = getEnt ("trap5c", "targetname");
	brushd = getEnt ("trap5d", "targetname");
	trig = getEnt ("trap5_trig", "targetname");
	
	trig waittill("trigger", user);
	trig delete();
	
	while(1)
{	
	brusha moveY(160, 0.5);
	brushc moveY(160, 0.5);
	brushb moveY(0, 0.5);
	brushd moveY(0, 0.5);
	wait 0.5;
	brushb moveY(0, 0.5);
	brushd moveY(0, 0.5);
	brusha moveY(-160, 0.5);
	brushc moveY(-160, 0.5);
	wait 0.5;
	brusha moveY(0, 0.5);
	brushc moveY(0, 0.5);
	brushb moveY(-160, 0.5);
	brushd moveY(-160, 0.5);
	wait 0.5;
	brusha moveY(0, 0.5);
	brushc moveY(0, 0.5);
	brushb moveY(160, 0.5);
	brushd moveY(160, 0.5);
	wait 0.5;
}
	
}

trap6()
{
	brusha = getEnt ("trap6a", "targetname");	
	brushb = getEnt ("trap6b", "targetname");	
	trig = getEnt ("trap6_trig", "targetname");
	
	trig waittill("trigger", user);
	trig delete();
	
	while(1)
{	
	wait 1;
	brusha rotatePitch(360, 1);
	brushb rotatePitch(360, 1);
	wait 1;
}

}
	
////////////////////////////////////////////////////////////////////////

snipe()
{
    level.snipe_trig = getEnt( "snipe_trig", "targetname"); 
    jump = getEnt( "target_sniproom1", "targetname" ); 
    acti = getEnt( "target_sniproom2", "targetname" ); 
	
    while(1)
    {
        level.snipe_trig waittill( "trigger", player );
        if( !isDefined( level.snipe_trig ) )
            return;
            
        if (IsDefined(level.jump_trig)) level.jump_trig delete();
		if (IsDefined(level.knife_trig)) level.knife_trig delete();


        player setPlayerAngles( jump.angles ); 
        player setOrigin( jump.origin ); 
        player setMoveSpeedScale( 1 ); 
        player takeAllWeapons();
        player giveWeapon( "m40a3_mp" ); 
        player giveMaxAmmo( "m40a3_mp" );
		if (IsDefined(level.activ))
		{
			level.activ setPlayerAngles( acti.angles );
			level.activ setOrigin( acti.origin ); 
			level.activ setMoveSpeedScale( 1 ); 
			level.activ takeAllWeapons(); 
			level.activ giveWeapon( "m40a3_mp" ); 
			level.activ giveMaxAmmo( "m40a3_mp" );
			level.activ iPrintlnBold( "You are up against ^2" + player.name + "^7! " );
        }
		wait 0.05;
        player switchToWeapon( "m40a3_mp" );
		if (IsDefined(level.activ))
			level.activ switchToWeapon( "m40a3_mp" );	
        while( isAlive( player ) && isDefined( player ) )
        wait 1;
		iPrintln( "^2Look for the Sniper Room secret ;)" );
		wait 1;
    }
}

jump()
{
level.jump_trig = getEnt( "jump_trig", "targetname");
jump = getEnt( "jump_jumper", "targetname" );
acti = getEnt( "jump_acti", "targetname" );

while(1)
{
	level.jump_trig waittill( "trigger", player );
	if( !isDefined( level.jump_trig ) )
	return;

	if (IsDefined(level.knife_trig)) level.knife_trig delete();
	if (IsDefined(level.snipe_trig)) level.snipe_trig delete();

	player setPlayerAngles( jump.angles );
	player setOrigin( jump.origin );
	player setMoveSpeedScale( 1 );
	player takeAllWeapons();
	player giveWeapon( "knife_mp");	
	if (IsDefined(level.activ))
	{
		level.activ setPlayerAngles( acti.angles );
		level.activ setOrigin( acti.origin );
		level.activ setMoveSpeedScale( 1 );
		level.activ takeAllWeapons();
		level.activ giveWeapon( "knife_mp");
		level.activ iPrintlnBold( "You are up against ^2" + player.name + "^7! " );
	}
	wait 0.05;
	player switchToWeapon( "knife_mp" );
	if (IsDefined(level.activ))
		level.activ switchToWeapon( "knife_mp" );
	iPrintlnBold( " ^2" + player.name + " ^7has chosen ^2JUMP^7 room^2!" );	
	iPrintln( "^2Look for the Jump Room secret ;)" );
	while( isAlive( player ) && isDefined( player ) )
	wait 1;
	iPrintln( "^2Look for the Jump Room secret ;)" );
	wait 1;
}

}

knife()
{
    level.knife_trig = getEnt( "knife_trig", "targetname"); 
    jump = getEnt( "knife_jumper", "targetname" ); 
    acti = getEnt( "knife_acti", "targetname" ); 
    
    while(1)
    {
        level.knife_trig waittill( "trigger", player );
        if( !isDefined( level.knife_trig ) )
            return;
            
		if (IsDefined(level.jump_trig)) level.jump_trig delete();
		if (IsDefined(level.snipe_trig)) level.snipe_trig delete();
	

        player setPlayerAngles( jump.angles ); 
        player setOrigin( jump.origin );  
        player setMoveSpeedScale( 1 );
        player takeAllWeapons(); 
        player giveWeapon( "knife_mp" );  
		if (IsDefined(level.activ))
		{
			level.activ setPlayerAngles( acti.angles );
			level.activ setOrigin( acti.origin ); 
			level.activ setMoveSpeedScale( 1 ); 
			level.activ takeAllWeapons(); 
			level.activ giveWeapon( "knife_mp" );
			level.activ iPrintlnBold( "You are up against ^2" + player.name + "^7! " ); 
        }
		wait 0.05; 
        player switchToWeapon( "knife_mp" );
		if (IsDefined(level.activ))
			level.activ switchToWeapon( "knife_mp" ); 
        iPrintlnBold( " ^2" + player.name + " ^7has chosen ^2KNIFE^7 room^2!" );      
        while( isAlive( player ) && isDefined( player ) )
        wait 1;
		iPrintln( "^2Look for the Knife Room secret ;)" );
		wait 1;
    }
}
	
	

//////////////////////////////////////////////////////////////////////////////////

teleport()

{
	trig = getEnt ("teleport_trigger", "targetname");
	target = getEnt ("jump_jumper", "targetname");
	
	for(;;)
{
	trig waittill ("trigger", player);

	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}

}

teleport2()

{
	trig = getEnt ("teleport_trigger2", "targetname");
	target = getEnt ("jump_acti", "targetname");
	
	for(;;)
{
	trig waittill ("trigger", player);

	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}

}

teleport3()

{
	trig = getEnt ("trigger_sniproom1", "targetname");
	target = getEnt ("target_sniproom1", "targetname");
	
	for(;;)
{
	trig waittill ("trigger", player);

	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}

}

teleport4()

{
	trig = getEnt ("trigger_sniproom2", "targetname");
	target = getEnt ("target_sniproom2", "targetname");
	
	for(;;)
{
	trig waittill ("trigger", player);

	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}

}

teleport5()

{
	trig = getEnt ("jumps1", "targetname");
	target = getEnt ("jumps1_t", "targetname");
	
	for(;;)
{
	trig waittill ("trigger", player);

	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}

}

teleport6()

{
	trig = getEnt ("jumps2", "targetname");
	target = getEnt ("jumps1_t", "targetname");
	
	for(;;)
{
	trig waittill ("trigger", player);

	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}

}

teleport7()

{
	trig = getEnt ("jumps3", "targetname");
	target = getEnt ("jumps1_t", "targetname");
	
	for(;;)
{
	trig waittill ("trigger", player);

	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}

}

teleport8()

{
	trig = getEnt ("jumps4", "targetname");
	target = getEnt ("jumps1_t", "targetname");
	
	for(;;)
{
	trig waittill ("trigger", player);

	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}

}

teleport9()

{
	trig = getEnt ("secretend", "targetname");
	target = getEnt ("secrettarget", "targetname");
	
	for(;;)
{
	trig waittill ("trigger", player);

	iprintlnbold ( " ^2" + player.name + " ^7has completed the ^2SECRET^7!" );
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}

}

//////////////////////

jumper()
{
jumpx = getent ("jump","targetname");
glow = getent ("glow","targetname");
air1 = getent ("air1","targetname");
air2 = getent ("air2","targetname");
air3 = getent ("air3","targetname");
air4 = getent ("air4","targetname");
air5 = getent ("air5","targetname");
air6 = getent ("air6","targetname");


	level._effect[ "beacon_glow" ] = loadfx( "misc/ui_pickup_available" );
	maps\mp\_fx::loopfx("beacon_glow", (glow.origin), 3, (glow.origin) + (0, 0, 90));


	while (1)
	{
	jumpx waittill ("trigger",user);
		if (user istouching(jumpx))
		{

		//throw = user.origin + (100, 100, 0);
		air = spawn ("script_model",(0,0,0));

		air.origin = user.origin;
		air.angles = user.angles;
		user linkto (air);
		time = 1;
            air moveto (air1.origin, 1);
		wait 1;
            air moveto (air2.origin, 1);
		wait .1;
            air moveto (air3.origin, 1);
		wait .05;
            air moveto (air4.origin, 1);
		wait .05;
            air moveto (air5.origin, 1);
		wait .05;
            air moveto (air6.origin, 1);
			
			
			
		wait 1;
		user unlink();
		wait 1;
		}
	}
}



//////////////////////////////

jumperweapon0()
{
    trig = getEnt ("js0" , "targetname");
    
    while(1)
    {
        trig waittill("trigger", player);
        
	player giveWeapon( "m40a3_mp" );
        player giveMaxAmmo( "m40a3_mp" );
        player switchToWeapon( "m40a3_mp" );
    } 	
}

jumperweapon1()
{
    trig = getEnt ("js1" , "targetname");
    
    while(1)
    {
        trig waittill("trigger", player);
        
	player giveWeapon( "m60e4_mp" );
        player giveMaxAmmo( "m60e4_mp" );
        player switchToWeapon( "m60e4_mp" );
    } 	
}

jumperweapon2()
{
    trig = getEnt ("js2" , "targetname");
    
    while(1)
    {
        trig waittill("trigger", player);
        
	player giveWeapon( "m60e4_mp" );
        player giveMaxAmmo( "m60e4_mp" );
        player switchToWeapon( "m60e4_mp" );
    } 	
}

jumperweapon3()
{
    trig = getEnt ("js3" , "targetname");
    
    while(1)
    {
        trig waittill("trigger", player);
        
	player giveWeapon( "m60e4_mp" );
        player giveMaxAmmo( "m60e4_mp" );
        player switchToWeapon( "m60e4_mp" );
    } 	
}

jumperweapon4()
{
    trig = getEnt ("js4" , "targetname");
    
    while(1)
    {
        trig waittill("trigger", player);
        
	player giveWeapon( "m60e4_mp" );
        player giveMaxAmmo( "m60e4_mp" );
        player switchToWeapon( "m60e4_mp" );
    } 	
}

Secret()
{
    triga = getEnt ("s1", "targetname");
    trigb = getEnt ("s2", "targetname");
    trigc = getEnt ("s3", "targetname");
    trigd = getEnt ("s4", "targetname");
	door = getEnt ("secretdoor", "targetname");
    
    trigc waittill("trigger", player1); //iiv
    triga waittill("trigger", player2); //alpha
    trigd waittill("trigger", player3); //quad
    trigb waittill("trigger", player4); //couple
    
    player1 GiveWeapons( "rpg_mp" );
    player2 GiveWeapons( "rpg_mp" );
    player3 GiveWeapons( "rpg_mp" );
    player4 GiveWeapons( "rpg_mp" );
	player1 switchToWeapon( "rpg_mp" );
	player2 switchToWeapon( "rpg_mp" );
	player3 switchToWeapon( "rpg_mp" );
	player4 switchToWeapon( "rpg_mp" );
	wait 0.5;
	door notsolid();
	iprintlnbold ("^2The secret has been opened!");
    
}

GiveWeapons(weapname)
{
    self endon("disconnect");
    self endon("death");
    if(!isDefined(self) || !isAlive(self))
        return;
    if(!isDefined(self.givenWeapon))
        self.givenWeapon = [];
    if(isDefined(self.givenWeapon[weapname]))
        return;
    self giveWeapon(weapname);
//    self giveMaxAmmo(weapname);
    self.givenWeapon[weapname] = 1;
}

secretrpg()
{
    trig = getEnt ("secretrpg" , "targetname");
    
    while(1)
    {
        trig waittill("trigger", player);
        
	player giveWeapon( "rpg_mp" );
	player giveMaxAmmo( "rpg_mp" );
	player switchToWeapon( "rpg_mp" );
    } 	
}

rpgremove()
{
	trig = getEnt ("rpgremove" , "targetname");
    
    while(1)
    {
        trig waittill("trigger", player);
		player setWeaponAmmoClip( "rpg_mp", 0 );
    } 	
}

//*/
	