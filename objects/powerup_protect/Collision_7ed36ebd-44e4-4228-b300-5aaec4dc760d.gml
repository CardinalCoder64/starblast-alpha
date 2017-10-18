if !obj_ship_1.protect {
	obj_ship_1.protect = true;
	instance_create_depth(16,0,100,protect_bar);
}
audio_play_sound(snd_powerup,4,0);
instance_destroy();