///@arg {real} length 長さ
///@arg pause 骨が出るまでの時間
///@arg duration 骨が出ている時間
///@arg color 色
///@arg bone_space 骨同士の間隔
///@arg follow ターゲットに追従するか
///@arg follow_target 追従するターゲット
///@desc 左から骨の壁を生やします。
function MakeBoneWallLeft(_length,pause=30,duration=30,_color=COLOR.WHITE,_bone_space=12,_follow=false,_follow_target=battle_board){
	var alart = instance_create_depth(0,0,0,battle_bonewall_alart)
	alart.alarm[0] = pause
	alart.length = _length
	alart.alarm[1] = pause+duration
	alart.color = _color
	alart.dir = DIR.LEFT
	alart.position = [
		[battle_board.x-battle_board.left+1,battle_board.y-battle_board.up+1],
		[battle_board.x-battle_board.left+_length-2,battle_board.y+battle_board.down-2]
	]
	alart.space = _bone_space
	alart.follow = _follow
	alart.follow = _follow_target
}