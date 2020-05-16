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

// supports undefined 

public IsEqual(secondList)
{
	if (!IsDefined(secondList))
		return false;
	else if (self.iCount != secondList.iCount)
		return false;
	else
	{
		for (i = 0; i < secondList.iCount; i++)
		{
			if (!ITYPE::IsEqual(self Get(i), secondList Get(i)))
				return false;
		}
	}
	
	return true;
}

public Create([iCount])
{
	if (!IsDefined(iCount)) iCount = 0;
	
	list = SpawnStruct();
	list.iCount = iCount;
	list.Elems = [];
	
	return list;
}

public CreateCopy()
{
	list = Create(self.iCount);
	list.iCount = self.iCount;
	list.Elems = self.Elems;
	
	return list;
}

public Get(iIndex)
{
	IEXCEPTION::OutOfRange(self.iCount, iIndex);

	return self.Elems[iIndex];
}

public Set(iIndex, elem)
{
	//IEXCEPTION::OutOfRange(self.iCount, iIndex);
	if (iIndex >= self.iCount)
		self.iCount = iIndex + 1;
	
	self.Elems[iIndex] = elem;
}

public Add(elem)
{
	self.Elems[self.iCount] = elem;
	self.iCount++;
}

public AddArray(array, [iCount])
{
	if (!IsDefined(iCount)) iCount = array.size;
	for (i = 0; i < iCount; i++)
		self.Elems[self.iCount + i] = array[i];
		
	self.iCount += iCount;
}

public AddList(list)
{
	for (i = 0; i < list.iCount; i++)
		self.Elems[self.iCount + i] = list.Elems[i];
		
	self.iCount += list.iCount;
}

public ToArray([bIgnoreUndefined])
{
	if (!IsDefined(bIgnoreUndefined)) bIgnoreUndefined = false;

	a = [];
	for (i = 0; i < self.iCount; i++)
	{
		if (bIgnoreUndefined && !IsDefined(self.Elems[i]))
			continue;
			
		a[a.size] = self.Elems[i];
	}
	
	return a;
}

public IndexOf(elem, [iStartIndex], [iLength])
{
	if (self.iCount == 0)
		return -1;
	
	if (!IsDefined(iStartIndex))	iStartIndex = 0;
	if (!IsDefined(iLength))		iLength = self.iCount - iStartIndex;

	endIndex = iStartIndex + iLength - 1;
	IEXCEPTION::OutOfRange(self.iCount, iStartIndex, "iStartIndex");
	IEXCEPTION::OutOfRange(self.iCount, endIndex, "iLength");
	
	for (i = iStartIndex; i <= endIndex; i++)
		if (ITYPE::IsEqual(self.Elems[i], elem))
			return i;

	return -1;
}

public LastIndexOf(elem, [iStartIndex], [iLength])
{
	if (self.iCount == 0)
		return -1;
	
	if (!IsDefined(iStartIndex))	iStartIndex = self.iCount - 1;
	if (!IsDefined(iLength))		iLength = iStartIndex + 1;

	endIndex = iStartIndex - iLength + 1;
	IEXCEPTION::OutOfRange(self.iCount, iStartIndex, "iStartIndex");
	IEXCEPTION::OutOfRange(self.iCount, endIndex, "iLength");
	
	for (i = iStartIndex; i >= endIndex; i--)
		if (ITYPE::IsEqual(self.Elems[i], elem))
			return i;

	return -1;
}

public Contains(elem, [iStartIndex], [iLength])
{
	return self IndexOf(elem, iStartIndex, iLength) != -1;
}

public GetArray(iStartIndex, [iLength])
{
	if (!IsDefined(iLength) && self.iCount == 0)
		return [];
	
	if (!IsDefined(iLength))	iLength = self.iCount - iStartIndex;

	endIndex = iStartIndex + iLength - 1;
	IEXCEPTION::OutOfRange(self.iCount, iStartIndex, "iStartIndex");
	IEXCEPTION::OutOfRange(self.iCount, endIndex, "iLength");
	
	newArray = [];
	for (i = iStartIndex; i <= endIndex; i++)
		newArray[newArray.size] = self.Elems[i];
		
	return newArray;
}

public GetList(iStartIndex, [iLength])
{
	newList = Create();
	
	if (!IsDefined(iLength) && self.iCount == 0)
		return newList;
	
	if (!IsDefined(iLength))	iLength = self.iCount - iStartIndex;

	endIndex = iStartIndex + iLength - 1;
	IEXCEPTION::OutOfRange(self.iCount, iStartIndex, "iStartIndex");
	IEXCEPTION::OutOfRange(self.iCount, endIndex, "iLength");
	
	for (i = iStartIndex; i <= endIndex; i++)
		newList Add(self.Elems[i]);
		
	return newList;
}

public Insert(iIndex, elem)
{
	if (iIndex < 0 || (self.iCount > 0 && iIndex >= self.iCount))
		IEXCEPTION::OutOfRangeMsg("iIndex");
	
	for (i = self.iCount; i > iIndex; i--)
		self.Elems[i] = self.Elems[i - 1];
	
	self.Elems[iIndex] = elem;
	self.iCount++;
}

public InsertArray(iIndex, array)
{
	if (iIndex < 0 || (self.iCount > 0 && iIndex >= self.iCount))
		IEXCEPTION::OutOfRangeMsg("iIndex");
		
	for (i = self.iCount + array.size - 1; i >= (iIndex + array.size); i--)
		self.Elems[i] = self.Elems[i - array.size];
		
	for (i = 0; i < array.size; i++)
		self.Elems[iIndex + i] = array[i];
		
	self.iCount += array.size;
}

public InsertList(iIndex, list)
{
	if (iIndex < 0 || (self.iCount > 0 && iIndex >= self.iCount))
		IEXCEPTION::OutOfRangeMsg("iIndex");

	
	for (i = self.iCount + list.iCount - 1; i >= (iIndex + list.iCount); i--)
		self.Elems[i] = self.Elems[i - list.iCount];
		
	for (i = 0; i < list.iCount; i++)
		self.Elems[iIndex + i] = list.Elems[i];
		
	self.iCount += list.iCount;
}

public Remove(elem)
{
	iIndex = IndexOf(elem);
	if (iIndex == -1)
		return;
	
	self RemoveAt(iIndex);
}

public RemoveAt(iIndex)
{
	IEXCEPTION::OutOfRange(self.iCount, iIndex, "iIndex");
	
	for (i = iIndex; i < self.iCount; i++)
		self.Elems[i] = self.Elems[i + 1]; // last index will be array.size - 1 -> value will be undefined(out of range)
		
	self.iCount--;
}

public RemoveRange(iIndex, [iLength])
{
	IEXCEPTION::OutOfRange(self.iCount, iIndex, "iIndex");
	
	if (!IsDefined(iLength)) iLength = self.iCount - iIndex;
	
	IEXCEPTION::OutOfRange(self.iCount, iIndex + iLength - 1, "iLength");
	
	for (i = iIndex; i < self.iCount; i++)
		self.Elems[i] = self.Elems[i + iLength];
		
	self.iCount -= iLength;
}

public Exclude(excludeList)
{
	newArray = [];
	iIndex = 0;
	for (i = 0; i < self.iCount; i++)
	{
		if (excludeList ILIST::Contains(self.Elems[i]))
			continue;
			
		newArray[iIndex] = self.Elems[i];
		iIndex++;
	}
	
	self.Elems = newArray;
	self.iCount = iIndex;
}

public Distinct()
{
	for (i = 0; i < self.iCount; i++)
	{
		for (j = i + 1; j < self.iCount; j++)
		{
			if (ITYPE::IsEqual(self.Elems[j], self.Elems[i]))
			{
				self RemoveAt(j);
				j--; // elements in the self has moved
			}
		}
	}
}

public Intersect(list)
{
	// optimalization
	if (list.iCount < self.iCount)
		return list Union(self);

	newList = ILIST::Create();	
	for (i = 0; i < list.iCount; i++)
	{
		e = list ILIST::Get(i);
		if (self Contains(e))
			newList ILIST::Add(e);
	}
	
	return newList;
}

public Union(list)
{
	// optimalization
	if (list.iCount < self.iCount)
		return list Union(self);
	
	newList = ILIST::Create();
	newList ILIST::AddList(self);
	
	for (i = 0; i < list.iCount; i++)
	{
		e = list ILIST::Get(i);
		if (!self Contains(e))
			newList ILIST::Add(e);
	}
	
	return newList;
}

public SetForAll(value, [iStartIndex], [iLength])
{
	if (self.iCount == 0)
		return;
	
	if (!IsDefined(iStartIndex)) iStartIndex = 0;
	if (!IsDefined(iLength)) iLength = self.iCount - iStartIndex;
	
	lastIndex = iLength - iStartIndex - 1;
	IEXCEPTION::OutOfRange(self.iCount, iStartIndex, "iStartIndex");
	IEXCEPTION::OutOfRange(self.iCount, lastIndex, "iLength");
	
	for (i = iStartIndex; i <= lastIndex; i++)
		self.Elems[i] = value;
}

public Sort([dComparer])
{
	if (!IsDefined(dComparer))
		dComparer = ITYPE::CompareFloat;

	self QuickSort(0, self.iCount - 1, dComparer);
}

private QuickSort(iLeft, iRight, dComparer)
{
	i = iLeft;
	j = iRight;
	iPivot = self Get(Int((iLeft + iRight) / 2));
	
	while (i <= j)
	{
		while ([[dComparer]](self Get(i), iPivot) < 0)
			i++;

		while ([[dComparer]](self Get(j), iPivot) > 0)
			j--;

		if (i <= j)
		{
			// Swap
			if (i != j)
			{
				tmp = self Get(i);
				self Set(i, self Get(j));
				self Set(j, tmp);
			}
			
			i++;
			j--;
		}
	}

	// Recursive calls
	if (iLeft < j)
	{
		self Quicksort(iLeft, j, dComparer);
	}

	if (i < iRight)
	{
		self Quicksort(i, iRight, dComparer);
	}
}