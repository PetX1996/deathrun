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
	
	Website: www.braxi.net
	E-mail: paulina1295@o2.pl

	[DO NOT COPY WITHOUT PERMISSION]
*/

/*QUAKED dr2_spawn_jumper (0.0 1.0 0.0) (-16 -16 0) (16 16 72)
Jumpers spawn point.
Jumpers spawn randomly at one of these positions.
*/

/*QUAKED dr2_spawn_activator (1.0 0.0 0.0) (-16 -16 0) (16 16 72)
Activators spawn point.
Activators spawn randomly at one of these positions.
*/

/*QUAKED dr2_spawn_spectator (1.0 1.0 1.0) (-16 -16 -16) (16 16 16)
Spectator spawn point.
Spectators spawn randomly at one of these positions.
*/


/*QUAKED dr2_t_endmap (0.0 1.0 1.0)
Signals to the mod that player finishes the map.

default:"classname" "trigger_multiple"
default:"targetname" "dr2_t_endmap"
*/

/*QUAKED dr2_t_index (0.0 1.0 1.0)
Trigger for a trap's activation.
Replace "index" in the targetname with the number,
from zero to infinity.

default:"classname" "trigger_use_touch"
default:"targetname" "dr2_t_index"
*/

/*QUAKED dr2_t_jumper (1.0 0.0 1.0)
Trigger linked with the trap trigger for the jumpers.
Select the trap trigger, then select this, press W.

default:"classname" "trigger_multiple"

/*QUAKED dr2_t_tj (1.0 0.0 1.0)
First TJ without any TT.

default:"classname" "trigger_multiple"
default:"targetname" "dr2_t_tj"
*/

Main()
{
	if(getdvar("mapname") == "mp_background")
		return;
	
	maps\mp\gametypes\_callbacksetup::SetupCallbacks();
	custom\_init::Init();
}