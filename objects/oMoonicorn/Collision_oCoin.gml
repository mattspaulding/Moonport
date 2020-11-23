if (isBeingRidden) {
  
    riddenBy.money++
    audio_play_sound(choose(snCoin00, snCoin01, snCoin02, snCoin03, snCoin04, snCoin05, snCoin06), 10, false);
    with(other) {
      instance_destroy()
    }
  
}