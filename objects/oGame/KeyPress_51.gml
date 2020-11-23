/// @description Add Player 3
var exists=false;
if(room!=rMenu){
	with(oPlayer){
		if(pId==2) exists=true;
	}
	if(!exists){
with(instance_create_layer(3200,500,"Outside",oPlayer))
{
pId=2;
hp=100;
name="Princess";
image_blend=make_colour_rgb(255,105,180);
}
	}
}