global.killsthisroom = 0;


audio_stop_sound(music)
if(room==rMenu)
{
	music=audio_play_sound(snTitle, 0, true);
}
else if(room==rLvMoonport || room==rLvEnceladus)
{
	music=audio_play_sound(snLvOne, 0, true);
	
if(room==rLvEnceladus)
{
	audio_play_sound(snEnceladus, 10, false);
}

if(global.player1_ready)
{
with (instance_create_layer(x,y,"Outside_Back",oRocket))
		{
			timer=100;
			dropOff=oPlayer;
			pId=0;
			name="Matt";
color=make_colour_rgb(255,255,255);
x=3648;
xTo=3648;
image_blend=color;
			}
}

if(global.player2_ready)
{
with (instance_create_layer(x,y,"Outside_Back",oRocket))
		{
			timer=150;
			dropOff=oPlayer;
			pId=1;
	name="Colton";
color=make_colour_rgb(127,255,0);
x=3552;
xTo=3552;
image_blend=color;
	}
}

if(global.player3_ready)
{
with (instance_create_layer(x,y,"Outside_Back",oRocket))
		{
			timer=200;
			dropOff=oPlayer;
			pId=2;
	name="Princess";
color=make_colour_rgb(255,105,180);
x=3456;
xTo=3456;
image_blend=color;
	}
}

if(global.player4_ready)
{
with (instance_create_layer(x,y,"Outside_Back",oRocket))
		{
			timer=250;
			dropOff=oPlayer;
			pId=3;
	name="Laura";
color=make_colour_rgb(255,105,4);
x=3360;
xTo=3360;
image_blend=color;
	}
}



}
audio_sound_gain(music, .0, 0);