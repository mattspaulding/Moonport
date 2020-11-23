if(global.isTerminal || isOccupyingRocket )exit;
#region //Get Player Input

if (hascontrol)
{
	key_left = keyboard_check(ord("A"));
	key_right = keyboard_check(ord("D"));
	key_jump = keyboard_check_pressed(vk_space); 

	if (key_left) || (key_right) || (key_jump)
	{
		controller = 0;
	}

	if (abs(gamepad_axis_value(pId,gp_axislh)) > 0.2 )
	{
		key_left = abs(min(gamepad_axis_value(pId,gp_axislh),0));
		key_right = max(gamepad_axis_value(pId,gp_axislh),0);
		controller = 1;
	}

	if (gamepad_button_check_pressed(pId,gp_shoulderlb) )
	{
		key_jump = 1;
		controller = 1;
	}
	
	if(gamepad_button_check_pressed(pId,gp_face3) )
	{
		if(isRiding){}else{
		ToggleBuildingPlacementMode();
	}}
	
    if(gamepad_button_check_pressed(pId,gp_face4))
	{
		var i;

    for (i = 0; i < instance_number(oGun); i += 1)
    {
	   
    var gun = instance_find(oGun,i);
 	if(current_gun==gun){
		current_gun=instance_find(oGun,(i+1)%instance_number(oGun));
		audio_play_sound(current_gun.gun_loading_sound,2,false);
		break;
	}
   }
	}
	
}
else
{
	key_right = 0;
	key_left = 0;
	key_jump = 0;
}

#endregion

#region //Calculate Movement

if(!isRiding){

var move = key_right - key_left;

hsp = (move * walksp) + gunkickx;
gunkickx = 0;

vsp = (vsp + grv) + gunkicky;
gunkicky = 0;


//Jumping
canjump-=1;

if (place_meeting(x,y+1,oWall) || (isOccupyingBuilding && place_meeting(x,y+1,oWallInternal)))
{
	canjump = 10;
}

if (canjump > 0) && (key_jump)
{
	vsp = jumpht;	
}

}
#endregion

#region //Collide and move
if(!isRiding){
//Horizontal Collision

if(isOccupyingBuilding){
if (place_meeting(x+hsp,y,oWallInternal))
{
	while (!place_meeting(x+sign(hsp),y,oWallInternal))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}}else{
if (place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}	
}

//Vertical Collision

if(isOccupyingBuilding){
if (place_meeting(x,y+vsp,oWallInternal))
{
	while (!place_meeting(x,y+sign(vsp),oWallInternal))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}}else{
if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}	
}

x = x + hsp;
y = y + vsp;
}
#endregion


#region //Animation
if(controller==0)
{
var aimside = sign(mouse_x - x);
if (aimside != 0) image_xscale = aimside;
}
else
{
	if (abs(gamepad_axis_value(pId,gp_axislh)) > 0.2)
	{
var aimside = sign(gamepad_axis_value(pId,gp_axislh));
if (aimside != 0) image_xscale = aimside;
}
}

if(isRiding){
sprite_index=sPlayerRideMoonicorn

}
else if (!place_meeting(x,y+1,oWall) && !(isOccupyingBuilding && place_meeting(x,y+1,oWallInternal)))
{
	sprite_index = sPlayerA;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
	
	
}
else
{
	if (sprite_index == sPlayerA) 
	{
		audio_sound_pitch(snLanding,choose(0.8,1.0,1.2));
		audio_play_sound(snLanding,4,false);
		repeat(5)
		{
			with (instance_create_layer(x,bbox_bottom,"Outside",oDust))
			{
				hsp = random_range(-1,1);
				vsp = 0;
			}
		}
		
		
	}
	image_speed = 1;
	
	if (hsp == 0)
	{
		sprite_index = sPlayer;
		
		
	}
	else
	{
		sprite_index = sPlayerR;
	}

	
	if(isPlaceBuildingMode)
	{
		with(oFarmPlacer)
		{
			
			x=other.x;
			y=other.bbox_bottom;
			if !place_snapped(32, 32)
			{
				move_snap(32, 32);
				global.HutPlacer=string(oFarmPlacer.x/32)+" "+string(oFarmPlacer.y/32);
				
			}
			state="available";
			for(var i=0;i<ds_list_size(global.buildings);i++)
			{
				var building=ds_list_find_value(global.buildings,i);
				if(x+sprite_width*.5>building.x-building.sprite_width*.5&&x-sprite_width*.5<building.x+building.sprite_width*.5)
				{
					state="overlap";
				}
			}
			if(gamepad_button_check_pressed(other.pId,gp_face1))
			{
				if(state=="available"){
					ds_list_add(global.buildings,instance_create_layer(x,y,"Outside_Back",oFarm));		
				    audio_play_sound(_514373__solenoidentity__gritty_ui_audio_43,8,false);
					with(other) 
					{
						ToggleBuildingPlacementMode();
					}
				}else{
					audio_play_sound(_514323__solenoidentity__gritty_ui_audio_2,8,false);
				}
			}
		}
	}
}
#endregion
