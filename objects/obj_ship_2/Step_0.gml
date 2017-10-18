if !gamepad_is_connected(1) {
	var play = keyboard_check_pressed(vk_enter);
} else {
	var play = gamepad_button_check_pressed(1,gp_start);
}

if play {
	global.p2_is_playing = true;
	mspd = 8;
}

if global.pause || obj_referee.countdown != 0 exit;

if global.p2_is_playing {
	if !gamepad_is_connected(1) {
		var y_ctrl = keyboard_check(vk_down)-keyboard_check(vk_up);
		var shoot = keyboard_check_pressed(vk_left);
	} else {
		var y_ctrl = gamepad_button_check(1,gp_padd)-gamepad_button_check(1,gp_padu);
		var shoot = gamepad_button_check_pressed(1,gp_face1);
	}
	if y_ctrl != 0 {
		vspd = approach(vspd,y_ctrl*mspd,acc);
	} else vspd = 0;
	y += vspd;
} else {
	if instance_exists(obj_ball) {
		if alarm[0] == 1 {
			var shoot = true;
		} else {
			var shoot = false;
		}
		if instance_exists(obj_shield_2) {
			y = approach(y,obj_ball.y,mspd);
		} else {
			y = approach(y,obj_ship_1.y,mspd);
		}
	} else {
		var shoot = false;
		alarm[1] = -1;
	}
}

if global.infinite obj_referee.p2_bucket = 6;

if shoot && alarm[2] == -1 {
	if obj_referee.pu2_bucket > 0 {
		obj_referee.pu2_bucket--;
		with instance_create_depth(x-4,y,depth,obj_bullet_2) {
			audio_play_sound(snd_shoot,0,0);
		}
		if trishot {
			instance_create_depth(x-4,y-14,depth,obj_bullet_2);
			instance_create_depth(x-4,y+14,depth,obj_bullet_2);
		}
		if obj_referee.pu2_bucket == 0 {
			golden = false;
			trishot = false;
		}
	} else {
		if obj_referee.p2_bucket > 0 {
			if !global.infinite obj_referee.p2_bucket--;
			alarm[2] = bullet_delay;
			with instance_create_depth(x-4,y,depth,obj_bullet_2) {
				audio_play_sound(snd_shoot,0,0);
			}
		}
	}
}

if instance_exists(obj_shield_colbox2) {
	var shield_cent =  obj_shield_colbox2.sprite_height/2;
	y = clamp(y,shield_cent,room_height-shield_cent);
} else {
	var ship_cent = sprite_height/2;
	y = clamp(y,ship_cent,room_height-ship_cent);
}