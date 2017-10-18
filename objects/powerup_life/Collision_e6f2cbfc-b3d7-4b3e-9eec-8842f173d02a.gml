with obj_referee {
	p1_lives += sign(p1_lives);
	p1_lives = min(p1_lives,5);
}
audio_play_sound(snd_powerup,4,0);
instance_destroy();