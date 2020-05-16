cd /d D:\CoD4 Tvorba Map\Call of Duty 4 - Modern Warfare\Mods\deathrun

set spcArgs="-verbose -compareDate"
set gameArgs="+set developer 1 +set developer_script 1 +set scr_DEVEnabled 1 +set scr_DEVVGEnabled 1 +devmap mp_deathrun_zero +set g_gametype deathrun +exec deathrun.cfg"

rem	0-1		0-9		   0-1		0-1		  BestSpeed-BestCompression 0-1 	  ""		  0-1		1		""
rem verbose mainChoice ffEnable iwdEnable iwdQuality 				spcEnable spcSettings runEnable runType runSettings
call makeMod_ALL.bat 0 9 "" "" "BestCompression" "" "" 0 1 %gameArgs%
rem pause