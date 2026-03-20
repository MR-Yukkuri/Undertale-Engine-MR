///@arg vertex [[x1,y1],[x2,y2],[x3,y3]...]
///@arg follow ターゲットに追従するか
///@arg follow_target 追従するターゲット
///@desc 頂点を指定して紫ソウルの線を作成します。
function Battle_AddPurpleVertex(_vertex,_follow=false,_follow_target=battle_board) {
	if array_length(_vertex) < 2
		return noone
	
	var lines = array_create(0)
	for (var i=0;i<array_length(_vertex)-1;i++) {
		var x1 = _vertex[i][0]
		var y1 = _vertex[i][1]
		var x2 = _vertex[i+1][0]
		var y2 = _vertex[i+1][1]
		var dist = point_distance(x1,y1,x2,y2)
		var angle = point_direction(x1,y1,x2,y2)
		var line = Battle_AddPurpleLine((x1 + x2) / 2,(y1 + y2) / 2,dist + 2,angle,_follow,_follow_target)
		array_push(lines,line)
	}
	return lines
}
