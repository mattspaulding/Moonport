function KillPlayer() {
	//with (oGun) instance_destroy();

	if(deadObj){
	instance_change(deadObj,true);
	direction = hitfrom;
	hsp = lengthdir_x(6,direction);
	vsp = lengthdir_y(4,direction)-2;
	if (sign(hsp) != 0) image_xscale = -sign(hsp);
	}else{
		instance_destroy();
	}



	MoneyBlast();



}
