if(global.isTerminal)exit;


//Check for place to travel
if(state=="waiting")
{
	if(!ds_list_empty(global.buildings))
	{
		for(var i=0;i<ds_list_size(global.buildings);i++)
		{
			var building=ds_list_find_value(global.buildings,i);
			if(building.state=="complete"&&building.farmer==-1)
			{
				PathToObject(building);
				buildingTarget=building;
				building.farmer=id;
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
			sprite_index = sFarmer;
		}
		else
		{
			sprite_index = sFarmerR;
		}
	}
}

if (hsp != 0) image_xscale = sign(hsp) * size;
image_yscale = size;

if( keyboard_check(ord("S")) || gamepad_button_check(0,gp_face4))
{
   PathToObject(oPlayer)
   }

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
			state="farming";
			buildingTarget.state="farming";
			buildingTarget.farmed++;
			if(buildingTarget.farmed>=1000)
			{
		buildingTarget.farmed=0;
		
				audio_play_sound(snDeath,4,false);
				with(buildingTarget)
				{
					MoneyBlast();	
				}
			}
		}
	}
	
		

// Check if there is a collsiion
scr_collision () ;


if(state=="waiting")
{
	sprite_index=sFarmer;
}
if(state=="farming")
{
	image_speed = 1;
	sprite_index=sFarmerFarm;
}