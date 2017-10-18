switch obj_control.p1_color {
	case color_1.blue: sprite_index = spr_bar_blue1; break;
	case color_1.red: sprite_index = spr_bar_red1; break;
	case color_1.cyan: sprite_index = spr_bar_cyan1; break;
	case color_1.green: sprite_index = spr_bar_green1; break;
	case color_1.pink: sprite_index = spr_bar_pink1; break;
	case color_1.white: sprite_index = spr_bar_white1; break;
}

if instance_exists(obj_shield_colbox1) {
	image_index = obj_shield_colbox1.size;
	x = obj_shield_colbox1.x;
	y = obj_shield_colbox1.y;
}