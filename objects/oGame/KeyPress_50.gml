/// @description Add Player 2
var exists=false;
if(room!=rMenu){
	with(oPlayer){
		if(pId==1) exists=true;
	}
	if(!exists){
with(instance_create_layer(3200,500,"Outside",oPlayer))
{
pId=1;
hp=100;
name="Colton";
image_blend=make_colour_rgb(127,255,0);
}
	}
}