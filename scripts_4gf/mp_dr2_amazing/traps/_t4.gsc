// +========================================================================+
// I                    ___  _____  _____                                   I
// I                   /   !!  __ \!  ___!                                  I
// I                  / /! !! !  \/! !_          ___  ____                  I
// I                 / /_! !! ! __ !  _!        / __!!_  /                  I
// I                 \___  !! !_\ \! !      _  ! (__  / /                   I
// I                     !_/ \____/\_!     (_)  \___!/___!                  I
// I                                                                        I
// I========================================================================I
// I                           mp_dr2_amazing                               I
// I========================================================================I
// I                      mapped by:  R3MIEN, Col!ar      		            I
// I                    scripted by:  PetX                                  I
// I                        website:  www.4GF.cz                            I
// I========================================================================I
// I                           DEATHRUN 2 MOD                               I
// I========================================================================I

#include scripts_4gf\mp_dr2_amazing\traps\_utility;

Main()
{
	TrapActivator( 4 );
	
	brush = GetEnt( "t4_brush", "targetname" );
	
	thread MoveEnt(brush);
	thread RotateEnt(brush);
}

MoveEnt(brush)
{
	start = brush.origin + ( 0, 392, 0 );
	end = brush.origin + ( 0, -168, 0 );
	maxVelocity = 150;
	minVelocity = 30;
	
	maxTime = 5;
	
	wait RandomFloatRange( 2, 5 );
	
	while( true )
	{
		v = RandomFloatRange( minVelocity, maxVelocity );
	
		if( brush.origin == start )
			brush MoveTo( end, distance( brush.origin, end ) / v );
		else if( brush.origin == end )
			brush MoveTo( start, distance( brush.origin, start ) / v );
		else if( RandomInt( 99 ) % 2 )
			brush MoveTo( end, distance( brush.origin, end ) / v );
		else
			brush MoveTo( start, distance( brush.origin, start ) / v );
			
		brush waittill( "movedone" );
		wait RandomFloat( maxTime );
	}
}

/*RotateEnt()
{
	maxAngles = 45;
	incrementAngles = 10;
	
	maxVelocity = 50;
	incrementVelocity = 10;
	
	curVelocity = 10;
	curAngles = 10;
	angles = 0;
	
	for(i = 0;;i++)
	{
		if( i % 2 )
			curAngles = angles * -1;
		else
			curAngles = angles;
	
		time = (angles + 1)/(curVelocity + 1);
		self RotateTo( ( curAngles, 0, 0 ), time );
		wait time;
	
		angles += incrementAngles;
		curVelocity += incrementVelocity;
		
		if( curVelocity > maxVelocity )
			curVelocity = maxVelocity;
		
		if( angles > maxAngles )
			angles = maxAngles;
	}
}*/

RotateEnt(brush)
{	
	startTime = 2;
	endTime = 1;
	accelTime = 0.4;
		
	time = startTime;
		
	dir = 1;
	if (RandomInt(99) % 2)
		dir = -1;
		
	brush RotatePitch(22.5 * dir, time * 0.5, (time * 0.5) * 0.33, (time * 0.5) * 0.33);
	brush waittill("rotatedone");
	
	while (true)
	{
		if (time > endTime)
			time -= accelTime;
		else
			time = endTime;
			
		dir *= -1;
	
		brush RotatePitch(45 * dir, time, time * 0.33, time * 0.33);
		brush waittill("rotatedone");
	}
}