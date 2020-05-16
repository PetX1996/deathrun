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
	TrapActivator(14);
	
	downSlider = GetEnt("t14_brush_0", "targetname");
	upSlider = GetEnt("t14_brush_1", "targetname");
	
	thread AddSlider(downSlider, (4, 0, 0), upSlider);
	thread AddSlider(upSlider, (4, 3, 0), downSlider);
}

AddSlider(ent, startIndex, otherEnt)
{
	ent.lastIndex = startIndex;
	ent.nextIndex = startIndex;
	
	while (true)
	{
		oldnextIndex = ent.nextIndex;
		ent.nextIndex = GetNewIndex(ent, otherEnt);
		
		time = 1;
		if (IsDefined(ent.nextIndex))
		{
			ent.lastIndex = oldnextIndex;
			ent MoveTo(GetOriginForIndex(ent.nextIndex), time);
			ent waittill("movedone");
		}
		else
		{
			ent.nextIndex = oldNextIndex;
			wait time;
		}
	}
}

GetNewIndex(slider, otherSlider)
{
	indexes = GetPossibleNextIndexes(slider.nextIndex);
	
	if (indexes.size > 0)
	{
		ignoreLastIndex = false;
		for (a = 0; a < 2; a++)
		{
			i = RandomInt(indexes.size);
			for (b = 0; b < indexes.size; b++)
			{
				if ((IsDefined(otherSlider.nextIndex) && indexes[i] == otherSlider.nextIndex)
					|| (IsDefined(otherSlider.lastIndex) && indexes[i] == otherSlider.lastIndex)
					|| (!ignoreLastIndex && indexes[i] == slider.lastIndex))
				{
					i++;
					i = i % indexes.size;
					continue;
				}
				else
					return indexes[i];
			}
			ignoreLastIndex = true;
		}
	}
	return undefined;
}

GetPossibleNextIndexes(curIndex)
{
	indexes = [];
	
	right = (curIndex[0] + 1, curIndex[1], 0);
	left = (curIndex[0] - 1, curIndex[1], 0);
	up = (curIndex[0], curIndex[1] + 1, 0);
	down = (curIndex[0], curIndex[1] - 1, 0);
	
	if (IsIndexInGrid(right))	indexes[indexes.size] = right;
	if (IsIndexInGrid(left))	indexes[indexes.size] = left;
	if (IsIndexInGrid(up))		indexes[indexes.size] = up;
	if (IsIndexInGrid(down))	indexes[indexes.size] = down;
	
	return indexes;
}

// (224, 2400, 0)
// (800, 2976, 0)
// 192 x 192

IsIndexInGrid(index)
{
	x = index[0];
	y = index[1];

	if (x < 0 || y < 0)
		return false;
	else if (y > 3)
		return false;
	else if (x > 4 
		|| (x > 3 && (y != 0 || y != 3)))
		return false;

	return true;
}

GetOriginForIndex(index)
{
	cellSize = 192;
	return ((224 + cellSize * index[0]), (2400 + cellSize * index[1]), -626);
}