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

public Equals(strA, strB, [ignoreCase], [compareCharFunc])
{
	IEXCEPTION::NotImplemented();
}

/// <summary>
/// Naturally compares two strings. 
/// </summary>
/// <returns>Returns -1 if strA is less than strB, 0 if they are equal 
/// and 1 if strA is greater than strB</returns>
/// <param name="strA"></param>
/// <param name="strB"></param>
/// <param name="ignoreCase"></param>
/// <param name="strAIndex"></param>
/// <param name="strBIndex"></param>
/// <param name="length"></param>
/// <param name="compareCharFunc"></param>
public Compare(strA, strB, [ignoreCase], [strAIndex], [strBIndex], [length], [compareCharFunc])
{
	IEXCEPTION::NotImplemented();
}

/// <summary>
/// Compares two strings by evaluating the numeric values of their chars.
/// </summary>
/// <returns>Returns -1 if strA is less than strB, 0 if they are equal 
/// and 1 if strA is greater than strB</returns>
/// <param name="strA"></param>
/// <param name="strB"></param>
/// <param name="ignoreCase"></param>
/// <param name="strAIndex"></param>
/// <param name="strBIndex"></param>
/// <param name="length"></param>
public CompareOrdinal(strA, strB, [ignoreCase], [strAIndex], [strBIndex], [length])
{
	IEXCEPTION::NotImplemented();
}

/// <summary>
/// Replaces each format item in a str with the text equivalent 
/// of a corresponding value from a valuesList.
/// Replaces each "{sName, arg, arg, arg, ...}" with corresponding value.
/// </summary>
/// <returns>String</returns>
/// <param name="sSource">String</param>
/// <param name="dVarFunc">string func(sName, args)</param>
public Format(sSource, dVarFunc)
{
	IEXCEPTION::Undefined(sSource);
	IEXCEPTION::Undefined(dVarFunc);
	
	sFinal = "";
	
	toks = StrTok(sSource, "{");
	foreach (sCur in toks)
	{
		subToks = StrTok(sCur, "}");
		if (subToks.size > 2)
			return sSource;
		else if (IsSubStr(sCur, "}"))
		{
			varArgs = StrTok(subToks[0], ",");
			sVarName = varArgs[0];
			sVarValue = [[dVarFunc]](sVarName, varArgs);
			if (!IsDefined(sVarValue))
				sVarValue = "{" + sVarName + "}";
			
			if (subToks.size == 2)
				sFinal += sVarValue + subToks[1];
			else
				sFinal += sVarValue;
		}
		else if (subToks.size == 1)
			sFinal += subToks[0];
		else
			return sFinal;
	}
	
	return sFinal;
}

/// <summary>
/// Replaces each format item in a str with the text equivalent 
/// of a corresponding value from a funcsList.
/// Replaces each "{key from funcsList}" with corresponding value 
/// got from function in a funcsList.
/// </summary>
/// <returns>String</returns>
/// <param name="str">String</param>
/// <param name="funcsList">String[] - Searches each key occurence in a str 
/// and replaces its with a corresponding value got from function.
/// A function returns string and has one optional parameter defined 
/// in a format item with ":" -> "{key:parameter}"</param>
public FormatFunc(str, funcsList)
{
	IEXCEPTION::Undefined(str);
	IEXCEPTION::Undefined(funcsList);
	
	if (funcsList.size == 0)
		return str;
	
	startI = 0;
	while (true)
	{
		startI = IndexOf(str, "{", startI);
		if (startI == -1)
			break;
			
		endI = IndexOf(str, "}", startI + 1);
		if (endI == -1)
			break;

		newValue = undefined;
		content = GetSubStr(str, startI + 1, endI);
		totalLength = content.size + 2;
		newValueFunc = funcsList[content];
		if (IsDefined(newValueFunc))
		{
			additionalParam = undefined;
			additionalParamI = IndexOf(content, ":");
			if (additionalParamI != -1)
				additionalParam = GetSubStr(content, additionalParamI + 1);
		
			newValue = [[newValueFunc]](additionalParam);
			str = Remove(str, startI, totalLength);
			str = Insert(str, startI, newValue);
		}
		
		startI += newValue.size;
	}
	return str;
}

/// <summary>
/// Right-aligns text. Fills the left side of a str with a strForPad 
/// to a specified totalWidth.
/// </summary>
/// <returns>String</returns>
/// <param name="str">String</param>
/// <param name="totalWidth">Int - Total length of a final string</param>
/// <param name="strForPad">String - Single character. Default is space</param>
public PadLeft(str, totalWidth, [strForPad])
{
	IEXCEPTION::Undefined(str, "str");
	IEXCEPTION::Undefined(totalWidth, "totalWidth");
	
	if (!IsDefined(strForPad)) strForPad = " ";

	IEXCEPTION::Argument(strForPad.size == 1, "strForPad");
	
	return _GetStrForPad(str, totalWidth, strForPad) + str;
}

/// <summary>
/// Left-aligns text. Fills the right side of a str with a strForPad 
/// to a specified totalWidth.
/// </summary>
/// <returns>String</returns>
/// <param name="str">String</param>
/// <param name="totalWidth">Int - Total length of a final string</param>
/// <param name="strForPad">String - Single character. Default is space</param>
public PadRight(str, totalWidth, [strForPad])
{
	IEXCEPTION::Undefined(str, "str");
	IEXCEPTION::Undefined(totalWidth, "totalWidth");
	
	if (!IsDefined(strForPad)) strForPad = " ";

	IEXCEPTION::Argument(strForPad.size == 1, "strForPad");
	
	return str + _GetStrForPad(str, totalWidth, strForPad);
}

private _GetStrForPad(str, totalWidth, strForPad)
{
	count = totalWidth - str.size;
	leftPart = "";
	for (i = 0; i < count; i++)
		leftPart += strForPad;	
		
	return leftPart;
}

/// <summary>
/// Concatenates all strings in a strArray into one string.
/// </summary>
/// <returns>String</returns>
/// <param name="strArray">String[] - Can be empty</param>
public Concat(strArray)
{
	IEXCEPTION::Undefined(strArray, "strArray");
	
	str = "";
	for (i = 0; i < strArray.size; i++)
		str += strArray[i];
		
	return str;	
}

/// <summary>
/// Concatenates all strings in a strArray and inserts the specified separator 
/// between them.
/// </summary>
/// <returns>String</returns>
/// <param name="separator">String</param>
/// <param name="strArray">String[]</param>
public Join(separator, strArray)
{
	IEXCEPTION::Undefined(separator, "separator");
	IEXCEPTION::Undefined(strArray, "strArray");
	//IEXCEPTION::EmptyArray(strArray.size, "strArray");

	if (strArray.size == 0)
		return "";
	
	return _Join(separator, strArray);
}

private _Join(separator, strArray)
{
	str = strArray[0];
	for (i = 1; i < strArray.size; i++)
		str += separator + strArray[i];
		
	return str;
}

/// <summary>
/// Gets the index of a subStr contained in a str.
/// </summary>
/// <returns>Int - returns -1 if a str does not containt a subStr. 
/// Returns startIndex if a subStr is empty</returns>
/// <param name="str">String</param>
/// <param name="subStr">String</param>
/// <param name="startIndex">Int - Default is zero</param>
/// <param name="length">Int - Default is length of left array</param>
/// <param name="ignoreCase">Bool - Default is false</param>
public IndexOf(str, subStr, [startIndex], [length], [ignoreCase])
{
	IEXCEPTION::Undefined(str, "str");
	IEXCEPTION::EmptyString(str.size, "str");
	IEXCEPTION::Undefined(subStr, "subStr");

	if (!IsDefined(startIndex)) startIndex = 0;
	if (!IsDefined(length)) length = str.size - startIndex;
	if (!IsDefined(ignoreCase)) ignoreCase = false;
	
	if (subStr.size == 0)
		return startIndex;
	
	if (subStr.size > str.size || length < subStr.size)
		return -1;
	
	endIndex = startIndex + length - 1;
	IEXCEPTION::OutOfRange(str.size, startIndex, "startIndex");
	IEXCEPTION::OutOfRange(str.size, endIndex, "length");
	
	if (ignoreCase)
	{
		str = ToLower(str);
		subStr = ToLower(subStr);
	}
	
	for (i = startIndex; i <= endIndex - (subStr.size - 1); i++)
	{
		curSubStr = GetSubStr(str, i, i + subStr.size);
		if (curSubStr == subStr)
			return i;
	}
	return -1;
}

/// <summary>
/// Gets the index of first occurence from a subStrArray contained in a str.
/// </summary>
/// <returns>Int - returns -1 if a str does not contain 
/// any string from subStrArray.
/// Returns startIndex if some string in a subStrArray is empty</returns>
/// <param name="str">String</param>
/// <param name="subStrArray">String[]</param>
/// <param name="startIndex">Int - Default is zero</param>
/// <param name="length">Int - Default is length of left array</param>
/// <param name="ignoreCase">Bool - Default is false</param>
public IndexOfAny(str, subStrArray, [startIndex], [length], [ignoreCase])
{
	IEXCEPTION::Undefined(str, "str");
	IEXCEPTION::EmptyString(str.size, "str");
	IEXCEPTION::Undefined(subStrArray, "subStrArray");
	IEXCEPTION::EmptyArray(subStrArray.size, "subStrArray");
	
	if (!IsDefined(startIndex)) startIndex = 0;
	if (!IsDefined(length)) length = str.size - startIndex;
	if (!IsDefined(ignoreCase)) ignoreCase = false;
	
	endIndex = startIndex + length - 1;
	IEXCEPTION::OutOfRange(str.size, startIndex, "startIndex");
	IEXCEPTION::OutOfRange(str.size, endIndex, "length");
	
	if (ignoreCase)
	{
		str = ToLower(str);
		for (i = 0; i < subStrArray.size; i++)
			subStrArray[i] = ToLower(subStrArray[i]);
	}
	
	for (i = startIndex; i <= endIndex; i++)
	{
		for (j = 0; j < subStrArray.size; j++)
		{
			if (subStrArray[j].size == 0)
				return startIndex;
		
			curSubStr = GetSubStr(str, i, i + subStrArray[j].size);
			if (curSubStr == subStrArray[j])
				return i;
		}
	}
	return -1;
}

/// <summary>
/// Gets the last occurence's index of a subStr contained in a str.
/// </summary>
/// <returns>Int - returns -1 if a str does not containt a subStr. 
/// Returns startIndex if a subStr is empty</returns>
/// <param name="str">String</param>
/// <param name="subStr">String</param>
/// <param name="startIndex">Int - Default is str.size - 1</param>
/// <param name="length">Int - Default is length of left array</param>
/// <param name="ignoreCase">Bool - Default is false</param>
public LastIndexOf(str, subStr, [startIndex], [length], [ignoreCase])
{
	IEXCEPTION::Undefined(str, "str");
	IEXCEPTION::EmptyString(str.size, "str");
	IEXCEPTION::Undefined(subStr, "subStr");

	if (!IsDefined(startIndex)) startIndex = str.size - 1;
	if (!IsDefined(length)) length = startIndex + 1;
	if (!IsDefined(ignoreCase)) ignoreCase = false;
	
	if (subStr.size == 0)
		return startIndex;
	
	if (subStr.size > str.size || length < subStr.size)
		return -1;
	
	endIndex = startIndex - length + 1;
	IEXCEPTION::OutOfRange(str.size, startIndex, "startIndex");
	IEXCEPTION::OutOfRange(str.size, endIndex, "length");
	
	if (ignoreCase)
	{
		str = ToLower(str);
		subStr = ToLower(subStr);
	}
	
	for (i = startIndex; i >= endIndex + (subStr.size - 1); i--)
	{
		curSubStr = GetSubStr(str, i - (subStr.size - 1), i + 1);
		if (curSubStr == subStr)
			return i - (subStr.size - 1);
	}
	return -1;
}

/// <summary>
/// Gets the index of last occurence from a subStrArray contained in a str.
/// </summary>
/// <returns>Int - returns -1 if a str does not contain 
/// any string from subStrArray.
/// Returns startIndex if some string in a subStrArray is empty</returns>
/// <param name="str">String</param>
/// <param name="subStrArray">String[]</param>
/// <param name="startIndex">Int - Default is str.size - 1</param>
/// <param name="length">Int - Default is length of left array</param>
/// <param name="ignoreCase">Bool - Default is false</param>
public LastIndexOfAny(str, subStrArray, [startIndex], [length], [ignoreCase])
{
	IEXCEPTION::Undefined(str, "str");
	IEXCEPTION::EmptyString(str.size, "str");
	IEXCEPTION::Undefined(subStrArray, "subStrArray");
	IEXCEPTION::EmptyArray(subStrArray.size, "subStrArray");
	
	if (!IsDefined(startIndex)) startIndex = str.size - 1;
	if (!IsDefined(length)) length = startIndex + 1;
	if (!IsDefined(ignoreCase)) ignoreCase = false;
	
	endIndex = startIndex - length + 1;
	IEXCEPTION::OutOfRange(str.size, startIndex, "startIndex");
	IEXCEPTION::OutOfRange(str.size, endIndex, "length");
	
	if (ignoreCase)
	{
		str = ToLower(str);
		for (i = 0; i < subStrArray.size; i++)
			subStrArray[i] = ToLower(subStrArray[i]);
	}
	
	for (i = startIndex; i >= endIndex; i--)
	{
		for (j = 0; j < subStrArray.size; j++)
		{
			if (subStrArray[j].size == 0)
				return startIndex;
		
			curSubStr = GetSubStr(str, i - (subStrArray[j].size - 1), i + 1);
			if (curSubStr == subStrArray[j])
				return i - (subStrArray[j].size - 1);
		}
	}
	return -1;
}

/// <summary>
/// Determines whether str contains the specified subStr.
/// </summary>
/// <returns>Bool</returns>
/// <param name="str">String</param>
/// <param name="subStr">String</param>
/// <param name="ignoreCase">Bool - Default is false</param>
public Contains(str, subStr, [ignoreCase])
{
	IEXCEPTION::Undefined(str, "str");
	IEXCEPTION::EmptyString(str.size, "str");
	IEXCEPTION::Undefined(subStr, "subStr");
	
	if (!IsDefined(ignoreCase)) ignoreCase = false;
	
	if (subStr.size == 0)
		return true;
		
	if (!ignoreCase)
		return IsSubStr(str, subStr);

	return IndexOf(str, subStr, undefined, undefined, ignoreCase) != -1;
}

/// <summary>
/// Determines whether str starts with the subStr.
/// Optionally ignores case.
/// </summary>
/// <returns>Bool - Returns true if a subStr is an empty string</returns>
/// <param name="str">String</param>
/// <param name="subStr">String</param>
/// <param name="ignoreCase">Bool - Default is false</param>
public StartsWith(str, subStr, [ignoreCase])
{
	IEXCEPTION::Undefined(str, "str");
	IEXCEPTION::Undefined(subStr, "subStr");
	
	if (subStr.size == 0)
		return true;
		
	if (str.size < subStr.size)
		return false;
		
	if (!IsDefined(ignoreCase)) ignoreCase = false;
	
	curSubStr = GetSubStr(str, 0, subStr.size);
	if (ignoreCase)
	{
		subStr = ToLower(subStr);
		curSubStr = ToLower(curSubStr);
	}
	return subStr == curSubStr;
}

/// <summary>
/// Determines whether str end with the subStr.
/// Optionally ignores case.
/// </summary>
/// <returns>Bool - Returns true if a subStr is an empty string</returns>
/// <param name="str">String</param>
/// <param name="subStr">String</param>
/// <param name="ignoreCase">Bool - Default is false</param>
public EndsWith(str, subStr, [ignoreCase])
{
	IEXCEPTION::Undefined(str, "str");
	IEXCEPTION::Undefined(subStr, "subStr");
	
	if (subStr.size == 0)
		return true;
		
	if (str.size < subStr.size)
		return false;
		
	if (!IsDefined(ignoreCase)) ignoreCase = false;
	
	curSubStr = GetSubStr(str, str.size - subStr.size, str.size);
	if (ignoreCase)
	{
		subStr = ToLower(subStr);
		curSubStr = ToLower(curSubStr);
	}
	return subStr == curSubStr;
}

/// <summary>
/// Inserts a substring to the specified index in the str.
/// </summary>
/// <returns>String</returns>
/// <param name="str">String</param>
/// <param name="index">Int</param>
/// <param name="subStr">String - Can be empty</param>
public Insert(str, index, subStr)
{
	IEXCEPTION::Undefined(str, "str");
	IEXCEPTION::EmptyString(str.size, "str");
	IEXCEPTION::Undefined(index, "index");
	//IEXCEPTION::OutOfRange(str.size, index, "index");
	IEXCEPTION::Undefined(subStr, "subStr");
	
	if (subStr.size == 0)
		return str;
	
	if (index >= str.size)
		return str + subStr;
	
	strBefore = GetSubStr(str, 0, index + 1);
	strAfter = GetSubStr(str, index);
	return strBefore + subStr + strAfter;
}

/// <summary>
/// Removes a sequence of chars from a str.
/// </summary>
/// <returns>String</returns>
/// <param name="str">String</param>
/// <param name="startIndex">Int</param>
/// <param name="length">Int - Can be zero</param>
public Remove(str, startIndex, [length])
{
	IEXCEPTION::Undefined(str, "str");
	IEXCEPTION::EmptyString(str.size, "str");
	IEXCEPTION::Undefined(startIndex, "startIndex");
	IEXCEPTION::OutOfRange(str.size, startIndex, "startIndex");
	
	if (!IsDefined(length)) length = str.size - startIndex;
	
	if (length == 0)
		return str;
	
	IEXCEPTION::OutOfRange(str.size, startIndex + length - 1, "length");
		
	strBefore = GetSubStr(str, 0, startIndex);
	strAfter = GetSubStr(str, startIndex + length);
	return strBefore + strAfter;
}

/// <summary>
/// Replaces all occurences of an oldStr in a str with newStr.
/// </summary>
/// <returns>String</returns>
/// <param name="str">String</param>
/// <param name="oldStr">String</param>
/// <param name="newStr">String</param>
public Replace(str, oldStr, newStr)
{
	IEXCEPTION::Undefined(str, "str");
	IEXCEPTION::EmptyString(str.size, "str");
	IEXCEPTION::Undefined(oldStr, "oldStr");
	IEXCEPTION::EmptyString(oldStr.size, "oldStr");
	IEXCEPTION::Undefined(newStr, "newStr");

	tokens = StrTok(str, oldStr);
	return _Join(newStr, tokens);
}

/// <summary>
/// Splits a str in each separator occurence to an array of string.
/// </summary>
/// <returns>String[]</returns>
/// <param name="str">String</param>
/// <param name="separator">String</param>
/// <param name="removeEmpty">Bool</param>
/// <param name="maxTokens">Int</param>
public Split(str, separator, [removeEmpty], [maxTokens])
{
	IEXCEPTION::Undefined(str, "str");
	IEXCEPTION::EmptyString(str.size, "str");
	IEXCEPTION::Undefined(separator, "separator");
	IEXCEPTION::EmptyString(separator.size, "separator");

	if (!IsDefined(removeEmpty)) removeEmpty = false;

	newTokens = [];
	tokens = StrTok(str, separator);
	for (i = 0; i < tokens.size; i++)
	{
		if (removeEmpty && tokens[i].size == 0)
			continue;
		
		newTokens[newTokens.size] = tokens[i];
		if (IsDefined(maxTokens) && newTokens.size >= maxTokens)
			break;
	}
	return newTokens;
}

/// <summary>
/// Gets a sub string from a str from a startIndex with a specified length.
/// </summary>
/// <returns>String</returns>
/// <param name="str">String</param>
/// <param name="startIndex">Int</param>
/// <param name="length">Int</param>
public SubString(str, startIndex, [length])
{
	IEXCEPTION::Undefined(str, "str");
	IEXCEPTION::EmptyString(str.size, "str");
	IEXCEPTION::Undefined(startIndex, "startIndex");
	IEXCEPTION::OutOfRange(str.size, startIndex, "startIndex");
	
	endIndex = startIndex + length - 1;
	IEXCEPTION::OutOfRange(str.size, endIndex, "length");
	
	return GetSubStr(str, startIndex, endIndex + 1);
}

/// <summary>
/// Converts str to lower case.
/// </summary>
/// <returns>String</returns>
/// <param name="str">String</param>
public ToLowerInvariant(str)
{
	return ToLower(str);
}

public ToUpperInvariant(str)
{
	IEXCEPTION::NotImplemented();
}

public Trim(str, [trimStrArray])
{
	str = TrimStart(str, trimStrArray);
	str = TrimEnd(str, trimStrArray);
	return str;
}

public TrimStart(str, [trimStrArray])
{
	IEXCEPTION::Undefined(str, "str");

	if (!IsDefined(trimStrArray)) trimStrArray = {" ", "\n"};
	
	for (i = 0; i < str.size; i++)
	{
		if (IARRAY::Contains(trimStrArray, str[i]))
			continue;
		else
		{
			str = Remove(str, 0, i);
			return str;
		}
	}
	return "";
}

public TrimEnd(str, [trimStrArray])
{
	IEXCEPTION::Undefined(str, "str");

	if (!IsDefined(trimStrArray)) trimStrArray = {" ", "\n"};
	
	for (i = str.size - 1; i >= 0; i--)
	{
		if (IARRAY::Contains(trimStrArray, str[i]))
			continue;
		else
		{
			if ((i + 1) < str.size)
				str = Remove(str, i + 1);
				
			return str;
		}
	}
	return "";
}

public Reverse(sStr, [iStartIndex], [iLength])
{
	IEXCEPTION::Undefined(sStr, "array");
	
	if (sStr.size <= 1)
		return sStr;
	
	if (!IsDefined(iStartIndex))	iStartIndex = 0;
	if (!IsDefined(iLength))		iLength = sStr.size - iStartIndex;
	
	IEXCEPTION::OutOfRange(sStr.size, iStartIndex, "iStartIndex");
	IEXCEPTION::OutOfRange(sStr.size, iStartIndex + iLength - 1, "iLength");	
	
	sNew = "";
	for (i = sStr.size - 1; i >= 0; i--)
		sNew += sStr[i];
	
	return sNew;
}

/// <summary>
/// Clears colors format items from a string.
/// </summary>
/// <returns>String</returns>
/// <param name="str">String</param>
public ClearColors(str)
{
	startIndex = 0;
	while (startIndex < str.size)
	{
		startIndex = IndexOf(str, "^", startIndex);
		if (startIndex == -1)
			break;
			
		if (IASCII::IsDigit(str[startIndex + 1]))
			str = Remove(str, startIndex, 2);
		else
			startIndex += 1;
	}
	return str;
}

public GetOrdinalStr(iNum)
{
	sNum = "" + iNum;
	sUnit = sNum[sNum.size - 1];
	
	sTens = undefined;
	if (sNum.size > 1)
		sTens = sNum[sNum.size - 2];

	if (IsDefined(sTens) && sTens == "1")
		return sNum + "th";
	else
	{	
		if (sUnit == "1")
			return sNum + "st";
		else if (sUnit == "2")
			return sNum + "nd";
		else if (sUnit == "3")
			return sNum + "rd";
		else
			return sNum + "th";
	}
	
	return sNum;
}

/// GetTeamString( team )
/// GetStatusString( alive, team )
/// GetMapName( map )
/// GetTimeFromSeconds( seconds )
/// IndexOf( sourceString, token, startIndex )
/// StringRemove( sourceString, startIndex, length )
/// StringRemoveStr( sourceString, removeString )
/// StringToFloat( sourceString )
/// TextAutoWrapped( text, charsPerLine )
/// STR_Replace( string, fromStr, toStr )
/// STR_MinutesToTime( minutes, completeFormat )
/*
GetTeamString( team )
{
	switch( team )
	{
		case "allies":
			return "Humans";
		case "axis":
			return "Monsters";
		case "spectator":
			return "Spectator";
		default:
			return "Unknown";
	}
}

GetStatusString( alive, team )
{
	if( team == "spectator" )
		return "Spectating";
		
	if( alive )
		return "Playing";
	else
		return "Death";
		
	return "Unknown";
}

GetB3Status( status )
{
	if( !status )
		return "^1Hidden";
	else
		return "Visible";
		
	return "Unknown";
}

GetTimeFromMiliSeconds( miliseconds )
{
	days = Int( miliseconds / 86400000 );
	daysR = miliseconds % 86400000;
	hours = Int( daysR / 3600000 );
	hoursR = daysR % 3600000;
	minutes = Int( hoursR / 60000 );
	minutesR = hoursR % 60000;
	seconds = Int( minutesR / 1000 );
	secondsR = minutesR % 1000;
	miliseconds = Int( secondsR );
	
	return days+"days | "+hours+"hours | "+minutes+"minutes | "+seconds+"seconds | "+miliseconds+"miliseconds";
}

IndexOf( sourceString, token, startIndex )
{
	if( !IsDefined( startIndex ) )
		startIndex = 0;
	
	max = sourceString.size - token.size;
	
	for( i = startIndex;i < max + 1;i++)
	{
		end = i + token.size;
		part = GetSubStr( sourceString, i, end );
		
		if( part == token )
			return i;
	}
	
	return -1;
}

StringRemove( sourceString, startIndex, length )
{
	strLength = sourceString.size;
	
	start = "";
	end = "";
	
	if( startIndex != 0 )
		start = GetSubStr( sourceString, 0, startIndex );
		
	if( startIndex + length < strLength )
		end = GetSubStr( sourceString, startIndex + length, strLength );
		
	return start + end;
}

StringRemoveStr( sourceString, removeString )
{
	str = "";
	toks = StrTok( sourceString, removeString );
	
	for( i = 0; i < toks.size; i++ )
		str += toks[i];
		
	return str;
}

StringToFloat( sourceString )
{
	index = IndexOf( sourceString, "." );
	
	if( index == -1 )
		return Int( sourceString );
		
	intPart = GetSubStr( sourceString, 0, index );
	floatPart = GetSubStr( sourceString, (index + 1), sourceString.size );
	
	if( intPart == "" || floatPart == "" )
		return int( sourceString );
		
	floatPartChars = floatPart;
	divisor = "1";
	for( i = 0;i < floatPartChars.size;i++)
		divisor += "0";
	
	floatNumber = int( floatPart ) / int( divisor );
	intNumber = int( intPart );
	
	return intNumber + floatNumber;
}

TextAutoWrapped( text, charsPerLine )
{
	lines = [];

	linesIndex = 0;
	
	while( text != "" )
	{
		index = TextAutoWrapped_ProcessText( text, charsPerLine );
		
		line = GetSubStr( text, 0, index );
		text = StringRemove( text, 0, index );
		
		line = StringRemoveStr( line, "\n" );
		
		lines[linesIndex] = line;
		linesIndex++;
	}
	
	return lines;
}

TextAutoWrapped_ProcessText( text, charsPerLine )
{
	index = 0;
	line = "";
	
	while( index < text.size )
	{
		line += text[index];
		index++;
		
		if( IsSubStr( line, "\n" ) )
			return index;
		
		if( index > charsPerLine )
		{
			spaceIndex = TextAutoWrapped_GetLastSpaceIndex( line );
			
			if( spaceIndex == -1 )
				return index;
			else
				return spaceIndex + 1;
		}
	}
	
	return index;
}

TextAutoWrapped_GetLastSpaceIndex( text )
{
	for( i = text.size - 1; i >= 0; i-- )
	{
		if( text[i] == " " )
			return i;
	}
	
	return -1;
}

STR_Replace( string, fromStr, toStr )
{
	toks = StrTok( string, fromStr );
	string = "";
	
	for( i = 0; i < toks.size; i++ )
	{
		if( i != toks.size-1 )
			string += toks[i] + toStr;
		else
			string += toks[i];
	}
	
	return string;
}

///
/// Konvertuje minúty na formát  %d"d" %h"h" %m"m"
///
STR_MinutesToTime( minutes, completeFormat )
{
	daysFloat = (minutes / 60) / 24;
	daysInt = int( daysFloat );
	
	hoursFloat = (daysFloat - daysInt) * 24;
	hoursInt = int( hoursFloat );
	
	minutesFloat = (hoursFloat - hoursInt) * 60;
	minutesInt = int( minutesFloat );
	
	if( IsDefined( completeFormat ) && completeFormat )
		return daysInt+"d "+hoursInt+"h "+minutesInt+"m";
	else
	{
		timeFormat = "";
		if( daysInt != 0 )
		{
			timeFormat += daysInt+"d ";
			timeFormat += hoursInt+"h ";
		}
		else if( hoursInt != 0 )
			timeFormat += hoursInt+"h ";
			
		timeFormat += minutesInt+"m";
		return timeFormat;
	}
}

STR_Str2Vector( string )
{
	numbersI = 0;
	numbers = [];
	numbers[0] = "";
	numbers[1] = "";
	numbers[2] = "";
	
	for( c = 0; c < string.size && numbersI < 3; c++ )
	{
		if( string[c] == "(" || string[c] == ")" || string[c] == " " )
			continue;
			
		if( string[c] == "," )
		{
			numbersI++;
			continue;
		}
		
		numbers[numbersI] += string[c];
	}
	
	for( i = 0; i < 3; i++ )
		numbers[i] = StringToFloat( numbers[i] );
		
	return ( numbers[0], numbers[1], numbers[2] );
}*/