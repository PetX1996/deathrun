#undef	FOG_SCROLL_TIME
#define FOG_SCROLL_TIME 5000 //30000

#undef	THINFOG_SCROLL_TIME
#define THINFOG_SCROLL_TIME 5000 //50000

#undef	FOG_SCROLL_TIME2
#define FOG_SCROLL_TIME2 8000 //30000

#undef	THINFOG_SCROLL_TIME2
#define THINFOG_SCROLL_TIME2 8000 //50000

/*
itemDef
{
	style			WINDOW_STYLE_SHADER
	rect		-600 -50 1600 600 HORIZONTAL_ALIGN_CENTER VERTICAL_ALIGN_CENTER
	background		"menu_back"
	forecolor		1 1 1 1
	visible			1
	decoration
}
*/
/*
itemDef
{
	style			WINDOW_STYLE_SHADER
	//rect			-107 250 1708 200
	rect			FULLSCREEN_WIDE
	exp				rect X((-107) - ((float(milliseconds() % FOG_SCROLL_TIME2) / FOG_SCROLL_TIME2) * (854)))
	forecolor		1 1 1 1
	background		"menu_front2"
	visible			1
	decoration
}
itemDef
{
	style			WINDOW_STYLE_SHADER
	//rect			-107 250 1708 200
	rect			FULLSCREEN_WIDE
	exp				rect X((-961) + ((float(milliseconds() % THINFOG_SCROLL_TIME2) / THINFOG_SCROLL_TIME2) * (854)))
	background		"menu_front2"
	forecolor		1 1 1 0.8
	visible			1
	decoration
}
itemDef
{
	style			WINDOW_STYLE_SHADER
	//rect			-107 250 1708 200
	rect			FULLSCREEN_WIDE
	exp				rect X((-107) - ((float(milliseconds() % FOG_SCROLL_TIME) / FOG_SCROLL_TIME) * (854)))
	forecolor		1 1 1 0.5
	background		"menu_front2"
	visible			1
	decoration
}
itemDef
{
	style			WINDOW_STYLE_SHADER
	//rect			-107 250 1708 200
	rect			FULLSCREEN_WIDE
	exp				rect X((-961) + ((float(milliseconds() % THINFOG_SCROLL_TIME) / THINFOG_SCROLL_TIME) * (854)))
	background		"menu_front2"
	forecolor		1 1 1 0.3
	visible			1
	decoration
}
*/

itemDef
{
	style			WINDOW_STYLE_SHADER
	rect			0 0 2000 480
	exp				rect X( (-640) + (cos(milliseconds()/2000) * 500) )
	//rect		-600 -0 1600 1200 HORIZONTAL_ALIGN_CENTER VERTICAL_ALIGN_TOP
	//rect			-107 250 1708 200
	//exp				rect X((-961) + ((float(milliseconds() % THINFOG_SCROLL_TIME) / THINFOG_SCROLL_TIME) * (854)))
	background		"menu_front2"
	forecolor		1 1 1 1
	visible			1
	decoration
}

itemDef
{
	style			WINDOW_STYLE_SHADER
	rect			FULLSCREEN_WIDE
	background		"menu_front"
	forecolor		1 1 1 1
	visible			1
	decoration
}