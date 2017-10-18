if !obj_ship_2.protect {
	obj_ship_2.protect = true;
	with instance_create_depth(room_width-16,0,100,protect_bar) {
		image_xscale = -1;
	}
}
audio_play_sound(snd_powerup,4,0);
instance_destroy();