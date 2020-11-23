function ToggleOccupyBuilding() {
  isOccupyingBuilding = !isOccupyingBuilding;
  if (isOccupyingBuilding) {
    with(oHouse) {
      state = "occupied";

    }

  } else {
    if (instance_exists(oHouse)) {
      with(oHouse) {
        for (i = 0; i < instance_number(oPlayer); i += 1) {
          var player = instance_find(oPlayer, i);
          if (player.isOccupyingBuilding) {
            return;
          }
        }
        state = "complete";
      }
    }
  }
}