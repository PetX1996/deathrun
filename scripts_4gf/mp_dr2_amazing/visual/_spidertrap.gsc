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

Main()
{
	trig = GetEnt("v_spidertrap_trig", "targetname");
	model = GetEnt("v_spidertrap_model", "targetname");

	startOrigin = model.origin;
	
	trig waittill("trigger", player);
	
	model MoveTo(player GetTagOrigin("head"), 0.3);
	model waittill("movedone");
	model Delete();
	
	if (IsDefined(player) && IsAlive(player))
		player FinishPlayerDamage(player, player, 60, 0, "MOD_TRIGGER_HURT", "none", player.origin, VectorNormalize(startOrigin - player.origin), "head", 0);
}

Main2()
{
	trig = GetEnt("v_spidertrap2_trig", "targetname");
	model = GetEnt("v_spidertrap2_model", "targetname");

	startOrigin = model.origin;
	
	trig waittill("trigger", player);
	
	model MoveTo(player GetTagOrigin("head"), 0.3);
	model waittill("movedone");
	model Delete();
	
	if (IsDefined(player) && IsAlive(player))
		player FinishPlayerDamage(player, player, 60, 0, "MOD_TRIGGER_HURT", "none", player.origin, VectorNormalize(startOrigin - player.origin), "head", 0);
}
