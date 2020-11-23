
//Draw The Box
draw_set_colour(c_black);
draw_set_alpha(1);
draw_rectangle(0,0,RES_W,RES_H,false);



DrawSetText(c_white, font, fa_center, fa_top);
var color=c_white;
var margin=120;
var line_width=10;
   draw_set_color(color)
        draw_rectangle(0,0,RES_W*.25,RES_H,false);
 
if gamepad_is_connected(0)
      {
		  if(global.player1_ready)
		  {
			 draw_set_color(c_black)
         draw_rectangle(0+line_width,0+line_width,RES_W*.25-line_width,RES_H-line_width,false);
   draw_set_color(color)
 draw_text_transformed(margin,170,"Matt",3,3,0);
draw_sprite_ext(sPlayer,0,margin,280,10,10,0,color,1);
		  }
		  else
		  {
   draw_text_transformed_color(margin,170,"Player 1",3,3,0,c_black,c_black,c_black,c_black,1);
     draw_text_transformed_color(margin,260,"Press",3,3,0,c_black,c_black,c_black,c_black,1);
   draw_text_transformed_color(margin,300,"Start",3,3,0,c_black,c_black,c_black,c_black,1);

		  }
      }
   else
      {
     draw_text_transformed_color(margin,170,"Player 1",3,3,0,c_black,c_black,c_black,c_black,1);
     draw_text_transformed_color(margin,260,"Connect",3,3,0,c_black,c_black,c_black,c_black,1);
   draw_text_transformed_color(margin,300,"Gamepad",3,3,0,c_black,c_black,c_black,c_black,1);
   }
	  
	  margin=360
	  color=make_colour_rgb(127,255,0)
	draw_set_color(color)
	     draw_rectangle(RES_W*.25,0,RES_W*.5,RES_H,false);
 
	if gamepad_is_connected(1)
      {
 if(global.player2_ready)
		  {
			  draw_set_color(c_black)
			  		      draw_rectangle(RES_W*.25+line_width,0+line_width,RES_W*.5-line_width,RES_H-line_width,false);
  draw_set_color(color)
  draw_text_transformed(margin,170,"Colton",3,3,0);
draw_sprite_ext(sPlayer,0,margin,280,10,10,0,color,1);
		  }
		  else
		  {
	   draw_text_transformed_color(margin,170,"Player 2",3,3,0,c_black,c_black,c_black,c_black,1);
     draw_text_transformed_color(margin,260,"Press",3,3,0,c_black,c_black,c_black,c_black,1);
   draw_text_transformed_color(margin,300,"Start",3,3,0,c_black,c_black,c_black,c_black,1);

		  }
      }
   else
      {
     draw_text_transformed_color(margin,170,"Player 2",3,3,0,c_black,c_black,c_black,c_black,1);
     draw_text_transformed_color(margin,260,"Connect",3,3,0,c_black,c_black,c_black,c_black,1);
   draw_text_transformed_color(margin,300,"Gamepad",3,3,0,c_black,c_black,c_black,c_black,1);
   }

	  margin=600
	  color=make_colour_rgb(255,105,180)
	draw_set_color(color)
	   draw_rectangle(RES_W*.5,0,RES_W*.75,RES_H,false);
  
	if gamepad_is_connected(2)
      {
 if(global.player3_ready)
		  {
			  draw_set_color(c_black);
			     draw_rectangle(RES_W*.5+line_width,0+line_width,RES_W*.75-line_width,RES_H-line_width,false);
   draw_set_color(color)
 draw_text_transformed(margin,170,"Princess",3,3,0);
draw_sprite_ext(sPlayer,0,margin,280,10,10,0,color,1);
		  }
		  else
		  {
    draw_text_transformed_color(margin,170,"Player 3",3,3,0,c_black,c_black,c_black,c_black,1);
     draw_text_transformed_color(margin,260,"Press",3,3,0,c_black,c_black,c_black,c_black,1);
   draw_text_transformed_color(margin,300,"Start",3,3,0,c_black,c_black,c_black,c_black,1);

		  }
      }
   else
      {
      draw_text_transformed_color(margin,170,"Player 3",3,3,0,c_black,c_black,c_black,c_black,1);
     draw_text_transformed_color(margin,260,"Connect",3,3,0,c_black,c_black,c_black,c_black,1);
   draw_text_transformed_color(margin,300,"Gamepad",3,3,0,c_black,c_black,c_black,c_black,1);
   }
   
	  margin=840
	  color=make_colour_rgb(135,206,235)
	draw_set_color(color)
	   draw_rectangle(RES_W*.75,0,RES_W,RES_H,false);
	if gamepad_is_connected(3)
      {
 if(global.player4_ready)
		  {
			  draw_set_color(c_black)
			  		      draw_rectangle(RES_W*.75+line_width,0=line_width,RES_W+line_width,RES_H+line_width,false);
   draw_set_color(color)
		  draw_text_transformed(margin,170,"Laura",3,3,0);
draw_sprite_ext(sPlayer,0,margin,280,10,10,0,color,1); 
		  }
		  else
		  {
	  draw_text_transformed_color(margin,170,"Player 4",3,3,0,c_black,c_black,c_black,c_black,1);
     draw_text_transformed_color(margin,260,"Press",3,3,0,c_black,c_black,c_black,c_black,1);
   draw_text_transformed_color(margin,300,"Start",3,3,0,c_black,c_black,c_black,c_black,1);

		  }
      }
   else
      {
      draw_text_transformed_color(margin,170,"Player 4",3,3,0,c_black,c_black,c_black,c_black,1);
     draw_text_transformed_color(margin,260,"Connect",3,3,0,c_black,c_black,c_black,c_black,1);
   draw_text_transformed_color(margin,300,"Gamepad",3,3,0,c_black,c_black,c_black,c_black,1);
   }