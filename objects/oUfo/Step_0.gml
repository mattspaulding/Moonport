/// @description Insert description here
// You can write your code in this editor
if(global.isTerminal)exit;
if(state=="coming"){
timer--;
if(timer<0){
x += (xTo - x) / 15;
y += (yTo - y) / 20;
}

if(x>xTo-.01 && y>yTo-.01){
	if(dropOff==oPlayer)
	{
		with(instance_create_layer(round(x),round(y),layer,oPlayer))
{
pId=other.pId;
name=other.name;
image_blend=other.color;
}

	}
	else
	{
instance_create_layer(round(x),round(y),layer,dropOff);
	}
yTo=-500;
state="leaving";
}
}

if(state="leaving"){
	leavingTimer++;
	y -= leavingTimer;
	if(y<-400){
		instance_destroy()
	}
}