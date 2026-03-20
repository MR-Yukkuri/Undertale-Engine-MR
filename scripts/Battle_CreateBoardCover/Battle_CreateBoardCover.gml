///@arg x
///@arg y
///@arg up
///@arg down
///@arg left
///@arg right
///@arg angle
///@arg *rotate
function Battle_CreateBoardCover(){
	var X = argument[0];
	var Y = argument[1];
	var UP = argument[2];
	var DOWN = argument[3];
	var LEFT = argument[4];
	var RIGHT = argument[5];
	var ANGLE = argument[6];
	var ROT = 0;
	if(argument_count >= 8){
		ROT = argument[7];
	}
	
	cover = instance_create_depth(X,Y,0,battle_board_cover);
	cover.left = LEFT;
	cover.right = RIGHT;
	cover.up = UP;
	cover.down = DOWN;
	cover.angle = ANGLE;
	cover.rotate = ROT;
	
	return cover;
}
