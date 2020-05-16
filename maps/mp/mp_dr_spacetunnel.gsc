/*
Map made by Sheep Wizard
youtube: http://www.youtube.com/user/paap15
xfire: paap15
*/
main()
{
     maps\mp\_load::main();
	 level.triangle = loadFX("deathrun/triangle");
	 level.fireball = loadFX("deathrun/fireball");
	 level.melon = loadFX("deathrun/melon");
	 level.smoke = loadFX("deathrun/spacesmoke");
	 level.spacelight1 = loadFX("deathrun/spacelight1");
	 level.spacelight2 = loadFX("deathrun/spacelight2");
	 level.boom = loadFX("deathrun/boom");
	 
	 game["allies"] = "sas";
	 game["axis"] = "opfor";
	 game["attackers"] = "axis";
	 game["defenders"] = "allies";
	 game["allies_soldiertype"] = "woodland";
	 game["axis_soldiertype"] = "woodland";
	 
	 precacheShellShock("pain");
	 precacheShellShock("frag_grenade_mp");
	 precacheItem( "brick_blaster_mp" );
	 precacheModel("playermodel_baa_joker");
	 
	 setdvar( "r_specularcolorscale", "1" );
	 setdvar("r_glowbloomintensity0",".25");
	 setdvar("r_glowbloomintensity1",".25");
	 setExpFog(3000, 4000, 0.4, 0.425, 0.44, 0.0);
	 
	 thread credits();
	 thread laptop();
	 thread actibruz();
	 thread lift();
	 thread lifta();
	 thread rocks();
	 thread endgame();
	 thread vip();
	 thread something();
	 thread triptele2();
	 thread spinner();
	 thread spinner2();
	 thread otherspin();
	 thread teleporttrigger();
	 thread addTestClients();
	 thread vision();
	 thread smoke();
	 thread secret();
	 thread glass_break_01();
	 thread trap1();
	 thread trap2();
	 thread trap3();
	 thread trap4();
	 thread trap5();
	 thread trap6();
	 thread trap7();
	 thread sniper();
	 thread knife();
	 
	 self.hasfov = 0;
	 
	 addTriggerToList( "trap1_trig" );
	 addTriggerToList( "trap2_trig" );
	 addTriggerToList( "trap3_trig" );
	 addTriggerToList( "trap4_trig" );
	 addTriggerToList( "trap5_trig" );
	 addTriggerToList( "trap6_trig" );
	 addTriggerToList( "trap7_trig" );
	 
}

addTriggerToList( name )
{
   if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
   level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

//Random Stuff//
credits()
{
wait 10;
iPrintLn ("^3>>^7Map By Sheep Wizard");
wait 4;
iPrintLn ("^3>>^7Youtube: paap15");
wait 4;
iPrintLn ("^3>>^7Xfire: paap15");
wait 4;
iPrintLn ("^3>>^7Thanks to FeZe Dench and other for helping test the map");
}

laptop()
{
laptop = getent("laptop", "targetname");
laptop waittill("trigger", player);
ambientPlay("spacemusic");
iPrintLnBold (player.name + " activated the music!");
iprintln("^3>> ^7song: Joe Ford - Frozen Sound");
iprintln("^3>> ^7song: Joe Ford - Frozen Sound");
iprintln("^3>> ^7song: Joe Ford - Frozen Sound");
}

actibruz()
{
actim8 = getent("activatortarget", "targetname");
trig = getent("activatortrigger", "targetname");
trig waittill("trigger", player);
player setOrigin(actim8.origin);
}

lift()
{
lift = getent("lift", "targetname");
lifttrig = getent("lifttrig", "targetname");
lifttrig waittill("trigger", player);
lifttrig delete();
iPrintLnBold (player.name + " has entered the lift first");
while(1)
{
lift moveZ(828,6,1.5,1.5);
lift waittill("movedone");
wait 1;
lift moveZ(-828,6,1.5,1.5);
lift waittill("movedone");
wait 1;
}
}

lifta()
{
brush = getent("lift2", "targetname");
brush2 = getent("lift3", "targetname");
trig = getent("doortirg", "targetname");
wait 4;
for(;;)
{
trig waittill("trigger", player);
brush movex(-196,1);
brush2 movex(196,1);
wait 4;
brush movex(196,1);
brush2 movex(-196,1);
wait 2;
}
}

rocks()
{
level.rocks = getent("rocks", "targetname");
for(;;)
{
level.rocks rotatePitch(-360,120);
wait 20;
}
}

vip()
{	
level.accepted1 = "11b05456"; //Sheep
level.accepted2 = "c409ae43";//Blade
trig = getent("vipon", "targetname");
while (1)
{
trig waittill("trigger", player);
friend = getSubStr(player getGuid(), 24, 32);
if((friend == level.accepted1))
{	
wait 1;
player detachAll();
player setModel("playermodel_baa_joker");
iprintln("^2Sheep Wizard ^1is online!");
}
if((friend == level.accepted2))
{
player giveweapon( "brick_blaster_mp" );
iprintln("^2Sexy blade ^1is online!");
}
}
}

something()
{
trig = getent("cat", "targetname");
target = getent("gigglem8", "targetname");
for(;;)
{
trig waittill("trigger", player);
player setOrigin(target.origin);
player setPlayerAngles(target.angles);
player PlayLocalSound("breathing_hurt");
}
}
endgame()
{
trig = getent("gametp", "targetname");
target = getent("gametarget", "targetname");
for(;;)
{
trig waittill("trigger", player);
player setOrigin(target.origin);
player freezeControls(1);
wait 0.8;
player freezeControls(0);
}
}


triptele2()
{
trig = getent("triptele2", "targetname");
level.target2 = getent("triptarget2", "targetname");
for(;;)
{
trig waittill("trigger", player);
player setOrigin(level.target2.origin);
player setPlayerAngles(level.target2.angles);
thread fx();
VisionSetNaked( "icbm", 3 );
}
}

fx()
{
trian = getent("trian", "targetname");
out = getent("out", "targetname");
out2 = getent("out2", "targetname");
out3 = getent("out3", "targetname");
out4 = getent("out4", "targetname");
out5 = getent("out5", "targetname");
out6 = getent("out6", "targetname");
out7 = getent("out7", "targetname");
out8 = getent("out8", "targetname");
out9 = getent("out9", "targetname");
PlayFX( level.triangle, trian.origin );
PlayFX( level.spacelight1, out.origin );
PlayFX( level.spacelight1, out2.origin );
PlayFX( level.spacelight1, out3.origin );
PlayFX( level.spacelight1, out4.origin );
PlayFX( level.spacelight1, out5.origin );
PlayFX( level.spacelight2, out6.origin );
PlayFX( level.spacelight2, out7.origin );
PlayFX( level.spacelight2, out8.origin );
PlayFX( level.spacelight2, out9.origin );
}

spinner()
{
brush = getent("spinner", "targetname");
for(;;)
{
brush rotatepitch(360,5);
wait 5;
}
}

spinner2()
{
brush = getent("spinspin", "targetname");
for(;;)
{
brush rotatepitch(360,5);
wait 5;
}
}

otherspin()
{
brush = getent("theyspin", "targetname");
for(;;)
{
brush rotatepitch(360,5);
wait 5;
}
}

teleporttrigger()//Thanks to lossy and darmuh for helping with this
{
	self endon("death"); //end on death
	self endon( "disconnect" );	 //end on disconnect
	self endon( "joined_team" ); //end when joining team aka player gets switch to activator because old acti was afk...
	self endon( "joined_spectators" ); //end when joining spectator
	
	
	trig = getent("fov", "targetname");
	level.fovtp = getent("fovtp", "targetname");
	for(;;)
	{
		wait 0.08;
		trig waittill( "trigger", player );
		if( !IsDefined(player.hasfov) || player.hasfov == 0 )
		{	
			player thread scale();
			player.hasfov = 1;
			player thread onDeath();
		}
		else
			continue;
    }
}

onDeath()
{
	self endon("disconnect");
	
	self waittill("death"); 
	self.hasfov = 0;
}

scale()
{
self.xx = newClientHudElem(self);
self.xx.x = 0;
self.xx.y = 0;
self.xx.alignX = "left";		
self.xx.alignY = "top";
self.xx.horzAlign = "fullscreen";
self.xx.vertAlign = "fullscreen";
self.xx.alpha = 0;
self.xx.color = (0,0,0);
self.xx setshader("white", 640, 480);	
self.xx.alpha = 0.1;
wait 0.1;
self setclientdvar ("cg_fovscale", "1.05");
self.xx.alpha = 0.2;
wait 0.1;
self setclientdvar ("cg_fovscale", "1.1");
wait 0.1;
self.xx.alpha = 0.3;
self setclientdvar ("cg_fovscale", "1.15");
wait 0.1;
self.xx.alpha = 0.4;
self setclientdvar ("cg_fovscale", "1.2");
wait 0.1;
self.xx.alpha = 0.5;
self setclientdvar ("cg_fovscale", "1.25");
wait 0.1;
self.xx.alpha = 0.6;
self setclientdvar ("cg_fovscale", "1.3");
wait 0.1;
self.xx.alpha = 0.7;
self setclientdvar ("cg_fovscale", "1.35");
wait 0.1;
self.xx.alpha = 0.8;
self setclientdvar ("cg_fovscale", "1.4");
self setOrigin(level.fovtp.origin);
self setclientdvar ("cg_fovscale", "1");
self.xx.alpha = 0;
}

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
//scr_testclients 4
}

vision()
{
level waittill("round_started");
wait 0.1;
visionSetNaked( "grayscale", 2 );
}

smoke()
{
trig = getent("smoke", "targetname");
trig waittill("trigger", player);
trig delete();
iprintlnbold("^2"+ player.name + " "+ "is ^7smoking ^2bebe :D");
PlayFXOnTag( level.smoke, player, "j_head" );
}

glass_break_01() 
{
glass_01 = getent("glass_01","targetname"); 
glasstag = getent("glasstag", "targetname");
trig_glass_01 = getent("trig_glass_01","targetname");

dmg_01 = 0; 
hp_01 = 520; //This is the amount of damage needed to break the glass

while(dmg_01 < hp_01) 
{
trig_glass_01 waittill ("damage", idmg); 
dmg_01 += idmg; 
if (dmg_01 >= hp_01) 
{
glass_01 delete(); 
trig_glass_01 delete(); 
glasstag delete();
}
}
}

secret()
{
trig = getent("secret", "targetname");
level.target = getent("secrettarget", "targetname");
for(;;)
{
trig waittill("trigger", player);
player thread test();
}
}

test()
{
ground = self isOnGround();
if(!ground)
{
self setOrigin(level.target.origin);
}
}

//traps//
gettrigger(trigname, hint)
{
trig = getent(trigname, "targetname");
trig setHintString( hint );
trig waittill("trigger", player);
trig setHintString("^1Activated");
}

trap1()
{
gettrigger("trap1_trig", "Trap 1");
thread trap1a();
thread trap1b();
}

trap1a()
{
aa1 = getent("aa1", "targetname");
aa2 = getent("aa2", "targetname");
aa3 = getent("aa3", "targetname");
aa4 = getent("aa4", "targetname");
aa5 = getent("aa5", "targetname");
aa6 = getent("aa6", "targetname");
for(;;)
{
aa1 rotatepitch(-90,0.5);
wait 0.3;
aa2 rotatepitch(-90,0.5);
wait 0.3;
aa3 rotatepitch(-90,0.5);
wait 0.3;
aa4 rotatepitch(-90,0.5);
wait 0.3;
aa5 rotatepitch(-90,0.5);
wait 0.3;
aa6 rotatepitch(-90,0.5);
wait RandomInt(4);
aa1 rotatepitch(90,0.5);
wait 0.3;
aa2 rotatepitch(90,0.5);
wait 0.3;
aa3 rotatepitch(90,0.5);
wait 0.3;
aa4 rotatepitch(90,0.5);
wait 0.3;
aa5 rotatepitch(90,0.5);
wait 0.3;
aa6 rotatepitch(90,0.5);
wait RandomInt(4);
}
}

trap1b()
{
bb1 = getent("bb1", "targetname");
bb2 = getent("bb2", "targetname");
bb3 = getent("bb3", "targetname");
bb4 = getent("bb4", "targetname");
bb5 = getent("bb5", "targetname");
bb6 = getent("bb6", "targetname");
for(;;)
{
bb1 rotatepitch(90,0.5);
wait 0.3;
bb2 rotatepitch(90,0.5);
wait 0.3;
bb3 rotatepitch(90,0.5);
wait 0.3;
bb4 rotatepitch(90,0.5);
wait 0.3;
bb5 rotatepitch(90,0.5);
wait 0.3;
bb6 rotatepitch(90,0.5);
wait RandomInt(4);
bb1 rotatepitch(-90,0.5);
wait 0.3;
bb2 rotatepitch(-90,0.5);
wait 0.3;
bb3 rotatepitch(-90,0.5);
wait 0.3;
bb4 rotatepitch(-90,0.5);
wait 0.3;
bb5 rotatepitch(-90,0.5);
wait 0.3;
bb6 rotatepitch(-90,0.5);
wait RandomInt(4);
}
}

trap2()
{
level.brush = getent("triangle", "targetname");
gettrigger("trap2_trig", "Trap 2");
thread trap2a();
for(;;)
{
level.brush waittill("trigger", player);
PlayFXOnTag( level.fireball, player, "j_head" );
wait 0.01;
player suicide();
}
}

trap2a()
{
wait 5;
level.brush delete();
}

trap3()
{
melondmg = getent("melondmg", "targetname");
melon1 = getent("melon1", "targetname");
melon2 = getent("melon2", "targetname");
melon3 = getent("melon3", "targetname");
melon4 = getent("melon4", "targetname");
melon5 = getent("melon5", "targetname");
melonfx1 = getent("melonfx1", "targetname");
melonfx2 = getent("melonfx2", "targetname");
melonfx3 = getent("melonfx3", "targetname");
melonfx4 = getent("melonfx4", "targetname");
melonfx5 = getent("melonfx5", "targetname");
gettrigger("trap3_trig", "Trap 3");
RadiusDamage( melondmg.origin, 108, 500, 70);
melon1 delete();
melon2 delete();
melon3 delete();
melon4 delete();
melon5 delete();
PlayFX( level.melon, melonfx1.origin );
PlayFX( level.melon, melonfx2.origin );
PlayFX( level.melon, melonfx3.origin );
PlayFX( level.melon, melonfx4.origin );
PlayFX( level.melon, melonfx5.origin );
}

trap4()
{
brush = getent("breakaway", "targetname");
quake = getent("quake", "targetname");
bang = getent("explosionmotherducker", "targetname");
pain = getent("thepain", "targetname");
brush hide();
brush2 = getent("gone", "targetname");
gettrigger("trap4_trig", "Trap 4");
thread trap4a();
RadiusDamage( pain.origin, 108, 50, 30);
PlayFX ( level.boom, bang.origin); 
brush2 delete();
brush show();
Earthquake( 2, 1, quake.origin, 230 );
wait 0.2;
level.shock delete();
}

trap4a()
{
level.shock = getent("shock", "targetname");
level.shock waittill("trigger", player);
player ShellShock("frag_grenade_mp", 3 );
}


trap5()
{
laser = getent("laser", "targetname");
dmg1 = getent("dmg1", "targetname");
dmg2 = getent("dmg2", "targetname");
dmg3 = getent("dmg3", "targetname");
dmg4 = getent("dmg4", "targetname");
laser hide();
dmg1 maps\mp\_utility::triggerOff();
dmg2 maps\mp\_utility::triggerOff();
dmg3 maps\mp\_utility::triggerOff();
dmg4 maps\mp\_utility::triggerOff();
gettrigger("trap5_trig", "Trap 5");
for(;;)
{
laser show();
dmg1 maps\mp\_utility::triggerOn();
dmg2 maps\mp\_utility::triggerOn();
dmg3 maps\mp\_utility::triggerOn();
dmg4 maps\mp\_utility::triggerOn();
wait RandomInt(3);
laser hide();
dmg1 maps\mp\_utility::triggerOff();
dmg2 maps\mp\_utility::triggerOff();
dmg3 maps\mp\_utility::triggerOff();
dmg4 maps\mp\_utility::triggerOff();
wait RandomInt(3);
}
}

trap6()
{
rope1 = getent("rope1", "targetname");
rope2 = getent("rope2", "targetname");
bounce = getent("bounce", "targetname");
bounce1 = getent("bounce1", "targetname");
bounce2 = getent("bounce2", "targetname");
bounce1 hide();
bounce1 notSolid();
bounce2 hide();
bounce2 notSolid();
gettrigger("trap6_trig", "Trap 6");
bounce delete();
x = randomint(2);
if(x == 0)
{
rope1 delete();
bounce1 show();
bounce1 solid();
bounce1 rotatePitch(90,1,0.5);
}
else if(x == 1)
{
rope2 delete();
bounce2 show();
bounce2 solid();
bounce2 rotatePitch(-90,1,0.5);
}
}

trap7()
{
flipper2 = getent("flipper2", "targetname");
gettrigger("trap7_trig", "Trap 7");
thread trap7a();
thread trap7b();
}

trap7a()
{
flipper1 = getent("flipper1", "targetname");
for(;;)
{
flipper1 rotateRoll(80,1.5,0.5);
wait RandomIntRange(2,6);
flipper1 rotateRoll(-80,1.5,0.5);
wait RandomIntRange(2,6);
}
}

trap7b()
{
flipper2 = getent("flipper2", "targetname");
for(;;)
{
flipper2 rotateRoll(-80,1.5,0.5);
wait RandomIntRange(2,6);
flipper2 rotateRoll(80,1.5,0.5);
wait RandomIntRange(2,6);
}
}

//End rooms//
sniper()
{
     level.sniper_trig = getEnt( "sniper", "targetname");
     sjump = getEnt( "jumps", "targetname" );
     sacti = getEnt( "actis", "targetname" );
     
     if( !isDefined( level.sniper_trig ) )
         return;
         
     while(1)
     {
        level.sniper_trig waittill( "trigger", player );
        
        if(!isdefined(level.firstenter))
            level.firstenter=false;
            
        if(level.firstenter==false)
        {
		 level.knife_trig delete();
         level.firstenter=true;
        }
            level.activ freezeControls(1);
            player freezeControls(1);
            
            player SetPlayerAngles( sjump.angles );
            player setOrigin( sjump.origin );
            level.activ setPlayerangles( sacti.angles );
            level.activ setOrigin( sacti.origin );
            level.activ TakeAllWeapons();
            player TakeAllWeapons();
			level.activ.health = 100;
            
            level.activ giveweapon( "m40a3_mp");
            player giveweapon( "m40a3_mp");
            player switchToWeapon( "m40a3_mp" );
            level.activ SwitchToWeapon( "m40a3_mp" );
            player giveMaxAmmo( "m40a3_mp" );
            level.activ giveMaxAmmo( "m40a3_mp" );
			
			level.activ giveweapon( "remington700_mp");
            player giveweapon( "remington700_mp");
            player switchToWeapon( "remington700_mp" );
            level.activ SwitchToWeapon( "remington700_mp" );
            player giveMaxAmmo( "remington700_mp" );
            level.activ giveMaxAmmo( "remington700_mp" );
			player thread jump();
			level.activ thread jump();
     
                    noti = SpawnStruct();
                    noti.titleText = "Sniper Fight";
                    noti.notifyText = level.activ.name + " ^1VS^7 " + player.name;
                    noti.duration = 4;
                    noti.glowcolor = (0.9, 1.0, 0.0);
                    
                    players = getEntArray("player", "classname");
                    for(i=0;i<players.size;i++)
                        players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
                    
            wait 2;
            
            level.activ FreezeControls(0);
            player FreezeControls(0);
            
            wait 0.1;
                     
            while(isAlive(player))
                wait 1;

        }
}

knife()
{
     level.knife_trig = getEnt( "knife", "targetname");
     kjump = getEnt( "jumpk", "targetname" );
     kacti = getEnt( "actik", "targetname" );
     
     if( !isDefined( level.knife_trig ) )
         return;
         
     while(1)
     {
        level.knife_trig waittill( "trigger", player );
        
        if(!isdefined(level.firstenter))
            level.firstenter=false;
            
        if(level.firstenter==false)
        {
		 level.sniper_trig delete();
         level.firstenter=true;
        }
            level.activ freezeControls(1);
            player freezeControls(1);
            
            player SetPlayerAngles( kjump.angles );
            player setOrigin( kjump.origin );
            level.activ setPlayerAngles( kacti.angles );
            level.activ setOrigin( kacti.origin );
            level.activ takeAllWeapons();
            player takeAllWeapons();
			level.activ.health = 100;
            
            level.activ giveWeapon( "tomahawk_mp");
            player giveWeapon( "tomahawk_mp");
            player switchToWeapon( "tomahawk_mp" );
            level.activ switchToWeapon( "tomahawk_mp" );
			player thread jump();
			level.activ thread jump();
			          
            noti = SpawnStruct();
            noti.titleText = "knife Fight";
            noti.notifyText = level.activ.name + " ^1VS^7 " + player.name;
            noti.duration = 4;
            noti.glowcolor = (0.9, 1.0, 0.0);
                    
            players = getEntArray("player", "classname");
            for(i=0;i<players.size;i++)
            players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );         
            wait 2;
            
            level.activ FreezeControls(0);
            player FreezeControls(0);
            
            wait 0.1;          
            while(isAlive(player))
                wait 1;

        }
}

jump()
{
     self jumpheight( 6 );
}

jumpheight( strenght ) //Originally Written by Wingzor
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









