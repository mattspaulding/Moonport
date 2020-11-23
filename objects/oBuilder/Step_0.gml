if(global.isTerminal)exit;
//vsp = vsp + grv;

////Don't walk off edges
//if (grounded) && (afraidofheights) && (!place_meeting(x+hsp,y+1,oWall))
//{
//	hsp = -hsp;	
//}

////Horizontal Collision
//if (place_meeting(x+hsp,y,oWall))
//{
//	while (!place_meeting(x+sign(hsp),y,oWall))
//	{
//		x = x + sign(hsp);
//	}
//	hsp = -hsp;
//}
//x = x + hsp;

////Vertical Collision
//if (place_meeting(x,y+vsp,oWall))
//{
//	while (!place_meeting(x,y+sign(vsp),oWall))
//	{
//		y = y + sign(vsp);
//	}
//	vsp = 0;
//}
//y = y + vsp;

//Check for place to travel
if(state=="waiting")
{
if(!ds_list_empty(global.buildings))
{
	for(var i=0;i<ds_list_size(global.buildings);i++)
	{
		var building=ds_list_find_value(global.buildings,i);
		if(building.state=="flag")
		{
			PathToObject(building);
			buildingTarget=building;
			global.BuildTargetX=building.x/32;
			global.BuildTargetY=building.y/32;
			state="traveling";
		}
	}
	

}
}

//Animation
if(state=="traveling")
{
	if (!place_meeting(x,y+1,oWall))
	{
		grounded = false;
		sprite_index = sBuilderA;
		image_speed = 0;
		if (sign(vsp) > 0) image_index = 1; else image_index = 0;
	}
	else
	{
		grounded = true;
		image_speed = 1;
		if (hsp == 0)
		{
			sprite_index = sBuilder;
		}
		else
		{
			sprite_index = sBuilderR;
		}
	}
}

if (hsp != 0) image_xscale = sign(hsp) * size;
image_yscale = size;

//if( keyboard_check(ord("S")) || gamepad_button_check(0,gp_face4))
//{
//   PathToObject(oPlayer)
//   }

// Follow the path if path exists
if path_exists(path_building)
{
    scr_follow_the_path(path_building,buildingTarget);
}


// Apply gravity
if !place_meeting (x, y+1, oWall)
    {
        vsp = vsp + game_gravity ;
    }
	
if(buildingTarget)
	{
		if((buildingTarget.x==x) && (buildingTarget.y-16==y))
		{
			state="building";
			buildingTarget.state="building";
			global.BuilderState=state;
			buildingTarget.completed++;
			if(buildingTarget.completed>=buildingTarget.buildTime)
			{
				state="waiting";
				buildingTarget.state="complete";
				buildingTarget=noone;
				audio_play_sound(snDeath,4,false);
			}
		}
	}
	
		global.BuilderX=x/32;
		global.BuilderY=y/32;
			global.BuilderState=state;
	

// Check if there is a collsiion
scr_collision () ;


if(state=="waiting")
{
	sprite_index=sBuilder;	
}
if(state=="building")
{
	image_speed = 1;
	sprite_index=sBuilderB;	
}