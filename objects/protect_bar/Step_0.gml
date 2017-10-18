with instance_place(x,y,obj_ball) {
	if sign(hspd) != other.image_xscale {
		hspd *= -1;
		vspd = random_range(-max_speed,max_speed);
		audio_sound_pitch(snd_bounce,1);
		audio_play_sound(snd_bounce,1,0);
		if other.x < room_width/2 {
			obj_ship_1.protect = false;
		} else {
			obj_ship_2.protect = false;
		}
		with other instance_destroy();
	}
}