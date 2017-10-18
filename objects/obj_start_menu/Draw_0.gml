var x_center = room_width/2;
var y_center = room_height/2;
var gray = make_color_rgb(31,31,31);
//draw_sprite(spr_grid,0,0,0);
draw_sprite(spr_title,0,x_center,y_center-32);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(fnt_default);
draw_set_color(c_white);
draw_set_alpha(a);
if !gamepad_is_connected(0) {
	draw_text(x_center,y_center+32,"PRESS [SPACE]");
} else {
	draw_text(x_center,y_center+32,"PRESS START");
}
draw_set_alpha(1);

if global.mute draw_sprite(spr_mute,0,room_width-8,room_height-8);

draw_set_color(gray);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
if !gamepad_is_connected(0) {
	draw_text(0,room_height-8,"SPACE=PAUSE");
} else {
	draw_text(0,room_height-8,"START=PAUSE");
}
draw_text(0,room_height,"(C) DEAVEN BINION 2017");
draw_set_halign(fa_right);
draw_set_valign(fa_top);
draw_text(room_width,0,"V1.6.5");

var blue = make_color_rgb(0,0,252);
var red = make_color_rgb(172,16,0);
var cyan = make_color_rgb(0,232,228);
var green = make_color_rgb(0,184,0);
var pink = make_color_rgb(220,0,212);
var white = make_color_rgb(255,255,255);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

if obj_control.p1_draw_text {
	switch obj_control.p1_color {
		case color_1.blue: draw_set_color(blue); break;
		case color_1.red: draw_set_color(red); break;
		case color_1.cyan: draw_set_color(cyan); break;
		case color_1.green: draw_set_color(green); break;
		case color_1.pink: draw_set_color(pink); break;
		case color_1.white: draw_set_color(white); break;
	}
	draw_text(0,0,"PLAYER 1 COLOR CHANGED!");
}

if obj_control.p2_draw_text {
	switch obj_control.p2_color {
		case color_2.blue: draw_set_color(blue); break;
		case color_2.red: draw_set_color(red); break;
		case color_2.cyan: draw_set_color(cyan); break;
		case color_2.green: draw_set_color(green); break;
		case color_2.pink: draw_set_color(pink); break;
		case color_2.white: draw_set_color(white); break;
	}
	draw_text(0,8,"PLAYER 2 COLOR CHANGED!");
}

if obj_control.inf_draw_text {
	draw_set_color(c_white);
	draw_text(0,0,"INFINITE AMMO AQUIRED!");
}