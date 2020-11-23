

vsp = vsp + grv

#region //Collide and move
//Horizontal Collision
if(layer==layer_get_id("Outside_Player")){
if (place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x + sign(hsp);
	}
	hsp  *=-.8
}
}else{
	if (place_meeting(x+hsp,y,oWallInternal))
{
	while (!place_meeting(x+sign(hsp),y,oWallInternal))
	{
		x = x + sign(hsp);
	}
	hsp  *=-.8
}
}

//Vertical Collision
if(layer==layer_get_id("Outside_Player")){
if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);
	}
	if(vsp<1&&vsp>-1){
	vsp=0
	}else{
		vsp *=-.5
	}
	hsp*=.5
}
}else{
	if (place_meeting(x,y+vsp,oWallInternal))
{
	while (!place_meeting(x,y+sign(vsp),oWallInternal))
	{
		y = y + sign(vsp);
	}
	if(vsp<1&&vsp>-1){
	vsp=0
	}else{
		vsp *=-.5
	}
	hsp*=.5
}
}


x = x + hsp;
y = y + vsp;

#endregion