if (state=="ready")
{
    hp -= 2;
    flash = 2;
	audio_play_sound(snBruteAttack,2,false);
}
else
{
    hp -= 5;
    flash = 5;
	audio_play_sound(choose(snBruteHurt01,snBruteHurt02),10,false);

}

    with (other)
    {
        if (other.state=="ready")
        {
            other.attack_counter = 20;
            hp -= 1;
     		 other.x += 5 * sign(hsp);
	   }else{
			 other.x += 10 * sign(hsp);
		}
       
            x -= 20 * sign(hsp);
            bitePause = 20;
      
    
}

