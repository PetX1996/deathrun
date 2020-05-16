/*QUAKED mp_dm_spawn (1.0 0.5 0.0) (-16 -16 0) (16 16 72)
Players spawn away from enemies at one of these positions.*/

Main()
{
	if(getdvar("mapname") == "mp_background")
		return;
	
	maps\mp\gametypes\_callbacksetup::SetupCallbacks();
	custom\_init::Init();
}