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

private Create()
{
	level.MapEndRooms = SpawnStruct();
	level.MapEndRooms.Rooms = [];
	level.MapEndRooms.SelectedRoom = undefined;
	level.MapEndRooms.bIsInPreSelecting = undefined;
	
	return level.MapEndRooms;
}

public GetRooms()
{
	IEXCEPTION::Undefined(level.MapEndRooms, "ENDROOMS - No rooms registered");

	return level.MapEndRooms.Rooms;
}

private Select(selectedRoom)
{
	level.MapEndRooms.SelectedRoom = selectedRoom;

	rooms = GetRooms();
	foreach (room in rooms)
	{
		if (room == selectedRoom)
			continue;
			
		if (IsDefined(room.dOnNotSelected))
			room thread [[room.dOnNotSelected]]();
	}
}

private DeSelect()
{
	level.MapEndRooms.SelectedRoom = undefined;
}

public IsSelected()
{
	IEXCEPTION::Undefined(level.MapEndRooms, "ENDROOMS - No rooms registered");

	return IsDefined(level.MapEndRooms.SelectedRoom);
}

public RestartSelection()
{
	IEXCEPTION::Undefined(level.MapEndRooms, "ENDROOMS - No rooms registered");
	
	rooms = GetRooms();
	foreach (room in rooms)
	{
		room Room_DeSelect();
		room Room_MakeAvailable();
		
		if (IsDefined(room.dOnRestartedSelection))
			room [[room.dOnRestartedSelection]]();
	}
}

public GetSelectedRoom()
{
	IEXCEPTION::Undefined(level.MapEndRooms, "ENDROOMS - No rooms registered");

	return level.MapEndRooms.SelectedRoom;
}


public RegRoom(sEnterTrigger)
{
	if (!IsDefined(level.MapEndRooms))
		Create();
	
	room = SpawnStruct();
	level.MapEndRooms.Rooms[level.MapEndRooms.Rooms.size] = room;
	
	room.sEnterTrigger = sEnterTrigger;
	
	eTriggers = GetEntArray(sEnterTrigger, "targetname");
	if (eTriggers.size == 0)
		IEXCEPTION::ArgumentMsg("ENDROOMS - Could not find endrooms trigger '" + sEnterTrigger + "'");
	else if (eTriggers.size > 1)
		IEXCEPTION::ArgumentMsg("ENDROOMS - There is more triggers for endrooms with same targetname '" + sEnterTrigger + "'");
	
	room.eEnterTrigger = eTriggers[0];
	
	
	room.dOnEntered = undefined;
	room.dOnTriedEnter = undefined;
	
	room.bIsUnAvailable = undefined;
	room.dOnMadeUnAvailable = undefined;
	room.dOnMadeAvailable = undefined;
	
	room.bIsSelected = undefined;
	room.dOnSelected = undefined;
	room.dOnNotSelected = undefined;
	
	room.bIsDisabled = undefined;
	room.dOnDisabled = undefined;
	room.dOnEnabled = undefined;
	
	room.dOnRestartedSelection = undefined;
	
	room thread Room_WatchEnterTrigger(room.eEnterTrigger);
	
	return room;
}

public Room_Enable()
{
	IEXCEPTION::Argument(IsDefined(self.sEnterTrigger), "ENDROOMS - self is not a room");

	if (!IsDefined(self.bIsDisabled))
		return;
	
	self.bIsDisabled = undefined;
	if (IsDefined(self.dOnEnabled))
		self thread [[self.dOnEnabled]]();
}

public Room_Disable()
{
	IEXCEPTION::Argument(IsDefined(self.sEnterTrigger), "ENDROOMS - self is not a room");

	if (IsDefined(self.bIsDisabled))
		return;
		
	self.bIsDisabled = true;
	if (IsDefined(self.dOnDisabled))
		self thread [[self.dOnDisabled]]();
}

public Room_IsEnabled()
{
	IEXCEPTION::Argument(IsDefined(self.sEnterTrigger), "ENDROOMS - self is not a room");

	return !IsDefined(self.bIsDisabled);
}


public Room_IsAvailable()
{
	IEXCEPTION::Argument(IsDefined(self.sEnterTrigger), "ENDROOMS - self is not a room");
	
	return !IsDefined(self.bIsUnAvailable);
}

public Room_MakeUnAvailable()
{
	IEXCEPTION::Argument(IsDefined(self.sEnterTrigger), "ENDROOMS - self is not a room");
	
	if (IsDefined(self.bIsUnAvailable))
		return;
	
	self.bIsUnAvailable = true;
	if (IsDefined(self.dOnMadeUnAvailable))
		self thread [[self.dOnMadeUnAvailable]]();
}

public Room_MakeAvailable()
{
	IEXCEPTION::Argument(IsDefined(self.sEnterTrigger), "ENDROOMS - self is not a room");
	
	if (!IsDefined(self.bIsUnAvailable))
		return;
	
	self.bIsUnAvailable = undefined;
	if (IsDefined(self.dOnMadeAvailable))
		self thread [[self.dOnMadeAvailable]]();
}

public Room_IsSelected()
{
	IEXCEPTION::Argument(IsDefined(self.sEnterTrigger), "ENDROOMS - self is not a room");
	
	return IsDefined(self.bIsSelected);
}

private Room_Select()
{
	self.bIsSelected = true;
	
	if (IsDefined(self.dOnSelected))
		self thread [[self.dOnSelected]]();
		
	Select(self);
}

private Room_DeSelect()
{
	self.bIsSelected = undefined;
	
	DeSelect();
}


private Room_WatchEnterTrigger(eTrig)
{
	while (IsDefined(eTrig))
	{
		eTrig waittill("trigger", pPlayer);
		
		// other trigger started its room first
		if (IsDefined(level.MapEndRooms.bIsInPreSelecting))
			continue;
		
		if (self Room_IsEnabled()
			&& self Room_IsAvailable()
			&& (!IsSelected() || self Room_IsSelected()))
		{
			level.MapEndRooms.bIsInPreSelecting = true;
		
			if (!self Room_IsSelected())
				self Room_Select();
			
			if (IsDefined(self.dOnEntered))
				self thread [[self.dOnEntered]](pPlayer);
				
			wait 0.05; // let finish starting of dOnEntered threads
			level.MapEndRooms.bIsInPreSelecting = undefined;
		}
		else
		{
			if (IsDefined(self.dOnTriedEnter))
				self thread [[self.dOnTriedEnter]](pPlayer);
		}
	}
}

public PortActivator(sOriginsNames, [bFreeze])
{
	pActivators = mapper\_teams::GetAllActivators(true);
	if (pActivators.size > 0)
		pActivators[0] mapper\_player::CTeleportRandom(sOriginsNames, bFreeze);
}

public PortAllActivators(sOriginsNames, [bFreeze])
{
	pActivators = mapper\_teams::GetAllActivators(true);
	foreach (pActivator in pActivators)
		pActivator mapper\_player::CTeleportRandom(sOriginsNames, bFreeze);
}