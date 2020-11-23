var player_instance;
nearby = false;
for (i = 0; i < instance_number(oPlayer); i += 1)
{
    player_instance = instance_find(oPlayer, i);
    if ( (point_in_circle(player_instance.x, player_instance.y, x, y, 30)) && (!instance_exists(oTerminalScreen)))
    {
        nearby = true;
        if (gamepad_button_check_pressed(player_instance.pId, gp_face1))
        {
			 with (instance_create_layer(x, y - 20, "Dialog", oTerminalScreen))
            {
                text = other.text;
                length = string_length(text);
				player=player_instance;
            }
        }
    }
   
}