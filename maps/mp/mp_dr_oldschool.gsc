main()
{
maps\mp\_load::main();
	
level.smokefx = LoadFX( "smoke/smoke_dead" );
level.electricofx = LoadFX( "distortion/electrico" );

precacheItem("Barretns_mp");


ambientPlay( "nova" );
	
game["allies"] = "sas";
game["axis"] = "opfor";
game["attackers"] = "axis";
game["defenders"] = "allies";
game["allies_soldiertype"] = "woodland";
game["axis_soldiertype"] = "woodland";
//thread
addTriggerToList( "trap1_trig" );
addTriggerToList( "trap2_trig" );
addTriggerToList( "trap3_trig" );
addTriggerToList( "trap4_trig" );
addTriggerToList( "trap5_trig" );
addTriggerToList( "trap6_trig" );
addTriggerToList( "trap7_trig" );
addTriggerToList( "trapex" );

thread spawn();
thread final();
thread traps();
thread random2();
thread secret();
thread rooms();
thread addTestClients();
thread secret_end();
}

addTestClients()
{
	SetDvar("scr_testclients", "");
	wait 1;
	for(;;)
	{
		if (getdvarInt("scr_testclients") > 0)
		break;
		wait 1;
	}
	testclients = getdvarInt("scr_testclients");
	SetDvar( "scr_testclients", 0);
	for (i=0;i<testclients;i++)
	{
		ent[i] = addTestClients();

		if (!isDefined(ent[i]))
		{
			Println("no se pudo agregar testclients ");
			wait 1;
			continue;
		}
		ent[i].pers["isBot"] = true;
		ent[i] thread testclients("autoassing");
	}
	thread addTestClients();
}

testclients(team)
{
	self endon( "disconnect" );

	while(!isDefined(self.pers["team"]))

	wait .05;
	
	self notify("menuresponse", game["menu_team"], team);
	wait .05;
}

spawn()
{
	spawn = GetEnt("spawn_door","targetname");

	level waittill("round_started");

	iPrintln( "^7Now Playing: ^3Ahrix Nova " );
	wait 0.1;
	iPrintln( "^7Now Playing: ^3Ahrix Nova " );
	noti = SpawnStruct();
	noti.titleText = " ^4Map ^2By ^9Hiram ";
	noti.notifyText = " ^4Map: ^7-> ^6OldSchool ";
	noti.glowcolor = (3,1,0.5);
	noti.duration = 8;
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	spawn MoveZ(200, 4);
	spawn waittill("movedone");
	spawn Delete();
}

final()
{
	door1 = GetEnt("final_door1","targetname");
	door2 = GetEnt("final_door2","targetname");
	endmap = GetEnt("endmap_trig","targetname");

	endmap waittill("trigger", player);
	iPrintlnBold(player.name + " ^4Finished the map first!!");

	door1 MoveZ(100, 2);
	door2 MoveZ(-100, 2);
	door2 waittill("movedone");
	door1 Delete();
	door2 Delete();
}


random2()
{
	ak47 = GetEnt("ak47gl","targetname");
	out = GetEnt("ak47out","targetname");

	for(;;)
	{
	ak47 waittill("trigger", player);
	player iPrintlnBold("^8Enjoyn your weapon");
	player SetPlayerAngles( out.angles );
	player setOrigin( out.origin );
	player TakeAllWeapons();
	player GiveWeapon( "deserteagle_mp" );
	player GiveMaxAmmo( "deserteagle_mp" );
	wait 0.1;
	player SwitchToWeapon( "deserteagle_mp" );
	}
}

secret()
{
	secret = GetEnt("secret1","targetname");
	secretgo = GetEnt("secretgo","targetname");

	for(;;)
	{
		secret waittill("trigger", player);
		iPrintlnBold(player.name + " ^2Found the ^6Secret");

		wait 0.5;
		player SetPlayerAngles( secretgo.angles );
		player setOrigin( secretgo.origin );
	}
}

secret_end()
{
	secret_end = getEnt("end_secret","targetname");
	tp = getEnt("end_tp","targetname");

	for(;;)
	{
	secret_end waittill("trigger", player);

	iPrintlnBold(player.name + " ^6Finished ^9Secret");
	wait 1;
	player SetPlayerAngles( tp.angles );
	player setOrigin( tp.origin );
	player GiveWeapon( "barretns_mp" );
	}
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

traps()
{
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trapex();
}

trap1()
{
	trap1 = GetEnt("trap1_trig","targetname");
	remove1 = GetEnt("trap1_remove","targetname");
	remove2 = GetEnt("remove2","targetname");

	trap1 waittill("trigger", player);

	player iPrintlnBold("^4Trap Actived");

	remove1 MoveZ(30, 0.2);
	remove2 NotSolid();
}

trap2()
{
	trap2 = GetEnt("trap2_trig","targetname");
	movetrap = GetEnt("removetrap","targetname");

	trap2 waittill("trigger", player);
	player iPrintlnBold("^4Trap Actived");

	wait 1;
	movetrap MoveX(700, 0.5);
	movetrap waittill("movedone");
	movetrap MoveX(-700, 0.7);
}

trap3()
{
	trap3 = GetEnt("trap3_trig","targetname");
	movetrap1 = GetEnt("movetrap1","targetname");

	trap3 waittill("trigger", player);
	player iPrintlnBold("^4Trap Actived");

	movetrap1 MoveX(500,0.7);
	movetrap1 waittill("movedone");
	movetrap1 Delete();
	trap3 Delete();
}

trap4()
{
	trap4 = GetEnt("trap4_trig","targetname");
	transparent = GetEnt("transparent","targetname");

	trap4 waittill("trigger", player);

	player iPrintlnBold("^4Trap Actived");

	transparent NotSolid();
	trap4 Delete();
}

trap5()
{
	traptrig = GetEnt("trap5_trig","targetname");
	elec1 = GetEnt("elec1","targetname");
	elecfx = GetEnt("elecfx","targetname");

	traptrig waittill("trigger", player);

	playfx( level.electricofx , elecfx.origin );
	player iPrintlnBold("^4Trap Actived");

	elec1 waittill("trigger", player);
	playfx( level.electricofx , elecfx.origin );
	wait 0.5;
	player playlocalsound("exp_suitcase_bomb_stereo");
	wait 0.1;
	player suicide();
}

trap6()
{
	trig = GetEnt("trap6_trig","targetname");
	door1 = GetEnt("trap6_door1","targetname");
	door2 = GetEnt("trap6_door2","targetname");
	hurt1 = GetEnt("waithurt","targetname");
	smoke = GetEnt("smoke","targetname");

	trig waittill("trigger", player);
	
	player iPrintlnBold("^4Trap Actived");

	hurt1 waittill("trigger", player);

	door1 MoveZ(280, 1);
	door2 MoveZ(280, 1);
	wait 0.5;
	playfx( level.smokefx , smoke.origin );
	player playlocalsound("breathing_hurt");
	wait 1;
	playfx( level.smokefx , smoke.origin );
	player playlocalsound("breathing_hurt");
	player iPrintlnBold("^1Infected!!!");
	wait 2;
	playfx( level.smokefx , smoke.origin );
	player playlocalsound("breathing_hurt");
	wait 0.1;
	playfx( level.smokefx , player.origin );
	player playlocalsound("wtf");
	wait 0.5;
	player suicide();

	door1 Delete();
	door2 Delete();
	trig Delete();
	hurt1 Delete();

}

trap7()
{
	punch1 = GetEnt("punch","targetname");
	punch2 = GetEnt("punch2","targetname");
	trap7 = GetEnt("trap7_trig","targetname");
	hurt1 = GetEnt("phurt1","targetname");
	hurt2 = GetEnt("phurt2","targetname");

	hurt1 EnableLinkTo();
	hurt2 EnableLinkTo();
	hurt1 LinkTo( punch1 );
	hurt2 LinkTo( punch2 );

	trap7 waittill("trigger", player);
	player iPrintlnBold("^4Trap Actived");

	wait 0.1;
	punch1 MoveZ(-200, 1);
	wait 1.1;
	punch2 MoveZ(-200, 1);

	wait 1;
	punch1 MoveZ(200, 0.1);
	wait 1.1;
	punch2 MoveZ(200, 0.1);


}

trapex()
{
	trapex = GetEnt("trapex","targetname");
	empujar = GetEnt("empujon","targetname");

	trapex waittill("trigger", player);
	player iPrintlnBold("^4Trap Actived");
 	
 	while(1)
 	{
 	empujar rotateRoll(180, 1);
 	empujar waittill("rotatedone");
 	wait 1.2;
 	empujar rotateRoll(-180, 1);
 	empujar waittill("rotatedone");
 	wait 1.2;
 	}
}

rooms()
{
	thread sniper_room();
	thread jump_room();
	thread red_room();
	thread old_room();
	thread ammo();
}

sniper_room()
{
	level.sniper_room = GetEnt("sniper_room","targetname");
	jump = GetEnt( "sniper_j", "targetname" );
	activator = GetEnt( "sniper_a", "targetname" );

	while(1)
	{
		level.sniper_room waittill("trigger", player);
		if ( !IsDefined(level.playerInRoom) || !level.playerInRoom )
		{
			 if ( isDefined(level.old_room) )
				level.old_room Delete();
				level.red_room Delete();
				level.jump_room Delete();
			level.playerInRoom = true;

			player.health = player.maxhealth;
			player SetPlayerAngles( jump.angles );
			player SetOrigin( jump.origin );
			player TakeAllWeapons();
			player GiveWeapon( "remington700_mp" );
			player GiveWeapon( "m40a3_mp" );
			player GiveMaxAmmo( "remington700_mp" );
			player GiveMaxAmmo( "m40a3_mp" );
			if (IsDefined(level.activ))
			{
			level.activ SetPlayerAngles( activator.angles );
			level.activ SetOrigin( activator.origin );
			level.activ TakeAllWeapons();
			level.activ GiveWeapon( "remington700_mp" );
			level.activ GiveWeapon( "m40a3_mp" );
			level.activ GiveMaxAmmo( "remington700_mp" );
			level.activ GiveMaxAmmo( "m40a3_mp" );
			}
			wait 0.1;
			player switchToWeapon( "remington700_mp" );
			if (IsDefined(level.activ))
			{
			level.activ switchToWeapon( "remington700_mp" );
			level.activ FreezeControls(1);
			}
			player FreezeControls(1);
			noti = SpawnStruct();
					noti.titleText = "^4sniper room";
					if (IsDefined(level.activ))
					noti.notifyText = level.activ.name + " ^6VS^7" + player.name;
					noti.glowcolor = (1,0,0.9);
					noti.duration = 4;
					players = getentarray("player", "classname");
					for(i=0;i<players.size;i++)
						players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
					wait 5;
					iPrintlnBold("^5Sniper Fight GO");
					player FreezeControls(0);
					if (IsDefined(level.activ))
						level.activ FreezeControls(0);
			player waittill( "death" );
			iPrintlnBold(player.name + " ^5Dead");
			level.playerInRoom = false;

		}
	}	
}

jump_room()
{
	level.jump_room = GetEnt("jump_room","targetname");
	jump = GetEnt( "jump_j", "targetname" );
	activator = GetEnt( "jump_a", "targetname" );

	while(1)
	{
		level.jump_room waittill("trigger", player);
		if ( !level.playerInRoom )
		{
			 if ( isDefined(level.old_room) )
				level.old_room Delete();
				level.sniper_room Delete();
				level.red_room Delete();
			level.playerInRoom = true;

			AmbientStop( 2 );
            AmbientPlay( "blank" );
            iPrintln( "^7Now Playing: ^3Disfigure - Blank " );
			player.health = player.maxhealth;
			player SetPlayerAngles( jump.angles );
			player SetOrigin( jump.origin );
			player TakeAllWeapons();
			player GiveWeapon( "tomahawk_mp" );
			if (IsDefined(level.activ))
			{
				level.activ SetPlayerAngles( activator.angles );
				level.activ SetOrigin( activator.origin );
				level.activ TakeAllWeapons();
				level.activ GiveWeapon( "tomahawk_mp" );
			}
			wait 0.1;
			player switchToWeapon( "tomahawk_mp" );
			if (IsDefined(level.activ))
			{
				level.activ switchToWeapon( "tomahawk_mp" );
				level.activ FreezeControls(1);
			}
			player FreezeControls(1);
			noti = SpawnStruct();
					noti.titleText = "^4Jump Room";
					if (IsDefined(level.activ))
						noti.notifyText = level.activ.name + " ^6VS^7" + player.name;
					noti.glowcolor = (1,0,0.9);
					noti.duration = 4;
					players = getentarray("player", "classname");
					for(i=0;i<players.size;i++)
						players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
					wait 5;
					iPrintlnBold("^2Jump Fight GO");
					player FreezeControls(0);
					if (IsDefined(level.activ))
						level.activ FreezeControls(0);
			player waittill( "death" );
			iPrintlnBold(player.name + " ^2Dead");
			level.playerInRoom = false;

		}
	}	
}

red_room()
{
	level.red_room = GetEnt("red_room","targetname");
	jump = GetEnt( "red_j", "targetname" );
	activator = GetEnt( "red_a", "targetname" );

	while(1)
	{
		level.red_room waittill("trigger", player);
		if ( !level.playerInRoom )
		{
			 if ( isDefined(level.old_room) )
				level.old_room Delete();
				level.sniper_room Delete();
				level.jump_room Delete();
			level.playerInRoom = true;

			AmbientStop( 2 );
            AmbientPlay( "heroe" );
            iPrintln( "^7Now Playing: ^3Epic Music War" );
            iPrintln( "^7Now Playing: ^3Epic Music War" );
			player.health = player.maxhealth;
			player SetPlayerAngles( jump.angles );
			player SetOrigin( jump.origin );
			player TakeAllWeapons();
			player GiveWeapon( "deserteagle_mp" );
			if (IsDefined(level.activ))
			{
			level.activ SetPlayerAngles( activator.angles );
			level.activ SetOrigin( activator.origin );
			level.activ TakeAllWeapons();
			level.activ GiveWeapon( "deserteagle_mp" );
			}
			wait 0.1;
			player switchToWeapon( "deserteagle_mp" );
			if (IsDefined(level.activ))
			{
				level.activ switchToWeapon( "deserteagle_mp" );
				level.activ FreezeControls(1);
			}
			player FreezeControls(1);
			noti = SpawnStruct();
					noti.titleText = "^4Red Room";
					if (IsDefined(level.activ))
						noti.notifyText = level.activ.name + " ^6VS^7" + player.name;
					noti.glowcolor = (1,0,0.9);
					noti.duration = 4;
					players = getentarray("player", "classname");
					for(i=0;i<players.size;i++)
						players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
					player FreezeControls(0);
					if (IsDefined(level.activ))
						level.activ FreezeControls(0);
			player waittill( "death" );
			iPrintlnBold(player.name + " ^2Dead");
			level.playerInRoom = false;

		}
	}	
}


old_room()
{
	door = GetEnt("old_door","targetname");
	level.old_room = GetEnt("old_room","targetname");

	level.old_room waittill("trigger", player);
	iPrintlnBold(player.name + " ^8Open Old Room");

	door Delete();
	level.sniper_room Delete();
	level.jump_room Delete();
	level.red_room Delete();
	level.old_room Delete();

	player waittill( "death" );
	iPrintlnBold(player.name + " ^2Dead ");
}

ammo()
{
	thread red_ammo();
	thread sniper_ammo();
	thread fail();
}

red_ammo()
{
	giveammo = GetEnt("red_ammo","targetname");

	for(;;)
	{
	giveammo waittill("trigger",player);
	player TakeAllWeapons();
	player GiveWeapon( "deserteagle_mp" );
	player GiveMaxAmmo( "deserteagle_mp" );
	wait 0.1;
	player switchToWeapon( "deserteagle_mp" );
	}
}

sniper_ammo()
{
	giveammo2 = GetEnt("giveammo","targetname");

	for(;;)
	{
	giveammo2 waittill("trigger",player);
	player TakeAllWeapons();
	player GiveWeapon( "m40a3_mp" );
	player GiveMaxAmmo( "m40a3_mp" );
	player GiveWeapon( "remington700_mp" );
	player GiveMaxAmmo( "remington700_mp" );
	wait 0.1;
	player switchToWeapon( "m40a3_mp" );
	}
}

fail()
{
	fail1 = GetEnt("jump_fail","targetname");
	fail2 = GetEnt("activ_fail","targetname");
	spawnj = GetEnt("spawnf","targetname");

	for(;;)
	{
	spawnj waittill("trigger", player);

	player SetPlayerAngles( fail1.angles );
	player SetOrigin( fail1.origin );
	if (IsDefined(level.activ))
	{
	level.activ SetPlayerAngles( fail2.angles );
	level.activ SetOrigin( fail2.origin );
	}
	}
}