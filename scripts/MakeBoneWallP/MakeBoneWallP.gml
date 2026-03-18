///@arg {real} dir 方向。90の倍数しか指定できない。
///@arg {real} length 長さ
///@arg pause 骨が出るまでの時間
///@arg duration 骨が出ている時間
///@arg color 色
///@arg bone_space 骨同士の間隔
///@arg follow ターゲットに追従するか
///@arg follow_target 追従するターゲット
///@desc 骨の壁を生やします。
function MakeBoneWallP(dir,length,pause=30,duration=30,color=COLOR.WHITE,bone_space=12,follow=false,follow_target=battle_board){
	dir %= 360
	if dir == DIR.LEFT {
		MakeBoneWallLeftP(length,pause,duration,color,bone_space,follow,follow_target)
	}
	if dir == DIR.RIGHT {
		MakeBoneWallRightP(length,pause,duration,color,bone_space,follow,follow_target)
	}
	if dir == DIR.UP {
		MakeBoneWallTopP(length,pause,duration,color,bone_space,follow,follow_target)
	}
	if dir == DIR.DOWN {
		MakeBoneWallBottomP(length,pause,duration,color,bone_space,follow,follow_target)
	}
}