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

public sealed iBitsInInt = 31;

public Pow(num, e)
{
	if(e == 0)
		return 1;

	result = 1;
	while (e != 0)
	{
		if (e > 0)
		{
			result *= num;
			e--;
		}
		else
		{
			result /= num;
			e++;
		}
	}
	return result;
}

public Pow2(iExponent)
{
	switch (iExponent)
	{
		case 0:
			return 1;
		case 1:
			return 2;
		case 2:
			return 4;
		case 3:
			return 8;
		case 4:
			return 16;
		case 5:
			return 32;
		case 6:
			return 64;
		case 7:
			return 128;
		case 8:
			return 256;
		case 9:
			return 512;
		case 10:
			return 1024;
		case 11:
			return 2048;
		case 12:
			return 4096;
		case 13:
			return 8192;
		case 14:
			return 16384;
		case 15:
			return 32768;
		case 16:
			return 65536;
		case 17:
			return 131072;
		case 18:
			return 262144;
		case 19:
			return 524288;
		case 20:
			return 1048576;
		case 21:
			return 2097152;
		case 22:
			return 4194304;
		case 23:
			return 8388608;
		case 24:
			return 16777216;
		case 25:
			return 33554432;
		case 26:
			return 67108864;
		case 27:
			return 134217728;
		case 28:
			return 268435456;
		case 29:
			return 536870912;
		case 30:
			return 1073741824;
		default:
			return Pow(2, iExponent);
	}
}

public CountSetBits(iBits, [iLength])
{
	if (!IsDefined(iLength))
		iLength = iBitsInInt;
	
	iSet = 0;
	for (i = 0; i < iLength; i++)
	{
		iSet += (iBits & 1);
		iBits >>= 1;
	}
	
	return iSet;
}

public DictanceZ(vecA, vecB)
{
	return Abs(vecA[2] - vecB[2]);
}

public AnglesToPositive(vAngles)
{
	for (i = 0; i < 3; i++)
		AngleToPositive(vAngles[i]);

	return vAngles;
}

public AngleToPositive(iAngle)
{
	if (iAngle < 0)
		iAngle = 360 + iAngle;

	return iAngle;
}

public Clamp(n, min, max)
{
	if (n < min)
		return min;
	else if (n > max)
		return max;
	
	return n;
}

SQRT()
{
	IEXCEPTION::NotImplemented();
}

public Round(fNum/*, iDecimalPos*/)
{
	iNum = Int(fNum);
	if (fNum - iNum < 0.5)
		return iNum;
	
	return iNum + 1;

	//IEXCEPTION::NotImplemented("Fuck it!");

	// TODO: try to fix it...
	// Am I idiot or COD cannot work with float numbers?!

	// 47|6|887.14654 (iDecimalPos = -3) 	-> 477000
	// 476|8|87.14654 (iDecimalPos = -2) 	-> 476900
	// 4768|8|7.14654 (iDecimalPos = -1) 	-> 476890
	// 47688|7|.14654 (iDecimalPos = 0) 	-> 476887
	// 476887.|1|4654 (iDecimalPos = 1) 	-> 476887.1
	// 476887.1|4|654 (iDecimalPos = 2) 	-> 476887.15
	// 476887.14|6|54 (iDecimalPos = 3) 	-> 476887.147
	
	// 476887.1|4|654 -> iDec = 100
	// 476887.1|4|654 * iDec -> iRest = Int(4768871|4|.654) -> 4768871|4|
	// 476887.1|4|654 * iDec * 10 -> iMarginal = Int(4768871|4|6.54 - (iRest(4768871|4|) * 10)) -> 6
	// 6 is higher than 5 -> iRest += 1 -> iRest = 4768871|5|
	// iRest / iDec -> iRest = 476887.1|5|
	
	// 476|8|87.14654 -> iDec = 100
	// 476|8|87.14654 / iDec -> iRest = Int(476|8|.8714654) -> 476|8|
	// 476|8|87.14654 / iDec * 10 -> iMarginal = Int(476|8|8.714654 - (iRest(476|8|) * 10)) -> 8
	// 8 is higher than 5 -> iRest += 1 -> iRest = 476|9|
	// iRest * iDec -> iRest = 476|9|00
	
	// 47688|7|.14654 -> iDec = 1
	// 47688|7|.14654 * iDec -> iRest = Int(47688|7|.14654) -> 47688|7|
	// 47688|7|.14654 * iDec * 10 -> iMarginal = Int(47688|7|1.4654 - (iRest(47688|7|) * 10)) -> 1
	// 1 is lower than 5 -> iRest += 0 -> iRest = 47688|7|
	// iRest / iDec -> iRest = 47688|7|
	
	/*iDec = GetRoundDec(Int(Abs(iDecimalPos)));
	iRest = undefined;
	if (iDecimalPos >= 0)
		iRest = Int(num * iDec);
	else
		iRest = Int(num / iDec);
	
	iprintln("iDec" + iDec);
	iprintln("iRest" + iRest);
	iprintln("num * iDec" + num * iDec);
	iprintln("Int(num * iDec)" + Int(num * iDec));
	
	iMarginal = undefined;
	if (iDecimalPos >= 0)
		iMarginal = num * iDec;
	else
		iMarginal = num / iDec;

	iMarginal = Int((iMarginal * 10) - (iRest * 10));
	if (iMarginal >= 5)
		iRest += 1;
		
	if (iDecimalPos >= 0)
		return iRest / iDec;
	
	return iRest * iDec;*/
}

private GetRoundDec(iDecimalPos)
{
	switch (iDecimalPos)
	{
		case 0:
			return 1;
		case 1:
			return 10;
		case 2:
			return 100;
		case 3:
			return 1000;
		case 4:
			return 10000;
		case 5:
			return 100000;
		case 6:
			return 1000000;
		case 7:
			return 10000000;
		case 8:
			return 100000000;
		case 9:
			return 1000000000;		
		default:
			return Pow(10, iDecimalPos);
	}	
}

/// <summary>
/// Returns a vector which is perpendicular to vA and vB.
/// </summary>
/// <returns></returns>
/// <param name="vA"></param>
/// <param name="vB"></param>
public VectorCross(vA, vB)
{
	return (vA[1] * vB[2] - vA[2] * vB[1], 
			vA[2] * vB[0] - vA[0] * vB[2],
			vA[0] * vB[1] - vA[1] * vB[0]);
}

public MultiplyMatrices(mA, mB)
{
	IEXCEPTION::Argument(mA[0].size == mB.size);

	matrix = [];
	for (iMARow = 0; iMARow < mA.size; iMARow++)
	{
		for (iMBColumn = 0; iMBColumn < mB[0].size; iMBColumn++)
		{
			value = 0;
			for (iCur = 0; iCur < mB.size; iCur++)
			{
				a = mA[iMARow][iCur];
				b = mB[iCur][iMBColumn];
				
				value += a * b;
			}
			
			matrix[iMARow][iMBColumn] = value;
		}
	}
	return matrix;
}

public PrintMatrix(m)
{
	iprintln("matrix " + m.size + "x" + m[0].size);
	for (i = 0; i < m.size; i++)
	{
		line = "{";
		
		for (j = 0; j < m[i].size; j++)
		{
			line += " " + m[i][j];
			if (j == m[i].size - 1)
				line += " ";
			else
				line += ",";
		}
		
		line += "}";
		iprintln(line);
	}
}