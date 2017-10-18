///***CHEAT CODES***\\\
if global.pause {
	with all {
		for (var i=0;i<11;i++) {
			if alarm[i] > 0 alarm[i]++;
		}
	}
}

if global.mute audio_master_gain(0); else audio_master_gain(1);

if !gamepad_is_connected(0) {
	var pause1 = keyboard_check_pressed(vk_space);
} else {
	var pause1 = gamepad_button_check_pressed(0,gp_start);
}

if !gamepad_is_connected(1) {
	var pause2 = keyboard_check_pressed(vk_space);
} else {
	var pause2 = gamepad_button_check_pressed(1,gp_start);
}

if instance_exists(obj_referee) {
	if !obj_referee.p1_won || !obj_referee.p2_won {
		if pause1 || pause2 {
			if !global.pause {
				global.pause = true;
			} else {
				global.pause = false;
			}
		}
	}
}

color_code();
infinite_code();

if color_code1 < 8 {
	if !gamepad_is_connected(0) {
		if keyboard_check_pressed(code1[color_code1]) {
			color_code1++;
			alarm[0] = 20;
		}
	} else {
		if gamepad_button_check_pressed(0,code1[color_code1]) {
			color_code1++;
			alarm[0] = 20;
		}
	}
}

if color_code2 < 8 {
	if !gamepad_is_connected(1) {
		if keyboard_check_pressed(code2[color_code2]) {
			color_code2++;
			alarm[0] = 20;
		}
	} else {
		if gamepad_button_check_pressed(1,code2[color_code2]) {
			color_code2++;
			alarm[0] = 20;
		}
	}
}

if inf_code < 8 {
	if !gamepad_is_connected(0) {
		if keyboard_check_pressed(code3[inf_code]) {
			inf_code++;
			alarm[0] = 20;
		}
	} else {
		if gamepad_button_check_pressed(0,code3[inf_code]) {
			inf_code++;
			alarm[0] = 20;
		}
	}
}

if !gamepad_is_connected(0) {
	var enter1 = keyboard_check_pressed(vk_enter);
} else {
	var enter1 = gamepad_button_check_pressed(0,gp_face1);
}

if !gamepad_is_connected(1) {
	var enter2 = keyboard_check_pressed(vk_enter);
} else {
	var enter2 = gamepad_button_check_pressed(1,gp_face1);
}

if enter1 || enter2 {
	if color_code1 == 8 {
		color1++;
		p1_draw_text = true;
		alarm[1] = 60;
		audio_play_sound(snd_powerup,0,0);
	}
	if color_code2 == 8 {
		color2++;
		p2_draw_text = true;
		alarm[1] = 60;
		audio_play_sound(snd_powerup,0,0);
	}
	if inf_code == 8 {
		global.infinite = true;
		inf_draw_text = true;
		alarm[1] = 60;
		audio_play_sound(snd_powerup,0,0);
	}
	color_code1 = 0;
	color_code2 = 0;
	inf_code = 0;
}

if color1 > 5 color1 = 0;
switch color1 {
	case 0: p1_color = color_1.blue; break;
	case 1: p1_color = color_1.red; break;
	case 2: p1_color = color_1.cyan; break;
	case 3: p1_color = color_1.green; break;
	case 4: p1_color = color_1.pink; break;
	case 5: p1_color = color_1.white; break;
}

if color2 > 5 color2 = 0;
switch color2 {
	case 0: p2_color = color_2.blue; break;
	case 1: p2_color = color_2.red; break;
	case 2: p2_color = color_2.cyan; break;
	case 3: p2_color = color_2.green; break;
	case 4: p2_color = color_2.pink; break;
	case 5: p2_color = color_2.white; break;
}