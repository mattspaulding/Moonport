/// @desc Control Menu
//Item ease in
menu_x += (menu_x_target - menu_x) / menu_speed;

//Keyboard controls
if (menu_control)
{
	if (gamepad_button_check_pressed(0,gp_padu) || keyboard_check_pressed(vk_up))
	{
		menu_cursor++;
		if (menu_cursor >= menu_items) menu_cursor = 0;
	}

	if (gamepad_button_check_pressed(0,gp_padd) || keyboard_check_pressed(vk_down))
	{
		menu_cursor--;
		if (menu_cursor < 0) menu_cursor = menu_items-1;
	}

	if (gamepad_button_check_pressed(0,gp_face1)||keyboard_check_pressed(vk_enter))
	{
		menu_x_target = -100;
		menu_committed = menu_cursor;
		ScreenShake(4,30);
		menu_control = false;
		audio_play_sound(snUiSelect0,10,false);
	}
	
	var mouse_y_gui = device_mouse_y_to_gui(0);
	if (mouse_y_gui < menu_y) && (mouse_y_gui > menu_top) 
	{
		menu_cursor = (menu_y - mouse_y_gui) div (menu_itemheight * 1.5);
		
		if (mouse_check_button_pressed(mb_left))
		{
			menu_x_target = -100;
			menu_committed = menu_cursor;
			ScreenShake(4,30);
			menu_control = false;
			audio_play_sound(snUiSelect0,10,false);	
		}
		
	}
	
}

if (menu_x < 0) && (menu_committed != -1) && (!global.isPlayerSelectScreen)
{
	switch (menu_committed)
	{
		case 2: 
		{
			instance_create_layer(x, y - 20, "PlayerSelect", oPlayerSelectScreen);
			//SlideTransition(TRANS_MODE.NEXT); break;
			break;
		}
		case 1: 
		{
			if (!file_exists(SAVEFILE))
			{
				SlideTransition(TRANS_MODE.NEXT); 
			}
			else
			{
				var file = file_text_open_read(SAVEFILE);
				var target = file_text_read_real(file);
				global.kills = file_text_read_real(file);
				global.hasgun = file_text_read_real(file);
				file_text_close(file);
				SlideTransition(TRANS_MODE.GOTO,target);
			}
		}
		break;
		case 0: game_end(); break;
	}
}