switch obj_control.p1_color {
	case color_1.blue: sprite_index = spr_bullet_blue; break;
	case color_1.red: sprite_index = spr_bullet_red; break;
	case color_1.cyan: sprite_index = spr_bullet_cyan; break;
	case color_1.green: sprite_index = spr_bullet_green; break;
	case color_1.pink: sprite_index = spr_bullet_pink; break;
	case color_1.white: sprite_index = spr_bullet_white; break;
}

if !golden {
	draw_self();
} else {
	draw_sprite(spr_goldbullet,0,x,y);
}