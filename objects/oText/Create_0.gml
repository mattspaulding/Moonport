spd = 0.5;
letters = 0;
text = "This is a test string!\nSecond line!";
length = string_length(text);
text_current = "";
w = 0;
h = 0;
border = 10;
font=fSign;

with(oGame){
audio_sound_gain(music, .1, 0);
}