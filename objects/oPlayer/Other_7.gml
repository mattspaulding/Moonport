if(global.isTerminal || isOccupyingRocket)exit;
/// @desc Footsteps!
if (sprite_index == sPlayerR)
{
	audio_play_sound(choose(snFoot1,snFoot2,snFoot3,snFoot4),1,false);
	
		repeat(5)
		{
			with (instance_create_layer(x,bbox_bottom,"Outside",oDust))
			{
				vsp = 0;
			}
	}
}

