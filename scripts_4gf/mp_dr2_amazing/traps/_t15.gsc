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

#include scripts_4gf\mp_dr2_amazing\traps\_utility;

Main()
{
	TrapActivator(15);
	
	SelectEnts();
}

SelectEnts()
{
	totalRows = 4;
	safeRow = RandomInt(totalRows);

	unsafeBrushs = [];
	
	for(rowI = 0; rowI < totalRows; rowI++)
	{
		if (rowI == safeRow)
			continue;
			
		brushs = GetEntArray("t15_brush_" + rowI, "targetname");
		
		if (!IsDefined(unsafeBrushs))
			unsafeBrushs = brushs;
		else
		{
			for (i = 0; i < brushs.size; i++)
				unsafeBrushs[unsafeBrushs.size] = brushs[i];
		}
	}
	
	unsafeFraction = 0.5;
	pickedBrushes = [];

	while (pickedBrushes.size / unsafeBrushs.size < unsafeFraction)
	{
		ent = unsafeBrushs[RandomInt(unsafeBrushs.size)];
		if (Contains(pickedBrushes, ent))
			continue;
		else
			pickedBrushes[pickedBrushes.size] = ent;
	}
	
	for (i = 0; i < pickedBrushes.size; i++)
		thread MoveEnt(pickedBrushes[i]);
}

Contains(array, obj)
{
	for (i = 0; i < array.size; i++)
		if (array[i] == obj)
			return true;
			
	return false;
}

MoveEnt(brush)
{
	wait RandomFloat(2);
	brush MoveZ(-160, RandomFloatRange(0.3, 0.8));
}