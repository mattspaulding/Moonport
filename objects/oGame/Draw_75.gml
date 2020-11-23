/// @desc Draw player info
//if (room != rMenu) && (instance_exists(oPlayer)) && (global.kills > 0)
//{
//	killtextscale = max(killtextscale * 0.95, 1);
//	DrawSetText(c_black, fMenu, fa_right, fa_top);
//	draw_text(RES_W-8,12,string(global.kills) + " Pointless Murders :(", killtextscale,killtextscale,0);
//	draw_set_colour(c_white);
//	draw_text(RES_W-10,10,string(global.kills) + " Pointless Murders :(", killtextscale,killtextscale,0);
//}

//if isDebug
//   {
   show_debug_overlay(true);
//   }
//else
//   {
//   show_debug_overlay(false);
//   }
   
if(isDebug){
if (room != rMenu) 
{
	
		DrawSetText(c_white, fVeranda10, fa_left, fa_top);
if (instance_exists(oUfo)) {
   draw_text(10,10,"ufo "+string(oUfo.x)+" "+string(oUfo.y));
    draw_text(10,30,"BuilderState "+string(global.BuilderState));
  draw_text(10,50,"Builder "+string(global.BuilderX)+" "+string(global.BuilderY));
	}
  draw_text(10,70,"view_prefered_zoom "+string(oCamera.view_prefered_zoom));
  draw_text(10,90,"view_zoom "+string(oCamera.view_zoom));
  draw_text(10,110,"view_min_zoom "+string(oCamera.view_min_zoom));
  draw_text(10, 130, "FPS = " + string(fps));
   draw_text(10, 150, "Time = " + string(global.time));
   draw_text(10, 170, "r = " + string(global.r));
  draw_text(10, 190, "g = " + string(global.g));
  draw_text(10, 210, "b = " + string(global.b));

}
 
}

if(room!=rMenu)
{
	
draw_set_alpha(1);
	DrawSetText(c_white, fVeranda10, fa_center, fa_top);
	  draw_text(RES_W*.5,10,"$"+string(global.money));
	DrawSetText(c_white, fVeranda10, fa_left, fa_top);
	
for (i = 0; i < instance_number(oPlayer); i += 1)
{
    var player_instance = instance_find(oPlayer, i);
    if ( player_instance.pId==0)
    {
var top=15;
var left=20;
draw_healthbar(left,top,left+200,top+25, player_instance.hp, c_black, c_red, c_navy, 0, true, true);
  DrawSetText(c_white, fVeranda10, fa_left, fa_top);
	    draw_text(left+8,top+5,player_instance.name);
      draw_text(left+155,top+5,"$"+string(player_instance.money));
	  
	  if gamepad_is_connected(0)
      {
      draw_text(left, top-13, gamepad_get_description(0));
      }
      else
      {
      draw_text(left,top-13, "No Gamepad Connected");
      }
	  
	     if(player_instance.current_gun){
		   draw_sprite_ext(player_instance.current_gun.display_sprite,0,left+10,top-53,4,4,0,c_white,1);
	    draw_text(left+90, top+5, player_instance.current_gun.ammo);
   	 }
    }
  if ( player_instance.pId==1)
    {
  var top=15;
var left=260;
draw_healthbar(left,top,left+200,top+20, player_instance.hp, c_black, c_red, c_navy, 0, true, true);
  DrawSetText(c_white, fVeranda10, fa_left, fa_top);
	    draw_text(left+8,top+3,player_instance.name);
      draw_text(left+155,top+3,"$"+string(player_instance.money));   
 
 if gamepad_is_connected(1)
      {
      draw_text(left, top-13, gamepad_get_description(1));
      }
   else
      {
      draw_text(left, top-13, "No Gamepad Connected");
      }
	}
	  if ( player_instance.pId==2)
    {
var top=15;
var left=500;
draw_healthbar(left,top,left+200,top+20, player_instance.hp, c_black, c_red, c_navy, 0, true, true);
  DrawSetText(c_white, fVeranda10, fa_left, fa_top);
	    draw_text(left+8,top+3,player_instance.name);
      draw_text(left+155,top+3,"$"+string(player_instance.money));
	  
	  if gamepad_is_connected(2)
      {
      draw_text(left, top-13, gamepad_get_description(2));
      }
   else
      {
      draw_text(left, top-13, "No Gamepad Connected");
      }
    }
  if ( player_instance.pId==3)
    {
  var top=15;
var left=740;
draw_healthbar(left,top,left+200,top+20, player_instance.hp, c_black, c_red, c_navy, 0, true, true);
  DrawSetText(c_white, fVeranda10, fa_left, fa_top);
	    draw_text(left+8,top+3,player_instance.name);
      draw_text(left+155,top+3,"$"+string(player_instance.money));  
	  
	  if gamepad_is_connected(3)
      {
      draw_text(left, top-13, gamepad_get_description(3));
      }
   else
      {
      draw_text(left, top-13, "No Gamepad Connected");
      }
	}
}
}
