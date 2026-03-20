///@arg x x座標
///@arg y y座標
///@arg radius 半径
///@arg follow ターゲットに追従するか
///@arg follow_target 追従するターゲット
function Battle_AddPurpleCircle(_x,_y,_radius,_follow = false,_follow_target = battle_board) {
	var circ = instance_create_depth(_x,_y,0,battle_pcircle)
	with(circ) {
		radius = _radius
		follow = _follow
		follow_target = _follow_target
	}
	return circ
}
