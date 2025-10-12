///@arg {real} length 長さ
///@arg pause 骨が出るまでの時間
///@arg duration 骨が出ている時間
///@arg color 色
///@arg bone_space 骨同士の間隔
///@arg follow ターゲットに追従するか
///@arg follow_target 追従するターゲット
///@desc 右から骨の壁を生やします。
function MakeBoneWallRight(_length,pause=30,duration=30,_color=COLOR.WHITE,_bone_space=12,_follow=false,_follow_target=battle_board){
	var alart = instance_create_depth(0,0,0,battle_bonewall_alart)
	alart.alarm[0] = pause
	alart.length = _length
	alart.alarm[1] = pause+duration
	alart.color = _color
	alart.dir = DIR.RIGHT
	alart.follow = _follow
	alart.follow_target = _follow_target
	var X,Y
	if _follow {
		if _follow_target == battle_board {
			X = Battle_GetTurnInfo(BATTLE_TURN.BOARD_X,BATTLE_BOARD.X)
			Y = Battle_GetTurnInfo(BATTLE_TURN.BOARD_X,BATTLE_BOARD.Y)
		}
		else {
			X = _follow_target.xstart
			Y = _follow_target.ystart
		}
	}
	else {
		X = _follow_target.x
		Y = _follow_target.x
	}
	alart.position = [
		[X+_follow_target.right-_length+1,Y-_follow_target.up+1],
		[X+_follow_target.right-2,Y+_follow_target.down-2]
	]
	alart.space = _bone_space
}