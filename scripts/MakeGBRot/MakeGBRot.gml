///@arg x 中心x
///@arg y 中心y
///@arg len 中心からの距離
///@arg angle 初期位置
///@arg rot_duration 洗濯機が発生する時間 
///@arg xscale 横の大きさ
///@arg yscale 縦の大きさ
///@arg color 色
///@arg inv GB出現頻度
///@arg rot 回転速度
///@arg movetime 移動時間
///@arg pause 移動してから発射までの時間
///@arg duration ビームの残留時間
///@arg follow ターゲットに追従するか
///@arg follow_target 追従するターゲット
///@desc 洗濯機ブラスターを作成します。
function MakeGBRot(_x,_y,_len=180,_angle=0,_gb_dur=240,_xscale=2,_yscale=1,_color=COLOR.WHITE,_inv=5,_spd=12,_time_move=40,_pause=20,_duration=20,_follow=false,_follow_target=battle_board){
	var gb = instance_create_depth(_x,_y,0,battle_gb_rot)
	with(gb) {
		movetime = _time_move
		pause = _pause
		duration = _duration
		inv = _inv
		len = _len
		angle = _angle
		spd = _spd
		xscale = _xscale
		yscale = _yscale
		color = _color
		follow = _follow
		follow_target = _follow_target
		rot_dur = _gb_dur
	}
	return gb
}