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

#include core\include\_usings;
#include custom\include\_usings;

Main()
{
	BuildMap();
}

BuildMap()
{
	sPortal = "";
	sDelete = "";
	iTime = 2 * 60;
	
	// =============================================================== //
	// w0_0
	sPortal += "p_w0_0;";
	iTime += 0;
	
	// =============================================================== //
	// w0
	if (RandomInt(100) % 2) // w0_p0
	{
		sPortal += "p_w0_p0_a;p_w0_p0_b;";
		sDelete += "t4;zaval_0;door_0;door_1;p_w0_p1_a;p_w0_p1_b;";
		iTime += 30;
	}
	else // w0_p1
	{
		sPortal += "p_w0_p1_a;p_w0_p1_b;";
		sDelete += "t3;p_w0_p0_a;p_w0_p0_b;";
		iTime += 30;
	}
	
	// =============================================================== //
	// w0_1
	
	
	// =============================================================== //
	// w1
	if (RandomInt(100) % 2) // w1_p0
	{
		sPortal += "p_w1_p0_a;p_w1_p0_b;";
		sDelete += "t6;t7;t8;zaval_1;door_2;door_6;p_w1_p1_a;p_w1_p1_b;p_w1_p1_c;p_w1_p1_d;door_3;door_4;door_5;";
		iTime += 30;
		
		if (RandomInt(100) % 2) // w1_w0_p0
		{
			sPortal += "p_w1_w0_p0_a;p_w1_w0_p0_b;p_w1_w0_p0_c;p_w1_w0_p0_d;p_w1_w0_p0_e;p_w1_w0_p0_f;";
			sDelete += "";
			iTime += 30;
		}
		else // w1_w0_p1
		{
			sPortal += "";
			sDelete += "t9;t10;t11;zaval_2;door_7;door_8;p_w1_w0_p0_a;p_w1_w0_p0_b;p_w1_w0_p0_c;p_w1_w0_p0_d;p_w1_w0_p0_e;p_w1_w0_p0_f;";
			iTime += 30;
		}
	}
	else // w1_p1
	{
		sPortal += "p_w1_p1_a;p_w1_p1_b;p_w1_p1_c;p_w1_p1_d;";
		sDelete += "t5;t9;t10;t11;door_7;door_8;p_w1_p0_a;p_w1_p0_b;p_w1_w0_p0_a;p_w1_w0_p0_b;p_w1_w0_p0_c;p_w1_w0_p0_d;p_w1_w0_p0_e;p_w1_w0_p0_f;";
		iTime += 30;
		
		if (RandomInt(100) % 2) // w1_w1_p0
		{
			sPortal += "";
			sDelete += "door_4;";
			iTime += 30;
		}
		else // w1_w1_p1
		{
			sPortal += "";
			sDelete += "door_3;";
			iTime += 30;
		}
	}
	
	// =============================================================== //
	// w1_2
	
	// =============================================================== //
	// w2
	if (RandomInt(100) % 2) // w2_p0
	{
		sPortal += "p_w2_p0_a;p_w2_p0_b;";
		sDelete += "";
		iTime += 30;
	}
	else // w2_p1
	{
		sPortal += "";
		sDelete += "t12;t13;zaval_3;door_9;door_10;p_w2_p0_a;p_w2_p0_b;";
		iTime += 30;
	}
	
	// =============================================================== //
	// w2_3
	sPortal += "p_w2_3_a;p_w2_3_b;";
	
	// =============================================================== //
	// w3
	
	if (RandomInt(100) % 2) // w3_p0
	{
		sPortal += "p_w3_p0_a;p_w3_p0_b;";
		sDelete += "t18;";
		iTime += 30;
	}
	else // w3_p1
	{
		sPortal += "";
		sDelete += "t16;t17;zaval_4;door_11;p_w3_p0_a;p_w3_p0_b;";
		iTime += 30;
		
		if (RandomInt(100) % 2) // w3_w0_p0
		{
			sPortal += "";
			sDelete += "sachta_0;";
			iTime += 30;
		}
		else // w3_w0_p1
		{
			sPortal += "";
			sDelete += "zaval_5;";
			iTime += 30;
		}
	}
	
	// =============================================================== //
	// w3_4
	sPortal += "p_w3_4_a;p_w3_4_b;";
	
	// =============================================================== //
	// w4
	if (RandomInt(100) % 2) // w4_p0
	{
		sPortal += "p_w4_p0_a;p_w4_p0_b;";
		sDelete += "";
		iTime += 30;
	}
	else // w4_p1
	{
		sPortal += "";
		sDelete += "t19;t20;zaval_6;door_12;door_13;p_w4_p0_a;p_w4_p0_b;";
		iTime += 30;
	}
	
	// =============================================================== //
	// w4_5
	sPortal += "p_w4_5_a;p_w4_5_b;";
	
	// =============================================================== //
	// w5
	if (RandomInt(100) % 2) // w5_p0
	{
		sPortal += "p_w5_p0_a;p_w5_p0_b;";
		sDelete += "t23;door_14;p_w5_p1_a;p_w5_p1_b;";
		iTime += 30;
	}
	else // w5_p1
	{
		sPortal += "p_w5_p1_a;p_w5_p1_b;";
		sDelete += "t24;door_15;p_w5_p0_a;p_w5_p0_b;";
		iTime += 30;
	}
	
	// =============================================================== //
	// w6
	if (RandomInt(100) % 2) // w6_0
	{
		sDelete += "mrize_f;";
		iTime += 30;
	}
	else // w6_1
	{
		sDelete += "stena_f;";
		iTime += 30;
	}
	
	
	api\gamelogic\_classic::RegTimeLimit(iTime / 60);
	
	deletes = StrTok(sDelete, ";");
	foreach (sDelete in deletes)
	{
		if (sDelete == "")
			continue;
			
		eEnt = GetEnt(sDelete, "targetname");
		IEXCEPTION::EntityExist(eEnt, sDelete);
		eEnt Delete();
	}
	
	scripts_4gf\mp_dr2_amazing\_ports::BuildPorts(StrTok(sPortal, ";"));
}