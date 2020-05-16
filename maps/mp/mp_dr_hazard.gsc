main()


{
thread trap_1();
thread trap_2();
thread trap_3();
thread trap_4();
thread trap_5();
thread trap_6();
thread trap_7();
thread trap_8();
thread trap_20();
thread trap_21();
thread trap_22();
thread trap_23();
thread onPlayerConnect();
thread joker();
thread onDeath();
thread past4();

trigger = spawn( "trigger_radius", (1160,-800,64), 0, 100, 200 );
trigger SetContents( 1 );
}

onPlayerConnect()
{
	while(1)
	{
		level waittill("connected", player);
		player thread onDeath();
	}
}

onDeath()
{
	self endon("disconnect");
	
	while(1)
	{
		self waittill("death");
		x = RandomInt(200);
		if( x < 10 )
		{
		self PlaySound ("death1");
		}
		if( x > 9 && x < 20  )
		{
		self PlaySound ("death2");
		}
		if( x > 19 && x < 30  )
		{
		self PlaySound ("death3");
		}
		if( x > 29 && x < 40  )
		{
		self PlaySound ("death4");
		}
		if( x > 39 && x < 50  )
		{
		self PlaySound ("death5");
		}
		if( x > 49 && x < 60  )
		{
		self PlaySound ("death6");
		}
		if( x > 59 && x < 70  )
		{
		self PlaySound ("death7");
		}	
		if( x > 69 && x < 80 )
		{
		self PlaySound ("death8");
		}
		if( x > 79 && x < 90 )
		{
		self PlaySound ("death1");
		}
		if( x > 89 && x < 100 )
		{
		self PlaySound ("death2");
		}	
		if( x > 99 && x < 110 )
		{
		self PlaySound ("death3");
		}	
		if( x > 109 && x < 120 )
		{
		self PlaySound ("death4");
		}	
		if( x > 119 && x < 130 )
		{
		self PlaySound ("death5");
		}	
		if( x > 129 && x < 140 )
		{
		self PlaySound ("death6");
		}	
		if( x > 139 && x < 150 )
		{
		self PlaySound ("death7");
		}	
		if( x > 149 && x < 160 )
		{
		self PlaySound ("death8");
		}	
		if( x > 159 && x < 170 )
		{
		self PlaySound ("death1");
		}	
		if( x > 169 && x < 180 )
		{
		self PlaySound ("death2");
		}	
		if( x > 179 && x < 190 )
		{
		self PlaySound ("death3");
		}	
		if( x > 189 )
		{
		self PlaySound ("death8");
		}	
	}

}

joker()
{
	trig = getEnt( "joker", "targetname" );


	trig waittill( "trigger", player );
	
	
	player PlaySound ("joker");
	iprintlnbold("Hoooray," + " " + "^1"+ player.name + " "+ "^0finished the map!Kil acti with R700!");

}

trap_1()
{
	trig = getEnt( "trigger1", "targetname" );
	brush = getEnt( "trap1", "targetname" );

	trig waittill( "trigger", who );
	trig delete();

	brush movey( -900, 1 );
	wait 5;
	brush movey( 900, 1 );
}

trap_2()
{
	trig = getEnt( "trigger2", "targetname" );
	brush = getEnt( "trap2", "targetname" );

	trig waittill( "trigger", who );
	trig delete();
	brush movey( -450, 3 );
 
}

trap_3()
{
trigdoor = getent ("trigger3" , "targetname");
dooro = getent ("trap3" ,"targetname" );
trigdoor waittill ("trigger",player);
trigdoor delete ();
dooro moveY (-200 , 0.1);
wait 0.2;
dooro moveY (200 , 0.1);
wait 0.2;
dooro moveZ (500 , 0.1);
wait 0.2;
dooro moveZ (-500 , 0.1);
wait 0.2;
dooro moveY (200, 0.1);
wait 0.2;
dooro moveY (-200 , 0.1);
}

trap_4()
{
	trig = getEnt( "trigger4", "targetname" );
	brush = getEnt( "trap4", "targetname" );

	trig waittill( "trigger", who );
	trig delete();
	brush moveZ(500, 2 );
	wait 5;
	brush moveZ(-500, 2 );
}
	
trap_5()
{
	trig = getEnt( "trigger5", "targetname" );
	brush = getEnt( "trap5", "targetname" );

	trig waittill( "trigger", who );
	trig delete();
	brush moveY(-400, 0.3 );
	wait 5;
	brush moveY(400, 10 );
}
	

trap_6()
{
	trig = getEnt( "trigger6", "targetname" );
	brush = getEnt( "trap6", "targetname" );

	trig waittill( "trigger", who );
	trig delete();
	brush moveZ(-250, 0.3 );
	wait 5;
	brush moveZ(250, 5 );
}

trap_7()
{
	trig = getEnt( "trigger7", "targetname" );
	brush = getEnt( "trap7", "targetname" );

	trig waittill( "trigger", who );
	trig delete();
	brush moveZ(-500, 1 );
	

}

trap_8()
{
	trig = getEnt( "trigger8", "targetname" );
	brush = getEnt( "trap8", "targetname" );

	trig waittill( "trigger", who );
	trig delete();
	brush moveZ(400, 5 );
	

}

past4()
{
trigdoor = getent ("trigger10" , "targetname");
past4 = getent ("trap10" ,"targetname" );
trigdoor waittill ("trigger",player);
trigdoor delete ();
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
wait 1;
past4 moveY (-170 , 1);
wait 1;
past4 moveY (170, 1);
}


trap_20()
{
	trig = getEnt( "trigger20", "targetname" );
	brush = getEnt( "trap20", "targetname" );

	trig waittill( "trigger", who );
	trig delete();
	brush moveX(-170, 2 );
	wait 2;
	brush moveX(170, 2 );
	wait 2;
	brush moveX(-170, 2 );
	wait 2;
	brush moveX(170, 2 );
	wait 2;
	brush moveX(-170, 2 );
	wait 2;
	brush moveX(170, 2 );
	wait 2;
	brush moveX(-170, 2 );
	wait 2;
	brush moveX(170, 2 );
	wait 2;
	brush moveX(-170, 2 );
	wait 2;
	brush moveX(170, 2 );
	wait 2;
	brush moveX(-170, 2 );
	wait 2;
	brush moveX(170, 2 );
	wait 2;
	brush moveX(-170, 2 );
	wait 2;
	brush moveX(170, 2 );
	wait 2;
	brush moveX(-170, 2 );
	wait 2;
	brush moveX(170, 2 );

}

trap_21()
{
	trig = getEnt( "trigger21", "targetname" );
	brush = getEnt( "trap21", "targetname" );

	trig waittill( "trigger", who );
	trig delete();
	brush moveY(-400, 0.3 );
	wait 5;
	brush moveY(400, 10 );
}



trap_22()
{
	trig = getEnt( "trigger22", "targetname" );
	brush = getEnt( "trap22", "targetname" );

	trig waittill( "trigger", who );
	trig delete();
	brush moveY(170, 2 );
	wait 2;
	brush moveY(-170, 2 );
	wait 2;
	brush moveY(170, 2 );
	wait 2;
	brush moveY(-170, 2 );
	wait 2;
	brush moveY(170, 2 );
	wait 2;
	brush moveY(-170, 2 );
	wait 2;
	brush moveY(170, 2 );
	wait 2;
	brush moveY(-170, 2 );
	wait 2;
	brush moveY(170, 2 );
	wait 2;
	brush moveY(-170, 2 );
	wait 2;
	brush moveY(170, 2 );
	wait 2;
	brush moveY(-170, 2 );
	wait 2;
	brush moveY(170, 2 );
	wait 2;
	brush moveY(-170, 2 );
	wait 2;
	brush moveY(170, 2 );
	wait 2;
	brush moveY(-170, 2 );
	wait 2;
	brush moveY(170, 2 );
	

}


trap_23()
{
	trig = getEnt( "trigger23", "targetname" );
	brush = getEnt( "trap23", "targetname" );

	trig waittill( "trigger", who );
	trig delete();
	brush moveZ(-300, 1 );
	wait 1;
	brush moveZ(300, 1 );
	wait 1;
	brush moveZ(-300, 1 );
	wait 1;
	brush moveZ(300, 1 );
}