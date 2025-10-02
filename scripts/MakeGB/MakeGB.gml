///@arg x 移動前のx
///@arg y 移動前のy
///@arg {real} x_target 移動後のx 
///@arg {real} y_target 移動後のy
///@arg {real} angle 移動前の向き
///@arg {real} angle_target 移動後の向き
///@arg xscale 横の大きさ
///@arg yscale 縦の大きさ
///@arg color 色
///@arg movetime 移動時間
///@arg pause 移動してから発射までの時間
///@arg duration ビームの残留時間
///@arg fade フェードインするか
///@arg follow ターゲットに追従するか
///@arg follow_target 追従するターゲット
///@desc ガスターブラスターを作成します。
function MakeGB(x,y,x_target,y_target,angle,angle_target,_xscale=2,_yscale=2,_color=COLOR.WHITE,time_move=40,_pause=20,_duration=35,_fade=false,_follow=false,_follow_target=battle_board) {
	var gb = instance_create_depth(x,y,0,battle_bullet_gb)
	if _follow {
		Anim_Create(gb,"follow_x",3,1,x,x_target-x,time_move)
		Anim_Create(gb,"follow_y",3,1,y,y_target-y,time_move)
		Anim_Create(gb,"follow_angle",3,1,angle,angle_target-angle,time_move)
	}
	else {
		Anim_Create(gb,"x",3,1,x,x_target-x,time_move)
		Anim_Create(gb,"y",3,1,y,y_target-y,time_move)
		Anim_Create(gb,"image_angle",3,1,angle,angle_target-angle,time_move)
	}
	if _fade {
		gb.image_alpha = 0
		Anim_Create(gb,"image_alpha",3,1,0,1,time_move)
	}
	gb.pause = _pause
	gb.movetime = time_move
	gb.duration = _duration
	gb.color = _color
	gb.follow = _follow
	gb._follow_target = _follow_target
	gb.image_xscale = _xscale
	gb.image_yscale = _yscale
	if _follow
		RotateBullet(gb)
	return gb
}