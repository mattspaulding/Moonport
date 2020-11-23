if (global.isTerminal || state=="open")
    exit;

nearby = false;

with (oPlayer)
{
    if (point_in_circle(x, y, other.x+16, other.y + other.sprite_height * 0.5, 18))
    {
        other.nearby = true;
        if (gamepad_button_check_pressed(pId, gp_face1))
        {
            other.state="open";
            other.image_index=1;	
            audio_play_sound(snTada, 10, false);
			instance_create_layer(other.x,other.y-32,layer,other.pickup_item)
        }
    }
}