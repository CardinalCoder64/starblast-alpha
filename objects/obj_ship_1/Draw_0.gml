switch obj_control.p1_color {
	case color_1.blue: sprite_index = spr_ship_blue; break;
	case color_1.red: sprite_index = spr_ship_red; break;
	case color_1.cyan: sprite_index = spr_ship_cyan; break;
	case color_1.green: sprite_index = spr_ship_green; break;
	case color_1.pink: sprite_index = spr_ship_pink; break;
	case color_1.white: sprite_index = spr_ship_white; break;
}

if !golden {
	draw_self();
} else {
	draw_sprite(spr_ship_gold,0,x,y);
}

if trishot {
	draw_sprite(spr_trishot_left,0,x,y);
}