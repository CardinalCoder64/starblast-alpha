size = clamp(size,-1,5);

switch size {
	case -1: instance_destroy(); break;
	case 0: 
		sprite_index = spr_p1_bar0;
	break;
	case 1: sprite_index = spr_p1_bar1; break;
	case 2: 
		sprite_index = spr_p1_bar2;
	break;
	case 3: sprite_index = spr_p1_bar3; break;
	case 4: 
		sprite_index = spr_p1_bar4;
	break;
	case 5: sprite_index = spr_p1_bar5; break;
}

x = obj_ship_1.x+15;
y = obj_ship_1.y;

with instance_place(x+1,y,obj_ball) {
	if hspd < 0 {
		hspd *= -1;
		if obj_ship_1.vspd < 0 {
			vspd = random_range(-max_speed-2,-1);
		} else {
			if obj_ship_1.vspd != 0 {
				vspd = random_range(1,max_speed+2);
			} else {
				vspd = random_range(-max_speed+1,max_speed-1);
			}
		}
		audio_sound_pitch(snd_bounce,1);
		audio_play_sound(snd_bounce,1,0);
		obj_referee.p1_bucket += other.bullet_add;
		obj_referee.p1_bucket = min(obj_referee.p1_bucket,6);
		obj_referee.count++;
	}
}

if bbox_top < 1 || bbox_bottom > room_height-2 {
	obj_ship_1.vspd = 0;
}