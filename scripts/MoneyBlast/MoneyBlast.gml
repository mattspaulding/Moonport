function MoneyBlast() {

	var newLayer="Outside_Player";
	if string_pos("Inside_", layer_get_name(layer)) != 0
	   {
	  newLayer= "Inside_Player";
	   }
	repeat(money)
			{
				with (instance_create_layer(x,y,newLayer,oCoin))
				{
					//layer=other.layer;
					image_speed=random_range(.8,1.2);
					hsp = random_range(-4,4);
					vsp = random_range(-3,-8);
				}
			}


}
