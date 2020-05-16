// +========================================================================+
// I                    ___  _____  _____                                   I
// I                   /   !!  __ \!  ___!                                  I
// I                  / /! !! !  \/! !_          ___  ____                  I
// I                 / /_! !! ! __ !  _!        / __!!_  /                  I
// I                 \___  !! !_\ \! !      _  ! (__  / /                   I
// I                     !_/ \____/\_!     (_)  \___!/___!                  I
// I                                                                        I
// I========================================================================I
// I                             mp_dr2_view                                I
// I========================================================================I
// I                      mapped by:  Col!ar                                I
// I                    scripted by:  PetX                                  I
// I                        website:  4GF.CZ                                I
// +========================================================================+

#include scripts_4gf\mp_dr2_view\traps\_utility;

Main()
{
	level._effect["mp_dr2_view/ghost2"] = LoadFX("mp_dr2_view/ghost2");

	thread PrepareEnt("t9", "t9t");

	TrapActivator(9);
	
	thread MoveEnt("t9", "t9t", 300);
}

PrepareEnt(sBrush, sTrig)
{
	eBrush = GetEnt(sBrush, "targetname");
	eBrush.origin += (0, 0, -100000);
	eBrush Hide();
	
	eTrig = GetEnt(sTrig, "targetname");
	eTrig.origin += (0, 0, -100000);
}

MoveEnt(sBrush, sTrig, fSpeed)
{
	eBrush = GetEnt(sBrush, "targetname");
	eBrush.origin += (0, 0, 100000);
	
	eTrig = GetEnt(sTrig, "targetname");
	eTrig.origin += (0, 0, 100000);
	
	eModel = Spawn("script_model", eBrush.origin);
	eModel SetModel("tag_origin");
	eModel LinkTo(eBrush);
	
	wait 0.5;
	
	PlayFXOnTag(level._effect["mp_dr2_view/ghost2"], eModel, "tag_origin");
	
	eTrig EnableLinkTo();
	eTrig LinkTo(eBrush);
	
	wait 1;
	
	eTarget = eBrush;
	while (true)
	{
		sTarget = eTarget.target;
		if (!IsDefined(sTarget))
			break;
			
		eTarget = GetEnt(sTarget, "targetname");
		if (!IsDefined(eTarget))
			break;
			
		fDist = Distance(eBrush.origin, eTarget.origin);
		eBrush MoveTo(eTarget.origin, (fDist / fSpeed));
		eBrush waittill("movedone");
	}
	
	eBrush MoveTo(eBrush.origin + (0, 0, -100000), 0.5);
	eBrush waittill("movedone");
	
	eBrush Delete();
	eTrig Delete();
	eModel Delete();
}