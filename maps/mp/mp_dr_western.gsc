// __/\\\________/\\\_______________________________________________________________________/\\\\\\\\\__/\\\\\\_________________________________        
//  _\/\\\_______\/\\\____________________________________________________________________/\\\////////__\////\\\_________________________________       
//   _\//\\\______/\\\___/\\\__________________/\\\_______/\\\___________________________/\\\/______________\/\\\_________________________________      
//   __\//\\\____/\\\___\///___/\\\\\\\\\\__/\\\\\\\\\\\_\///______/\\\\\\\\____________/\\\________________\/\\\_____/\\\\\\\\\_____/\\/\\\\\\___     
//    ___\//\\\__/\\\_____/\\\_\/\\\//////__\////\\\////___/\\\___/\\\//////____________\/\\\________________\/\\\____\////////\\\___\/\\\////\\\__    
//     ____\//\\\/\\\_____\/\\\_\/\\\\\\\\\\____\/\\\______\/\\\__/\\\___________________\//\\\_______________\/\\\______/\\\\\\\\\\__\/\\\__\//\\\_   
//      _____\//\\\\\______\/\\\_\////////\\\____\/\\\_/\\__\/\\\_\//\\\___________________\///\\\_____________\/\\\_____/\\\/////\\\__\/\\\___\/\\\_  
//       ______\//\\\_______\/\\\__/\\\\\\\\\\____\//\\\\\___\/\\\__\///\\\\\\\\______________\////\\\\\\\\\__/\\\\\\\\\_\//\\\\\\\\/\\_\/\\\___\/\\\_ 
//        _______\///________\///__\//////////______\/////____\///_____\////////__________________\/////////__\/////////___\////////\//__\///____\///__

main()
{
    maps\mp\_load::main(); 

    game["allies"] = "marines";
    game["axis"] = "opfor";
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "desert";
    game["axis_soldiertype"] = "desert";

    // Dvars
    setdvar( "r_specularcolorscale", "1" );
    setdvar("r_glowbloomintensity0",".25");
    setdvar("r_glowbloomintensity1",".25");
    setdvar("r_glowskybleedintensity0",".3");

    // Traps
    thread bounce1();
    thread rotate();
    thread table();
    thread laser();
    thread tower();

    // Teleports
    thread teleport1();
    thread teleport2();
    thread antifail();

    // Secrets
    thread secret();
    thread secret2();

    // Rooms
    thread sniper();
    thread bounce(); 
    thread knife();
	thread pistol();
    thread bounceweapon();
    thread weaponrotate();

    // Messages
    thread iprintlns();
    thread hudmessage();

    // FX
    //level.fx = loadfx( "misc/ui_pickup_available" ); // PetX -> is not in DR2!
}

// Traps
bounce1() 
{
trig = getEnt ("trigger_bounce1", "targetname");
bounce1 = getEnt ("bounce1", "targetname");
trig setHintString ("Press &&1 to activate this trap!");
trig waittill ("trigger", player);
trig delete();

{
bounce1 moveZ (-192, 4);
wait 3;
wait 5;
bounce1 moveZ (192, 3.5);
wait 6; 
bounce1 moveZ (-192, 4);
wait 3;
wait 5; 
bounce1 moveZ (192, 4);
 }
}

rotate()
{
	object2 = getEnt("rotate", "targetname");
	trigger = getEnt("trigger_rotate", "targetname");
	trigger sethintstring("^2Press ^1[USE] ^2to Activate!");
	trigger waittill ("trigger", player );
	trigger delete();

	wait 1;
	object2 rotateYaw(360, 8);
}

table() 
{
    trig = getEnt ("trigger_table", "targetname");
    table = getEnt ("table", "targetname");
    trig setHintString ("^2Press ^1[USE] ^2to Activate!");
    trig waittill ("trigger", player);
    trig delete();

    table moveX (-135, 9);
    wait 3;
    wait 5;
    table moveX (135, 3.5);
    wait 6; 
    table moveX (-135, 9);
    wait 3;
    wait 5; 
    table moveX (135, 9);
}

laser()
{
    trig = getEnt ("trigger_laser", "targetname");
    object = getEnt ("laser", "targetname"); 
    trig setHintString ("^2Press ^1[USE] ^2to Activate!");
    trig waittill ("trigger" , player);
    killtrigger = getent("killtrig", "targetname");
    trig delete();
    killtrigger enablelinkto ();
    while(1)
	{
    	killtrigger linkto (object);
    	object moveY(95, 3 , 1, 2);
    	object waittill("movedone");
    	wait(2);
        object moveY(-95, 3, 1, 2);
        object waittill("movedone");
        wait(1);
    }
}  

tower()
{
	object= getEnt("tower", "targetname");
	trigger=getEnt("trigger_tower", "targetname");
	trigger sethintstring("^2Press ^1[USE] ^2to Activate!");
	trigger waittill ("trigger", player );
	trigger delete();

	wait 1;
    object rotateYaw(360, 9);
}

// Teleports
teleport1()
{
    trig = getEnt("trigger_teleport", "targetname");
    tele1 = getEnt("acti_teleport", "targetname");
    for(;;)
    {
        trig waittill("trigger", player );
        player setOrigin(tele1.origin);
    }
}

teleport2()
{
    trig = getEnt("trigger_teleport2", "targetname");
    tele2 = getEnt("acti_teleport2", "targetname");
    for(;;)
    {
        trig waittill("trigger", player );
        player setOrigin(tele2.origin);
    }
}

// Secrets
secret()
{
    trig = getEnt("trigger_secret", "targetname");
    stele = getEnt("jumper_teleport", "targetname");
    for(;;)
    {
        trig waittill("trigger", player );
        player setOrigin(stele.origin);
    }
}

secret2()
{
    trig = getEnt("trigger_secret2", "targetname");
    s2tele = getEnt("jumper2_teleport", "targetname");
    for(;;)
    {
        trig waittill("trigger", player );
        player setOrigin(s2tele.origin);
    }
}

// Rooms
sniper()
{
    level.sniper = getEnt( "sniper_trig", "targetname");
    jump = getEnt( "jumper_snip", "targetname" );
    acti = getEnt( "acti_snip", "targetname" );
    level.sniper setHintString("^2Press ^1[USE] ^2to enter ^1Sniper");
    while(1)
    {
        level.sniper setHintString("^2Press ^1[USE] ^2to enter ^1Sniper");
        level.sniper waittill("trigger", player);
        if(!isDefined(level.sniper))
            return;
        if (IsDefined(level.knife)) level.knife delete();
        if (IsDefined(level.bounce)) level.bounce delete();
        if (IsDefined(level.old)) level.old delete();
		if (IsDefined(level.pistol)) level.pistol delete();
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "m40a3_mp" );
        player GiveWeapon( "remington700_mp" );
		
		if (IsDefined(level.activ))
		{
			level.activ setPlayerangles( acti.angles );
			level.activ setOrigin( acti.origin );
			level.activ TakeAllWeapons();
			level.activ GiveWeapon( "m40a3_mp" );
			level.activ GiveWeapon( "remington700_mp" );
        }
		wait 0.05;
        player switchToWeapon( "m40a3_mp" );
		player FreezeControls(1);
		
		if (IsDefined(level.activ))
		{
			level.activ SwitchToWeapon( "m40a3_mp" );
			level.activ FreezeControls(1);
        }
		noti = SpawnStruct();
            noti.notifyText = "^1" + player.name + " ^2chose Sniper Room";
            noti.duration = 6;
            noti.glowcolor = (0, 0, 1.0);
            players = getEntArray("player", "classname");
            for(i=0;i<players.size;i++)
            players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
            wait 5;
        player FreezeControls(0);
		if (IsDefined(level.activ))
			level.activ FreezeControls(0);
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
    }
}

bounce()
{

    level.bounce = getEnt( "bounce_trig", "targetname");
    jump = getEnt( "jumper_bounce", "targetname" );
    acti = getEnt( "acti_bounce", "targetname" );
    level.bounce setHintString("^2Press ^1[USE] ^2to enter ^1Bounce");
    while(1)
    {
        level.bounce setHintString("^2Press ^1[USE] ^2to enter ^1Bounce");
        level.bounce waittill( "trigger", player );
        if(!isDefined(level.bounce))
            return;
        if (IsDefined(level.knife)) level.knife delete();
        if (IsDefined(level.sniper)) level.sniper delete();
        if (IsDefined(level.old)) level.old delete();
        if (IsDefined(level.pistol)) level.pistol delete();
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "knife_mp" );
		
		if (IsDefined(level.activ))
		{
			level.activ setPlayerangles( acti.angles );
			level.activ setOrigin( acti.origin );
			level.activ TakeAllWeapons();
			level.activ GiveWeapon( "knife_mp" );
        }
		wait 0.05;
        player switchToWeapon( "knife_mp" );
		
		if (IsDefined(level.activ))
		{
			level.activ SwitchToWeapon( "knife_mp" );
			level.activ FreezeControls(1);
        }
		player FreezeControls(1);
        noti = SpawnStruct();
            noti.notifyText = "^1" + player.name + " ^2chose Bounce Room";
            noti.duration = 6;
            noti.glowcolor = (0, 0, 1.0);
            players = getEntArray("player", "classname");
            for(i=0;i<players.size;i++)
            players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
            wait 5;
            player FreezeControls(0);
			if (IsDefined(level.activ))
				level.activ FreezeControls(0);
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
    }
}

knife()
{

	level.knife = getEnt( "knife_trig", "targetname");
    jump = getEnt( "jumper_knife", "targetname" );
    acti = getEnt( "acti_knife", "targetname" );
    level.knife setHintString("^2Press ^1[USE] ^2to enter ^1Knife");
    while(1)
    {
    	level.knife setHintString("^2Press ^1[USE] ^2to enter ^1Knife");
        level.knife waittill( "trigger", player );
        if(!isDefined(level.knife))
            return;
        if (IsDefined(level.sniper)) level.sniper delete();
        if (IsDefined(level.bounce)) level.bounce delete();
        if (IsDefined(level.old)) level.old delete();
		if (IsDefined(level.pistol)) level.pistol delete();
		player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
		if (IsDefined(level.activ))
		{
			level.activ setPlayerangles( acti.angles );
			level.activ setOrigin( acti.origin );
			level.activ TakeAllWeapons();
			level.activ GiveWeapon( "knife_mp" );
        }
		player TakeAllWeapons();
        player GiveWeapon( "knife_mp" );
        wait 0.05;
        player switchToWeapon( "knife_mp" );
		if (IsDefined(level.activ))
		{
			level.activ SwitchToWeapon( "knife_mp" );
			level.activ FreezeControls(1);
        }
		player FreezeControls(1);
		noti = SpawnStruct();
            noti.notifyText = "^1" + player.name + " ^2chose Knife Room";
            noti.duration = 6;
            noti.glowcolor = (0, 0, 1.0);
            players = getEntArray("player", "classname");
            for(i=0;i<players.size;i++)
            players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
            wait 5;
		player FreezeControls(0);
		if (IsDefined(level.activ))
			level.activ FreezeControls(0);
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
    }
}

pistol()
{

    level.pistol = getEnt( "pistol_trig", "targetname");
    jump = getEnt( "jumper_pistol", "targetname" );
    acti = getEnt( "acti_pistol", "targetname" );
    level.pistol setHintString("^2Press ^1[USE] ^2to enter ^1Pistol");
    while(1)
    {
        level.pistol setHintString("^2Press ^1[USE] ^2to enter ^1Pistol");
        level.pistol waittill( "trigger", player );
        if( !isDefined(level.pistol))
            return;
        if (IsDefined(level.knife)) level.knife delete();
        if (IsDefined(level.bounce)) level.bounce delete();
        if (IsDefined(level.old)) level.old delete();
		if (IsDefined(level.sniper)) level.sniper delete();
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
		
		if (IsDefined(level.activ))
		{
			level.activ setPlayerangles( acti.angles );
			level.activ setOrigin( acti.origin );
			level.activ takeallweapons();
			level.activ GiveWeapon( "colt44_mp" );
			level.activ setWeaponAmmoClip( "colt44_mp", 6 );
			level.activ setWeaponAmmoStock( "colt44_mp", 0 );
			level.activ SwitchtoWeapon( "colt44_mp" );	
			level.activ FreezeControls(1);	
		}
		
		player takeallweapons();
        player GiveWeapon( "colt44_mp" );
        player setWeaponAmmoClip( "colt44_mp", 6 );
        player setWeaponAmmoStock( "colt44_mp", 0 );
        player SwitchtoWeapon( "colt44_mp" );
		player FreezeControls(1);
		noti = SpawnStruct();
            noti.notifyText = "^1" + player.name + " ^2chose Pistol Room";
            noti.duration = 6;
            noti.glowcolor = (0, 0, 1.0);
            players = getEntArray("player", "classname");
            for(i=0;i<players.size;i++)
            players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
            wait 5;
		player FreezeControls(0);
		if (IsDefined(level.activ))
			level.activ FreezeControls(0);
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
    }
}

iprintlns()
{
    while(1)
    {
        iprintln("^5Server:^7 Map made by ^5VC' ^7R3K and ^1M^7i^1n^7i");
        wait 10;
        iprintln("^5Server:^7 Additional Help by ^5VC' ^7Blade");
        wait 10;
        iprintln("^5Server:^7 Special Thanks to Vistic");
        wait 10;
        iprintln("^5Server:^7 mp_dr_^5western");
        wait 10;
    }
}

hudmessage()
{
    level waittill("round_started");

    level.message = NewHudElem();
    level.message.alignX = "center";
    level.message.alignY = "middle";
    level.message.horzalign = "center";
    level.message.vertalign = "middle";
    level.message.alpha = 1;
    level.message.x = 0;
    level.message.y = 0;
    level.message.fontscale = 2;
    level.message.glowalpha = 1;
    level.message.glowcolor = (1, 0.5, 0);
    level.message.label = &"Map by VC' R3K and Mini";
    level.message SetPulseFX( 40, 5400, 200 );
    wait 3;
    level.message destroy();
}

antifail()
{
    acti = getEnt("acti_bounce","targetname");
    jump = getEnt("jumper_bounce","targetname");
    trigger = getent("bounce_antifail","targetname");
    for(;;)
    {
        trigger waittill("trigger",player);
    
        if(player.pers["team"] != "spectator")
        {
            if(player.pers["team"] == "allies")
            {
                player SetPlayerAngles(jump.angles);
                player SetOrigin(jump.origin);
            }
            if(player.pers["team"] == "axis")
            {
                player SetPlayerAngles(acti.angles);
                player SetOrigin(acti.origin);
            }
        }
    }
}

bounceweapon()
{
    trig = getEnt("r700_trigger","targetname");
    fx = getEnt("r700_fx","targetname");
    //playloopedfx(level.fx,0.5,fx.origin); // PetX -> FX doesn't exist
    for(;;)
    {
        trig waittill("trigger", pPlayer);

        pPlayer giveWeapon("remington700_mp");
        pPlayer switchtoweapon("remington700_mp");
    }
}
weaponrotate()
{
    wp = getEnt("r700_rotate","targetname");
    while(1)
    {
        wp rotateYaw(360,2);
        wait .1;
    }
}