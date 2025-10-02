///@arg x
///@arg y
///@arg {real} width 幅
///@arg hspeed 横移動速度
///@arg vspeed 縦移動速度
///@arg angle 向き
///@arg sticky 粘着性があるか
///@desc 足場を作成します。
function MakePlatform(_x,_y,_width,_hspeed=0,_vspeed=0,_angle=0,_sticky=true,_auto_destroy=true){
	var plat = instance_create_depth(_x,_y,0,battle_platform)
	plat.width = _width
	plat.sticky = _sticky
	plat.angle = _angle
	plat.auto_destroy = _auto_destroy
	plat.hspeed = _hspeed
	plat.vspeed = _vspeed
	return plat
}