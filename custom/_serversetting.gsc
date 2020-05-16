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

Init()
{
	level.hostname = C_ISVAR::GetAsStr("SVFullName");
	if (level.hostname == "")
		level.hostname = "CoDHost";
		
	setdvar("sv_hostname", level.hostname);
	setdvar("ui_hostname", level.hostname);
	makedvarserverinfo("ui_hostname", "CoDHost");
	
	level.motd = getdvar("scr_motd");
	if(level.motd == "")
		level.motd = "";
	setdvar("scr_motd", level.motd);
	setdvar("ui_motd", level.motd);
	makedvarserverinfo("ui_motd", "");

	level.allowvote = getdvar("g_allowvote");
	if(level.allowvote == "")
		level.allowvote = "1";
	setdvar("g_allowvote", level.allowvote);
	setdvar("ui_allowvote", level.allowvote);
	makedvarserverinfo("ui_allowvote", "1");

	level.friendlyfire = 0;
	setdvar("ui_friendlyfire", 0);
	makedvarserverinfo("ui_friendlyfire", "0");

	if(getdvar("scr_mapsize") == "")
		setdvar("scr_mapsize", "64");
	else if(getdvarFloat("scr_mapsize") >= 64)
		setdvar("scr_mapsize", "64");
	else if(getdvarFloat("scr_mapsize") >= 32)
		setdvar("scr_mapsize", "32");
	else if(getdvarFloat("scr_mapsize") >= 16)
		setdvar("scr_mapsize", "16");
	else
		setdvar("scr_mapsize", "8");
	level.mapsize = getdvarFloat("scr_mapsize");
}