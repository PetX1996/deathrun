/*

					TTTTTTTTTTTTTTTTTTTTTTTRRRRRRRRRRRRRRRRR   IIIIIIIIIIKKKKKKKKK    KKKKKKKZZZZZZZ       ZZZZZZZ
					T:::::::::::::::::::::TR::::::::::::::::R  I::::::::IK:::::::K    K:::::K Z:::::Z     Z:::::Z
					T:::::::::::::::::::::TR::::::RRRRRR:::::R I::::::::IK:::::::K    K:::::K  Z:::::Z   Z:::::Z
					T:::::TT:::::::TT:::::TRR:::::R     R:::::RII::::::IIK:::::::K   K::::::K   Z:::::Z Z:::::Z
					TTTTTT  T:::::T  TTTTTT  R::::R     R:::::R  I::::I  KK::::::K  K:::::KKK    Z:::::Z:::::Z
					        T:::::T          R::::R     R:::::R  I::::I    K:::::K K:::::K        Z:::::::::Z
					        T:::::T          R::::RRRRRR:::::R   I::::I    K::::::K:::::K          Z:::::::Z
					        T:::::T          R:::::::::::::RR    I::::I    K:::::::::::K            Z:::::Z
					        T:::::T          R::::RRRRRR:::::R   I::::I    K:::::::::::K           Z:::::::Z
					        T:::::T          R::::R     R:::::R  I::::I    K::::::K:::::K         Z:::::::::Z
					        T:::::T          R::::R     R:::::R  I::::I    K:::::K K:::::K       Z:::::Z:::::Z
					        T:::::T          R::::R     R:::::R  I::::I  KK::::::K  K:::::KKK   Z:::::Z Z:::::Z
					      TT:::::::TT      RR:::::R     R:::::RII::::::IIK:::::::K   K::::::K  Z:::::Z   Z:::::Z
					      T:::::::::T      R::::::R     R:::::RI::::::::IK:::::::K    K:::::K Z:::::Z     Z:::::Z
					      T:::::::::T      R::::::R     R:::::RI::::::::IK:::::::K    K:::::KZ:::::Z       Z:::::Z
					      TTTTTTTTTTT      RRRRRRRR     RRRRRRRIIIIIIIIIIKKKKKKKKK    KKKKKKKZZZZZZ         ZZZZZZZ



*/

main()
{

	addTriggerToList( "trigger_trap_1" );
	addTriggerToList( "trigger_trap_2" );
	addTriggerToList( "trigger_trap_3" );
	addTriggerToList( "trigger_trap_4" );
	addTriggerToList( "trigger_trap_5" );
	addTriggerToList( "trigger_trap_6" );
	addTriggerToList( "trigger_trap_8" );
	addTriggerToList( "trigger_trap_9" );
	addTriggerToList( "trigger_trap_12" );

	maps\mp\_teleport::main();
	maps\mp\_teleport_2::main();
	maps\mp\_load::main();

	game["allies"] = "sas";
	game["axis"] = "russian";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";

	level.msg_block = false;

	thread bounceroom();
	thread old();
	thread jump_reset();
	thread kniferoom();
	thread sniperoom();
	thread startdoor();
	thread trap_1();
	thread trap_2();
	thread trap_3();
	thread trap_4();
	thread trap_5();
	thread trap_6();
	thread trap_7();
	thread trap_8();
	thread trap_9();
	thread trap_10();
	thread trap_11();
	thread trap_12();
	thread run_msg_1();
        thread playerjoin();
	thread teleporter();

	ambientPlay("trikxdr_ambient");

	setdvar( "r_specularcolorscale", "1" );

	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	setdvar("compassmaxrange","2200");


}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

bounceroom()
{
    level.bounce_trig = getEnt( "bounce_1", "targetname");
    jump = getEnt( "jumper_bounce_1", "targetname" );
    acti = getEnt( "activator_bounce_1", "targetname" );
    while(1)
    {
        level.bounce_trig waittill( "trigger", player );
        if(level.firstenter==true)
		{
                level.snipe_trig delete();
                level.oldtrigger delete();
		level.knife_trig delete();
		level.firstenter=false;
		}
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "knife_mp" );       
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "knife_mp" );        
        wait 0.05;
        player switchToWeapon( "knife_mp" );
        level.activ SwitchToWeapon( "knife_mp" );
        iPrintlnBold( " ^3" + player.name + " picked ^2BOUNCE Room^1!" );
		wait 0.1;
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
    }
}


old()
{
level.oldtrigger = getent("trigger_olddoor","targetname");
object  = getent("olddoor","targetname");
object_up  = getent("olddoor_2","targetname");
level.oldtrigger waittill ("trigger" , player );
level.oldtrigger delete();
level.knife_trig delete();
level.bounce_trig delete();
level.snipe_trig delete();
{
iprintlnbold (" ^3" + player.name + " ^1Opened ^3Finall Door!");
object moveZ(144, 1);
object waittill("movedone");
wait(1);
object_up moveX(128, 1);
object_up waittill("movedone");
wait(1);
}
}

jump_reset()
{
	trigger = getEnt ("jump_reset", "targetname");
	jumper = getEnt ("jumper_bounce_1", "targetname");
	activator = getEnt ("activator_bounce_1", "targetname");
	
	for(;;)
	{
		trigger waittill ("trigger", player);
		if(player.pers["team"] == "allies")
		{
			wait 0.1;
			player FreezeControls (true);
			player SetOrigin(jumper.origin);
			player SetPlayerAngles( jumper.angles );
			wait 0.1;
			player FreezeControls (false);
		}
		else if(player.pers["team"] == "axis")	
		{
			wait 0.1;
			player FreezeControls (true);
			player SetOrigin(activator.origin);
			player SetPlayerAngles( activator.angles );
			wait 0.1;
			player FreezeControls (false);		
		}
	}
}

kniferoom()
{
    level.knife_trig = getEnt( "knife", "targetname");
    jump = getEnt( "jumper_kniferoom", "targetname" );
    acti = getEnt( "activator_kniferoom", "targetname" );
    
    while(1)
    {
        level.knife_trig waittill( "trigger", player );
        if( !isDefined( level.knife_trig ) )
            return;
        if(level.firstenter==true)
		{
                level.snipe_trig delete();
                level.oldtrigger delete();
 		level.bounce_trig delete();
		level.firstenter=false;
		}
		
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "knife_mp" );       
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "knife_mp" );        
        wait 0.05;
        player switchToWeapon( "knife_mp" );
        level.activ SwitchToWeapon( "knife_mp" );
        iPrintlnBold( " ^3" + player.name + " picked ^1KNIFE^7!" );
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
    }
}

sniperoom()
{
    level.snipe_trig = getEnt( "sniperoom", "targetname");
    jump = getEnt( "jumpsnipe", "targetname" );
    acti = getEnt( "actisnipe", "targetname" );

    
    while(1)
    {
        level.snipe_trig waittill( "trigger", player );
        if( !isDefined( level.snipe_trig ) )
            return;
			
		if(level.firstenter==true)
		{
                level.oldtrigger delete();
		level.bounce_trig delete();
		level.knife_trig delete();
		level.firstenter=false;
		}
        iPrintlnBold( " ^3" + player.name + " picked ^9SNIPER^1!" );
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        player TakeAllWeapons();
	level.activ TakeAllWeapons();
	wait 0.1;
        player GiveWeapon( "remington700_mp" );
        level.activ GiveWeapon( "remington700_mp" );
	wait 0.1;
	player GiveWeapon( "M40A3_mp" );
	level.activ GiveWeapon( "M40A3_mp" );
	wait 0.1;;
	player switchToWeapon( "remington700_mp" );
        level.activ SwitchToWeapon( "remington700_mp" );
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
    }
}

startdoor()
{
door=getent("door","targetname");
wait(12);
iPrintLnBold("^3The door is opening^9!"); //Change the message if you want
iPrintLnBold("^3Map Creator: ^0eBc|TrikX^3!"); //Change the message if you want
door movez(-312,10,1,9);
door waittill ("movedone");
//door movez(0,0,0,0); // PetX: Are you fucking kidding me?
}

trap_1()
{     
          trig = getEnt("trigger_trap_1","targetname");
          brush = getEnt("rotate","targetname");

          trig waittill("trigger", player );
	  trig delete();
	  while(1)
          {
                 brush rotateYaw(360,3);
                 wait 1;
          }
}

trap_2()
{
trigger = getent("trigger_trap_2","targetname");
object = getent("stupovi","targetname");
trigger waittill ("trigger" , player );
trigger delete();
while(1)
{
object moveZ(-320, 0.5);
object waittill("movedone");
wait(2);
object moveZ(320, 0.5);
object waittill("movedone");
wait(5);
}
}

trap_3()
{     
          trig = getEnt("trigger_trap_3","targetname");
          brush = getEnt("rotate_2","targetname");
          brush2 = getEnt("rotate_3","targetname");

          trig waittill("trigger");
          trig delete();

          while(true)
          {
                 brush rotatePitch(360,3);
                 brush2 rotatePitch(360,3);
                 wait 7;
          }
}

trap_4()
{
trigger = getent("trigger_trap_4","targetname");
object = getent("trap_4","targetname");
trigger waittill ("trigger" , player );
trigger delete();
while(1)
{
object moveY(-128, 1);
object waittill("movedone");
wait(2);
object moveY(128, 1);
object waittill("movedone");
wait(4);
}
}

trap_5()
{     
          trigger = getEnt("trigger_trap_5","targetname");
          brush = getEnt("rotate_5","targetname");

          trigger waittill("trigger");
          trigger delete();

          while(true)
          {
                 brush rotateYaw(90, 0.5);
                 wait 2;
          }
}

trap_6()
{
trigger = getent("trigger_trap_6","targetname");
object = getent("trap_6","targetname");
trigger waittill ("trigger" , player );
trigger delete();
while(1)
{
object moveY(-176, 0.5);
object waittill("movedone");
wait(2);
object moveY(176, 1);
object waittill("movedone");
wait(2);
}
}

trap_7()
{
trigger = getent("trigger_trap_7","targetname");
object = getent("trap_7","targetname");
trigger waittill ("trigger" , player );
while(1)
{
object moveX(256, 2);
object waittill("movedone");
wait(3);
object moveX(-256, 2);
object waittill("movedone");
wait(3);
}
}

trap_8()
{
trigger = getent("trigger_trap_8","targetname");
object = getent("trap_8","targetname");
killtrigger = getent ("killtrig" , "targetname");
trigger waittill ("trigger" , player );
trigger delete();

killtrigger enablelinkto ();
killtrigger linkto (object);

while(1)
{
object movez(304, 0.5);
object waittill("movedone");
wait(2);
object movez(-304, 0.5);
object waittill("movedone");
wait(2);
}
}

trap_9()
{     
  trigger = getEnt("trigger_trap_9","targetname");
  brush9 = getEnt("rotate_9","targetname");
  killtrigger9 = getent ("killtrig_3" , "targetname");

  trigger waittill("trigger");
  trigger delete();

  killtrigger9 enablelinkto ();
  killtrigger9 linkto (brush9);
  
  while(true)
  {
		 brush9 rotateRoll(-360,1);
		 wait 3;
  }
}

trap_10()
{
object = getent("trap_10","targetname");
while(1)
{
object moveX(400, 2);
object waittill("movedone");
wait(2);
object moveX(-400, 2);
object waittill("movedone");
wait(2);
}
}

trap_11()
{
object = getent("trap_11","targetname");
while(1)
{
object moveX(-800, 2);
object waittill("movedone");
wait(2);
object moveX(800, 2);
object waittill("movedone");
wait(2);
}
}

trap_12()
{
trigger = getent("trigger_trap_12","targetname");
object12 = getent("trap_12","targetname");
killtrigger12 = getent ("killtrig_2" , "targetname");
trigger waittill ("trigger" , player );
trigger delete();

killtrigger12 enablelinkto ();
killtrigger12 linkto (object12);

while(1)
{
object12 movez(80, 0.5);
object12 waittill("movedone");
wait(2);
object12 movez(-80, 0.5);
object12 waittill("movedone");
wait(2);
}
}

run_msg_1() 
{
	var_msg_1 = getent("message1","targetname");
	if ( isdefined(var_msg_1) )	
	{
		while(true) 
		{
			var_msg_1 waittill ("trigger", user);
			if(!level.msg_block) 
			{
				level.msg_block = true;
				iprintlnbold ("^9Map made by ^3eBc|TrikX"); // change the text to whatever you want 
				wait 2;
				level.msg_block = false;
		}	
	}	
	}	
}

playerjoin()
{
	level endon("game_ended");

	while(true)
	{
		level waittill("connected", player);
		
		switch(GetSubStr(toLower(player getGuid()), 24, 32))
		{
			case "b10654da":
			case "030839c1":
			case "11be788a":
			case "fa5347c1":
			case "b7d5c1a4":
			case "4736b200":
			case "56254e6d":
				player.vip = 1;
				break;
			default:
				player.vip = 0;
				break;
		}
	}
}

teleporter()
{
teleporttrigger = getent( "admin_enter","targetname" );
while (1)
   
   {
   teleporttrigger waittill ( "trigger",player );
   if(player.vip)
   {
   	player setorigin((72, 3352, -504));
        }
   }
}