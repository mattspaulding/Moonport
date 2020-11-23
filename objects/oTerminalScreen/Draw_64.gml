
//Draw The Box
draw_set_colour(c_black);
draw_set_alpha(1);
draw_rectangle(0,0,RES_W,RES_H,false);
draw_sprite(sMarker,0,x,y);


if(player.money>0){
//Draw sync
DrawSetText(c_white, font, fa_center, fa_top);
draw_healthbar(200,90,RES_W-200,100, (1-(player.money/money_to_transfer))*100, c_black, c_red, c_green, 0, false, false);

}

//Draw index
DrawSetText(c_white, font, fa_center, fa_top);
var spacing=400;
var alpha=1;
var color=c_white;
indexX += ((index*spacing) - indexX) / 15;

if(global.money<20){
	color=c_red;
}else{
	color=c_white;	
}
if(index==0){
	alpha=1;
}else{
	alpha=.2;
}
draw_set_alpha(alpha);
draw_set_color(color)
draw_text_transformed((RES_W*.5)-(indexX)+spacing*0,150,"$20 - Builder",4,4,0);
draw_sprite_ext(sBuilder,0,(RES_W*.5)-(indexX)+spacing*0,RES_H*.5,10,10,0,color,alpha);

if(global.money<40){
	color=c_red;
}else{
	color=c_white;	
}
if(index==1){
	alpha=1;
}else{
	alpha=.2;
}
draw_set_alpha(alpha);
draw_set_color(color)
draw_text_transformed((RES_W*.5)-(indexX)+spacing*1,150,"$40 - Spider",4,4,0);
draw_sprite_ext(sSpider,0,(RES_W*.5)-(indexX)+spacing*1,RES_H*.5,10,10,0,color,alpha);

if(global.money<60){
	color=c_red;
}else{
	color=c_white;	
}
if(index==2){
	alpha=1;
}else{
	alpha=.2;
}
draw_set_alpha(alpha);
draw_set_color(color)
draw_text_transformed((RES_W*.5)-(indexX)+spacing*2,150,"$60 - Brute",4,4,0);
draw_sprite_ext(sBrute,0,(RES_W*.5)-(indexX)+spacing*2,RES_H*.5,10,10,0,color,alpha);

if(global.money<80){
	color=c_red;
}else{
	color=c_white;	
}
if(index==3){
	alpha=1;
}else{
	alpha=.2;
}
draw_set_alpha(alpha);
draw_set_color(color)
draw_text_transformed((RES_W*.5)-(indexX)+spacing*3,150,"$80 - Farmer",4,4,0);
draw_sprite_ext(sFarmer,0,(RES_W*.5)-(indexX)+spacing*3,RES_H*.5,10,10,0,color,alpha);
