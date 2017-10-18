if image_index == 2 {
	if hspd == 0 hspd = choose(-max_speed,max_speed);
	if vspd == 0 vspd = random_range(-max_speed+2,max_speed-2);
}

if obj_referee.countdown != 0 exit;

if global.pause {
	visible = false;
	exit;
} else {
	visible = true;
}

if bbox_top <= 0 ^^ bbox_bottom >= room_height {
	vspd *= -1;
	audio_sound_pitch(snd_bounce,1);
	audio_play_sound(snd_bounce,1,0);
}

if bbox_left < 2 ^^ bbox_right > room_width-2 {
	if bbox_left < 2 {
		with obj_referee {
			p1_lives--;
			if instance_exists(obj_shield_colbox1) {
				p1_bucket = 0;
				pu1_bucket = 0;
				obj_ship_1.golden = false;
				obj_ship_1.trishot = false;
			} else {
				if p1_bucket == 0 p2_won = true;
			}
		}
	}
	if bbox_right > room_width-2 {
		with obj_referee {
			p2_lives--;
			if instance_exists(obj_shield_colbox2) {
				p2_bucket = 0;
				pu2_bucket = 0;
				obj_ship_2.golden = false;
				obj_ship_2.trishot = false;
			} else {
				if p2_bucket == 0 p1_won = true;
			}
		}
	}
	instance_create_depth(120,120,other.depth,obj_ball);
	obj_referee.count = 0;
	audio_play_sound(snd_hurt,1,0);
	instance_create_depth(x,y,depth,obj_ball_animate);
	instance_destroy();
}

x+=round(hspd);
y+=round(vspd);

hspd = clamp(hspd,-6,6);