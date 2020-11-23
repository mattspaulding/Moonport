money=20;

create_spider_counter_max=120;
create_spider_counter=create_spider_counter_max;

walls=instance_create_layer(x-sprite_width*.5,y+sprite_height*.5,"Walls",oWall)
		with(walls)
		{
				image_xscale=2;
			}