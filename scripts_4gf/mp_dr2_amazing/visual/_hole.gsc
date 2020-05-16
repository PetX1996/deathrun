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
	trig = GetEnt("v_hole_trig", "targetname");
	brushes = GetEntArray("v_hole_brush", "targetname");
	
	trig waittill("trigger");
	
	for (i = 0; i < brushes.size; i++)
		thread MoveEnt(brushes[i]);
}

MoveEnt(brush)
{
	wait RandomFloat(0.3);
	
	brush NotSolid();
	
	target = GetEnt(brush.target, "targetname");
	time = Distance(target.origin, brush.origin) / RandomFloatRange(400, 450);
	
	Earthquake(0.6, 1, brush.origin, 64);
	
	brush MoveTo(target.origin, time, time * 0.2, 0);
	brush waittill("movedone");
	
	Earthquake(0.4, 1, brush.origin, 128);
}


