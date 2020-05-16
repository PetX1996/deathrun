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

public ItemInSVPreCache(item)
{
	IFX::Register(item.sTrailFX);
}

public ItemInCPreSpawning(item, args)
{
	
}

public ItemOnCSpawned(item, args)
{
	self thread PaintTrail(item.sTrailFX);
}

private PaintTrail(fx)
{
	model = Spawn("script_model", self.Origin + (0,0,60));
	model SetModel("tag_origin");
	model LinkTo(self, "", (-25, 0, 30), (0, 0, 0));
	
	wait 1;
	if (!IsDefined(self) || !IsAlive(self))
	{
		model Delete();
		return;
	}
	
	PlayFXOnTag(IFX::Get(fx), model, "tag_origin");
	
	self INOTIFY::WaittillAny("death", "disconnect");
	model Delete();
}