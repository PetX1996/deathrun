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

/*Init()
{
	//level.SendCvar = ::SendDvars;
	
	//CreateLoopDvarList();
	//CreateCvarList();
}
*/
InCPreConnecting(args)
{
	// VICTORY
	args.DvarDic IDIC::Add("ui_vicVis", false); // victory menu in HUD
	args.DvarDic IDIC::Add("cg_hudChatPosition", "5 204"); // from victory
	
	// HUD
	args.DvarDic IDIC::Add("ui_hudNT", ""); // notify
	args.DvarDic IDIC::Add("ui_hudEnable", false);
	args.DvarDic IDIC::Add("ui_hudSIEnable", false);
	
	// HUD LOWER
	args.DvarDic IDIC::Add("ui_hudLowerT", "");
	args.DvarDic IDIC::Add("ui_hudLowerK", "");
	args.DvarDic IDIC::Add("ui_hudLowerKT", "");
	
	// BH
	args.DvarDic IDIC::Add("bg_viewKickMax", 90);
	args.DvarDic IDIC::Add("bg_viewKickMin", 5);
	args.DvarDic IDIC::Add("bg_viewKickRandom", 0.4);
	args.DvarDic IDIC::Add("bg_viewKickScale", 0.2);
	args.DvarDic IDIC::Add("cg_hudDamageIconTime", 2000);
	
	args.DvarDic IDIC::Add("ui_mainVer", C_INIT::ModFullVersion);
	
	//AddCvarToList( "ui_ipaddress", GetDvar( "net_ip" ) + ":" + GetDvar( "net_port" ) );
	/*self SetStat( 2329, GetDvarInt( "gamever" ) );
	
	if( level.dvars["developer"] || !level.dvars["logic"] || IsDefined( level.roundStarted ) )
	{
		AddCvarToList( "ui_show_hud", 1 );
	}
	else
	{
		AddCvarToList("ui_show_hud", 0);
	}
	
	if( IsDefined( level.MiniMap ) )
		AddCvarToList("ui_show_minimap", 1);
	else
		AddCvarToList("ui_show_minimap", 0);
	
	if( IsDefined( level.PickMonsters ) )
		AddCvarToList("ui_allow_monsters", 1);
	else
		AddCvarToList("ui_allow_monsters", 0);
	
	//hud
	AddCvarToList("hud_money", self.pers["money"]);
	AddCvarToList("hud_round", game["rounds"]);
	AddCvarToList("hud_roundlimit", level.dvars["logic_roundLimit"]);
	
	//main menu
	AddCvarToList("ui_mapFullName", GetDvar( "ui_mapFullName" ) );
	AddCvarToList("ui_gameTypeFullName", GetDvar( "ui_gameTypeFullName" ) );
	AddCvarToList("ui_modVerFull", COMPILER::VersionStr );
	
	self [[level.SendCMD]]( "exec client_cfg/connect.cfg" );
	
	SendDvars( self.cvarList );
	self.cvarList = undefined;
	*/
	//thread SendLoopDvars();
}
/*
AddCvarToList(name, value)
{
	if (!IsDefined(self._cvarList))
		self._cvarList = [];

	self._cvarList[name] = value;
}
*/
/*
// ========== LOOP DVARS ========== //
CreateLoopDvarList()
{
	RegisterLoopDvar( "cg_blood", "1" );
	RegisterLoopDvar( "cg_bloodLimit", "0" );
	RegisterLoopDvar( "cg_bloodLimitMsec", "330" );
	RegisterLoopDvar( "cg_bloodpool", "1" );
	RegisterLoopDvar( "cg_drawMantleHint", "1" );
	RegisterLoopDvar( "cg_fov", "80" );
	RegisterLoopDvar( "cg_ScoresPing_MaxBars", "4" );
	RegisterLoopDvar( "com_maxfps", "250" );
	RegisterLoopDvar( "fx_marks", "1" );
	RegisterLoopDvar( "fx_marks_ents", "1" );
	RegisterLoopDvar( "fx_marks_smodels", "1" );
	RegisterLoopDvar( "r_aaAlpha", "0" );
	RegisterLoopDvar( "r_aaSamples", "1" );
	RegisterLoopDvar( "r_distortion", "1" );
	RegisterLoopDvar( "r_dlightLimit", "4" );
	RegisterLoopDvar( "r_drawDecals", "1" );
	RegisterLoopDvar( "r_fastSkin", "0" );
	RegisterLoopDvar( "r_lodBiasRigid", "0" );
	RegisterLoopDvar( "r_lodBiasSkinned", "0" );
	RegisterLoopDvar( "r_lodScaleRigid", "1" );
	RegisterLoopDvar( "r_lodScaleSkinned", "1" );
	RegisterLoopDvar( "r_polygonOffsetBias", "-1" );
	RegisterLoopDvar( "r_polygonOffsetScale", "-1" );
	RegisterLoopDvar( "ragdoll_enable", "1" );
	RegisterLoopDvar( "ragdoll_max_simulating", "16" );
	RegisterLoopDvar( "sm_maxLights", "4" );
}

RegisterLoopDvar( name, value )
{
	if( !IsDefined( level.Clients.loopDvarList ) )
		level.Clients.loopDvarList = [];
		
	level.Clients.loopDvarList[name] = value;
}

SendLoopDvars()
{
	self endon( "disconnect" );

	count = level.Clients.loopDvarList.size;
	packetCount = 30;
	
	if( count <= 0 )
		return;
		
	max = int( count / packetCount ) + 1;
	
	while( true )
	{
		for( i = 0; i < max; i++ )
		{
			wait 5;
			
			array = [];
			names = GetArrayKeys( level.Clients.loopDvarList );
			for( a = i * packetCount;a < (i + 1) * packetCount;a++)
			{
				if( a >= count )
					break;
					
				array[names[a]] = level.Clients.loopDvarList[names[a]];
			}
			
			SendDvars( array, true );
		}
	}
}
*/