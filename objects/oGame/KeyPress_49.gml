/// @description Add Player 1
var exists=false;
if(room!=rMenu){
	with(oPlayer){
		if(pId==0) exists=true;
	}
	if(!exists){
with(instance_create_layer(3200,500,"Outside",oPlayer))
{
pId=0;
hp=100;
name="Matt";
image_blend=make_colour_rgb(255,255,0);
}
	}
}