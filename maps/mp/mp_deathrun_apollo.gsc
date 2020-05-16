main()
{
 maps\mp\_load::main();
 ambientPlay("song1");

 game["allies"] = "marines";
 game["axis"] = "opfor";
 game["attackers"] = "axis";
 game["defenders"] = "allies";
 game["allies_soldiertype"] = "desert";
 game["axis_soldiertype"] = "desert";



 thread finalFight1();
 thread finalFight2();
 thread finalFight3();
 thread finalFight4();
 thread activator1();
 thread activator2();
 thread activator3();
 thread activator4();
 thread activator5();
 thread activator6();
 thread activator7();
 thread activator8();
 thread activator9();
 thread activator10();
 thread jumproompod1();
 thread jumproompod2();
 thread trap0();
 thread trap1();
 thread trap2();
 thread trap3();
 thread trap4();
 thread trap5();
 thread trap6();
 thread trap7();
 thread trap8();
 thread trap9();
 thread trap10();
 thread trap11();
 thread trap12();
 thread trap13();
 thread trap16();
 thread trap18();
 thread trap19();
 thread printCredits();
 thread secretroom();
 thread secret();
 thread pad1();
 thread pad2();
 thread pad3();
 thread creator();

}


 finalFight1()

{
    level.knife_trig = getEnt( "kniferoom", "targetname");
    jump = getEnt( "knife", "targetname" );
    acti = getEnt( "actiknife", "targetname" );
    
    while(1)
    {
        level.knife_trig waittill( "trigger", player );
        if( !isDefined( level.knife_trig ) )
            return;
        
        if (IsDefined(level.snip_trig)) level.snip_trig delete();

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
			level.activ SwitchToWeapon( "knife_mp" );
        iPrintlnBold( " ^5" + player.name + " ^7 HAS CHOSEN KNIFE^5!" );     
        while( isAlive( player ) && isDefined( player ) )

             wait 1;
   }

}


 finalFight2()

{
    level.knife_trig = getEnt( "sniproom", "targetname");
    jump = getEnt( "scope", "targetname" );
    acti = getEnt( "actiscope", "targetname" );
    
    while(1)
    {
        level.knife_trig waittill( "trigger", player );
        if( !isDefined( level.knife_trig ) )
            return;
        
        if (IsDefined(level.snip_trig)) level.snip_trig delete();

                                     
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
        iPrintlnBold( " ^5" + player.name + " ^7 HAS CHOSEN SNIPER^5!" );     
        while( isAlive( player ) && isDefined( player ) )

             wait 1;
   }

}


 finalFight3()

{
    level.knife_trig = getEnt( "oldroom", "targetname");
    jump = getEnt( "old", "targetname" );
    acti = getEnt( "actiold", "targetname" );
    
    while(1)
    {
        level.knife_trig waittill( "trigger", player );
        if( !isDefined( level.knife_trig ) )
            return;
        
        if (IsDefined(level.snip_trig)) level.snip_trig delete();

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
			level.activ SwitchToWeapon( "knife_mp" );
        iPrintlnBold( " ^5" + player.name + " ^7 HAS CHOSEN OLD^5!" );     
        while( isAlive( player ) && isDefined( player ) )

             wait 1;
    } 

}

 finalFight4()

{
    level.knife_trig = getEnt( "jumproom", "targetname");
    jump = getEnt( "jump", "targetname" );
    acti = getEnt( "actijump", "targetname" );
    
    while(1)
    {
        level.knife_trig waittill( "trigger", player );
        if( !isDefined( level.knife_trig ) )
            return;
        
        if (IsDefined(level.snip_trig)) level.snip_trig delete();

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
			level.activ SwitchToWeapon( "knife_mp" );
        iPrintlnBold( " ^5" + player.name + " ^7 HAS CHOSEN JUMP^5!" );     
        while( isAlive( player ) && isDefined( player ) )

             wait 1;
   }  

}


 activator1()

{
  trig = getEnt( "teleport1", "targetname"); 
  target = getEnt( "actiteleport1", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}


activator2()

{
  trig = getEnt( "teleport2", "targetname"); 
  target = getEnt( "actiteleport2", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}



activator3()

{
  trig = getEnt( "teleport3", "targetname"); 
  target = getEnt( "actiteleport3", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}


activator4()

{
  trig = getEnt( "teleport4", "targetname"); 
  target = getEnt( "actiteleport4", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}


activator5()

{
  trig = getEnt( "teleport5", "targetname"); 
  target = getEnt( "actiteleport5", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}


activator6()

{
  trig = getEnt( "teleport6", "targetname"); 
  target = getEnt( "actiteleport6", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}


activator7()

{
  trig = getEnt( "teleport7", "targetname"); 
  target = getEnt( "actiteleport7", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}


activator8()

{
  trig = getEnt( "teleport8", "targetname"); 
  target = getEnt( "actiteleport8", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}

activator9()

{
  trig = getEnt( "teleport9", "targetname"); 
  target = getEnt( "actiteleport9", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}


activator10()

{
  trig = getEnt( "teleport10", "targetname"); 
  target = getEnt( "actiteleport10", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}

jumproompod1()

{
  trig = getEnt( "jumpfail", "targetname"); 
  target = getEnt( "jumprespawn", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}


jumproompod2()

{
  trig = getEnt( "jumpfail2", "targetname"); 
  target = getEnt( "jumprespawn2", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}


trap0()

{

trig = getEnt( "trig_trap0", "targetname" );

object = getent("trap0","targetname");

 
trig waittill ("trigger");

trig delete();
 
while(1)

{

object movez(1344, 5);

wait(15);

object movez(-1344, 5);

wait(15);
 
}

}



trap1()

{

trig = getEnt( "trig_trap1", "targetname" );

object = getent("trap1","targetname");

 
trig waittill ("trigger");

trig delete();
 
while(1)

{

object movez(2624, 5);

wait(15);

object movez(-2624, 5);

wait(15);
 
}

}



trap2()

{

trig = getEnt( "trig_trap2", "targetname" );

object1 = getent("trap2a","targetname");
object2 = getent("trap2b","targetname");
object3 = getent("trap2c","targetname");
object4 = getent("trap2d","targetname");

 
trig waittill ("trigger");

trig delete();
 
while(5)

{

object1 rotateyaw(-720, 3);
object2 rotateyaw(-720, 3);
object3 rotateyaw(-720, 3);
object4 rotateyaw(-720, 3);

wait(5);

object1 rotateyaw(720, 3);
object2 rotateyaw(720, 3);
object3 rotateyaw(720, 3);
object4 rotateyaw(720, 3);

wait(3);
 
}

}


trap3()

{

trig = getEnt( "trig_trap3", "targetname" );

object1 = getent("trap3a","targetname");
object2 = getent("trap3b","targetname");
object3 = getent("trap3c","targetname");


 
trig waittill ("trigger");

trig delete();
 
while(1)

{

object1 rotateroll(360, 1);

wait(2);

object1 rotateroll(-360, 1);

wait(1);

object2 rotateroll(360, 1);

wait(2);

object2 rotateroll(-360, 1);

wait(1);
 
object3 rotateroll(360, 1);

wait(2);

object3 rotateroll(-360, 1);

wait(1);

 
}

}

trap4()

{

trig = getEnt( "trig_trap4", "targetname" );

object1 = getent("trap4a","targetname");
object2 = getent("trap4b","targetname");

 
trig waittill ("trigger");

trig delete();
 
while(1)

{

object1 rotateroll(360, 1);
object2 rotateroll(360, 1);

wait(2);

object1 rotateroll(-360, 1);
object2 rotateroll(-360, 1);

wait(2);

 
}

}



trap5()

{

trig = getEnt( "trig_trap5", "targetname" );

object1 = getent("trap5a","targetname");
object2 = getent("trap5b","targetname");
object3 = getent("trap5c","targetname");
object4 = getent("trap5d","targetname");
object5 = getent("trap5e","targetname");
object6 = getent("trap5f","targetname");

 
trig waittill ("trigger");

trig delete();
 
while(1)

{

object1 rotateyaw(-720, 3);
object2 rotateyaw(-720, 3);

wait(5);

object1 rotateyaw(720, 3);
object2 rotateyaw(720, 3);

wait(5);

object3 rotateyaw(-720, 3);
object4 rotateyaw(-720, 3);

wait(5);

object3 rotateyaw(720, 3);
object4 rotateyaw(720, 3);

wait(5);

object5 rotateyaw(-720, 3);
object6 rotateyaw(-720, 3);

wait(5);

object5 rotateyaw(720, 3);
object6 rotateyaw(720, 3);


wait(5);
 

}

}


trap6()

{

trig = getEnt( "trig_trap6", "targetname" );

object1 = getent("trap6a","targetname");
object2 = getent("trap6b","targetname");
object3 = getent("trap6c","targetname");
object4 = getent("trap6d","targetname");
object5 = getent("trap6e","targetname");
object6 = getent("trap6f","targetname");

 
trig waittill ("trigger");

trig delete();
 
while(1)

{

object1 rotatepitch(720, 1);
object2 rotatepitch(-720, 1);
object3 rotatepitch(720, 1);
object4 rotatepitch(-720, 1);
object5 rotatepitch(720, 1);
object6 rotatepitch(-720, 1);


wait(5);

object1 rotatepitch(-720, 1);
object2 rotatepitch(720, 1);
object3 rotatepitch(-720, 1);
object4 rotatepitch(720, 1);
object5 rotatepitch(-720, 1);
object6 rotatepitch(720, 1);

wait(5);
  
 

}

}

trap7()

{

trig = getEnt( "trig_trap7", "targetname" );

object = getent("trap7","targetname");

 
trig waittill ("trigger");

trig delete();
 
while(1)

{

object rotateyaw(360, 1);

wait(2);

object rotateyaw(-360, 1);

wait(2);

 
}

}


trap8()

{

trig = getEnt( "trig_trap8", "targetname" );

object1 = getent("trap8a","targetname");
object2 = getent("trap8b","targetname");

 
trig waittill ("trigger");

trig delete();
 
while(1)

{

object1 movey(128, 1);
object2 movey(-136, 1);

wait(2);

object1 movey(-128, 1);
object2 movey(136, 1);

wait(2);

 
}

}


trap9()

{

trig = getEnt( "trig_trap9", "targetname" );

object = getent("trap9","targetname");

 
trig waittill ("trigger");

trig delete();
 
while(1)

{

object rotateroll(360, 1);

wait(2);

object rotateroll(-360, 1);

wait(2);

 
}

}


trap10()

{

trig = getEnt( "trig_trap10", "targetname" );

object1 = getent("trap10a","targetname");
object2 = getent("trap10b","targetname");
object3 = getent("trap10c","targetname");
object4 = getent("trap10d","targetname");
object5 = getent("trap10e","targetname");
object6 = getent("trap10f","targetname");
object7 = getent("trap10g","targetname");
object8 = getent("trap10h","targetname");
object9 = getent("trap10i","targetname");
object10 = getent("trap10j","targetname");

 
trig waittill ("trigger");

trig delete();
 
while(1)

{

object1 rotateyaw(-720, 3);
object2 rotateyaw(-720, 3);
object3 rotateyaw(-720, 3);
object4 rotateyaw(-720, 3);
object5 rotateyaw(-720, 3);
object6 rotateyaw(-720, 3);
object7 rotateyaw(-720, 3);
object8 rotateyaw(-720, 3);
object9 rotateyaw(-720, 3);
object10 rotateyaw(-720, 3);

wait(5);

object1 rotateyaw(720, 3);
object2 rotateyaw(720, 3);
object3 rotateyaw(720, 3);
object4 rotateyaw(720, 3);
object5 rotateyaw(720, 3);
object6 rotateyaw(720, 3);
object7 rotateyaw(720, 3);
object8 rotateyaw(720, 3);
object9 rotateyaw(720, 3);
object10 rotateyaw(720, 3);

wait(5);
 

}

}


trap11()

{

trig = getEnt( "trig_trap11", "targetname" );

object = getent("trap11","targetname");

 
trig waittill ("trigger");

trig delete();
 
while(1)

{

object rotateroll(360, 1);

wait(3);

object rotateroll(-360, 1);

wait(3);

}

}


trap12()

{

trig = getEnt( "trig_trap12", "targetname" );

object1 = getent("trap12a","targetname");
object2 = getent("trap12b","targetname");
object3 = getent("trap12c","targetname");
object4 = getent("trap12d","targetname");


 
trig waittill ("trigger");

trig delete();
 
while(1)

{

object1 rotateyaw(360, 1);
object2 rotateyaw(360, 1);
object3 rotateyaw(360, 1);
object4 rotateyaw(360, 1);

wait(2);

object1 rotateyaw(-360, 1);
object2 rotateyaw(-360, 1);
object3 rotateyaw(-360, 1);
object4 rotateyaw(-360, 1);

wait(2); 


}

}


trap13()

{

trig = getEnt( "trig_trap13", "targetname" );

object1 = getent("trap13a","targetname");
object2 = getent("trap13b","targetname");
object3 = getent("trap13c","targetname");
object4 = getent("trap13d","targetname");
object5 = getent("trap13e","targetname");
object6 = getent("trap13f","targetname");
object7 = getent("trap13g","targetname");
object8 = getent("trap13h","targetname");
object9 = getent("trap13i","targetname");
object10 = getent("trap13j","targetname");
object11 = getent("trap13k","targetname");
object12 = getent("trap13l","targetname");
object13 = getent("trap13lj","targetname");
object14 = getent("trap13m","targetname");
object15 = getent("trap13n","targetname");
object16 = getent("trap13nj","targetname");




 
trig waittill ("trigger");

trig delete();
 
while(1)

{

object1 rotateyaw(-360, 3);
object2 rotateyaw(-360, 3);
object3 rotateyaw(-360, 3);
object4 rotateyaw(-360, 3);
object5 rotateyaw(-360, 3);
object6 rotateyaw(-360, 3);
object7 rotateyaw(-360, 3);
object8 rotateyaw(-360, 3);
object9 rotateyaw(-360, 3);
object10 rotateyaw(-360, 3);
object11 rotateyaw(-360, 3);
object12 rotateyaw(-360, 3);
object13 rotateyaw(-360, 3);
object14 rotateyaw(-360, 3);
object15 rotateyaw(-360, 3);
object16 rotateyaw(-360, 3);

wait(5);

object1 rotateyaw(360, 3);
object2 rotateyaw(360, 3);
object3 rotateyaw(360, 3);
object4 rotateyaw(360, 3);
object5 rotateyaw(360, 3);
object6 rotateyaw(360, 3);
object7 rotateyaw(360, 3);
object8 rotateyaw(360, 3);
object9 rotateyaw(360, 3);
object10 rotateyaw(360, 3);
object11 rotateyaw(360, 3);
object12 rotateyaw(360, 3);
object13 rotateyaw(360, 3);
object14 rotateyaw(360, 3);
object15 rotateyaw(360, 3);
object16 rotateyaw(360, 3);

wait(5);
 

}

}

trap14()

{

trig = getEnt( "trig_trap14", "targetname" );

object1 = getent("trap14a","targetname");
object2 = getent("trap14b","targetname");

 
trig waittill ("trigger");

trig delete();
 
while(1)

{

object1 movey(-88, 1);
object2 movey(88, 1);

wait(2);

object1 movey(88, 1);
object2 movey(-88, 1);

wait(2);

 
}

}

trap15()

{

trig = getEnt( "trig_trap15", "targetname" );

object1 = getent("trap15a","targetname");
object2 = getent("trap15b","targetname");
object3 = getent("trap15c","targetname");
object4 = getent("trap15d","targetname");


 
trig waittill ("trigger");

trig delete();
 
while(1)

{

object1 rotateroll(360, 1);

wait(2);

object1 rotateroll(-360, 1);

wait(1);

object2 rotateroll(360, 1);

wait(2);

object2 rotateroll(-360, 1);

wait(1);
 
object3 rotateroll(360, 1);

wait(2);

object3 rotateroll(-360, 1);

wait(1);

object4 rotateroll(360, 1);

wait(2);

object4 rotateroll(-360, 1);

wait(1); 


}

}

trap16()

{

trig = getEnt( "trig_trap16", "targetname" );

object1 = getent("trap16a","targetname");
object2 = getent("trap16b","targetname");
object3 = getent("trap16c","targetname");

trig waittill ("trigger");

trig delete();
 
while(1)

{

object1 rotateyaw(360, 1);
object2 rotateyaw(360, 1);
object3 rotateyaw(360, 1);

wait(2);

object1 rotateyaw(-360, 1);
object2 rotateyaw(-360, 1);
object3 rotateyaw(-360, 1);

wait(2);

 
}

}


trap17()

{

object = getent("trap17","targetname");

while(1)

{

object movez(-40, 1);

wait(1);

object movez(40, 1);

wait(1);

 
}

}


trap18()

{

trig = getEnt( "trig_trap18a", "targetname" );

object = getent("trap18b","targetname");

 
trig waittill ("trigger");

trig delete();

{

object movez(-128, 5);

wait(1);

}

}


trap19()

{

trig = getEnt( "trig_trap19", "targetname" );

object = getent("trap19b","targetname");

trig waittill ("trigger");

trig delete();
 

{

object movez(-128, 5);

wait(1);

}

}



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
            self.logoText.fontScale = 1.6;
            self.logoText.archieved = true;
     
            for(;;)
            {
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 1;
                    self.logoText setText("^5---^3Map made by ^5Mr.Xx^3(mapper) & ^5MadLion^3(scripter)^5---");
                    wait 3;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 1;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 1;
                    self.logoText setText("^5---^5xf:^3dragec1997 ^5& ^3madlion3 ^5---");
                    wait 3;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 1;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 1;
                    self.logoText setText("^5---^3Report buggs: ^5Mr.Xx(^3xf: dragec1997)^5---");
                    wait 3;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 1;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 1;
                    self.logoText setText("^5---^3Apollo ^1<<^3BETA^1>>^5---");
                    wait 3;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 1;
                }
       
        }


creator()

{

while( 1 )

{

iPrintLn("^4Map made by ^5Mr.Xx^7(mapper) & ^5MadLion ^7(scripter)");

wait(60);


iPrintLn("^4xfire: ^5dragec1997 ^7& ^5madlion3");

wait(60);

}

}

secretroom()

{
 
trig = getEnt( "secretdoortrig", "targetname" );

object = getEnt( "secretdoor", "targetname" );
 
trig waittill ("trigger");

{


ambientPlay("song2"); //pjesma

wait 1;

iPrintlnBold("^1OMG ^5you ^7found ^5my ^7secret,^5Here ^7comes ^5trouble!!");

wait 60;

object movez(-120, 3 );

wait 2;
   
}

}


secret()

{
  trig = getEnt( "fuckingsecret", "targetname"); 
  target = getEnt( "fuckingsecretroom", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}


pad1()

{
  trig = getEnt( "pod1", "targetname"); 
  target = getEnt( "povrat1", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}


pad2()

{
  trig = getEnt( "pod27", "targetname"); 
  target = getEnt( "povrat27", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}


pad3()

{
  trig = getEnt( "pod26", "targetname"); 
  target = getEnt( "povrat26", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}