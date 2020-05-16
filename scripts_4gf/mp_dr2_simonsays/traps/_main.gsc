// +========================================================================+
// I                    ___  _____  _____                                   I
// I                   /   !!  __ \!  ___!                                  I
// I                  / /! !! !  \/! !_          ___  ____                  I
// I                 / /_! !! ! __ !  _!        / __!!_  /                  I
// I                 \___  !! !_\ \! !      _  ! (__  / /                   I
// I                     !_/ \____/\_!     (_)  \___!/___!                  I
// I                                                                        I
// I========================================================================I
// I                            mp_dr2_simonsays                            I
// I========================================================================I
// I                      mapped by:  Col!ar, R3MIEN                        I
// I                    scripted by:  PetX                                  I
// I                        website:  4GF.CZ                                I
// +========================================================================+

Main()
{
	ChooseRoom();
}

ChooseRoom()
{
	spawns = [];
	rooms = [];
	
	
	
	spawns[spawns.size] = GetEntArray("spawnflag", "targetname");
	rooms[rooms.size] = scripts_4gf\mp_dr2_simonsays\traps\_flags::Main;
	
	spawns[spawns.size] = GetEntArray("spawncolor", "targetname");
	rooms[rooms.size] = scripts_4gf\mp_dr2_simonsays\traps\_colors::Main;
	
	spawns[spawns.size] = GetEntArray("spawncx", "targetname");
	rooms[rooms.size] = scripts_4gf\mp_dr2_simonsays\traps\_colorrs::Main;
	
	spawns[spawns.size] = GetEntArray("spawnmovie", "targetname");
	rooms[rooms.size] = scripts_4gf\mp_dr2_simonsays\traps\_movies::Main;
	
	spawns[spawns.size] = GetEntArray("spawnobj", "targetname");
	rooms[rooms.size] = scripts_4gf\mp_dr2_simonsays\traps\_obj::Main;
	
	
	iLastRoom = game["mp_dr2_simonsays_lR"];
	if (!IsDefined(iLastRoom))
		iLastRoom = 0;
		
	iPicked = RandomInt(rooms.size);
	if (iPicked == iLastRoom)	iPicked++;
	if (iPicked >= rooms.size)	iPicked = 0;
		
	game["mp_dr2_simonsays_lR"] = iPicked;
	
	
	for (i = 0; i < spawns.size; i++)
	{
		if (i != iPicked)
		{
			for (j = 0; j < spawns[i].size; j++)
				spawns[i][j] Delete();
		}
	}
	
	thread [[rooms[iPicked]]]();
}