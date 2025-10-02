///@arg {id.instance} target 適応するオブジェクト
///@arg {string} var_name 適応する変数の名前
///@arg distance 揺れる距離
///@arg speed 揺れる速さ
///@arg random ランダムに揺れるか
///@arg decrease 減少する距離
///@arg delay 何フレーム遅れてから適応するか
///@desc 指定したオブジェクトの変数を揺らします。
function MakeShaker(_target,_var_name,distance=0,_speed=0,_random=false,decrease=1,_delay=0){
	var sh = instance_create_depth(0,0,0,shaker)
	with(sh) {
		target=_target;
		var_name=_var_name;
		shake_distance=distance;
		shake_speed=_speed;
		shake_random=_random;
		shake_decrease=decrease;
		delay=_delay;
	}
	return sh
}