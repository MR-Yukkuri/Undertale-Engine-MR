///@arg dir 槍の向き 0,90,180,270のいずれか
///@arg speed 槍の速度
///@arg distance ソウルとの距離
///@arg target_shield 防ぐことができる盾のID(配列対応)
///@arg assist 最もソウルに近い際に色が変わるか（盾が一つの場合のみ）
///@arg mode trueで黄色になる
///@arg follow_soul ソウルに追従するか
///@desc アンダインの槍を作成します。
function MakeArrow(_dir,_speed=4,_distance=320,_target_shield=[0],_assist=true,_mode=0,_follow_soul=true){
	var arrow = instance_create_depth(0,0,0,battle_bullet_arrow)
	with(arrow) {
		x = battle_soul.x+lengthdir_x(_distance,_dir)
		y = battle_soul.y+lengthdir_y(_distance,_dir)
		cx = battle_soul.x
		cy = battle_soul.y
		dir = point_direction(x,y,battle_soul.x,battle_soul.y)
		direction = dir
		image_angle = _mode ? dir+180 : dir
		spd = _speed
		assist = _assist
		mode = _mode
		follow_soul = _follow_soul
		if !is_array(_target_shield) {
			_target_shield = [_target_shield]
		}
		target_shield = _target_shield
		array_sort(target_shield,true)
		if instance_exists(battle_soul_green) && battle_soul_green.shield_amount==1{
			sprite_index = mode ? spr_arrow_yellow : spr[0]
		}
		else if array_length(target_shield) == 1{
			sprite_index = mode ? spr_yellow[target_shield[0]] : spr[target_shield[0]]
		}
		else {
			var key = ""
			for(var i=0;i<array_length(target_shield);i++) {
				 if (i > 0)
					key += ","
				key+=string(target_shield[i])
			}
			if ds_map_exists(mix_spr,key) {
				sprite_index = mode ? mix_spr[?key][1] : mix_spr[?key][0]
			}
			else {
				sprite_index = mode ? spr_arrow_yellow : spr_arrow_blue
				auto_mix = true
				
			}
		}
	}
	return arrow
}