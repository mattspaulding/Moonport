if (global.isTerminal)
    exit;

nearby = false;

if (state == "coming")
{
    timer--;
    if (timer < 0)
    {
        x += (xTo - x) / 15;
        y += (yTo - y) / 20;
    }
    
    if (x > xTo - .01 && y > yTo - .01)
    {
        with (instance_create_layer(round(x), round(y), "Outside_Player", oPlayer))
        {
            pId = other.pId;
            name = other.name;
            image_blend = other.color;
        }
        yTo = -500;
        state = "parked";
    }
}

if (state == "leaving")
{
    leavingTimer++;
    y -= clamp(0.01*leavingTimer*leavingTimer,0,20);
    if (y < yTo)
    {
		if(room==rLvMoonport){
			SlideTransition(TRANS_MODE.GOTO,rLvEnceladus);
		}
    	if(room==rLvEnceladus){
			SlideTransition(TRANS_MODE.GOTO,rLvMoonport);
		}
        instance_destroy();
    }
}

if (state == "occupied")
{
    if (gamepad_button_check_pressed(pId, gp_face1))
    {
        state = "leaving";
    }
    if (gamepad_button_check_pressed(pId, gp_face2))
    {
        with (instance_find(oPlayer, pId))
        {
            isOccupyingRocket = false;
			with(instance_find(oGun,pId)){
	isOccupyingRocket=other.isOccupyingRocket;
}
			
        }
        state = "parked";
        audio_play_sound(snPressurizedDoorOpening, 1, false);
    }
}

if (state == "parked")
{
    with (instance_find(oPlayer, pId))
    {
        if (point_in_circle(x, y, other.x, other.y + other.sprite_height * 0.5, 18))
        {
            other.nearby = true;
            if (gamepad_button_check_pressed(pId, gp_face1))
            {
                isOccupyingRocket = true;
				with(instance_find(oGun,pId)){
	              isOccupyingRocket=other.isOccupyingRocket;
                }
                other.state = "occupied";
                audio_play_sound(snPressurizedDoorOpening, 1, false);
            }
        }
    }
}
