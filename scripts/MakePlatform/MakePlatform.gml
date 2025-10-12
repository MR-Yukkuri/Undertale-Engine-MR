///@arg x
///@arg y
///@arg {real} width 幅
///@arg hspeed 横移動速度
///@arg vspeed 縦移動速度
///@arg angle 向き
///@arg sticky 粘着性があるか
///@arg auto_destroy 画面外に出たときに自動で削除されるか
///@arg follow ターゲットに追従するか
///@arg follow_target 追従するターゲット
///@desc 足場を作成します。
function MakePlatform(_x,_y,_width,_hspeed=0,_vspeed=0,_angle=0,_sticky=true,_auto_destroy=true,_follow=false,_follow_target=battle_board){
	var plat = instance_create_depth(_x,_y,0,battle_platform)
	plat.width = _width
	plat.sticky = _sticky
	plat.angle = _angle
	plat.auto_destroy = _auto_destroy
	plat.hspeed = _hspeed
	plat.vspeed = _vspeed
	plat.follow = _follow
	plat.follow_target = _follow_target
	return plat
}