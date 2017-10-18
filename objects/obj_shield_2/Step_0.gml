switch obj_control.p2_color {
	case color_2.blue: sprite_index = spr_bar_blue2; break;
	case color_2.red: sprite_index = spr_bar_red2; break;
	case color_2.cyan: sprite_index = spr_bar_cyan2; break;
	case color_2.green: sprite_index = spr_bar_green2; break;
	case color_2.pink: sprite_index = spr_bar_pink2; break;
	case color_2.white: sprite_index = spr_bar_white2; break;
}

if instance_exists(obj_shield_colbox2) {
	image_index = obj_shield_colbox2.size;
	x = obj_shield_colbox2.x;
	y = obj_shield_colbox2.y;
}