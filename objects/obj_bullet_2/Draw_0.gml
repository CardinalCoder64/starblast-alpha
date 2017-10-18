switch obj_control.p2_color {
	case color_2.blue: sprite_index = spr_bullet_blue; break;
	case color_2.red: sprite_index = spr_bullet_red; break;
	case color_2.cyan: sprite_index = spr_bullet_cyan; break;
	case color_2.green: sprite_index = spr_bullet_green; break;
	case color_2.pink: sprite_index = spr_bullet_pink; break;
	case color_2.white: sprite_index = spr_bullet_white; break;
}

if !golden {
	draw_self();
} else {
	draw_sprite(spr_goldbullet,0,x,y);
}