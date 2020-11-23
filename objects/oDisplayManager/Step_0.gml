/// @description Insert description here
// You can write your code in this editor

if(keyboard_check_pressed(ord("Z"))){
zoom++;	
if(zoom>max_zoom)zoom=1;
window_set_size(ideal_width*zoom,ideal_height*zoom);
alarm[0]=1;
}