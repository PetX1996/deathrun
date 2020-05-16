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

public sealed iType_Random = 0;
public sealed iType_Fair = 1;
public sealed iType_Mix = 2;
public sealed iType_SIZE = 3;

public IsMoreEnabled()
{
	return C_ISVAR::GetAsBool("GLPickMoreEnabled");
}

public PickActivators([iCount])
{
	if (!IsDefined(iCount))
		iCount = GetActivatorsCount();
		
	pickedList = ILIST::Create();
		
	args = IECALLBACK::Args_Create();
	args.iCount = iCount;
	
	C_INIT::GL_RunInSPickingActivators(args);
		
	iJumpersCount = ICLIST::GetAllAllies().size;
	if (iJumpersCount < 2)
		return pickedList;
		
	// + 1 jumper
	args.iCount = Int(Min(args.iCount, iJumpersCount - 1));

	DoActivatorsPicking(pickedList, args.iCount);
	
	
	args = IECALLBACK::Args_Create();
	args.pickedList = pickedList;
	C_INIT::GL_RunOnSPickedActivators(args);
	return pickedList;
}

private DoActivatorsPicking(pickedList, iCount)
{
	for (i = 0; i < iCount; i++)
		pickedList ILIST::Add(GetPlayerForPick(pickedList));
		
	for (i = 0; i < pickedList.iCount; i++)
		(pickedList ILIST::Get(i)) CPick();
}

private GetActivatorsCount()
{
	if (C_ISVAR::GetAsBool("GLPickMoreEnabled"))
	{
		iCount = 1;
		iPlayingPlayersCount = ICLIST::GetAllAllies().size;
		fFraction = C_ISVAR::GetAsFloat("GLPickFraction");
		if (fFraction != 0)
			iCount = Max(Int(iPlayingPlayersCount * fFraction), 1);
		else
			iCount = C_ISVAR::GetAsInt("GLPickStaticCount");
			
		return Int(Min(iCount, iPlayingPlayersCount - 1));
	}
	
	return 1;
}

private GetPlayerForPick(pickedList)
{
	playersList = ILIST::Create();
	playersList ILIST::AddArray(ICLIST::GetAllAllies());
	playersList ILIST::Exclude(pickedList);
	
	type = C_ISVAR::GetAsInt("GLPickType");
	if (type == iType_Random
		|| (type == iType_Mix && RandomInt(100) <= C_ISVAR::GetAsInt("GLPickTypeMixRnd")))
	{
		rI = RandomInt(playersList.iCount);
		for (i = 0; i < playersList.iCount; i++)
		{
			rI = (rI + 1) % playersList.iCount;
			p = playersList ILIST::Get(rI);
			
			if (p CIsAvailableForPick())
				return p;
		}
	
		return playersList ILIST::Get(RandomInt(playersList.iCount));
	}
	else
	{
		rI = RandomInt(playersList.iCount);
		pMin = playersList ILIST::Get(rI);
		iMin = 99999;
		for (i = 0; i < playersList.iCount; i++)
		{
			rI = (rI + 1) % playersList.iCount;
			p = playersList ILIST::Get(rI);
			if (!p CIsAvailableForPick())
				continue;
		
			iCur = p CGetPickedTimes() / p C_IGLROUNDS::CGetPlayedRounds();
			if (iCur < iMin)
			{
				iMin = iCur;
				pMin = p;
			}
		}

		return pMin;
	}
}

private CIsAvailableForPick()
{
	args = IECALLBACK::Args_Create();
	args.bCancel = undefined;
	
	self C_INIT::GL_RunInCSelectingForPick(args);
	if (IsDefined(args.bCancel) && args.bCancel)
		return false;
		
	return true;
}

public CPick()
{
	self endon("disconnect");
	
	args = IECALLBACK::Args_Create();
	args.bCancel = undefined;
	
	self C_INIT::GL_RunInCPickingAsActivator(args);
	if (IsDefined(args.bCancel) && args.bCancel)
		return false;
	
	self.pers["PickedTimes"]++;
	
	self C_ICTEAM::JoinAxis();
	if (self.pers["team"] != "axis")
		return false;
		
	self C_ICPLAYER::SpawnPlayer();
		
	wait 0.05;
	level notify( "picking activator" ); // braxi
	level.activ = self; // braxi
	
	args = IECALLBACK::Args_Create();
	self C_INIT::GL_RunOnCPickedAsActivator(args);
	return true;
}

public CGetPickedTimes()
{
	return self.pers["PickedTimes"];
}