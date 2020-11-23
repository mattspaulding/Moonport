if (state == "complete") {
  image_index = 0;
}
if (state == "occupied") {
  image_index = 1;

}

var player;
nearby = false;
for (i = 0; i < instance_number(oPlayer); i += 1) {
  player = instance_find(oPlayer, i);
  if ((instance_exists(player)) && (!player.isRiding) && (point_in_circle(player.x, player.y, 3000, 1120, 32))) {
    nearby = true;
    if (gamepad_button_check_pressed(player.pId, gp_face1)) {
      with(player) {
        isOccupyingBuilding = !isOccupyingBuilding;
        if (isOccupyingBuilding) {
          layer = layer_get_id("Inside_Player");
          with(instance_find(oGun, pId)) {
            layer = other.layer;
          }
          layer_set_visible(layer_get_id("Inside"), true)
          layer_set_visible(layer_get_id("Inside_Player"), true)
          layer_set_visible(layer_get_id("Inside_Middle"), true)
          layer_set_visible(layer_get_id("Inside_Back"), true)
          audio_play_sound(snPressurizedDoorOpening, 1, false);
          with(oGame) {
            audio_sound_gain(music, 0.1, 0);
          }
          with(oCamera) {
            view_prefered_zoom = 0;
          }
          audio_stop_sound(other.music);
          other.music = audio_play_sound(snLaboratory, 1, true);
          other.state = "occupied";
        } else {
          layer = layer_get_id("Outside_Player");
          with(instance_find(oGun, pId)) {
            layer = other.layer;
          }
          audio_play_sound(snPressurizedDoorOpening, 1, false)
          var isOccupied = false;
          for (i = 0; i < instance_number(oPlayer); i += 1) {
            var otherPlayer = instance_find(oPlayer, i);
            if (otherPlayer.isOccupyingBuilding) {
              isOccupied = true;
            }
          }
          if (!isOccupied) {
            other.state = "complete";
            layer_set_visible(layer_get_id("Inside"), false)
            layer_set_visible(layer_get_id("Inside_Player"), false)
            layer_set_visible(layer_get_id("Inside_Middle"), false)
            layer_set_visible(layer_get_id("Inside_Back"), false)
            with(oGame) {
              audio_sound_gain(music, 1, 0)
            }
            with(oCamera) {
              view_prefered_zoom = 1;
            }
            audio_stop_sound(other.music);
          }
        }

      }
    }
  }
}