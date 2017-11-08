with obj_referee {
	if count > high_score {
		high_score = count;
		/*ini_open("High.score");
		ini_write_real("Stats","High Score",high_score);
		ini_close();*/
	}
	count = 0;
}