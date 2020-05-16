main()
{
maps\mp\_load::main();
	
PreCacheItem("deserteaglegold_mp");
        PreCacheItem("winchester1200_mp");
        PreCacheItem("skorpion_mp");
        PreCacheItem("remington700_mp");
		ambientPlay("fk");
thread trap1();
thread trap2();
thread trap3();
thread trap4();
thread trap5();
thread trap6();
thread trap7();
thread trap8();
thread trap9();
thread tele1();
thread tele2();
thread givesniper();
thread jackpot();
thread scndpart();
thread sniper_room();
thread knife_room();
thread music();
}

music()
{
trig = getEnt ("music1", "targetname");
trig waittill ("trigger", player);
trig delete();


ambientStop();
ambientPlay("shit");
}



scndpart()
{
trig = getEnt ("wtf2" , "targetname");
trig waittill ("trigger", player);


     iPrintlnBold( player.name + " ^2Is ^3GaYyyyYY!!" );   
	 }
	 
jackpot()
{
trig = getEnt ("wtf" , "targetname");
trig waittill ("trigger", player);
trig delete();

     iPrintlnBold( "^1OoOOooO ^2Activator ^3Just found a jackpot!" );   
	 }
	 
givesniper()
{
        trigger = getEnt("wepsniper", "targetname");
        precacheItem("deserteaglegold_mp");    
        while(1)
        {
                trigger waittill("trigger", player);
                player takeallweapons();
                player GiveWeapon("deserteaglegold_mp");
                player SwitchToWeapon( "deserteaglegold_mp" );
        }
}

trap1()
{
brush = getEnt ("b1", "targetname");
trig = getEnt ("t1", "targetname");
trig waittill ("trigger");
trig delete();

while(1)
{
brush rotateroll (360, 2);
		wait 2;
		}
	
}


trap2()
{
b = getEnt ("b2a" , "targetname");
b2 = getEnt ("b2b" , "targetname");
trig = getEnt ("t2", "targetname");
trig waittill ("trigger" , player );
trig delete();
while (1)
{
b moveZ (50,1);
wait 1;
b2 moveZ (-50,1);
wait 1;
b moveZ (-50,1);
wait 1;
b2 moveZ (50,1);
wait 1;
}
}

trap3()
{
b = getEnt ("b3a" , "targetname");
b2 = getEnt ("b3b" , "targetname");
trig = getEnt ("t3", "targetname");
trig waittill ("trigger" , player );
trig delete();
while (1)
{
b moveZ (50,1);
wait 1;
b2 moveZ (-50,1);
wait 1;
b moveZ (-50,1);
wait 1;
b2 moveZ (50,1);
wait 1;
}
}

trap4()
{
brush = getEnt ("b4", "targetname");
trig = getEnt ("t4", "targetname");
trig waittill ("trigger" , player);
trig delete();

  brush moveY (512, 2);
  wait 2;
  brush moveY (-512,2);
  wait 2;
			
}

trap5()
{
brush = getEnt ("b5", "targetname");
trig = getEnt ("t5", "targetname");
trig waittill ("trigger");
trig delete();

  brush moveZ (-512, 2);
  wait 2;
  brush moveZ (512,2);
  wait 2;
			
}

trap6()
{
trap1a = getent ("b6a", "targetname");
trap1b = getent ("b6b", "targetname");
trig1 = getent ("t6", "targetname");

trig1 waittill ("trigger");
trig1 delete();

	for(;;)
	{
		trap1a rotateRoll (-360, 3);
		trap1b rotateRoll (360, 3);
		wait 3;
	}
}

trap7()
{
brush = getEnt ("b7", "targetname");
trig = getEnt ("t7", "targetname");
trig waittill ("trigger");
trig delete();

for(;;)
	{
		brush rotateRoll (-360, 3);
		wait 3;
	}
 
}

trap8()
{
brush = getEnt ("b8", "targetname");
trig = getEnt ("t8", "targetname");
trig waittill ("trigger");
trig delete();

for(;;)
	{
		brush rotateRoll (360, 3);
		wait 3;
	}
 
}

trap9()
{
brush = getEnt ("b9", "targetname");
trig = getEnt ("t9", "targetname");
trig waittill ("trigger");
trig delete();

for(;;)
	{
		brush rotateRoll (-360, 3);
		wait 3;
	}
 
}

 tele1()
{
        entTransporter = getentarray( "a", "targetname" );
        if(isdefined(entTransporter))
                for( i = 0; i < entTransporter.size; i++ )
                        entTransporter[i] thread transporter1();
}
 
transporter1()
{
        for(;;)
        {
                self waittill( "trigger", player );
                entTarget = getEnt( self.target, "targetname" );
                wait 0.1;
                player setOrigin( entTarget.origin );
                player setplayerangles( entTarget.angles );
                wait 0.1;
        }
}

 tele2()
{
        entTransporter = getentarray( "b", "targetname" );
        if(isdefined(entTransporter))
                for( i = 0; i < entTransporter.size; i++ )
                        entTransporter[i] thread transporter2();
}
 
transporter2()
{
        for(;;)
        {
                self waittill( "trigger", player );
                entTarget = getEnt( self.target, "targetname" );
                wait 0.1;
                player setOrigin( entTarget.origin );
                player setplayerangles( entTarget.angles );
                wait 0.1;
        }
}



sniper_room()
{
    level.sniper_trig = getEnt( "sniper_room", "targetname");
        jump = getEnt( "sniper_jump", "targetname" );
        acti = getEnt( "sniper_acti", "targetname");
   
        while(1)
        {
                level.sniper_trig waittill( "trigger", player );
                if( !isDefined( level.sniper_trig ) )
                        return;
               
                if (IsDefined(level.wall_trig)) level.wall_trig delete();
                if (IsDefined(level.knife_trig)) level.knife_trig delete();
                                 
                                     
                player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
                player TakeAllWeapons();
                player GiveWeapon( "remington700_mp" );   
				
				if (IsDefined(level.activ))
				{
					level.activ setPlayerangles( acti.angles );
					level.activ setOrigin( acti.origin );
					level.activ TakeAllWeapons();
					level.activ GiveWeapon( "remington700_mp" );          
                }
				
				wait 0.05;
                player switchToWeapon( "remington700_mp" );
				
				if (IsDefined(level.activ))
					level.activ SwitchToWeapon( "remington700_mp" );
					
                iPrintlnBold( " ^6" + player.name + " ^4 has chosen ^1snipe room!" );                //change it as you wish
                while( isAlive( player ) && isDefined( player ) )
                        wait 1;
        }
}              

knife_room()
{
    level.knife_trig = getEnt( "knife_room", "targetname");
        jump = getEnt( "knife_jump", "targetname");
        acti = getEnt( "knife_acti", "targetname");
   
        while(1)
        {
                level.knife_trig waittill( "trigger", player );
                if( !isDefined( level.knife_trig ) )
                        return;
               
                if (IsDefined(level.sniper_trig)) level.sniper_trig delete();
                if (IsDefined(level.wall_trig)) level.wall_trig delete();
                                 
                                     
                player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
                player TakeAllWeapons();
                player GiveWeapon( "tomahawk_mp" );    

				if (IsDefined(level.activ))
				{
					level.activ setPlayerangles( acti.angles );
					level.activ setOrigin( acti.origin );
					level.activ TakeAllWeapons();
					level.activ GiveWeapon( "tomahawk_mp" );              
                }
				
				wait 0.05;
                player switchToWeapon( "tomahawk_mp" );
				
				if (IsDefined(level.activ))
					level.activ SwitchToWeapon( "tomahawk_mp" );
					
                iPrintlnBold( " ^6" + player.name + " ^3has chosen ^1knife room" );                //change it as you wish
                while( isAlive( player ) && isDefined( player ) )
                        wait 1;
        }
}