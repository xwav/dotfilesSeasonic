/* See LICENSE file for copyright and license details. */

#include <X11/XF86keysym.h>

/* appearance */
static const unsigned int borderpx  = 3;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "monospace:size=11" };
static const char dmenufont[]       = "monospace:size=11";
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#1376bd";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
};

typedef struct {
	const char *name;
	const void *cmd;
} Sp;
const char *spcmd1[] = {"st", "-n", "spterm", "-g", "144x40", NULL };
const char *spcmd2[] = {"st", "-n", "spnews", "-g", "144x41", "-e", "newsboat", NULL };
const char *spcmd3[] = {"zathura", NULL };
const char *spcmd4[] = {"st", "-n", "spmc", "-g", "144x41", "-e", "mc", NULL };
const char *spcmd5[] = {"st", "-n", "spcmus", "-g", "144x41", "-e", "cmus", NULL };
const char *spcmd6[] = {"brave-browser", NULL };
static Sp scratchpads[] = {
	/* name          cmd  */
	{"spterm",      spcmd1},
	{"spnews",      spcmd2},
	{"zathura",     spcmd3},
	{"spmc",        spcmd4},
	{"spcmus",      spcmd5},
	{"brave-browser", spcmd6},
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };
static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class             instance    title       tags mask     isfloating   monitor */
	{ "Brave-browser",   NULL,	      NULL,       1 << 0,		        	0,			 -1 },
	{ NULL,             "spterm",		  NULL,       SPTAG(0),           1,			 -1 },
	{ NULL,             "splf",	    	NULL,       SPTAG(1),           1,			 -1 },
	// { NULL,             "zathura",	  NULL,       SPTAG(2),           1,			 -1 },
	{ NULL,             "spmc",	      NULL,       SPTAG(3),           1,			 -1 },
	{ NULL,             "spcmus",	    NULL,       SPTAG(4),           1,			 -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static const char *dmenucmd[] = { "dmenu_run", "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "tabbed", "-r", "2", "st", "-w", "''", NULL };
static const char *passmenu[]  = { "passmenu", NULL };

/* make a screenshot*/
static const char *screenshot[]  = { "scrot", "-s", "/home/xwav/screenshots/%Y-%m-%d-%s_$wx$h.jpg", NULL };

/*define volume keys alsa-utils */
static const char *mutecmd[] = { "amixer", "-q", "set", "Master", "toggle", NULL };
static const char *volupcmd[] = { "amixer", "-q", "set", "Master", "5%+", "unmute", NULL };
static const char *voldowncmd[] = { "amixer", "-q", "set", "Master", "5%-", "unmute", NULL };
static const char *miccmd[] = { "amixer", "set", "Capture", "toggle", NULL };

/* define  brightness keys/
static const char *brightnessup[] = { "xbacklight", "-inc", "5"};
static const char *brightnessdown[] = { "xbacklight", "-dec", "5"};
*/

/* keys for Pulseaudio
        { 0,                       XF86XK_AudioLowerVolume, spawn, {.v = downvol } },
        { 0,                       XF86XK_AudioMute, spawn,        {.v = mutevol } },
        { 0,                       XF86XK_AudioRaiseVolume, spawn, {.v = upvol   } },
*/

/* keys for brightness controll 
        { 0,                       XF86XK_MonBrightnessUp, spawn, {.v = brightnessup} },
        { 0,                       XF86XK_MonBrightnessDown, spawn, {.v = brightnessdown} },
*/

static const Key keys[] = {
	/* modifier                     key        function        argument */

/* keys for alsa-utils*/
   { 0, XF86XK_AudioMute,                    spawn,           {.v = mutecmd } },
   { 0, XF86XK_AudioLowerVolume,             spawn,           {.v = voldowncmd } },
   { 0, XF86XK_AudioRaiseVolume,             spawn,           {.v = volupcmd } },
   { 0, XF86XK_AudioMicMute,                 spawn,           {.v = miccmd } },

	{ MODKEY|ControlMask,           XK_Up,     pushdown,               {0} },
	{ MODKEY|ControlMask,           XK_Down,   pushup,                 {0} },
	// { MODKEY,                       XK_p,      spawn,          SHCMD("passmenu") },
  { MODKEY,                       XK_d,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_s,      spawn,          {.v = screenshot } },
	{ MODKEY,                       XK_p,      spawn,          {.v = passmenu } },
	{ MODKEY|ShiftMask,             XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_o,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_Tab,    shiftview,      {.i = -1 } },
	{ MODKEY,                       XK_backslash,  shiftview,      {.i = +1 } },

	// { MODKEY|ShiftMask,             XK_Down,    rotatestack,    {.i = +1 } },
	// { MODKEY|ShiftMask,             XK_Up,      rotatestack,    {.i = -1 } },

	{ MODKEY,                       XK_j,   focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,     focusstack,     {.i = -1 } },

	{ MODKEY|ShiftMask,             XK_j,      rotatestack,    {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_k,      rotatestack,    {.i = -1 } },

	{ MODKEY|ShiftMask,             XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY|ShiftMask,             XK_l,      setmfact,       {.f = +0.05} },

  { MODKEY|ShiftMask,             XK_Left,   shifttag,       {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_Right,  shifttag,       {.i = +1 } },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY|ShiftMask,             XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
	{ MODKEY|ShiftMask,             XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY|ShiftMask,             XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY|ShiftMask,             XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },

  // Scratchpads
  { MODKEY,                       XK_grave,  togglescratch,  {.ui = 0 } },
	{ MODKEY,                       XK_n,      togglescratch,  {.ui = 1 } },
	{ MODKEY,                       XK_z,      togglescratch,  {.ui = 2 } },
	{ MODKEY,                       XK_m,      togglescratch,  {.ui = 3 } },
	{ MODKEY,                       XK_c,      togglescratch,  {.ui = 4 } },
	{ MODKEY,                       XK_b,      togglescratch,  {.ui = 5 } },
	
  TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

