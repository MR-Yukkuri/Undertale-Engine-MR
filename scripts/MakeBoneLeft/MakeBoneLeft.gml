///@arg {real} y
///@arg {real} length 長さ
///@desc 枠の左から生えた骨を作成します。
function MakeBoneLeft(y,length,hspeed=0,vspeed=0,rot=0,color=COLOR.WHITE,out=false,head=false,auto_destroy=true,duration=-1,sin_size=0,sin_speed=0.1,use_cos=false,sin_offset=0,follow=false,follow_target=battle_board){
	var X
	if follow {
		if follow_target == battle_board {
			X = Battle_GetTurnInfo(BATTLE_TURN.BOARD_X,BATTLE_BOARD.X)
		}
		else {
			X = follow_target.xstart
		}
	}
	else {
		X = follow_target.x
	}
	var bone = MakeBone(X-follow_target.left,y,length,0,hspeed,vspeed,rot,color,out,!head,1,,auto_destroy,duration,sin_size,sin_speed,use_cos,sin_offset,follow,follow_target)
	return bone
}