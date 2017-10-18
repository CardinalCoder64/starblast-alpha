obj_referee.p2_bucket += 3;
obj_referee.p2_bucket = min(obj_referee.p2_bucket,6);
audio_play_sound(snd_powerup,4,0);
instance_destroy();