if super != pwr.norm {
	with obj_ship_2 {
		switch other.super {
			case pwr.gold: 
				trishot = false;
				golden = true; 
				obj_referee.pu2_bucket++;
			break;
			case pwr.tri: 
				trishot = true; 
				golden = false;
				obj_referee.pu2_bucket += 3;
			break;
			case pwr.life: 
				with obj_referee {
					p2_lives += sign(p2_lives);
					p2_lives = min(p2_lives,5);
				}
			break;
			case pwr.pro: 
				protect = true;
				with instance_create_depth(room_width-16,0,100,protect_bar) {
					image_xscale = -1;
				}
			break;
			case pwr.ammo: 
				obj_referee.p2_bucket += 3; 
				obj_referee.p2_bucket = min(obj_referee.p2_bucket,6);
			break;
		}
	}
	image_blend = c_white;
	super = pwr.norm;
	audio_play_sound(snd_powerup,4,0);
	with other instance_destroy();
	instance_create_depth(x,y,depth,obj_explosion);
	audio_play_sound(snd_break,3,0);
	instance_create_depth(120,120,other.depth,obj_ball);
	instance_destroy();
}