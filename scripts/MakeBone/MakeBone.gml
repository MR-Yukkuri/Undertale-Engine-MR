///@arg x
///@arg y
///@arg {real} length 長さ
///@arg angle 向き
///@arg hspeed 横移動速度
///@arg vspeed 縦移動速度
///@arg rot 回転速度
///@arg color 色
///@arg out 枠外に描画するか
///@arg head_type 対応した頭が消える(0:消えない/1:左/2:右)
///@arg origin 中心位置(0:中心/1:左端/2:右端)
///@arg len 回転の中心からズレる距離
///@arg auto_destroy 画面外で自動で消えるか
///@arg duration 消えるまでの時間
///@arg sin_size 長さの振れ幅
///@arg sin_speed 長さが変化する速度
///@arg use_cos cosを使うか
///@arg sin_offset 長さの初期位置
///@arg follow ターゲットに追従するか
///@arg follow_target 追従するターゲット
///@desc サンズの骨を作成する。
function MakeBone(_x,_y,_length,_angle=0,_hspeed=0,_vspeed=0,_rot=0,_color=COLOR.WHITE,_out=false,_head_type=0,_origin=0,_len=0,_auto_destroy=true,_duration=-1,_sin_size=0,_sin_speed=0.1,_use_cos=false,sin_offset=0,_follow=false,_follow_target=battle_board){
	var bone = instance_create_depth(_x,_y,0,battle_bullet_bone)
	bone.depth = _out ? DEPTH_BATTLE.BULLET_OUTSIDE_LOW : DEPTH_BATTLE.BULLET
	bone.alarm[0] = _duration
	bone.length = _length
	bone.hspeed = _hspeed
	bone.vspeed = _vspeed
	bone.color = _color
	bone.image_angle = _angle
	bone.out = _out
	bone.head_type = _head_type
	bone.origin = _origin
	bone.rotate = _rot
	bone.len = _len
	bone.follow = _follow
	bone.follow_target = _follow_target
	bone.siner = _sin_speed
	bone.sinsize = _sin_size
	bone.use_cos = _use_cos
	bone.auto_destroy = _auto_destroy
	bone.stime = sin_offset
	if _follow 
		RotateBullet(bone)
	return bone
}
