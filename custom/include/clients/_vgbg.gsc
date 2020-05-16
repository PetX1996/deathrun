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

public sealed LEGEND = "^1Selected ^2Hurt ^3Collide ^4BulletWall";

public Create()
{
	self.BG = SpawnStruct();
	
	// public
	self.BG.dBeginMoving = undefined;
	self.BG.dMoving = undefined;
	self.BG.dFinishMoving = undefined;
		self.BG.vMovingStartOrigin = undefined;
	
	self.BG.dBeginRotating = undefined;
	self.BG.dRotating = undefined;
	self.BG.dFinishRotating = undefined;
		self.BG.vRotatingStartAngles = undefined;
	
	self.BG.dChooseBegin = undefined;
		self.BG.Sources = undefined;
		
	self.BG.dChooseSwitch = undefined; // bool VG func(eEnt)
	self.BG.dChooseFinish = undefined;
	
	self.BG.dShowing = undefined;
		self.BG.eShowingShape = undefined;
		self.BG.vShowingColor = undefined;
		self.BG.sShowingTextA = undefined;
		self.BG.sShowingTextB = undefined;

	// private
	self.BG.vLastSourcesPos = undefined;
	self.BG.iLastSourcesCount = undefined;
	self.BG.Shapes = undefined;
	
	self.BG.eLastSelected = undefined;
	self.BG.eSelected = undefined;
	self.BG.eHolding = undefined;
	
	self.BG.PropsDic = undefined;
	self.BG.BGPropsDic = undefined;
	self.BG.iPropSelected = undefined;
	self.BG.iBGPropSelected = undefined;
	self.BG.Prop_SelectedBG = undefined;
	self.BG.Prop_SelectedShape = undefined;
	self.BG.Prop_sSelectedKey = undefined;
	
	self.BG.fMovingDist = undefined;
	self.BG.vMovingDiff = undefined;
	
	self.BG.fPivotMovingDist = undefined;
	self.BG.vPivotMovingDiff = undefined;
	self.BG.vPivotMovingStartOrigin = undefined;
	
	self.BG.fRotatingDist = undefined;
	
	self.BG.AddShape_bValidClose = undefined;
	self.BG.AddShape_bWasCreatedBG = undefined;
	self.BG.SelectedBG = undefined;
	
	self thread BGThread();
}

public Close()
{
	self notify("bgClose");
	
	self.BG = undefined;
}

private BGThread()
{
	self.pOwner endon("disconnect");
	self endon("close");
	self endon("bgClose");

	while (true)
	{
		self ChooseForShow();
		
		if (!IsDefined(self.BG.eHolding))
		{
			self.BG.eLastSelected = self.BG.eSelected;
			self.BG.eSelected = self FindSelected();
		}
		else if (IsDefined(self.BG.fMovingDist))
			self MovingUpdate();
		else if (IsDefined(self.BG.fPivotMovingDist))
			self PivotMovingUpdate();
		else if (IsDefined(self.BG.fRotatingDist))
			self RotatingUpdate();
		
		self PropsUpdate();
		
		self ShowOnMap();
		
		wait 0.05;
	}
}

private RangeSteps = 4;
private MaxRange = 10000;
private RangeUpdate = 65536; // 256 ^ 2
private MaxCount = ISHAPE::DrawTextLimit / 2;
private ChooseForShow()
{
	if (IsDefined(self.BG.dChooseBegin))
		self [[self.BG.dChooseBegin]]();
	
	if (!IsDefined(self.BG.Sources))
		self.BG.Sources = self GetSources();

	if (IsDefined(self.BG.iLastSourcesCount) 
		&& IsDefined(self.BG.iLastSourcesCount)
		&& self.BG.Sources.size == self.BG.iListSourceCount
		&& DistanceSquared(self.BG.iLastSourcesCount, self.pOwner.origin) < RangeUpdate)
	{
		self.BG.Sources = undefined;
		return;
	}
	
	self.BG.iLastSourcesCount = self.pOwner.origin;
	self.BG.iListSourceCount = self.BG.Sources.size;
		
	iRange = 0;
	iRangeSteps = 0;
	if (self.BG.Sources.size >= MaxCount)
		iRangeSteps = GetAverageBGDist(self.pOwner.origin, self.BG.Sources) / RangeSteps;
	else
		iRange = MaxRange;
		
	leftList = ILIST::Create();
	leftList ILIST::AddArray(self.BG.Sources);
	news = [];
	
	while (news.size < MaxCount)
	{
		iRange += iRangeSteps;
		
		if (leftList.iCount <= 0)
			break;
		
		for (i = 0; i < leftList.iCount; i++)
		{
			shape = leftList ILIST::Get(i);
			
			if (IsDefined(self.BG.dChooseSwitch) && !self [[self.BG.dChooseSwitch]](shape))
			{
				leftList ILIST::RemoveAt(i);
				i--;
			}
			else if (iRange >= MaxRange || Distance(shape.vOrigin, self.pOwner.origin) < iRange)
			{
				news[news.size] = shape;
				leftList ILIST::RemoveAt(i);
				i--;
			}	
			
			if (news.size >= MaxCount)
				break;
		}
	}
	
	self.BG.Shapes = news;
	
	if (IsDefined(self.BG.dChooseFinish))
		self [[self.BG.dChooseFinish]]();
	
	self UpdateShownStats();
	
	self.BG.Sources = undefined;
}

private GetSources()
{
	sourcesList = ILIST::Create();
	
	hurts = 0;
	collides = 0;
	bulletWallls = 0;
	
	foreach (bg in level.MF.Boxes.Hurts)
	{
		shapes = bg C_IMAPFIXERUTIL::BG_GetShapes();
		sourcesList ILIST::AddArray(shapes);
		
		self DrawShapesConnection(shapes, (0, 1, 0));
		hurts += shapes.size;
	}
	
	foreach (bg in level.MF.Boxes.Collides)
	{
		shapes = bg C_IMAPFIXERUTIL::BG_GetShapes();
		sourcesList ILIST::AddArray(shapes);
		
		self DrawShapesConnection(shapes, (0, 1, 1));
		collides += shapes.size;
	}
	
	foreach (bg in level.MF.Boxes.BulletWalls)
	{
		shapes = bg C_IMAPFIXERUTIL::BG_GetShapes();
		sourcesList ILIST::AddArray(shapes);
		
		self DrawShapesConnection(shapes, (0, 0, 1));
		bulletWallls += shapes.size;
	}
	
	self C_ICVG::AddTextSet(2, "^2Hurts: " + level.MF.Boxes.Hurts.size + "(" + hurts + ")");
	self C_ICVG::AddTextSet(3, "^3Collides: " + level.MF.Boxes.Collides.size + "(" + collides + ")");
	self C_ICVG::AddTextSet(4, "^4BulletWalls: " + level.MF.Boxes.BulletWalls.size + "(" + bulletWallls + ")");
	
	return sourcesList ILIST::ToArray();
}

private DrawShapesConnection(shapes, vColor)
{
	for (i = 0; i < shapes.size; i++)
	{
		j = (i + 1) % shapes.size;
		ISHAPE::DrawLine(shapes[i].vOrigin, shapes[j].vOrigin, vColor);
	}
}

private GetAverageBGDist(vPoint, shapes)
{
	fSum = 0;
	foreach (shape in shapes)
		fSum += Distance(shape.vOrigin, vPoint);

	return fSum / shapes.size;
}

private UpdateShownStats()
{
	self C_ICVG::AddTextSet(0, "Shown: " + self.BG.Shapes.size + "/" + self.BG.Sources.size);
}

private FindSelected()
{
	pVec = self.pOwner ILOOK::GetPlayerLookVector();
	fLastDot = 0.85;
	selectedShape = undefined;
	foreach (shape in self.BG.Shapes)
	{
		fDot = VectorDot(pVec, VectorNormalize(shape.vOrigin - self.pOwner ILOOK::GetPlayerViewPos()));
		if (fDot > fLastDot)
		{
			fLastDot = fDot;
			selectedShape = shape;
		}
	}
	return selectedShape;
}

private ShowOnMap()
{
	foreach (shape in self.BG.Shapes)
	{
		self.BG.eShowingShape = shape;
		self.BG.vShowingColor = (1, 1, 1);
		self.BG.sShowingTextA = shape.BG.sClassName;
		self.BG.sShowingTextB = "";
		
		if (IsDefined(self.BG.eSelected) && shape == self.BG.eSelected)
			self.BG.vShowingColor = (1, 0, 0);
		
		bgColor = (1, 1, 1);
		switch (shape.BG.sClassName)
		{
			case C_IMAPFIXERUTIL::BG_HurtClassName:
				bgColor = (0, 1, 0);
				break;
			case C_IMAPFIXERUTIL::BG_CollideClassName:
				bgColor = (1, 1, 0);
				break;
			case C_IMAPFIXERUTIL::BG_BulletWallClassName:
				bgColor = (0, 0, 1);
				break;
			default:
				IEXCEPTION::InvalidOperationMsg("Unknown bg " + shape.BG.sClassName);
		}
		
		switch (shape.sClassName)
		{
			case C_IMAPFIXERUTIL::BGShape_CuboidClassName:
				shape ISHAPE::Cuboid_Draw(bgColor, true);
				break;
			default:
				IEXCEPTION::InvalidOperationMsg("Unknown shape " + shape.sClassName);
				break;
		}
		
		if (IsDefined(self.BG.sShowingTextB))
			ISHAPE::DrawText(shape.vOrigin + (0, 0, 15), self.BG.sShowingTextB, self.BG.vShowingColor);
		if (IsDefined(self.BG.sShowingTextA))
			ISHAPE::DrawText(shape.vOrigin, self.BG.sShowingTextA, self.BG.vShowingColor);
		else
			ISHAPE::DrawText(shape.vOrigin, "Unknown shape", self.BG.vShowingColor);
	}
}

private PropsUpdate()
{
	if (!IsDefined(self.BG.eSelected))
	{
		self PropsReset();
		self C_ICVG::TextClear();
	}
	else
	{
		self PropsShow();
	}
}

private PropsReset()
{
	self.BG.PropsDic = undefined;
	self.BG.BGPropsDic = undefined;
}

private PropsShow()
{
	if (!ITYPE::IsEqual(self.BG.eLastSelected, self.BG.eSelected) 
		|| !IsDefined(self.BG.PropsDic) || !IsDefined(self.BG.BGPropsDic))
	{
		self.BG.PropsDic = [];
		self.BG.BGPropsDic = [];
		shape = self.BG.eSelected;
		bg = shape.BG;
		
		switch (bg.sClassName)
		{
			case C_IMAPFIXERUTIL::BG_HurtClassName:
				BGPropRegister("iDmg", bg.iDmg);
				BGPropRegister("sTeam", bg.sTeam);
				break;
			case C_IMAPFIXERUTIL::BG_CollideClassName:
				BGPropRegister("sTeam", bg.sTeam);
				break;
			case C_IMAPFIXERUTIL::BG_BulletWallClassName:
				BGPropRegister("sTeam", bg.sTeam);
				break;
			default:
				IEXCEPTION::InvalidOperationMsg();
				break;
		}

		switch (shape.sClassName)
		{
			case C_IMAPFIXERUTIL::BGShape_CuboidClassName:
				PropRegister("sClassName", shape.sClassName);
				PropRegister("vOrigin", shape.vOrigin);
				PropRegister("vAngles", shape.vAngles);
				PropRegister("vSize", shape.vSize);
				PropRegister("vPivot", shape.vPivot);
				break;
			default:
				IEXCEPTION::InvalidOperationMsg();
				break;
		}
		
		if (IsDefined(self.BG.iPropSelected))
		{
			self.BG.iBGPropSelected = 0;
			self.BG.iPropSelected = -1;
			
			self PropCheckAvailables();
		}
	}

	keys = GetArrayKeys(self.BG.BGPropsDic);
	for (i = 0; i < keys.size; i++)
		self BGPropShow(i, keys[i], self.BG.BGPropsDic[keys[i]]);
	
	self C_ICVG::TextSet(self.BG.BGPropsDic.size, "");
	
	keys = GetArrayKeys(self.BG.PropsDic);
	for (i = 0; i < keys.size; i++)
		self PropShow(i, keys[i], self.BG.PropsDic[keys[i]]);	
	
	self C_ICVG::TextClear(self.BG.BGPropsDic.size + 1 + self.BG.PropsDic.size);
}


private BGPropRegister(sName, value)
{
	if (IsDefined(value))
		self.BG.BGPropsDic[sName] = value;
	else
		self.BG.BGPropsDic[sName] = "undefined";
}


private PropRegister(sName, value)
{
	if (IsDefined(value))
		self.BG.PropsDic[sName] = value;
	else
		self.BG.PropsDic[sName] = "undefined";
}


private BGPropShow(iIndex, sName, value)
{
	if (IsDefined(self.BG.iBGPropSelected) && self.BG.iBGPropSelected == iIndex)
		self C_ICVG::TextSet(iIndex, "^1" + sName + ": " + value);
	else
		self C_ICVG::TextSet(iIndex, sName + ": " + value);
}

private PropShow(iIndex, sName, value)
{
	if (IsDefined(self.BG.iPropSelected) && self.BG.iPropSelected == iIndex)
		self C_ICVG::TextSet(self.BG.BGPropsDic.size + 1 + iIndex, "^1" + sName + ": " + value);
	else
		self C_ICVG::TextSet(self.BG.BGPropsDic.size + 1 + iIndex, sName + ": " + value);
}

// ============================================================================== //
#region Moving

public MenuMove()
{
	if (IsDefined(self.BG.fMovingDist))
	{
		if (IsDefined(self.BG.dFinishMoving))
			self [[self.BG.dFinishMoving]]();
	
		//eEnt = self.BG.eHolding;
		//eEnt C_IMAPFIXERUTIL::Entity_Property("origin", eEnt.origin);
	
		self C_ICVG::Menu_TurnBtnOff(0);
		self.BG.eHolding = undefined;
		self.BG.fMovingDist = undefined;
		self.BG.vMovingDiff = undefined;
		self.BG.vMovingStartOrigin = undefined;
		return;
	}
	else if (!IsDefined(self.BG.eSelected) 
		|| self.BG.eSelected == self.pOwner
		|| IsDefined(self.BG.eHolding))
	{
		self C_ICVG::Menu_TurnBtnOff(0);
		return;
	}
	
	if (IsDefined(self.BG.dBeginMoving))
		self [[self.BG.dBeginMoving]]();
	
	self.BG.eHolding = self.BG.eSelected;
	
	shape = self.BG.eHolding;
	pPos = self.pOwner ILOOK::GetPlayerViewPos();
	fDist = Distance(pPos, shape.vOrigin);
	
	vLook = self.pOwner ILOOK::GetPlayerLookVector() * fDist;
	vDiff = (shape.vOrigin - pPos) - vLook;
	
	self.BG.fMovingDist = fDist;
	self.BG.vMovingDiff = vDiff;
	
	self.BG.vMovingStartOrigin = shape.vOrigin;
}

private MovingUpdate()
{
	shape = self.BG.eHolding;
	pPos = self.pOwner ILOOK::GetPlayerViewPos();
	fDist = self.BG.fMovingDist;
	
	vLook = self.pOwner ILOOK::GetPlayerLookVector() * fDist;
	vDiff = self.BG.vMovingDiff;
	
	shape ISHAPE::Cuboid_SetOrigin(pPos + vLook + vDiff);
	
	if (IsDefined(self.BG.dMoving))
		self [[self.BG.dMoving]]();
		
	self PropsReset();
}

#endregion
// ============================================================================== //
#region PivotMoving

public MenuPivotMove()
{
	if (IsDefined(self.BG.fPivotMovingDist))
	{
		if (IsDefined(self.BG.dFinishPivotMoving))
			self [[self.BG.dFinishPivotMoving]]();
	
		//eEnt = self.BG.eHolding;
		//eEnt C_IMAPFIXERUTIL::Entity_Property("origin", eEnt.origin);
		self.BG.eHolding ISHAPE::Cuboid_UpdateVertices();
	
		self C_ICVG::Menu_TurnBtnOff(1);
		self.BG.eHolding = undefined;
		self.BG.fPivotMovingDist = undefined;
		self.BG.vPivotMovingDiff = undefined;
		self.BG.vPivotMovingStartOrigin = undefined;
		return;
	}
	else if (!IsDefined(self.BG.eSelected) 
		|| self.BG.eSelected == self.pOwner
		|| IsDefined(self.BG.eHolding))
	{
		self C_ICVG::Menu_TurnBtnOff(1);
		return;
	}
	
	if (IsDefined(self.BG.dBeginPivotMoving))
		self [[self.BG.dBeginPivotMoving]]();
	
	self.BG.eHolding = self.BG.eSelected;
	
	shape = self.BG.eHolding;
	pPos = self.pOwner ILOOK::GetPlayerViewPos();
	fDist = Distance(pPos, shape.vPivot);
	
	vLook = self.pOwner ILOOK::GetPlayerLookVector() * fDist;
	vDiff = (shape.vPivot - pPos) - vLook;
	
	self.BG.fPivotMovingDist = fDist;
	self.BG.vPivotMovingDiff = vDiff;
	
	self.BG.vPivotMovingStartOrigin = shape.vPivot;
}

private PivotMovingUpdate()
{
	shape = self.BG.eHolding;
	pPos = self.pOwner ILOOK::GetPlayerViewPos();
	fDist = self.BG.fPivotMovingDist;
	
	vLook = self.pOwner ILOOK::GetPlayerLookVector() * fDist;
	vDiff = self.BG.vPivotMovingDiff;
	
	shape ISHAPE::Cuboid_SetPivot(pPos + vLook + vDiff);
	
	if (IsDefined(self.BG.dPivotMoving))
		self [[self.BG.dPivotMoving]]();
		
	self PropsReset();
}

#endregion
// ============================================================================== //
#region Rotating

public MenuRotate()
{
	if (IsDefined(self.BG.fRotatingDist))
	{
		if (IsDefined(self.BG.dFinishRotating))
			self [[self.BG.dFinishRotating]]();
	
		//eEnt = self.BG.eHolding;
		//eEnt C_IMAPFIXERUTIL::Entity_Property("angles", eEnt.angles);
	
		self C_ICVG::Menu_TurnBtnOff(2);
		self.BG.eHolding = undefined;
		self.BG.fRotatingDist = undefined;
		self.BG.vRotatingStartAngles = undefined;
		return;
	}
	else if (!IsDefined(self.BG.eSelected) 
		|| self.BG.eSelected == self.pOwner
		|| IsDefined(self.BG.eHolding))
	{
		self C_ICVG::Menu_TurnBtnOff(2);
		return;
	}
	
	if (IsDefined(self.BG.dBeginRotating))
		self [[self.BG.dBeginRotating]]();
	
	self.BG.eHolding = self.BG.eSelected;

	shape = self.BG.eHolding;
	pPos = self.pOwner ILOOK::GetPlayerViewPos();
	
	fDist = Distance(pPos, shape.vPivot);
	
	self.BG.fRotatingDist = fDist;
	
	self.BG.vRotatingStartAngles = shape.vAngles;
}

private RotatingUpdate()
{
	shape = self.BG.eHolding;
	pPos = self.pOwner ILOOK::GetPlayerViewPos();
	fDist = self.BG.fRotatingDist;
	
	vLook = self.pOwner ILOOK::GetPlayerLookVector() * fDist;
	vDiff = vLook - (shape.vPivot - pPos);
	
	shape ISHAPE::Cuboid_SetAngles(VectorToAngles(vDiff));

	if (IsDefined(self.BG.dRotating))
		self [[self.BG.dRotating]]();
		
	self PropsReset();
}

#endregion
// ============================================================================== //
#region Properties

public MenuProps()
{
	if (!IsDefined(self.BG.eSelected) 
		|| self.BG.eSelected == self.pOwner
		|| IsDefined(self.BG.eHolding))
	{
		return;
	}

	self C_ICVG::Menu_Clear(true, ::MenuProp_OnClose);
	self C_ICVG::Menu_RegisterBtn(0, "Prev", ::MenuProp_OnPrev);
	self C_ICVG::Menu_RegisterBtn(1, "Next", ::MenuProp_OnNext);
	self C_ICVG::Menu_RegisterBtn(2, "Select", ::MenuProp_OnSel);
	self C_ICVG::Menu_RegisterBtn(3, "Delete", ::MenuProp_OnDel);
	self C_ICVG::Menu_Show();

	self.BG.iBGPropSelected = 0;
	self.BG.iPropSelected = -1;
	self PropCheckAvailables();
	
	self.BG.eHolding = self.BG.eSelected;
	
}

private MenuProp_OnClose()
{
	self.BG.iPropSelected = undefined;
	self.BG.iBGPropSelected = undefined;
	self.BG.eHolding = undefined;
}

private PropCheckAvailables()
{
	if (self.BG.iBGPropSelected >= 0 && self.BG.BGPropsDic.size == 0)
	{
		self.BG.iBGPropSelected = -1;
		self.BG.iPropSelected = 0;
	}

	if (self.BG.iPropSelected >= 0 && self.BG.PropsDic.size == 0)
	{
		self.BG.iPropSelected = -1;
	}
}

private MenuProp_OnPrev()
{
	if (self.BG.iBGPropSelected == 0 && self.BG.iPropSelected < 0)
	{
		if (self.BG.PropsDic.size > 0)
		{
			self.BG.iPropSelected = self.BG.PropsDic.size - 1;
			self.BG.iBGPropSelected = -1;
		}
		else
		{
			self.BG.iPropSelected = -1;
			self.BG.iBGPropSelected = self.BG.BGPropsDic.size - 1;			
		}
	}
	else if (self.BG.iPropSelected == 0 && self.BG.iBGPropSelected < 0)
	{
		if (self.BG.BGPropsDic.size > 0)
		{
			self.BG.iPropSelected = -1;
			self.BG.iBGPropSelected = self.BG.BGPropsDic.size - 1;
		}
		else
		{
			self.BG.iPropSelected = self.BG.PropsDic.size - 1;
			self.BG.iBGPropSelected = -1;			
		}
	}
	else if (self.BG.iBGPropSelected > 0)
		self.BG.iBGPropSelected--;
	else if (self.BG.iPropSelected > 0)
		self.BG.iPropSelected--;
	
	self PropCheckAvailables();
}

private MenuProp_OnNext()
{
	if (self.BG.iPropSelected >= 0)
		self.BG.iPropSelected++;
	else
		self.BG.iBGPropSelected++;
		
	if (self.BG.iPropSelected >= self.BG.PropsDic.size)
	{
		self.BG.iPropSelected = -1;
		self.BG.iBGPropSelected = 0;
	}
	else if (self.BG.iBGPropSelected >= self.BG.BGPropsDic.size)
	{
		self.BG.iPropSelected = 0;
		self.BG.iBGPropSelected = -1;
	}
	
	self PropCheckAvailables();
}

private MenuProp_OnSel()
{
	self.BG.Prop_SelectedBG = undefined;
	self.BG.Prop_SelectedShape = undefined;
	self.BG.Prop_sSelectedKey = undefined;

	sKey = undefined;
	value = undefined;
	if (self.BG.iBGPropSelected >= 0)
	{
		self.BG.Prop_SelectedBG = self.BG.eHolding.BG;
		keys = GetArrayKeys(self.BG.BGPropsDic);
		sKey = keys[self.BG.iBGPropSelected];
		value = self.BG.BGPropsDic[sKey];	
	}
	else if (self.BG.iPropSelected >= 0)
	{
		self.BG.Prop_SelectedShape = self.BG.eHolding;
		keys = GetArrayKeys(self.BG.PropsDic);
		sKey = keys[self.BG.iPropSelected];
		value = self.BG.PropsDic[sKey];	
	}
	else
		return;
	
	self.BG.Prop_sSelectedKey = sKey;
	self C_ICVG::TextBox_Show(sKey, ::MenuProp_OnSel_OnTextBoxOK, undefined, value);
}

private MenuProp_OnSel_OnTextBoxOK(sA, sB, sC)
{
	if (IsDefined(self.BG.Prop_SelectedBG))
		self.BG.Prop_SelectedBG SetBGKey(self.BG.Prop_sSelectedKey, sA);
	else if (IsDefined(self.BG.Prop_SelectedShape))
		self.BG.Prop_SelectedShape SetShapeKey(self.BG.Prop_sSelectedKey, sA);
	
	self C_ICVG::TextBox_Close();
	self PropsReset();
}

private SetBGKey(sKey, sValue)
{
	switch (sKey)
	{
		case "sTeam":
			self.sTeam = sValue;
			break;
		case "iDmg":
			if (IsDefined(sValue))
				self.iDmg = ITYPE::IntToStr(sValue);
			break;
		default:
			IEXCEPTION::InvalidOperationMsg();
	}
}

private SetShapeKey(sKey, sValue)
{
	switch (sKey)
	{
		case "vOrigin":
			if (IsDefined(sValue))
				self ISHAPE::Cuboid_SetOrigin(ITYPE::StrToVec(sValue));
			break;
		case "vSize":
			if (IsDefined(sValue))
				self ISHAPE::Cuboid_SetSize(ITYPE::StrToVec(sValue));
			break;
		case "vAngles":
			if (IsDefined(sValue))
				self ISHAPE::Cuboid_SetAngles(ITYPE::StrToVec(sValue));
			break;
		case "vPivot":
			if (IsDefined(sValue))
				self ISHAPE::Cuboid_SetPivot(ITYPE::StrToVec(sValue));
			break;
		default:
			IEXCEPTION::InvalidOperationMsg();
	}
}

private MenuProp_OnDel()
{
	if (self.BG.iBGPropSelected >= 0)
	{
		keys = GetArrayKeys(self.BG.BGPropsDic);
		sKey = keys[self.BG.iBGPropSelected];	
		self.BG.eHolding.BG SetBGKey(sKey, undefined);
	}
	else if (self.BG.iPropSelected >= 0)
	{
		keys = GetArrayKeys(self.BG.PropsDic);
		sKey = keys[self.BG.iPropSelected];
		self.BG.eHolding SetShapeKey(sKey, undefined);
	}
	else
		return;
	
	self PropsReset();
}

#endregion
// ============================================================================== //

public MenuDelete()
{
	shape = self.BG.eSelected;
	if (IsDefined(shape))
	{
		bg = shape.BG;
		bg C_IMAPFIXERUTIL::BG_RemoveShape(shape);
		
		if (bg C_IMAPFIXERUTIL::BG_GetShapes().size == 0)
			bg C_IMAPFIXERUTIL::BG_UnReg();
			
		self.BG.eSelected = undefined;
	}
}

// ============================================================================== //
#region CreateBG

public CreateBG_MenuOpen()
{
	self C_ICVG::Menu_Clear(true, ::CreateBG_MenuOnClose);
	self C_ICVG::Menu_RegisterBtn(0, "Hurt", ::CreateBG_MenuOnHurt);
	self C_ICVG::Menu_RegisterBtn(1, "Collide", ::CreateBG_MenuOnCollide);
	self C_ICVG::Menu_RegisterBtn(2, "BulletWall", ::CreateBG_MenuOnBulletWall);
	self C_ICVG::Menu_Show();
}

private CreateBG_MenuOnClose()
{}

private CreateBG_MenuOnHurt()
{
	self C_ICVG::Menu_OnBackBtn();
	
	self C_ICVG::TextBox_Show(C_IMAPFIXERUTIL::BG_HurtClassName, ::CreateBG_Hurt_OnTextBoxOK, undefined, "iDmg", "sTeam");
}

private CreateBG_Hurt_OnTextBoxOK(sA, sB, sC)
{
	iDmg = sA;
	sTeam = sB;
	
	if (sA == "iDmg" || sA == "")
		iDmg = 1000;
		
	if (sB == "sTeam" || sB == "")
		sTeam = undefined;
		
	iDmg = ITYPE::StrToInt(iDmg);
	
	hurtBG = C_IMAPFIXERUTIL::BG_CreateHurt(iDmg, sTeam);
	
	self C_ICVG::TextBox_Close();
	
	self.BG.SelectedBG = hurtBG;
	self.BG.AddShape_bWasCreatedBG = true;
	self AddShape_MenuOpen();
}


private CreateBG_MenuOnCollide()
{
	self C_ICVG::Menu_OnBackBtn();
	
	self C_ICVG::TextBox_Show(C_IMAPFIXERUTIL::BG_CollideClassName, ::CreateBG_Collide_OnTextBoxOK, undefined, "sTeam");
}

private CreateBG_Collide_OnTextBoxOK(sA, sB, sC)
{
	sTeam = sA;

	if (sA == "sTeam" || sA == "")
		sTeam = undefined;
	
	collideBG = C_IMAPFIXERUTIL::BG_CreateCollide(sTeam);
	
	self C_ICVG::TextBox_Close();
	
	self.BG.SelectedBG = collideBG;
	self.BG.AddShape_bWasCreatedBG = true;
	self AddShape_MenuOpen();
}


private CreateBG_MenuOnBulletWall()
{
	self C_ICVG::Menu_OnBackBtn();
	
	self C_ICVG::TextBox_Show(C_IMAPFIXERUTIL::BG_BulletWallClassName, ::CreateBG_BulletWall_OnTextBoxOK, undefined, "sTeam");
}

private CreateBG_BulletWall_OnTextBoxOK(sA, sB, sC)
{
	sTeam = sA;

	if (sA == "sTeam" || sA == "")
		sTeam = undefined;
	
	bulletWallBG = C_IMAPFIXERUTIL::BG_CreateBulletWall(sTeam);
	
	self C_ICVG::TextBox_Close();
	
	self.BG.SelectedBG = bulletWallBG;
	self.BG.AddShape_bWasCreatedBG = true;
	self AddShape_MenuOpen();
}

#endregion
// ============================================================================== //
#region AddShape

public AddShape_MenuOpen()
{
	if (!IsDefined(self.BG.SelectedBG) && IsDefined(self.BG.eSelected))
		self.BG.SelectedBG = self.BG.eSelected.BG;
		
	if (!IsDefined(self.BG.SelectedBG))
		return;

	self C_ICVG::Menu_Clear(true, ::AddShape_MenuOnClose);
	self C_ICVG::Menu_RegisterBtn(0, "Cuboid", ::AddShape_MenuOnCuboid);
	self C_ICVG::Menu_Show();
}

private AddShape_MenuOnClose()
{
	if (IsDefined(self.BG.AddShape_bValidClose))
	{
		self.BG.AddShape_bValidClose = undefined;
		return;
	}
	
	// AddShape menu has been closed -> delete created BG
	if (IsDefined(self.BG.AddShape_bWasCreatedBG) && IsDefined(self.BG.SelectedBG))
	{
		self.BG.AddShape_bWasCreatedBG = undefined;
		self.BG.SelectedBG C_IMAPFIXERUTIL::BG_UnReg();
	}
	
	self.BG.SelectedBG = undefined;
}

private AddShape_MenuOnCuboid()
{
	self.BG.AddShape_bValidClose = true;
	self C_ICVG::Menu_OnBackBtn(); // closes AddShape choices -> lost BG
	
	self C_ICVG::TextBox_Show(self.BG.SelectedBG.sClassName + " - " + C_IMAPFIXERUTIL::BGShape_CuboidClassName, ::AddShape_Cuboid_OnTextBoxOK, ::AddShape_Cuboid_OnTextBoxCancel, self.pOwner.origin, (10, 10, 10), (0, 0, 0));
}

private AddShape_Cuboid_OnTextBoxOK(sA, sB, sC)
{
	vOrigin = ITYPE::StrToVec(sA);
	vSize = ITYPE::StrToVec(sB);
	vAngles = ITYPE::StrToVec(sC);

	self.BG.SelectedBG C_IMAPFIXERUTIL::BG_AddCuboid(vOrigin, vSize, vAngles);
	self.BG.SelectedBG = undefined;
	
	self C_ICVG::TextBox_Close();
}

private AddShape_Cuboid_OnTextBoxCancel()
{
	self.BG.SelectedBG = undefined;
}

#endregion
// ============================================================================== //