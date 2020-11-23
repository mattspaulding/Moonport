/// @description Insert description here
// You can write your code in this editor
state="complete";
music=noone;
terminal=noone;
left = x-(sprite_width*.5);
top=y-sprite_height;

buildingWalls=layer_create(0,"InternalWalls");
layer_set_visible(buildingWalls,false);
			
			with(instance_create_layer(left,top+160,buildingWalls,oWallInternal))
			{
				image_yscale=16;
				image_xscale=192;
			}
			with(instance_create_layer(left+114,top+145,buildingWalls,oWallInternal))
			{
				image_yscale=16;
				image_xscale=46;
			}
			with(instance_create_layer(left+130,top+129,buildingWalls,oWallInternal))
			{
				image_yscale=16;
				image_xscale=30;
			}
			with(instance_create_layer(left+31,top+100,buildingWalls,oWallInternal))
			{
				image_yscale=6;
				image_xscale=80;
			}
			with(instance_create_layer(left+29,top+29,buildingWalls,oWallInternal))
			{
				image_yscale=5;
				image_xscale=131;
			}
			with(instance_create_layer(left+28,top+29,buildingWalls,oWallInternal))
			{
				image_yscale=131;
				image_xscale=4;
			}
			with(instance_create_layer(left+160,top+29,buildingWalls,oWallInternal))
			{
				image_yscale=131;
				image_xscale=4;
			}

