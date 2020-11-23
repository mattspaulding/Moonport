with(instance_find(oPlayer, pId)) {
  var controllerh = gamepad_axis_value(pId, gp_axisrh);
  var controllerv = gamepad_axis_value(pId, gp_axisrv);
  if (abs(controllerh) > 0.2) || (abs(controllerv) > 0.2) {
    other.controllerangle = point_direction(0, 0, controllerh, controllerv)
  }
  else {
    if (abs(gamepad_axis_value(pId, gp_axislh)) > 0.2) {
      other.controllerangle = point_direction(0, 0, gamepad_axis_value(pId, gp_axislh), 0)
    }
  }
  other.image_angle = other.controllerangle;
  
   if (current_gun.id != other.id) {
    other.x = -200;
    other.y = -200;
    exit;
  }
  if(isRiding){
	 if (image_xscale==-1)  {
 	    other.x = x+3;
		other.y = y+3;
	 }else{
	   other.x = x-3;
		other.y = y+3;
		 
	 }
  }else{
  other.x = x;
  other.y = y + 7;
  }

}




firingdelay = firingdelay - 1;

var gunRef = id;

with(instance_find(oPlayer, pId)) {
  if ((gamepad_button_check(pId, gp_shoulderrb) && gunRef.firingdelay < 0) || gamepad_button_check_pressed(pId, gp_shoulderrb)) {
    gunRef.firingdelay = gunRef.set_firing_delay;
    gunRef.recoil = gunRef.set_recoil;
    if (gunRef.ammo <= 0) {
      audio_play_sound(snGunClick, 0, false);
    } else {
      gunRef.ammo--;
      ScreenShake(2, 10);
      audio_sound_pitch(gunRef.gun_shot_sound, choose(0.8, 1.0, 1.2));
      audio_play_sound(gunRef.gun_shot_sound, 0, false);
      with(instance_create_layer(gunRef.x, gunRef.y - 2, layer, oBullet)) {
        spd = 25;
		range=gunRef.set_range;
        direction = gunRef.image_angle + random_range(-3, 3);
        image_angle = direction;
      }


      gunkickx = lengthdir_x(5.5, gunRef.image_angle - 180);
      gunkicky = lengthdir_y(1, gunRef.image_angle - 180);

    }
  }
}

recoil = max(0, recoil - 1);

x = x - lengthdir_x(recoil, image_angle);
y = y - lengthdir_y(recoil, image_angle);

if (image_angle > 90) && (image_angle < 270) {
  image_yscale = -1
}
else {
  image_yscale = 1;
}