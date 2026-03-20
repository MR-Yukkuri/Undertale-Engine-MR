///@arg x x座標
///@arg y y座標
///@arg length 長さ
///@arg angle 角度
///@arg follow ターゲットに追従するか
///@arg follow_target 追従するターゲット
///@desc 紫ソウルの線を作成します。
function Battle_AddPurpleLine(_x,_y,_length=110,_angle=0,_follow=false,_follow_target=battle_board) {
	var line = instance_create_depth(_x,_y,0,battle_pline)
	with(line) {
		image_xscale = _length/2
		image_yscale = 1
		image_angle = _angle
		follow = _follow
		follow_target = _follow_target
	}
	return line
}