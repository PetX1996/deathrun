main()
{
    //maps\mp\mp_strike_fx::main();
    //maps\createart\mp_strike_art::main();
    maps\mp\_load::main();

    game["allies"] = "Jumper";
    game["axis"] = "Activator";
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_soldiertype"] = "desert";
    game["axis_soldiertype"] = "desert";

    precacheItem("m60e4_mp");

    ambientPlay("sheox");

    //Important Shit
    thread addTestClients();
    thread Sheox();
    thread startdoor();
    thread platform1();
    thread platform2();

    //traps
    thread trap1();
    thread trap2();
    thread trap3();
    thread trap4();
    thread trap5();
    thread trap6();

    //rooms
    thread sniperoom();
    thread kniferoom();
    thread weaponroom();

    addTriggerToList( "trap1_trigger" );
    addTriggerToList( "trap2_trigger" );
    addTriggerToList( "trap3_trigger" );
    addTriggerToList( "trap4_trigger" );
    addTriggerToList( "trap5_trigger" );
    addTriggerToList( "trap6_trigger" );

}

/////////////////////////////////////
// Important Shit XD //
/////////////////////////////////////

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

Sheox() //Pls dont change it.
{
    if( isDefined( self.Sheox ) )
        self.Sheox destroy();

    self.Sheox = newHudElem();
    self.Sheox.foreground = true;
    self.Sheox.alignX = "left";
    self.Sheox.alignY = "top";
    self.Sheox.horzAlign = "left";
    self.Sheox.vertAlign = "top";
    self.Sheox.x = 4;
    self.Sheox.y = 0;
    self.Sheox.sort = 0;
    self.Sheox.fontScale = 1.5;
    self.Sheox.color = (0.8, 1.0, 0.8);
    self.Sheox.font = "objective";
    self.Sheox.glowColor = (0, 0, 1.0);
    self.Sheox.glowAlpha = 1;
    self.Sheox SetPulseFX( 30, 100000, 700 );//something, decay start, decay duration
    self.Sheox.hidewheninmenu = true;
    self.Sheox setText( "Map made by ^1Sheox" );

}

startdoor()
{
    door = getEnt( "startdoor", "targetname" );

    wait 5;

    IPrintLnBold( "^1Map by sheox :3" );
    wait 5;
    door moveZ( -256, 5 );

}

platform1()
{
    form1 = getEnt( "form1", "targetname" );

    for(;;)
    {
        wait 5;
        form1 MoveX( 1280, 5 );
        wait 5;
        form1 MoveX( -1280 , 5 );
    }

}

platform2()
{
    form2 = getent( "form2", "targetname" );
    
    for(;;)
    {
        wait 5;
        form2 MoveX( 1728, 5 );
        wait 5;
        form2 MoveX( -1728, 5 );
    }
}

/////////////////////////////////////
// Traps //
/////////////////////////////////////

trap1()
{
    trig = getEnt( "trap1_trigger", "targetname" );
    brush1 = getEnt( "trap1_rotate1", "targetname" );
    brush2 = getEnt( "trap1_rotate2", "targetname" );
    brush3 = getEnt( "trap1_rotate3", "targetname" );

    trig waittill( "trigger", who );
    trig delete();

    iPrintlnBold( "^1Activator Activate Trap1" );

    for(;;)
    {
        brush1 rotateRoll( 180, 1.5 );
        brush3 rotateRoll( 180, 1.5 );
        wait 0.5;
        brush2 rotateRoll( 180, 1.5 );
        wait 1;
    }
}

trap2()
{
    trig = getEnt( "trap2_trigger", "targetname" );
    brush1 = getEnt( "trap2_door1", "targetname" );
    brush2 = getEnt( "trap2_door2", "targetname" );
    brush3 = getEnt( "trap2_floor", "targetname" );

    trig waittill( "trigger", who );
    trig delete();

    IPrintLnBold( "^1Activator activate trap2" );

    brush1 MoveZ( -126, 1 );
    brush2 MoveZ( -126, 1 );
    wait 4;
    brush3 MoveY( -150, 1 );
    wait 4;
    brush3 MoveY( 150, 1 );
    wait 4;
    brush1 MoveZ( 126, 1 );
    brush2 MoveZ( 126, 1 );
}

trap3()
{
    trig = getEnt( "trap3_trigger", "targetname" );
    brush1 = getEnt( "trap3_updown1", "targetname" );
    brush2 = getEnt( "trap3_updown2", "targetname" );
    brush3 = getEnt( "trap3_downup", "targetname" );

    trig waittill( "trigger", who );
    trig delete();

    iPrintlnBold( "^1Activator Activate Trap1" );

    for(;;)
    {
        brush1 MoveZ( 130, 2 );
        brush2 MoveZ( 130, 2 );
        brush3 MoveZ( -130, 2 );
        wait 0.5;
        brush1 MoveZ( -130, 2 );
        brush2 MoveZ( -130, 2 );
        brush3 MoveZ( 130, 2 );
        wait 0.5;
    }
}

trap4()
{
    part1 = getentarray ("trap4_noncollid1" ,"targetname");
    part2 = getentarray ("trap4_noncollid2" ,"targetname");
    trig_2 = getent ("trap4_trigger" , "targetname");
    
    trig_2 waittill ("trigger" , player );
    trig_2 delete ();

    iPrintlnBold( "^1Activator activate Trap 4" );

    part1[randomInt(part1.size)] notsolid();
    part2[randomInt(part2.size)] notsolid();
}

trap5()
{
    trig = getEnt( "trap5_trigger", "targetname" );
    brush = getEnt( "trap5_roll", "targetname" );

    trig waittill( "trigger", who );
    trig delete();

    iPrintlnBold( "^1Activator Activate Trap5" );

    while( isDefined( brush ) )
    {
        brush rotateRoll( 180, 5 );
        wait 3;
    }
}

trap6()
{
    trig = getEnt( "trap6_trigger", "targetname" );
    brush = getEnt( "trap6_klein2", "targetname" );

    trig waittill( "trigger", who );
    trig delete();

    IPrintLnBold( "^1Activator activate the last Trap :3" );

    wait 0.5;
    brush moveY( 336, 2 );
    wait 10;
    brush moveY( -336, 2 );    
    wait 1;
}

/////////////////////////////////////
// Rooms //
/////////////////////////////////////

sniperoom()
{
    level.teleactorigin3 = getEnt("sniperactivator", "targetname");
    telesniperorigin = getEnt("sniperjumper", "targetname");
    level.snipertrigger = getEnt("sniper_trigger", "targetname");
    knifetrigger = getEnt("knife_trigger", "targetname");
    weapontrigger = getEnt("weapon_trigger", "targetname");

    for(;;)
    {
        level.snipertrigger waittill("trigger", player);
        knifetrigger delete();
        weapontrigger delete();
        wait 0.05;
        player SetOrigin( telesniperorigin.origin );
        player setplayerangles( telesniperorigin.angles );
        player TakeAllWeapons();
        player GiveWeapon( "m40a3_mp" ); 
        player Giveweapon( "remington700_mp" );
        wait 0.05;
		if (IsDefined(level.activ))
		{
			level.activ SetOrigin (level.teleactorigin3.origin);
			level.activ setplayerangles (level.teleactorigin3.angles);
			level.activ TakeAllWeapons();
			level.activ GiveWeapon( "m40a3_mp" );
			level.activ Giveweapon( "remington700_mp" ); 
        }
		wait 0.05;
		
		iPrintlnBold( " ^4" + player.name + " ^7 has chosen ^3Snipe^7!" );
		
        player switchToWeapon( "m40a3_mp" );
		player iPrintlnBold( "Kill the activator" );

		if (IsDefined(level.activ))
		{
			level.activ SwitchToWeapon( "m40a3_mp" );
			level.activ iPrintlnBold( "Kill the Jumper" );
		}
		
        level.teleorigin delete();
        while( isAlive( player ) && isDefined( player ) )
                    wait 1;
    }
}

kniferoom()
{
    level.teleactoriginknife = getEnt("knifeactivator", "targetname");
    teleknifeorigin = getEnt("knifejumper", "targetname");
    level.knifetrigger = getEnt("knife_trigger", "targetname");
    snipertrigger = getEnt("sniper_trigger", "targetname");
    weapontrigger = getEnt("weapon_trigger", "targetname");

    for(;;)
    {
        level.knifetrigger waittill("trigger", player);
        snipertrigger delete();
        weapontrigger delete();
        wait 0.05;
        player SetOrigin( teleknifeorigin.origin );
        player setplayerangles( teleknifeorigin.angles );
        player TakeAllWeapons();
        player GiveWeapon( "dog_mp" ); 
        player Giveweapon( "dog_mp" );
        wait 0.05;
		
		if (IsDefined(level.activ))
		{
			level.activ SetOrigin (level.teleactoriginknife.origin);
			level.activ setplayerangles (level.teleactoriginknife.angles);
			level.activ TakeAllWeapons();
			level.activ GiveWeapon( "dog_mp" );
			level.activ Giveweapon( "dog_mp" ); 
        }
		
		wait 0.05;
        player switchToWeapon( "dog_mp" );
		
		if (IsDefined(level.activ))
		{
			level.activ SwitchToWeapon( "dog_mp" );
			level.activ iPrintlnBold( "Kill the Jumper" );
        }
		level.teleorigin delete();
        iPrintlnBold( " ^4" + player.name + " ^7 has chosen ^3Knife^7!" );
        player iPrintlnBold( "Kill the activator" );
        while( isAlive( player ) && isDefined( player ) )
                    wait 1;
    }
}

weaponroom()
{
    level.teleactoriginweapon = getEnt("weaponactivator", "targetname");
    teleweaponorigin = getEnt("weaponjumper", "targetname");
    level.weapontrigger = getEnt("weapon_trigger", "targetname");
    knifetrigger = getEnt("knife_trigger", "targetname");
    snipertrigger = getEnt("sniper_trigger", "targetname");


    for(;;)
    {
        level.weapontrigger waittill("trigger", player);
        snipertrigger delete();
        knifetrigger delete();
        wait 0.05;
        player SetOrigin( teleweaponorigin.origin );
        player setplayerangles( teleweaponorigin.angles );
        player TakeAllWeapons();
        player GiveWeapon( "m60e4_mp" ); 
        player Giveweapon( "m60e4_mp" );
        wait 0.05;
		
		if (IsDefined(level.activ))
		{
			level.activ SetOrigin (level.teleactoriginweapon.origin);
			level.activ setplayerangles (level.teleactoriginweapon.angles);
			level.activ TakeAllWeapons();
			level.activ GiveWeapon( "m60e4_mp" );
			level.activ Giveweapon( "m60e4_mp" ); 
        }
		
		wait 0.05;
        player switchToWeapon( "m60e4_mp" );
		
		if (IsDefined(level.activ))
		{
			level.activ SwitchToWeapon( "m60e4_mp" );
			level.activ iPrintlnBold( "Kill the Jumper" );
        }
		
		level.teleorigin delete();
        iPrintlnBold( " ^4" + player.name + " ^7 has chosen ^3Weaponroom^7!" );
        player iPrintlnBold( "Kill the activator" );
        while( isAlive( player ) && isDefined( player ) )
                    wait 1;
    }
}

///////////////////////////////////////
// Bots //
//////////////////////////////////////

addTestClients()
{
    setDvar("scr_testclients", "");
    wait 1;
    for(;;)
    {
        if(getdvarInt("scr_testclients") > 0)
            break;
        wait 1;
    }
    testclients = getdvarInt("scr_testclients");
    setDvar( "scr_testclients", 0 );
    for(i=0;i<testclients;i++)
    {
        ent[i] = addtestclient();
 
        if (!isdefined(ent[i]))
        {
            println("Could not add test client");
            wait 1;
            continue;
        }
        ent[i].pers["isBot"] = true;
        ent[i] thread TestClient("autoassign");
    }
    thread addTestClients();
}

TestClient(team)
{
    self endon( "disconnect" );
 
    while(!isdefined(self.pers["team"]))
        wait .05;
       
    self notify("menuresponse", game["menu_team"], team);
    wait 0.5;
}