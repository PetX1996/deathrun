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

public IsEqual(firstArray, secondArray)
{
	if (!IsDefined(firstArray) && !IsDefined(secondArray))
		return true;
	else if (IsDefined(firstArray) && !IsDefined(secondArray))
		return false;
	else if (!IsDefined(firstArray) && IsDefined(secondArray))
		return false;
	else if (firstArray.size != secondArray.size)
		return false;
	else
	{
		for (i = 0; i < firstArray.size; i++)
		{
			if (firstArray[i] != secondArray[i])
				return false;
		}
	}
	
	return true;
}

/// <summary>
/// Creates a copy of the array.
/// </summary>
/// <returns>T[]</returns>
/// <param name="array">T[]</param>
public ToArray(array)
{
	return array;
}

/// <summary>
/// Gets index of first occurence in the zero-based array.
/// </summary>
/// <returns>Int</returns>
/// <param name="array">T[] - Can be empty</param>
/// <param name="element">T</param>
/// <param name="startIndex">Int - Default is zero</param>
/// <param name="length">Int - Default is length of the array</param>
public IndexOf(array, element, [startIndex], [length])
{
	IEXCEPTION::Undefined(array, "array");
	IEXCEPTION::Undefined(element, "element");
	
	if (array.size == 0)
		return -1;
	
	if (!IsDefined(startIndex))	startIndex = 0;
	if (!IsDefined(length))	length = array.size - startIndex;

	endIndex = startIndex + length - 1;
	IEXCEPTION::OutOfRange(array.size, startIndex, "startIndex");
	IEXCEPTION::OutOfRange(array.size, endIndex, "length");
	
	for (i = startIndex; i <= endIndex; i++)
		if (ITYPE::IsEqual(array[i], element))
			return i;

	return -1;
}

/// <summary>
/// Gets index of last occurence in the zero-based array.
/// </summary>
/// <returns>Int</returns>
/// <param name="array">T[] - Can be empty</param>
/// <param name="element">T</param>
/// <param name="startIndex">Int - Default is size of the array - 1</param>
/// <param name="length">Int - Default is length of the array</param>
public LastIndexOf(array, element, [startIndex], [length])
{
	IEXCEPTION::Undefined(array, "array");
	IEXCEPTION::Undefined(element, "element");

	if (array.size == 0)
		return -1;
	
	if (!IsDefined(startIndex))	startIndex = array.size - 1;
	if (!IsDefined(length))	length = startIndex + 1;

	endIndex = startIndex - length + 1;
	IEXCEPTION::OutOfRange(array.size, startIndex, "startIndex");
	IEXCEPTION::OutOfRange(array.size, endIndex, "length");
	
	for (i = startIndex; i >= endIndex; i--)
		if (ITYPE::IsEqual(array[i], element))
			return i;

	return -1;
}

/// <summary>
/// Reverses elements in the array.
/// </summary>
/// <returns>T[]</returns>
/// <param name="array">T[] - Can be empty</param>
/// <param name="startIndex">Int - Default is zero</param>
/// <param name="length">Int - Default is length of the array</param>
public Reverse(array, [startIndex], [length])
{
	IEXCEPTION::Undefined(array, "array");
	
	if (array.size <= 1)
		return array;
	
	if (!IsDefined(startIndex))	startIndex = 0;
	if (!IsDefined(length))	length = array.size - startIndex;
	
	IEXCEPTION::OutOfRange(array.size, startIndex, "startIndex");
	IEXCEPTION::OutOfRange(array.size, startIndex + length - 1, "length");	
	
	count = Int(length * 0.5);
	for (i = 0; i < count; i++)
	{
		firstIndex = startIndex + i;
		secondIndex = startIndex + (length - i - 1);

		firstValue = array[firstIndex];
		array[firstIndex] = array[secondIndex];
		array[secondIndex] = firstValue;
	}
	
	return array;
}

/// <summary>
/// Adds an element to the end of an array.
/// </summary>
/// <returns>T[]</returns>
/// <param name="array">T[]</param>
/// <param name="element">T</param>
public Add(array, element)
{
	IEXCEPTION::Undefined(array, "array");
	IEXCEPTION::Undefined(element, "element");

	array[array.size] = element;
	return array;
}

/// <summary>
/// Adds an array of an elements to end of the array.
/// </summary>
/// <returns>T[]</returns>
/// <param name="array">T[]</param>
/// <param name="elementsArray">T[]</param>
public AddRange(array, elementsArray)
{
	IEXCEPTION::Undefined(array, "array");
	IEXCEPTION::Undefined(elementsArray, "elementsArray");

	for (i = 0; i < elementsArray.size; i++)
		array[array.size] = elementsArray[i];
		
	return array;
}

/// <summary>
/// Determines whether an element is in the array.
/// </summary>
/// <returns>Bool</returns>
/// <param name="array">T[]</param>
/// <param name="element">T</param>
/// <param name="startIndex">Int - Default is zero</param>
/// <param name="length">Int - Default is length of the array</param>
public Contains(array, element, [startIndex], [length])
{
	IEXCEPTION::Undefined(array, "array");
	IEXCEPTION::Undefined(element, "element");
	
	return IndexOf(array, element, startIndex, length) != -1;
}

/// <summary>
/// Gets a range of elements in the array.
/// </summary>
/// <returns>T[]</returns>
/// <param name="array">T[]</param>
/// <param name="startIndex">Int</param>
/// <param name="length">Int</param>
public GetRange(array, startIndex, [length])
{
	IEXCEPTION::Undefined(array, "array");
	IEXCEPTION::Undefined(startIndex, "startIndex");	

	if (array.size == 0)
		return array;
	
	if (!IsDefined(length))	length = array.size - startIndex;

	endIndex = startIndex + length - 1;
	IEXCEPTION::OutOfRange(array.size, startIndex, "startIndex");
	IEXCEPTION::OutOfRange(array.size, endIndex, "length");
	
	newArray = [];
	for (i = startIndex; i <= endIndex; i++)
		newArray[newArray.size] = array[i];
		
	return newArray;
}

/// <summary>
/// Inserts an element to the specified index in the array.
/// </summary>
/// <returns>T[]</returns>
/// <param name="array">T[]</param>
/// <param name="index">Int</param>
/// <param name="element">T</param>
public Insert(array, index, element)
{
	IEXCEPTION::Undefined(array, "array");
	IEXCEPTION::EmptyArray(array.size, "array");
	IEXCEPTION::Undefined(index, "index");
	IEXCEPTION::OutOfRange(array.size, index, "index");
	IEXCEPTION::Undefined(element, "element");
	
	for (i = array.size - 1; i >= index; i--)
		array[i + 1] = array[i];
	
	array[index] = element;
	return array;
}

/// <summary>
/// Inserts a range of elements to the specified index in the array.
/// </summary>
/// <returns>T[]</returns>
/// <param name="array">T[]</param>
/// <param name="index">Int</param>
/// <param name="elementsRange">T[]</param>
public InsertRange(array, index, elementsRange)
{
	IEXCEPTION::Undefined(array, "array");
	IEXCEPTION::EmptyArray(array.size, "array");
	IEXCEPTION::Undefined(index, "index");
	IEXCEPTION::OutOfRange(array.size, index, "index");
	IEXCEPTION::Undefined(elementsRange, "elementsRange");
	IEXCEPTION::EmptyArray(elementsRange.size, "elementsRange");
	
	for (i = array.size - 1; i >= index; i--)
		array[i + elementsRange.size] = array[i];
		
	for (i = 0; i < elementsRange.size; i++)
		array[index + i] = elementsRange[i];
		
	return array;
}

/// <summary>
/// Removes an element from the array.
/// </summary>
/// <returns>T[]</returns>
/// <param name="array">T[]</param>
/// <param name="element">T</param>
public Remove(array, element, [bEmptyThrow], [bDontContainsThrow])
{
	IEXCEPTION::Undefined(array, "array");
	//IEXCEPTION::Undefined(element, "element");

	if (!IsDefined(bDontContainsThrow)) bDontContainsThrow = false;
	if (!IsDefined(bEmptyThrow)) bEmptyThrow = false;
	
	if (bEmptyThrow)
		IEXCEPTION::EmptyArray(array.size, "array");
	else if (array.size == 0)
		return array;
	
	iIndex = -1;
	if (IsDefined(element))
		iIndex = IndexOf(array, element);
	else
		iIndex = IndexOfUndefined(array);
	
	if (bDontContainsThrow && iIndex == -1)
		IEXCEPTION::ArgumentMsg("element");
	else if (iIndex == -1)
		return array;
	
	return RemoveAt(array, iIndex);
}

public IndexOfUndefined(array, [iStartIndex], [iLength], [iUndefinedCount])
{
	if (!IsDefined(iUndefinedCount)) 	iUndefinedCount = 1;
	if (!IsDefined(iStartIndex)) 		iStartIndex = 0;
	if (!IsDefined(iLength)) 			iLength = (array.size + iUndefinedCount) - iStartIndex;
	
	iEndIndex = iStartIndex + iLength;
	
	IEXCEPTION::OutOfRange((array.size + iUndefinedCount), iStartIndex, "iStartIndex");
	IEXCEPTION::OutOfRange((array.size + iUndefinedCount), (iEndIndex - 1), "iEndIndex");
	
	for (i = iStartIndex; i < iEndIndex; i++)
	{
		if (!IsDefined(array[i]))
			return i;
	}
	
	return -1;
}

/// <summary>
/// Removes an element at the given position from the array.
/// </summary>
/// <returns>T[]</returns>
/// <param name="array">T[]</param>
/// <param name="index">Int</param>
public RemoveAt(array, index)
{
	IEXCEPTION::Undefined(array, "array");
	IEXCEPTION::EmptyArray(array.size, "array");
	IEXCEPTION::Undefined(index, "index");
	IEXCEPTION::OutOfRange(array.size, index, "index");
	
	for (i = index; i < array.size; i++)
		array[i] = array[i + 1]; // last index will be array.size - 1 -> value will be undefined(out of range)
		
	return array;
}

/// <summary>
/// Removes a range of elements at the given position from the array.
/// </summary>
/// <returns>T[]</returns>
/// <param name="array">T[]</param>
/// <param name="index">Int</param>
/// <param name="length">Int</param>
public RemoveRange(array, index, [length])
{
	IEXCEPTION::Undefined(array, "array");
	IEXCEPTION::EmptyArray(array.size, "array");
	IEXCEPTION::Undefined(index, "index");
	IEXCEPTION::OutOfRange(array.size, index, "index");
	
	if (!IsDefined(length)) length = array.size - index;
	
	IEXCEPTION::OutOfRange(array.size, index + length - 1, "length");
	
	arraySize = array.size;
	for (i = index; i < arraySize; i++)
		array[i] = array[i + length];
		
	return array;
}

/// <summary>
/// Removes same elements in the array.
/// </summary>
/// <returns>T[]</returns>
/// <param name="array">T[]</param>
public Distinct(array)
{
	IEXCEPTION::Undefined(array, "array");
	
	for (i = 0; i < array.size; i++)
	{
		for (j = i + 1; j < array.size; j++)
		{
			if (array[j] == array[i])
			{
				array = RemoveAt(array, j);
				j--; // elements in the array will move
			}
		}
	}
	return array;
}

/// <summary>
/// Returns the intersect from two arrays.
/// </summary>
/// <returns>T[]</returns>
/// <param name="array">T[]</param>
/// <param name="secondArray">T[]</param>
public Intersect(array, secondArray)
{
	IEXCEPTION::Undefined(array, "array");
	IEXCEPTION::Undefined(secondArray, "secondArray");

	newArray = [];

	for (i = 0; i < array.size; i++)
		if (Contains(secondArray, array[i]))
			newArray[newArray.size] = array[i];
			
	return newArray;
}

/// <summary>
/// Returns the union from two arrays.
/// </summary>
/// <returns>T[]</returns>
/// <param name="array">T[]</param>
/// <param name="secondArray">T[]</param>
public Union(array, secondArray)
{
	IEXCEPTION::Undefined(array, "array");
	IEXCEPTION::Undefined(secondArray, "secondArray");

	startLength = array.size;
	for (i = 0; i < secondArray.size; i++)
		if (!Contains(array, secondArray[i], 0, startLength))
			array[array.size] = secondArray[i];
			
	return array;
}

/// <summary>
/// Sets same value for each element in the array.
/// </summary>
/// <returns>T[]</returns>
/// <param name="array">T[]</param>
/// <param name="value">T</param>
/// <param name="startIndex">Int</param>
/// <param name="length">Int</param>
public SetForAll(array, value, [startIndex], [length])
{
	IEXCEPTION::Undefined(array, "array");
	IEXCEPTION::Undefined(value, "value");
	
	if (array.size == 0)
		return array;
	
	if (!IsDefined(startIndex)) startIndex = 0;
	if (!IsDefined(length)) length = array.size - startIndex;
	
	lastIndex = length - startIndex - 1;
	IEXCEPTION::OutOfRange(array.size, startIndex, "startIndex");
	IEXCEPTION::OutOfRange(array.size, lastIndex, "length");
	
	for (i = startIndex; i <= lastIndex; i++)
		array[i] = value;
		
	return array;
}

/// <summary>
/// Returns first element in the array.
/// Throws an exception if the array is empty.
/// </summary>
/// <returns>T</returns>
/// <param name="array">T[]</param>
public First(array)
{
	return array[0];
}

/// <summary>
/// Returns first element in the array.
/// Returns defaultValue if the array is empty.
/// </summary>
/// <returns>T</returns>
/// <param name="array">T[]</param>
/// <param name="defaultValue">T</param>
public FirstOrDefault(array, defaultValue)
{
	if (array.size == 0)
		return defaultValue;
	
	return array[0];
}