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
	TrapActivator(1);
	
	for( i = 0;i < 2;i++)
	{
		ent = GetEntArray( "t1_"+i, "targetname" );
		thread MoveEnt( ent[RandomInt(ent.size)], i );
	}
}

MoveEnt( ent, i )
{
	Earthquake( 0.5, 3, ent.origin, 64 );
	
	ent MoveZ( -156, 1 );
	wait 1;
	
	if( i == 0 )
		ent MoveY( -126, 2 );
	else
		ent MoveY( 126, 2 );
}