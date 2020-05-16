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

#include common_scripts\utility;
#include maps\mp\_utility;
	
main()
{
randomStartDelay = randomfloatrange( -20, -15);
	
	global_FX( "sloup", "sloup", "misc/sloup", randomStartDelay ,"sloup" );
	global_FX( "4gf_evase", "4gf_evase", "fire/4gf_evase", randomStartDelay ,"4gf_evase" );
	global_FX( "sand_fall", "sand_fall", "amazing/sand_fall", randomStartDelay );
	global_FX( "sand_fall_smoke", "sand_fall_smoke", "amazing/sand_fall_smoke", randomStartDelay );
	global_FX( "tryska", "water_jet", "water/water_jet", randomStartDelay ,"kasna" );
	global_FX( "voda", "waterfall_small", "water/waterfall_small", randomStartDelay ,"kasna" );
	global_FX( "voda2", "waterfall_big", "water/waterfall_big", randomStartDelay ,"vodopad" );
	global_FX( "voda_ext", "waterfall_big_ext", "water/waterfall_big_ext", randomStartDelay ,"vodopad" );
	global_FX( "reka", "water_00", "misc/water_00", randomStartDelay );
}

global_FX( targetname, fxName, fxFile, delay, soundalias )
{
	// script_structs
	ents = getstructarray(targetname,"targetname");
	if ( !isdefined( ents ) )
		return;
	if ( ents.size <= 0 )
		return;
	
	for ( i = 0 ; i < ents.size ; i++ )
		ents[i] global_FX_create( fxName, fxFile, delay, soundalias );
}

global_FX_create( fxName, fxFile, delay, soundalias )
{
	if ( !isdefined( level._effect ) )
		level._effect = [];
	if ( !isdefined( level._effect[ fxName ] ) )
		level._effect[ fxName ]	= loadfx( fxFile );
	
	// default effect angles if they dont exist
	if ( !isdefined( self.angles ) )
		self.angles = ( 0, 0, 0 );
	
	ent = createOneshotEffect( fxName );
	ent.v[ "origin" ] = ( self.origin );
	ent.v[ "angles" ] = ( self.angles );
	ent.v[ "fxid" ] = fxName;
	ent.v[ "delay" ] = delay;
	if ( isdefined( soundalias ) )
	{
		ent.v[ "soundalias" ] = soundalias;
	}
}