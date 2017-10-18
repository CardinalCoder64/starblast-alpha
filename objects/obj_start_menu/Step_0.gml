if !gamepad_is_connected(0) {
	var next1 = keyboard_check_pressed(vk_space);
} else {
	var next1 = gamepad_button_check_pressed(0,gp_start);
}

if !gamepad_is_connected(1) {
	var next2 = keyboard_check_pressed(vk_space);
} else {
	var next2 = gamepad_button_check_pressed(1,gp_start);
}

if next1 || next2 {
	if audio_is_playing(bgm_theme_song) audio_stop_sound(bgm_theme_song);
	if gamepad_is_connected(1) global.p2_is_playing = true;
	room_goto_next();
}