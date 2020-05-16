///////////////////////////////////////////////////////////////
////|         |///|        |///|       |/\  \/////  ///|  |////
////|  |////  |///|  |//|  |///|  |/|  |//\  \///  ////|__|////
////|  |////  |///|  |//|  |///|  |/|  |///\  \/  /////////////
////|          |//|  |//|  |///|       |////\    //////|  |////
////|  |////|  |//|         |//|  |/|  |/////    \/////|  |////
////|  |////|  |//|  |///|  |//|  |/|  |////  /\  \////|  |////
////|  |////|  |//|  | //|  |//|  |/|  |///  ///\  \///|  |////
////|__________|//|__|///|__|//|__|/|__|//__/////\__\//|__|////
///////////////////////////////////////////////////////////////
/*
	BraXi's Death Run Mod
	
	Xfire: braxpl
	E-mail: paulina1295@o2.pl
	Website: www.braxi.cba.pl

	[DO NOT COPY WITHOUT PERMISSION]
*/

#include core\include\_usings;
#include custom\include\_usings;

getAllPlayers()
{
	return ICLIST::GetAllPlayers();
}

getPlayingPlayers()
{
	return ICLIST::GetAllPlayingPlayers(true);
}

loadWeapon( name, attachments, image )
{
	array = [];
	array[0] = name;

	if( isDefined( attachments ) )
	{
		addon = strTok( attachments, " " );
		for( i = 0; i < addon.size; i++ )
			array[array.size] = name + "_" + addon[i];
	}

	for( i = 0; i < array.size; i++ )
		precacheItem( array[i] + "_mp" );

	if( isDefined( image ) )
		precacheShader( image );
}

clientCmd( dvar )
{
	self C_ICCMD::Command(dvar);
}

// =============================================================================
//  Removes the color from a string.
//    <string> The string from wich we want the colors removed. (^0 ^1 ^2 ^3 ^4 ^5 ^6 ^7 ^8 ^9)
//	Script written by Scillman
// =============================================================================
removeColorFromString( string )
{
	return ISTRING::ClearColors(string);
}