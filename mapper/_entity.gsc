//I========================================================================I
//I                    ___  _____  _____                                   I
//I                   /   !!  __ \!  ___!                                  I
//I                  / /! !! !  \/! !_          ___  ____                  I
//I                 / /_! !! ! __ !  _!        / __!!_  /                  I
//I                 \___  !! !_\ \! !      _  ! (__  / /                   I
//I                     !_/ \____/\_!     (_)  \___!/___!                  I
//I                                                                        I
//I========================================================================I
// Call of Duty 4: Modern Warfare
//I========================================================================I
// Mod      : Deathrun
// Website  : http://www.4gf.cz/
//I========================================================================I
// Script by: PetX
//I========================================================================I

#include core\include\_usings;
#include custom\include\_usings;

public EListAdd(sListName, e)
{
	self IENTITY::EListAdd(sListName, e);
}

public EListRemove(sListName, e)
{
	self IENTITY::EListRemove(sListName, e);
}

public EListContaints(sListName, e)
{
	return self IENTITY::EListContaints(sListName, e);
}

public EListGetElems(sListName)
{
	return self IENTITY::EListGetElems(sListName);
}