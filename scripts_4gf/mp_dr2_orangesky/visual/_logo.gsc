// +========================================================================+
// I                    ___  _____  _____                                   I
// I                   /   !!  __ \!  ___!                                  I
// I                  / /! !! !  \/! !_          ___  ____                  I
// I                 / /_! !! ! __ !  _!        / __!!_  /                  I
// I                 \___  !! !_\ \! !      _  ! (__  / /                   I
// I                     !_/ \____/\_!     (_)  \___!/___!                  I
// I                                                                        I
// I========================================================================I
// I                            mp_dr2_orangesky                            I
// I========================================================================I
// I                      mapped by:  Col!ar                                I
// I                    scripted by:  PetX                                  I
// I                        website:  4GF.CZ                                I
// +========================================================================+

Main()
{
	FindEnts("4gf", 
	0.1, // fMinTimeMin
	0.2, // fMinTimeMax
	1, // fMaxTimeMin
	1.5, // fMaxTimeMax
	0.01, // fIncTimeMin
	0.05); // fIncTimeMax
}

FindEnts(sName, fMinTimeMin, fMinTimeMax, fMaxTimeMin, fMaxTimeMax, fIncTimeMin, fIncTimeMax)
{
	eBrushes = GetEntArray(sName, "targetname");
	for (i = 0; i < eBrushes.size; i++)
	{
		fMinTime = fMinTimeMin;
		if (fMinTimeMin != fMinTimeMax)
			fMinTime = RandomFloatRange(fMinTimeMin, fMinTimeMax);
			
		fMaxTime = fMaxTimeMin;
		if (fMaxTimeMin != fMaxTimeMax)
			fMaxTime = RandomFloatRange(fMaxTimeMin, fMaxTimeMax);

		fIncTime = fIncTimeMin;
		if (fIncTimeMin != fIncTimeMax)
			fIncTime = RandomFloatRange(fIncTimeMin, fIncTimeMax);			
			
		eBrushes[i] thread RotateEnt(fMinTime, fMaxTime, fIncTime);
	}
}

RotateEnt(fMinTime, fMaxTime, fIncTime)
{
	fTime = fMinTime;
	while (true)
	{
		self RotateYaw(5, fTime);
		wait fTime;
		
		if (fTime <= fMinTime || fTime >= fMaxTime)
			fIncTime *= -1;
		
		fTime += fIncTime;
	}
}