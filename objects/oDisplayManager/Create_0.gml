event_inherited();
///Properties
ideal_width=3840; //Doesn't matter because we are going to calculate this.
ideal_height=2160;
zoom=1;
max_zoom=1;

 
   
max_zoom = floor(display_get_width()/480);
 zoom=max_zoom;
//Setup all the view ports so I don't have to.
globalvar Main_Camera;
Main_Camera = camera_create_view(0,0,ideal_width,ideal_height,0,noone,0,0,0,0);

//camera_set_view_size(Main_Camera,ideal_width,ideal_height);
 
for(var i=1; i<= room_last; i++)
{
  if(room_exists(i))
  {    
        room_set_view_enabled(i,true);
      	room_set_viewport(i,0,true,0,0,ideal_width,ideal_height);
        room_set_camera(i,0,Main_Camera);
  }
}
 
surface_resize(application_surface,ideal_width,ideal_height);
display_set_gui_size(ideal_width,ideal_height);
window_set_size(480*zoom,270*zoom);
 
alarm[0]=1; //Center Window
alarm[2]=1; //Change Zoom

room_goto_next()