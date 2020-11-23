deadObj=oPlayerDead;

/// initialize variables in order to draw grid and the path
ds_gridpathfinding = noone ;
path_building = noone ;

/// Initialize variables for ennemy movement
max_speed = 2;
game_gravity = 1;
jump_height = -10;
vsp = 0 ;
hsp = 0 ;

state="waiting";
buildingTarget=noone;

/// Intialialize variables for follow the path
action = 0 ;
path_point = 0 ;
jump_action = 0 ;

