//Save high score
if !gamepad_is_connected(0) {
	var next1 = keyboard_check_pressed(vk_space);
} else {
	var next1 = gamepad_button_check_pressed(0,gp_start);
}

if !gamepad_is_connected(1) {
	var next2 = keyboard_check_pressed(vk_space);
} else {
	var next2 = gamepad_button_check_pressed(1,gp_start);
}

if next1 || next2 {
	if p1_won || p2_won {
		if count > high_score {
			high_score = count;
			ini_open("High.score");
			ini_write_real("Stats","High Score",high_score);
			ini_close();
		}
		room_restart();
		global.pause = false;
	}
}

if global.pause exit;

//Spawn powerups
var spawn = irandom(150);
var l = layer_get_id("Instances_1");
if spawn == 42 {
	var random_x = 8*irandom_range(5,26);
	var random_y = 8*irandom_range(4,27);
	var powerup = choose(0,1,2,3,4);
	switch powerup {
		case 0:
			if !instance_exists(powerup_death){
				instance_create_layer(random_x,random_y,l,powerup_death);
			}
		break;
		case 1:
			if !instance_exists(powerup_life) {
				instance_create_layer(random_x,random_y,l,powerup_life);
			}
		break;
		case 2:
			if !instance_exists(powerup_trishot) {
				instance_create_layer(random_x,random_y,l,powerup_trishot);
			}
		break;
		case 3:
			if !instance_exists(powerup_protect) {
				instance_create_layer(random_x,random_y,l,powerup_protect);
			}
		break;
		case 4:
			if !instance_exists(powerup_ammo) {
				instance_create_layer(random_x,random_y,l,powerup_ammo);
			}
		break;
	}
}