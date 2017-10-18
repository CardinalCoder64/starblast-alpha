if global.pause {
	visible = false;
	exit;
} else {
	visible = true;
}

x+=hspd;

with instance_place(x+sign(hspd),y,obj_shield_colbox1) {
	if !other.golden {
		if instance_exists(obj_shield_colbox2) {
			obj_shield_colbox2.size += 1;
		} else {
			instance_create_depth(obj_ship_2.x-15,obj_ship_2.y,depth,obj_shield_2);
			obj_shield_colbox2.size = 0;
		}
		size -= 1;
	} else {
		if !instance_exists(obj_shield_2) {
			instance_create_depth(obj_ship_2.x-15,obj_ship_2.y,depth,obj_shield_2);
		}
		obj_shield_colbox2.size = 5;
		size = -1;
		audio_play_sound(snd_break,3,0);
	}
	with other instance_destroy();
}

if x < 0 instance_destroy();