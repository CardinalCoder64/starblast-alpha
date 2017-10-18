switch obj_control.p2_color {
	case color_2.blue: sprite_index = spr_ship_blue; break;
	case color_2.red: sprite_index = spr_ship_red; break;
	case color_2.cyan: sprite_index = spr_ship_cyan; break;
	case color_2.green: sprite_index = spr_ship_green; break;
	case color_2.pink: sprite_index = spr_ship_pink; break;
	case color_2.white: sprite_index = spr_ship_white; break;
}

if !golden {
	draw_self();
} else {
	draw_sprite_ext(spr_ship_gold,0,x,y,-1,1,0,c_white,1);
}

if trishot {
	draw_sprite(spr_trishot_right,0,x,y);
}