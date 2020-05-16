main()
{      
        maps\mp\_load::main();
       
        game["allies"] = "marines";
        game["axis"] = "opfor";
        game["attackers"] = "axis";
        game["defenders"] = "allies";
        game["allies_soldiertype"] = "desert";
        game["axis_soldiertype"] = "desert";
		
		precacheItem("m40a3_mp");
         
		//threads 
		 
        thread Arrowspawn();
		thread Credits();
        thread Arrowwall();
        thread Arrowslide();
		thread Lettersend();
        thread Fire();
		//thread Secret_FX();
        thread Music();
		thread Rotatestaab();
		thread Cuberotate();
		thread Roomrotate();
        thread Elevator();
        thread Startdoor();
        thread First_Teleport();
		thread Teleacti1();
		thread Teleacti2();
		thread Teleacti3();
		thread Teleback1();
		thread Teleback2();
		thread Teleback3();
		thread Secret();
		thread Secretend();
		thread Trap1();
        thread Trap2();
		thread Trap3();
		thread Trap4();
		thread Trap5();
		thread Trap6();
		thread Trap7();
		thread Trap8();
		thread Trap9();
		//thread Trap9();
		thread Snipermusic();
		thread Rotatemusic();
		thread Sniper();
		thread Bounce();
		thread Pistol();
		thread Upsidedown();
		thread Rotate();
		thread Bounceweap();
		thread Sniperup1();
		thread Sniperup2();
		thread Sniperup3();
		thread Sniperup4();
		thread Secret_Weapon();
		thread Secret_Weapon2();
		thread Secret_Weapon3();
		thread Endgun();
		thread Jumpertele1();
		//thread Jumpertele2();
		thread Actitele1();
		//thread Actitele2();
		thread Enddoor();
		
       
       
        level.firefx = loadFX( "deathrun/sentrexfire" );
		level.teleburst = loadFX( "deathrun/staabblast" );
		level.staabfk = loadFX( "deathrun/staabfucked" );

     addTriggerToList( "trap1_trigger" );
	 addTriggerToList( "trap2trig" );
	 addTriggerToList( "trap3trigger" );
	 addTriggerToList( "trap4trig" );
	 addTriggerToList( "trap5trig" );
	 addTriggerToList( "trap6trig" );
	 addTriggerToList( "trap7trig" );
	 addTriggerToList( "trap8trig" );
	 addTriggerToList( "trap9trig" );
}
 
addTriggerToList( name )
{
   if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
   level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
} 
 
Arrowspawn()
{
        arrow=getent("arrowspawn","targetname");
 
        for(;;)
        {
                arrow movez (-31,1,0.2,0.2);
                arrow waittill("movedone");
                arrow movez (31,1,0.2,0.2);
                arrow waittill("movedone");
        }
}
 
Arrowwall()
{
        arrow=getent("arrowwall","targetname");
 
        for(;;)
        {
                arrow movez (-40,1,0.2,0.2);
                arrow waittill("movedone");
                arrow movez (40,1,0.2,0.2);
                arrow waittill("movedone");
        }
}
 
Arrowslide()
{
        arrow=getent("arrowslide","targetname");
 
        for(;;)
        {
                arrow movez (-31,1,0.2,0.2);
                arrow waittill("movedone");
                arrow movez (31,1,0.2,0.2);
                arrow waittill("movedone");
        }
}
Lettersend()
{
	Sletter = getEnt( "Sletter", "targetname" );
	Bletter = getEnt( "Bletter", "targetname" );
	Rletter = getEnt( "Rletter", "targetname" );
	Pletter = getEnt( "Pletter", "targetname" );
	Uletter = getEnt( "Uletter", "targetname" );
	
	
	Sletter notSolid();
	Bletter notSolid();
	Rletter notSolid();
	Pletter notSolid();
	Uletter notSolid();
	while(1)
	{
		Sletter rotateYaw( 360, 3 );
		Bletter rotateYaw( 360, 3 );
		Rletter rotateYaw( 360, 3 );
		Pletter rotateYaw( 360, 3 );
		Uletter rotateYaw( 360, 3 );
		wait 2;
	}
}
 
 
Fire()
{
        fire1 = getEnt( "fire1", "targetname" );
        fire2 = getEnt( "fire2", "targetname" );
        fire3 = getEnt( "fire3", "targetname" );
        fire4 = getEnt( "fire4", "targetname" );
		fire5 = getEnt( "fire5", "targetname" );
		fire6 = getEnt( "fire6", "targetname" );
		//staabfucked = getEnt( "staabfucked", "targetname" );
 
        level waittill( "round_started" );
       
        playFX( level.firefx, fire1.origin );
        playFX( level.firefx, fire2.origin );
        playFX( level.firefx, fire3.origin );
        playFX( level.firefx, fire4.origin );
		playFX( level.firefx, fire5.origin );
		playFX( level.firefx, fire6.origin );
		//playFX( level.staabfk, staabfucked.origin );
}

Secret_FX()
{
	staabfucked = getEnt( "staabfucked", "targetname" );
	staabfk = getEnt("staabfk", "targetname");
	
	while(1)
	{
		staabfucked waittill ("trigger", player);
		playFX( level.staabfk, staabfk.origin );
		wait 0.1;
		iPrintlnBold("^2Shit just got harder >:D");
	}
}
 
Music()
{
        wait 10;
        random = randomint (3);
        switch (random)
        {
                case 0: Ambientplay("mitis1");
                                iprintln("^7Now Playing^1:^7 MitiS ^1- ^7Influential Past");
                                wait 1.0;
                                iprintln("^7Now Playing^1:^7 MitiS ^1- ^7Influential Past");
                                wait 1.0;
                                iprintln("^7Now Playing^1:^7 MitiS ^1- ^7Influential Past");
                                break;
                case 1: Ambientplay("mitis2");
                                iprintln("^7Now Playing^1:^7 MitiS ^1- ^7Endeavours");
                                wait 1.0;
                                iprintln("^7Now Playing^1:^7 MitiS ^1- ^7Endeavours");
                                wait 1.0;
                                iprintln("^7Now Playing^1:^7 MitiS ^1- ^7Endeavours");
                                break;
                case 2: Ambientplay("deans");
                                iprintln("^7Now Playing^1:^7 The Deans List ^1- ^7Dear Professor(Eliminate Remix)");
                                wait 1.0;
                                iprintln("^7Now Playing^1:^7 The Deans List ^1- ^7Dear Professor(Eliminate Remix)");
                                wait 1.0;
                                iprintln("^7Now Playing^1:^7 The Deans List ^1- ^7Dear Professor(Eliminate Remix)");
                                break;
        }
}

Rotatestaab()
{
epic = getEnt("staabrotate", "targetname");
if (!isdefined(epic.speed))
 epic.speed = 5;
if (!isdefined(epic.script_noteworthy))
 epic.script_noteworthy = "z";
 
while(true)
{
  epic rotateYaw(540,8,2,1,2,1);
	epic waittill("rotatedone");
	epic rotateRoll(360,5,2.1,2.1);
	epic waittill("rotatedone");
	epic rotateYaw(540,8,2.1,2.1);
	epic waittill("rotatedone");
		epic rotateRoll(1080,10,2.1,2.1);
	epic waittill("rotatedone");
 }
 }
 
Cuberotate()
{
cube = getEnt("cuberotate", "targetname");
if (!isdefined(cube.speed))
 cube.speed = 5;
if (!isdefined(cube.script_noteworthy))
 cube.script_noteworthy = "z";
 
while(true)
{
  cube rotateRoll(-540,8,2,1,2,1);
	cube waittill("rotatedone");
	cube rotateRoll(360,5,2.1,2.1);
	cube waittill("rotatedone");
	cube rotateRoll(540,8,2.1,2.1);
	cube waittill("rotatedone");
		cube rotateRoll(-1080,10,2.1,2.1);
	cube waittill("rotatedone");
 }
 }
 
 
Roomrotate()
{
room = getEnt("room", "targetname");
if (!isdefined(room.speed))
 room.speed = 5;
if (!isdefined(room.script_noteworthy))
 room.script_noteworthy = "z";
 
while(true)
{
  room rotateRoll(540,8,2,1,2,1);
	room waittill("rotatedone");
	room rotateRoll(360,5,2.1,2.1);
	room waittill("rotatedone");
	room rotateRoll(-540,8,2.1,2.1);
	room waittill("rotatedone");
		room rotateRoll(1080,10,2.1,2.1);
	room waittill("rotatedone");
 }
 }
 
Elevator()
{
        elevator=getent("elevator","targetname");
 
        for(;;)
        {
                elevator movez (977,4,0.5,0.5);
                elevator waittill("movedone");
                elevator movez (-977,4,0.5,0.5);
                elevator waittill("movedone");
        }
}

Credits()
{
wait 30;
iPrintLn ("^3>> ^7Big Thanks To Zack & Sentrex! ^3<<");
wait 8;
iPrintLn ("^3>> ^7Map By Staab ^3<<");
wait 8;
iPrintLn ("^3>> ^7youtube.com/staabv2 ^3<<");
wait 8;
iPrintLn ("^3>> ^7Thank You To Triton, For testing and Fixing the map!^3<<");
wait 8;
iPrintLn ("^3>> ^7Ur all fgts, Jk love you all! :> ^3<<");
}
 
Startdoor()
{
 
    //trig = getEnt( "startdoor", "targetname" );
    brush = getEnt( "doora", "targetname" );
    brush2 = getEnt( "doorb", "targetname" );
   
        //trig waittill( "trigger");
        //trig delete();
       
        wait 15;
        iPrintLn("^55");
        wait 1;
        iPrintLn("^54");
        wait 1;
        iPrintLn("^53");
        wait 1;
        iPrintLn("^52");
        wait 1;
        iPrintLn("^51");
        wait 1;
        brush moveX(200,0.30);
        brush2 moveX(-200,0.30);
        wait 0.05;
        iPrintLn("^1Go!");
       
}
 
First_Teleport()
{
        trig = getEnt("trigger_teleport1", "targetname");
        tele1 = getEnt("origin_teleport1", "targetname");
		burst = getEnt("burst", "targetname");
       
        for(;;)
        {
                trig waittill("trigger", player);
				playFX( level.teleburst, burst.origin );
                player setOrigin(tele1.origin);
                wait 0.01;
        }
}

Teleacti1()
{
        trig = getEnt("teleacti1", "targetname");
        tele1 = getEnt("teleacti1_origin", "targetname");
       
        for(;;)
        {
                trig waittill("trigger", player);
                player setOrigin(tele1.origin);
                wait 0.01;
        }
}

Teleacti2()
{
        trig = getEnt("teleacti2", "targetname");
        tele1 = getEnt("teleacti2_origin", "targetname");
       
        for(;;)
        {
                trig waittill("trigger", player);
                player setOrigin(tele1.origin);
                wait 0.01;
        }
}

Teleacti3()
{
        trig = getEnt("teleacti3", "targetname");
        tele1 = getEnt("teleacti3_origin", "targetname");
       
        for(;;)
        {
                trig waittill("trigger", player);
                player setOrigin(tele1.origin);
                wait 0.01;
        }
}

Teleback1()
{
        trig = getEnt("teleback1", "targetname");
        tele1 = getEnt("teleback1_origin", "targetname");
       
        for(;;)
        {
                trig waittill("trigger", player);
                player setOrigin(tele1.origin);
                wait 0.01;
        }
}

Teleback2()
{
        trig = getEnt("teleback2", "targetname");
        tele1 = getEnt("teleback2_origin", "targetname");
       
        for(;;)
        {
                trig waittill("trigger", player);
                player setOrigin(tele1.origin);
                wait 0.01;
        }
}

Teleback3()
{
        trig = getEnt("teleback3", "targetname");
        tele1 = getEnt("teleback3_origin", "targetname");
       
        for(;;)
        {
                trig waittill("trigger", player);
                player setOrigin(tele1.origin);
                wait 0.01;
        }
}

Secret()
{
        trig = getEnt("secret", "targetname");
        tele1 = getEnt("secret_origin", "targetname");
       
        for(;;)
        {
                trig waittill("trigger", player);
                player setOrigin(tele1.origin);
                wait 0.01;
        }
}

Secretend()
{
        trig = getEnt("secretend", "targetname");
        tele1 = getEnt("secretend_origin", "targetname");
       
        for(;;)
        {
                trig waittill("trigger", player);
                player setOrigin(tele1.origin);	
                wait 0.01;
        }
}

//Traps now fk off from this part >:D cunts L2 script yourself (not stolen :ph34:)

Trap1()
{
	trig = getent("trap1_trigger", "targetname");
	trap1 = getent("trap1", "targetname");
	trap1slick = getent("trap1slick", "targetname");

	trig SetCursorHint("HINT_ACTIVATE");
	
	gold = getent("trap5gold","targetname");
	trig waittill( "trigger", who ); 
	wait 0.1;
	trig delete();
	if (IsDefined(gold)) gold delete();
	trap1 movez(900, 1);
	trap1 waittill( "movedone" );
	wait 1.5;
	trap1slick movez(336,6,3.0,3.0);
	trap1slick waittill (" movedone ");
	
	
} 
 
Trap2()
{
	trig = getEnt( "trap2trig", "targetname" );
	brush1 = getEnt( "trap2_brush1", "targetname" );
	brush2 = getEnt( "trap2_brush2", "targetname" );
	brush3 = getEnt( "trap2_brush3", "targetname" );
	brush4 = getEnt ("trap2_brush4", "targetname" );
	brush5 = getEnt( "trap2_brush5", "targetname" );
	brush6 = getEnt( "trap2_brush6", "targetname" );
	brush7 = getEnt( "trap2_brush7", "targetname" );
	brust8 = getEnt ("trap2_brush8", "targetname" );

	trig waittill( "trigger" );
	
	while(1)
	{
	if (IsDefined(trig)) trig delete();
	
	brush1 rotateyaw (-360,1,0.5,0.5);
	brush2 rotateyaw (360,1,0.5,0.5);
	brush3 rotateyaw (-360,1,0.5,0.5);
	brush4 rotateyaw (360,1,0.5,0.5);
	brush1 waittill ("rotatedone");
	
	brush5 rotateyaw (360,1,0.5,0.5);
	brush6 rotateyaw (-360,1,0.5,0.5);
	brush7 rotateyaw (360,1,0.5,0.5);
	brust8 rotateyaw (-360,1,0.5,0.5);
	brush5 waittill ("rotatedone");
}
}

Trap3()
{
        object = getent("trap3", "targetname");
        trigger = getent("trap3trigger", "targetname");
 
        trigger waittill("trigger",player);
       
        for(;;)
        {
                movetime = RandomIntRange( 1, 3 );
                randtime = RandomIntRange( 1, 2 );
                object moveZ( -78, movetime );
                object waittill( "movedone" );
                wait randtime;
                object moveY( 193, movetime );
                object waittill( "movedone" );
                wait randtime;
                object moveZ( 78, movetime );
                object waittill( "movedone" );
                wait randtime;
                object moveY( -193, movetime );
                object waittill( "movedone" );
        }
}

Trap4()
{
	trig = getent("trap4trig", "targetname");
	trap4a = getent("trap4a", "targetname");
	trap4b = getEnt("trap4b", "targetname");
	trap4c = getEnt("trap4c", "targetname");
	staabfk = getEnt("staabfk", "targetname");
	trig SetCursorHint("HINT_ACTIVATE");
	gold = getent("trap5gold","targetname");
	trig waittill( "trigger", who ); 
	playFX( level.staabfk, staabfk.origin );
	wait 0.1;
	trig delete();
	gold delete();
	trap4a moveX(-800, 1);
	trap4b moveX(800,1);
	wait 1.5;
	trap4c moveZ(-900,6,3.0,3.0);
	playFX( level.staabfk, staabfk.origin );
	
	
} 


Trap5()
{
        trig = getent("trap5trig", "targetname");
        trap5a = getent("trap5a", "targetname");
        trap5b = getEnt("trap5b", "targetname");
        trap5c = getEnt("trap5c", "targetname");
        hurt =  getEnt("400a", "targetname");
        hurt2 = getEnt("400b", "targetname");
        hurt3 = getEnt ("400c", "targetname");
        trig SetCursorHint("HINT_ACTIVATE");
        gold = getent("trap5gold","targetname");
        trig waittill( "trigger", who );
                hurt enablelinkto();
                hurt linkto(trap5a);
                hurt2 enablelinkto();
                hurt2 linkto(trap5b);
                hurt3 enablelinkto();
                hurt3 linkto(trap5c);
        wait 0.1;
        trig delete();
        if (IsDefined(gold)) gold delete();
        trap5a moveZ(290,1,0.5,0.5);
        wait 1.5;
        trap5b moveZ(290,1,0.5,0.5);
        wait 1.5;
        trap5c moveZ(290,1,0.5,0.5);
       
}


Trap6()
{
trigdude = getent("trap6trig", "targetname");
elevate = getent("elevator","targetname");



 
trigdude waittill("trigger", player); 
trigdude delete(); //deletes the trigger
 
     {
			 elevate rotateRoll (90,3,0.5,0.5);
			 wait 6;
			 elevate rotateRoll (-90,1,0.5,0.5);
			 
			
		}	 
		
			

 
}

Trap7()
{
	trig = getent("trap7trig", "targetname");
	trap7 = getent("trap7", "targetname");
	trig SetCursorHint("HINT_ACTIVATE");
	gold = getent("trap5gold","targetname");
	trig waittill( "trigger", who ); 
	wait 0.1;
	trig delete();
	if (IsDefined(gold)) gold delete();
	trap7 moveZ(-290,5);
	wait 2.5;
	trap7 moveZ(290,2);
	wait 0.5;
	trap7 moveZ(-290,1);
	
} 


Trap8()
{
	trig = getent("trap8trig", "targetname");
	trap8 = getent("urmum", "targetname");
	trap8b = getent("urmum2", "targetname");
	trig SetCursorHint("HINT_ACTIVATE");
	gold = getent("trap5gold","targetname");
	trig waittill( "trigger", who ); 
	wait 0.1;
	trig delete();
	if (IsDefined(gold)) gold delete();
	trap8 moveY(800,1.3);
	trap8b moveY (-800,2);
} 

Trap9()
{
	trig = getEnt( "trap9trig", "targetname" );
	trap9 = getEnt( "spinme", "targetname" ); 
	if (IsDefined(trig)) trig SetCursorHint("HINT_ACTIVATE");
	
	if (IsDefined(trig)) trig waittill( "trigger", who );
	if (IsDefined(trig)) trig delete();
 	
	if (IsDefined(trap9)) trap9 rotateYaw(3000,9);
	wait 0.12;
	if (IsDefined(trap9)) trap9 movez (135,1,0.5,0.5);
	if (IsDefined(trap9)) trap9 waittill ("movedone");
	wait 5;
	if (IsDefined(trap9)) trap9 movez (-135,1,0.5,0.5);
	if (IsDefined(trap9)) trap9 waittill ("movedone");
	wait 1.38;
	
}

Sniper()
{
        level.sniper_trig = getEnt( "sniper_trig", "targetname");
        jump = getEnt( "sniper_origin_jumper", "targetname" );
        acti = getEnt( "sniper_origin_acti", "targetname" );
 
while(1)
        {
                level.sniper_trig waittill( "trigger", player );
                if( !isDefined( level.sniper_trig ) )
                return;
 
                if (IsDefined(level.bounce_trig)) level.bounce_trig delete();
                if (IsDefined(level.rotate_trig)) level.rotate_trig delete();
                if (IsDefined(level.pistol_trig)) level.pistol_trig delete();
                if (IsDefined(level.upsidedown_trig)) level.upsidedown_trig delete();
 
                if( isDefined( player ) && isAlive( player ) )
                {
                        player setPlayerAngles( jump.angles );
                        player setOrigin( jump.origin );
                        player takeAllWeapons();
                        player giveWeapon( "m40a3_mp" );
						player giveWeapon( "remington700_mp" );
						player giveMaxAmmo( "m40a3_mp" );
						player giveMaxAmmo( "remington700_mp" );
                        player switchToWeapon( "m40a3_mp" );
                        
                }
                if( isDefined( level.activ ) && isAlive( level.activ ) )
                {
                        player freezeControls( true );
                        level.activ freezeControls( true );
                        level.lasers unlink();
                        level.activ setPlayerAngles( acti.angles );
                        level.activ setOrigin( acti.origin );
                        level.activ takeAllWeapons();
                        level.activ giveWeapon( "m40a3_mp" );
						level.activ giveWeapon( "remington700_mp" );
						level.activ giveMaxAmmo( "m40a3_mp" );
						level.activ giveMaxAmmo( "remington700_mp" );
                        level.activ switchToWeapon( "m40a3_mp" );
                       
                        level.jump_hud = newHudElem();
                        level.jump_hud.foreground = true;
                        level.jump_hud.AlignX = "center";
                        level.jump_hud.AlignY = "top";
                        level.jump_hud.horzAlign = "center";
                        level.jump_hud.vertAlign = "top";
                        level.jump_hud.x = 0;
                        level.jump_hud.y = 10;
                        level.jump_hud.sort = 0;
                        level.jump_hud.fontScale = 2.5;
                        level.jump_hud.color = (0.5, 0.0, 0.8);
                        level.jump_hud.font = "objective";
                        level.jump_hud.glowcolor = (0.5, 0.0, 0.8);
                        level.jump_hud.glowAlpha = 1;
                        level.jump_hud.hideWhenInMenu = false;
                        level.jump_hud setText( ">>   ^2" + player.name + "^3 VS ^1" + level.activ.name + "^3!   <<" );
                        level.jump_hud setPulseFX( 40, 2000, 99999999 );
       
                        thread jumpstarthud();
                        wait 5;
                        player freezeControls( false );
                        level.activ freezeControls( false );
                        level.jump_hud destroy();
                        level.jumpstart_hud destroy();
                       
                }
                while( isAlive( player ) && isDefined( player ) )
                wait 0.1;
        }
 
}
 
jumpstarthud()
{
        level.jumpstart_hud = newHudElem();
        level.jumpstart_hud.foreground = true;
        level.jumpstart_hud.AlignX = "center";
        level.jumpstart_hud.AlignY = "top";
        level.jumpstart_hud.horzAlign = "center";
        level.jumpstart_hud.vertAlign = "top";
        level.jumpstart_hud.x = 0;
        level.jumpstart_hud.y = 40;
        level.jumpstart_hud.sort = 0;
        level.jumpstart_hud.fontScale = 3;
        level.jumpstart_hud.color = (1.0, 0.0, 0.0);
        level.jumpstart_hud.font = "objective";
        level.jumpstart_hud.glowcolor = (1.0, 0.0, 0.0);
        //level.jumpstart_hud.glowAlpha = 1;
        level.jumpstart_hud.hideWhenInMenu = false;
        level.jumpstart_hud setTimer( 5 );
}

//Sniperplatforms

Sniperup1()
{
        arrow=getent("sniperup1","targetname");
 
        for(;;)
        {
                arrow movez (352,2.5,0.5,0.5);
                arrow waittill("movedone");
                arrow movez (-352,3,0.5,0.5);
                arrow waittill("movedone");
        }
}
 
Sniperup2()
{
        arrow=getent("sniperup2","targetname");
 
        for(;;)
        {
                arrow movez (352,2.1,0.5,0.5);
                arrow waittill("movedone");
                arrow movez (-352,3,0.5,0.5);
                arrow waittill("movedone");
        }
}

Sniperup3()
{
        arrow=getent("sniperup3","targetname");
 
        for(;;)
        {
                arrow movez (352,3,0.5,0.5);
                arrow waittill("movedone");
                arrow movez (-352,3,0.2,0.2);
                arrow waittill("movedone");
        }
}
 
Sniperup4()
{
        arrow=getent("sniperup4","targetname");
 
        for(;;)
        {
                arrow movez (352,4,0.5,0.5);
                arrow waittill("movedone");
                arrow movez (-352,4,0.5,0.5);
                arrow waittill("movedone");
        }
}

//Bounceshit

Bounce()
{
        level.bounce_trig = getEnt( "bounce_trig", "targetname");
        jump = getEnt( "bounce_origin_jumper", "targetname" );
        acti = getEnt( "bounce_origin_acti", "targetname" );
 
while(1)
        {
                level.bounce_trig waittill( "trigger", player );
                if( !isDefined( level.bounce_trig ) )
                return;
 
                if (IsDefined(level.sniper_trig)) level.sniper_trig delete();
                if (IsDefined(level.rotate_trig)) level.rotate_trig delete();
                if (IsDefined(level.pistol_trig)) level.pistol_trig delete();
                if (IsDefined(level.upsidedown_trig)) level.upsidedown_trig delete();
 
                if( isDefined( player ) && isAlive( player ) )
                {
                        player setPlayerAngles( jump.angles );
                        player setOrigin( jump.origin );
                        player takeAllWeapons();
                        player giveWeapon( "deserteagle_mp" );
                        player switchToWeapon( "deserteagle_mp" );
                        player setWeaponAmmoStock( "deserteagle_mp" , 0 );
                }
                if( isDefined( level.activ ) && isAlive( level.activ ) )
                {
                        player freezeControls( true );
                        level.activ freezeControls( true );
                        level.lasers unlink();
                        level.activ setPlayerAngles( acti.angles );
                        level.activ setOrigin( acti.origin );
                        level.activ takeAllWeapons();
                        level.activ giveWeapon( "knife_mp");
                        wait 0.05;
                        player switchToWeapon( "knife_mp" );
                        level.activ switchToWeapon( "knife_mp" );
                       
                        level.jump_hud = newHudElem();
                        level.jump_hud.foreground = true;
                        level.jump_hud.AlignX = "center";
                        level.jump_hud.AlignY = "top";
                        level.jump_hud.horzAlign = "center";
                        level.jump_hud.vertAlign = "top";
                        level.jump_hud.x = 0;
                        level.jump_hud.y = 10;
                        level.jump_hud.sort = 0;
                        level.jump_hud.fontScale = 2.5;
                        level.jump_hud.color = (0.5, 0.0, 0.8);
                        level.jump_hud.font = "objective";
                        level.jump_hud.glowcolor = (0.5, 0.0, 0.8);
                        level.jump_hud.glowAlpha = 1;
                        level.jump_hud.hideWhenInMenu = false;
                        level.jump_hud setText( ">>   ^2" + player.name + "^3 VS ^1" + level.activ.name + "^3!   <<" );
                        level.jump_hud setPulseFX( 40, 2000, 99999999 );
       
                        thread jumpstarthud();
                        wait 5;
                        player freezeControls( false );
                        level.activ freezeControls( false );
                        level.jump_hud destroy();
                        level.jumpstart_hud destroy();
                       
                }
                while( isAlive( player ) && isDefined( player ) )
                wait 0.1;
        }
 
}

Bounceweap()
{
	trig = getEnt("bounceweap","targetname");
	
	while(1)
	{
		trig waittill ("trigger", player);
		player takeAllWeapons();
		wait 0.1;
		player iPrintlnBold("Heres A Sniper, NOW BLAST HIM! FAZE STYLE!!11!1 ONEONEOEN ");
		wait 0.1;
		player giveWeapon("m40a3_mp");
		player giveMaxAmmo( "m40a3_mp" );
		wait 0.1;
		player switchToWeapon("m40a3_mp");
	}
}

Pistol()
{
        level.pistol_trig = getEnt( "pistol_trig", "targetname");
        jump = getEnt( "pistol_origin_jumper", "targetname" );
        acti = getEnt( "pistol_origin_acti", "targetname" );
 
while(1)
        {
                level.pistol_trig waittill( "trigger", player );
                if( !isDefined( level.pistol_trig ) )
                return;
 
                if (IsDefined(level.sniper_trig)) level.sniper_trig delete();
                if (IsDefined(level.rotate_trig)) level.rotate_trig delete();
                if (IsDefined(level.bounce_trig)) level.bounce_trig delete();
                if (IsDefined(level.upsidedown_trig)) level.upsidedown_trig delete();
				
 
                if( isDefined( player ) && isAlive( player ) )
                {
                        player setPlayerAngles( jump.angles );
                        player setOrigin( jump.origin );
                        player takeAllWeapons();
                        player giveWeapon( "deserteagle_mp" );
						player giveMaxAmmo( "deserteagle_mp" );
                        player switchToWeapon( "deserteagle_mp" );
                        
                }
                if( isDefined( level.activ ) && isAlive( level.activ ) )
                {
                        player freezeControls( true );
                        level.activ freezeControls( true );
                        level.lasers unlink();
                        level.activ setPlayerAngles( acti.angles );
                        level.activ setOrigin( acti.origin );
                        level.activ takeAllWeapons();
                        level.activ giveWeapon( "deserteagle_mp" );
						level.activ giveMaxAmmo( "deserteagle_mp" );
                        level.activ switchToWeapon( "deserteagle_mp" );
                       
                        level.jump_hud = newHudElem();
                        level.jump_hud.foreground = true;
                        level.jump_hud.AlignX = "center";
                        level.jump_hud.AlignY = "top";
                        level.jump_hud.horzAlign = "center";
                        level.jump_hud.vertAlign = "top";
                        level.jump_hud.x = 0;
                        level.jump_hud.y = 10;
                        level.jump_hud.sort = 0;
                        level.jump_hud.fontScale = 2.5;
                        level.jump_hud.color = (0.5, 0.0, 0.8);
                        level.jump_hud.font = "objective";
                        level.jump_hud.glowcolor = (0.5, 0.0, 0.8);
                        level.jump_hud.glowAlpha = 1;
                        level.jump_hud.hideWhenInMenu = false;
                        level.jump_hud setText( ">>   ^2" + player.name + "^3 VS ^1" + level.activ.name + "^3!   <<" );
                        level.jump_hud setPulseFX( 40, 2000, 99999999 );
       
                        thread jumpstarthud();
                        wait 5;
                        player freezeControls( false );
                        level.activ freezeControls( false );
                        level.jump_hud destroy();
                        level.jumpstart_hud destroy();
                       
                }
                while( isAlive( player ) && isDefined( player ) )
                wait 0.1;
        }
 
}

Upsidedown()
{
        level.upsidedown_trig = getEnt( "upsidedown_trig", "targetname");
        jump = getEnt( "upsidedown_origin_jumper", "targetname" );
        acti = getEnt( "upsidedown_origin_acti", "targetname" );
 
while(1)
        {
                level.upsidedown_trig waittill( "trigger", player );
                if( !isDefined( level.upsidedown_trig ) )
                return;
 
                if (IsDefined(level.sniper_trig)) level.sniper_trig delete();
                if (IsDefined(level.random_trig)) level.random_trig delete();
                if (IsDefined(level.bounce_trig)) level.bounce_trig delete();
                if (IsDefined(level.pistol_trig)) level.pistol_trig delete();
				if (IsDefined(level.rotate_trig)) level.rotate_trig delete();
 
                if( isDefined( player ) && isAlive( player ) )
                {
                        player setPlayerAngles( jump.angles );
                        player setOrigin( jump.origin );
                        player takeAllWeapons();
                        player giveWeapon( "deserteagle_mp" );
						player giveMaxAmmo( "deserteagle_mp" );
                        player switchToWeapon( "deserteagle_mp" );
                        
                }
                if( isDefined( level.activ ) && isAlive( level.activ ) )
                {
                        player freezeControls( true );
                        level.activ freezeControls( true );
                        if (IsDefined(level.lasers)) level.lasers unlink();
                        level.activ setPlayerAngles( acti.angles );
                        level.activ setOrigin( acti.origin );
                        level.activ takeAllWeapons();
                        level.activ giveWeapon( "deserteagle_mp" );
						level.activ giveMaxAmmo( "deserteagle_mp" );
                        level.activ switchToWeapon( "deserteagle_mp" );
                       
                        level.jump_hud = newHudElem();
                        level.jump_hud.foreground = true;
                        level.jump_hud.AlignX = "center";
                        level.jump_hud.AlignY = "top";
                        level.jump_hud.horzAlign = "center";
                        level.jump_hud.vertAlign = "top";
                        level.jump_hud.x = 0;
                        level.jump_hud.y = 10;
                        level.jump_hud.sort = 0;
                        level.jump_hud.fontScale = 2.5;
                        level.jump_hud.color = (0.5, 0.0, 0.8);
                        level.jump_hud.font = "objective";
                        level.jump_hud.glowcolor = (0.5, 0.0, 0.8);
                        level.jump_hud.glowAlpha = 1;
                        level.jump_hud.hideWhenInMenu = false;
                        level.jump_hud setText( ">>   ^2" + player.name + "^3 VS ^1" + level.activ.name + "^3!   <<" );
                        level.jump_hud setPulseFX( 40, 2000, 99999999 );
       
                        thread jumpstarthud();
                        wait 5;
                        player freezeControls( false );
                        level.activ freezeControls( false );
                        level.jump_hud destroy();
                        level.jumpstart_hud destroy();
                       
                }
                while( isAlive( player ) && isDefined( player ) )
                wait 0.1;
        }
 
}

Rotate() 
{ 
level.rotate_trig = getEnt( "rotate_trig", "targetname"); 
jump = getEnt( "rotate_origin_jumper", "targetname" ); 
acti = getEnt( "rotate_origin_acti", "targetname" ); 

while(1) 
	{ 
		level.rotate_trig waittill( "trigger", player ); 
		if( !isDefined( level.rotate_trig ) ) 
		return; 

		if (IsDefined(level.sniper_trig)) level.sniper_trig delete(); 
		if (IsDefined(level.bounce_trig)) level.bounce_trig delete(); 
		if (IsDefined(level.pistol_trig)) level.pistol_trig delete(); 
		if (IsDefined(level.upsidedown_trig)) level.upsidown_trig delete();

		player setPlayerAngles( jump.angles ); 
		player setOrigin( jump.origin ); 
		player takeAllWeapons(); 
		player giveWeapon( "remington700_mp" ); 
		player giveWeapon( "m40a3_mp" );
		player giveMaxAmmo( "remington700_mp" );
		player giveMaxAmmo( "m40a3_mp" );
		player switchToWeapon( "remington700_mp" );
		if( isDefined( level.activ ) && isAlive( level.activ ) ) 
		{ 
			player freezeControls( true );
			level.activ freezeControls( true );
			level.lasers unlink();
			level.activ setPlayerAngles( acti.angles ); 
			level.activ setOrigin( acti.origin ); 
			level.activ takeAllWeapons(); 
			level.activ giveWeapon( "remington700_mp" ); 
			level.activ giveWeapon( "m40a3_mp" );
			level.activ giveMaxAmmo( "remington700_mp" );
			level.activ giveMaxAmmo( "m40a3_mp" );
			level.activ switchToWeapon( "remington700_mp" );
			
			level.jump_hud = newHudElem();
			level.jump_hud.foreground = true;
			level.jump_hud.AlignX = "center";
			level.jump_hud.AlignY = "top";
			level.jump_hud.horzAlign = "center";
			level.jump_hud.vertAlign = "top";
			level.jump_hud.x = 0;
			level.jump_hud.y = 10;
			level.jump_hud.sort = 0;
			level.jump_hud.fontScale = 2.5;
			level.jump_hud.color = (2, 0.8, 0.8);
			level.jump_hud.font = "objective";
			level.jump_hud.glowcolor = (2, 0.8, 0.8);
			level.jump_hud.glowAlpha = 1;
			level.jump_hud.hideWhenInMenu = false;
			level.jump_hud setText( ">>   ^2" + player.name + "^3 VS ^1" + level.activ.name + "^3!   <<" );
			level.jump_hud setPulseFX( 40, 2000, 99999999 );
	
			thread jumpstarthud();
			wait 5;
			player freezeControls( false );
			level.activ freezeControls( false );
			level.jump_hud destroy();
			level.jumpstart_hud destroy();
			
		} 
		while( isAlive( player ) && isDefined( player ) ) 
		wait 0.1; 
	} 

}


//More shit for rooms
Snipermusic()
{
	trig = getEnt("gaspedal","targetname");
	
	while(1)
	{
		trig waittill("trigger", player);
		
		trig delete();
		ambientPlay("river");
		wait 0.1;
		iPrintLn(" Riverside, motherfucker!  ");
	}
}

Rotatemusic()
{
	trig = getEnt("rotatemusic","targetname");
	
	while(1)
	{
		trig waittill("trigger", player);
		
		trig delete();
		ambientPlay("bust");
		wait 0.1;
		iPrintlnBold("Who ya gonna call? fgts ");
	}
}

Jumpertele1()
{
	trig = getEnt("jumpertele1", "targetname");
	tele1 = getEnt("jumpertele_origin", "targetname");
	actitele1 = getEnt("actitele_origin", "targetname");
		
	for(;;)
	{
		trig waittill ("trigger", player);
		
		if(player.pers["team"] == "allies")
		{
			player setOrigin(tele1.origin);
			player setPlayerAngles(tele1.angles );
		}
		else if(player.pers["team"] == "axis")    
		{
			player setOrigin(actitele1.origin);
			player setPlayerAngles(actitele1.angles );            
		}
	}
}

Actitele1()
{
	trig = getEnt("actitele1", "targetname");
	tele1 = getEnt("jumpertele_origin", "targetname");
	actitele1 = getEnt("actitele_origin", "targetname");
       
    for(;;)
	{
		trig waittill ("trigger", player);
		
		if(player.pers["team"] == "allies")
		{
			player setOrigin(tele1.origin);
			player setPlayerAngles(tele1.angles );
		}
		else if(player.pers["team"] == "axis")    
		{
			player setOrigin(actitele1.origin);
			player setPlayerAngles(actitele1.angles );            
		}
	}
}

Secret_Weapon()
{
	trig = getEnt("secret_weapon","targetname");
	
	while(1)
	{
		trig waittill ("trigger", player);
		player iPrintlnBold("With Great Power Comes Great Noscopes.");
		wait 0.1;
		player giveWeapon("remington700_mp");
		player giveMaxAmmo("remington700_mp");
		wait 0.1;
		player switchToWeapon("remington700_mp");
	}
}

Secret_Weapon2()
{
	trig = getEnt("gunforfgts","targetname");
	
	while(1)
	{
		trig waittill ("trigger", player);
		player iPrintlnBold("Another Sniper, Now you're pushing it..");
		
		player giveWeapon("m40a3_mp");
		player giveMaxAmmo("m40a3_mp");
		player switchToWeapon("m40a3_mp");
	}
}

Secret_Weapon3()
{
	trig = getEnt("hahano","targetname");
	
	while(1)
	{
		trig waittill ("trigger", player);
		player iPrintlnBold("So you thought you'd get another sniper huh?, How about no!!");
		player suicide();
	}
}

Endgun()
{
	trig = getEnt("endgun","targetname");
	
	while(1)
	{
		trig waittill ("trigger", player);
		trig delete();
		player takeAllWeapons();
		wait 0.1;
		iPrintlnBold( " ^6"+ player.name +"^5 Has Finished Dawn First^1!" );
		wait 0.5;
		trig delete();
		player giveWeapon("colt44_mp");
		player giveMaxAmmo("colt44_mp");
		wait 0.1;
		player switchToWeapon("colt44_mp");
	}
}

Enddoor()
{

    trig = getEnt( "doorfgt", "targetname" );
    brush = getEnt( "doorend2", "targetname" );
    brush2 = getEnt( "doorend1", "targetname" );
    
	trig waittill( "trigger");
	trig delete();
	{
	wait 0.1;
	brush moveZ(-368,6,0.8,0.8);
	brush2 moveZ(368,6,0.8,0.8);
	}
}