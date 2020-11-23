#macro RES_W 960
#macro RES_H 540
display_set_gui_size(RES_W,RES_H);

//global.kills = 0;
//global.killsthisroom = 0;
//global.hasgun = false;
//global.HutPlacer="none";
//global.HutCompleted=noone;

global.BuildTargetX=noone;
global.BuildTargetY=noone;
global.BuilderX=noone;
global.BuilderY=noone;
global.BuilderState=noone;

killtextscale = 1;
global.isTerminal=false;
global.isPlayerSelectScreen=false;
isDebug=false;
global.isSplitScreen=false;

global.player1_ready=false;
global.player2_ready=false;
global.player3_ready=false;
global.player4_ready=false;

music=audio_play_sound(snTitle, 0, true);

global.money=50;

global.time=0;
global.r=0;
global.g=0;
global.b=0;

global.buildings=ds_list_create();
global.farms=ds_list_create();
