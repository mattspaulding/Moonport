/// @description Add Player 4
var exists=false;
if(room!=rMenu){
	with(oPlayer){
		if(pId==3) exists=true;
	}
	if(!exists){
with(instance_create_layer(3200,500,"Outside",oPlayer))
{
pId=3;
hp=100;
name="Laura";
image_blend=make_colour_rgb(135,206,235);
}
	}
}