if (instance_exists(oPlayer)) && (point_in_circle(oPlayer.x,oPlayer.y,x,y,64)) && (!instance_exists(oText))
{
	nearby = true;
	if (keyboard_check_pressed(ord("W"))) || gamepad_button_check(0, gp_face1)
	{
		with (instance_create_layer(x,y-20,"Dialog",oText))
		{
			text = other.text;
			length = string_length(text);
		}
	
		with (oCamera)
		{
			other.previous_view_zoom=view_zoom
			view_zoom=0;
			follow=other.id;
		}
	}
}else{
	nearby = false;
	if(instance_exists(oPlayer)) && (!point_in_circle(oPlayer.x,oPlayer.y,x,y,64)) && (instance_exists(oText))
	{
	with(oText){
	instance_destroy();
	}
	with (oCamera)
		{
			follow=oPlayer.id
			view_zoom=other.previous_view_zoom;
		}
	}
}