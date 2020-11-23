
//Draw The Box
draw_set_colour(c_black);
draw_set_alpha(1);
draw_rectangle(0,0,RES_W,RES_H,false);
draw_sprite(sMarker,0,x,y);


//Draw index
DrawSetText(c_white, font, fa_center, fa_top);
var alpha=1;
var color=c_white;

draw_text_transformed((RES_W*.5),150,blueprint_title,4,4,0);
draw_sprite_ext(blueprint_sprite,0,(RES_W*.5)-64,RES_H*.5-64,4,4,0,color,alpha);
