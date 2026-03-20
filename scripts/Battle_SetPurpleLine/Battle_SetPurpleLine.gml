///@arg count 線の数
///@arg vertical 縦線にするかどうか
///@arg clear 既存の線を削除するか
///@arg follow ターゲットに追従するか
///@arg follow_target 追従するターゲット
///@desc 紫ソウルの線を均等に配置します。
function Battle_SetPurpleLine(_count,_dir=0,_clear=false,_follow=false,_follow_target=battle_board) {
	if _clear {
		instance_destroy(battle_pline)
		instance_destroy(battle_pcircle)
	}
	if !instance_exists(battle_board)
		return noone
	var is_vertical = (_dir == 1 || _dir == "vertical")
	if is_vertical {
		var west = battle_board.x-battle_board.left
		var east = battle_board.x+battle_board.right
		var north = battle_board.y-battle_board.up+15
		var south = battle_board.y+battle_board.down-15
	}
	else {
		var west = battle_board.x-battle_board.left+15
		var east = battle_board.x+battle_board.right-15
		var north = battle_board.y-battle_board.up
		var south = battle_board.y+battle_board.down
	}
	
	var lines = []
	
	if is_vertical {
		var width = east-west
		var length = south-north
		var cy = (north+south)/2
		for (var i=1;i<=_count;i++) {
			var cx = west+(width*i/(_count+1))
			array_push(lines,Battle_AddPurpleLine(cx,cy,length,90,_follow,_follow_target))
		}
	} else {
		var width = east-west
		var height = south-north
		var cx = (west+east)/2
		for (var i=1;i<=_count;i++) {
			var cy = north+(height*i/(_count+1))
			array_push(lines,Battle_AddPurpleLine(cx,cy,width,0,_follow,_follow_target))
		}
	}
	
	return lines
}
