/// <MapFixer>
///		<Comments regex="\/\/.*|\/\*(?:.|\s)*?\*\/"/>
/// 	<Switch regex="(InSIniting\s*\(\s*\)\s*\{\s*switch\s*\(\s*core\\include\\_game\s*::\s*GetMap\s*\(\s*\)\s*\)\s*\{)((?:\s|.)*)(\}\s*\})" contentGroup="2">
/// 		<Case strFormat="\r\n\t\tcase &quot;{0}&quot;:\r\n\t\t\tinputs\\mapfixer\\{0}::InSIniting();\r\n\t\t\tbreak;"/>
/// 		<Default strFormat="\r\n\t\tdefault:\r\n\t\t\tbreak;\r\n\t"/>
/// 	</Switch>
/// </MapFixer>

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

InSIniting()
{
	switch (core\include\_game::GetMap())
	{
		case "mp_deathrun_colourful":
			inputs\mapfixer\mp_deathrun_colourful::InSIniting();
			break;
		case "mp_deathrun_grassy":
			inputs\mapfixer\mp_deathrun_grassy::InSIniting();
			break;
		default:
			break;
	}
}