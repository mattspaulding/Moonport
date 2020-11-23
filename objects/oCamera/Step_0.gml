/// @description Update camera

// Apply zoom

var is_set_split_screen = false;

with (oPlayer)
{
    other.view_prefered_zoom += gamepad_button_check_pressed(pId, gp_shoulderl);
    other.view_prefered_zoom -= gamepad_button_check_pressed(pId, gp_shoulderr);
}


view_prefered_zoom = clamp(view_prefered_zoom, view_prefered_min_zoom, view_prefered_max_zoom);
view_zoom = view_prefered_zoom;
view_zoom = clamp(view_zoom, view_min_zoom, view_max_zoom);

if (room != rMenu && !instance_exists(oPlayer))
{
    view_zoom = 4;
}

switch (view_zoom)
{
    case -3:
        view_wTo = 30;
        view_hTo = 16.875;
        break;
    case -2:
        view_wTo = 60;
        view_hTo = 33.75;
        break;
    case -1:
        view_wTo = 120;
        view_hTo = 67.5;
        break;
    case 0:
        view_wTo = 240;
        view_hTo = 135;
        break;
    case 1:
        view_wTo = 480;
        view_hTo = 270;
        break;
    case 2:
        view_wTo = 960;
        view_hTo = 540;
        break;
    case 3:
        if (view_prefered_zoom < 3)
        {
            is_set_split_screen = true;
        }
        view_wTo = 1920;
        view_hTo = 1080;
        break;
    case 4:
        if (view_prefered_zoom < 4)
        {
            is_set_split_screen = true;
        }
        view_wTo = 3840;
        view_hTo = 2160;
        break;
    default:
        view_wTo = 480;
        view_hTo = 270;
        break;
}

// Update object position 
view_w += (view_wTo - view_w) / 15;
view_h += (view_hTo - view_h) / 15;

view_w_half = view_w * 0.5;
view_h_half = view_h * 0.5;


// Update destination 
xLeft = 99999999;
xRight = 0;
yTop = 999999999;
yBottom = 0;

for (var i = 0; i < instance_number(oPlayer); i++)
{
    var inst = instance_find(oPlayer, i);
    if (inst.x < xLeft)
        xLeft = inst.x;
    if (inst.x > xRight)
        xRight = inst.x;
    if (inst.y < yTop)
        yTop = inst.y;
    if (inst.y > yBottom)
        yBottom = inst.y;
}



if (xRight - xLeft > 10)
{
    view_min_zoom = -3;
}
if (xRight - xLeft > 20)
{
    view_min_zoom = -2;
}
if (xRight - xLeft > 30)
{
    view_min_zoom = -1;
}
if (xRight - xLeft > 75)
{
    view_min_zoom = 0;
}
if (xRight - xLeft > 150)
{
    view_min_zoom = 1;
}
if (xRight - xLeft > 300)
{
    view_min_zoom = 2;
}
if (xRight - xLeft > 600)
{
    view_min_zoom = 3;
}
if (xRight - xLeft > 1200)
{
    view_min_zoom = 4;
}

xTo = xLeft + ((xRight - xLeft) * .5);
yTo = yTop + ((yBottom - yTop) * .5);


// Update object position 
x += (xTo - x) / 15;
y += (yTo - y) / 15;

// Keep camera center inside room 
x = clamp(x, view_w_half + buff, room_width - view_w_half - buff);
y = clamp(y, view_h_half + buff, room_height - view_h_half - buff);

// Screen shake 
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);

shake_remain = max(0, shake_remain - ((1 / shake_length) * shake_magnitude));

// Update camera view 
camera_set_view_size(cam, view_w, view_h);

camera_set_view_pos(cam, x - view_w_half, y - view_h_half);

if ((room != rMenu) && (room != rEnding))
{
    var modd = global.time % time_in_day;
    if (modd >= 0 && modd < time_in_day * 0.25)
    {
        day_state = 0;
		global.r=(global.time % quarter_day)*rRate;
		if(global.r>rTo) global.r=rTo;
		global.g=(global.time % quarter_day)*gRate;
		if(global.g>gTo) global.g=gTo;
		global.b=(global.time % quarter_day)*bRate;
		if(global.b>bTo) global.b=bTo;
		
layer_background_blend(back_id, make_color_rgb( global.r,global.g,global.b));
    }
    else if (modd >= time_in_day * 0.25 && modd < time_in_day * 0.5)
    {
        day_state = 1;
        global.r=(quarter_day*rRate) - ((global.time % quarter_day)*rRate);
		if(global.r>rTo) global.r=rTo;
		global.g=(quarter_day*gRate) -((global.time % quarter_day)*gRate);
	    if(global.g>gTo) global.g=gTo;
		global.b=(quarter_day*bRate) -((global.time % quarter_day)*bRate);
		if(global.b>bTo) global.b=bTo;
		
layer_background_blend(back_id, make_color_rgb( global.r,global.g,global.b));
    }
    else if (modd >= time_in_day * 0.5 && modd < time_in_day * .75)
    {
        day_state = 2;
    }
    else if (modd >= time_in_day * 0.75 && modd < time_in_day)
    {
        day_state = 3;
    }
    
    
    if (layer_exists("Stars"))
    {
        layer_x("Stars", x * .9);
        layer_y("Stars", y * .9);
    }
    
    var mag = 0.02
    
    ;
    if (layer_exists("Saturn"))
    {
        if (day_state == 0)
        {
            layer_x("Saturn", x - 96 - (quarter_day * 0.5 * mag) + ((global.time % quarter_day) * 0.5 * mag));
            layer_y("Saturn", y  - ((global.time % quarter_day) * mag));
        }
        else if (day_state == 1)
        {
            layer_x("Saturn", x - 96 + ((global.time % quarter_day) * 0.5 * mag));
            layer_y("Saturn", y  - (quarter_day * mag) + ((global.time % quarter_day) * mag));
        }
        else if (day_state == 2)
        {
            layer_x("Saturn", x - 96 + (quarter_day * 0.5 * mag) - ((global.time % quarter_day) * 0.5 * mag));
            layer_y("Saturn", y  + ((global.time % quarter_day) * mag));
        }
        else if (day_state == 3)
        {
            layer_x("Saturn", x - 96 - (global.time % quarter_day) * 0.5 * mag);
            layer_y("Saturn", y  + (quarter_day * mag) - ((global.time % quarter_day) * mag));
        }
    }
}


if (is_set_split_screen && !global.isSplitScreen)
{
    var numPlayers = instance_number(oPlayer);
    
    if (numPlayers == 2)
    {
        global.isSplitScreen = true;
        
        // camera_destroy(cam);
        view_visible[0] = false;
        view_enabled = true;
        
        var width = 480, height = 270, scale = 1;
        
        
        var player1 = instance_find(oPlayer, 0);
        
        view_visible[1] = true;
        
        // Create camera
        view_set_camera(1, camera_create_view(0, 0, width, height * .5, 0, player1, -1, -1, width * .5, height * .25));
        
        // Set view position
        view_xport[1] = 0;
        view_yport[1] = 0;
        view_wport[1] = width;
        view_hport[1] = height * .5;
        
        var player2 = instance_find(oPlayer, 1);
        
        view_visible[2] = true;
        
        // Create camera
        view_set_camera(2, camera_create_view(0, 0, width, height * .5, 0, player2, -1, -1, width * .5, height * .25));
        
        // Set view position
        view_xport[2] = 0;
        view_yport[2] = height * .5;
        view_wport[2] = width;
        view_hport[2] = height * .5;
    }
    if (numPlayers > 2)
    {
        global.isSplitScreen = true;
        
        // camera_destroy(cam);
        view_visible[0] = false;
        view_enabled = true;
        
        var width = 480, height = 270, scale = 1;
        
        
        var player1 = instance_find(oPlayer, 0);
        
        view_visible[1] = true;
        
        // Create camera
        view_set_camera(1, camera_create_view(0, 0, width * .5, height * .5, 0, player1, -1, -1, width * .25, height * .25));
        
        // Set view position
        view_xport[1] = 0;
        view_yport[1] = 0;
        view_wport[1] = width * .5;
        view_hport[1] = height * .5;
        
        var player2 = instance_find(oPlayer, 1);
        
        view_visible[2] = true;
        
        // Create camera
        view_set_camera(2, camera_create_view(0, 0, width * .5, height * .5, 0, player2, -1, -1, width * .25, height * .25));
        
        // Set view position
        view_xport[2] = width * .5;
        view_yport[2] = 0;
        view_wport[2] = width * .5;
        view_hport[2] = height * .5;
        
        var player3 = instance_find(oPlayer, 2);
        
        view_visible[3] = true;
        
        // Create camera
        view_set_camera(3, camera_create_view(0, 0, width * .5, height * .5, 0, player3, -1, -1, width * .25, height * .25));
        
        // Set view position
        view_xport[3] = 0;
        view_yport[3] = height * .5;
        view_wport[3] = width * .5;
        view_hport[3] = height * .5;
        
        
        view_visible[4] = true;
        
        // Create camera
        view_set_camera(4, camera_create_view(0, 0, view_wTo, view_hTo, 0, player1, -1, -1, view_wTo * .5, view_hTo * .5));
        
        // Set view position
        view_xport[4] = width * .5;
        view_yport[4] = height * .5;
        view_wport[4] = width * .5;
        view_hport[4] = height * .5;
    }
    
    
    // window_set_size(width * scale, height * scale);
    // surface_resize(application_surface, width * scale, height * scale);
}
else if (!is_set_split_screen && global.isSplitScreen)
{
    global.isSplitScreen = false;
    view_visible[0] = true;
    view_visible[1] = false;
    view_visible[2] = false;
    view_visible[3] = false;
    view_visible[4] = false;
}


