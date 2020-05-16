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

// ======================================================================================= //
#region Entity

public Entity_Get(sClassName, vOrigin, [sTargetName])
{
	eEnt = Entity_OnlyGet(sClassName, vOrigin, sTargetName);
	eEnt Entity_Register();
	return eEnt;
}

public Entity_OnlyGet(sClassName, vOrigin, [sTargetName])
{
	ents = GetEntArray(sClassName, "classname");
	foreach (eEnt in ents)
	{
		if (IsDefined(sTargetName) && IsDefined(eEnt.sOrigTargetName))
		{
			if (eEnt.sOrigTargetName == sTargetName)
			{
				if ((IsDefined(eEnt.vOrigOrigin) && eEnt.vOrigOrigin == vOrigin)
					|| (!IsDefined(eEnt.vOrigOrigin) && eEnt.origin == vOrigin))
				{
					return eEnt;
				}
			}
		}
		else if (!IsDefined(sTargetName) && !IsDefined(eEnt.sOrigTargetName))
		{
			if ((IsDefined(eEnt.vOrigOrigin) && eEnt.vOrigOrigin == vOrigin)
				|| (!IsDefined(eEnt.vOrigOrigin) && eEnt.origin == vOrigin))
			{
				return eEnt;
			}	
		}
	}

	return undefined;
}

public Entity_Spawn(sClassName, vOrigin, [sTargetName], [fRadius], [fHeight])
{
	eEnt = Spawn(sClassName, vOrigin, 0, fRadius, fHeight);
	eEnt.targetname = sTargetName;
	eEnt.radius = fRadius;
	eEnt.height = fHeight;
	
	eEnt.vOrigOrigin = vOrigin;
	eEnt.sOrigTargetName = sTargetName;
	
	eEnt Entity_Register();
	if (IGAME::IsDev())
	{
		eEnt.MF.bIsSpawned = true;
	}

	return eEnt;
}

public Entity_Delete()
{
	if (IGAME::IsDev() && !IsDefined(self.bIsFake))
	{
		self Entity_Register();
		if (!IsDefined(self.MF.bIsDeleted))
		{
			self.MF.bIsDeleted = true;
			
			if (self.classname == "script_model" || self.classname == "script_brushmodel")
			{
				self Hide();
				self NotSolid();
			}
		}
	}
	else
		self Delete();
}

public Entity_Property(sPropName, propValue)
{
	if (IGAME::IsDev() && !IsDefined(self.bIsFake))
	{
		if (!IsDefined(self.MF) || !IsDefined(self.MF.OrigPropValues[sPropName]))
		{
			self Entity_Register();
			
			self.MF.OrigPropValues[sPropName] = self Entity_GetPropOrigValue(sPropName);;
		}
	}
	
	self IENTITY::SetValueByKey(sPropName, propValue);
}

public Entity_Register()
{
	if (IGAME::IsDev() && !IsDefined(self.MF))
	{
		level.MF.Ents.EntsList[level.MF.Ents.EntsList.size] = self;
		self Entity_MFInit();
	}
}

public Entity_UnRegister()
{
	if (IGAME::IsDev() && IsDefined(self.MF))
	{
		level.MF.Ents.EntsList = IARRAY::Remove(level.MF.Ents.EntsList, self);
		
		if (IsDefined(self.MF.bIsSpawned))
			self Delete();
		else
		{
			self Entity_Restore();
			self.MF = undefined;
		}
	}
}

public Entity_Restore()
{
	if (IGAME::IsDev() && IsDefined(self.MF))
	{
		if (IsDefined(self.MF.bIsDeleted))
		{
			self.MF.bIsDeleted = undefined;
			if (self.classname == "script_model" || self.classname == "script_brushmodel")
			{
				self Show();
				self Solid();
			}
		}
		
		keys = GetArrayKeys(self.MF.OrigPropValues);
		foreach (sKey in keys)
		{
			self IENTITY::SetValueByKey(sKey, self.MF.OrigPropValues[sKey]);
		}
		self.MF.OrigPropValues = [];
	}
}

private Entity_MFInit()
{
	self.MF = SpawnStruct();
	self.MF.bIsDeleted = undefined;
	self.MF.bIsSpawned = undefined;
	self.MF.OrigPropValues = [];
}

public Entity_GetPropOrigValue(sPropName)
{
	if (IGAME::IsDev() && !IsDefined(self.bIsFake))
	{
		if (sPropName == "origin")
			return self.vOrigOrigin;
		else if (sPropName == "targetname")
			return self.sOrigTargetName;
	}

	if (IsDefined(self.MF) && IsDefined(self.MF.OrigPropValues[sPropName]))
		return self.MF.OrigPropValues[sPropName];
	else
		return self IENTITY::GetValueByKey(sPropName);
}

private Tab = "    ";

public Entities_GetOutputForSave()
{
	ls = ILIST::Create();
	ls ILIST::Add(Tab + "// Entities");
	
	foreach (eEnt in level.MF.Ents.EntsList)
	{
		if (IsDefined(eEnt.MF.bIsSpawned) && IsDefined(eEnt.MF.bIsDeleted))
			continue;
	
		origOrigin = eEnt Entity_GetPropOrigValue("origin");
		origTargetName = eEnt Entity_GetPropOrigValue("targetname");
		
		if (IsDefined(eEnt.MF.bIsSpawned))
		{
			if (IsDefined(origTargetName) && IsDefined(eEnt.radius) && IsDefined(eEnt.height))
				ls ILIST::Add(Tab + "eEnt = custom\\include\\_mapfixerutil::Entity_Spawn(\"" + eEnt.classname + "\", " + origOrigin + ", \"" + origTargetName + "\", " + eEnt.radius + ", " + eEnt.height + ");");
			else if (IsDefined(origTargetName))
				ls ILIST::Add(Tab + "eEnt = custom\\include\\_mapfixerutil::Entity_Spawn(\"" + eEnt.classname + "\", " + origOrigin + ", \"" + origTargetName + "\");");
			else if (IsDefined(eEnt.radius) && IsDefined(eEnt.height))
				ls ILIST::Add(Tab + "eEnt = custom\\include\\_mapfixerutil::Entity_Spawn(\"" + eEnt.classname + "\", " + origOrigin + ", undefined, " + eEnt.radius + ", " + eEnt.height + ");");
			else
				ls ILIST::Add(Tab + "eEnt = custom\\include\\_mapfixerutil::Entity_Spawn(\"" + eEnt.classname + "\", " + origOrigin + ");");
		}
		else
		{
			if (IsDefined(origTargetName))
				ls ILIST::Add(Tab + "eEnt = custom\\include\\_mapfixerutil::Entity_Get(\"" + eEnt.classname + "\", " + origOrigin + ", \"" + origTargetName + "\");");
			else
				ls ILIST::Add(Tab + "eEnt = custom\\include\\_mapfixerutil::Entity_Get(\"" + eEnt.classname + "\", " + origOrigin + ");");
		}
		
		if (IsDefined(eEnt.MF.bIsDeleted))
			ls ILIST::Add(Tab + "eEnt custom\\include\\_mapfixerutil::Entity_Delete();");
		else
		{
			keys = GetArrayKeys(eEnt.MF.OrigPropValues);
			foreach (sKey in keys)
			{
				value = eEnt IENTITY::GetValueByKey(sKey);
				if (IsString(value))
					value = "\"" + value + "\"";
					
				ls ILIST::Add(Tab + "eEnt custom\\include\\_mapfixerutil::Entity_Property(\"" + sKey + "\", " + value + ");");
			}
		}
		
		ls ILIST::Add("");
	}
	
	ls ILIST::Add("");
	return ls;
}

#endregion
// ======================================================================================= //
#region BoxGroup

public sealed BG_HurtClassName = "BG_Hurt";
public sealed BG_CollideClassName = "BG_Collide";
public sealed BG_BulletWallClassName = "BG_BulletWall";

public sealed BGShape_CuboidClassName = "SHAPE_Cuboid";

private BG_Create()
{
	bg = SpawnStruct();
	bg.Cuboids = [];
	
	return bg;
}


public BG_CreateHurt(iDmg, [sTeam])
{
	bg = BG_Create();
	bg.iDmg = iDmg;
	bg.sTeam = sTeam;
	
	if (IGAME::IsDev())
		bg.sClassName = BG_HurtClassName;
	
	level.MF.Boxes.Hurts[level.MF.Boxes.Hurts.size] = bg;
	return bg;
}

private BG_UnRegHurt()
{
	level.MF.Boxes.Hurts = IARRAY::Remove(level.MF.Boxes.Hurts, self);
}


public BG_CreateCollide([sTeam])
{
	bg = BG_Create();
	bg.sTeam = sTeam;
	
	if (IGAME::IsDev())
		bg.sClassName = BG_CollideClassName;
	
	level.MF.Boxes.Collides[level.MF.Boxes.Collides.size] = bg;
	return bg;
}

private BG_UnRegCollide()
{
	level.MF.Boxes.Collides = IARRAY::Remove(level.MF.Boxes.Collides, self);
}


public BG_CreateBulletWall([sTeam])
{
	bg = BG_Create();
	bg.sTeam = sTeam;
	
	if (IGAME::IsDev())
		bg.sClassName = BG_BulletWallClassName;
	
	level.MF.Boxes.BulletWalls[level.MF.Boxes.BulletWalls.size] = bg;
	return bg;
}

private BG_UnRegBulletWall()
{
	level.MF.Boxes.BulletWalls = IARRAY::Remove(level.MF.Boxes.BulletWalls, self);
}


public BG_UnReg()
{
	self BG_UnRegHurt();
	self BG_UnRegCollide();
	self BG_UnRegBulletWall();
}

public BG_RemoveShape(shape)
{
	switch (shape.sClassName)
	{
		case BGShape_CuboidClassName:
			self BG_RemoveCuboid(shape);
			break;
		default:
			IEXCEPTION::InvalidOperationMsg("Unknown shape " + shape.sClassName);
			break;
	}
}
/*
public sealed BulletBool_BothInside = 0;
public sealed BulletBool_BothOutside = 1;
public sealed BulletBool_InsideOutside = 2;
public Box_BulletBool(iType)
{
	box = Box_Create();
	box.iType = iType;
	
	level.MF.Boxes.BulletBoolsList[level.MF.Boxes.BulletBoolsList.size] = box;
	return box;
}

public Box_BulletBoolDelete()
{
	level.MF.Boxes.BulletBoolsList = IARRAY::Remove(level.MF.Boxes.BulletBoolsList, self);
}
*/
public BG_AddCuboid(vOrigin, vSize, vAngles, [vPivot])
{
	cuboid = ISHAPE::Cuboid_Create(vOrigin, vSize, vAngles, vPivot);
	cuboid.BG = self;
	
	if (IGAME::IsDev())
		cuboid.sClassName = BGShape_CuboidClassName;
	
	self.Cuboids[self.Cuboids.size] = cuboid;
}

private BG_RemoveCuboid(cuboid)
{
	self.Cuboids = IARRAY::Remove(self.Cuboids, cuboid);
}

public BG_GetShapes()
{
	return self.Cuboids;
}

private BG_GetOutputShapes(ls, shapes)
{
	foreach (shape in shapes)
	{
		switch (shape.sClassName)
		{
			case BGShape_CuboidClassName:
				ls ILIST::Add(Tab + "bg custom\\include\\_mapfixerutil::BG_AddCuboid(" + shape.vOrigin + ", " + shape.vSize + ", " + shape.vAngles + ", " + shape.vPivot + ");");
				break;
			default:
				IEXCEPTION::InvalidOperationMsg();
				break;
		}
	}
	
	return ls;
}

public BG_GetOutputForSave()
{
	ls = ILIST::Create();
	ls ILIST::Add(Tab + "// BoxGroups");
	
	foreach (bg in level.MF.Boxes.Hurts)
	{
		shapes = bg BG_GetShapes();
		if (shapes.size == 0)
			continue;
		
		iDmg = bg.iDmg;
		sTeam = bg.sTeam;
		if (!IsDefined(sTeam))	sTeam = "undefined";
		else					sTeam = "\"" + sTeam + "\"";
		
		ls ILIST::Add(Tab + "bg = custom\\include\\_mapfixerutil::BG_CreateHurt(" + iDmg + ", " + sTeam + ");");
		ls = BG_GetOutputShapes(ls, shapes);
		ls ILIST::Add("");
	}
	
	foreach (bg in level.MF.Boxes.Collides)
	{
		shapes = bg BG_GetShapes();
		if (shapes.size == 0)
			continue;
		
		sTeam = bg.sTeam;
		if (!IsDefined(sTeam))	sTeam = "undefined";
		else					sTeam = "\"" + sTeam + "\"";
		
		ls ILIST::Add(Tab + "bg = custom\\include\\_mapfixerutil::BG_CreateCollide(" + sTeam + ");");
		ls = BG_GetOutputShapes(ls, shapes);
		ls ILIST::Add("");
	}
	
	foreach (bg in level.MF.Boxes.BulletWalls)
	{
		shapes = bg BG_GetShapes();
		if (shapes.size == 0)
			continue;
		
		sTeam = bg.sTeam;
		if (!IsDefined(sTeam))	sTeam = "undefined";
		else					sTeam = "\"" + sTeam + "\"";
		
		ls ILIST::Add(Tab + "bg = custom\\include\\_mapfixerutil::BG_CreateBulletWall(" + sTeam + ");");
		ls = BG_GetOutputShapes(ls, shapes);
		ls ILIST::Add("");
	}

	ls ILIST::Add("");
	return ls;
}

#endregion
// ======================================================================================= //