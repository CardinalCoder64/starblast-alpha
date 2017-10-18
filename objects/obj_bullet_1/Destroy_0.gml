if instance_number(obj_bullet_1) == 1 {
	if !instance_exists(obj_shield_colbox1) && obj_referee.p1_bucket == 0 {
		obj_referee.p2_won = true;
	}
}