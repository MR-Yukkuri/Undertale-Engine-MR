///@arg x
///@arg y
///@arg size
///@arg precision
///@arg angle
///@arg rot
function Battle_CreateBoardExtraRoundrect(){
	var X = argument[0];
	var Y = argument[1];
	var SIZE = argument[2];
	var PRECISION = argument[3];
	var ANGLE = (argument_count > 4) ? argument[4] : 0;
	var ROT = (argument_count > 5) ? argument[5] : 0;
	
	roundrect = instance_create_depth(X,Y,0,battle_board_extra_roundrect);
	roundrect.size = SIZE;
	roundrect.precision = PRECISION;
	roundrect.angle = ANGLE;
	roundrect.rot = ROT;
	
	return roundrect;
}

//创建一个圆角矩形的加框
//Create a Extra-Board that is roundrect