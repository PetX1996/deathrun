///////////////////////////////////////////////////////////////
////|         |///|        |///|       |/\  \/////  ///|  |////
////|  |////  |///|  |//|  |///|  |/|  |//\  \///  ////|__|////
////|  |////  |///|  |//|  |///|  |/|  |///\  \/  /////////////
////|          |//|  |//|  |///|       |////\    //////|  |////
////|  |////|  |//|         |//|  |/|  |/////    \/////|  |////
////|  |////|  |//|  |///|  |//|  |/|  |////  /\  \////|  |////
////|  |////|  |//|  | //|  |//|  |/|  |///  ///\  \///|  |////
////|__________|//|__|///|__|//|__|/|__|//__/////\__\//|__|////
///////////////////////////////////////////////////////////////
/*
	BraXi's Death Run Mod
	
	Xfire: braxpl
	E-mail: paulina1295@o2.pl
	Website: www.braxi.cba.pl

	[DO NOT COPY WITHOUT PERMISSION]
*/

#include core\include\_usings;
#include custom\include\_usings;

GiveRankXP(type, value)
{
	if (!IsDefined(value))
	{
		IEXCEPTION::Undefined(type);
		
		switch (type)
		{
			case "jumper_died":
				self C_ICRANK::CGiveScoreRankXPType("AJumperDied");
				break;
			case "trap_activation":
				self C_ICRANK::CGiveScoreRankXPType("ATrapActivate");
				break;
			default:
				IEXCEPTION::InvalidOperationMsg(type);
		}
	}
	else
		self mapper\_rank::CGiveScoreXP(value);
}