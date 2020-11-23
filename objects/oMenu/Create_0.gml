/// @desc GUI/Vars/Menu Setup
#macro SAVEFILE "Save.sav"

gui_height = display_get_gui_height()

menu_x = -100;
menu_y = gui_height - 8;

menu_x_target = 30;
menu_speed = 20; //lower is faster
menu_font = fZorque13;
menu_itemheight = font_get_size(menu_font);
menu_committed = -1;
menu_control = true;

menu[2] = "New Game";
menu[1] = "Continue";
menu[0] = "Quit";

menu_items = array_length_1d(menu);

menu_top = menu_y - ((menu_itemheight * 1.5) * menu_items);

menu_cursor = 2;