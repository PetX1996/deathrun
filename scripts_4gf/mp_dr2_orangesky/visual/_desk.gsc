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
	MoveEnt("desk", 
	-512, // fDist
	2); // fTime
}

MoveEnt(sName, fDist, fTime)
{
	eBrush = GetEnt(sName, "targetname");
	
	fDir = 1;
	while (true)
	{
		eBrush MoveX(fDist * fDir, fTime);
		eBrush waittill("movedone");
		
		fDir *= -1;
	}
}