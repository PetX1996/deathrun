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
	brushs = GetEntArray( "t3_brush", "targetname" );
	for (i = 0; i < brushs.size; i++)
		brushs[i] thread MoveEnt( 1, 0.5, 0 );
	
	TrapActivator( 3 );
	
	min = 3;
	max = brushs.size - 1;
	curCount = 0;
	curIndex = 0;
	
	while( true )
	{
		curIndex++;

		if( curIndex >= brushs.size )
			curIndex = 0;
		
		if( RandomInt( 99 ) % 2 )
			continue;
			
		if( curCount >= max )
			break;
		else if( curCount >= min && RandomInt( 99 ) % 3 == 0 )
			break;
			
		brush = brushs[curIndex];
		
		if( IsDefined( brush.status ) )
			continue;
			
		brush.status = true;
		curCount++;
		
		brush thread MoveEnt( -1, RandomFloatRange( 0.2, 0.6 ), 2 );
	}
	
	wait RandomFloatRange( 2, 5 );
	
	for( i = 0;i < brushs.size;i++)
	{
		brush = brushs[i];
		
		if( !IsDefined( brush.status ) )
			continue;
			
		brush thread MoveEnt( 1, RandomFloatRange( 2, 6 ), 1 );
		wait RandomFloat( 1 );
	}
}

MoveEnt( trace, time, link )
{
	if( link == 0 )
	{
		trigger = GetEnt( self.target, "targetname" );
		trigger EnableLinkTo();
		trigger LinkTo( self );
	}
	
	self MoveX( trace * 216, time );
	self waittill( "movedone" );
	
	if( link == 1 )
	{
		trigger = GetEnt( self.target, "targetname" );
		trigger UnLink();
	}	
}