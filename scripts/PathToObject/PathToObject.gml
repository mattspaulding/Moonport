/// @desc PathToObject(targetobj)
/// @arg Target sets target obj to path to.
function PathToObject() {

	targetobj = argument[0];

	     hsp = 0;
	     vsp = 0;
	     if path_exists(path_building) {
	         path_delete (path_building);
	     }
	     path_point = 0 ;
	     action = 0 ;
	     jump_action = 0 ;
	 

	    scr_fill_the_grid(floor(x/oGrid.cell_width), floor(y/oGrid.cell_height), floor(targetobj.x/oGrid.cell_width), floor((targetobj.y-16)/oGrid.cell_height));



}
