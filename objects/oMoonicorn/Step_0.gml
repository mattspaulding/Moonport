if (global.isTerminal) exit;
if (!isBeingRidden) {
	sprite_index=sMoonicornS;
  var player_instance;
  nearby = false;
  for (i = 0; i < instance_number(oPlayer); i += 1) {
    player_instance = instance_find(oPlayer, i);
    if ((!player_instance.isOccupyingBuilding) && (point_in_circle(player_instance.x, player_instance.y, x, y, 30))) {
      nearby = true;
      if (gamepad_button_check_pressed(player_instance.pId, gp_face1)) {
        image_speed = 1;
        sprite_index = sMoonicornW;
        riddenBy = player_instance;
        pId = riddenBy.pId;
        player_instance.isRiding = true;
        isBeingRidden = true;
		audio_play_sound(snMoonicornWhinny,1,false)
      }
    }

  }
} else {

  #region //Get Player Input
  image_speed = 2.5;
  walksp=2.5;
  riddenBy.image_speed=2.5;

  if (gamepad_button_check(pId, gp_face3)) {
    walksp = 4;
    image_speed = 4;
	riddenBy.image_speed=4;
  }
  if (gamepad_button_check_pressed(pId, gp_face2)) {
    riddenBy.isRiding = false;
    isBeingRidden = false;
  }

  #endregion

  #region //Calculate Movement

  var move = riddenBy.key_right - riddenBy.key_left;

  hsp = (move * walksp) + gunkickx;
  gunkickx = 0;

  vsp = (vsp + grv) + gunkicky;
  gunkicky = 0;


  //Jumping
  canjump -= 1;

  if (place_meeting(x, y + 1, oWall) || (isOccupyingBuilding && place_meeting(x, y + 1, oWallInternal))) {
    canjump = 10;
  }

  if (canjump > 0) && (riddenBy.key_jump) {
    vsp = jumpht;
  }


  #endregion

  #region //Collide and move

  //Horizontal Collision

  
    if (place_meeting(x + hsp, y, oWall)) {
      while (!place_meeting(x + sign(hsp), y, oWall)) {
        x = x + sign(hsp);
      }
      hsp = 0;
    }
  

  //Vertical Collision

 
    if (place_meeting(x, y + vsp, oWall)) {
      while (!place_meeting(x, y + sign(vsp), oWall)) {
        y = y + sign(vsp);
      }
      vsp = 0;
    }
  

  x = x + hsp;
  y = y + vsp;
  #endregion


  #region //Animation
  if (controller == 0) {
    var aimside = sign(mouse_x - x);
    if (aimside != 0) image_xscale = aimside;
  } else {
    if (abs(gamepad_axis_value(pId, gp_axislh)) > 0.2) {
      var aimside = sign(gamepad_axis_value(pId, gp_axislh));
      if (aimside != 0) image_xscale = aimside;
    }
  }

  riddenBy.x = x;
  riddenBy.y = y;



  //if (!place_meeting(x, y + 1, oWall) && !(isOccupyingBuilding && place_meeting(x, y + 1, oWallInternal))) {
  //  sprite_index = sMoonicornA;
  //  image_speed = 0;
  //  if (sign(vsp) > 0) image_index = 1;
  //  else image_index = 0;


  //} else {
    if (sprite_index == sMoonicornA) {
      audio_sound_pitch(snLanding, choose(0.8, 1.0, 1.2));
      audio_play_sound(snLanding, 4, false);
      repeat(5) {
        with(instance_create_layer(x, bbox_bottom, "Outside", oDust)) {
          hsp = random_range(-1, 1);
          vsp = 0;
        }
      }


    }

    if (hsp == 0) {
      riddenBy.image_index = 0;
      image_index = 0;
      sprite_index = sMoonicornS;


    } else {
      sprite_index = sMoonicornW;
    }

  //}
  #endregion
}