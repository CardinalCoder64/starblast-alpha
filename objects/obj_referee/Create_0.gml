randomize();
p1_lives = 3;
p1_bucket = 3;
pu1_bucket = 0;
p1_won = false;
p2_lives = 3;
p2_bucket = 3;
pu2_bucket = 0;
p2_won = false;
count = 0;
countdown = 3;
p2_is_playing = false;
a = 0;
alarm[0] = 30;
alarm[11] = 10;

if file_exists("High.score") {
	ini_open("High.score");
	high_score = ini_read_real("Stats","High Score",0);
	ini_close();
} else {
	high_score = 0;
}