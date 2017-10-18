var x_center = room_width/2;
var y_center = room_height/2;
var blue = make_color_rgb(0,0,252);
var red = make_color_rgb(172,16,0);
var cyan = make_color_rgb(0,232,228);
var green = make_color_rgb(0,184,0);
var pink = make_color_rgb(220,0,212);
var white = make_color_rgb(255,255,255);
var yellow = make_color_rgb(252,184,0);
draw_set_font(fnt_default);

//Draw grid
//draw_sprite(spr_grid,0,0,0);

//Score
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text(x_center-40,8,"SCORE: "+string(count));

//Set player life colors
switch obj_control.p1_color {
	case color_1.blue:
		draw_life1 = spr_life_blue; 
		draw_bullet1 = spr_bullet_blue;
	break;
	case color_1.red: 
		draw_life1 = spr_life_red; 
		draw_bullet1 = spr_bullet_red;
	break;
	case color_1.cyan: 
		draw_life1 = spr_life_cyan; 
		draw_bullet1 = spr_bullet_cyan;
	break;
	case color_1.green: 
		draw_life1 = spr_life_green; 
		draw_bullet1 = spr_bullet_green;
	break;
	case color_1.pink: 
		draw_life1 = spr_life_pink; 
		draw_bullet1 = spr_bullet_pink;
	break;
	case color_1.white: 
		draw_life1 = spr_life_white; 
		draw_bullet1 = spr_bullet_white;
	break;
}

switch obj_control.p2_color {
	case color_2.blue:
		draw_life2 = spr_life_blue; 
		draw_bullet2 = spr_bullet_blue;
	break;
	case color_2.red: 
		draw_life2 = spr_life_red;
		draw_bullet2 = spr_bullet_red;
	break;
	case color_2.cyan: 
		draw_life2 = spr_life_cyan; 
		draw_bullet2 = spr_bullet_cyan;
	break;
	case color_2.green: 
		draw_life2 = spr_life_green; 
		draw_bullet2 = spr_bullet_green;
	break;
	case color_2.pink: 
		draw_life2 = spr_life_pink; 
		draw_bullet2 = spr_bullet_pink;
	break;
	case color_2.white: 
		draw_life2 = spr_life_white; 
		draw_bullet2 = spr_bullet_white;
	break;
}

//Player 1 lives
draw_text(0,0,"LIVES:");
for (var i=0; i<p1_lives; i++) {
	draw_sprite(draw_life1,0,(i*8)+48,0);
}

//Player 2 lives
draw_set_halign(fa_right);
draw_text(room_width-40,0,"LIVES:");
for (var i=0; i<p2_lives; i++) {
	draw_sprite(draw_life2,0,(i*8)+(room_width-40),0);
}

switch obj_control.p2_color {
	case color_2.blue: draw_set_color(blue); break;
	case color_2.red: draw_set_color(red); break;
	case color_2.cyan: draw_set_color(cyan); break;
	case color_2.green: draw_set_color(green); break;
	case color_2.pink: draw_set_color(pink); break;
	case color_2.white: draw_set_color(white); break;
}

//P2 bucket (Normal)
draw_set_halign(fa_left);
for(var i=0;i<p2_bucket;i++) {
	draw_sprite_ext(draw_bullet2,0,room_width-3-(i*4),12,1,1,90,c_white,1);
}

//P2 bucket (Power-ups)
for(var i=0;i<pu2_bucket;i++) {
	if obj_ship_2.golden {
		draw_sprite_ext(spr_goldbullet,0,room_width-2,20,1,1,90,c_white,1);
	}
	if obj_ship_2.trishot {
		draw_sprite_ext(spr_bullet_pink,0,room_width-3-(i*4),20,1,1,90,c_white,1);
	}
}

draw_set_alpha(1);

//Winning screens
if p1_lives <= 0 && !p1_won {
	p2_won = true;
}

if p2_won {
	draw_set_halign(fa_center);
	with obj_ball {
		global.pause = false;
		audio_play_sound(snd_win,1,0);
		instance_destroy();
	}
	draw_text(x_center,y_center-24,"PLAYER 2 WINS!");
	draw_set_color(white);
	if count > high_score {
		draw_set_color(yellow);
		draw_text(x_center,y_center,"HIGH SCORE: "+string(count));
	} else {
		draw_text(x_center,y_center,"HIGH SCORE: "+string(high_score));		
	}
	draw_set_color(white);
	draw_set_alpha(a);
	if !gamepad_is_connected(0) {
		draw_text(x_center,y_center+24,"PRESS [SPACE] TO RESTART");
	} else {
		draw_text(x_center,y_center+24,"PRESS START TO RESTART");
	}
	draw_set_alpha(1);
}

switch obj_control.p1_color {
	case color_1.blue: draw_set_color(blue); break;
	case color_1.red: draw_set_color(red); break;
	case color_1.cyan: draw_set_color(cyan); break;
	case color_1.green: draw_set_color(green); break;
	case color_1.pink: draw_set_color(pink); break;
	case color_1.white: draw_set_color(white); break;
}

//P1 bucket (Normal)
draw_set_halign(fa_left);
for(var i=0;i<p1_bucket;i++) {
	draw_sprite_ext(draw_bullet1,0,1+(i*4),12,1,1,90,c_white,1);
}

//P1 bucket (Power-ups)
for(var i=0;i<pu1_bucket;i++) {
	if obj_ship_1.golden {
		draw_sprite_ext(spr_goldbullet,0,2,20,1,1,90,c_white,1);
	}
	if obj_ship_1.trishot {
		draw_sprite_ext(spr_bullet_pink,0,1+(i*4),20,1,1,90,c_white,1);
	}
}
draw_set_alpha(1);

if p2_lives <= 0 && !p2_won {
	p1_won = true;
}

if p1_won {
	draw_set_halign(fa_center);
	with obj_ball {
		global.pause = false;
		audio_play_sound(snd_win,1,0);
		instance_destroy();
	}
	draw_text(x_center,y_center-24,"PLAYER 1 WINS!");
	draw_set_color(white);
	if count > high_score {
		draw_set_color(yellow);
		draw_text(x_center,y_center,"HIGH SCORE: "+string(count));
	} else {
		draw_text(x_center,y_center,"HIGH SCORE: "+string(high_score));		
	}
	draw_set_color(white);
	draw_set_alpha(a);
	if !gamepad_is_connected(1) {
		draw_text(x_center,y_center+24,"PRESS [SPACE] TO RESTART");
	} else {
		draw_text(x_center,y_center+24,"PRESS START TO RESTART");
	}
	draw_set_alpha(1);
}

//Countdown
if countdown != 0 {
	draw_set_halign(fa_left);
	draw_set_color(white);
	draw_text(x_center-8,y_center-48,countdown);
	draw_sprite(spr_controls,0,obj_ship_1.x+28,obj_ship_1.y);
	if global.p2_is_playing draw_sprite(spr_controls_2,0,obj_ship_2.x-28,obj_ship_2.y);
}

if !global.p2_is_playing {
	draw_set_halign(fa_right);
	draw_set_valign(fa_bottom);
	draw_set_color(white);
	draw_set_alpha(a);
	if !gamepad_is_connected(1) {
		draw_text(room_width,room_height,"PLAYER 2 PRESS [ENTER]");
	} else {
		draw_text(room_width,room_height,"PLAYER 2 PRESS START");
	}
	draw_set_alpha(1);
}

if global.pause {
	draw_set_color(c_black);
	draw_set_alpha(.5);
	draw_rectangle(0,0,room_width,room_height,0);
	draw_set_alpha(1);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	draw_text(x_center,y_center-24,"- PAUSED -\n\nF4 = FULLSCREEN\nF5 = RESTART\nESC = QUIT\nM = MUTE");
	draw_set_color(yellow);
	draw_text(x_center,y_center+32,"HIGH SCORE: "+string(high_score));	
	draw_sprite(spr_controls,0,obj_ship_1.x+28,obj_ship_1.y);
	if global.p2_is_playing {
		draw_sprite(spr_controls_2,0,obj_ship_2.x-28,obj_ship_2.y);
	}
}

if global.mute draw_sprite(spr_mute,0,0,room_height-8);