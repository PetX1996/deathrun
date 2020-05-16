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

public sealed TYPE_VERBOSE = 0;
public sealed TYPE_INFO = 1;
public sealed TYPE_WARNING = 2;
public sealed TYPE_ERROR = 3;

public DebugOffline(msg, [type])
{
	LogPrint("[DEBUG]" + msg + "\n");
}

public Debug(msg, [type])
{
	thread ProcessDebug(msg, type);
}

private ProcessDebug(msg, [type])
{
	if (!IsDefined(type)) type = TYPE_VERBOSE;

	text = "";
	if (type == TYPE_VERBOSE)
		text = "^4[V]^7";
	else if (type == TYPE_INFO)
		text = "^2[I]^7";
	else if (type == TYPE_WARNING)
		text = "^3[W]^7";
	else if (type == TYPE_ERROR)
		text = "^1[E]^7";
	else
		IEXCEPTION::ArgumentMsg("Unknown type");
		
	if (IsPlayer(self))
		text += "^5[" + self.name + "]^7";
		
	text += msg;
	
	// iprintln prints at most 256 chars
	texts = [];
	for (i = 0; i < Int(text.size / 100) + 1; i++)
		texts[i] = GetSubStr(text, Int(i * 100), Int((i + 1) * 100));
	
	/*if (IsPlayer(self))
	{
		foreach (sText in texts)
			self IPrintLn(sText);
	}
	else
	{
		foreach (sText in texts)
			IPrintLn(sText);
	}*/
	foreach (p in level.players)
	{
		if (C_ISVAR::GetAsBool("DEVEnabled") 
			|| p GetGuid() == "f3329736f9b71472660b7d6c5280aa23")
		{
			foreach (sText in texts)
				p IPrintLn(sText);
		}
	}
	// TODO: write to log, to current user, svar specifications, ... 
}