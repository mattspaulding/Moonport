/// @description Set up camera
cam = view_camera[0];
buff = 0;
view_w=480;
view_h=270;
view_wTo=480;
view_hTo=270;
view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;
xTo = xstart;
yTo = ystart;

shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;

view_zoom=4;
view_min_zoom=0
view_max_zoom=4;
view_prefered_zoom=1;
view_prefered_min_zoom=0
view_prefered_max_zoom=4;

time_in_day=36000;
quarter_day=time_in_day*0.25;
day_state=0;
back_id = layer_background_get_id(layer_get_id("Background"));
rTo=171;
gTo=242;
bTo=255;
rRate=.05;
gRate=.03;
bRate=.08;