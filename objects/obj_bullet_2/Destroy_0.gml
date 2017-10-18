if instance_number(obj_bullet_2) == 1 {
	if !instance_exists(obj_shield_colbox2) && obj_referee.p2_bucket == 0 {
		obj_referee.p1_won = true;
	}
}