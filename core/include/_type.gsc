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
// Mod      : Core
// Website  : http://www.4gf.cz/
//I========================================================================I
// Script by: PetX
//I========================================================================I

#include core\include\_usings;

public sealed TYPE_BOOL = 0; // b
public sealed TYPE_INTEGER = 1; // i
public sealed TYPE_FLOAT = 2; // f
public sealed TYPE_DELEGATE = 3; // d
public sealed TYPE_UBOOL = 4; // u

public sealed TYPE_VECTOR = 5; // v
public sealed TYPE_ARRAY = 6;
public sealed TYPE_STRING = 7; // s

public sealed TYPE_STRUCT = 10;
public sealed TYPE_ENTITY = 11; // e
public sealed TYPE_PLAYER = 12; // p
public sealed TYPE_HUDELEMENT = 13;

public UBoolToBool(uBool)
{
	return IsDefined(uBool) && uBool;
}

public BoolToUBool(bBool)
{
	if (bBool)
		return true;
		
	return undefined;
}

public StrToInt(str)
{
	if (!IsDefined(str))
		return;

	return Int(str);
}

public StrToFloat(str)
{
	if (!IsDefined(str))
		return;

	SetDvar("StrToFloat", str);
	return GetDvarFloat("StrToFloat");
}

public StrToVec(str)
{
	if (!IsDefined(str))
		return;

	defaultVal = (0,0,0);
	
	startI = ISTRING::IndexOf(str, "(");
	if (startI == -1) return defaultVal;
	
	firstColumnI = ISTRING::IndexOf(str, ",", startI + 1);
	if (firstColumnI == -1) return defaultVal;
	
	secondColumnI = ISTRING::IndexOf(str, ",", firstColumnI + 1);
	if (secondColumnI == -1) return defaultVal;
	
	endI = ISTRING::IndexOf(str, ")", secondColumnI + 1);
	if (endI == -1) return defaultVal;
	
	first = ISTRING::Trim(GetSubStr(str, startI + 1, firstColumnI));
	second = ISTRING::Trim(GetSubStr(str, firstColumnI + 1, secondColumnI));
	third = ISTRING::Trim(GetSubStr(str, secondColumnI + 1, endI));
	return (StrToFloat(first), StrToFloat(second), StrToFloat(third));
}

public IntToStr(int)
{
	if (!IsDefined(int))
		return;

	return "" + int;
}

public FloatToStr(float)
{
	if (!IsDefined(float))
		return;

	return "" + float;
}

public VecToStr(vec)
{
	if (!IsDefined(vec))
		return;

	return "(" + vec[0] + ", " + vec[1] + ", " + vec[2] + ")";
}

public FloatToInt(float)
{
	if (!IsDefined(float))
		return;

	return Int(float);
}

public IsEqual(a, b)
{
	if (!IsDefined(a) && !IsDefined(b))
		return true;
	else if (IsDefined(a) && !IsDefined(b))
		return false;
	else if (!IsDefined(a) && IsDefined(b))
		return false;
	else
		return a == b;
}

public CompareFloat(fA, fB)
{
	if (!IsDefined(fA) && !IsDefined(fB))
		return 0;
	else if (!IsDefined(fA))
		return 1;
	else if (!IsDefined(fB)) 
		return -1;

	if (fA > fB)
		return -1;
	else if (fA < fB)
		return 1;
	else
		return 0;
}