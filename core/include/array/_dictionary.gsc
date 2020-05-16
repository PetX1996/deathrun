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

public Create()
{
	dic = SpawnStruct();
	
	dic.Elems = [];
	
	return dic;
}

public CreateCopy()
{
	dic = Create();
	dic.Elems = self.Elems;
	
	return dic;
}

public ToDicArray()
{
	return self.Elems;
}

/// <summary>
/// Adds a value with a specified key to the dictionary.
/// </summary>
/// <param name="key">Int/String</param>
/// <param name="value">T</param>
public Add(key, value)
{
	//IEXCEPTION::Undefined(key, "key");

	self.Elems[key] = value;
}

/// <summary>
/// Adds a range of values with specified keys to the dictionary.
/// </summary>
/// <param name="dicArray">T[]</param>
/// <param name="bOverwrite">Bool - Overwrites same keys, default is true</param>
public AddDicArray(dicArray, [bOverwrite])
{
	IEXCEPTION::Undefined(dicArray, "dicArray");
	
	if (!IsDefined(bOverwrite)) bOverwrite = true;
	
	keys = GetArrayKeys(dicArray);
	foreach (key in keys)
	{
		if (!IsDefined(self.Elems[key]) || bOverwrite)
			self.Elems[key] = dicArray[key];
	}
}

/// <summary>
/// Adds a range of values with specified keys to the dictionary.
/// </summary>
/// <param name="dic">Dictionary</param>
/// <param name="bOverwrite">Bool - Overwrites same keys, default is true</param>
public AddDic(dic, [bOverwrite])
{
	IEXCEPTION::Argument(IsDefined(dic) && IsDefined(dic.Elems), "dic");
	
	if (!IsDefined(bOverwrite)) bOverwrite = true;
	
	keys = GetArrayKeys(dic.Elems);
	foreach (key in keys)
	{
		if (!IsDefined(self.Elems[key]) || bOverwrite)
			self.Elems[key] = dic.Elems[key];
	}
}

/// <summary>
/// Gets dictionary's keys.
/// </summary>
/// <returns>Int[]/String[]</returns>
public GetKeysArray()
{
	return GetArrayKeys(self.Elems);
}

/// <summary>
/// Gets dictionary's keys.
/// </summary>
/// <returns>List of strings/ints</returns>
public GetKeysList()
{
	list = ILIST::Create();
	list ILIST::AddArray(GetArrayKeys(self.Elems));
	return list;
}

/// <summary>
/// Gets dictionary's values indexed from zero.
/// </summary>
/// <returns>T[]</returns>
public GetValuesArray()
{
	keys = GetArrayKeys(self.Elems);
	values = [];
	foreach (key in keys)
		values[values.size] = self.Elems[key];
		
	return values;
}

/// <summary>
/// Gets dictionary's values indexed from zero.
/// </summary>
/// <returns>List of T[]</returns>
public GetValuesList()
{
	keys = GetArrayKeys(self.Elems);
	values = ILIST::Create();
	foreach (key in keys)
		values ILIST::Add(self.Elems[key]);
		
	return values;
}

/// <summary>
/// Returns key corresponding to specified value.
/// Returns undefined if dictionary does not contain specified value.
/// </summary>
/// <returns>Int/String</returns>
/// <param name="value">T</param>
public KeyOf(value)
{
	keys = GetArrayKeys(self.Elems);
	foreach (key in keys)
		if (ITYPE::IsEqual(self.Elems[key], value))
			return key;
			
	return undefined;
}

/// <summary>
/// Determines whether dictionary contains specified key.
/// </summary>
/// <returns>Bool</returns>
/// <param name="key">Int/String</param>
public ContainsKey(key)
{
	IEXCEPTION::Undefined(key, "key");
	
	return IsDefined(self.Elems[key]);
}

/// <summary>
/// Determines whether dictionary contains specified value.
/// </summary>
/// <returns>Bool</returns>
/// <param name="value">T</param>
public ContainsValue(value)
{
	return IsDefined(self KeyOf(value));
}

public Get(key)
{
	IEXCEPTION::Undefined(key, "key");

	return self.Elems[key];
}

/// <summary>
/// Returns a value for specified index.
/// Returns defaultValue if dictionary does not contain the key.
/// </summary>
/// <returns>T</returns>
/// <param name="key">Int/String</param>
/// <param name="defaultValue">T</param>
public GetValueOrDefault(key, defaultValue)
{
	IEXCEPTION::Undefined(key, "key");
	
	value = self.Elems[key];
	if (IsDefined(value))
		return value;
		
	return defaultValue;
}