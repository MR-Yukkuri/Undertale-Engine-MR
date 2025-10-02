///@arg {real} x
///@arg {real} length 長さ
///@desc 枠の下から生えた骨を作成します。
function MakeBoneBottom(x,length,hspeed=0,vspeed=0,rot=0,color=COLOR.WHITE,out=false,head=false,auto_destroy=true,duration=-1,sin_size=0,sin_speed=0.1,use_cos=false,sin_offset=0,follow=false,follow_target=battle_board){
	var bone = MakeBone(x,battle_board.y+battle_board.down,length,90,hspeed,vspeed,rot,color,out,!head,1,,auto_destroy,duration,sin_size,sin_speed,use_cos,sin_offset,follow,follow_target)
	return bone
}