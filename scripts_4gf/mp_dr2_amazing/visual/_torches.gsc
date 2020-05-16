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
	level._effect["fire/torch_small"] = LoadFX("fire/torch_small");

	thread ProcessTorches();
}

ProcessTorches()
{
	eTorches = GetEntArray("torch", "targetname");
	for (i = 0; i < eTorches.size; i++)
		eTorches[i] EProcessTorch();
}

EProcessTorch()
{
	vPos = self GetTagOrigin("tag_fx");
	vAngles = self GetTagAngles("tag_fx");
	
	fx = SpawnFx(level._effect["fire/torch_small"], vPos, AnglesToForward(vAngles), AnglesToUp(vAngles));
	TriggerFX(fx, -5);
	
	self PlayLoopSound("4gf_street_lamp");
}