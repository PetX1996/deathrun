/*
+-------------------------------------------------------------------+
|                                                                   |
|   +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++   |
|   +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++   |
|   ++++|   \++++|  |++++|  |___________|+++++++/        \+++++++   |
|   ++++|    \+++|  |++++|  |++++++++++++++++++/    __    \++++++   |
|   ++++|  \  \++|  |++++|  |+++++++++++++++++/    /++\    \+++++   |
|   ++++|  |\  \+|  |++++|  |___________|++++|    |++++|    |++++   |
|   ++++|  |+\  \|  |++++|  |++++++++++++++++|    |++++|    |++++   |
|   ++++|  |++\  \  |++++|  |+++++++++++++++++\    \++/    /+++++   |
|   ++++|  |+++\    |++++|  |++++++++++++++++++\          /++++++   |
|   ++++|__|++++\___|++++|__|___________|+++++++\________/+++++++   |
|   +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++   |
|   +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++   |
|                                                                   |
+-------------------------------------------------------------------+


Common script's GSC, written by Neo
Included in all of my maps, holding multifunction scripts which tend to be commonly used
Each method's documentation is Hungarian

The version and functionality will vary as I release new maps!
Version: 1.0 (mp_dr_buggedlikehell)


Copyright (c) club27|Neo | All rights reserved.

PLEASE DO NOT COPY WITHOUT PERMISSION (if you have already extracted it from the .ff),
instead add me on XFire (name: gribmate) and we can talk about it
*/



//Funkci�: t�bb hasonl� c�l� trigger k�l�n-k�l�n figyel�se (ciklusb�l c�lszer� threadelni)
//Param�terek:
	//trigger [entity] = a figyelend� trigger
	//uzenet [string] = a triggel�skor kiv�lt�d� esem�ny neve
	//melyik [int] = a trigger egyedi azonos�t�ja a csoportb�l, a kiv�lt�d� esem�nyben haszn�lhat� azonos�t�sra
//Megh�v�s: -
//Threadel�s: MUSZ�J
TobbTriggerFigyeles(trigger, uzenet, melyik)
{
	while (true)
	{
		trigger waittill("trigger", kivalto);
		level notify(uzenet, melyik, kivalto);
	}
}



//Funkci�: Egy param�terben megadott sz�mt�l k�l�nb�z� v�letlent ad vissza
//Param�terek:
	//min [int] = a v�letlen als� hat�ra (inkluz�v)
	//max [int] = a v�letlen fels� hat�ra (exkluz�v)
	//alapveletlen [int] = a sz�m, amit�l a visszaadott v�letlen k�l�nb�z� lesz
//Megh�v�s: -
//Threadel�s: NEM
KulonbozoRandom(min, max, alapveletlen)
{
	veletlen = RandomIntRange(min, max);
	while (true)
	{
		if (veletlen == alapveletlen) veletlen = RandomIntRange(min, max);
		else break;
	}
	return veletlen;
}


//Funkci�: Lebegtet �s k�zben forgat egy megadott dolgot
//Param�terek:
	//lebego [entity] = a lebegtetend� dolog
	//magassag [int] = a lebeg�s magass�ga
	//irany [string] = "jobb" vagy "bal" a forg�s ir�ny�t adja meg
//Megh�v�s: -
//Threadel�s: MUSZ�J
Lebegteto(lebego, magassag, irany)
{
	szog = 0;
	if (irany == "jobb") szog = 360;
	else if (irany == "bal") szog = -360;
	lebego thread Lebegteto_Seged(magassag);
	while (true)
	{
		lebego RotateYaw(szog, 4);
		wait 4;
	}
}
Lebegteto_Seged(magassag)
{
	magassag_le = 0 - magassag;
	while (true)
	{
		self MoveZ(magassag, 2);
		self waittill("movedone");
		self MoveZ(magassag_le, 2);
		self waittill("movedone");
	}
}



//Funkci�: A p�lyak�sz�t� nev�t spammeli f�lpercenk�nt
//Param�terek:
	//uzenet [string] = a spammelend� �zenet
//Megh�v�s: -
//Threadel�s: MUSZ�J
NeoSpam(uzenet)
{
	while (true)
	{
		IPrintLn(uzenet);
		wait 30;
	}
}



//Funkci�: A p�lyak�sz�t� csatlakoz�sakor ki�r egy �zenetet �s kickeli a j�t�kost, ha szerepel "neo" a nev�ben a megfelel� UID n�lk�l
//Param�terek: -
//Megh�v�s: -
//Threadel�s: MUSZ�J
NeoConnect()
{
	while (true)
	{
		level waittill("connected", jatekos);
		jatekos.namesteal = false;
		wait 10;
		//jatekos thread NamestealCheck();
		if (GetSubStr(jatekos GetGUID(), 16, 24) == "70c428fe" && IsSubStr(SzinEltavolito(ToLower(jatekos.name)), "neo"))
		{
			neoconnect1 = NewHudElem();
			neoconnect1.font = "objective";
			neoconnect1.fontScale = 3;
			neoconnect1 SetText("^3Map maker ^2Neo ^3connected to the server!");
			neoconnect1.alignX = "center";
			neoconnect1.alignY = "top";
			neoconnect1.horzAlign = "center";
			neoconnect1.vertAlign = "top";
			neoconnect1.x = 0;
			neoconnect1.y = -30;
			neoconnect1.sort = -1;
			neoconnect1.alpha = 1;
			neoconnect1.glowColor = (0.1, 0.8, 0);
			neoconnect1.glowAlpha = 1;
			neoconnect1.foreground = true;
			neoconnect2 = NewHudElem();
			neoconnect2.font = "objective";
			neoconnect2.fontScale = 3;
			neoconnect2 SetText("^3Map maker ^2Neo ^3connected to the server!");
			neoconnect2.alignX = "center";
			neoconnect2.alignY = "top";
			neoconnect2.horzAlign = "center";
			neoconnect2.vertAlign = "top";
			neoconnect2.x = 0;
			neoconnect2.y = 500;
			neoconnect2.sort = -1;
			neoconnect2.alpha = 1;
			neoconnect2.glowColor = (0.1, 0.8, 0);
			neoconnect2.glowAlpha = 1;
			neoconnect2.foreground = true;
			
			neoconnect1 MoveOverTime(3);
			neoconnect1.y = 250;
			neoconnect2 MoveOverTime(3);
			neoconnect2.y = 250;
			wait 5;
			neoconnect1 MoveOverTime(1);
			neoconnect1.y = 500;
			neoconnect2 MoveOverTime(1);
			neoconnect2.y = -40;
			wait 2;
			neoconnect1 Destroy();
			neoconnect2 Destroy();
		}
	}
}



//Funkci�: A Neo n�v lop�s�t figyeli
//Param�terek: -
//Megh�v�s: egy j�t�koson
//Threadel�s: MUSZ�J
NamestealCheck()
{
	self endon("disconnect");
	
	while (true)
	{
		if (IsSubStr(SzinEltavolito(ToLower(self.name)), "neo") && GetSubStr(self GetGUID(), 16, 24) != "70c428fe" && self.namesteal == false)
		{
			self.namesteal = true;
			self thread NamestealAnnoy();
		}
		else if (!IsSubStr(SzinEltavolito(ToLower(self.name)), "neo"))
		{
			self.namesteal = false;
			wait 10;
			self NamestealCleaner();
		}
		wait 1;
	}
}



//Funkci�: A Neo n�v elloj�t b�nteti
	// - Szerver t�j�koztat�sa a n�vlop�r�l
	// - Mozg�si sebess�g lefelez�se, ugr�s �s sprint letilt�sa
	// - Zavar� sz�nesen villog� HUDElem
	// - Zavar� spammel�d� figyelmeztet�s
//Param�terek: -
//Megh�v�s: egy j�t�koson
//Threadel�s: MUSZ�J
NamestealAnnoy()
{
	IPrintLnBold("^1" + self.name + " ^2tried to steal the map maker's name...");
	wait 2;
	IPrintLnBold("^9Now he will suffer...");
	wait 1;
	self SayAll("^3I am a dumbass namestealer...");
	wait 2;
	self.stealhud = NewClientHudElem(self);
    self.stealhud.horzalign = "fullscreen";
	self.stealhud.vertalign = "fullscreen";
	self.stealhud.alpha = 0.1;
	self.stealhud.color = (0.1, 0.1, 0.1);
	self.stealhud SetShader("white", 640, 480);
	while (self.namesteal)
	{
		self SetMoveSpeedScale(0.5);
		self AllowSprint(false);
		self AllowJump(false);
		self.stealhud.alpha = 0.1;
		R = RandomInt(2);
		G = RandomInt(2);
		B = RandomInt(2);
		self.stealhud.color = (R, G, B);
		for(i = 1; i < 10;  i++)
		{
			self.stealhud.alpha += 0.1;
			self IPrintLnBold("^" + i + "You are not the real Neo - change your name!");
			self IPrintLn("^" + i + "You are not the real Neo - change your name!");
			wait 1;
		}
		wait 1;
	}
}



//Funkci�: Letiszt�tja a megt�rt n�vlop� b�ntet�seit
//Param�terek: -
//Megh�v�s: egy j�t�koson
//Threadel�s: NEM
NamestealCleaner()
{
	if (IsDefined(self.stealhud)) self.stealhud Destroy();
	self SetMoveSpeedScale(1);
	self AllowSprint(true);
	self AllowJump(true);
}



//Funkci�: A k�r v�g�n hang�zenetet j�tszik le
//Param�terek:
	//gyozelem [string] = a gy�ztes csapatnak lej�tszott soundalias
	//vereseg [string] = a vesztes csapatnak lej�tszott soundalias
	//ace [string] = el�re megadott endek eset�n mindenkinek lej�tszott soundalias [!!!P�LYASPECIFIKUS!!!]
//Megh�v�s: -
//Threadel�s: MUSZ�J
KorVegeHang(gyozelem, vereseg, ace)
{
	level waittill("round_ended", szoveg, nyertes);
	if (nyertes == "jumpers")
	{
		jatekosok = GetEntArray("player", "classname");
		level.activ PlayLocalSound(vereseg);
		for (i = 0; i < jatekosok.size; i++)
		{
			if (jatekosok[i] != level.activ) jatekosok[i] PlayLocalSound(gyozelem);
		}
	}
	else if (nyertes == "activators")
	{
		if (level.melyikEnd == "heavy" || level.melyikEnd == "old")
		{
			HangMindenJatekoson(ace);
		}
		else
		{
			jatekosok = GetEntArray("player", "classname");
			level.activ PlayLocalSound(gyozelem);
			for (i = 0; i < jatekosok.size; i++)
			{
				if (jatekosok[i] != level.activ) jatekosok[i] PlayLocalSound(vereseg);
			}
		}
	}
}



//Funkci�: A j�t�kos hal�lakor a j�t�kosnak lej�tsz�d� hang�rt felel
//Param�terek:
	//hang [string] = a lej�tszott soundalias
//Megh�v�s: -
//Threadel�s: MUSZ�J
HalalHang(hang)
{
	level waittill("round_started", sorszam);
	wait 3;
	while (true)
	{
		level waittill("player_killed", jatekos, eInflictor, attacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration);
		jatekos PlayLocalSound(hang);
	}
}



//Funkci�: Az aktiv�tor killing spree hangjai�rt felel a sz�ks�ges endek t�rzs�b�l kell h�vni
//Param�terek: -
//Megh�v�s: -
//Threadel�s: MUSZ�J
KillingSpreeHang()
{
	while (true)
	{
		level waittill("player_killed", jatekos, eInflictor, attacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration);
		if (attacker == level.activ && IsDefined(level.activ.killingspree))
		{
			level.activ.killingspree++;
			switch(level.activ.killingspree)
			{
				case 0:
				break;
				case 1:
				break;
				case 2:
					HangMindenJatekoson("doublekill");
				break;
				case 3:
					HangMindenJatekoson("triplekill");
				break;
				case 4:
					HangMindenJatekoson("quadrakill");
				break;
				case 5:
					HangMindenJatekoson("pentakill");
				break;
				case 6:
					HangMindenJatekoson("rampage");
				break;
				case 7:
					HangMindenJatekoson("dominating");
				break;
				case 8:
					HangMindenJatekoson("legendary");
				break;
				case 9:
					HangMindenJatekoson("godlike");
				break;
				default:
					vel = RandomIntRange(0, 2);
					if (vel == 0) HangMindenJatekoson("godlike");
					else HangMindenJatekoson("legendary");
				break;
			}
		}
	}
}



//Funkci�: Minden j�t�koson lej�tszik valamilyen hangot
//Param�terek:
	//hang [string] = a soundalias neve
//Megh�v�s: -
//Threadel�s: LEHET
HangMindenJatekoson(hang)
{
	jatekosok = GetEntArray("player", "classname");
	for (i = 0; i < jatekosok.size; i++)
	{
		jatekosok[i] PlayLocalSound(hang);
	}
}


//Funkci�: Elt�vol�tja egy karakterl�ncb�l a sz�neket (^1, ^2, ^3, stb...)
//Param�terek:
	//karakterlanc [string] = a megtiszt�tand� karakterl�nc
//Megh�v�s: -
//Threadel�s: NEM
SzinEltavolito(karakterlanc)
{
	szintelen = "";

	for (i = 0; i < karakterlanc.size; i++)
	{
		if ( karakterlanc[i] == "^" && i < karakterlanc.size - 1 &&
		(karakterlanc[i + 1] == "0" || karakterlanc[i + 1] == "1" || karakterlanc[i + 1] == "2" || karakterlanc[i + 1] == "3" || karakterlanc[i + 1] == "4" || karakterlanc[i + 1] == "5" || karakterlanc[i + 1] == "6" || karakterlanc[i + 1] == "7" || karakterlanc[i + 1] == "8" || karakterlanc[i + 1] == "9"))
		{
			i++;
			continue;
		}
		szintelen += karakterlanc[i];
	}
	return szintelen;
}



//Funkci�: Letiszt�tja egy j�t�kos k�perny�j�r�l a sz�veges �zeneteket
//Param�terek:
	//jatekos [player] = a j�t�kos, akinek HUD-ja tiszt�t�sra ker�l
	//csakvalamelyiket [string_enum] =
		//"ln" = csak az IPrintLn csatorna
		//"bold" = csak az IPrintLnBold csatorna
		//"both" = minden sz�veges csatorna
//Megh�v�s: -
//Threadel�s: LEHET
HUDTisztito(jatekos, csakvalamelyiket)
{
	for (i = 0; i < 10; i++)
	{
		if (csakvalamelyiket == "both")
		{
			jatekos IPrintLnBold(" ");
			jatekos IPrintLn(" ");
		}
		else if (csakvalamelyiket == "bold") jatekos IPrintLnBold(" ");
		else if (csakvalamelyiket == "ln") jatekos IPrintLn(" ");
	}
}



//Funkci�: Oda-vissza mozgat v�gtelen�tve egy t�rgyat
//Param�terek:
	//brush [entity] = a mozgatand� t�rgy
	//tengely [string_enum] = melyik tengelyen t�rt�njen a mozgaz�s
		//"X" = X tengely
		//"Y" = Y tengely
		//"Z" = Z tengely
	//tavolsag [int] = a mozgat�si t�vols�g
	//ido [int] = mozgat�s ideje
//Megh�v�s: -
//Threadel�s: MUSZ�J
OdaVissza(brush, tengely, tavolsag, gyorsasag)
{
	while (true)
	{
		if (tengely == "X")
		{
			brush MoveX(tavolsag, gyorsasag);
			brush waittill("movedone");
			ujtavolsag = 0 - tavolsag;
			brush MoveX(ujtavolsag, gyorsasag);
			brush waittill("movedone");
		}
		else if (tengely == "Y")
		{
			brush MoveY(tavolsag, gyorsasag);
			brush waittill("movedone");
			ujtavolsag = 0 - tavolsag;
			brush MoveY(ujtavolsag, gyorsasag);
			brush waittill("movedone");
		}
		else if (tengely == "Z")
		{
			brush MoveZ(tavolsag, gyorsasag);
			brush waittill("movedone");
			ujtavolsag = 0 - tavolsag;
			brush MoveZ(ujtavolsag, gyorsasag);
			brush waittill("movedone");
		}
	}
}



//Funkci�: Folyamatosan elveszi egy j�t�kos �sszes t�lt�ny�t
//Param�terek:
	//esemeny [string] = a t�lt�nyt�rl�s abbahagy�s�t kiv�lt� esem�ny (a j�t�kosban v�lt�djon ki)
//Megh�v�s: egy j�t�koson
//Threadel�s: MUSZ�J
ToltenyTorlo(esemeny)
{
	self endon(esemeny);
	
	while (true)
	{
		self SetWeaponAmmoStock(self GetCurrentWeapon(), 0);
		self SetWeaponAmmoClip(self GetCurrentWeapon(), 0);
		wait 1;
	}
}