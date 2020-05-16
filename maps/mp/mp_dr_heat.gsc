//////////////////////////////////////////////////////////////
/////Do not use any of these scripts with out my permission///
////xfire:xlossx steam:xlossxftw don't add me for help////////
////My website: www.lossycreation.weebly.com//////////////////
////Do not edit or change anything.///////////////////////////
//////////////////////////////////////////////////////////////

/*
#################################################################################################
#################################################################################################
########__###########________########_________________#####_________________###___######___######
#######|  |#########|        |######|    _____________|###|    _____________|##\  \####/  /######				
#######|  |#########|   __   |######|  |##################|  |##################\  \##/  /#######
#######|  |#########|  |##|  |######|  |##################|  |###################\  \/  /########
#######|  |#########|  |##|  |######|  |_____________#####|  |_____________ ######\    /#########
#######|  |#########|  |##|  |######|_____________   |####|_____________   |#######|  |##########
#######|  |#########|  |__|  |####################|  |##################|  |#######|  |##########	
#######|  |____#####|        |#######_____________|  |#####_____________|  |#######|  |##########
#######|_______|####|________|######|________________|####|________________|#######|__|##########
#################################################################################################
#################################################################################################

*/

main()
{

    maps\mp\_load::main();
	
	PreCacheItem("mp44_mp");
	PreCacheItem("mp5_silencer_mp");
	PreCacheItem("remington700_mp");
	PreCacheItem("ak47_mp");
	PreCacheItem("g36c_mp");
	PreCacheItem("m60e4_grip_mp");
	PreCacheItem("p90_silencer_mp");
	PreCacheItem("ak74u_mp");
	PreCacheItem("crossbow_mp");
	PreCacheItem("m60e4_mp");

	game["allies"] = "sas";
	game["axis"] = "russian";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";

	
	setdvar( "r_specularcolorscale", "1" );
	
	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	
	setdvar("r_gamma", "1.8");
	
	thread musicMenu();
	
	//glitches
	thread glitch();
	thread glitch2();
	thread glitch3();
	thread glitch4();
	
	//fall
	thread fall2();
	thread fall3();
	thread fall4();
	thread fall5();
	
	//traps
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8();
	
	//secrets
	thread secret1();
	thread secret_1_leave();
	thread secret_2();
	thread secret_exp();
	thread secret_exp2();
	thread secret_exp3();
	
	//exp
	thread bear();
	thread bear2();
	thread bear3();
	
	//otherstuff
	thread start_door();
	thread first_door();
	thread second_door();
	thread printCredits();
	thread creater();
	thread kill();
	thread turn_terminator();
	thread creater_music1();
	thread creater_music2();
	thread creater_music3();
	thread platform();
	thread platform_2();
	
	//minigames
	thread minigames();
	thread minigun();
	thread knife();
	thread weapon();
	thread sniper();
	thread old();
	thread door_crossbow();
	thread door_minigun();
	thread door_weapon();
	thread door_knife();
	
	//weapons ammo
	thread activator_ammo();
	thread activator_p90();
	thread activator_ak47();
	thread activator_g36c();
	thread activator_ak74u();
	thread activator_m60e4();
	thread activator_mp5();
	thread activaor_mp44();
	thread jumper_ammo();
	thread jumper_p90();
	thread jumper_ak47();
	thread jumper_g36c();
	thread jumper_ak74u();
	thread jumper_m60e4();
	thread jumper_mp5();
	thread jumper_mp44();
	
}

/**************************************
*    In-game sound selection menu.
*
*    G    -    close menu
*    F    -    play song
*    LMB    -    select next song
*
*    BraXi (ó,ó) 2012
*    License : DWTFYW
**************************************/

initMusic()
{
    level.music = [];

    i = 0;
    level.music[i]["artist"] = "Onar";
    level.music[i]["title"] = "Halo Ziemia!";
    level.music[i]["length"] = "03:22";
    level.music[i]["alias"] = "onar_halo_ziemia";
    
    i++;
    level.music[i]["artist"] = "Czarny HIFI";
    level.music[i]["title"] = "Niedopowiedzenia II";
    level.music[i]["length"] = "05:27";
    level.music[i]["alias"] = "hifi_niedopowiedzenia2";

    precacheShader( "deathrun" );
    precacheShader( "white" );
}



musicMenu()
{
    if( isDefined( level.noMusicMenu ) )
        return;

    self endon( "disconnect" );
    self endon( "death" );
    self endon( "spawned" );
    self endon( "joined_spectators" );
    self endon( "music thread terminated" );

    self thread onDeath();
    self thread onDisconnect();

    self cleanUp();
    self.selection = 0;
    
    // create huds
    i = 0;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 160, 200, 0.92, "top", "left", 2 );    // Background
    self.hud_music[i].sort = 880;
    self.hud_music[i] setShader( "deathrun", 320, 160 );

    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 320, 205, 1.0, "top", "center", 1.8 );
    self.hud_music[i] setText( "^2Select Music" );

    for( j = 0; j < level.music.size; j++ )
    {
        i++;
        // Artist - Title [lenght]
        self.hud_music[i] = braxi\_mod::addTextHud( self, 320, 230+(j*16), 0.93, "top", "center", 1.4 );    
        self.hud_music[i].sort = 881;
        self.hud_music[i].font = "objective";

        entry = level.music[j];
        self.hud_music[i] setText( entry["artist"] + " - " + entry["title"] + " ^3[" + entry["length"] + "]" );
    }

    self.hud_music[self.hud_music.size] = braxi\_mod::addTextHud( self, 160, 210, 0.6, "top", "center", 1.4 );    // Selection indicator
    indicator = self.hud_music[self.hud_music.size-1];
    indicator setShader( "white", 16, 160 );
    
    while( self.sessionstate == "playing" )
    {
        wait 0.2;

        // close menu for all players
        if( isDefined( level.noMusicMenu ) )
        {    
            break;
        }    

        if( self attackButtonPressed() )    /* select next song */
        {
            self.hud_music[2+self.selection].alpha = 0.93; //unfocus previous item

            self.selection++;
            if( self.selection >= level.music.size )
                self.selection = 0;

            item = self.hud_music[2+self.selection];
            item.alpha = 1;
            indicator.y = item.y; //    change indicator position
        }
        else if( self useButtonPressed() )    /* play selected song */
        {
            iPrintlnBold( braxi\_common::removeColorFromString( self.name ) + " choosed to play " + level.music[self.selection]["artist"]+" - " +level.music[self.selection]["title"] );


            ambientPlay( level.music[self.selection]["alias"], 3 );
            level.noMusicMenu = true;
        }
        else if( self fragButtonPressed() )    /* close menu */
        {
            break; // close menu
        }
    }

    self cleanUp();
}


onDisconnect()
{
    self endon( "music thread terminated" );
    self waittill( "disconnect" );
    self cleanUp();
}
onDeath()
{
    self endon( "disconnect" );
    self endon( "music thread terminated" );
    self waittill( "death" );
    self cleanUp();
}


cleanUp()
{
    if( !isDefined( self ) )
        return;

    if( isDefined( self.hud_music ) )
    {
        for( i = 0; i < self.hud_music.size; i++ )
        {
            if( isDefined( self.hud_music[i] ) )
                self.hud_music[i] destroy();
        }
    }
    self notify( "music thread terminated" );
}

glitch()
{
	trig = getEnt ("glitch", "targetname");
	
	for(;;)
	{
		trig waittill ("trigger", who);
		who iprintlnbold ("Glitching on my map I see^1.");
		wait 2;
		who iprintlnbold ("Well^1 I have some news for you son^1.");
		who iprintlnbold ("In about 5 seconds your going to die^1.");
		wait 5;
		who iprintlnbold ("Don^1'^7t be mad^1, ^7have a flower ^2*^6v^2*");
		iprintlnbold ("^3" + who.name + "^1, ^7tried to glitch admins^1!");
		who suicide();		
	}
}

glitch2()
{
	trig = getEnt ("glitch2", "targetname");
	
	for(;;)
	{
		trig waittill ("trigger", who);
		who iprintlnbold ("Glitching on my map I see^1.");
		wait 2;
		who iprintlnbold ("Well^1 I have some news for you son^1.");
		who iprintlnbold ("In about 5 seconds your going to die^1.");
		wait 5;
		who iprintlnbold ("Don^1'^7t be mad^1, ^7have a flower ^2*^6v^2*");
		iprintlnbold ("^3" + who.name + "^1, ^7tried to glitch admins^1!");
		who suicide();		
	}
}

glitch3()
{
	trig = getEnt ("glitch3", "targetname");
	
	for(;;)
	{
		trig waittill ("trigger", who);
		who iprintlnbold ("Glitching on my map I see^1.");
		wait 2;
		who iprintlnbold ("Well^1 I have some news for you son^1.");
		who iprintlnbold ("In about 5 seconds your going to die^1.");
		wait 5;
		who iprintlnbold ("Don^1'^7t be mad^1, ^7have a flower ^2*^6v^2*");
		iprintlnbold ("^3" + who.name + "^1, ^7tried to glitch admins^1!");
		who suicide();		
	}
}

glitch4()
{
	trig = getEnt ("glitch4", "targetname");
	
	for(;;)
	{
		trig waittill ("trigger", who);
		who iprintlnbold ("Glitching on my map I see^1.");
		wait 2;
		who iprintlnbold ("Well^1 I have some news for you son^1.");
		who iprintlnbold ("In about 5 seconds your going to die^1.");
		wait 5;
		who iprintlnbold ("Don^1'^7t be mad^1, ^7have a flower ^2*^6v^2*");
		iprintlnbold ("^3" + who.name + "^1, ^7tried to glitch admins^1!");
		who suicide();		
	}
}

fall()
{
	trig = getEnt ("fall", "targetname");
	
	for(;;)
	{
		trig waittill ("trigger", who);
		who iprintlnbold ("Don^1'^7t be mad^1, ^7have a flower ^2*^6v^2*");
		who suicide();		
	}
}

fall2()
{
	trig = getEnt ("fall2", "targetname");
	
	for(;;)
	{
		trig waittill ("trigger", who);
		who iprintlnbold ("Don^1'^7t be mad^1, ^7have a flower ^2*^6v^2*");
		who suicide();		
	}
}

fall3()
{
	trig = getEnt ("fall3", "targetname");
	
	for(;;)
	{
		trig waittill ("trigger", who);
		who iprintlnbold ("Don^1'^7t be mad^1, ^7have a flower ^2*^6v^2*");
		who suicide();		
	}
}

fall4()
{
	trig = getEnt ("fall4", "targetname");
	
	for(;;)
	{
		trig waittill ("trigger", who);
		who iprintlnbold ("Don^1'^7t be mad^1, ^7have a flower ^2*^6v^2*");
		who suicide();		
	}
}

fall5()
{
	trig = getEnt ("fall5", "targetname");
	
	for(;;)
	{
		trig waittill ("trigger", who);
		who iprintlnbold ("Don^1'^7t be mad^1, ^7have a flower ^2*^6v^2*");
		who suicide();		
	}
}

///////////////////////////TRAPS/////////////////////////////////////////////////////////////
trap1()
{
	brush = getEnt ("trap1_spikes", "targetname");
	hurt = getEnt ("trap1_hurt", "targetname");
	trig = getEnt ("trap1_trig", "targetname");
	
	hurt enablelinkto();
    hurt linkto (brush);
	
	trig waittill("trigger", who);
	trig setHintString("Trap Activated^1!");
	
	thread exp();
	
	{
		brush moveZ (-227, 1);
		wait 5;
		brush moveZ(227, 3);
		
	}
}

exp()
{
	trig = getEnt( "exp", "targetname" );

	trig waittill( "trigger", user );
	user braxi\_rank::giveRankXp( "kill", 5 );
	user iprintlnbold ("You got 5xp!");
	trig delete();
}

trap2()
{
	trig = getEnt ("trap2_trig", "targetname"); 
	
	trig waittill ("trigger", who);
    trig setHintString("Trap Activated^1!");
	
	thread exp2();
	
	for(;;)
	{
		if( RandomInt(2) == 0 )
		{
			thread kill1();
			break;
		}
		
		{
			thread kill2();
			break;
		}
	}
}

exp2()
{
	trig = getEnt( "exp2", "targetname" );

	trig waittill( "trigger", user );
	user braxi\_rank::giveRankXp( "kill", 5 );
	user iprintlnbold ("You got 5xp!");
	trig delete();
}

kill1()
{
	trig = getEnt ("trap2_kill1", "targetname");
	
	for(;;)
	{
		trig waittill ("trigger", who);
		who suicide();
		wait 0.5;
	}
}	

kill2()
{
	trig = getEnt ("trap2_kill2", "targetname");
	
	for(;;)
	{
		trig waittill ("trigger", who);
		who suicide();
		wait 0.5;
	}
}

trap3()
{
	brush = getEnt("trap3_vanish", "targetname");
	side = getEnt("side_vanish", "targetname");
	trig = getEnt("trap3_trig", "targetname");
	
	trig waittill("trigger", who);
	trig setHintString("Trap Activated^1!");
	
	thread exp3();
	
	brush delete();
	side delete();
	
}
	
exp3()
{
	trig = getEnt( "exp3", "targetname" );

	trig waittill( "trigger", user );
	user braxi\_rank::giveRankXp( "kill", 5 );
	user iprintlnbold ("You got 5xp!");
	trig delete();
}

trap4() //script made by fearz, ask him for permission
{
	level endon( "stop fan" );

	area = getEnt( "fan_blabla","targetname" );	
	fan = getEnt( "largefan","targetname" );
	trig = getEnt ("trap4_trig", "targetname");

	pushPower = 100; 
	time = 10;		
	level thread blabla( fan, time );
	wait 0.05;
	
	trig waittill ("trigger", who);
	trig delete();
	trig setHintString("Trap Activated^1!");

	while ( 1 )
	{
		area waittill ( "trigger", player );
		if ( player istouching ( area ) )
		{
			player.health = ( player.health + pushPower );		
		    player finishPlayerDamage( player, player, pushPower, 0, "MOD_PROJECTILE", "none", player.origin, vectorNormalize(player.origin - fan.origin), "none", 0 );
		}
	}
}

blabla( fan, time )
{
	for( i = 0; i < time; i++ )
	{
		fan rotatepitch( 360, 1 );
		wait 1;
	}
	level notify( "stop fan" );
}

trap5()
{
	left = getEnt ("trap5_left", "targetname");
	right = getEnt ("trap5_right", "targetname");
	trig = getEnt ("trap5", "targetname");
	
	trig waittill("trigger", who);
	trig setHintString("Trap Activated^1!");
	
	thread exp5();
	
	{
		left moveX (-108, 1);
		right moveX (108, 1);
		wait 5;
		left moveX(108, 5);
		right moveX (-108, 5);
		
	}
}

exp5()
{
	trig = getEnt( "exp5", "targetname" );

	trig waittill( "trigger", user );
	user braxi\_rank::giveRankXp( "kill", 5 );
	user iprintlnbold ("You got 5xp!");
	trig delete();
}

trap6()
{

	
	thread exp6();

}


exp6()
{
	trig = getEnt( "exp6", "targetname" );

	trig waittill( "trigger", user );
	user braxi\_rank::giveRankXp( "kill", 5 );
	user iprintlnbold ("You got 5xp!");
	trig delete();
}

trap7()
{
	pillar = getEnt ("pillar1", "targetname");
	pillar_2 = getEnt ("pillar2", "targetname");
	trig = getEnt ("trap7_trig", "targetname");
	
	trig waittill ("trigger");
	trig setHintString("Trap Activated^1!");
	
	thread exp7();
	
	while( 1 )
	{
		pillar rotatePitch(-360,1.5); 
		wait 0.5;
		pillar_2 rotatePitch(360,1.5); 
		wait 0.5;
	}
}

exp7()
{
	trig = getEnt( "exp7", "targetname" );

	trig waittill( "trigger", user );
	user braxi\_rank::giveRankXp( "kill", 5 );
	user iprintlnbold ("You got 5xp!");
	trig delete();
}

trap8()
{


	thread exp8();
}

exp8()
{
	trig = getEnt( "exp8", "targetname" );

	trig waittill( "trigger", user );
	user braxi\_rank::giveRankXp( "kill", 5 );
	user iprintlnbold ("You got 5xp!");
	trig delete();
}
	
////////////////////EXP/////////////////////////

bear()
{
	trig = getEnt( "bear_exp", "targetname" );

	trig waittill( "trigger", user );
	user braxi\_rank::giveRankXp( "kill", 10 );
	user iprintlnbold ("You found a bear^1! ^7Here 10xp^1!");
	trig delete();
}

bear2()
{
	trig = getEnt( "bear_exp2", "targetname" );

	trig waittill( "trigger", user );
	user braxi\_rank::giveRankXp( "kill", 10 );
	user iprintlnbold ("You found a bear^1! ^7Here 10xp^1!");
	trig delete();
}

bear3()
{
	trig = getEnt( "bear_exp3", "targetname" );

	trig waittill( "trigger", user );
	user braxi\_rank::giveRankXp( "kill", 10 );
	user iprintlnbold ("You found a bear^1! ^7Here 10xp^1!");
	trig delete();
}
//////////////////SECRETS///////////////////////////////

secret1()
{
	trig = getEnt ("teddy_bear_trig", "targetname");
	target = getEnt ("teddy_enter", "targetname");

	
	trig waittill ("trigger", player );
	{
		iprintlnbold ("^4" + player.name + "^1, ^7Found the teddy bear room secret^1!");
		wait 1;
		player iprintlnbold ("You have been teleported");
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
	}
}

secret_exp()
{
	trig = getEnt( "secret_exp_1", "targetname" );

	trig waittill( "trigger", user );
	user braxi\_rank::giveRankXp( "kill", 20 );
	user iprintlnbold ("You found a bear^1! ^7Here 20xp^1!");
	trig delete();
}

secret_exp2()
{
	trig = getEnt( "secret_exp_2", "targetname" );
	brush = getEnt ("secret_teddy_2", "targetname");

	trig waittill( "trigger", user );
	user braxi\_rank::giveRankXp( "kill", 20 );
	user iprintlnbold ("You found a bear^1! ^7Here 20xp^1!");
	trig delete();
}

secret_exp3()
{
	trig = getEnt( "secret_exp_3", "targetname" );
	brush = getEnt ("secret_teddy_3", "targetname");

	trig waittill( "trigger", user );
	user braxi\_rank::giveRankXp( "kill", 20 );
	user iprintlnbold ("You found a bear^1! ^7Here 20xp^1!");
	trig delete();
}

secret_1_leave()
{
	trig = getEnt ("teddy_leave", "targetname");
	target = getEnt ("teddy_org", "targetname");
	
	trig waittill ("trigger", player);
	{
		player iprintlnbold ("^2You've been teleported out the teddy room^1!");
		player SetPlayerAngles( target.angles );
		player SetOrigin(target.origin);
	}
}
secret_2()
{
	trig1 = getEnt ("door_trig1", "targetname");
	trig2 = getEnt ("door_trig2", "targetname");
	trig3 = getEnt ("door_trig3", "targetname");
	trig4 = getEnt ("door_trig4", "targetname");
	target = getEnt ("door_org", "targetname");
	
	trig1 waittill ("trigger", player );
	trig2 waittill ("trigger", player );
	trig3 waittill ("trigger", player );
	trig4 waittill ("trigger", player );
		{
			iprintlnbold ("^4" + player.name + "^1, ^7found out the door secret^1!");
			player iprintlnbold ("You^1'^7ve been teleported into the secret jump room^1!");
			player SetPlayerAngles( target.angles );
			player SetOrigin(target.origin);
		}
}


//////////////////////////////////////////OTHERSTUFF////////////////////////////////////////////////
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
	self.logoText.fontScale = 1.4;
	self.logoText.archieved = true;

	for(;;)
	{
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 1;
		self.logoText setText("^8mp_dr_heat ^6BETA ^4by Lossy^1!");
		wait 5;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 0;
		wait 1;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 1;
		self.logoText setText("^8My ^3xfire^0: ^7xlossx ^9Report bugs only^1!");
		wait 5;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 0;
		wait 1;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 1;
		self.logoText setText("^4Visit www.lossycreation.weebly.com^1!");
		wait 5;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 0;
		wait 1;
	}
}

start_door()
{
	brush = getEnt ("start_door", "targetname");
	trig = getEnt ("start_trig", "targetname");
	
	
	trig waittill("trigger", who);
	{
		wait 5;
		brush moveZ (216, 7);
		wait 4;
		iPrintlnbold ("^4Door has opened^1!");
		iPrintlnbold ("^4Special Thanks to ^3Fearz^1! ^3xfire: iqwickscopez");
	}
}

first_door()
{
	doortrig = getEnt( "first_door", "targetname" );
	doortrig.doorclosed = true;

	while (1)
	{
		doortrig waittill("trigger", other);
		if(doortrig.doorclosed)
		{
			doortrig thread move(other);
		}
	}

}

move(other)
{

	door_left = getEnt( "first_left", "targetname" );
	door_right = getEnt( "first_right", "targetname" );

	self notify("doortrig_finish");
	self.doorclosed = false;;
	door_left movey(-64, 2, 0.5, 0.5);
	door_right movey(64, 2, 0.5, 0.5);
	door_left waittill ("movedone");

	if(isDefined(other) && other isTouching(self))
	{
		while(isDefined(other) && other isTouching(self))
		{
			wait 2; 
		}
	}

	door_left movey(64, 2, 0.5, 0.5);
	door_right movey(-64, 2, 0.5, 0.5);
	door_left waittill ("movedone");
	self.doorclosed = true;
}

second_door()
{
	doortrig = getEnt( "second_door", "targetname" );
	doortrig.doorclosed = true;

	while (1)
	{
		doortrig waittill("trigger", other);
		if(doortrig.doorclosed)
		{
			doortrig thread move1(other);
		}
	}

}

move1(other)
{

	door_left = getEnt( "second_left", "targetname" );
	door_right = getEnt( "second_right", "targetname" );

	self notify("doortrig_finish");
	self.doorclosed = false;;
	door_left movey(-64, 2, 0.5, 0.5);
	door_right movey(64, 2, 0.5, 0.5);
	door_left waittill ("movedone");

	if(isDefined(other) && other isTouching(self))
	{
		while(isDefined(other) && other isTouching(self))
		{
			wait 2; 
		}
	}

	door_left movey(64, 2, 0.5, 0.5);
	door_right movey(-64, 2, 0.5, 0.5);
	door_left waittill ("movedone");
	self.doorclosed = true;
}

creater()
{
	creator_trig = getEnt( "creater_trig", "targetname" );
	org = getEnt( "creater_org", "targetname" );

	level.accepted1 = "b17ea990e1ba4d8fe5feb364fb93ac5f"; //Lossy
	
	while (1)
	{
		creator_trig waittill( "trigger", player );
		tempGuid = player getGUID();
		
		if(player isTouching(creator_trig) && player useButtonPressed())
		{
			if((tempGuid == level.accepted1))
			{
				player SetOrigin( org.origin );
				player iprintlnbold("^1Welcome back lord ^5Lossy^1.");
				iprintlnbold( "^5" + player.name + "^7is the creater of this map^1! :O");
			}
            else
            {
                wait 0.5;
                player iprintlnbold ("You^1'^7re not the creater of this map^1! >:|");
            }
        }
        else
        {
            wait 0.5;
        }
	}
}

kill(trigger)
{
	level endon("game_ended");

	trigger = getEnt ("death", "targetname");
	
	for(;;)
	{
		trigger waittill("trigger", user);
		
		if( user isTouching(trigger) && user getGuid() != "b17ea990e1ba4d8fe5feb364fb93ac5f")
			user iprintlnbold ("Get out of my room^1!");
			user suicide();
	}
}

creater_music1()
{
	trig = getEnt( "music1", "targetname");
	
	trig waittill ("trigger", player);
    trig delete();
	
	ambientPlay("tooclose");
	
	{
		noti = SpawnStruct();
		noti.titleText = "^1Song name";
		noti.notifyText = "^1-----^2Unknown - Unknown^1-----";
		noti.duration = 5;
		noti.glowcolor = (1,0,0);
		players = getentarray("player", "classname");
		for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	}	
}

creater_music2()
{
	trig = getEnt( "music2", "targetname");
	
	trig waittill ("trigger", player);
    trig delete();
	
	ambientPlay("tooclose");
	
	{
		noti = SpawnStruct();
		noti.titleText = "^1Song name";
		noti.notifyText = "^1-----^2Alex Clare - Too Close^1-----";
		noti.duration = 5;
		noti.glowcolor = (1,0,0);
		players = getentarray("player", "classname");
		for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	}	
}

creater_music3()
{
	trig = getEnt( "music3", "targetname");
	
	trig waittill ("trigger", player);
    trig delete();
	
	ambientPlay("tooclose");
	
	{
		noti = SpawnStruct();
		noti.titleText = "^1Song name";
		noti.notifyText = "^1-----^2Unknown - Unknown^1-----";
		noti.duration = 5;
		noti.glowcolor = (1,0,0);
		players = getentarray("player", "classname");
		for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	}	
}

turn_terminator()
{
	trig = getent("terminator", "targetname");

    for(;;)
    {
		trig waittill ("trigger", player);
		player detachAll();
		player iPrintLn("Transforming into the terminator^1....");
		player setModel("playermodel_terminator");
		player iPrintLn("Almost their^1....");
		player GiveWeapon("m60e5_mp");
		wait 0.05;
		player SwitchToWeapon("m60e5_mp");
		player iPrintLn("Transforming into the terminator complete^1....");
		iprintlnbold (player.name + " transformed into the terminator^1!");
	}
}

platform()
{
	brush = getEnt ("platform", "targetname");
	
	for(;;)
	{
		brush moveX (1457, 9);
		wait 12;
		brush moveZ(-217, 2);
		wait 4;
		brush moveX (-1457, 9);
		wait 12;
		brush moveZ(217, 2);
		wait 4;
	}
}

platform_2()
{
	brush = getEnt ("platform2", "targetname");
	
	for(;;)
	{
		brush moveZ(-217, 2);
		wait 4;
		brush moveX (-1457, 9);
		wait 12;
		brush moveZ(217, 2);
		wait 4;
		brush moveX (1457, 9);
		wait 12;
	}
}
////////////////////////////////MINIGAMES///////////////////////////////////////////////////////////


minigames()
{
	fence = getEnt ("pick_door", "targetname");
	door = getEnt("jumper_minigames", "targetname");
	trig = getEnt ("acti_minigames", "targetname");
	
	trig waittill("trigger", who);
	
	trig delete();
	wait 1;
	iprintlnbold ("Waiting for activator to pick a minigame^1...");
	wait 1;
	iprintlnbold ("Don^1'^7t cry in chat and be paitent please^1... ");
	
	{
		fence moveZ (208, 1);
		door moveZ (208, 1);
	}
}

old()
{
	door = getEnt ( "old_door", "targetname");
	fence = getEnt ("minigame_doors", "targetname");
	trig = getEnt ( "pick_old", "targetname");
	
	trig waittill("trigger", player);
	
	trig delete();
	iprintlnbold ( player.name + " picked old^1!");
	wait 1;
	player GiveWeapon("deserteagle_mp");
	player GiveMaxAmmo("deserteagle_mp");
	wait 0.01;
	player SwitchToWeapon("deserteagle_mp");
	
	{
		door moveZ (144, 0.5);
		fence moveZ (-260, 0.5);
	}
}

door_crossbow()
{
	door = getEnt ( "crossbow_door", "targetname");
	trig = getEnt ( "pick_crossbow", "targetname");
	
	trig waittill("trigger", player);
	
	trig delete();
	wait 1;
	iprintlnbold ( player.name + " Picked crossbow^1!");
	
	{
		door moveZ (144, 1);
	}
}

sniper()
{
	self endon("death");
	self endon( "disconnect" );	
	self endon( "joined_team" );
	self endon( "joined_spectators" );
	
	sniper_trigger = getEnt( "trigger_sniper", "targetname" );
	sniper_originj = getEnt ("crossbow_jump", "targetname");
	knife_trig = getEnt ("trigger_knife", "targetname");
	weapon_trigger = getEnt ("trigger_weapon", "targetname");
	
	sniper_trigger waittill ("trigger", player);
	thread sniper_acti();
	weapon_trigger delete();
	knife_trig delete();
	
	iprintlnbold (player.name + " entered crossbow!");
	
	player FreezeControls (1);
	player SetOrigin(sniper_originj.origin);	
	player SetPlayerAngles( sniper_originj.angles );
	
	player TakeAllWeapons();
	player GiveWeapon("crossbow_mp");
	wait 0.01;
	player SwitchToWeapon("crossbow_mp");
	
	wait 2;
	player FreezeControls (0);
	iPrintlnbold ("Go!");
	
	player thread onDeath_snipe();
	wait 0.1;
	
	
    for(;;)
    {
		wait .1;		
		while(isAlive(player))
		{
			wait 1;
		}
		
    }
}

onDeath_snipe()
{
	self endon("disconnect");
	
	self waittill("death");
	thread sniper();
}

sniper_acti()
{
	sniperacti = getEnt ("crossbow_acti", "targetname");


	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		if(players[i].pers["team"] == "axis")
		{
			players[i] FreezeControls (1);
			players[i] SetOrigin(sniperacti.origin);
			players[i] SetPlayerAngles( sniperacti.angles );
	
			players[i] TakeAllWeapons();
			players[i] GiveWeapon("crossbow_mp");
			wait 0.01;
			players[i] SwitchToWeapon("crossbow_mp");
			wait 2;
			players[i] FreezeControls (0);
		}
	}
}

door_knife()
{
	door = getEnt ( "knife_door", "targetname");
	trig = getEnt ( "pick_knife", "targetname");
	
	trig waittill("trigger", player);
	
	trig delete();
	wait 1;
	iprintlnbold ( player.name + " Picked knife^1!");
	
	{
		door moveZ (144, 1);
	}
}

knife()
{
	self endon("death");
	self endon( "disconnect" );	
	self endon( "joined_team" );
	self endon( "joined_spectators" );
	
	knife_trigger = getEnt ("trigger_knife", "targetname");
	knife_originj = getEnt ("jumper_knife", "targetname");
	weapon_trigger = getEnt ("trigger_weapon", "targetname");
	sniper_trigger = getEnt( "trigger_sniper", "targetname" );
	
	knife_trigger waittill ("trigger", player);
	thread knife_acti();
	weapon_trigger delete();
	sniper_trigger delete();
	
	iprintlnbold (player.name + " entered knife!");
	
	player FreezeControls (1);
	player SetOrigin(knife_originj.origin);	
	player SetPlayerAngles( knife_originj.angles );
	
	player TakeAllWeapons();
	player GiveWeapon("tomahawk_mp");
	wait 0.05;
	player SwitchToWeapon("tomahawk_mp");
	
	wait 4;
	iPrintlnbold ("3");
	wait 3;
	iPrintlnbold ("2");
	wait 2;
	iPrintlnbold ("1");
	wait 1;
	player FreezeControls (0);
	iPrintlnbold ("Go!");
	
	player thread onDeath_knife();
	wait 0.1;
	
	
    for(;;)
    {
		wait .1;		
		while(isAlive(player))
		{
			wait 1;
		}
		
    }
}

onDeath_knife()
{
	self endon("disconnect");
	
	self waittill("death");
	thread knife();
}

knife_acti()
{
	knifeacti = getEnt ("acti_knife", "targetname");


	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		if(players[i].pers["team"] == "axis")
		{
			players[i] FreezeControls (1);
			players[i] SetOrigin(knifeacti.origin);
			players[i] SetPlayerAngles( knifeacti.angles );
	
			players[i] TakeAllWeapons();
			players[i] GiveWeapon("tomahawk_mp");
			wait 0.05;
			players[i] SwitchToWeapon("tomahawk_mp");
			wait 10;
			players[i] FreezeControls (0);
		}
	}
}

door_weapon()
{
	door = getEnt ( "weapon_door", "targetname");
	trig = getEnt ( "pick_weapon", "targetname");
	
	trig waittill("trigger", player);
	
	trig delete();
	wait 1;
	iprintlnbold ( player.name + " Picked weapon^1!");
	
	{
		door moveZ (144, 1);
	}
}

weapon()
{
	self endon("death");
	self endon( "disconnect" );	
	self endon( "joined_team" );
	self endon( "joined_spectators" );
	
	weapon_trigger = getEnt ("trigger_weapon", "targetname");
	weapon_originj = getEnt ("jumper_weapon", "targetname");
	knife_trig = getEnt ("trigger_knife", "targetname");
	sniper_trigger = getEnt( "trigger_sniper", "targetname" );
	
	weapon_trigger waittill ("trigger", player);
	thread weapon_acti();
	if (IsDefined(knife_trig)) knife_trig delete();
	if (IsDefined(sniper_trigger)) sniper_trigger delete();
	
	iprintlnbold (player.name + " entered weapon!");
	
	player FreezeControls (1);
	player SetOrigin(weapon_originj.origin);	
	player SetPlayerAngles( weapon_originj.angles );
	
	player TakeAllWeapons();
	player GiveWeapon("deserteagle_mp");
	player setWeaponAmmoClip( "deserteagle_mp", 0 );
	player setweaponammostock( "deserteagle_mp", 0 );
	wait 0.05;
	player SwitchToWeapon("deserteagle_mp");
	
	wait 2;
	player FreezeControls (0);
	iPrintlnbold ("Go!");
	
	player thread onDeath_weapon();
	wait 0.1;
	
	
    for(;;)
    {
		wait .1;		
		while(isAlive(player))
		{
			wait 1;
		}
		
    }
}


onDeath_weapon()
{
	self endon("disconnect");
	
	self waittill("death");
	thread weapon();
}

weapon_acti()
{
	weaponacti = getEnt ("activator_weapon", "targetname");


	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		if(players[i].pers["team"] == "axis")
		{
			players[i] FreezeControls (1);
			players[i] SetOrigin(weaponacti.origin);
			players[i] SetPlayerAngles( weaponacti.angles );
	
			players[i] TakeAllWeapons();
			players[i] GiveWeapon("deserteagle_mp");
			players[i] setWeaponAmmoClip( "deserteagle_mp", 0 );
			players[i] setweaponammostock( "deserteagle_mp", 0 );
			wait 0.05;
			players[i] SwitchToWeapon("deserteagle_mp");
			wait 2;
			players[i] FreezeControls (0);
		}
	}
}

door_minigun()
{
	door = getEnt ( "minigun_door", "targetname");
	trig = getEnt ( "pick_minigun", "targetname");
	
	trig waittill("trigger", player);
	
	trig delete();
	wait 1;
	iprintlnbold ( player.name + " Picked weapon^1!");
	
	{
		door moveZ (144, 1);
	}
}

minigun()
{
	self endon("death");
	self endon( "disconnect" );	
	self endon( "joined_team" );
	self endon( "joined_spectators" );
	
	minigun_trigger = getEnt ("trigger_minigun", "targetname");
	minigun_originj = getEnt ("jump_minigun", "targetname");
	knife_trig = getEnt ("trigger_knife", "targetname");
	sniper_trigger = getEnt( "trigger_sniper", "targetname" );
	weapon_trigger = getEnt ("trigger_weapon", "targetname");
	
	minigun_trigger waittill ("trigger", player);
	thread minigun_acti();
	if (IsDefined(knife_trig)) knife_trig delete();
	if (IsDefined(sniper_trigger)) sniper_trigger delete();
	if (IsDefined(weapon_trigger)) weapon_trigger delete();
	
	iprintlnbold (player.name + " entered weapon!");
	
	player FreezeControls (1);
	player SetOrigin(minigun_originj.origin);	
	player SetPlayerAngles( minigun_originj.angles );
	
	player TakeAllWeapons();
	player GiveWeapon("m60e4_mp");
	player GiveMaxAmmo("m60e4_mp");
	wait 0.05;
	player SwitchToWeapon("m60e4_mp");
	
	wait 2;
	player FreezeControls (0);
	iPrintlnbold ("Go!");
	
	player thread changemode();
	player thread onDeath_minigun();
	wait 0.1;
	
	
    for(;;)
    {
		wait .1;		
		while(isAlive(player))
		{
			wait 1;
		}
		
    }
}


onDeath_minigun()
{
	self endon("disconnect");
	
	self waittill("death");
	thread minigun();
}

minigun_acti()
{
	minigunacti = getEnt ("acti_minigun", "targetname");


	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		if(players[i].pers["team"] == "axis")
		{
			players[i] FreezeControls (1);
			players[i] SetOrigin(minigunacti.origin);
			players[i] SetPlayerAngles( minigunacti.angles );
	
			players[i] TakeAllWeapons();
			players[i] GiveWeapon("m60e4_mp");
			players[i] GiveMaxAmmo("m60e4_mp");
			wait 0.05;
			players[i] SwitchToWeapon("m60e4_mp");
			wait 2;
			players[i] FreezeControls (0);
			players[i] thread changemode();
		}
	}
}

maxammo() 
{ 
        while ( 1 ) 
        { 
           wait 30;
	   self iprintlnbold ("^7Reloading for you sir.");
           self takeweapon ( "m60e4_mp" );
	   wait 1;
	   self GiveWeapon( "m60e4_mp" );
        } 
} 

changemode()
{
    self SetMoveSpeedScale( 4 );
    self jumpheight( 4 );
    self.maxhealth = 500;
    self.health = self.maxhealth;
}

jumpheight( strenght )
{
	self endon("disconnect");
	self endon("death");
	level endon("game over");
	
	oldpos = self.origin;
	jumped = false;
	
	if( !isDefined( strenght ) || strenght < 1 )
		strenght = 1;
	
	while(1)
	{
		if((self.origin[2] - oldpos[2] ) > 10  && !self IsOnGround() && !jumped)
		{
			if(jumped)
				continue;
			for(i=0;i<strenght;i++)
			{
				self.health += 100;
				self finishPlayerDamage(self, level.jumpattacker, 100, 0, "MOD_FALLING", "shock_mp", self.origin, AnglesToForward((-90,0,0)), "none", 0);
			}
			jumped = true;
		}
		else if(oldpos[2] > self.origin[2] && self IsOnGround() && jumped)
			jumped = false;
		oldpos = self.origin;
		wait 0.1;
	}
}

/////////////////traps for free run//////////////////
addTriggerToList( name )
{
   if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
   level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}
addtrapstofreerun()
{
	addTriggerToList("trap1_trig");
	addTriggerToList("trap2_trig");
	addTriggerToList("trap3_trig");
	addTriggerToList("trap4_trig");
	addTriggerToList("trap5");
	addTriggerToList("trap6_trig");
	addTriggerToList("trap7_trig");
	addTriggerToList("trap8_trig");
	addTriggerToList("trap9_trig");
}

////////////////////////WEAPONS/////////////////////////////////////
activator_ammo()
{	
	trig = getEnt( "ammo_acti", "targetname" );
	
	for(;;)
	{
	
		trig waittill ("trigger", who);
		
		who takeWeapon( who getCurrentWeapon() );

		who giveWeapon("crossbow_mp");
		who GiveMaxAmmo("crossbow_mp");
		who SwitchToWeapon("crossbow_mp");
		
		wait 5;

	}
}

activator_p90()
{	
	trig = getEnt( "activator_p90", "targetname" );
	
	for(;;)
	{
	
		trig waittill ("trigger", who);
		
		who takeWeapon( who getCurrentWeapon() );

		who giveWeapon("p90_silencer_mp");
		who GiveMaxAmmo("p90_silencer_mp");
		who SwitchToWeapon("p90_silencer_mp");
		
		wait 5;

	}
}

activator_ak47()
{	
	trig = getEnt( "activator_ak47", "targetname" );
	
	for(;;)
	{
	
		trig waittill ("trigger", who);
		
		who takeWeapon( who getCurrentWeapon() );

		who giveWeapon("ak47_mp");
		who GiveMaxAmmo("ak47_mp");
		who SwitchToWeapon("ak47_mp");
		
		wait 5;

	}
}

activator_g36c()
{	
	trig = getEnt( "activator_carbine", "targetname" );
	
	for(;;)
	{
	
		trig waittill ("trigger", who);
		
		who takeWeapon( who getCurrentWeapon() );

		who giveWeapon("g36c_mp");
		who GiveMaxAmmo("g36c_mp");
		who SwitchToWeapon("g36c_mp");

	}
}

activator_ak74u()
{	
	trig = getEnt( "activator_ak47u", "targetname" );
	
	for(;;)
	{
	
		trig waittill ("trigger", who);
		
		who takeWeapon( who getCurrentWeapon() );

		who giveWeapon("ak74u_mp");
		who GiveMaxAmmo("ak74u_mp");
		who SwitchToWeapon("ak74u_mp");
		
		wait 5;

	}
}

activator_m60e4()
{	
	trig = getEnt( "activator_m60e4", "targetname" );
	
	for(;;)
	{
	
		trig waittill ("trigger", who);;
		
		who takeWeapon( who getCurrentWeapon() );

		who giveWeapon("p90_silencer_mp");
		who GiveMaxAmmo("p90_silencer_mp");
		who SwitchToWeapon("p90_silencer_mp");
		
		wait 5;

	}
}

activator_mp5()
{	
	trig = getEnt( "activator_mp5", "targetname" );
	
	for(;;)
	{
	
		trig waittill ("trigger", who);
		
		who takeWeapon( who getCurrentWeapon() );

		who giveWeapon("mp5_silencer_mp");
		who GiveMaxAmmo("mp5_silencer_mp");
		who SwitchToWeapon("mp5_silencer_mp");
		
		wait 5;

	}
}

activaor_mp44()
{	
	trig = getEnt( "activator_mp44", "targetname" );
	
	for(;;)
	{
	
		trig waittill ("trigger", who);
		
		
		who takeWeapon( who getCurrentWeapon() );

		who giveWeapon("mp44_mp");
		who GiveMaxAmmo("mp44_mp");
		who SwitchToWeapon("mp44_mp");
	
		wait 5;
	}
}

//////////////////////////jumper weapons///////////////////////////////////////////////

jumper_ammo()
{	
	trig = getEnt( "ammo_jump", "targetname" );
	
	trig waittill ("trigger", who);
	
	for(;;)
	{
	
		trig waittill ("trigger", who);
		
		
		who takeWeapon( who getCurrentWeapon() ); 

		who giveWeapon("crossbow_mp");
		who GiveMaxAmmo("crossbow_mp");
		who SwitchToWeapon("crossbow_mp");
		
		wait 5;

	}
}

jumper_p90()
{	
	trig = getEnt( "jump_p90", "targetname" );
	
	for(;;)
	{
	
		trig waittill ("trigger", who);
		
		who takeWeapon( who getCurrentWeapon() ); 

		who giveWeapon("p90_silencer_mp");
		who GiveMaxAmmo("p90_silencer_mp");
		who SwitchToWeapon("p90_silencer_mp");
		
		wait 5;

	}
}

jumper_ak47()
{	
	trig = getEnt( "jump_ak47", "targetname" );
	
	for(;;)
	{
	
		trig waittill ("trigger", who);
		
		who takeWeapon( who getCurrentWeapon() ); 

		who giveWeapon("ak47_mp");
		who GiveMaxAmmo("ak47_mp");
		who SwitchToWeapon("ak47_mp");
		
		wait 5;

	}
}

jumper_g36c()
{	
	trig = getEnt( "jump_carbine", "targetname" );
	
	for(;;)
	{
	
		trig waittill ("trigger", who);
		
		who takeWeapon( who getCurrentWeapon() );

		who giveWeapon("g36c_mp");
		who GiveMaxAmmo("g36c_mp");
		who SwitchToWeapon("g36c_mp");
		
		wait 5;

	}
}

jumper_ak74u()
{	
	trig = getEnt( "jump_ak47u", "targetname" );
	
	for(;;)
	{
	
		trig waittill ("trigger", who);
		
		who takeWeapon( who getCurrentWeapon() );

		who giveWeapon("ak74u_mp");
		who GiveMaxAmmo("ak74u_mp");
		who SwitchToWeapon("ak74u_mp");

	}
}

jumper_m60e4()
{	
	trig = getEnt( "jump_m60e4", "targetname" );
	
	for(;;)
	{
	
		trig waittill ("trigger", who);
		
		who takeWeapon( who getCurrentWeapon() );

		who giveWeapon("m60e4_grip_mp");
		who GiveMaxAmmo("m60e4_grip_mp");
		who SwitchToWeapon("m60e4_grip_mp");
		
		wait 5;

	}
}

jumper_mp5()
{	
	trig = getEnt( "jump_mp5", "targetname" );
	
	for(;;)
	{
	
		trig waittill ("trigger", who);
		
		who takeWeapon( who getCurrentWeapon() );

		who giveWeapon("mp5_silencer_mp");
		who GiveMaxAmmo("mp5_silencer_mp");
		who SwitchToWeapon("mp5_silencer_mp");
		
		wait 5;

	}
}

jumper_mp44()
{	
	trig = getEnt( "jump_mp44", "targetname" );
	
	for(;;)
	{
	
		trig waittill ("trigger", who);
		
		
		who takeWeapon( who getCurrentWeapon() );

		who giveWeapon("mp44_mp");
		who GiveMaxAmmo("mp44_mp");
		who SwitchToWeapon("mp44_mp");
	
		wait 5;
	}
}