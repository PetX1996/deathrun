//////////////////////////////////////////////////////////////
//////////////////////map by jerkan///////////////////////////
//////////////////////////////////////////////////////////////
/////////////////////XFire: jerkan18//////////////////////////
//////////////////////////////////////////////////////////////
///////////////////e-mail: jerkan@net.hr//////////////////////
//////////////////////////////////////////////////////////////
////////////////www.jerkanmaps.weebly.com/////////////////////
//////////////////////////////////////////////////////////////

main()
{

	thread trap14();

}


trap14()

{

	zid1_t14 = getEnt( "zid1_t14", "targetname" );
	zid2_t14 = getEnt( "zid2_t14", "targetname" );
	zid3_t14 = getEnt( "zid3_t14", "targetname" );
	zid4_t14 = getEnt( "zid4_t14", "targetname" );
	kill_1 = getEnt( "kill_t14_1", "targetname" );
	kill_2 = getEnt( "kill_t14_2", "targetname" );
	kill_3 = getEnt( "kill_t14_3", "targetname" );
	kill_4 = getEnt( "kill_t14_4", "targetname" );

	trig_t14 = getEnt( "trap14_trigger", "targetname" );
	brush1t14 = getEnt( "trap14_upitnik", "targetname" );
	brush2t14 = getEnt( "trap14_blok", "targetname" );
	brush3t14 = getEnt( "trap14_uputa", "targetname" );
	fxt14 = getent ( "t14_fx" ,"targetname" ); //origin


	kill_1 enableLinkTo();
	kill_1 linkTo( zid1_t14 );

	kill_2 enableLinkTo();
	kill_2 linkTo( zid2_t14 );

	kill_3 enableLinkTo();
	kill_3 linkTo( zid3_t14 );

	kill_4 enableLinkTo();
	kill_4 linkTo( zid4_t14 );

	trig_t14 waittill("trigger", other);

	trig_t14 delete();
	brush1t14 delete();
	brush3t14 delete();
	brush2t14 movez( -32, 0.4 );

	fx = PlayFX( level._effect["artillery_flash"], fxt14.origin );
	fxt14 PlaySound("blockhit");

	while( 1 )
	{

	
	zid3_t14 movex( 80, 1 );
	zid4_t14 movex( -80, 1 );

	zid1_t14 movex( 80, 3 );
	zid2_t14 movex( -80, 3 );
	zid1_t14 PlaySound("bigdoor");

	wait 4;

	zid1_t14 movex( -80, 1 );
	zid2_t14 movex( 80, 1 );

	zid3_t14 movex( -80, 3 );
	zid4_t14 movex( 80, 3 );
	zid3_t14 PlaySound("bigdoor");

	wait 4;
	}


}