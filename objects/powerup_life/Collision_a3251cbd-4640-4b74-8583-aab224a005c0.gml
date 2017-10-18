with obj_referee {
	p2_lives += sign(p2_lives);
	p2_lives = min(p2_lives,5);
}
audio_play_sound(snd_powerup,4,0);
instance_destroy();