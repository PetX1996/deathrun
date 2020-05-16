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
	PreCacheMenu( "connect_4gf" );
	thread GetAllBillboards();
}

GetAllBillboards()
{
	billboards = getEntArray( "4gf_billboard", "targetname" );
	
	if( billboards.size )
	{
		thread MonitorPlayersLook( billboards );
		thread MonitorPlayersKeyboard();
	}
}

MonitorPlayersLook( billboards )
{
	while( true )
	{
		wait 0.1;
		
		players = getEntArray( "player", "classname" );
		for( p = 0;p < players.size;p++ )
		{
			player = players[p];
			
			if( !isDefined( player ) || !isPlayer( player ) )
				continue;
	
			angles = player GetPlayerAngles();
			origin = player GetPlayerOrigin();
	
			start = origin;
			end = origin + ( AnglesToForward( angles ) * 10000 );
			trace = BulletTrace( start, end, true, player );
	
			player.lookAtBillboard = undefined;
			if( isDefined( trace["entity"] ) )
			{
				for( b = 0;b < billboards.size;b++ )
				{
					if( trace["entity"] == billboards[b] )
					{
						player.lookAtBillboard = true;
						break;
					}
				}
			}
			
			if( isDefined( player.lookAtBillboard ) )
			{
				if( !isDefined( player.lookAtBillboardTime ) )
					player.lookAtBillboardTime = 0;
			
				player.lookAtBillboardTime++;
				
				if( player.lookAtBillboardTime >= 30 && ( !isDefined( player.lookAtBillboardNotifyTime ) || GetTime()-player.lookAtBillboardNotifyTime >= 5000 ) )
				{
					player.lookAtBillboardNotifyTime = GetTime();
					player iprintlnbold( "Press [^3[{+attack}]^7] to connect on ^34GF.CZ ^7servers." );
				}
			}
			else
			{
				player.lookAtBillboardTime = 0;
			}
		}
	}
}

MonitorPlayersKeyboard()
{
	while( true )
	{
		wait 0.1;
		
		players = GetEntArray( "player", "classname" );
		for( p = 0;p < players.size;p++ )
		{
			player = players[p];
			
			if( !isDefined( player ) || !isPlayer( player ) )
				continue;
				
			if( !isDefined( player.lookAtBillboard ) )
				continue;
				
			if( !player AttackButtonPressed() )
				continue;
				
			player thread onOpenMenu();
		}
	}
}

GetPlayerOrigin()
{
	if( self.pers["team"] == "spectator" )
		return self.origin;
	else
		return self GetEye();
}

onOpenMenu()
{
	self openMenu( "connect_4gf" );
}