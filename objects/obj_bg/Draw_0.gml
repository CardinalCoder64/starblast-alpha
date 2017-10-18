draw_sprite_tiled(spr_bg,0,bg_x,0);

if global.pause exit;

hspd += mspd;
if hspd <= -1 {
	bg_x -= 1;
	hspd = 0;
}