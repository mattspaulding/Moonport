/// @description Insert description here
// You can write your code in this editor


if (state == "flag")
{
    image_index = 1;
}
if (state == "building")
{
    image_index = 2;
}
if (state == "complete")
{
    image_index = 3;
}
if (state == "occupied")
{
    image_index = 4;
	
}

var player;
nearby = false;
for (i = 0; i < instance_number(oPlayer); i += 1)
{
    player = instance_find(oPlayer, i);
    if ((instance_exists(player)) && (point_in_circle(player.x, player.y,left + 54, y, 18)))
    {
        nearby = true;
        if (gamepad_button_check_pressed(player.pId, gp_face1))
        {
            with (player)
            {
                isOccupyingBuilding = !isOccupyingBuilding;
				if(isOccupyingBuilding){
				layer = layer_get_id("Inside_Player");
				}else{
					layer = layer_get_id("Outside_Player");
				}
				with(instance_find(oGun,pId)){
	                layer=other.layer;
                }
                if (isOccupyingBuilding)
                {
					audio_play_sound(snPressurizedDoorOpening,1, false);
					with(oGame){
					audio_sound_gain(music,0.1,0);
					}
					with(oCamera){
					view_prefered_zoom=0;	
					}
					 audio_stop_sound(other.music);
					other.music=audio_play_sound(snLaboratory,1,true);
				        other.state = "occupied";
						if(!other.terminal)
						{
						other.terminal=instance_create_layer(other.left+64,other.top+68,"Inside_Back",oTerminal);
						}
                }
                else
                {
             		audio_play_sound(snPressurizedDoorOpening,1,false)
                            var isOccupied = false;
                            for (i = 0; i < instance_number(oPlayer); i += 1)
                            {
                                var otherPlayer = instance_find(oPlayer, i);
                                if (otherPlayer.isOccupyingBuilding)
                                {
                                    isOccupied = true;
                                }
                            }
                            if (!isOccupied)
                            {
                                other.state = "complete";
								with(oGame){
					audio_sound_gain(music,1,0)
					}
					with(oCamera){
					view_prefered_zoom=1;	
					}
                     audio_stop_sound(other.music);
					 instance_destroy(other.terminal);
					 other.terminal=noone;
                         }
                        }
                 
            }
        }
    }
}
