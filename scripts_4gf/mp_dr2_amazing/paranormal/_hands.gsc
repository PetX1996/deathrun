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

main()
{
	thread Hand0();
}

Hand0()
{
	//if( RadnomInt(50) )
		//return;
		
	trig = getEnt( "pn_0_trig", "targetname" );
	trig waittill( "trigger" );
	
	for(i = 0;i < 3;i++)
		thread Hand0_MoveEnt( "pn_0_piece_"+i );
}

Hand0_MoveEnt( targetname )
{
	piece = GetEnt( targetname, "targetname" );
	hand = GetEnt( piece.target, "targetname" );
	
	Earthquake( 1, 5, piece.origin, 1500 );
	
	wait RandomFloat( 2 );
	piece MoveZ( -368, 1 );
	
	wait RandomFloatRange( 1, 2 );
	
	hand MoveZ( -368, 2 );
	wait 2;
	hand MoveZ( 368, 2 );
	piece MoveZ( 368, 2 );
}