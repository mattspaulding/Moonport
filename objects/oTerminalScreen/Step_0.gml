
if(money_to_transfer<0){
	money_to_transfer=player.money;
}
draw_set_font(font);

if(player.money>0){
player.money--;
global.money++;
audio_play_sound(_514361__solenoidentity__gritty_ui_audio_29,10,false);
}

if (gamepad_button_check_pressed(player.pId, gp_face1)){
	if(index==0){
		if(global.money<20){
		audio_play_sound(_514340__solenoidentity__gritty_ui_audio_37_error,0,false);
	}else{
	global.money-=20;
	audio_play_sound(_514363__solenoidentity__gritty_ui_audio_48,0,false);
	with (instance_create_layer(x,y,"Dialog",oUfo))
		{
			timer=500;
			dropOff=oBuilder;
		}
	}
	}
	if(index==1){
	if(global.money<40){
		audio_play_sound(_514340__solenoidentity__gritty_ui_audio_37_error,0,false);
	}else{
	global.money-=40;
	audio_play_sound(_514363__solenoidentity__gritty_ui_audio_48,0,false);
	with (instance_create_layer(x,y,"Dialog",oUfo))
		{
			timer=500;
			dropOff=oSpider;
		}
	}
	}
	if(index==2){
	if(global.money<60){
		audio_play_sound(_514340__solenoidentity__gritty_ui_audio_37_error,0,false);
	}else{
	global.money-=60;
	audio_play_sound(_514363__solenoidentity__gritty_ui_audio_48,0,false);
	with (instance_create_layer(x,y,"Dialog",oUfo))
		{
			timer=500;
			dropOff=oBrute;
		}
	}
	}
    if(index==3){
	if(global.money<80){
		audio_play_sound(_514340__solenoidentity__gritty_ui_audio_37_error,0,false);
	}else{
	global.money-=80;
	audio_play_sound(_514363__solenoidentity__gritty_ui_audio_48,0,false);
	with (instance_create_layer(x,y,"Dialog",oUfo))
		{
			timer=500;
			dropOff=oFarmer;
		}
	}
	}
}
if (gamepad_button_check_pressed(player.pId, gp_face2)){
	audio_play_sound(_514341__solenoidentity__gritty_ui_audio_34,0,false);
		alarm[0]=1;
}
if(indexing){
	if (abs(gamepad_axis_value(player.pId,gp_axislh)) <= 0.2){
	indexing=false;	
	}
}

if(!indexing){
if (gamepad_axis_value(player.pId,gp_axislh) < -0.2)
	{
		if(index>0){
	index--;
	audio_play_sound(_514314__solenoidentity__gritty_ui_audio_12,0,false);
		}else{
		audio_play_sound(_514342__solenoidentity__gritty_ui_audio_35,0,false);	
		}
	indexing=true;
	}
if (gamepad_axis_value(player.pId,gp_axislh) > 0.2)
	{
		if(index<max_index){
	index++;
	audio_play_sound(_514314__solenoidentity__gritty_ui_audio_12,0,false);
		}else{
		audio_play_sound(_514342__solenoidentity__gritty_ui_audio_35,0,false);		
		}
	indexing=true;
	}
}
