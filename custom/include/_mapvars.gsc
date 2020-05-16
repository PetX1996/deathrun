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

// WARNING!!!
// do not use any buffers with DB plugin!!

public Set(sMapName, sName, sValue)
{
	if (sMapName == IGAME::GetMap())
		SetToMapBuffer(sName, sValue);

	stream = Stream_Create(sMapName);
	stream Stream_Set(sName, sValue);
	stream Stream_Save();
}

public Get(sMapName, sName)
{
	if (sMapName == IGAME::GetMap())
	{
		sBuffValue = GetFromMapBuffer(sName);
		if (IsDefined(sBuffValue))
			return sBuffValue;
	}
	
	stream = Stream_Create(sMapName);
	sValue = stream Stream_Get(sName);
	SetToMapBuffer(sName, sValue);
	return sValue;
}



private SetToMapBuffer(sName, sValue)
{
	if (!IsDefined(game["mapVarsMapBuffer"]))
		game["mapVarsMapBuffer"] = [];

	game["mapVarsMapBuffer"][sName] = sValue;
}

private GetFromMapBuffer(sName)
{
	if (!IsDefined(game["mapVarsMapBuffer"]))
		game["mapVarsMapBuffer"] = [];
		
	return game["mapVarsMapBuffer"][sName];
}

// ======================================================================= //
#region Stream

private Stream_Create(sMapName)
{
	stream = SpawnStruct();
	stream.sMapName = sMapName;
	stream.Vars = [];
	
	stream LoadVarsFromDvar(sMapName);
	
	return stream;
}

private Stream_Set(sName, sValue)
{
	self.Vars[sName] = sValue;
}

private Stream_Get(sName)
{
	return self.Vars[sName];
}

private Stream_Save()
{
	self SaveVarsToDvar();
}

private LoadVarsFromDvar(sMapName)
{
	dvarValue = GetDvar("mapVars_" + sMapName);
	if (dvarValue == "")
		return;
		
	toks = StrTok(dvarValue, ";");
	isValue = false;
	name = undefined;
	foreach (tok in toks)
	{
		if (tok == "")
			continue;
	
		if (!isValue)
			name = tok;
		else
			self.Vars[name] = tok;
			
		isValue = !isValue;
	}
}

private SaveVarsToDvar()
{
	value = "";

	names = GetArrayKeys(self.Vars);
	foreach (name in names)
		value += name + ";" + self.Vars[name] + ";";
		
	SetDvar("mapVars_" + self.sMapName, value);
}

#endregion
// ======================================================================= //