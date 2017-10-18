mspd = 8;
acc = 1;
vspd = 0;
golden = false;
trishot = false;
protect = false;
bullet_delay = 6;
image_xscale = -1;
y = obj_ship_1.y;
alarm[0] = round(random_range(bullet_delay*2,bullet_delay*6));

instance_create_depth(x,y,depth,obj_shield_2);