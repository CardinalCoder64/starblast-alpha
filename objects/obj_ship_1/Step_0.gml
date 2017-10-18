if global.pause || obj_referee.countdown != 0 exit;

if !gamepad_is_connected(0) {
	var y_ctrl = keyboard_check(ord("S"))-keyboard_check(ord("W"));
	var shoot = keyboard_check_pressed(ord("D"));
} else {
	var y_ctrl = gamepad_button_check(0,gp_padd)-gamepad_button_check(0,gp_padu);
	var shoot = gamepad_button_check_pressed(0,gp_face1);
}

if shoot && alarm[1] == -1 {
	if obj_referee.pu1_bucket > 0 {
		obj_referee.pu1_bucket--;
		with instance_create_depth(x+4,y,depth,obj_bullet_1) {
			audio_play_sound(snd_shoot,0,0);
		}
		if trishot {
			instance_create_depth(x+4,y-14,depth,obj_bullet_1);
			instance_create_depth(x+4,y+14,depth,obj_bullet_1);
		}
		if obj_referee.pu1_bucket == 0 {
			golden = false;
			trishot = false;
		}
	} else {
		if obj_referee.p1_bucket > 0 {
			if !global.infinite obj_referee.p1_bucket--;
			alarm[1] = bullet_delay;
			with instance_create_depth(x+4,y,depth,obj_bullet_1) {
				audio_play_sound(snd_shoot,0,0);
			}
		}
	}
}

if y_ctrl != 0 {
	vspd = approach(vspd,y_ctrl*mspd,acc);
} else vspd = 0;
y += vspd;

if instance_exists(obj_shield_colbox1) {
	var shield_cent = obj_shield_colbox1.sprite_height/2;
	y = clamp(y,shield_cent,room_height-shield_cent);
} else {
	var ship_cent = sprite_height/2;
	y = clamp(y,ship_cent,room_height-ship_cent);
}