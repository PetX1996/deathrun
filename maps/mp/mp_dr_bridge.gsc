main() 
{ 
    maps\mp\_load::main();
	

 	game["allies"] = "sas";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";
	
	//////////dvars/////////////////////////////
	setdvar( "r_specularcolorscale", "1" );
	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	
	/////////traps//////////////
	thread trap_1();
	thread trap_2();
	thread trap_3();
	thread trap_4();
	thread trap5();
	thread teleport1();
	thread teleport2();
	thread trap6();
	thread trap7();
	thread teleport3();
	thread teleport4();
	thread trap8();
	thread teleport5();
	thread endroom_Old();
	thread credits();
}

trap_1()
{
	trig = getEnt( "trap1_trig", "targetname" );
	brush = getEnt( "trap1", "targetname" );

	trig waittill( "trigger", who );
	trig delete();

	while (true)
	{
	brush moveZ( -300, 8 );
	wait 8;
	brush moveZ( 300, 8 );
	wait 8;
	}
}

trap_2()
{
    trig = getEnt( "trap2_trig", "targetname" );
	brush = getEnt( "trap2", "targetname" );
	
	trig waittill( "trigger", who );
	trig delete();

	while( isDefined( brush ) )
	{
		brush rotatePitch( -360 , 8 );
		wait 1;
	}
}

trap_3()
{
   trig = getEnt ("trap3_trig", "targetname" );
   trap3_1 = getEnt ("trap3_1", "targetname");
   trap3_2 = getEnt ("trap3_2", "targetname");
   trap3_3 = getEnt ("trap3_3", "targetname");
   
   trig waittill ("trigger", who );
   trig delete();
   
   while ( true)
   {
      trap3_1 rotateYaw ( 360 , 1.5 );
	  trap3_2 rotateYaw ( 360 , 1.5 );
	  trap3_3 rotateYaw ( 360 , 1.5 );
	  wait 1;
   }
}


trap_4()
{
	rings = getEnt("trap4", "targetname");
	trig = getEnt("trap4_trig", "targetname");
	
	
	trig waittill("trigger");
	trig delete();
	
while( 1 )
	{

		rings RotatePitch (540, 2, 0.3, 0.3);
		wait 2;
		rings moveZ (120, 0.2, 0.03, 0.03);
		rings waittill ("movedone");
		rings moveZ (-120, 0.2, 0.03, 0.03);
		rings waittill ("movedone");
		rings moveZ (120, 0.2, 0.03, 0.03);
		rings waittill ("movedone");
		rings moveZ (-120, 0.2, 0.03, 0.03);
		rings waittill ("movedone");
		wait 0.3;
	}
}

trap5()
{

level.pallet1 = getEnt("pallet1", "targetname");
level.pallet2 = getEnt("pallet2", "targetname");
level.pallet3 = getEnt("pallet3", "targetname");
level.pallet4 = getEnt("pallet4", "targetname");

thread trap5_1();
thread trap5_2();
thread trap5_3();
thread trap5_4();

}


trap5_1()
{ 

while (true)
{
level.pallet1 moveY( -240, 2, 0.03, 0.03 );
wait 2;
level.pallet1 moveX( -240, 2, 0.03, 0.03 );
wait 2;
level.pallet1 moveY( 240, 2, 0.03, 0.03 );
wait 2;
level.pallet1 moveX( 240, 2, 0.03, 0.03 );
wait 2;
}
}

trap5_2()
{

while (true)
{
level.pallet2 moveX( -240, 2, 0.03, 0.03 );
wait 2;
level.pallet2 moveY( 240, 2, 0.03, 0.03 );
wait 2;
level.pallet2 moveX( 240, 2, 0.03, 0.03 );
wait 2;
level.pallet2 moveY( -240, 2, 0.03, 0.03 );
wait 2;
}
}

trap5_3()
{


while (true)
{
level.pallet3 moveY( 240, 2, 0.03, 0.03 );
wait 2;
level.pallet3 moveX( 240, 2, 0.03, 0.03 );
wait 2;
level.pallet3 moveY( -240, 2, 0.03, 0.03 );
wait 2;
level.pallet3 moveX( -240, 2, 0.03, 0.03 );
wait 2;
}
}

trap5_4()
{

while (true)
{
level.pallet4 moveX( 240, 2, 0.03, 0.03 );
wait 2;
level.pallet4 moveY( -240, 2, 0.03, 0.03 );
wait 2;
level.pallet4 moveX( -240, 2, 0.03, 0.03 );
wait 2;
level.pallet4 moveY( 240, 2, 0.03, 0.03 );
wait 2;
}
}



teleport1()
{
trigger = getEnt("teleport1_trig", "targetname");
teleport = getEnt("teleport1_origin", "targetname");

while(true)
	{
		trigger waittill("trigger", player );
		thread teleportPlayer( player , teleport );
	}
}

teleportPlayer ( who, item )
{
	who setPlayerangles( item.angles );
	who setOrigin( item.origin );
}



teleport2()
{
trigger = getEnt("teleporter2_trig", "targetname");
teleport = getEnt("teleporter2_origin", "targetname");

while(true)
	{
		trigger waittill("trigger", player );
		thread teleportPlayer( player , teleport );
	}
}

trap6()
{
trig = getEnt ("trap6_trig", "targetname");
trap6_1 = getEnt ("trap6_1",  "targetname");
trap6_2 = getEnt ("trap6_2", "targetname");

	trig waittill ("trigger");
	trig delete();

while (true)
	{
		trap6_1 rotateYaw ( 360 , 1 );
		trap6_2 rotateYaw ( -360 , 1 );
		wait 1;
		trap6_1 rotateYaw ( -360 , 1 );
		trap6_2 rotateYaw ( 360 , 1 );
	}
}

trap7()
{
trig = getEnt ("trap7_trig", "targetname");
trap7_1 = getEnt ("trap7_1", "targetname");
trap7_2 = getEnt ("trap7_2", "targetname");	
trap7_3 = getEnt ("trap7_3", "targetname");	
trap7_4 = getEnt ("trap7_4", "targetname");	
		
	trig waittill ("trigger");
	trig delete();

while (true)
		{
			trap7_1 rotateRoll ( 360 , 2 );
			trap7_2 rotateRoll ( -360 , 2 );
			trap7_3 rotateRoll ( 360 , 2 );
			trap7_4 rotateRoll ( -360 , 2 );
			wait 1;
		}
}

teleport3()
{
trigger = getEnt("teleporter3_trig", "targetname");
teleport = getEnt("teleporter3_origin", "targetname");

while(true)
	{
		trigger waittill("trigger", player );
		thread teleportPlayer( player , teleport );
	}
}

teleport4()
{
trigger = getEnt("teleport4_trig", "targetname");
teleport = getEnt("teleport4_origin", "targetname");

while(true)
	{
		trigger waittill("trigger", player );
		thread teleportPlayer( player , teleport );
	}
}


trap8()
{
trig = getEnt ("trap8_trig", "targetname");
trap8_1 = getEnt ("trap8_1", "targetname");
trap8_2 = getEnt ("trap8_2", "targetname");

	trig waittill ("trigger");
	trig delete();

while (true)
	{
		trap8_1 moveY ( -224 , 0.25 , 0.03 , 0.03 );
		trap8_2 moveY ( 224 , 0.25 , 0.03 , 0.03 );
		wait 1;
		trap8_1 moveY ( 224, 0.25 , 0.03 , 0.03 );
		trap8_2 moveY ( -224 , 0.25 , 0.03 , 0.03 );
		wait 1;
	}
}

teleport5()
{
trigger = getEnt("teleporter5_trig", "targetname");
teleport = getEnt("teleporter5_origin", "targetname");

while(true)
	{
		trigger waittill("trigger", player );
		thread teleportPlayer( player , teleport );
	}
}
endroom_Old()
{

level.old_trig = getEnt("end_old", "targetname");
acti = getEnt ("actitele", "targetname" ); 
player1 = getEnt ("jumpertele", "targetname" );

while(true)
	{
	level.old_trig waittill("trigger", player);

	if (IsDefined(level.activ))
	{
		level.activ setOrigin(acti.origin);
		level.activ freezeControls(1);
		player freezeControls(1);
		wait 1;
		level.activ setPlayerAngles(acti.angles);
		player setOrigin(player1.origin); 
		wait 0.05;
		player setPlayerAngles( player1.angles);
		player freezeControls(0);
		level.activ freezeControls(0);
		wait 1;
	}
	}

}

credits()
{

wait 2;

iPrintlnBold ( "Map made by AoD'BanaaN" );
wait 5;
iPrintlnBold ( "Visit us: AoD-Gaming.com" );
}




////What are u doing recompiling my maps!?!//////
