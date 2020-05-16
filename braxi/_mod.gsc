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

GiveLife()
{
	self mapper\_lifes::CGive();
}

addTextHud( who, x, y, alpha, alignX, alignY, fontScale, horzAlign, vertAlign )
{
	if( isPlayer( who ) )
		hud = newClientHudElem( who );
	else
		hud = newHudElem();

	hud.x = x;
	hud.y = y;
	hud.alpha = alpha;
	hud.alignX = alignX;
	hud.alignY = alignY;
	hud.fontScale = fontScale;
	if( isDefined( horzAlign ) )
		hud.horzAlign = horzAlign;
	if( isDefined( vertAlign ) )
		hud.vertAlign = vertAlign;
	return hud;
}

gib_splat()
{
	//self hide();
	//self playSound( "gib_splat" );
	//playFx( level.fx["gib_splat"], self.origin + (0,0,20) );
	//self delete();
}

respawn()
{
	//self endon( "disconnect" );
	//self endon( "spawned_player" );
	//self endon( "joined_spectators" );

	/*if( level.freeRun || !game["roundStarted"] )
	{
		wait 0.1;
		self spawnPlayer();
		return;
	}*/

	/*if( self canSpawn() && self.pers["team"] == "allies" )
	{
		wait 0.5;

		if( game["state"] != "playing" )
			return;
		self setLowerMessage( &"PLATFORM_PRESS_TO_SPAWN" );
	
		while( !self useButtonPressed() )
			wait .05;

		if( game["state"] != "playing" )
			return;

		self thread useLife();
	}*/
	
	if (self.pers["team"] == "allies" && C_IGLSTATE::IsINReleased("allies"))
		self thread C_ICLIFES::CLifeButtonWaitting();
}