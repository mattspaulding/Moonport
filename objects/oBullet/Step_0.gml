if(global.isTerminal)exit;
x += lengthdir_x(spd,direction);
y += lengthdir_y(spd,direction);
range--;
if(range<0){
	instance_destroy();
}

if (place_meeting(x,y,pShootable))
{
	with (instance_place(x,y,pShootable))
	{
		hp--;
		flash = 3;
		hitfrom = other.direction;
	}

	instance_destroy();
}

if(layer==layer_get_id("Outside_Player")){
if (position_meeting(x,y,oWall)) && (image_index != 0) 
{
	while (position_meeting(x,y,oWall))
	{
		x -= lengthdir_x(1,direction);
		y -= lengthdir_y(1,direction);
	}
	spd = 0;
	instance_change(oHitSpark,true);
	//layer_add_instance(layer,id);
	depth += 1;
}
}else{
	if (position_meeting(x,y,oWallInternal)) && (image_index != 0) 
{
	while (position_meeting(x,y,oWallInternal))
	{
		x -= lengthdir_x(1,direction);
		y -= lengthdir_y(1,direction);
	}
	spd = 0;
	instance_change(oHitSpark,true);
	//layer_add_instance(layer,id);
	depth += 1;
}
}
