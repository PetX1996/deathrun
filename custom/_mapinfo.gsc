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

#include custom\include\_usings;
#include core\include\_usings;

InSIniting(args)
{
	InitMapInfo();
}

private InitMapInfo()
{
	level.MapInfo = SpawnStruct();
	
	level.MapInfo.sFullName = IGAME::GetMap();
	level.MapInfo.iDifficulty = 0;
	level.MapInfo.iLength = 0;
	level.MapInfo.bIsNew = false;
	level.MapInfo.iPopularity = 0;
	level.MapInfo.Creators = [];
	level.MapInfo.DescriptionLines = [];
	
	for (i = 0; i < C_IMAPINFO::DescriptionLinesCount; i++)
		level.MapInfo.DescriptionLines[i] = "";
}

InSStarting(args)
{
	UpdateInfoFromInputs();
}

private UpdateInfoFromInputs()
{
	args = IECALLBACK::Args_Create();
	C_INIT::MI_RunInUpdatingFromMapper(args);
	

	map = C_IMAPLIST::GetItemByName(IGAME::GetMap());
	if (IsDefined(map))
	{
		C_IMAPINFO::SetFullName(map.sFullName);
		C_IMAPINFO::SetDifficulty(map.iDifficulty);
		C_IMAPINFO::SetLength(map.iLength);
		C_IMAPINFO::SetIsNew(map.bIsNew);
	}
	
	C_IMAPINFO::SetPopularity(IMATH::Round(C_IMAPPOP::GetCurMapPopularity()));
	
	
	args = IECALLBACK::Args_Reset();
	C_INIT::MI_RunInUpdatingFromInputs(args);
}

InCPreConnecting(args)
{
	if (!self C_ICPLAYER::CIsFirstPlayedRound())
		return;

	args.DvarDic IDIC::Add("ui_mainMap", C_IMAPINFO::GetFullName());
	
	args.DvarDic IDIC::Add("ui_mainMapN", C_IMAPINFO::IsNew());
	args.DvarDic IDIC::Add("ui_mainMapD", C_IMAPINFO::GetDifficulty());
	args.DvarDic IDIC::Add("ui_mainMapL", C_IMAPINFO::GetLength());
	args.DvarDic IDIC::Add("ui_mainMapC", ISTRING::Join(", ", C_IMAPINFO::GetCreatorsNames()));
	
	for (i = 0; i < level.MapInfo.DescriptionLines.size; i++)
		args.DvarDic IDIC::Add("ui_mainMap_" + i, level.MapInfo.DescriptionLines[i]);
}