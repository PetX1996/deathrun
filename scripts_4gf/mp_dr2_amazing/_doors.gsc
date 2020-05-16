// +========================================================================+
// I                    ___  _____  _____                                   I
// I                   /   !!  __ \!  ___!                                  I
// I                  / /! !! !  \/! !_          ___  ____                  I
// I                 / /_! !! ! __ !  _!        / __!!_  /                  I
// I                 \___  !! !_\ \! !      _  ! (__  / /                   I
// I                     !_/ \____/\_!     (_)  \___!/___!                  I
// I                                                                        I
// I========================================================================I
// I                           mp_dr2_amazing                               I
// I========================================================================I
// I                      mapped by:  R3MIEN, Col!ar      		            I
// I                    scripted by:  PetX                                  I
// I                        website:  www.4GF.cz                            I
// I========================================================================I
// I                           DEATHRUN 2 MOD                               I
// I========================================================================I

//script_noteworthy	- string - axis
//script_label		- string - smer pohybu

main()
{
	thread SearchDoors();
}

SearchDoors()
{
	for (i = 0; i < 30; i++)
	{
		eTrig = GetEnt("door_" + i, "targetname");
		
		if (!IsDefined(eTrig))
			continue;

		doors = [];

		doors = GetEntArray(eTrig.target, "targetname");
		eTrig InitiliazeDoor(doors);
	}
}

InitiliazeDoor(doors)
{
	iAxis = GetAxisIndex(doors[0].script_noteworthy);
	iTrace = Int(doors[0].script_trace);
	
	if (doors.size == 1)
	{
		eDoor = doors[0];
		
		eDoor.vStartPos = eDoor.origin;

		if (eDoor.script_label == "r")
			eDoor.vTargetPos = IncLengthOnAxis(eDoor.origin, iAxis, iTrace);
		else
			eDoor.vTargetPos = IncLengthOnAxis(eDoor.origin, iAxis, iTrace * (-1));
	}
	else if (doors.size == 2)
	{
		doors[0].vStartPos = doors[0].origin;
		doors[1].vStartPos = doors[1].origin;
	
		if (doors[0].origin[iAxis] > doors[1].origin[iAxis])
		{
			doors[0].vTargetPos = IncLengthOnAxis(doors[0].origin, iAxis, iTrace);
			doors[1].vTargetPos = IncLengthOnAxis(doors[1].origin, iAxis, iTrace * (- 1));
		}
		else
		{
			doors[0].vTargetPos = IncLengthOnAxis(doors[0].origin, iAxis, iTrace * (- 1));
			doors[1].vTargetPos = IncLengthOnAxis(doors[1].origin, iAxis, iTrace);
		}
	}
		
	self thread MonitorDoor(doors);
}

IncLengthOnAxis(vPos, iAxis, fLength)
{
	if (iAxis == 0)
		return vPos + (fLength, 0, 0);
	else if (iAxis == 1)
		return vPos + (0, fLength, 0);
	else
		return vPos + (0, 0, fLength);
}

GetAxisIndex(sAxis)
{
	if (sAxis == "x")
		return 0;
	else if (sAxis == "y")
		return 1;
	else
		return 2;
}

MonitorDoor(doors)
{
	fSpeed = 50;
	bIsClosing = false;
	bIsOpening = false;
	
	while (true)
	{
		if (self IsTriggerTouched())
		{
			if (!bIsOpening)
			{
				foreach (eDoor in doors)
				{
					if (eDoor.origin != eDoor.vTargetPos)
					{
						bIsOpening = true;
						bIsClosing = false;
						eDoor PlayLoopSound("bigdoor");
						fTime = Distance(eDoor.origin, eDoor.vTargetPos) / fSpeed;
						eDoor MoveTo(eDoor.vTargetPos, fTime, fTime * 0.2, fTime * 0.2);
					}
				}
			}
			else
			{
				foreach (eDoor in doors)
				{
					if (eDoor.origin == eDoor.vTargetPos)
					{
						bIsOpening = false;
						bIsClosing = false;
						eDoor StopLoopSound();
					}
				}				
			}
			
			if (bIsClosing)
			{
				bIsClosing = false;
				
				foreach (eDoor in doors)
				{
					if (eDoor.origin != eDoor.vTargetPos)
					{
						bIsOpening = true;
						bIsClosing = false;
						eDoor PlayLoopSound("bigdoor");
						fTime = Distance(eDoor.origin, eDoor.vTargetPos) / fSpeed;
						eDoor MoveTo(eDoor.vTargetPos, fTime, fTime * 0.2, fTime * 0.2);
					}
				}				
			}
		}
		else
		{
			if (!bIsClosing)
			{
				foreach (eDoor in doors)
				{
					if (eDoor.origin != eDoor.vStartPos)
					{
						bIsClosing = true;
						bIsOpening = false;
						eDoor PlayLoopSound("bigdoor");
						fTime = Distance(eDoor.origin, eDoor.vStartPos) / fSpeed;
						eDoor MoveTo(eDoor.vStartPos, fTime, fTime * 0.2, fTime * 0.2);
					}
				}
			}
			else
			{
				foreach (eDoor in doors)
				{
					if (eDoor.origin == eDoor.vStartPos)
					{
						bIsClosing = false;
						bIsOpening = false;
						eDoor StopLoopSound();
					}
				}				
			}			
		}
		
		wait 0.05;		
	}
}

IsTriggerTouched()
{
	players = GetEntArray("player", "classname");
	for (i = 0; i < players.size; i++)
	{
		player = players[i];
		
		if (!IsDefined(player) || !IsPlayer(player) || !IsAlive(player))
			continue;
			
		if (player IsTouching(self))
			return true;
	}
	
	return false;
}