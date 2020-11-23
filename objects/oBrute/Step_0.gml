if (global.isTerminal)
    exit;


// Determine state 
state = "waiting";
if (attack_counter > 0)
{
    state = "attacking";
}

if(state!="attacking"){
	for (i = 0; i < instance_number(oSpider); i += 1)
	{
	    if (point_in_circle(instance_find(oSpider, i).x, instance_find(oSpider, i).y, x, y, 128))
	    {
	        state = "ready";
	    }
	}
}

//// Check for place to travel 
//if (state == "waiting")
//{
//    if (!ds_list_empty(global.huts))
//    {
//        for (var i = 0; i < ds_list_size(global.huts); i++)
//        {
//            var hut = ds_list_find_value(global.huts, i);
//            if (hut.state == "flag")
//            {
//                PathToObject(hut);
//                buildingTarget = hut;
//                global.BuildTargetX = hut.x / 32;
//                global.BuildTargetY = hut.y / 32;
//                state = "traveling";
//            }
//        }
//    }
//}

// Animation 
if (state == "traveling")
{
    if (!place_meeting(x, y + 1, oWall))
    {
        grounded = false;
        sprite_index = sBuilderA;
        image_speed = 0;
        if (sign(vsp) > 0)
            image_index = 1;
        else
            image_index = 0;
    }
    else
    {
        grounded = true;
        image_speed = 1;
        if (hsp == 0)
        {
            sprite_index = sBrute;
        }
        else
        {
            sprite_index = sBruteR;
        }
    }
}

if (state == "attacking")
{ }

//if (hsp != 0)
//    image_xscale = sign(hsp) * size;
//image_yscale = size;

//if (gamepad_button_check(0, gp_face4))
//{
//    PathToObject(oPlayer);
//}

//// Follow the path if path exists 
//if (path_exists(path_building))
//{
//    scr_follow_the_path(path_building, buildingTarget);
//}


// Apply gravity 
if (!place_meeting(x, y + 1, oWall))
{
    vsp = vsp + game_gravity;
}




// Check if there is a collsiion 
scr_collision();


if (state == "waiting")
{
    sprite_index = sBrute;
}

if (state == "ready")
{
    sprite_index = sBruteAttack;
    image_index = 0;
}

if (state == "attacking")
{
    sprite_index = sBruteAttack;
    image_index = 1;
    attack_counter--;
}
