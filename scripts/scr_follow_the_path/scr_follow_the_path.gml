function scr_follow_the_path(argument0, argument1) {
	var number_of_points = path_get_number(argument0);
	var path_direction ;

	path_direction = sign(path_get_point_x(argument0, path_point+1)-path_get_point_x(argument0, path_point)) ;

	if action == 0
	{
	    /// Check if the next point is to move left or right
	    if path_get_point_y(argument0, path_point) == path_get_point_y(argument0, path_point+1) && path_get_point_x(argument0, path_point) + oGrid.cell_width*path_direction == path_get_point_x(argument0, path_point+1)
	    {
	    hsp = max_speed * path_direction ;
	    action = 1;
	    }
	     else {
	            /// Check if the next point is horizontal jump / jump over a void.
	            if path_get_point_y(argument0, path_point) == path_get_point_y(argument0, path_point+1) && path_get_point_x(argument0, path_point) + 2*oGrid.cell_width*path_direction == path_get_point_x(argument0, path_point+1)
	            {
	            hsp = max_speed * path_direction ;
	            vsp = jump_height *0.7 ;
	            action = 1;
	            }
	                else {
	                    /// Check if the next point is to fall
	                    if path_get_point_y(argument0, path_point) < path_get_point_y(argument0, path_point+1)
	                    {
	                    hsp = max_speed * path_direction ;
	                        if x <= path_get_point_x(argument0, path_point+1) && path_get_point_x(argument0, path_point+1) <(x + hsp*path_direction)
	                        {
	                        action = 1 ;
	                        hsp = 0 ;
	                        x = path_get_point_x(argument0, path_point+1);
	                        }
	                    }
	                        else {
	                                /// Check if the next point is a diagonal jum /big jump
	                                if path_get_point_x(argument0, path_point) == path_get_point_x(argument0, path_point+1)-oGrid.cell_width*2*path_direction && path_get_point_y(argument0, path_point) == path_get_point_y(argument0, path_point+1)+oGrid.cell_height
	                                {
	                                hsp = max_speed * path_direction * 1.1 ;
	                                vsp = jump_height * 1.1 ;
	                                action = 1;
	                                }
	                                    else {
	                                            /// Check if the next point is a jump one block vertically
	                                            if path_get_point_y(argument0, path_point) == path_get_point_y(argument0, path_point+1)+oGrid.cell_height && path_get_point_x(argument0, path_point) + oGrid.cell_width*path_direction == path_get_point_x(argument0, path_point+1)
	                                            {
	                                            hsp = max_speed * path_direction / 2;
	                                                if place_meeting(x, y+1, oWall) && jump_action == 0
	                                                {
	                                                vsp = jump_height * 0.9 ;
	                                                jump_action = 1 ;
	                                                hsp = max_speed * path_direction ;
	                                                }
	                                }
	                            }
	                        }
	                    }
	        }
	}


	/// Check if enemy reached the next point
	if x <= path_get_point_x(argument0, path_point+1) && path_get_point_x(argument0, path_point+1) <= x + hsp*path_direction && path_get_point_y(argument0, path_point+1)== y - sprite_yoffset - (oGrid.cell_height/2 - sprite_height)
	    {
	    path_point = path_point + 1 ;
	    action = 0 ;
	    jump_action = 0 ;
	        if path_point == number_of_points -1  /// Check if it is the last point of the path
	            {	
				x=argument1.x; // Set guy to center of grid
	            hsp = 0;
	            vsp = 0;
	            path_delete (argument0);
	            path_point = 0 ;
	            }
	    }



}
