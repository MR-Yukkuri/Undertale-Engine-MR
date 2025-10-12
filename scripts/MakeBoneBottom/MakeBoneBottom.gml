///@arg {real} x
///@arg {real} length 長さ
///@desc 枠の下から生えた骨を作成します。
function MakeBoneBottom(x,length,hspeed=0,vspeed=0,rot=0,color=COLOR.WHITE,out=false,head=false,auto_destroy=true,duration=-1,sin_size=0,sin_speed=0.1,use_cos=false,sin_offset=0,follow=false,follow_target=battle_board){
	var Y
	if follow {
		if follow_target == battle_board {
			Y = Battle_GetTurnInfo(BATTLE_TURN.BOARD_Y,BATTLE_BOARD.Y)
		}
		else {
			Y = follow_target.ystart
		}
	}
	else {
		Y = follow_target.y
	}
	var bone = MakeBone(x,Y+follow_target.down,length,90,hspeed,vspeed,rot,color,out,!head,1,,auto_destroy,duration,sin_size,sin_speed,use_cos,sin_offset,follow,follow_target)
	return bone
}